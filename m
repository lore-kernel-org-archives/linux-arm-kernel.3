Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79E2C982F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHyrvKQS0PCTJFUcgPmmdME//BoOFMVeQtcfEBdKJso=; b=IySA1JN1Vrmt4TLc1RTTo2Sny+
	c3T4OYYb6zu1zQ8GqqI4UKOogCHOZ6fvvR59tx7nUvZNvC4OII/BILVQsYj638r+fBG+l83pf6Gmz
	ZRiS/atIaX9t9u2g/JqFowljMIf7TyT8Nqjy599fO6lQOYFWQCxoq6z25tRhnZFQP336j8HtO7Yrg
	j1IP2hlt7AOtqk4VQb5yNpv6Itsk9wufnUayHZlXPSlDpWNqsDadR5qpkLiJKk4Jgy3stJe8+WYSx
	1gM6s3GG88LN+3NkKhFayUOfYCARISKZ9qw39any0p9t4ajfMDjRjvHwqNEe+C6JR4S/MqEaLqMcB
	YLk6cfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcK-00000002AeV-3wIt;
	Mon, 21 Sep 2026 12:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbx-00000002ARA-2H9q
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HHyrvKQS0PCTJFUcgPmmdME//BoOFMVeQtcfEBdKJso=; b=kSGVjNII6gZ+b2vkz+m57z9mQ8
	YhawaOS8fRW2SbGwun2RdFXRwACAV68cPqymINwfK7zthrzsabCUKNtiHRNAj2oddH/RdzFq2ZyFo
	Fi/gNrt9qUjIDO8vwvxY1gCE9+rzgETz/OdQS5VZjnUDXTXrrL/GoCOhEX3Vml2NgymM6tZ2TobVJ
	TyD+x0pqn5poaV+5Ax/FD+I2zmIxZHdGR3Bzo//PMV1aifxuD5xc6wpy/65OqMMwb5DYZfRuk48C5
	e9VpNGz6i7tTe1vJVRH6bZzMryV+Xn6Ji4Q7AOqdYRTiUVL/ty1PMZ1zsXhYHDh6BtjfzzWYl6pdM
	DgbBVBoQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dbu-0000000CJC0-22tN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduH4287294
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHyrvKQS0PCTJFUcgPmmdME//BoOFMVeQtcfEBdKJso=; b=NjrsCL/JBu9HQB+J
	h69K5/sLacS08MzxiXPy3uV4UWA6XSeCZoYa6DBlgYetDH+3botROPx9tVLVJJBu
	EAIe9YZqpFIkrFUxqc214msuW131IcjIiu0hbETLeNKhsgCIY+2Yub6FaninzHhF
	QWHVKrAuikXdI1R3AdATRTS+AHsh7mvx+kOCV6tpNdPIDZuQuwt5DswQWwpnLRry
	Iu+K36hfuJe/pWr6cPOHzMyPiUBprz9GfLml9OVCKr8DhsqfWniFvCZrRQUAjbLP
	lQBXEIdZHFM+XpcJaHYC6cssiVo2elec4fh7S1g4jiy25k/jwE+5SVJG7V/Blp0X
	kQhK4w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj153p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980c3b71002so2334769241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995544; x=1790600344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHyrvKQS0PCTJFUcgPmmdME//BoOFMVeQtcfEBdKJso=;
        b=cied/OxaWIXTwriq9k4MlEBFZEjU5RVkog/sGi5SjfbcD6EwYevppHDogKUW/tgg0f
         yykajR3Oo/vkP2AUjpqyLbtJuyJF0tw3WYmUuI6LWKaAHozHqw4hJ/pjqQIYZiMH6HK+
         wSpW07bE8aE+OmFMYaEQQv/iKCoZPYS1scHFpKkEZKGyMru3L2sJMILnX4iokLMzogdm
         RRm+11g8zsJoYLaAVkXpJPECVNBmM2WDphtgZJNoSzGRTU7q9VEhkcirWYyYwVgM2dRa
         1Atfr7SC0R6tGk9HRYjV+yC0EbQ8mxFZYetbc7ZLvTTvfIJOCN42D0l2BYaSAM9hIzjX
         dF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995544; x=1790600344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHyrvKQS0PCTJFUcgPmmdME//BoOFMVeQtcfEBdKJso=;
        b=f7PoyK4V2XohXFkUz53/+n6dNzqh8246PePa96tYennJAVY39qBwwrten5bO9awZ/b
         0u3kMXdg95JdJbgKAtQvxRgYCjtIcBZQ1/JzedQGNkKStDmN13iNtq5Rhu0w9lhq33K3
         tuex3Ys4wBQvri5pGZes7F9ttvC34NnBcITRe9tVT6GX6hBnxmf8CN2g+lHVAs2Mg0Ab
         iSSNEIeyMmhqXYa3CVCrX8iIZQQqSxrqWie2lDPFYQ2ol0hZYA2NAiISp34lp6B/SJzP
         0xfQIxfRo7iZ8uiY6YlLetzHsHYMXMAY3OAMRa4Jdwaawom6E0ob92fMpfIkngU5g+7s
         pbQw==
X-Forwarded-Encrypted: i=1; AKwUvBz4lA9BJJSX8ou183vMbePr9i0JO2MDfVdxZxGcd/PZL1+MzGAJdLiH40NwEo16kpq7YFd/8ANYnHrhlWkn7dRJ@lists.infradead.org
X-Gm-Message-State: AFuF++nKxrQ1FkQZZb4P6Zju9/VDkAV+K5hBHuJYoERBtC3PhNHu5+oC
	fnBerVpUgYp7deG9cNfcBC+wCw31Jk3IrzbRBscCwC7ZtSye9DudgfVDAMRBy6QuuhXdW3dj3Ky
	pkpHRuMEoSHLeF4R8GgJxx86XrH+jZFzd+yEGrl68BKOjb5BnFPx7UsD4HDpBQA2nuLdBRTMrFD
	L1tg==
X-Gm-Gg: AYBFou2Ehyuz2G10wIraQn857DZ4cIUAs5qBHLLfq18xv6kM7WycgJGvPdYECaQ6s+O
	etE5tnD1l9uLc7hBMFnf/IUPdLB5ZNCobZK5BIqtqEJvl4GFBcl8ph0cCZgZsX64LCDsjAu703L
	7f1RcrbwHgxELOTzbbJKoqNEpptTbJyeYAx2QUd/SXQH4ge74v9/AWrQNot0VAln91mJvAl0X4u
	UUYbV8FFdOuV+Bf2ecMeTe6X958RrS71ar84cKkiGCJcgnLOjuF3Z3C08JoeC0s7LMdwwyxIgHm
	1DvJSsaCsgpsCiHS7e9idOZ6hcir1XU5troZYW/vveNEHIgSLHHGxKf41weWK/+vXTjrdnbXliP
	AsHQwi+GpwdtIx75JicNNFYbHUec=
X-Received: by 2002:a05:6102:f9c:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7a55e1a6bc1mr4171424137.35.1789995544171;
        Mon, 21 Sep 2026 05:59:04 -0700 (PDT)
X-Received: by 2002:a05:6102:f9c:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7a55e1a6bc1mr4171378137.35.1789995543721;
        Mon, 21 Sep 2026 05:59:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:19 +0200
Subject: [PATCH v8 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vkQ0+w+OaiTixUsSZRF4DmzZtt122AZuDXlpHEfsrS8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSny8RXHnD/hCcrWJJtVX444fZXPh9LvFHLf1
 8/flOUlVXSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8gAKCRAFnS7L/zaE
 wxw4EACvpYLqBSBBiTMrlHW+mTMnlQpCkcDrV1TD1p5dpE41/RNPbKnKpXgDbsXga4i/DAVh5Vg
 J0SPGdUCxS1rXetIyXiz8oOkzyB7K4430qdp+meWpohC1/lY4klRK+mVJXCOC/mBM68q0jk5BLG
 mYsMMZo/Ga6y1GAOvweRpoaLfr0YucfEPRq+MHcAyKnFVZL9JZHCjrxUZ+YZcM0TGCct8z3fyG8
 S3vyMpHgulgfe9ARtPHFzcERjhnja74y7o8L4zX3lKDiN7egT85OzHuc4LffWznNSDwYkmgI8SE
 xllDJLYHxY3vt+g18ZLqOLYPDOZSGqbdV/8kHLdClK/ay9dZVhaa7EeUUfhUZ2HTMrXQfTGq3N8
 QTRTr65y4hBK08y0XeWotSLBhryjoPsac3NiTr+6xtd5gySQwZ/aMbLvh0N0Ym0qA7TP/9zbk2x
 /vDySC4+kYbZUI7OqKIrT86Mo27alii76gSJqUzB788hvFGfh3n1dJRYQA8eOjoftZRn5beH9vU
 4YnbFvDnBznJgziFxjZu1yzp424IIEpMh+bPmfegRLSep6gNbxmOP4rkbD8oRvQzxd/suxnbARF
 MDcSY8rtPEibhvvZAxozCjNYxsd6myGs7PmSj0l7dCeMO6w3kakTurU4NSHievC38gT/ziKVfbO
 nitVFOitYmcR1KQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX6B5ZYJzPXSX4
 raVRYm5Qhs9Kb9ExgRqfx3xiB0cAE4AbIMmTI5+WcTYNqre78VxiMxXv0xs+eYJgKjn3oF20fWP
 Lgjqrx7Hd50YAtPsoMmwbiR8DGmXCDw=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab12a18 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Y_jwshM-TqYlUzFSP1QA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: osuv_S18an5mjnlrY7MtQaA_ZOaDp9ru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX0fEws5h9gN35
 j7UHBKnB3lmh3ApWtAT1+lTY6w2TvSrbC9rVY9juAtv/K+vjOqagiFiaBrJzX1eOd6zXlZuoV93
 ThbAqqt7GoePh1yACwnqBajjNvINXM971dHDuhuLe0OHAY1hX2VUN5KjDA3pHKGLx2u4Up8z91Z
 8zsuFhistTa9HE62dNKzbBbwElcWboqjmOJ/97yIP4j3GsStW0RKCEnyGPmUNxNoJQDu7f84aOX
 Odkx191J3bIB4JVTTP2u/NmfwgvJ8e8mKkcu4RmoJbCOYWrYD1qVsX+155JKCUuKSsHK7XAzq8X
 w6/0moOXhhI356FI4NTa5dOaWQBXWbMR+ZNFfXqe6rwpK9DkbYFZpi4ddL0Yg2z2YO0RZQ/fUwi
 EUrrqqKMyZiyR7L5cjar4RDXYvoIf6z4HDx/MtKKtpzGcjVl4y5v69apyrsQUCzaeD7vrbgOGpt
 rlvEWZ34j+ZMH4HFapA==
X-Proofpoint-ORIG-GUID: osuv_S18an5mjnlrY7MtQaA_ZOaDp9ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135906_871824_DBC05942 
X-CRM114-Status: GOOD (  18.68  )
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

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 16 ++++++++--------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb667a1949721140961764b3e9be1f6..55a2e8c3ae3522630df8c31cb2b7c7663e973aed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1957,6 +1957,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..baf6c4a4c8aed663e89ae2468a7e9ed9dcb66f34 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,17 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
 
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  NOTE: This driver does not have exclusive access to the hardware,
+	  causing races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. Use at your own risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3


