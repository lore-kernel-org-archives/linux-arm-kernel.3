Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3157DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWw3pYmfnmGvB+YkCO3yexV5qTzE3+kQSnnpQTIm/9c=; b=BvIjB3zRjloVz9MF/JADDQsrXe
	o2iUw33B9VKEdOAtina2/DgENCvd3EJFGSrX16jOiWEKm4B7Zc6zLkZrQitMdLeLEFoQCNv1yBCeL
	BuhXtnL72y7zKlyfQooVvNSGiUPu4gI6YElm//noiRPRv1G53a+hrFw9riH0SwuwCF2aHRLXx6VX/
	Ez61Scd3Bi4Oi1GTELCGUZbNVSC0aKJDfw8rw3QdbZPHWVXlK7s/JD45+y7rDU6xqFEagUUAjLoE/
	MLPew/f+BllEqM9kwfJK8FWOkdkhiQTdU336kYmLLdmFK5F01iSTZZp15sB6cj3vZOk57ZXEEAJVc
	i/ERZO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KLb-0000000DcYe-1tFF;
	Mon, 13 Oct 2025 15:20:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KLY-0000000DcXC-3Q44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:20:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27ee41e0798so69944815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368824; x=1760973624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWw3pYmfnmGvB+YkCO3yexV5qTzE3+kQSnnpQTIm/9c=;
        b=XLsBhV3idkhBTNtMuFhDFOrojuDps2CSULcgDvmIdzrhDOEMbIk3xNLpc3M690kDyV
         oCF/geMNWG+mvLd1FiA6LIcwNbpf8oc4Fwgjsng/wzNMnR2QgADduxaZ8X86h4xkPznr
         lK1Q7ttF+oxeF2PR69NTfGMv2Zg0jrfUY1oDzm6qXUh867nr6ShwA2DBSa1HOYUocugw
         yh1B9xU5stj7G6ibuEzD8DTEBtca+qhV9hau7YQQ87lhluDFyyCmkDjbq/5leVR05R4B
         SpeaIv1rAP8HwtTbZBFbH7etnmXIzjKmcAwTnaTMxAwvgECk3yoAFQqYh87XxDJmarlv
         Clug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368824; x=1760973624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWw3pYmfnmGvB+YkCO3yexV5qTzE3+kQSnnpQTIm/9c=;
        b=uhX+HUsmtU8wCjIo5lWpobLOxakltxO86a91ujdDU9L/0AQjl/GCfpBXYvghfknVwf
         d3athpEV5a4kVFs6tdD/TVjdszE+8ZOwXllhK0YQmnNb+8hy9Y0P4rArF8djrP+DXr6o
         ekDtSZ4IcbTQUS0JQzBAzEZ803ZHhB0zG5Lt3fSfk1OARRQEGlghM6vDVJTgDSLOpNQH
         kmmMXyJ32Qj964/zYH48Fsb7Vf8CzI4uhM5qFqpfAJQo6Ra5cvqnbcCBQR4y71OfdVvm
         EPawjYwItITm5fRvlBwxi8Ehj4PWe5szsul03AwPlJWUCWAroP69YApiXSRAbZx+pI/w
         S5+g==
X-Forwarded-Encrypted: i=1; AJvYcCVRiy9tfW6sMubx8T3XhV7nkShvfPT2QSXw/FP6M2REpQISG4Z4azWvk66RtME7wbN+R0s/blqROjnYc6ftbty4@lists.infradead.org
X-Gm-Message-State: AOJu0YyxjeVePozKQmeiDsy0PzL5GQwnWATk5G9fyJ3e4ywIoMUlLcOR
	3/hGLXfAgk9R51amiG32BfbWagSpL1oeNJ2C0jAybAZz0QYOL9rufaS8
X-Gm-Gg: ASbGncvgfORP758+pBfRZiqisY8CFcZ18ibQI/EIjGWOMnnfxFqnaBMF7/vD+bnGi4v
	BshH9JYRqEcp4wHD/dkH0v8/PQHWQsX3HCdX6FC+sCS8GvZzH7gqNfiq81OOmkg0oI2J2W3G0uQ
	3Pq1nKVRE9hfEOrA0xvwoqu5h7sAV+9Xd7WgghZwmy4jArd18f6mkg7vMCYKepZLbpMSwbAToDn
	WXa9/aWEZV/ZaZyXVZcPaSPVxaVwt3x/p60fXwZrR2GJ3WkMXy4DHDZzDBXmH319bm3q07tOvao
	G6gcJ0YeABFA+VDUsgEhghNHuNGGXxantz4Eg2UyqmIC7SQAgSUugSYSJn0Tuf7hSwRivUXFBfT
	PAUFkMYqmQ1SOrvvfO5OJjm4phHGS9pkn5IIZsQv7WrCbbIwznw==
X-Google-Smtp-Source: AGHT+IED5HSARgZp3w1i5vJ/5lba5zHCV8vbpThYRazELMLhgYDV4CSz/po8MO0H+ROXoU4f3DVC/w==
X-Received: by 2002:a17:903:3b86:b0:28e:7567:3c4b with SMTP id d9443c01a7336-29027373b18mr314146635ad.16.1760368823921;
        Mon, 13 Oct 2025 08:20:23 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05bcasm136560245ad.84.2025.10.13.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:20:23 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Johan Jonker <jbx6244@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] arm64: dts: rockchip: odroid-m1: Add pinctrl for I2S1 8ch TX path
Date: Mon, 13 Oct 2025 20:50:03 +0530
Message-ID: <20251013152011.131118-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_082024_851800_FB2A28B9 
X-CRM114-Status: GOOD (  13.16  )
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

Enable proper pin multiplexing for the I2S1 8-channel transmit interface by
adding the default pinctrl configuration which esures correct signal routing
and avoids pinmux conflicts during audio playback.

Changes fix the error
[  116.856643] [    T782] rockchip-pinctrl pinctrl: pin gpio1-10 already requested by affinity_hint; cannot claim for fe410000.i2s
[  116.857567] [    T782] rockchip-pinctrl pinctrl: error -EINVAL: pin-42 (fe410000.i2s)
[  116.857618] [    T782] rockchip-pinctrl pinctrl: error -EINVAL: could not request pin 42 (gpio1-10) from group i2s1m0-sdi1 on device rockchip-pinctrl
[  116.857659] [    T782] rockchip-i2s-tdm fe410000.i2s: Error applying setting, reverse things back

Fixes: 78f858447cb7 ("arm64: dts: rockchip: Add analog audio on ODROID-M1")
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: HDMI [HDMI], device 0: fe400000.i2s-i2s-hifi i2s-hifi-0 [fe400000.i2s-i2s-hifi i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: RK817 [Analog RK817], device 0: fe410000.i2s-rk817-hifi rk817-hifi-0 [fe410000.i2s-rk817-hifi rk817-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 0f844806ec54..442a2bc43ba8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -482,6 +482,8 @@ &i2s0_8ch {
 };
 
 &i2s1_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclktx &i2s1m0_lrcktx &i2s1m0_sdi0 &i2s1m0_sdo0>;
 	rockchip,trcm-sync-tx-only;
 	status = "okay";
 };

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.50.1


