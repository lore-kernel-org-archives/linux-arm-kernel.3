Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D7CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkXMke12UEjoM6/6vnzxRCqBivpTnQvavoQXcM7wjoU=; b=s7DC/5ZNVOGd0lo6iZDtVkKr75
	VWnh8gGGE+jFAHSHZMbZgLc7ucNQr62MYZPUKTzdhWnCdLC7OtnGZhyWnRStVyKgTSWHZye1Lmp1+
	eh/BvsJq12GhVEkBeQBN0GOlZghnAbFpj3ZYXHqs6FDF0rIW8W0N3/GZYZy5WMsm+wo3+43NYcUUI
	96cyt5Rrp3NW/qz8xbeOaZ4vjvpYBB01+eGV+ZluyyvfW04qMh96PbkB+Rf5qUFN7s4qqB7PB5lmG
	PUWzuS2guQSsXm72HoWbajzO/UbS7IcWtLfpZCoU4JpHRZpwIhgNPSdjM+eODXkBrNuYNTWSG2+j9
	/fvrC0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4d-00000001gHd-3AAF;
	Fri, 17 Jul 2026 08:37:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4G-00000001fsZ-1Wuh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tkXMke12UEjoM6/6vnzxRCqBivpTnQvavoQXcM7wjoU=; b=YpAIaggMjjA0BBKzBhLaV/jXKc
	nMP9+xJbao7zoG4B2CUWlSw4NE6FlNjfL6t8YYZoS4nD6oovammhjXrl1rRE/v3RJZ/Zw2oaza59e
	Vu1N/0fxBtbUqeFo5RWgy1nL534D9Ma0X5nX6Y5TOeUjYwGT+Fg74y2gkaQVnchvbMLJKVofgqQjd
	pkLffgB8MvYV8wEA2aWrJ+FFcCJ4C4bSEOX0v5KFto2qTMq4Vf9DBprcU76Rmk3SzT3Qj6fuIIRA4
	lDggfcJjvWreBJ8oFEnLTxSQWRqemoL1KanabglrDf8Fo5qPkV0ex9ZXA//bcFvbOlqaYmbX8oocY
	1Ecyh6YQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wke4C-0000000Eg5n-2MT8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cI0G2098583
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkXMke12UEjoM6/6vnzxRCqBivpTnQvavoQXcM7wjoU=; b=hzEza9KlQufa+/Z5
	N8Dezs9EcWoYb7+X+uPboZt/nqyiBQgO8XCAw25Qa8Bt3EfMmr/W3o3s/WQTY+EH
	nCXgSCLTVspQLZ+3EU7QzNNeynhsuUIwh4NFJK/9bLKrUm4XDOXu4w2evdbHdofL
	2s8WqgG0P/2heR84VVK6moYc6ZQUgavdAaS8ELFmiWGu++duKSt58LD0bRo3kZ1s
	t9+5VSK87rbWf1qS69bkTXyXVlst2diLt70bOnKmW0Bv9eIo5P+F5tVGRcBfxrMM
	tH9UhTus6gNoJDEYcp9nIb3V0KQegR40hNix7PwOVn62SwXAWV447ce/cBG+Gq+i
	ldTSjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6ju3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso55473051cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277425; x=1784882225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkXMke12UEjoM6/6vnzxRCqBivpTnQvavoQXcM7wjoU=;
        b=ea4vJ+TpVumkIbcevHK9huCdYyypJHKBUL9JUulbkxpdaAjqzpbsoW2SP0lwstAuOk
         W77BGGblNzG3Rw15beWmXEeskRG8Fb/+AXqc9myYJCS5D8jHEOn+ZoouQ+aUHpzvqbAc
         GE7AFOR6l7UB7cJB++MdBe2BJUP9jK8zfpApNHBt4aC+7Mk33uHgSxJDg1v7xLyOeAAE
         Q8uQp6F16PybFWnAB9RAaa0GDo9RXNNRpoqg+yS4OIvpQ1KwrtubZjOI3IDsOOVcKaIp
         ZLDipow3PJQloHS42FCjiW8sXf88V5zVpJZeBW6vRS0OPDKXrqkw8CSBSJ1cxx3npQ+w
         HCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277425; x=1784882225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkXMke12UEjoM6/6vnzxRCqBivpTnQvavoQXcM7wjoU=;
        b=H+fgwreWkfd84ahNVmvWJungWqVGy+9g9o1IIP4VesTh6WIoUfDacI+Qx1ejL6jdKP
         uDBT3wpARypxHVxJvRBiU/oZ4JCEx3V1LtUuVYIV315YhFnuB1DlObxu5hAb52Iti76z
         m+op0yj11eHDMPleFgBE58NREKenh4gwQ9EZ2PSuqjKY7UB9zoOQJ9tcDogD+K95Oml9
         bnOiMUAKRZRpV+YqW37pdAzKehPsKGDC1DQZv00qOVRqV39Ej360Om0iWWgNBZ/ler/4
         kOU7IzOicJuxKa0YXRfYZ6S5hh/8rRA0d1IotnA+MMyR5LQ4mKa5fDVhlGsxUuLIarp7
         7Mbw==
X-Forwarded-Encrypted: i=1; AHgh+RrJgKoArLrCYH+mBOAp8OMPdjKzSNPfRzc5+6MJ2GmNSkpwPwZmw9YepjaBCJO1ncMo9/NbPbDs/EwD+aPpAH86@lists.infradead.org
X-Gm-Message-State: AOJu0YxXTvCgNbldqHf9jUZT0hrJMu5o9rP6t36yGWHRqyWoO1p6UcD/
	xjkYyPCEVvVRDoN74g/U41ExYGtk8k0WVmQxmguSa8SZNj/6QUL0xSck7JN+0A8+dc3xBwlxXZ+
	k8VNv+AXEo6G0nvgxpK815F7XEbhl3+7vY71jqx+ZO9s/gfNg3pYcXfUz4G4HIyCllza2xOb6sc
	OQbA==
X-Gm-Gg: AfdE7clAJcrAPf3wF5HzYkzHSUol1dk5HLDHAC88qFSwylXdxstvIqC9g/tDZ1fqvOX
	fX7w4wA1yK4tl0AdiDzVuGilr4rOgie7fioTYkHxrpZMC4fn0x6ct8tEIIzQnhfvstKviw91Czt
	W8oOJB8HheQJpNH9rFXUuq27lYKyFWCQ+rQgJqWb4wXVJ2cjHIJS1f+qti3Dne0WIAVlAEJYiZB
	7k2MpBodHnoacGgkuNJ20t7yYBNebvabKWfzaYKFiFQlyHBuN6u+n4dSVYjZ418oprNrfmjzVZT
	oOL+6iaWQkXVfx3WCzJD3ZRB0UeXnpLLwtgcAD30ybej6NbYIJQ0HBYMMMvi1MS5Kx/Ab5Nr7U2
	QZ0WzA3YFRW3onpg/HAwJuUOxkcOf4A==
X-Received: by 2002:ac8:5d50:0:b0:51c:7b12:6009 with SMTP id d75a77b69052e-5213e77dc65mr12829081cf.85.1784277425069;
        Fri, 17 Jul 2026 01:37:05 -0700 (PDT)
X-Received: by 2002:ac8:5d50:0:b0:51c:7b12:6009 with SMTP id d75a77b69052e-5213e77dc65mr12828841cf.85.1784277424577;
        Fri, 17 Jul 2026 01:37:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:32 +0200
Subject: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-6-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11752;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1J+vF7UXOUyhfbt9ie88vbPerIhpQsXc5X3PZY2nmf0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemb4E6abOxAGf1dmDqXtfvXaAXkyocqX4Mld
 f0yGDiyEtmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpmwAKCRAFnS7L/zaE
 w1t0EACp9JoKJdfnEnwMg9m8R0RSIum9CmjipJHXJOTYu3y9Bs4n6GeUa+bXOuCnqDjcSVTD+Y9
 pORTR4bhKPNmOo0V4VqJ00/uF65p/yz4ucVrHMw6uOaUFd5viHyrYKYA+DMQ4mHYAAqjtSOm++i
 tkmel84fsUGMIBqLGCQW0jErqudEYVPY/sGe91OogtVYebH5k3/Z1TeTm4+TpCcyyXTiJd83d6O
 URo1Sq+dJD5zvvf63qr4RKJnVQzyZqTcFDUutYgj+29rv1KZmK9qSIEUHywL5Hbrv77mzPoDHu9
 geXN9lvxsv/sITjjnQSrXvZMIqXEiqLWAi3F3rrpRp7G/WcmuxYKMVvvtSHUy7mrmNYZn2Iunpe
 v6rl6waScUhMeoGZQDqmVOkMJuTIOZl++24a7oVUHPGQ9mf96LkewiSZJjCMf7p5ThBZ4SxdTaJ
 mYnMasdSn3Bd8sNW6AXSpb2WPsA2zlcTDsA9p75GO3dx6wuXKjIJIL77VLOniWxVyhKxJdR9vpI
 aocgn7Z0w817tnKzULd7VrJTX5OtyGLuw5x5qybqE4r7AG2Gj3LjPvLvhht64cNWYmYxowe44/d
 nbhRFnuYcJhJ0ykPfvzdmFXjMVKExYK1XALtoLZlxoMdi5z2yayYunmRvW2eG9p8O3eupaohGcz
 CyFfkPmNJeCiO2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXzwA3bb9GABer
 2mFmdz/Th1q1LmRpv0po7XcT3cFxvDusbXf33TLaCp1O0BDTKEeHEcwVju3I0PD4jyXgRlSbmzR
 UNxkae8/345vJLUMY/NBlL74E9dy/RBGmIj9plU1DyuOPErCKC1UBBhAHEydErM36YAK+wR6Jme
 E3TOiUPEskjo7qf5/kZ7xoEVyuYriiP454JiT3y6haDmqSliHpIUICo2KJqOEyzXSyYzTKHsTcr
 buj4eTB87xVcVnRDDfXa5SsEx8WaOMcLCnfmAAprNqYBW7BMqlKz9HeesgcFd1sIUm/cB614LXY
 OBJEBz+qBmam8vuQa77u0iBGtEaKJaAmvSqsSxRX7jT21GXrei52d8MLz6KuT2jHNc/PbtkcGla
 VxmiGeGA7bhUUoJOn42WeaRKxAXY8wM4Xd8rlbr6bjduixyo0Nrub5j2quqk/yNmxg3KLeyKoQs
 Kgb2y8twXd9ktTZCx1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXwe+U0JFJfJXl
 TxdD0bPGUtZKr5IA4F7hlHpwtqi8xb5xC3+dqy0yyhJ/TZlYbKCu0Qbs8c9Z4oEIRSfiL45Tphk
 dqvy0K4Vq+IF5hFPrIuotkxqhy5TJuQ=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59e9b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0mtKZB-VTZit_Rp23UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 21Z6-RSfPOj56SS9iHnpdtq9qmJFhlT-
X-Proofpoint-ORIG-GUID: 21Z6-RSfPOj56SS9iHnpdtq9qmJFhlT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093709_602664_1679E0EE 
X-CRM114-Status: GOOD (  25.74  )
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

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 169 +++++++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom_bam_dma.h |  13 +++
 2 files changed, 176 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f3e713a5259c2c7c24cfdcec094814eb1202971a..edaa694eb9df06043c0a4294561c8ad594103e3f 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,11 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	bool is_lock_desc;
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -425,6 +434,11 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t lock_scratchpad_addr;
+	enum dma_transfer_direction direction;
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -638,8 +652,10 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
-	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
 		bam_reset_channel(bchan);
+		bchan->bam_locked = false;
+	}
 
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
@@ -676,13 +692,24 @@ static void bam_free_chan(struct dma_chan *chan)
 static int bam_slave_config(struct dma_chan *chan,
 			    struct dma_slave_config *cfg)
 {
+	struct bam_config *peripheral_cfg = cfg->peripheral_config;
 	struct bam_chan *bchan = to_bam_chan(chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
 
 	guard(spinlock_irqsave)(&bchan->vc.lock);
 
 	memcpy(&bchan->slave, cfg, sizeof(*cfg));
 	bchan->reconfigure = 1;
 
+	/*
+	 * This is required to setup the pipe locking and must be done even
+	 * before the first call to bam_start_dma().
+	 */
+	if (bdata->pipe_lock_supported && peripheral_cfg) {
+		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
+		bchan->direction = cfg->direction;
+	}
+
 	return 0;
 }
 
@@ -802,6 +829,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 		}
 
 		vchan_get_all_descriptors(&bchan->vc, &head);
+		bchan->bam_locked = false;
 	}
 
 	vchan_dma_desc_free_list(&bchan->vc, &head);
@@ -859,6 +887,15 @@ static int bam_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
+{
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+
+	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	kfree(async_desc);
+}
+
 /**
  * process_channel_irqs - processes the channel interrupts
  * @bdev: bam controller
@@ -870,6 +907,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 {
 	u32 i, srcs, pipe_stts, offset, avail;
 	struct bam_async_desc *async_desc, *tmp;
+	struct bam_desc_hw *hdesc;
 
 	srcs = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
 
@@ -919,13 +957,19 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			 * push back to front of desc_issued so that
 			 * it gets restarted by the work queue.
 			 */
+
+			list_del(&async_desc->desc_node);
 			if (!async_desc->num_desc) {
-				vchan_cookie_complete(&async_desc->vd);
+				hdesc = async_desc->desc;
+
+				if (async_desc->is_lock_desc)
+					bam_dma_free_lock_desc(&async_desc->vd);
+				else
+					vchan_cookie_complete(&async_desc->vd);
 			} else {
 				list_add(&async_desc->vd.node,
 					 &bchan->vc.desc_issued);
 			}
-			list_del(&async_desc->desc_node);
 		}
 	}
 
@@ -1046,13 +1090,101 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+	async_desc->is_lock_desc = true;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->lock_scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = cpu_to_le32(sg_dma_address(&async_desc->lock_sg));
+	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->lock_scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	/*
+	 * Allocate both the LOCK and the UNLOCK descriptors up-front so the
+	 * operation is all-or-nothing: if either allocation fails we free both
+	 * and run the sequence unlocked rather than leave the pipe locked with
+	 * no matching UNLOCK.
+	 *
+	 * Both are queued in-band around the currently issued work: the LOCK is
+	 * prepended so it enters the FIFO first, the UNLOCK is appended so it is
+	 * the last descriptor of the sequence. They are loaded together with the
+	 * payload in a single operation so the engine executes LOCK, the work
+	 * and UNLOCK as one ordered batch.
+	 */
+	lock_desc = bam_make_lock_desc(bchan, DESC_FLAG_LOCK);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	unlock_desc = bam_make_lock_desc(bchan, DESC_FLAG_UNLOCK);
+	if (IS_ERR(unlock_desc)) {
+		bam_dma_free_lock_desc(&lock_desc->vd);
+		return PTR_ERR(unlock_desc);
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+	bchan->bam_locked = true;
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1064,6 +1196,7 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1072,6 +1205,22 @@ static void bam_start_dma(struct bam_chan *bchan)
 		return;
 
 	while (vd && !IS_BUSY(bchan)) {
+		/*
+		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
+		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
+		 * already have bam_locked set and must not trigger a second pair.
+		 */
+		if (!bchan->bam_locked) {
+			ret = bam_setup_pipe_lock(bchan);
+			if (ret) {
+				dev_err_ratelimited(bdev->dev,
+					"failed to setup the pipe lock, deferring transfer: %d\n");
+				break;
+			}
+			if (bchan->bam_locked)
+				vd = vchan_next_desc(&bchan->vc);
+		}
+
 		list_del(&vd->node);
 
 		async_desc = container_of(vd, struct bam_async_desc, vd);
@@ -1133,6 +1282,10 @@ static void bam_start_dma(struct bam_chan *bchan)
 		bchan->tail += async_desc->xfer_len;
 		bchan->tail %= MAX_DESCRIPTORS;
 		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
+
+		if (async_desc->is_lock_desc &&
+		    (le16_to_cpu(async_desc->desc->flags) & DESC_FLAG_UNLOCK))
+			bchan->bam_locked = false;
 	}
 
 	/* ensure descriptor writes and dma start not reordered */
@@ -1191,8 +1344,11 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+
+	if (async_desc->is_lock_desc)
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1384,6 +1540,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..30c0323851ed5201bd23f5382c700bef66ba789c 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,17 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_config - BAM DMA peripheral config.
+ *
+ * @lock_scratchpad_addr: Physical address to use for dummy write operations
+ *                        when queuing command descriptors with LOCK/UNLOCK
+ *                        bits set.
+ */
+struct bam_config {
+	phys_addr_t lock_scratchpad_addr;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


