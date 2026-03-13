Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA47F107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XC6EVWrdTcXnfhaslU0vQnQnQfjR+CHD2QfenH6YYkI=; b=S86254/SxgGcDDokX7S3yp5ZLU
	+4kVcQTblY+zgEKvRX25pjLhNwhOOs6S+iXOTADtxy3d7JydSjn2u86PUsbWQPUzXGkUd+ksQxwkF
	zfYzhndOO8o6iYbxilAITkOGliqzfL1Rlsg9ECjMO8//NBc8hTpy4JK3WwpKCYni8hID2LepqOpq+
	0uHeol71kkT4ZvZ9SASsa8pOW5+qCn+ovKyBlVx09iB1TuAspBHmbpOoVGujo4T4K3CX2Js7KjmiA
	r/jVRAdH1Y3vopPeE/mJ+7eSiXJA0AyR7CPPNIqaoypu7WjrEVE3Ex/w/7AEa1qV79A3g4vITZoj8
	rjj+AANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Tm-00000000wnR-0oAJ;
	Fri, 13 Mar 2026 18:43:22 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Th-00000000wmA-3Wx4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:43:20 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 25AE11D001CE;
	Fri, 13 Mar 2026 14:43:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 13 Mar 2026 14:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1773427393; x=
	1773513793; bh=XC6EVWrdTcXnfhaslU0vQnQnQfjR+CHD2QfenH6YYkI=; b=X
	0rIWR6YKILA9ZL9ERxmhCzCBSbSDZXkP/DfO8lSgCNBrvOairRqVipIm5yf/qYFn
	c62k7kgEVs4aFvIlQXvPe5hlpY1iRjNN0uHfS6jyDy8ft+lpbsxWmTJtun2chU9i
	Kqi4rCcUZvFQqNW+AOHrnzz1Z2SEu9ffJuSvpEkpSyQ5eLmUQWnmPIjGc+yAPR5O
	U8Yj5DqE8EHkvWc0LoxT66d9AbUJbV8STHfSRsNPGf0DZCeZgbfQbzngMh61N2mB
	JXk++pcMZkRwihMbrd1ELcoAJTWIxmW2mYc+CIXTKMZghRPFGDV08esMF4f/5fdI
	UrosJMDPfJ6zGtB9Nwr/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773427393; x=1773513793; bh=XC6EVWrdTcXnfhaslU0vQnQnQfjR
	+CHD2QfenH6YYkI=; b=LMKPobux6aCEvJCfz5ruVaXowOoPXPZ046WDX8+4ueEB
	y8uLC+c9BZIJTC4cjMxXfj1KGaUjZHC7adHf4Y+j4FsZdAX5KIKQSrtyQpVXHyaM
	O4iEJGDvzEAB+vCNxEW8znHp5NpUN2M8o5zil2N3dmcbsdyhar47Eo+YbsZcHzAa
	ZmHWIPJSGjJ0Pf0Y2X42qF+UbcUeRu/HhDxB3us/p5ws4FntAfMZxHtk88BDrcnO
	r6nKiodyoUlxHqPfbwCcB5wU32sblNqAkPWIHF/cVRL680kygr15MCB+69uQ25S4
	cIsfrUw2b467VUFQyj3UfuqBN1wLoCXRIG0qTsOHuA==
X-ME-Sender: <xms:wVq0abgt06cTVyA8LZHUgl5jSXJhAPxjCpcXbnLx4muNUSQgX6sWDQ>
    <xme:wVq0absID93j3DRBXlxpR1Hud35wUWoB1SA8qldvWCbhXAucN-VOGmhSSiO3v8lYv
    EFb8S0b20FIC051O0chURjhdZCV71vjdsUNCyUC2Lid_myV8AvWng>
X-ME-Received: <xmr:wVq0aU4UZiAtCPl_J7l7UDpytHYcKqqzwJjutCDsuD3eAtzZbB8c4xGOD3cv6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledtgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegt
    ohhnthgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpeefve
    ehieejleekkeffuedvjeelgeduudffgedvtefgkeeileetveeftdejledvueenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtse
    hstghhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvg
    hu
X-ME-Proxy: <xmx:wVq0afMoisGaieliBp-VlYV87FIfbX2TG6VBLRO3SQzkRHL0LOPqPQ>
    <xmx:wVq0aauQF2ksThNufX8ve5Z7xeboW90jMkYI401-qygK_d1pWAeOyQ>
    <xmx:wVq0aaZZ1iEEcfeiApGmZRyfXfNlElH97Qj92mPTFz_r4awEkctFUQ>
    <xmx:wVq0aUzG36O-2aT7FDCqTsXkAzrqCF_S1LomB25b_or1vb6fsBtroA>
    <xmx:wVq0aTJ-80f4E6F7pEzSil7CHD55rzGHEURd5VZCsBM5uA8NIY-FC1V3>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Mar 2026 14:43:12 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Fri, 13 Mar 2026 20:42:45 +0200
Subject: [PATCH] defconfig: Remove stale CONFIG_SND_SOC_ROCKCHIP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-rockchip-snd-cleanup-v1-1-77d9a953fd1b@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAKRatGkC/x3MMQqAMAxA0atIZgONlQ5eRRw0jRqUWloUQby7x
 fEN/z+QJalk6KoHklya9QgFVFfA6xgWQfXF0JjGGUsW08EbrxoxB4+8yxjOiJNraTaOiYyHksY
 ks97/th/e9wPvrt4/ZgAAAA==
X-Change-ID: 20260313-rockchip-snd-cleanup-b641f06c110d
To: Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773427392; l=1564;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=n5O8kmjDXqJfQ0yqnK/0XI7wM6X8VHL3FnDeo/WMLfs=;
 b=ie/GopnkxP+azHiXC+21sVOvMdKEWvbY+tVDrR81JPPIbhG6XDqhrM2VAx2NVUZyXwr5MVBWt
 DKvy17gmSVkDob0mtf/emJZnAG/dWn5BmJTOK8nTfP0zHeN/sdJKiZ9
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114318_581744_AC4FB277 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
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

Cleanup arm and arm64 defconfig files containing the recently removed
CONFIG_SND_SOC_ROCKCHIP option.

Fixes: cae3cc435db5 ("ASoC: rockchip: Standardize ASoC menu")
Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm64/configs/defconfig        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c88c8274d1f4c1315ff1dc9ba096d5..f16080e059871cd19911f4b91e47e932c43c5179 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -814,7 +814,6 @@ CONFIG_SND_MMP_SOC_SSPA=m
 CONFIG_SND_PXA910_SOC=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b03aab531bc1313a54103acd43b7a..7e0cb17fc92224892115f59f89a74a43a2f95407 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1097,7 +1097,6 @@ CONFIG_SND_SOC_SC8280XP=m
 CONFIG_SND_SOC_SC7180=m
 CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
 CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-rockchip-snd-cleanup-b641f06c110d

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


