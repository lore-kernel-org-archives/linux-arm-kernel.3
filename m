Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E969DC5516C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=; b=srMOQanpWcoxr3FRls/fF5XUGM
	4adNSs7VqdEdbCrmGiJL0p+jjNikkkxzVyeApLkaOvJwfftgKqf/r83fSVk3Wv+npEV96fV6e/IlD
	RoL+EERkfdvj5SKB+GXFQjYDjxf1ySlSxotAivHBC9t32jXuR+Wqah35A3X/H07buGyJQQbdY+ti1
	LpmTMV7h9CYypqH/vNTMu62yFWxYY3SLF0Cvnqg2aNxdD50ITh65v29ZhjVIXLy1So6CMYmaaq7zk
	W1Hpsd0Y09z92kOCtRtoIS1oNlq+F9acWypyhIB3zK0WGefPa+Hjsl/Vn3bUdTdWF0eVWa/vvasvf
	ia3IIMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQpZ-0000000AbM4-17sr;
	Thu, 30 Jul 2026 13:29:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQpO-0000000AbFk-14KY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:29:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDRK2427145
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=; b=I4XhQVO/0yt5Fapx
	y6FEqK1dFBP3zbhxBiDkxGJ+C86CPlnylu5yZpbMk09f/jeabXeWZnzgB6oxSduH
	QIvOMw5QSaEsjyKRdn3wVA2y9EwGV8/kZ3gSaoSKcBGwsMsVB7iaOICypJisskg+
	6bqFzp6RodZFV6mi5oB6yyZ7SYGZEaW252Lq+EgDITMdvY8fyDgBZot20bvwYimW
	HsFzkYEyqqgywiO3Wrw3JYm+NFAxUP5T3pdMTBe7ZoHXub2loyr1piOunOkfO1fA
	ynFnggbqS6rc6c7UF0HuUANmhUCqXMLdv4qrFUMv0j1tSWYV6W3kfpx4bWH5pR3K
	cNLtRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tyh1h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:29:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so18243461cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418177; x=1786022977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=;
        b=jsk3oV18GtYi7L3kRJti1frZnvyedrd2Qlo027hy7wKYE51x2KzldBt8SQTYLdrmTf
         h9cQ0cOU+3UwuOiezzKMx/goRtgiTETZFZM/nRci+5YagYEQzN6V+3399otKirywf3x+
         wC99JwLEfUMMFyVZ1EZkJAxhFrgfDCj6QMv3YlykHFDtDEbjemJCXxGru1S5ZOmJKihk
         6NaMf5YnxtqEkGHFQFi4fLB8qXytwCT2TNO7BdODPL4AZFW+OKQVLSiWJb/Uda1sKx+6
         L/33Kcu+vMGIB5qGT1PgkMTkqw0aJc+d4kY8YKbcT70C12BTy5OuCHZwk1FFHvv6hLyN
         K5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418177; x=1786022977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=;
        b=MCsNtwbxLGFYPPFH2U3f2kWj4Q1daNAZlv3AshQGBsBIqC/PQ24ZlL5MgJqoopv3SX
         GusC8t8BCZ1P3Q4LgInvlQ3BIrDIno8sfDr9BPT8NrR5KFER7fiyiART4+TWeMIMkV/p
         eW5iQmIKDEPXua/KxcXVTIm2CVgmYXwFX7AVeNITiRv5aShMWlIE0mLFOZvuOfpTfegQ
         Hvif+fi6Eoml8RbXzyAdETJe6VGfQPnE0x1AAdhpIwQd/qMjq+X0WQQqnwQHa6cIYSUu
         aWOGzcqlRYJJEtEi6CmqKhhE+LEKovq/KW7vUZWLKmwLxsBZCo9pNJuaL4eR91tTF+XJ
         08EQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlaFmOPSK3WkADHQM9pm8kLNMLYeA1+KWRDAhTn/AAuYx9J/wak8ZuBMEysFL8jJiZq9rV2J3RG53Meb7mLx/h@lists.infradead.org
X-Gm-Message-State: AOJu0YwB2YAAs9BTxMoeNWs0/UMewK1CEqn9VxmBI4E93my3EyKu4t/U
	4WTmjCZxSZdSg+ijs6J+qpNxyFmg3lURbu0JaKxwmxszCn5gat5Ri0nnAETAohSw9o3/71jgwoh
	O4N0tv72aFEXqStCJuRAQbSH1IZLznvsvf6sdKGO+q3Y4hM/shaSx4AxmB1C5n1CNN64ABLh0gR
	NM+Q==
X-Gm-Gg: AR+sD12ZHZ05C+Gqjb3MR6yyfy1JnzKiWUzdKL1nmKYOIxyRKQeTW2t1iZDfFJ31dqI
	U9X81Pp/Mj2tTJpkZFwYawUKi6x/oKZ9rbRDgzdG6SCAagZzssE7BUJacN+SMv+PBJ4KFcd6f1b
	UmMAN9xQrJ28jPddIjnVJZxyqDoYJO/3HOuHpJvA4arap/HoYSSzU0T2B1HMlS3Jv61uf5XC17I
	E/3VoA8Pozwu95RBvJHsMoo9u9r2qDwALx9LgEyL0pIvCuELygvc9SEeqpKz1TLy/fet01fT1uf
	IumVffYLBDmNxVq9dEJMotlCn+2hEuC7AZYtEIU6rW66Qdrcr5zAYZOJivM20jbw0tWZyOcgaAS
	UVpNI5a2sL4MCBw1lzo876kwINEGcYR6sP3uZnn6l08coJ50V7eKeZbhqGAE6TJ6Ir5j/RtPYkL
	do/dG9Mic1dHWX8Q==
X-Received: by 2002:ac8:598e:0:b0:528:3ae6:14a0 with SMTP id d75a77b69052e-52b42c461ccmr2050771cf.46.1785418176679;
        Thu, 30 Jul 2026 06:29:36 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:528:3ae6:14a0 with SMTP id d75a77b69052e-52b42c461ccmr2050201cf.46.1785418176070;
        Thu, 30 Jul 2026 06:29:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:29:31 +0300
Subject: [PATCH 1/3] iommu/msm: track a context master per device and IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HDvKxpINpBdyUinpnTD4Zel+FLNhUAi/UNzRGhoHMSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa1G8k9/g5eNcbQTp950ENXclQTiusv0LgYSR2
 XAet/hi4xKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtRvAAKCRCLPIo+Aiko
 1VpfB/9FYILN4yvdF3Vwn4jVt5QhJoVPIwN0sjpqfAnTByi95EeWKKE5S87ktT0abAPbZ2UOVT/
 Z2k/Ru/yCM7HCPUm42G7XLGJIRiJ+TGSojMsfCIu4vAVXgWqO5jyv62CSaMCw8zNuuJz10C6wuK
 OVh7YrahohCLi3+ZsXvJELj0N092LIAY5idouHvL0w9oX3x279RmxMw2C2MB7OuOzowOu1ZGydf
 ZYTyz45hsbQf9YS8JQq8u8gpJJPEltmaIL+9mTTsqPdRhRw4uUqApovyaLGZxXxYnw4iKFVsZFl
 vjxJXlzNI9fWzWdu6RJh4IxnKnbjlisUbM4Iky6LJp3ctWbl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UiISDRBUwFmNEfzfykxtGaHs98k9OKpv
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b51c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wn2kx61HezQC-XnySuMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX0GM9KE7jAVcm
 2j0bObUgtuC5nk2/NFWRHlxWxYBr5Oj1F4JEpbdNkcoyreD64z+KOfEaj6+GXUIj1goaYf1xq8H
 A0AbhlABOm6zVJxn0nmwqxpFdOBpNnig7ffxeBQZvOBHuD0RgIyV/SDuA16zqAOkqbLWBLntFFD
 Qrc7tOK9uowFGUCsUHO2/FVKIRd+0khQA75fozFFHHGo7G7MB26QISQ7EWABYGV2xfR/yolFdrP
 5mqUtsVFMHHy46lLH0Jn/Eq+z3sx8Iha5kUwnYwel+8tMkj7ED6JrWSO2mXYNrBVZUyIzMXtvL7
 iLme8qO6zR5AhKpjGe3fyloxhPDBUvbHxm48Ng+SFtW/vB/5sq57ofkW0iAT6zcYj/jC2NLbM0l
 kYg2yF5nY5gw1G/E2mKV8sR3am0zM8L3n0ygehedMcpXgM8V8JSbNbLjVJvApbUHt/3Zp1Jvnts
 yLbEMvrNQxGgWZ8B47Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX+TN/FVqctcnl
 tSNUiCj4I2eEYl3Bgr3++nDOMVcr6WelWxONnTHh6JW9XmkaJHH8jCmu7+G3LyFJtkuXY7Agj2y
 /TJRhNTNYaaqQF0Nv5RSpo2irGZAwq4=
X-Proofpoint-ORIG-GUID: UiISDRBUwFmNEfzfykxtGaHs98k9OKpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_062938_761659_6A1C1992 
X-CRM114-Status: GOOD (  22.69  )
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
its own master and gets programmed with the full set of stream IDs. A
stream ID seen twice is an expected consequence of the replay described
above and is already ignored, so demote that message to dev_dbg().

Fixes: f78ebca8ff3d ("iommu/msm: Add support for generic master bindings")
Fixes: da33e87bd2bf ("iommu: Handle yet another race around registration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/iommu/msm_iommu.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431d5b..3847f5f0059f 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -601,24 +601,27 @@ static int insert_iommu_master(struct device *dev,
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
-			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
-				 sid);
+			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
+				sid);
 			return 0;
 		}
 

-- 
2.47.3


