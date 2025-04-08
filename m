Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F08C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=; b=DwyZUmf1juNkbSGCbJufZSP+19
	NbhnQXLnye6ZcwJCxasZJHx7eu9WJLPha0fYN15ApCCx8AhI1fqZBBwkJ+kTQNEXbHhxOZkEzBXq+
	jRXasx0Fs74dBT+uXQt0fJELLHyIFVq+FVU/ltvyvunrzrB4tu+ig9oAP/SItwee7Jj0N7zoKix/D
	DovX0zT5RFgJpFDgecSwL/w24MbJTSOiTbKLiinyWzL0lUxXpaQv5/hIDXPnTFSK8jpjtASM9rto6
	GAqRMilCLVb5PYE9Ar5zRBx9f1AdMAsEQfh1He3VmCHNvkStpRpKNNZXSlAhGWKGq1ez+F8ai8fAP
	iRokLMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Vr-00000004Iiz-30Gu;
	Tue, 08 Apr 2025 14:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29EM-00000004FOu-0SJy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=; b=jK0I9OvYzeNL+mRFmhc8EytonH
	I4JJQF6M25np/e8ecgVpNz7mIxZ4tHvzDC96BFtuG6bSKp5n7UCrwb/zWGFE/9smv/EB1OCgLjLBa
	SxEEs3nYVOiKRlykQ9aV/YRBAZZ6eYnVgT54h+cVceGV8OGx5zSOK+AukirHIdEeItdPNLs7JRolr
	MJiPfNOOl6ypdJTTmN2KG1Kd0ACgmoivwr+yYcjauzWOAyz4Ja+l3RuriWGE2CulJGq+KDvnL9iQI
	wkbpMshYvM0JsZ7+O9DsIPvEJzNlK6478qcrifrt/6xafluIxDzQYMophu79bunGAxAwhc1WFsjri
	CBT2slTw==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29EI-00000008JZb-3olV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744119786; x=1775655786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=;
  b=Iu6XeEYo6oeNnYEbm8uoGtN3PTfMR5SHZcMS+Xpf0kU3dxyt16XQxCiO
   iqb2uxJi+i2SXPaT3QLucemoty/UFUOxkTVH1ykm31YYwD4e4ev8OKBSn
   mPE1N5s5RXldAQoL63XQaze3SxNLImUEwwa222g+k+89BISeUWnOUtJcD
   oLL4niGnMrSJv3XSw85w6iN1YNcfRHam1rJ7FuUn+HlD3OXWByZR2qqYI
   YX1ACQPwm4vkjvynmLiQHsE2k56Io+h8YE6883d4+qLyMSDRZ+Tdl/Pxo
   OKqFGYHqQvGO7D/11xDr60FOS228LPwNu61YtrtMrFhfT0KCpMChvv6AF
   A==;
X-CSE-ConnectionGUID: vw8GpyTAReSSaLfk24lcSA==
X-CSE-MsgGUID: OKwzMlX9SZWU9zJjUXTEnQ==
X-IronPort-AV: E=Sophos;i="6.15,198,1739833200"; 
   d="scan'208";a="43404992"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 15:43:02 +0200
X-CheckPoint: {67F527E6-40-F35B2447-E1635CDE}
X-MAIL-CPID: 91F38755CB118F1CDA92F1B37A55066D_1
X-Control-Analysis: str=0001.0A006378.67F527E3.0082,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABBD0163407;
	Tue,  8 Apr 2025 15:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744119778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=;
	b=C++Ed0o9vS4mi++RY6GGfEEWEcZjEa508qm2ev21ncqu4bBt2gixgAmPF9E179ozN4kSki
	v0hHlGwxLr+Gm5RzjvYjJq+5ZqI89ulFotrqESEMNh7PqoDm88Jfk1qgTkWjG7xlBJX/hV
	/yvyu0XzKyPB00kZUhgi8TiMihyseHl00ggh9qzhp3vH2/aHlt1YUsuraiasuVPEFrLXNv
	6YPoFtw5xtxiJJKY8mjDz7UbR/A1rgxGBrKqqlonx0Xi8BYHUfpyPwBYDfX0uuY8Ilogze
	l7YpDQds/hHjSmpEIw9COmlCNy+6sH4oJIJnoLlaITopU7e8Cokil3cGDcCkIg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: defconfig: enable backlight device class
Date: Tue,  8 Apr 2025 15:42:48 +0200
Message-ID: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_144307_412126_74F59B99 
X-CRM114-Status: UNSURE (   8.19  )
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

CONFIG_DRM_PANEL_SIMPLE is enabled in this config. But it depends on
CONFIG_BACKLIGHT_CLASS_DEVICE which is only transitively enabled by
DRM_NOUVEAU, iff DRM_NOUVEAU_BACKLIGHT is enabled as well.
As simple-panel depends on backlight, enable this in defconfig as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65ec5a5be407d..b70257878812e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -963,6 +963,7 @@ CONFIG_DRM_POWERVR=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
-- 
2.43.0


