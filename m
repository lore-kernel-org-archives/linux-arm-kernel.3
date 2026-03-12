Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C93DFED2CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=; b=RIPFWgTyQSkYM8xRfl7zWGK6NR
	yY+Cykw/Hgyn15lN7uUx+8otpJk0qvrpPUhBqMIyTyHqwm2uUex60BsiunCB/KX9CaW94hjEIbYoM
	uk9qn4mS950kKzDjY2n73WWcWU8UuSX039TI5oDSxvamW9LHk0DqxZDD+r5ZZMJoXClNhMEOJZDVT
	1FBIcvPi3ZVBunLAEb+1Yr4fluMXE87No6KqcDA+ZGuO7hV8pgF6vZxEXjDLjV+0ejjboopcY2b3w
	2Df7GCWGKJlATqCjl6kgrNU5xFIN5Sh3iXqmAREx7vywhkqHadCk28KFIcW8YggrRK81k2CAd5sXx
	vIuFTkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT5-0000000DEGu-3iAL;
	Thu, 12 Mar 2026 04:16:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT3-0000000DEEn-0u3A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3599126be32so306753a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288972; x=1773893772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=SGQIzXxLphuRmnH8P76TQiVp7aRGXU8cnTwEe/6/Rdhe8TehkZOAO8Zl4pUODeN23z
         ZcT2RhKXmni7Wp6+akKia3sGwJ1nTXO9DXfX7q6aEsPUVylhTkcRE1VYzCyfkSoxj3BZ
         tYY2uAIeXavKHU8FCkusHkm7k+7meGBbm5rQBxjKzzPWdN5SFTwkvccwQ1v4dGbIZg7o
         0Mrmt5XXpi/sh66QoMih6E/ig92PCzGZ1dpKFXUXfxHFVLJYVbwRjfn9dpT5PW58rboT
         w9mFlE3S2YNIWteNSnOymrGKgSzNf4boHmB23VR0q+AfUVSY3O2qKKy8sEr47vLQO96e
         mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288972; x=1773893772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=lVKL1PK6kvPSinOmrKUPgT55rfodB3lMSEPxrbUpTPKbtf/hgqV9dv8z9dk2dMnUHm
         +kwzy48Uedn9gnR16wu5gYMkkh9Q8IwV5lgVBIoA31zJmcyBC7oRmXfcSMfTh7YE0ZTJ
         x5L5rz8Ay+JVZMAX1BpO/Sp0AfZrupap7OhT571WyZcdmgFAQN1HAZ6XPi55J6Rntfxh
         EWcnKLl3EnVtwjLPGRUW8FKRdxm1J0hzHyYWwz3/EwjpXbN7hURMZgX1nMb1e3DR6tEX
         GtcnUwFhr3FXjGXkbxThR2IIrCs3bWYh3hVJ9jfcLtbLpsVDopfzAjRoVUKX+1POkQRp
         kmyA==
X-Forwarded-Encrypted: i=1; AJvYcCV2zdBiuFDjNSEwqTTc4XdEIDStn2kOHvY/gpk0NDWE1zIYU0NCQ8VdxJTYlRQtRgo6+XcrY9qPF0yW5OgiQuW/@lists.infradead.org
X-Gm-Message-State: AOJu0YxgI6nkwk0qqzKw4qTlbf0DOCl0WBngtsinNHbM0oNJlf9TJkh0
	TURgK28oFyVTfCxNQkgAYAptlU7Rtx+QcrVpnyOkFFF3ImBo6IXaXDtg
X-Gm-Gg: ATEYQzziuj+kjMEk86q55Xu1I5fwu4gB3doc0o5f5FtalgzWYiY5ARpRBPnADRP/gU0
	n3yHDzGyPkia5Bb0o67XaHrCnOqeIudYK4CfuOaQquhDTGnUgZbIfs7EEWAMndPxdfwq1jsMoql
	46UMtsyF+Jy1D9x9H23j54UkCzR6axtL7La8SXm6Us9aTouzFFCj2n4y/U3nLcaYNRpmTUd1av2
	/dEfzWfE5eHJ71Yn7+IYKhsmbHuwMa+vPiAeVTVUjW05eBZJe+QAvK9kEjqhI6UXN5ypfqjQ3FB
	ssNSyU3ckXi4V4cGwO5egp6DNFBGzwLBMuX9+gc4UrY9NRkEKZ0JItgTkipHxasX7GrThVrKv+9
	l4dRgKsfSZ8bEMqATdp0HQmZi5L+yplArvozaZuHzJezH9rrs7ZLBnw+TIrR91uVGc8ScKFQTdk
	0HWaKwlIhbnmjAmQt5wRYMuJ9P6KdT9JLUMCC4WuMKwUmRr5vhXJDcCTkPJoY/gCsjlTbnmlLpC
	02E8k0=
X-Received: by 2002:a17:90b:1e10:b0:359:f69a:f7b7 with SMTP id 98e67ed59e1d1-35a012b3820mr5127239a91.10.1773288972604;
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:29 +0900
Message-ID: <20260312041533.187553-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211613_552171_2D30F42C 
X-CRM114-Status: GOOD (  12.30  )
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

The gpio-ranges in the MT7981B pinctrl node were incorrectly defined,
therefore, pin 56 cannot be used.
Correct the range count to match the driver.

Fixes: 62b24c7fdf0a ("arm64: dts: mediatek: mt7981: add pinctrl")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..1bbe219380f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -332,7 +332,7 @@ pio: pinctrl@11d00000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			gpio-ranges = <&pio 0 0 56>;
+			gpio-ranges = <&pio 0 0 57>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			#interrupt-cells = <2>;
-- 
2.53.0


