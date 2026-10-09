Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0582FCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jsd0JpgBhsTvGtvOJRvJS50dBS6V/UrxPmS+FjiCk7A=; b=0UcAwQzUNXeNK+HUwg4hU19coo
	uZNidaeJZ7TTDBM23XmVMqbOmzpiArvGuIpx2D5vdz7wD6XKC3kOsSSWI3Lxx+sg/oFcWWx75IySd
	8nCXIQCKXJEWGoNTQvqEbivjS4zkSSF/tqk1o67uzhhcisAhfPFDzUCdg7lqz2Iz4UybCRM7dO2/9
	Y1tkXaZDKgmTUaF8gf25Ot4IZN9kewbr3uMyC5J8uFO7DO3QexHBXKlJQbZ65kknaEHbhprGupENi
	wP0x8zmKmJh9e7qA8EYmF2FBq38yQxn8AQxLWHEr8u4REJPp4iM5g6c0upEyoE2qdsB9pzl1t5HiK
	udIeCaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8L6-000000067Zp-42Og;
	Fri, 09 Oct 2026 11:00:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Kx-000000067Vz-3bOf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAEB660534;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D81C2BCF4;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543625;
	bh=+tZNSX5k1H+sKgRoo1wVaQVdEfZrw4ENU3AszdLQqmI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SwJZ+f9omvsnBQqVSmEssUKkdPl7dItTYyIj0VFbzHx7r9NWtpEkaAMAVcWsFn+/+
	 +Azzwf93NoGRHmn0GdGYG2HoaG2edVew+1lmp9jdmzQz6C/SZH2vqPiHwf9+oi3sXH
	 uHBg93V8fNOASMTnmOPSSR7LKh7fnCT5ujnX3Rtg8+utCzanl1pPaiuVooPyEt/pOG
	 4f0991FJvlzqaXzUZZS7SNXpytC/9NpSZpm3qDQhfMWRlE3UUVch+Ucbb0WIMTtc5G
	 Ka6lQHXrkrtVhP/NOHNUTu+IFBW0rfb//5A3ykP5ZRk8ZEJZbcw7GKdv8cjZrfTnpf
	 TjgU5xiF0k7xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B40CA601D;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH 0/4] arm64: add Ambarella CV75 SoC support
Date: Fri, 09 Oct 2026 19:00:21 +0800
Message-Id: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXJyGoC/yXMQQ5AMBCF4avIrDWpilZcRSyoKWPRSgeRiLsrl
 l/yv3cBYyRkaLILIh7EFHxCkWdg595PKGhMBiWVLqQ0wh6mEhysQK1qV1bGSa0h5WtER+d31Xa
 /eR8WtNu7h/t+AP0El3tsAAAA
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543624; l=2687;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=+tZNSX5k1H+sKgRoo1wVaQVdEfZrw4ENU3AszdLQqmI=;
 b=9A1njMKYc47+mS3RQO11zurFUDOCK/SFzr14TS4vhG6bLT+9X6m1jepTq0ByB83cTsLT272Ex
 USgQZlGOvtMBv0vFKJc0cm7JWEmpH7Dx+2hfnOEfMKa0GI6NH1bzSQb
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Split from the combined CV75 bring-up series. This series adds the
ambarella vendor prefix, the board binding, the secure scratchpad
syscon, ARCH_AMBARELLA, the CV75 EVK devicetree and MAINTAINERS.

The EVK devicetree includes dt-bindings/clock/ambarella,cv75-rct.h
from the clock series, so it does not build until that header is
applied. The devicetree also describes the CV75 pinctrl (already
applied in the pinctrl tree), GPIO, UART and RCT clock. Those
drivers are separate series.

The MAINTAINERS entry lists all Ambarella files including the RCT
clock files. If the clock series lands first, those files are
briefly unmaintained until this series follows.

The combined tree, including the other series, was booted on the
CV75 EVK before this split.

Link: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (4):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 +++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  14 ++
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 10 files changed, 259 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



