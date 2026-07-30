Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8443AC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UELQc9w8LCzzjxYarbpAJ9nz5UK+I9ucKQ5zTVatiM=; b=iLyrTMhf+WaJUOb9jNC7M0vA6j
	L+XfvKSM3ZfFiGplSo5WmJNVsqBVVwnoyuXGpqhoPZ1efGZKZy9T+YlWumpehb9QvRufIESnEVmgj
	64oY0yQkvCxLxrgPSfaNiUrYdGsFtz2W+tLAxA8txZEtj4Vg49H2NqfSVOkpKldFmN8ejYJp07f7f
	/aLtKOOscFhUIycSOR2/3EtCt1arGNTE1zxt0Brl3y2uEwZ0e7yaobK6cyllbBIeHiN6fDKEpD5wT
	SdoG5PCy0c01184qPEqnkbRas5c4Oh+Dp4kcVoLvTjJmVI1ka2DCWK4zT/tqwd3KfDUnWmNrlqAF6
	xCjBSkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTFv-0000000AwC2-4Ah4;
	Thu, 30 Jul 2026 16:05:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTFl-0000000Aw66-0i6M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:05:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQrCu2401631
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UELQc9w8LCzzjxYarbpAJ9nz5UK+I9ucKQ5zTVatiM=; b=glkT3Zu0udYthktq
	uif3L3Z1Sw4AagvP5V/vdQcnBSDJprLWJR+cHZPBtz1+8SBzGGJW8F+EgcLD7Ver
	jrkcxUM9vqAwv5/PmO4FQgNw+eL/aA+j/bQp2obub37lkSeolEpaKi3RAENUuWTA
	qRQop5KTdsw4u3ibSi6+t4CjxkOOBSfhQLZlePyXjwhCmTiet5/bLV1bRq33C83I
	m61B1CccBPEdyHvW2zymcYZeEYQPudP+xmw2nTDBX/+hjuRT8BOlSMPsSm8lCRqZ
	3URtdM4XN3O+QnwIAom9VjXI0iDz8mKYSisFazpz1fH/DnsqR3OLYH7CiqN0qaYS
	jmQohQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168pjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so26019411cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427499; x=1786032299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UELQc9w8LCzzjxYarbpAJ9nz5UK+I9ucKQ5zTVatiM=;
        b=CQk2oDUEX11buJKF2bS8KirCoe60lc1qM4hxBxqhO4bbrUufuplxbDlS0/FyenYdJ4
         5/Oaj4uAwl+mmfScn8Dwq8Zy1xzluk45sI+AQeUZxo0yB+kqnAFX60W0Pp9UucMW0eso
         vT0UYjtvOgWqzeTHIeofG5AC+9wge6iHdmUIgXAXioS0yzsEPDgYij0K9Lxuug8woPPj
         8vbO0riLFP43SDBWT0OfAfZPh1GhLd2GzWX8mD7zpFfiRvIhjlCdpfJ+CiSZB7CwTB/q
         jVQzwCX5q/yD8zPMCKQ5JWMB56bZHdjwnyiwWNlb8nJKgUWeI3hAwuK1ZjkTTqj+P/WU
         DnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427499; x=1786032299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UELQc9w8LCzzjxYarbpAJ9nz5UK+I9ucKQ5zTVatiM=;
        b=gISXSTUwB3eJ0qZLikNRhK/zUDtNB4VkiefjAw+GgGVcemjbCVJ9j9hTPi4FwQb28Q
         1adxjtosYbNG00DFeUFFXZmQxY5qswy1uZy0yYsCftDtgWSQUS8O6V7gjrCMu9uuyoQ4
         l1vs9eCqKM/MnslLfQN7srzr/PpuMXO6Rq1LX/9RvS7keXR2QrtB/hGMAsah55opG/Y7
         7GCJWalCQ2ZbPHLF0/gAuq1g+CYSOIC3VZFBm74627aB4PS1TRe8o6Y7cu5eYi5QMDjC
         uudnPflFTI1PyaWabHBVHcM2smChuvvJTG/UU2mAz8dWMvNeI1mMr/Sj6Z8U98smVLL0
         tIrg==
X-Forwarded-Encrypted: i=1; AHgh+RoiN7xu0vP+IYkfD7Z1q1o9bGhHMgfwAvp5IXHeYp6JCDBR9AcGP+RyMDKnH8MHTOH7QXrp3mY/4oFrWg7hrseC@lists.infradead.org
X-Gm-Message-State: AOJu0YxT+klEqaBm7QlEszGb824T4txOnP93FuJYs/UWBUoMOVa0qlzv
	PXx6W0XpQb4EDFD4mqPeAONyoXxUE8lSwUk2m6ehgCYuOezoyx/+0I3JBtzYUaZ9znKWoItbNHQ
	5IMM+SbnlcBaDT0+X6ccsXT7ZMG1xDmeulFOyBnsJE4JffpSq07ONJivFqc5DAbJ8cd/biiqHHy
	xyRw==
X-Gm-Gg: AR+sD11IcBudQeeoGv1a9eHiT0vmDHrySl5UKfocYQWulcMaLwFzC9iFJB4NJlgjBVn
	bSJ7sh/pS94DzdZqUdZeij9dALXgFSyDN5Ws6RZJ+XTctbAYjwXWy+yOlpzXxXjvOKPmN2wwjR8
	ZOtZzCKNI2slvJ05H+ZvXorZUOaVtgqjVm50OnxsmzHSenHYUjjSbutpMUAI9jeqT2xVH6SXrxD
	DDBjCIhsQImN7TsQr+fxoa+Fppcwlnqj5oOd+5Wo+ktD9aTdmqPKd0/UPc3/n1NCdH6vmd0HjAt
	gyi/7FP6p1SXj/xG4+cwRX5mH+QfZpAPsYSdaQqyyXZ0Jkdpy1VsYpu3+UrfR6s5M1ca/DQZbRU
	xhlfwCvbPe948L/lS1hOzSLnVc5GWPcKXCVstJKpgJEeUuDT/zFUc/0s1GbqijVsAmogN0E1U91
	m4Umi3+xFFAhUk7Q==
X-Received: by 2002:a05:622a:230d:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b385fd29fmr35355351cf.6.1785427499451;
        Thu, 30 Jul 2026 09:04:59 -0700 (PDT)
X-Received: by 2002:a05:622a:230d:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b385fd29fmr35354661cf.6.1785427498920;
        Thu, 30 Jul 2026 09:04:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db8a3bbbsm455174e87.0.2026.07.30.09.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:54 +0300
Subject: [PATCH v2 1/3] iommu/msm: track a context master per device and
 IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v2-1-18e0daf2d836@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6092;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=guIutXCKMCgx6tORPQOqWmA7vPORsOE/TVjA3vw9Q+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa3Yn4kLhQsAPOamQT6NCi7uPbs+IAU2y/t5LQ
 qsyvGkAc2mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamt2JwAKCRCLPIo+Aiko
 1Z/uB/9vT5qu9uIJIIMy7XHgHWLW37RCZ2CoK4tJ5Bdp3Hjqtz5Gry7EuPZUYOX7/rbSdPAflmt
 GgX2KmJaq0KQxkBzUVcfMhdKrG1biJhQqEObfPqk66yXWdNbxCUetfcvJ9FIkNhWY3AUz+KH4sV
 PcaX0Fd+4Sh7r+zRA411KE3gkAljn7kRJP96LDJpmTbHmxAEO5bV9TjZkzk2nsRZEI/ffWPHlgO
 bJXSjJcH6PnTI2rRQGtFkdsa8LDaR9sU4U7LNV7TICEdHL/LKS6/Yep/9CtXM3PLRRV5Bl6RLCc
 S0Cyzn/jdNMB3rX7GKRPZANXNB+4wcPzFmonhmDIH8JG18vf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX5iDxK4rrJfHJ
 OfDb/51kUX6xkUdy1FBvbZVCRkj2lvewibBWTY+pi/qtW0XQKb2h14eO1taJmFn0YshRUbNCX9I
 7LD5VW6lp0brB3biMiJHZh3o45H/dGLHGucNtpeMxAxiTwv5EMrssPkWSJaVQN0WD26c2k9LPsx
 kgJJicV93tCTmTw7WtPrOXRR5/CLugbX7A97Yxdd+iyOGdwcWcQ3HmGvwosVjd9jRh3sCySiYzV
 S2rEuhzGuQ287HOhdAM2Y3Pla46/hAWXrPnkJgjhWoPVwLU0BsOyWvwQ6wvXAR+40zSk+KwyXbs
 RVvKzYrrUAufFvSe3KcOukMWKu8Qdm6RV7F2r4JxNKUk3Vt9pDrWHg3oS9s2TVMVr201Ktz6B0P
 VUM4aDl4XVHe+nQAzfhkS9ANtfjNiNzyFzekWBH6poRiUAVjFAMSWvjkFWTF+60tpdiuOqL+5pd
 r2WYSUv4EOdySJ/GlVg==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b762c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=NB2GtN1_7RWpjchEhWAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: j_zlof_eXTbUTv8jvQ2NPJIfBX4PUWTZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX9hLcx0d8w8xN
 vpCkSiCdWydtF2ZnPKbNqBD614BmRzaOd5zCyg+UavgVpfpIdlm5M2z6Kx2q7ZNenWQJh7nNSCI
 W06z8sacxR7BgMWee9wsZpmQaDAqUDY=
X-Proofpoint-GUID: j_zlof_eXTbUTv8jvQ2NPJIfBX4PUWTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090501_254752_5839E0D9 
X-CRM114-Status: GOOD (  26.75  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

insert_iommu_master() decided whether to allocate a struct
msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
caching the result in dev_iommu_priv, then unconditionally dereferenced
the master:

	master = dev_iommu_priv_get(dev);
	if (list_empty(&(*iommu)->ctx_list)) {
		master = kzalloc_obj(...);
		...
	}
	for (sid = 0; sid < master->num_mids; sid++)

Neither key is right. A master describes one device on one IOMMU
instance: the attach and lookup paths find a device on an IOMMU by
walking that IOMMU's ctx_list for a master whose of_node matches. The
ctx_list emptiness test is per-IOMMU, and the dev_iommu_priv cache is
per-device, so the two disagree as soon as one device spans several
IOMMUs. On apq8064 the GPU uses &gfx3d and &gfx3d1 and the display
controller uses &mdp_port0 and &mdp_port1, each instance carrying the
same stream IDs.

The per-device cache also turns into a NULL dereference. When the first
of a device's IOMMUs registers, iommu_device_register() walks the bus and
drives ->of_xlate(), which links a master onto that IOMMU's ctx_list. The
device cannot finish probing because its second IOMMU is not registered
yet (-EPROBE_DEFER); that tears down dev->iommu and drops the cached
master, but the master stays linked on the first IOMMU's ctx_list. Once
the second IOMMU registers, its bus walk replays of_iommu_configure() for
all of the device's entries, so ->of_xlate() runs again for the first
IOMMU: dev_iommu_priv is NULL while ctx_list is not empty, allocation is
skipped and master->num_mids dereferences NULL:

  qcom_iommu_of_xlate from of_iommu_xlate
  of_iommu_xlate from of_iommu_configure
  of_iommu_configure from platform_dma_configure
  platform_dma_configure from __iommu_probe_device
  __iommu_probe_device from probe_iommu_group
  probe_iommu_group from bus_for_each_dev
  bus_for_each_dev from iommu_device_register
  iommu_device_register from msm_iommu_probe

The faulty guard has been there since the driver gained generic master
bindings, but it stayed dormant for years because a device's ->of_xlate()
only ran once all of its IOMMUs were present. It became reachable when
iommu_fwspec_init() started deferring per instance on the ->ready flag,
which is what lets a master be stranded on the first IOMMU and then have
->of_xlate() replayed with dev_iommu_priv already reset. Hence the two
Fixes below: the first introduced the guard, the second made it fatal.

Look the master up in the target IOMMU's ctx_list instead, allocating one
only when that IOMMU has none for the device yet. Each instance now keeps
its own master and gets programmed with the full set of stream IDs.

That replay also means a master outlives the attempt that built it, so
the stream IDs it already holds have to be dropped before the next
attempt collects them again, or every ID is seen twice and the whole set
is reported as repeated. dev_iommu_priv is now free, and it is allocated
and cleared together with dev->iommu, so use it to recognise the first
->of_xlate() of an attempt and reset the device's masters there.

Fixes: f78ebca8ff3d ("iommu/msm: Add support for generic master bindings")
Fixes: da33e87bd2bf ("iommu: Handle yet another race around registration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/iommu/msm_iommu.c | 49 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431d5b..109688d69e50 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -597,24 +597,51 @@ static void print_ctx_regs(void __iomem *base, int ctx)
 	       GET_SCTLR(base, ctx), GET_ACTLR(base, ctx));
 }
 
+/*
+ * ->of_xlate() is replayed from scratch every time the client device's probe
+ * is retried, so the stream IDs gathered by the previous attempt have to be
+ * dropped before the new set is collected. dev_iommu_priv lives in dev->iommu,
+ * which the IOMMU core frees whenever an attempt fails, so a NULL value marks
+ * the first ->of_xlate() call of a pass. The device itself is stored as the
+ * marker, its value is never used.
+ */
+static void start_of_xlate_pass(struct device *dev)
+{
+	struct msm_iommu_dev *iommu;
+	struct msm_iommu_ctx_dev *master;
+
+	if (dev_iommu_priv_get(dev))
+		return;
+
+	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node)
+		list_for_each_entry(master, &iommu->ctx_list, list)
+			if (master->of_node == dev->of_node)
+				master->num_mids = 0;
+
+	dev_iommu_priv_set(dev, dev);
+}
+
 static int insert_iommu_master(struct device *dev,
 				struct msm_iommu_dev **iommu,
 				const struct of_phandle_args *spec)
 {
-	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
+	struct msm_iommu_ctx_dev *master;
 	int sid;
 
-	if (list_empty(&(*iommu)->ctx_list)) {
-		master = kzalloc_obj(*master, GFP_ATOMIC);
-		if (!master) {
-			dev_err(dev, "Failed to allocate iommu_master\n");
-			return -ENOMEM;
-		}
-		master->of_node = dev->of_node;
-		list_add(&master->list, &(*iommu)->ctx_list);
-		dev_iommu_priv_set(dev, master);
+	/* A master describes one device on one IOMMU instance. */
+	list_for_each_entry(master, &(*iommu)->ctx_list, list)
+		if (master->of_node == dev->of_node)
+			goto add_sid;
+
+	master = kzalloc_obj(*master, GFP_ATOMIC);
+	if (!master) {
+		dev_err(dev, "Failed to allocate iommu_master\n");
+		return -ENOMEM;
 	}
+	master->of_node = dev->of_node;
+	list_add(&master->list, &(*iommu)->ctx_list);
 
+add_sid:
 	for (sid = 0; sid < master->num_mids; sid++)
 		if (master->mids[sid] == spec->args[0]) {
 			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
@@ -646,6 +673,8 @@ static int qcom_iommu_of_xlate(struct device *dev,
 		goto fail;
 	}
 
+	start_of_xlate_pass(dev);
+
 	ret = insert_iommu_master(dev, &iommu, spec);
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);

-- 
2.47.3


