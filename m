Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C769C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=; b=afbadwJ5vrp3AUc8k2W9i2Iebc
	FPyYMUE360+C79D8W7ivgD2DWKVN/1R6NaGtTcaXEXYgEGHlHpEgxBFOXAX293LbRQiQo/wbmj+FJ
	6S/fsL22nKjXwNqTgBunEPHrAm5wIrBMJF6db01CjEn6uYr2vk92wXBt1dJMdOxSSaxD2I2NUmlCH
	Y7mEDYSsSMk7+BiNWl87dAlCjB3T0guvBRaKZ/rL/K/t6KEcF2LI9ipI9mOEc3PGKC559GySaMXfQ
	9ok3ujPyD0ED8ymihnnpwTQTmI+VXmk4RTAfiPspDrKuxtIW8AFWyi/yHRLjU1Ufn5x9NhQVwX6mh
	dVaZGb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Aq-00000008YHc-04hv;
	Tue, 21 Jul 2026 06:41:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4AY-00000008Y13-2b2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:41:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490d6730461so11236765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616093; x=1785220893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=YfAqwZqm24mk0xZoV1GOYZfQOt+Xat0n/0irEZS05crsoKT2hzsPXax3S5aYbkFpWg
         QkuUl4qgigXRDs+IYILjK2bcw5OO3F7YjZx4E77eVfcGIMIRuvRJ8EqvGebz8rpJq9cS
         oYYtJrdTiNzl50K8ZbJV7szAp8cmO8JHhYv4L+vIahS3hmqhxD6mkvJnhJNgbHC9+Se9
         KTTT3MqUdTUt9taq8c4vq1QhQKZsY/8aXovKwgCxuMYljQJ2mNuFfno1Y6eARZSFlcYa
         nyidUgasu+35ahYOxWgh4XMn/G/HKAvlG2gAn5oKg1dCvGGQAbLl2McbVTwepHsZO9up
         +rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616093; x=1785220893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=DoalYVRMr1KGq7DJJm1UWyEGfLNrH2V5IF39xEGf6eA7AzzeFuSo+iadnxusHW9kxs
         uqQ4ggDqtacHY6HaC4ae21bbgRaDVsyhlkl+trlmmP1kzXUJnvZpbESYTS/uK3cvMYgy
         6E6ZiXgGcyxAeh+sVUE0mtKUiQBxZOow2tbmkWPlLysp2X21FjXRQkqfK6YV/Wd1jmf5
         qONkdravgOQ/s4vMP3jo5FShYN5s/BwQuBBHlPuG3ed7mzbezXYV/QzC9gtVD5VbBZ7e
         m8IishBOJdAhzq6kOGfbMcUYto1Ztv5bDrCEDUP49TLjS6XIe/Hg2iUeLgNX72HJrZr3
         BtHg==
X-Forwarded-Encrypted: i=1; AHgh+RocdxJymsXcEeGtBsVQ8taCt6LOomTBJEDfs2Nv2mzE9mXmgMW3IDfhiLh2uAihVBhruK0mUIp6dScLfD0hl+jc@lists.infradead.org
X-Gm-Message-State: AOJu0YzEIG0Pc2McabqnUBi0KYPWK4o7HinnlzJPNiUt/ARe6T8iu3R1
	VcBLGrG0F2RqDg2Ai+Uc164f2ZFeHejISprPITsaDLGpv2EQtk1Y62S6
X-Gm-Gg: AfdE7cn9hiuhECT4vWjwi6lTWrbDanhzp/1txNFMmjkiUgyOPBLjeYB9O6d1057FZxX
	0hH/yWpKx9xJVRcyOXty/cyIeoev+Cu4hUblYa/8DRM0G9ombd27z35Bj0E5PxjApJZBk9MNtok
	wfdjrMqebaPQwWCok9azId6J2HelNT7hK9vElgw69nq43AakAbeqUuqMTY89MwOGyHZeiOlkH76
	VUoAee//rApNzTaBIAuUQFRvqDmXVRGZnn5sQsLCbvcAMOopPrOqsvywsqcDmkgzvAasYfRaQ+Q
	bwW6TxDarKQa7/sFRw76DLISKOvi4NojQIUtBR3q1nkhn0v8txX0s9AoSUxS+1CUVfghxEspRVR
	2Myl9z5tu4d9sK7bxARO+1EVYDEN99wm3VrrZESvhA2Nz1bOLI8Qj095H8SefGj9ocOeGeiYfQf
	kSpIOZxRpRJ7oURdnXBX7Ww2XQhXjaxPjroLolCKGZvYFqNs+VOwSAOIRNPhb4Gx644banSwngH
	SBtLxsSj2k=
X-Received: by 2002:a05:600c:4584:b0:495:6713:9a62 with SMTP id 5b1f17b1804b1-49567139f63mr6189235e9.1.1784616092535;
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
Date: Tue, 21 Jul 2026 08:41:14 +0200
Message-ID: <20260721064115.64809-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_234134_695976_4E830AD9 
X-CRM114-Status: GOOD (  13.53  )
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

The Synopsys HDMI RX controller exposes two digital audio interfaces,
one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
property so audio cards can reference them as a codec, as documented
by the snps,dw-hdmi-rx binding.

Add a shared simple-audio-card routing the receiver I2S DAI to
i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
the receiver as bitclock and frame master. The card is named
"RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
UCM matches on. It mirrors the existing HDMI TX sound cards in this
file and is disabled by default, since not every RK3588 board routes
HDMI RX audio; boards that do only need to flip its status.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Sebastian Reichel):
- define the whole sound card here as a shared, disabled-by-default
  node mirroring the HDMI TX cards, instead of per board
- name the card "RK3588 HDMI-IN": the name is user-visible in
  alsamixer and matched by ALSA UCM

New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..e0dce15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -23,6 +23,23 @@
 		};
 	};
 
+	hdmi_receiver_sound: hdmi-receiver-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "RK3588 HDMI-IN";
+		simple-audio-card,bitclock-master = <&hdmiin_codec>;
+		simple-audio-card,frame-master = <&hdmiin_codec>;
+		status = "disabled";
+
+		hdmiin_codec: simple-audio-card,codec {
+			sound-dai = <&hdmi_receiver 0>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s7_8ch>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -338,6 +355,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0


