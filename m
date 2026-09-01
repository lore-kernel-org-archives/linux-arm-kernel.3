Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29878C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=; b=H1dNR/zVTidG2uRa+aaJuQ6CNd
	F8cw0bbPC0cagNMrz9Gp5+DFVlfeY0/AhqhgCDO5XdWnpvgjV7aeWHC/7AEIHI1M0PTHlmUkDWAGa
	MRPjaL5WuTKjbFj8eD385Bit/2l+speQOokSQjJ0z5jnjSaIzBjs3528e0T9Nw1W1qXsiQ+I94C65
	maRSwuAYDNYcKBkJlMeGrBpTk0I2ATxs12jvFHZ7mBiNqtC17dbqkvM7itsyqmKBJzdOOL5A9ZWTF
	4fotdX+rFtm3UF0FaHxread8QJFAw8bNq3nhg7yl+XgX1JlUzC/L91jNwOXKEDr81W5DYm9Aqou+i
	H9LbHyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ecj-0000000AuUG-1Gti;
	Tue, 01 Sep 2026 02:53:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ecd-0000000AuTK-0rQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:53:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d710632717so36193505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231194; x=1788835994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=Jin8kqbsR3TsUS4G/McFUSo2bXcbxYolzzPlNB1GRLs4KnLlU3I3DIfyrHqDRuIltI
         7EfRfv8eA9jn4hYoK7sc02UBf0Aw/fq6/CNwnuBPrlBviazKikischQrp3p9kmPUf5UY
         i3ECSvSEH3BqIIwiUEWTmPHtB7Qzwz1gWiRd6Pbwh9ptFc5a3epsLnWBIEswqrqTG89Q
         8X+fuDiBHlFYTkZLlcKZRBrrWqetEHWHKZKA0ZLMTZDln+zIJgvgAtkce6LcfYA5Rs6J
         9EsJj5L4AOHsDiuMb4qNhhbGmihe3aqDiaqz7KNZZrU5X76ULDj4nn7magQrp3tiExsM
         kBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231194; x=1788835994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=b/HIUt2wb424W9YPPzQyr8A0wQ2L6fa0X3h2xQBTfwztLB9vsrAdgzaJbx/EQ+a59E
         MYNu4b5doL579Ij5J/PMFKeXGpclgemqbRFM6fjmPikxEgLis+KwMqfK85CmVWGNoV6G
         cd4iItdt77DGH+wgkVWfd7gmTpolVOVw6MjIRQ5AuMAbBnNbt/5vmai95WvTBDcO7auq
         5PpoVqPSt1VDavRN4PF1lxDMneaKPdz4SYnln94GUENBuO+dqwuukg7WqJvZ7GhqLDqo
         Q5/ZzOoxOkz1nNpEZ2SvUgdGz1CT8nFMBtCxXSMVPXun2coGDdfSMsT3cZaIi7ACr5C7
         K+JQ==
X-Forwarded-Encrypted: i=1; AKwUvByK6o9s7c3eeeJqyO766zjKcCQwS/CHK1HSrDIX9/Hp7hboEzw+BEK6X17Q0N5wAfdLBS874FuffstW07UMJaPG@lists.infradead.org
X-Gm-Message-State: AFuF++mJIPKF7CmEV8rwU1qCjnsdK8QeBVUonwz3e3M/e4XU85KWNQbB
	Zr+U8EMfhwMFRb9YAgpJTAZRJCwt1GgRX9gYgdEuzZYZN26fFDG5q9Ic
X-Gm-Gg: AYBFou2eql5D+/m1vSLkF5iG+TrY+Q9JPvkx4bkwAebfr8AKAyotbVcjPnYaXMiBxa+
	cz5x/hDPynotn5DcM16c6kCtC3DhJj1yfos4qmBSAComYXIdDoTyx26rFwwt/hQP98OyxIq8/6W
	UEwBMthzbLA1FvpnEsAUQ1Echr9zKBQI4iqfatGVYX/Yv3gxNKboA5v2RBLQg7OFyklQGJ7NAkk
	KHtWBss2JZzeDmNpM8EwhPcRjOTJfd6eSkLOvERg1wqRPpzTLJ7kF07r4XH9u2dSuv7Bvcd7MIg
	LD85pg2EO9wDc+ybgwW1FM3nm+bGBn7R7HLYdZySYbRxfFXlAIA+Th+ObNC27zY4BVBzNK/DnAg
	0uuoBOzm3Yp8gj+MmlAVThHWuR8C+wrPZxxbJo0FhH30J02O75oRGZi4VRh92jNpiqR2EQF88QJ
	D1CQx1j/9r2CzTfwBPQ0sjKK30vKaQTRH+IEyCSaUjd08k8tuAgDOYPpzLlaHbRuGYY6Q6htmXA
	IL5tjJQMJ4aTwig078ca30G7Z6EUeJ6rO2I6qyn5PcbOldwTvl+Cm7fIIPbX0zrQFTiSifR7cuo
	j3Vf6vwAFnRGxobK1VeegaX+qjrEkocGpkjfWg==
X-Received: by 2002:a17:903:fad:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d74dcc2d3cmr460608505ad.8.1788231194184;
        Mon, 31 Aug 2026 19:53:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm37613800eec.0.2026.08.31.19.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:53:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Date: Mon, 31 Aug 2026 19:53:11 -0700
Message-ID: <20260901025311.955936-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_195315_767420_AE97F9D6 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
allowing the board to be woken from suspend.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 176198d99c26..e3376c703cbf 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -87,6 +87,18 @@ fault-led {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&microsom_phy0_int_pins>;
+
+		wol {
+			label = "Wake-On-LAN";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	io-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.55.0


