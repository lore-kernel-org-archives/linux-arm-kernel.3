Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD691C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGrjzhD1UKtClz0VOd9lKai/lh/9MDlYmAVL+yQ8DKE=; b=zxhScOiha+KtRbOdCLRVx2PuI5
	vNnElUX4uZn5lzWSUGuS/nrXkMx4zgNYmgxXbKqn2MbKw2CdDd5ak81ED2Vg9mmiotfade5ceAe4v
	9V3HLbPk8vtxzRDippKShcvaXmo596W40oficDS5z1UzMLrTOemgyyRBqaTQT7QH46uRS8MfzSHV3
	/HMv2zes+GsSLDF/f5TGq5VbXra1nsc4dn18cKsOtqHuQkAOGP9ghqdrhX3Y5e8htetVi1W6w54qd
	+km4/SvXB25FjyKKPn8yg3EC8uC2CpOFG84PorRRaVbOCkVlfiUPXzIqAymEZOOoz/NEoz5fvnlL5
	6oDT4DBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcK-00000002AeC-2kUQ;
	Mon, 21 Sep 2026 12:59:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbw-00000002AQe-257q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe2ri2091472
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGrjzhD1UKtClz0VOd9lKai/lh/9MDlYmAVL+yQ8DKE=; b=f+U/bfNJn7pmp8Ld
	WvXJVI7486/G4LwWtpP9jEW+hN6BKBha6uLVMV35ii3JKrqj23bcjCwbcI0DLZj8
	+tRlnCJQD+PUI8i+zVwHtXb1eQZoaUFoTPMob2Ss+qSpwnUu1zlPZNAhMMl3ZPUD
	Xwuaje3kgkrDNl5gzc8pkF050wLtmqFA1k3/1zk3srVrR5EAT3veVl1N8Cbapd1j
	2yqtXMogUH0catTqfzQrCb7v9AzbR+dNlTjveVZwuz01vdJAVsMQCwy8b3BJWE55
	+XxR/oXzpUpk7Xams7HuikBd8Mlb6vfvWq1S7sHkIoWB3DQ3o0FZGvAgSVDPF1E5
	lZWjDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtejm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso598537785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995547; x=1790600347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGrjzhD1UKtClz0VOd9lKai/lh/9MDlYmAVL+yQ8DKE=;
        b=inmz+7Frpg275UYQXrTgcJXwRpYSO3d1ncmRK2taMG6tVY1J5gOQ9IIzCff254ek7L
         hOiBtnOsEAnqMVQGBDuurcbPd75PW1f5XdXpj/HnQbil3Yet0gLg8qGdSW7GV82EvtL+
         BkR/fAmLOU0bjen6GoeKy5hppXjTRda3vTMRYVlBAa1PdtrFznIXgd6s80BNueiE/gsi
         XHYRrhE2HaHY3H66cnr1SGbrUqBj6l050KtmZon9/bwoT4y7ic3kFk7yiqCGHsh1N/Es
         +Dsdlfeu5bzmsRHTieZCAAq97patjgaDPmfKkwDnnzfT4D9hQ9f9T2OJTaZi1YAKJjMj
         dbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995547; x=1790600347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGrjzhD1UKtClz0VOd9lKai/lh/9MDlYmAVL+yQ8DKE=;
        b=liOCX7yxgDHY39tKZDS39fM8ZrrhbsPmqduXAINXOLP7HzGtWyPtdAKs96t/Z5m1WK
         3vuQ4wnqhxMhEHogNaHCw2B6L6eH/jwF0TaNG2YOBdX9C90ybd97YF8sDFmmrDAgejPX
         FW8dWj6e/MSJNjYEv6oRSdcYpqkY6V0J7bvuJJ1UJUFHWW23brVB39KlR/94DTt9yZs8
         m9H4BnsRMwGOo5mzYJQoe25rmdUnbPh4vQ/gaDFUEwc5au3C3YLwxXggTDlUW8rYX4tI
         6lgT8M0rZZpJKoKZe2AwooX0tsO+O2zHqboka4lzlJC3UT1J6hpgq/j6EzcGe25raupz
         z+VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwisGfn2UJwYh7IRVTeQSIuZLMsQYV+2sClDENR+DOHU7v4DKXIFzwGnDFCKfjx24yfPgmHmJp+FgONqWnjQvv@lists.infradead.org
X-Gm-Message-State: AFuF++kqsrWf7PeStBYT5fEPjlOTKBfZVyYE1fA1lnt/dEqMlyhym3/t
	oycPFAh/+lMCMSwOMt/rB3JD4GeWc246Pb4h0EdrYLk3veaZ1KrOJE/6RDDdRe9LsqF6jAhGwCm
	fendjRuMd2G2lgXQye1aBal4Day5SQHdGypjCCSQFrgVy4szl83oNJXIidcp8tFwjJxw6RsbdYt
	u1Jw==
X-Gm-Gg: AYBFou3+fJYymyUf1XiyddIp/Zz//43x4cY/F1McoAzhnOCVCm6xOWob5cpXWfNzU8C
	0dFMuHcGXGnIBpKEh+0UsnIIKgZLdjxQOmA4b8w2IS0T9ViYXKxDH1tazDtOg2WWqpGcTejkazO
	F0Cjy+n6x3dw6aDEo8jXI/A2I7Zwpm6gKefOQPNSiRr0yXoy92oJTHEt01PztomHle6MdGr8v5J
	WPy0cLtIGPZQ+ZnNzmD4ZRSzWzO29cc1e/sFJCpy2P7h+NzJAgsq42OB9YvJgS75DHKuCcZTBcb
	gi2O5jY4gSmxxLEbzhTlNSX2n2TWOiuIfniCqxnXbMXaO5G+2ZyletChUN+89Mx76W7Yym2pu0B
	t7wbzPfdsGP+sk3jicmK9qBPwGMI=
X-Received: by 2002:a05:620a:400d:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93c15e26fc9mr53358785a.28.1789995546636;
        Mon, 21 Sep 2026 05:59:06 -0700 (PDT)
X-Received: by 2002:a05:620a:400d:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93c15e26fc9mr53353885a.28.1789995546140;
        Mon, 21 Sep 2026 05:59:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:20 +0200
Subject: [PATCH v8 11/14] crypto: qce - convert to auxiliary bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-11-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14659;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Su5m21FaywXrZ542UF20IF8iIL8sfF0MxiQHBwH7Pp0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnz8GQ2WDOodTABbtvt7lmNMdGOAnOF+VGfr
 NqEbxlbO4OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8wAKCRAFnS7L/zaE
 w55RD/4+iB2gGhSDEakre+2DAzhzKUWMiXXLYjIoj2E6IB9yYuf0xtyeM8VKKxDETl8UZlbJdlt
 mXCqbZ0aouTpMYUpHFNbdICXem4yp3uyHLKWImlaRF/ylz+Ux97xUvJkef2XMvxj30NoB6hLExl
 ZpUgqZ0p/bLKGigmDrs7EcEb2qtQtOxa308bOmUcHINGiUSD/DG2LmH/o2XOP2Q1u81IA6pLRDQ
 F5IkzS9I1Q1TfUdz4p4PlPabkMWQMnsOXtOM1SUkNz0ioPyozl7qBDbojW+EeRUCbCSTGvsHHWp
 57yY5eAV8+jPc6oLA4zo0Bs0mzgXYCs/aJEJFKrRaq8N3pxn0FZ4+PQiN282feQSZBksdiYyyqO
 SROG3ExkA+9J3SEPED9+zgMLM0evy0cASDDBlHUCfri9vnsnXG/zjnB7Jd9LrRnbSSlztXhi9GM
 z0LyEaqujNQ//hGifcJPF8EH4b1G9rpe5xDK6DqkGXKzWd2bMx8Cry2tdv1ncshCfe4QStTqFpS
 UN0qwsIdowwAjbHKdaXhzASddyANvIr/gw6HKK8dmvfiECl209u7Vhl0f7CBvsxnzXzLRwBjInP
 xIr2sfQxa6gfGvvO+zfjtyE2/C4U78wB5/c6172KNc7unAvwKEaCYVvxjb4CkEjWTLq/NPSeEZg
 qx/x5aZSKI+JTEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfXwYaTLrYzLOlj
 p5jBIPAn+j7O+X1JA+sAgvuEuMv7xkA2UKXzqOqJAmZZWBw8eq8pAeRa2Wc/nNbXWrVewXEar7e
 3ihRlbb44dVFlf0gHRCbVcV7Vpy8llpCVBAuzhn6Yn1nuefW6PbUwuR3hCAOPaLQP3CWs9VrqJG
 DOXssXBgv+QwNtm8xiPvUbhCkg59aZRFEKoGZt4f0JTG1H6Tk6lKbCOjF6xZsPoyprBDlY00oes
 bvfDH6trQoo1VRRLyLOPnDPUWzkv0q6A9NVZ+B+MRtbV/Vc/L3fxeFAa/VpMamNbiD6Z138D89Y
 QbYGhber0dv6xHl9ZE5NpW7TRGw2yyLRH48Pph1edOKOeXc3/MJIAafuS5ZpIXyULuuMa34udeC
 GcQpq+vBWV+xElqUcciCafbr1jf/Spe4/7Qupm2WokQnmsHkGLtWtgq11bQnxVXzpPGCqFZbDRw
 omCvBTj7eLH+eK7HpVw==
X-Proofpoint-ORIG-GUID: a6fL6RfayqR58_OYuIrgF4DY0_N3cKc_
X-Proofpoint-GUID: a6fL6RfayqR58_OYuIrgF4DY0_N3cKc_
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab12a1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WPyFHUJR_z9Wl-EIX7EA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX1bqwPvxg3GJa
 Ww0ipnegfCUMcD1GnRqqIdDj4MxNKYjtaxP69duiUADP8g/Pr3Wwpj+2oWMKmMpuFwg/2aegLQ4
 i5ZX+BuTII5Id2WR8N2aH5OJWdGRQD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055908_554756_959B80C0 
X-CRM114-Status: GOOD (  28.68  )
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

This driver is disabled in arm64 defconfig but one of its
functionalities - scaling down the interconnect votes to 0 when unused -
will be moved to an always-enabled core qce driver. This upcoming core
driver will also be in charge of registering the qcrypto device on the
auxiliary bus so that it may be enabled if desired.

As the first step: convert the driver to using the auxiliary bus and
remove the interconnect management from the code. Update the power
management as required and make sure to use the parent struct device
for DMA.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig        |  2 +
 drivers/crypto/qce/aead.c     | 12 +++---
 drivers/crypto/qce/core.c     | 93 +++++++++++++++++++------------------------
 drivers/crypto/qce/core.h     |  5 ++-
 drivers/crypto/qce/sha.c      | 12 +++---
 drivers/crypto/qce/skcipher.c | 12 +++---
 6 files changed, 66 insertions(+), 70 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index baf6c4a4c8aed663e89ae2468a7e9ed9dcb66f34..9d42c5f7820dc6ac54d4f2b631a93917d842fcf2 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -530,6 +530,8 @@ config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine offloader"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on PM
+	select AUXILIARY_BUS
 	help
 	  This driver supports Qualcomm crypto engine offloader hardware. To
 	  compile this driver as a module, choose M here. The module will be
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index a38f7f9854437a923b8fffb3dbddbfc0e3b44b97..6f33a89bb38436cc0b0d37b4209010b410e5201c 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -44,9 +44,9 @@ static void qce_aead_done(void *data)
 		dev_dbg(qce->dev, "aead dma termination error (%d)\n",
 			error);
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	if (IS_CCM(rctx->flags)) {
 		if (req->assoclen) {
@@ -442,14 +442,14 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (ret)
 		return ret;
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 		if (src_nents < 0) {
 			ret = src_nents;
 			goto error_unmap_dst;
@@ -478,9 +478,9 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	if (IS_CCM(rctx->flags) && rctx->assoclen) {
 		sg_free_table(&rctx->src_tbl);
diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5b1bf7a50f88c890da1f0820fb9e070b3d3f4708..31f1ad8938ab3bbe76b2ae4799eb2797efe704ed 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -3,15 +3,16 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/device-id/auxiliary.h>
 #include <linux/dma-mapping.h>
-#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -28,8 +29,6 @@ module_param(do_register_algos, bool, 0444);
 
 #define QCE_QUEUE_LENGTH	1
 
-#define QCE_DEFAULT_MEM_BANDWIDTH	393600
-
 static const struct qce_algo_ops *qce_ops[] = {
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 	&skcipher_ops,
@@ -93,11 +92,6 @@ static int qce_handle_queue(struct qce_device *qce,
 	struct crypto_async_request *async_req, *backlog;
 	int ret, err;
 
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(qce->dev, pm);
-	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
-	if (ret)
-		return ret;
-
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
 			ret = crypto_enqueue_request(&qce->queue, req);
@@ -120,8 +114,21 @@ static int qce_handle_queue(struct qce_device *qce,
 			crypto_request_complete(backlog, -EINPROGRESS);
 	}
 
+	/*
+	 * Hold the device resumed across that whole window instead of just
+	 * across this function, or autosuspend could gate the engine clocks
+	 * while the DMA is still in flight.
+	 */
+	err = pm_runtime_resume_and_get(qce->dev);
+	if (err) {
+		qce->result = err;
+		schedule_work(&qce->done_work);
+		return ret;
+	}
+
 	err = qce_handle_request(async_req);
 	if (err) {
+		pm_runtime_put_autosuspend(qce->dev);
 		qce->result = err;
 		schedule_work(&qce->done_work);
 	}
@@ -154,6 +161,7 @@ static int qce_async_request_enqueue(struct qce_device *qce,
 
 static void qce_async_request_done(struct qce_device *qce, int ret)
 {
+	pm_runtime_put_autosuspend(qce->dev);
 	qce->result = ret;
 	schedule_work(&qce->done_work);
 }
@@ -194,10 +202,12 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
-static int qce_crypto_probe(struct platform_device *pdev)
+static int qce_crypto_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct qce_device *qce;
+	struct resource res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,13 +215,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qce->dev = dev;
-	platform_set_drvdata(pdev, qce);
+	qce->dma_dev = dev->parent;
+	auxiliary_set_drvdata(auxdev, qce);
+
+	ret = of_address_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(qce->dma_dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
@@ -227,10 +242,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	qce->mem_path = devm_of_icc_get(dev, "memory");
-	if (IS_ERR(qce->mem_path))
-		return PTR_ERR(qce->mem_path);
-
 	/*
 	 * Enable runtime PM after clocks and ICC path are acquired so that
 	 * the resume callback can enable clocks and apply the ICC bandwidth
@@ -240,7 +251,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
@@ -269,31 +283,17 @@ static int qce_crypto_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	/* Configure autosuspend after successful init */
-	pm_runtime_set_autosuspend_delay(dev, 100);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-
 	return 0;
 }
 
 static int qce_runtime_suspend(struct device *dev)
 {
 	struct qce_device *qce = dev_get_drvdata(dev);
-	int ret;
 
 	clk_disable_unprepare(qce->core);
 	clk_disable_unprepare(qce->iface);
 	clk_disable_unprepare(qce->bus);
 
-	ret = icc_set_bw(qce->mem_path, 0, 0);
-	if (ret) {
-		clk_prepare_enable(qce->bus);
-		clk_prepare_enable(qce->iface);
-		clk_prepare_enable(qce->core);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -302,14 +302,9 @@ static int qce_runtime_resume(struct device *dev)
 	struct qce_device *qce = dev_get_drvdata(dev);
 	int ret;
 
-	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
-			 QCE_DEFAULT_MEM_BANDWIDTH);
-	if (ret)
-		return ret;
-
 	ret = clk_prepare_enable(qce->core);
 	if (ret)
-		goto err_core;
+		return ret;
 
 	ret = clk_prepare_enable(qce->iface);
 	if (ret)
@@ -325,8 +320,7 @@ static int qce_runtime_resume(struct device *dev)
 	clk_disable_unprepare(qce->iface);
 err_iface:
 	clk_disable_unprepare(qce->core);
-err_core:
-	icc_set_bw(qce->mem_path, 0, 0);
+
 	return ret;
 }
 
@@ -335,25 +329,22 @@ static const struct dev_pm_ops qce_crypto_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
-static const struct of_device_id qce_crypto_of_match[] = {
-	{ .compatible = "qcom,crypto-v5.1", },
-	{ .compatible = "qcom,crypto-v5.4", },
-	{ .compatible = "qcom,qce", },
+static const struct auxiliary_device_id qce_crypto_ids[] = {
+	{ .name = "qce.crypto", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
+MODULE_DEVICE_TABLE(auxiliary, qce_crypto_ids);
 
-static struct platform_driver qce_crypto_driver = {
+static struct auxiliary_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
+	.id_table = qce_crypto_ids,
 	.driver = {
-		.name = KBUILD_MODNAME,
-		.of_match_table = qce_crypto_of_match,
+		.name = "qce-crypto",
 		.pm = pm_ptr(&qce_crypto_pm_ops),
 	},
 };
-module_platform_driver(qce_crypto_driver);
+module_auxiliary_driver(qce_crypto_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm crypto engine driver");
-MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("The Linux Foundation");
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..6eda6e617b811420c0c3cc53988cb15a23abafe2 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -20,6 +20,9 @@
  * @result: result of current transform
  * @base: virtual IO base
  * @dev: pointer to device structure
+ * @dma_dev: pointer to the device to use for DMA mapping calls; this is the
+ *           auxiliary bus device's parent, which is the one that actually
+ *           went through DMA/IOMMU configuration
  * @core: core device clock
  * @iface: interface clock
  * @bus: bus clock
@@ -37,8 +40,8 @@ struct qce_device {
 	int result;
 	void __iomem *base;
 	struct device *dev;
+	struct device *dma_dev;
 	struct clk *core, *iface, *bus;
-	struct icc_path *mem_path;
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index a9a55bc5bc310d82a52b5637655007990da5b7a8..a5b55f5a861d072ac7a82e178f9ab223f892418b 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -47,8 +47,8 @@ static void qce_ahash_done(void *data)
 	if (error)
 		dev_dbg(qce->dev, "ahash dma termination error (%d)\n", error);
 
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 
 	memcpy(rctx->digest, result->auth_iv, digestsize);
 	if (req->result && rctx->last_blk)
@@ -93,13 +93,13 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		return rctx->src_nents;
 	}
 
-	ret = dma_map_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	if (!ret)
 		return -EIO;
 
 	sg_init_one(&rctx->result_sg, qce->dma.result_buf, QCE_RESULT_BUF_SZ);
 
-	ret = dma_map_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 	if (!ret) {
 		ret = -EIO;
 		goto error_unmap_src;
@@ -121,9 +121,9 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 error_terminate:
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 error_unmap_src:
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	return ret;
 }
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 35bd59656931c5f12614405490f1e254849b9eb5..c77d96e7a7506153bed1447331dec0aba7d56828 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -49,8 +49,8 @@ static void qce_skcipher_done(void *data)
 			error);
 
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	sg_free_table(&rctx->dst_tbl);
 
@@ -139,14 +139,14 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	sg_mark_end(sg);
 	rctx->dst_sg = rctx->dst_tbl.sgl;
 
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 		if (!src_nents) {
 			ret = -EIO;
 			goto error_unmap_dst;
@@ -175,9 +175,9 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	sg_free_table(&rctx->dst_tbl);
 	return ret;

-- 
2.47.3


