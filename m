Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31374C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=pc0KiwdHwqyOIIDsATWwAmetGy
	7SLowRd1sCMXfnMuQNflFH+WgMmEzMQ3EV+Ag9C/4qobdm1ALcElTLEn5wbEXNCGjIPT819MiM2hb
	IBNlAumSKEGXKrNvoUKlsJ33NIx4RW1OEdqU9dEnoEQTS0RLuGWiQbo2AuA9sQNQpY2Fz7anlL2KY
	+Wp4VqptBZBObn2z79gVc+/a8zQX3pTFpPdEuaDPJOQ8+g6gApbn7dzFyH9jcbmP2tBzxeKVs+iaA
	bfKyNghYFVBINxt81JU1Gv2OJaUuuhRtIDv+QQf6NQTIo5Ml1/J18Nw8VT7FcDZ904eo1OYhbBblP
	CXT6jpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke43-00000001flz-0D52;
	Fri, 17 Jul 2026 08:36:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke40-00000001fl6-3Kaf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:36:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ciiW980050
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=AjNCwr+sRv9g2AVU
	iB6pKffGqXeOIXQzg7vFLBhvIyfneNHz+YE9Y0Bes7ETVA184wtriOyFrGGKtFNB
	mEtSjM8z1AqK7d3g/siVC+5OqIh8PHEiBCuCJEstZjbWpYeX2VYC1V+eDsZtY9nL
	sDVh1hH+62WYoailE1GN0r1yIilONmSPw9yXz7rWe/QrlUiUw0wFMCmc65CVV3gO
	OUtfmUkcuWUcLlF7O0mpaoDhJZrSwlaNFUD3uUlEQlKPcBXYc3fbucI0Xido/R/0
	lcD83hg5A29jbFJ2XWS4UFjWlN617O4XAKURLLqb7aGZsLPhS4itq7NX4w83k9ip
	4laPOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grepx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so168533971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277414; x=1784882214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=K4Z+8j0HH1xXTDGZvd/l94L+dyRF7sfjKXCO3Coc9ok7x5C3njtiSTgNma6SxIK7d3
         RP+iXxDJE34LyhcsmYQbZlfiYQb2bX1QkBxGl+fYGvck/J6UYgeotboEKdeol3Q8wZJV
         Fd+pWksF/ohdriKspT/N4Dm/uZo1gL6OFSEQzWigHYcny4S0RfZnEXghwYTG0zkeiIdd
         IJvg192pZizErYQEJDrKlqyJHLJO4cBFvddrU41V40Rh1UGap+//wEEN8UUQOLWAyzlD
         DZP3ONgfN7X1id+U6YoBb1eDKb5vVinG2EP74cusH2ZFJPoYqNff+wYViWuy6Bskj9wJ
         qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277414; x=1784882214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=Y1pEPHkw2uszx6kJMJGKQ9fOSoore55qUFbskSuevdd8RzvhyYSXde8CzxKmPRk4fn
         yzabEXAryktDQrwIKBhCwElgIkhbJO/UgkthOmaqpJYPAKCKQvY15G4wdIgHJrmph2ya
         mNBWnWGFWE3r7Kut4ADR9FqYeGiLkLiDdChVSauj2s8grwI1N75/0PdTIRgwVyN+Qfpa
         bIjZLbGPg/IFX6bpGQshk9BXSZuDQ+3+Jds+G3pCtwjzkg7dqVahfmwnFkwfDQ13A0kK
         /T5giRukrw2TVFaVOdMH8HYsmCILlMW7/W1cj6Kj8+/boxPTrIUNnbBS3QKCgfc1PXCv
         09WA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ46fTNzXfsLgORLR3OQ2fkfjdtawKgSHm0ilhynsrNFxCm1U62hfCTyS+8xr8psIeNkySAZBECeEAVeEsRISZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzutADZz3TG3d8iKUus/joQbtb6Krfnp1ak+OHL2P2Z5dg0kops
	RbFJDpwCEyP8KZ83/7SrG+1P57uV3S8A46G6FPSVmztdT4pGZiTfys+B7pHeK6QGOTQH/1sUSqV
	v7zyHZLxz5+7Gi6ZX686tPQD6milT3pTZskGZQnVtptSv837yHqrHtdDZuUNH3eE9gSNjladDcS
	u/5A==
X-Gm-Gg: AfdE7cmiRh+2KOyOFz95FODmGN7ku5zRcu2uQ08Lre8wF95/Vz/r2HJpbluk9JAqEvm
	3EeEOjyUmeBT5D9fvH9U5E92oZgQi+cL+sAG2Jry2vJJg6wbKUVjQhNtx9WlNub5nArN1AyGOJu
	GmcH/2zaTIpScTg+xOHlxz8DLK3OKNUDxqHSncLIEQNT5QaxzfFQgBe054Kmx09HODTiloCdUL8
	KYVBVsBUGBR08O0m+R3cfBbT9Q3Aaze3d8W6DYioQCvb5oS9Q63N0HuIopG5a3LI229s1546gfT
	Hi8mYgFLRGWuOB4ZaYIjT1/UGc/+cv6dIuJKRbLMuksDYREQMfsHbSCoJNxGbi7y02W1a3jzQ7G
	YvoP+3WclUUnED7THzImfHC+mxpUyrw==
X-Received: by 2002:a05:622a:283:b0:51c:775:c175 with SMTP id d75a77b69052e-5213e77d807mr12257391cf.40.1784277414351;
        Fri, 17 Jul 2026 01:36:54 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:51c:775:c175 with SMTP id d75a77b69052e-5213e77d807mr12257271cf.40.1784277413969;
        Fri, 17 Jul 2026 01:36:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:27 +0200
Subject: [PATCH v22 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-1-ff0d18b27246@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemVQLvsoBlGUC8Id5HKABGvrQnHacgwbnQKb
 dV5Msto6GWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplQAKCRAFnS7L/zaE
 w7U9D/0Tcm22Q6sO5uCv62Ub4sZXCWkpD5YcJjqq79dBD4DQ05U8WmqZViexgaYwIr5Wi/Jzxbs
 H0IiNrfekHuE/z2T44i/LBZrpj+i1p4I/iJQIP+hNGS+clq0b77m/AXM6lGBBO9X0cGO2sfUmiG
 j0eR2WCLXsbjart0QQjpCeSxSq8/5g6V70MnqfI6Kw+UXariJasrZeVeCgfX46RpTVDUcbaSeEm
 cbgOypWN/0qb/c8EfgN9ixrqv2o4yV1RHx7L5BE5xA0elNQqbvPqNzpPeiQTDbfvN8iHBHnS5/g
 naD79zRUbLlyuSdb6ieV4PIM/UToBoh8eFyewP8aose2G/QigggMAtDjYWgGTI/ZMXC5yzd6Fl8
 Dq95srQg/noEMR5CLrjadrqMbsA/wvnFUwff/PVj+CgOWoXbdHSz5aYTrlEetqRpHQSfjRwS4ej
 kxDimCX4aDXgt3fZXejKKXyna56IIMwLvpquXbpxm3KZOEQMODV+Mu5ZcytQIW92ZMQQHgb23/y
 a5wcK4uAn7uKz/sxrmFof1bINsnOYR5BpxQ4yDcIwUFSLZzuAANfs1Nh3O1LR8Bu3iO2hqkUcJ6
 /cTHzelOUfANV3e9qB9nscOAS/tztq1GJ7/lEH1O2Tc7uljCQFSk2OTMyQlTQ/HddjnV/VtL1po
 TEFTVrPXPpnlEJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX0F81811pckog
 grUis4qqsfu6KIOJL6/Zv+Nccv7IAmulwFG8mlDRE5aROVH+TB3B8N+cZsY4dz04gfVZlXpqRer
 Fis8R2QC9pfLvfvDr8ZrBa0yazp509I=
X-Proofpoint-ORIG-GUID: 5MLpCineBbJ9WMZmxm_vwLTxgK4C8V_N
X-Proofpoint-GUID: 5MLpCineBbJ9WMZmxm_vwLTxgK4C8V_N
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59e9a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2oJunsONhZxo
 zobfCmw89pDigjXnWoDXP9WqoWgdHPz+rTxmaaaOkieUHGBvgr5Bj2+1XX7gqKR/S2Heb4Ima4i
 aujK/BG20GOONThvYhNklT763q/5E/DutvOHOpu3ysIvKHA8sYytv9g0o4YNtSqt7tTDDF18VeS
 fLarquRcKx1i1OFAxtdk/h5d4O3GYrx5Ba4oY7JY67fpsj2t8JQly8ne8d4y6WlX/0kbRfGth9x
 aTDAXkYmUTPdUd0mjkLeJGvwVBEerSIu2rsvpLVvclKLT6xyHio35lAO300QcAZmgi8hqfETZcy
 o/DCoE6jQKeFkYRNiDrFP1Xi4qC7ZWYrfiN5plamRm5nso0dgIp676fNMKSfELIkKYfQTymn4AV
 jomrbPR1VoDJgsjWUVmMop9k4SOO3qi4JaJtucP9P9c47akxdlZ6RC7BRBvjqkQpknVu+iaTlr5
 Q7KU1TxO0WDNs5/L2vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013657_111396_4F26B693 
X-CRM114-Status: GOOD (  15.34  )
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

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


