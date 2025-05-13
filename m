Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRAq4ALgPaeQIqebqipJbrANRQd/TsurkWOFmFAlemA=; b=ZEu/Kcp2AzEVMkZNf5N6Jvvj93
	kwmaxhq+qsOsD2uLvxlQ8ZjA1sEJXQ/7KXZWe+LwkdGs2uPnvsqb2UzzR1RtCsoC+tfwSdte2YTL0
	S9yGFwFgcf9gPhI/ArKQZGE1cC29yV16jze1/ogZi0yOw8srmyFGzceiL4sBUV/sAzNYxhu6VO3TP
	kUhXliu/YvAHq4gMU3AWLNafRP1I12Gz5T6pM3p21dRgoYRXdBTgHedgxMdvKovLOUXinSZOWafVi
	SJ1fL2FE7J6zMzOHGCV8pTEicHANpa24VRj4a+MJxMycR8eUX7AsXqM0Rwvb8W7eBOh/Vl46mgYm/
	8ordCuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnC5-0000000CBHT-0NPG;
	Tue, 13 May 2025 10:49:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEn5f-0000000C9fb-106R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:42:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442eb7edc80so379445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132946; x=1747737746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRAq4ALgPaeQIqebqipJbrANRQd/TsurkWOFmFAlemA=;
        b=SJHj1nAtOi7LEh2gPDGP/9lAsg6UOVClax843VihSnEP0Syyrhv7asiAi9IR5aEN5x
         +s+ymLb3NtsndhTwNdiAnevHwCMNhKHX2cFQ192Ttw2hya8RzlXdpSyAR/7Tf8hQsNhv
         8ZieUFgo7LD4sNPsrWesUiHnRmzgT+1Ac5eDAgP73i+e4YahuvJQaw7VsbXPUSPGMCNU
         nKjQIAAno7xQqGTyXAd/4onv8PRp5LaPEsTPTGalb0I5JRJ7NPKNGV+tz3CMPdpyMYY6
         +pCGbiyAmsPlyIVzdZtnmYWNjswlvcFxYuqgpz6aOZACfb8fVDT9Vkc/BaVgOWI0X0rS
         ccJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132946; x=1747737746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRAq4ALgPaeQIqebqipJbrANRQd/TsurkWOFmFAlemA=;
        b=YXr6lE2usfo9fN6NldFk7ga/pTbU10fnVEiKJAaeV3xOBCP0RPKpXTejIuczuu3r7r
         1JOk4OTYDtulhj+OeQRei4UlrVdhiygKde9GbmgoT7SkeaQFQpOuAgBpdwz9IDikhyvv
         EsD0d/fmstca5NeZpXsRMqwSLhKqqiLH3kAziOzPuU3Cpj4Op/Db9+xjCp+uR4Gb1klg
         yt2VyhdqzAnsKouuVGz832ONtyTB6OA/R5LVQgIHlLBxTi3Al8Zt5jXGDSZQy9AmhBnM
         p+AbjbcE7cIdMW4vpKk5p/eeqiTLzHUgHr5llswsr0V2Tt7RJoMknfSUU7C6yWe5o+nF
         UNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGmr7EgUFA/IPIjB5G5AOP5H1XFXyM1V2olJIdmdO4beVaV2Bc8KjYUQ6h78dnvyJXqCoLDrgnF1y5VoHUZfb@lists.infradead.org
X-Gm-Message-State: AOJu0YyP7ljBhdOBPl1OMp4vgB/sCsDD4UVpov0bB+lI7S1Ik2jAdNXi
	YVDFqaf0KuMYT/BMQsfCbMMCODRH8HPDNu9ByIA6cPrnIhnjRAvwHGHDcP6UVOI=
X-Gm-Gg: ASbGnctLTylSV4l2LJe9QvV23ltUhKCBEzECPUDh8xfH9vjqWc99M88l9eZTklaNe5t
	9b6YN8EEbPYRBr6vQ/x6k/7Fm5gfpKYukZgrpcVeQ4hoi2G14TTXAPIH29iOJ6R6NQlpxJmqs3Y
	S6h88GQj9DZ2YlTCxTOND/JnbCJ3So5SM0gV8/9JO6De+2r156+v3HimMtJHymA6xyCTBBNsgBR
	RWN6Zo4XF8XGUe5ScWm/G8RC9CIE9INKrjC8NojBSF6FAZOOmKWFtdgtwlQ1uv7gVGoMoFXrwZe
	QOS9OcJ5yh/pV5dnIeEOl4pw08P1Din1GoOaP4L7eSpP77pnCX5OgUJGnCsy+DW8RJVyai4dmgQ
	KCnccPYOyllmfC40er4q0vNiirO4P3uLiKhoMGWA=
X-Google-Smtp-Source: AGHT+IHNVUCjFg7HrwuiKvG5+jPLvxkbHOntgjhYx8tbn11qUKDZNDS/EyFDT0F94zfQs0ixdCFIPQ==
X-Received: by 2002:a05:600c:3b95:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-442d6de96b1mr49643205e9.9.1747132945724;
        Tue, 13 May 2025 03:42:25 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] ARM: dts: VT8500 for v6.16
Date: Tue, 13 May 2025 12:42:16 +0200
Message-ID: <20250513104216.25803-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=D7BFaN6Gc6SPGnvwqk3SshdNgmJRuNAQWzUgSNJfDXQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyIJbw7VpDum2ZoNWQ6N9G3/MtLdNmncQjeRC
 +5gwhHHQPOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCQAKCRDBN2bmhouD
 1/FRD/9SHJs9/n0riKbtCAfMiWIEwmA4nkcIEyt0wmgoXKAA4tj3QchnLVYdRKfIRiqOOGb1KIL
 Bwo97js2G9shOs4KPah8nLqeR1NipSDjYmU6UiC9+xtrAhYpXpbLl/+yt2sLQ6FupbUx9h2ZGI4
 fPX7h6IS1C7P/akWY8j+zRaQRdRQuzmK/6eJoyZ7ViR4lKVxfQo8TBC8dAt5wrRjIDcSqb5GTLy
 XikLvqMu34/Ixux7rewqwHbvfh5dTV2+vjr0Crv4GbgqUqPv9XxmzFDUufw9HCCSrPVonr/qunm
 eOHuNs4G69RPr12zqzOuUICTVKLCGKV5P07FqddQHB5L9emq+bnNyxBKWLuB+tuLBz+yGCVWLPC
 k65sr+ji9vaUzX4lKlpkberXue67j6q2VikoJRIExYwFd5OnMlF8/pGWfbvwQvTRWUzSZ3b5ueP
 5Ugu0kwY3kghbgAp4MW6zxxhRbGAyqjEJehnmX0VIff2lCx3HhVK8JoH/kow7qSWCMBpMzzDPZl
 K2lEXzOK6P4KI6UFpEzBYBxH6AA+GqY93xX2T0QyqSYG5IFv34UV8GeP/DSZJkZkMz56E5wlT8W
 zqIrU5u9wcEFgSb8p2JDP4FVY546IsNnP+P5uyiCTV7EVSsPkozLaepUZcBX32KbVRjnquZ/cgW W1BSJZOl6iMJ3xw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_034227_280063_AC4A5B76 
X-CRM114-Status: GOOD (  10.63  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-vt8500-6.16

for you to fetch changes up to e58afb3e1f365badd69aad6f0d53a2c66a63f689:

  ARM: dts: vt8500: list all four timer interrupts (2025-05-12 08:35:24 +0200)

----------------------------------------------------------------
VT8500 DTS ARM changes for v6.16

1. New board: VIA APC Rock/Paper.
2. Add SCC ID register/socinfo node.
3. List all timer interrupts.

----------------------------------------------------------------
Alexey Charkov (4):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board
      ARM: dts: vt8500: add DT nodes for the system config ID register
      ARM: dts: vt8500: list all four timer interrupts

 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/vt8500.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8505.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8650.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8750.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8850.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 9 files changed, 71 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950.dtsi

