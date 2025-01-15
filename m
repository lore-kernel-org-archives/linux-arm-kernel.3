Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C42EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL96GJON5ZHK43TRn84jhnf6YCsJRvJA/o7YRaKYzS0=; b=bYKfOiHnwIlCH8sXhHMHQ39f8A
	HZeuf5PhdKbx8H3MNBO4J8mOyNUWOFrrODB2n9WTc37hnluosk3udIPgh+qRYxuuUgSQn1S3CEEWZ
	qEAcmvt2OeAkBm9NhLvVhXtq9W/kvnvkAtVsDm2jBrPh9BQjWtx8nsT+fBTR+OefZATmgMMyF97Zv
	1tuhG4JJR1+0NkLCaTr8PgQ+BB5oWPwK68is/OvHn30Iqewy5SQYA7KkyUFAt299YNt7Dqf/rH3A0
	aGq41X0/9sMq+LzylHA/PCT6XKjH9NjZp1HKBKaQmlDEhs99t8Gx9TXpVjWDeKOT401JC+VCE1FLx
	2n0/bgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAHF-0000000D2EL-0mfk;
	Wed, 15 Jan 2025 20:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAB5-0000000D1LL-30N5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jan 2025 20:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=pL96GJON5ZHK43TRn84jhnf6YCsJRvJA/o7YRaKYzS0=; b=pwp2EWl+2u8tvfBmhZceC9LgHZ
	zUO954RmpFzj+AYhdq16VrvbL6i1f1IdyLO+P+t4ufNJ8Gi+110VDurtBjTgLY83/enCcRcFQV/yD
	WmwKtksQUNUo8ZJB6QxRsaENiTL6KSenVsV89S5nLthUwRcjfAcK0u6KUuNwQNtjY3OixlVlipH47
	gorMyMHV7jZJCLBbnLFbHNtykLBlCNV/JJyyoV4z1q34GCEbsRZYQ4l6faE9AWDBFWTyOo5VSaHQJ
	E2Shs/eq3AnPGXk7b93JxKZKt/oLy3MUN6yONJ/UF6p4ka/IUQwTMcOsMFTTVCFVe8gctnGsnyApT
	fZItUqIg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAB1-0000000AwAg-1lXJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80F135C5E84;
	Wed, 15 Jan 2025 20:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D29EC4CEEC;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736973582;
	bh=lKnVyd5XjWp1qMnGaWgRYfUAnc3El6o6eyoFWI1XG2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hCKqPQfSlR/xD1Gy2i1mekScyZIunl3mWlqCqxBF94LA6YOnBcHWGoLcHmbd+FWKI
	 UMIat3MOwXmK+nRhHwSkZ3mg4RCgLe/Nntjn2Ake4KZiu4yTLKQXVqJXN+bl/8QCHF
	 EXEr/lhUZCBkV+mpEnpfnNOAj7sbb2/fgrrT5Axe8jjA7KzizG2sv7uOQKeHmApA8j
	 F7ySpri7EhHqTRWNbvIFVNNSGWLiDYScuv1pEghc74UFggDfuOkmBZl3vPZ4VSDsfp
	 +iOCHqbHH+XenpijdkBzzuJZwgFgmQ6yl7VOHaTuAKxLLkpDnnpcnYZdFk4k+plARW
	 xFUl03160BgsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3501CC02180;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Wed, 15 Jan 2025 21:35:57 +0100
Subject: [PATCH v14 4/4] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-pxa1908-lkml-v14-4-847d24f3665a@skole.hr>
References: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
In-Reply-To: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=6vZolXLVCSzdTOeYInagQh75YU9IpR7xHoGIhphNx0U=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkdsjwWDY21N7ZWfmLyC3w98w/3FJYtSmI5jw5dUPwvE
 M2ScNmro5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACYSbs3IcPrsXgPdH1F2K06z
 MM2fH7fGceXpmefncOrbZEZ/YInc9Z2R4e+u/1WeS1Qv/JnAtmKP6aZcbva5h/aYmHSalohbLu6
 5yQ4A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_203948_532955_F8F4AF78 
X-CRM114-Status: UNSURE (   7.56  )
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..caa5f6b96251a3da0f3f9d2f760b38288eb23ab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2624,6 +2624,15 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Marvell PXA1908 SOC support
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git https://gitlab.com/LegoLivesMatter/linux
+F:	arch/arm64/boot/dts/marvell/pxa1908*
+F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	include/dt-bindings/clock/marvell,pxa1908.h
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.48.0



