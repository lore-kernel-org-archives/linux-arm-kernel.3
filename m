Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90500E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctYaS0o0swIe2imSUpMKfkFuWmACq81viiF22Sbc+YI=; b=Q3/VPudBZdFt8WWwG9q4Ea8gne
	wubFdpSyA9qgnmjlpCdR41nC7fSQHSMqKCR4LHRRu8Hz2Qx7g+WRauMBYzr6GNacgmqUdkQBO0mir
	DRpw5L3j6BkVR0Cq4BXfwChuKPWD9NEfmuu7dvpqPNmE7vQP9yQ/OIGjMS0waiqdznqK7NLgNzv0y
	i2sKwRxMijvgdE2tDuR5oyAM/legZza0ron1ZV+qDY8TKza8ZsEv84/vHFYIJtrb68X28+GPl6rzC
	BBbl09veyZb94BVjneiIgGzTL/kb+Wqt6pOIFGFxWBVVcEBZ12VH2Vzk0uvOCsnOYiicb61L9lBF0
	ibRmbmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs13-0000000D9AU-3baN;
	Wed, 04 Dec 2024 16:14:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6p8-1aUu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9958D5C6F5F;
	Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6EA6C4CEEA;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328394;
	bh=wAsPvRdwvf4EGb7r/h+7/Kb530DijpuY7cPegHSkeFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FaP9pl7IriAWHBBCuuOzeoYAA7Lxdxjx6C6YJEJ76Hbtgq7roFkIr2CM6xmYSlB+R
	 EWJ6CM5pvuR3tQy71X09hpnWO1daXPe3q8/0gfatpu97IyxXGmNanrAV/N6TkPvgwu
	 JFQkfYNBiBxZtSubW4Yj++6gJWIBvOyCidT+oEHWfcsbDLTa6+jjJp6kBuoYCMkvos
	 i3xggVrwhEx/EVRNYPbMCafFilSnWMag7xAKaxTkrBK7HFLezKCpbkHg78r+yJQ+2W
	 812DQpBN/VhbrsUIx4tl4g/XpCL+bNWLZuv0J4hi+1kW7tZvD7PpU09pGEVOl47THe
	 fdzolChHeOfrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1FAE7716E;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:26 +0000
Subject: [PATCH v5 3/6] arm64: Add Blaize BLZP1600 SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-3-b642bcc49307@blaize.com>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=981;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=ndFGNT8hlTjNTdZtp9EMF7h9pwy1ILkNSgtZflY+7U4=;
 b=MyPoGjnzkT21+M12LN3XkWoTRhNAyGCpyFpNDXLknKSuLzlcwQhBBIbe5pcXYqfNGx9v/CqLu
 t5ia9ty7GHHBS4ZxaodUF1IJmzo724S4lb0JwYXNOTplVUljFFUTE8W
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_475435_F3BD10C5 
X-CRM114-Status: UNSURE (   9.38  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Add ARCH_BLAIZE SoC family to the arm64 architecture to
support the BLZP1600 System-On-Module and the Carrier-Board-2
development board.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Reviewed-by: Matt Redfearn <matt.redfearn@blaize.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42ec6e878db8d355c17994c2500d7b..08dd5b3b2d7381a01bd5c4347c29202edff3495f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -101,6 +101,11 @@ config ARCH_BITMAIN
 	help
 	  This enables support for the Bitmain SoC Family.
 
+config ARCH_BLAIZE
+	bool "Blaize SoC Platforms"
+	help
+	  This enables support for the Blaize SoC family
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG

-- 
2.43.0



