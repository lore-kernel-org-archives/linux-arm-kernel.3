Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC9CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=; b=kTXvziBMiL+Zx7a8cNjN1MpKYy
	3deolr7zFwFDaaBziq1vPWOv8CqaI9pjzHiEb/Ozp41tHe8Axqo0qej/eqrhEtwXf/A++VC8p9zVv
	06DIIxhY7IEApLMJQvJe6VVBOVlqbMN2du3jpUPkaVlaBsT3dwdsf3ZYfl5kwLU7mVAeDvKpxB7N7
	IgOwqhNMnIzr9NMCUqhIjP29ehjJzaEG/hfvM1joKGmJ8iAat3C4fa7dK7T+MEl+7IPy0N6KGsMSO
	uj3vVC3+W8ek8/v5j7wVxjpv0VOlrHKbh5vyotWj3pQi0A6faCAL7NnLsG8mQBOrVYc/XRkgeB5NK
	6+my92kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTX-0000000FuH5-0kgW;
	Wed, 03 Jun 2026 22:54:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTV-0000000FuG2-03Tp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:54:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso850285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527251; x=1781132051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=iVSvxp0QiHXkj0EupqbVjeStKaOqGkMSp9UUGAE0+vvuieMlkiYYNIQCLUCT9IWbHe
         JaheCOAUnq9f0WVgcaHksvmpft/q6alsTVQmg9QJv4IMSNIXWM+jSELTNMvUIq2tCCdH
         bB9xED2AOnXHdBa2lrYTF2o7LB2g7FGHkthNE05Nt9N6sz53ndM9CdmAZ/h+w0/yolhc
         sAH9q3HeDfCbi+apfU3w7/CHqGbNCvrkxYb/ngwLlZtTGFi8J3OQq3ul4q/keTuFoKgp
         5DJmzRQGi66eCKdvvsRj/bu5PgDEz2bxzWvSxWJcw3yGNq6lv2NI7zRlxhLwvZ29jmEV
         HZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527251; x=1781132051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=jFfm6GYlLPJbOGLNUHFD5pFx5Usjv/QBSQukF6SOPSwXNQOS+HTzL72NvOepakgwc0
         r/VtF2weocHQf6DMI0Fx8gG1vLiZii7qlz4PvsfTQGTT33CyhKGFZwRbdX5DiuWSR9qU
         qNHAVT+1sem0eQAur6Z42rSnR83+k0HNPrZ8Uu/6X5NhKX15FNtnmb3jk7Y4wxfoofh4
         qOqZYZ9QXEXKa3T4wMYi6cW6CXP8FLJy9qXgWB2rPlP463mCEnlMQLeewdBBgp1RgKgW
         lcQsGVZh5EfpKqVRbzMS3AB5nnQEKkStUBtbVV32bBFhKi82P0AnrHnQNu53OlGcmsKt
         /88A==
X-Forwarded-Encrypted: i=1; AFNElJ94PszoE/OoiOPPe49mQxHUp+/J0Mv21PODz3xoMxofV5uOoXxXM4hmJ6vPxKwp1KrNx94aOyrZzuRMDxhDfG3B@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSUaBh6VirMfqXDEunIo4JySpRkewjEOADhSvYhrjyo1VnUww
	6iyOaJGjU5cUdlTCUXZbE7LmbcBXUW+itsO4WAse3+7SUiy+O33GEEgM
X-Gm-Gg: Acq92OFGQhDkiaTGx+x6plTl+Xjfq8AbeLy3thXt6nvhdLpNvwS/83UZSOh6zOQl6R0
	iBiKLVZTE3UW2Co0XFftxGq5LVyHaUs1btwBMelVmjguiHleH+R0cFhTTCi8cRTpB99cvEu4waO
	aY0Hs9Sq5/Bsag6iLAhi4iSsJSohTNOyrJ6XLyv09Ua5gj7JlF7mmkcjJxa+Va5IOBl01AWp91J
	v4JqMx4pVgagrZuDJIDxZ348ZAwT3bTTf6aWj8O4szp/MJe4UK/eDm2KUHhi2gfjCJXIw19ynEH
	QxbURzTD2WXXh4iHpYEX/I8uWaoL3aYJuNVoKo7C05oKD53caRwx532uFZPGra+pWzAheNWzbv0
	/Q2ug2neo1HUxhqOoCDLOHpLfJQ6vyFUMFg8kbVH0Rp3a4sNpVJtueunwmMO/ZfaqyTMlbf/Jv4
	b7pRSFRHO+PnOlyJXvKtAnfkHr1PXV7IcPEHOs+ZSrqxNRLHtHiph4wN55MoJzWcvCovIBkller
	xrTnQcrytJg2/0Lld54fqVql3fc79Fh/CquDi0EDP+17u4=
X-Received: by 2002:a05:600c:46ce:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490b5eb0aeemr79808335e9.19.1780527250987;
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-som-symphony: add wakeup sources
Date: Thu,  4 Jun 2026 00:53:59 +0200
Message-ID: <a34f166c6376ac9e0f1721ec2cf6d1477b6646f6.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_155413_075992_82B24973 
X-CRM114-Status: GOOD (  10.18  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 857325ef4461..090752014ee2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -55,18 +55,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3


