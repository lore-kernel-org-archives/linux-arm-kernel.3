Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF34CCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 06:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YcA1zj2YISkB4BPgDux4SbMcUShtHivbuZEW/fx56lM=; b=DCxlJKLHCbdicW
	qYVJ/BnNCPOOveFcF0+5/YoRG5AC49kSHJjJeoYQTFsNF02oEcNnyIjZrVXx4zWvv2S0Paa8dRW1/
	gQoeUYctL/oNC8CQVJQoFoVskn6BUWsrOAJNBB8t439tDtZtIWR/RZxSgvHj0dw1g33mQx/3I9afW
	xrFUS86UfCTs/oTzsaFRsEEE3T2v6UPDjPF1jyLiOshHwJJ9g4MKgOeq8QNMs0ml+3XWdpTg/iytL
	3wxE0D1ji3ACbTtJwtZDaKyA3w9Bwod8x3VlfWKUeV1oGZgykN5uC0bTUBb0BAwK8UQd+d9vX1jF7
	VxczKtXfwfMXLMWWo6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKV5-00000005cx2-1vc1;
	Sun, 18 Oct 2026 06:36:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKV0-00000005cvg-1yGy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 06:36:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a06210b29fso39403b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 23:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305361; x=1792910161; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YcA1zj2YISkB4BPgDux4SbMcUShtHivbuZEW/fx56lM=;
        b=ChZkXBoOBXMf2JFDXMMoBk10RMKngNXuo1ITpN2UkW9KSaTCXCU2K4I8ZUk1flqYD1
         2ixOjZTcinf0vMUoBssU7amBR0WLNZJSmNCwWHyCh3ch9SewqKX1HlFdeFnnHfCuB5vI
         V2PfI/P7v9mpakaPgFtQ9r8z2W0klVXobb/qFginN4wsCo0BMeIB91TSdvGbgrCt3unS
         kdestFZaE4r8v/R0x8hayztyuw/7OolJKbwvFemtWgzT8EMt0KTonw1a72KMiFfQLRdl
         YdY0zH8PsxSZF1vfvA/VNDSwJkYawlA5rSCNW64VwxNJ4KBkrbHKLIbPLhlzlGwKNHYq
         7ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305361; x=1792910161;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YcA1zj2YISkB4BPgDux4SbMcUShtHivbuZEW/fx56lM=;
        b=lwnRBYAc5ZmA9Uv+6XQDybKRgVDtPY4DA5FfTz1aGl9xzisvI9t43OQlAB4Kp9YYsG
         p8wsccBWaow16+FAavcwLamj6OjnW8dXdjGHuD7el053z/BIGuSR2aVBGQ/hVpUTWGGg
         jvIEopHwnjYyvs7E85qSir8bv/IAglZS1rMwdt5tcJnYMusALcBBZy7lg3vwI+WdomHI
         0LOhsbzHX7gSlHaEzo20+p7/sR2HBI2WbC7NVlAb7ToAHCwan2L6fCx9HSAacBPNNL6v
         IzNIPaUhcG3smFkD6rU+eEpWzSiy/AJNiJ0JDNGdb1eLUN84DzW1XUi+tRCFWk+0758q
         lk8g==
X-Forwarded-Encrypted: i=1; AKwUvBzT3/aosok5ll1YdjGH6E/QqiqVMcao7C7fyDOE1cB9N6uFzu2XGIoZT91kGZXcyk/cYFFJjnXAo/R3CYZ1IM+v@lists.infradead.org
X-Gm-Message-State: AFq9FYKxJIgGAQPIOmuZrEDTgfNZKfX7u5SqUg2568pOxUZMrSPRR+u5
	pIEkiROUaDnzbaYjWAR6ScS/ZaHGrxkEwvR9MRX3Z2VrxBKfIr1lZ8VY
X-Gm-Gg: AYBFou1b1Vpzfz7Isp9R3fAZvFiL8QJay3X+WuXNqknQeZXVW/O/H/9VTWNA6HdK5C5
	tyPzaHFjHecLfoZpupNlTQjTp20u0xTkC0G+j/DUVeDC7hUkQoDJqcZGZkRO4lWgfObNN5qBoxp
	+9wVB+AD9ZMubAvKF2cyQU02ZRnfwTkIT/C+OlRJfe+e1Ey5hpuuOw6gV9y09SIaiUQ4ocB5H9z
	v/4qN+TFYzon0pGgITVTr6qPo4d/lq+2nxgw0HhoSyzOXvFl3cHiyH+5YLdG5Kl6zzcYUCwHtiz
	kAOkNwLQXNjAcBqocp4BTic722bElYMS+OfrLiWyzRiooz2TT+bJk/rkv0/yofLcuUhbSxZGPQE
	fiPtOiijCgkZGD5GC9gjshGECPI015OOMcEm68fa7TwjoUNIufcKPefR6tjmlUXSBlLBXuO3Mvs
	wl+fbTgPdRPTS2/4zOXpOG8NZ0Nd7Leh2kWtuAfabYlplqJEZCzampUkKkfjnqGyufzN9mS+CSe
	Yj6Y7uiBm+qE3zjr48=
X-Received: by 2002:a05:6a00:4404:b0:8a0:3ed7:93a9 with SMTP id d2e1a72fcca58-8a04d145e4emr3527900b3a.46.1792305361213;
        Sat, 17 Oct 2026 23:36:01 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:00 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Fix Orange Pi 5 Pro headphone
 output
Date: Sun, 18 Oct 2026 16:35:29 +1000
Message-Id: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWZUj9xFbGgBiOhTYtIxN0Vy
 2/x3gWeHJOHKrrA0cGezRog4wj01K4jCe6DIcEklyhLYSxn1hnRLlZolaelKhBRSQiFdTTw+d3
 q5rffu5n09i7gvh+QkSvtbwAAAA==
X-Change-ID: 20261018-opi5pro-amp-c46384700041
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_233602_516401_55E601C8 
X-CRM114-Status: GOOD (  10.20  )
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

The Orange Pi 5 Pro inherits vcc_3v3_sd_s0 from the shared
rk3588s-orangepi-5.dtsi, but on the Pro GPIO4_B5 does not switch SD card
power: it enables the headphone amplifier. With the regulator claiming
the pin, the amplifier stays off and the headphone jack is silent.

Patch 1 moves the regulator and the sdmmc vmmc-supply into
rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include. The
compiled 5 and 5B DTBs have the same nodes and properties as before.

Patch 2 describes the amplifier as a simple-audio-amplifier aux device
on the Pro and routes the headphone path through it.

Tested on an Orange Pi 5 Pro (Linux 7.3-rc7): SD card boot and analog
headphone output both work.

Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
Kel Modderman (2):
      arm64: dts: rockchip: Move SD card regulator to Orange Pi 5/5B
      arm64: dts: rockchip: Add headphone amplifier to Orange Pi 5 Pro

 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi    | 14 ++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts    | 21 +++++++++++++++++++--
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 11 -----------
 3 files changed, 33 insertions(+), 13 deletions(-)
---
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
change-id: 20261018-opi5pro-amp-c46384700041

Best regards,
--  
Kel Modderman <kelvmod@gmail.com>


