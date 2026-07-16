Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94ADC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=; b=WRyEp7HS+zKKzhUOHiG1Qvq01a
	J+7OVqSy/AETY7ir6fI9jdCoB5WGGPhT5FCxpYWPF0pBsh/UfqHVBm8fZyKmT15BLLEAJPshKhsL7
	VcpjZKTasdCm/YXn5Ivz2b3JBFnIlX5GCQ2e+IZvVQtnLFYgJgKifNRGaX1Htm7lvg/XnIiQnMQK7
	p9hZI/FD4/JI81eYXJ0Q6hrHaEzYBcQCnroPDFihZXe90trBklpe4ZbA3ck8tAuk+NclFSnGv5sSn
	Lun5G1uZFaYUZX+5SHbd36NHmsNbm86K501u4oMIrATpEUsHy3oxzXwAMml8frBO0AwRAcOz1nVCc
	ar8/bpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOov-000000008Qe-1Bof;
	Thu, 16 Jul 2026 16:20:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOod-0000000089E-0TOP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:20:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8487b7b4066so7052107b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218802; x=1784823602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=aO8DUcxwyn6Ctbjd/G+8VTMtPmwut+8nsxlXRp1AM99gR6TKkLv0hCxQNZ0KVyJTuh
         4AP/9ev7xlAz1O/EqochA3Gnw7OILRMkXdhHqWGCNOF2ux5Sr99yDQBEIKNy3dUU3x/F
         FKVUkrOF4CxO5BwukFXq1Fu2Ibs5clrl4kXwwNTJCX3Zox0LDM1W6Umb3PdOPqcElf0r
         2jN05Ji5ooILpV+heJ0IRDQJ6UGX6wB/j6KyJOnxPfy0J7qWexkHhgL3cem8ebjJLQD/
         39peZQvbF2MomHh8VXcg6eNvwJPLMkxFinduwkd2tfCnIvpNY5+Tuwqeqk4HfGwplPby
         qFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218802; x=1784823602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=eHtN6ekQudsKFjfY3sraiPcCSoXjCW5BV/CmsOz6NQCk+8AKcPxhOcXEWtNpbHg9MO
         vzCvUtR8vBhIc3KJdY+XmB/1K3sk2fSEXKMN0PJ6PgGYw6CSpmFa1VWt0CAgsxXbwWmK
         orf8JjgqQUDerKQ8qYKZG+wkLJwdBdrq0ArY3mvYskQSg7Z3xGD/wLZCCBywzdpQM1Am
         +A2m9I3mkKBHgB+GdJQSCu8cnTUOZXnNwMLrVBWIZ/HxQ/JObdVvtCdYzM91DlVpzuLx
         3rYmmf3CuAcLdsqv1o+SlD4yUM9dueND1VwUY4Ay7PlUu5a3uOUU1e/rS6buexbz/Wjw
         Qv/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpy+/K33nWmH6C1GaQc7lnKDlnaGAkXaoTkLA1ks8x9b4eJV5vUTYPf3xeiM6Q4cxdJ09rxp8m5M/np8pAPyIQB@lists.infradead.org
X-Gm-Message-State: AOJu0YxPA4rKDhAO7B1C+vrYdm+nq1GelLuBz4pgNPoeaUh5Wbp8LKg3
	gOed2WU/J0RR6HM4ucgIklpKNJOQvkIXIo8bWPZvH7oB2+hYjsCokfjd
X-Gm-Gg: AfdE7cnOOUm8Ncsa5up74zFRcnLMcLwYFPZIyuEY6RvVwweReUVnOXrw5OelsUFChqA
	vucXCEOG3VxdYGE3QvvXPVdBry2Dhd2USKhqjGGvW6Nb3bM8bnClS8mB5asSFmbB9if/m4Oo5f4
	weR1ECdRf/bBW0bhO7xOZSR7ykbFHdZsxJZTka4sFW3ttnZkR4AoW8DCOKhOGZDvEcXlf47EAYP
	bAEXP96I55p/DwhjTR2jO5M7Triy6cbe0M/vwvhBXAAmt0noEMgN0LfsfqFV+6m2Rc3U8I58Mkn
	cbLsfzmhdEISTqEwietJcGxEFwTUwlgVpeYiX2S/Qpeqpxeve9bcD/83eWEBiJWEcArVaBWtYRI
	Q5Khv6PDt5jhwFnH++PQ+Hjyu/CzjyVXXVKrQB2QI13iPI0FRirei/YkDL9jxpzwrIp1ziitsZS
	lsozlJ0HSy5qxaY10+goBoWdNmb+oU2sckhg==
X-Received: by 2002:a05:6a00:c83:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84a671da754mr7414224b3a.13.1784218802301;
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 7/7] arm: dts: mediatek: mt6589: add reset support for wdt
Date: Fri, 17 Jul 2026 01:19:23 +0900
Message-ID: <20260716161923.266315-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092003_171309_4376A9CB 
X-CRM114-Status: GOOD (  10.16  )
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

Now the MediaTek watchdog driver supports MT6589 TOPRGU resets.
Add #reset-cells = <1>; to enable it.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.54.0


