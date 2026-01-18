Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25ECC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=; b=A9KrZUZ9HWQxNA8W7hYh4W8xZp
	YVOmTuo/hWQ+NJfnKlcTkKLHr5czI6SL3TY+ZjcZbtBnOw7jIeYBEAkMPDiekJRmQwqVmBEl8ZQdj
	7bKKk7c01L+QUkWfkcJj3zt2oHE/DTiFX26YpfIkPZazFYX0iQ6ljxGqF8mOFv1El7Gez0DWXf6F8
	pWd5L3O7xw/bErq01E1171J8A7jvWsYE+m0vXKtpLA5pfJfi9MxF5o0XRGyEllOIGjgLNycyyhRq1
	f76G+AxL4cVuP90LtBrF/fEcBI6D3qldtg5smdwjgt2pancex51ToVaGOxjOhQn6zRrnNl2A9yO4n
	wUv/mdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkp-0000000H48t-0cXU;
	Sun, 18 Jan 2026 08:03:23 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkk-0000000H46p-3G4K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 08:03:21 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-11f1fb91996so7900719c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 00:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723398; x=1769328198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=cRdz9/BTU4mhXY3IL9IAeERAEiXxSTXRTq6ct3cpe9Mbi0L9VeNEag+ecPs6jmCiMO
         EFpBtkR169G9skfmhK0BAHdDjn+Eh0PzRNCfgAo51QK41kL+PdO3cYM10YToogYSK/7j
         5by2uDhI46Ciyb/t8eFRpNSD9TsAaVH26tgkzGsIuH57f9Z21t7hcpRs99KxiBY3FBaf
         6xKAd7G1+OBphTVAlyfPr5b5oEHzJteeLsnaSJyFxFeUbLLO5zd/S+doMxGN0NN5ei/F
         GKIG0D2830LFLCyxlSakm//V1S4MS3+/wRrqIiO6sKtWZ62xi8sYCopZFSn8z4a9PFXu
         /U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723398; x=1769328198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=w37QQcxwc32gOij1hTw9E3kSDXBA7A8dyysJGfpeo+JRgbkM+TrJVvlQ+TS79x8pv4
         NLhVXeRdpVn43TgHCWbkr1bJFBt+K0dgqO0yiuNwIgOowp0BHjswCjrqKLriJyjkL6QJ
         E+1/DcqAwqB4sYagi861Dh2gxjhSZUU10S1J4JiyPG3BeeBGE2JBjSVn30icuh2ljaDY
         fV+GEznlATNRnwyCUNhmmdVCZCUg4LAqm9WtVwtzVnCE7mOXjjek0TbTA4Ob74PjhQaE
         o8v6luyXjW6uOCgmArzdrQSEniQHWoxGozbpKqyk7YLV1tAUwlJ+K9FVkKPdxPqXxA2h
         XA7A==
X-Forwarded-Encrypted: i=1; AJvYcCVcOj4MYqBJWbGXi5bYCzIdPItolO2S0XNiW6+bQ54tSrfm/4KgeYkvbLTVGePwENM7h/l34yC4puTU3jZ3bFoF@lists.infradead.org
X-Gm-Message-State: AOJu0YzcUg1xUvmrPRfoWcSb0tNnl8hYnvNIIf2b4p06ZILs1lu/9aTB
	8JFF/dvjY/22fKyqe0nPSVaaEHE9FlEEKkW97Zpxwgo79oYJ7YNloXSa
X-Gm-Gg: AY/fxX7sHEMC2HJiHgszso016Oy26ZORLF66CAgR1llnWN/5d5s5CndzBZq23DuOgoS
	/NEAIcQcq+ce0p8xHZwEUePWcUjAiIt9WeBIGPNMy+8wDNv/P9itybVOpkHNtRhv/K3gIV8hGPM
	mN3ruVDic5MOjzN0E/Upkuihcmb2pUFqW74fn9bkIC0s62yBQBlT2lxJ1qoc85jgpttjB1eRsf8
	iZjaQZtYM42MtyYhMm6OqnN+TA7yWlCdggc307sPRw1cm8wWMLUeV22PJ4qbEPY+9NWnaeADIDy
	7Fgy5Nmcm6qTaD48XgVRxrqLWrGxEYSW9+ThMu+YSHEvRlvT5KmE/Xf2PxsbNP5oMQ3TZ4tYILf
	NS9mpdeF17z1dZX938wHrI3qVmlqOojCSrQ2TKKMM/wnMFJr+sBWaCAFeWUq/rycfoXIAITjsHX
	cV7CKT34V0w8Rg2+Zuza0s8V//ahnUDn9o+tySEGTLHHicU1/kSgpAPzZqMrcYWoJEQcbCDd78P
	yrBC4g=
X-Received: by 2002:a05:7300:3254:b0:2a4:765b:b4bd with SMTP id 5a478bee46e88-2b6b5045f4dmr6001906eec.37.1768723397526;
        Sun, 18 Jan 2026 00:03:17 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a94sm8475422eec.20.2026.01.18.00.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:03 +0100
Message-ID: <20260118080304.2646387-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_000320_715053_1FC5355E 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm64-dt

for you to fetch changes up to dfa93788dd8b2f9c59adf45ecf592082b1847b7b:

  arm64: tegra: smaug: Add usb-role-switch support (2026-01-17 01:15:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.20-rc1

This update improves Device Tree support for 64-bit Tegra platforms,
specifically focusing on the Smaug board and the Tegra264 SoC. It
enables full USB-C functionality on Smaug by adding role-switching
support and enabling DisplayPort altmode. For Tegra264, it introduces
nodes for Command Queue Virtualization (CMDQV) in the SMMU, adds the
Data Backbone (DBB) clock for the memory controller, and corrects CPU
compatible strings to match the Neoverse V3AE core. Additionally, it
performs a cleanup by removing redundant status = "okay" properties
across Tegra186, Tegra194, Tegra234, and Tegra264 files.

----------------------------------------------------------------
Ashish Mhetre (1):
      arm64: tegra: Add nodes for CMDQV

Diogo Ivo (3):
      arm64: tegra: smaug: Enable DisplayPort via USB-C port
      arm64: tegra: smaug: Complete and enable tegra-udc node
      arm64: tegra: smaug: Add usb-role-switch support

Krzysztof Kozlowski (5):
      arm64: tegra: Drop unneeded status=okay on Tegra186
      arm64: tegra: Drop unneeded status=okay on Tegra194
      arm64: tegra: Drop unneeded status=okay on Tegra234
      arm64: tegra: Drop unneeded status=okay on Tegra264
      arm64: tegra: Correct CPU compatibles on Tegra264

Thierry Reding (1):
      arm64: tegra: Add DBB clock to EMC on Tegra264

 arch/arm64/boot/dts/nvidia/tegra186.dtsi       |  2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 25 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 ++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi       | 64 ++++++++++++++++++++------
 6 files changed, 83 insertions(+), 46 deletions(-)

