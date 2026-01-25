Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE12CE63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 21:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CeTj49j/suD4Rq67+orfSKtDdidAJEZzga/o+6BRCQ=; b=HHOA/DNVsPduI/
	p79DP5t6CNkMdA8MlkrBXtK1l+h1uCyc/sTtqcKWTNs4iaCVUuDpKJfm1D54mTKSnVtX+yIHnucIV
	Xl3Dsto7vWfGAh59IvpdghmMT8mR54OsZAiOtSeFSARp39p7iFxBtgyjBfXaUJcgcgbxK2X6Cw3JW
	iD9Tk3G+9euzCGyjaXnO0U0wO6DeGyTjF+lTcLNDBXQ/ArN5EFWVxREdLwlrlZ++VZaJP3P4VWTjs
	vI5oN4rk/7mlGSMzrZOx/oB+Z9/+shNnH9/toIyizpjzAPkVndpqWC+2tTAVKs3o802gG0tcUVE90
	Fnxwy44nK7kjKFce8rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7E4-0000000BVPM-3tv4;
	Sun, 25 Jan 2026 21:00:52 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7E1-0000000BVOJ-2peC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 21:00:51 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-649295a4a5bso3324042d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 13:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769374848; x=1769979648; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CeTj49j/suD4Rq67+orfSKtDdidAJEZzga/o+6BRCQ=;
        b=S63RG4mMrD4iHx8J8NELth/S6g9pcMcmp3qT6TOLSEaRCk7NXCJKwKTRunujrLbOW9
         SWbwRhiY5IU2Ty+bfTlukSgu5+uZ79iqI4WWbKS8bCxktrAZY5iuvY+GfxiR6iSbF4Cs
         wgZJT7rUsxP9QY0vujDGYgy2J+Ilf2Bzl0Z9NR+dND/VHKdDwdVhVKGubNGwXvdM3qcs
         iK8ReYvRASNs9709LYhiLBgwKU7EjQd4DQJ1BZk8GB4+7xGTTI6VTXFEX/i5O4ly8AmC
         EGyOh7P/yP1u6S4nIO3fm3P7fqLGXzklOJ6oxpMY5Ym8a4HBTLWH29ptCetn4wc8FkBP
         tDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769374848; x=1769979648;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CeTj49j/suD4Rq67+orfSKtDdidAJEZzga/o+6BRCQ=;
        b=BJMD64mrqDxZM/3piKJ3IKcgfAsMSu5IkuGmUSNN9A/Mics+0MGQE8HUZ6LgmbmotF
         zNFCdj1ASCKNM//A8q5+lQiOzven8tq5gyCyLrxO+ctpAjqfqqyeyrg9/NNb1/Slr92g
         DhJDutLMQLvH2sX0CjUhudJQ0gwxT2TxOFwacwkXlHe6fOsWkAsI1X4/a++zAMS1pjRk
         KdI4bxkQVbdXkBg0nedai2cFheo6CHaDs1Ps0hKJb8ykMkT/VpfM4ycufmpx54y7duqA
         VorChDr3mVjMx8Ne90Q2IGbpEhu3uW59BSGxIw4Pa+DXwiR8JoAlw1s66i3jElh9KW3+
         pDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8WyEdpNvPeoMhmKZZFMcQDL6xT38Z+fJ0rv9uiyh+xqvA7Z3+g5Hkmp6OpzIT7kl/x1SkzMXJO1OfTZviDGlJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp0tj9FZfgJDkLHBsel3xvjevCipOcMe5NR546G+p15LS9at6f
	3MrgI81w5lfXKLgCB0PE4nm6Hph0B1VrJfrTmlaCqhdET69V8Wk7gcNq
X-Gm-Gg: AZuq6aIKrEuGNWSAbAZt0hMZJ7mDPA8quscdKEnoXq1eSsNliGMNry+tEXjo4b81GKc
	eYKtFRSGuaMSRKkHPiFX/SktT2OL6nr8PZmR9poRbHq4p2iN8W+q5w506F6hDgn8m1i0y1qgGlF
	IzsrTyU96Zo8d7sWvfUFwxG3TsuV4BJBRfpv5IZdy/qCOEeguF/+arE6SGbPIDqQ11fYnsm9/0x
	jCEkS+mx7StXoCFP6lxELTaSuMUTiYHJnPFPdrHb7waWt7imFd18u1bC7XDaDwHDVO5sugfebJH
	CJVYFQ34VjddnTf1ZPSCEBBpIOyNv7ZBzKBHbmerxNWaMr6QzSA0f2TEat1aGgUIRLZ8FefyMfU
	IV0vlYJ98/8zTtRVC0TRNeZKP3cPG5LRH3EOr86sPBi367B4RQxNDMAQLIyFXJr72bLUDgU5odx
	2wdLTX
X-Received: by 2002:a05:690c:64ca:b0:787:e3c0:f61f with SMTP id 00721157ae682-7945aa0d1e0mr41109317b3.57.1769374847540;
        Sun, 25 Jan 2026 13:00:47 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-6496855d65esm2518183d50.12.2026.01.25.13.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 13:00:47 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Subject: [PATCH 0/2] Add device tree for Asrock Paul IPMI Card
Date: Sun, 25 Jan 2026 15:00:37 -0600
Message-Id: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWEdmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNT3cTiovzkbN2CxNIcXdMUgxSTJEPTZIukZCWgjoKi1LTMCrBp0bG
 1tQBmdGMnXQAAAA==
X-Change-ID: 20260125-asrock-paul-5d0d4b15c8bc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_130049_776074_7667D4E0 
X-CRM114-Status: GOOD (  12.38  )
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

Adds support for Asrock Paul IPMI Card [1], which is an AST2500 based
PCIe card that provides BMC functionality. The supported functionality
is similar to the Asus Kommando IPMI Card, support for which was sent
previously [2].

Supported functionality includes UART, Booting from Primary SPI,
Networking, KVM functionality (USB Gadget and Video Engine), LEDs and
GPIO Power control. Complete BMC functionality has been tested on an
OpenBMC build available here [3], relying on this kernel branch [4].

For some reason, the Video Engine isn't always
stable when the host PC's video output goes black/changes
resolution, resulting in a hang and a subsequent reset of the Aspeed.
Applying this patch [5] from the Aspeed vendor kernel seems to fix this
issue. This doesn't require any changes to the device tree for this
device though, so I think it shouldn't affect this patch series.

[1] https://www.asrockrack.com/general/productdetail.asp?Model=PAUL
[2] https://lore.kernel.org/linux-aspeed/20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com/
[3] https://github.com/Genius1237/openbmc/commits/asrock-paul-ipmi-card/
[4] https://github.com/openbmc/linux/compare/dev-6.18...Genius1237:linux:asrock-paul-ipmi-card-6.18 
[5] https://lore.kernel.org/linux-aspeed/20251124-video_dram_reset-v1-1-9d37229e4ec5@aspeedtech.com/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
Anirudh Srinivasan (2):
      dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
      ARM: dts: aspeed: Add Asrock Paul IPMI card

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts    | 131 +++++++++++++++++++++
 3 files changed, 133 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260125-asrock-paul-5d0d4b15c8bc

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


