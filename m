Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80518C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lIi+33qeuEkwNBz/fk+oqvqVziUPzN6OFpjduAUkZHw=; b=ElgNUjL/z6Vwr5anBgpCaeOX3p
	vqnk5JTX4bJwCMZn9b00sFZSEoJV4bmdyVksoCIGxIf28cKgOX/atHdBw3hURqom2LNxFueXaq1vB
	jKCdp8mCgE0WHka3moGkgrRL4XwCRyxPrVEWFkYyz49lx4CD02B7+PLfxQ24yFAitfQy3cf0Y0QwK
	T3S1zj3rIiB/mtJhUeWT1+MHSq/RaQrNDwsMmOnQcCWXNY1IQ+LGYoEU4vS/M/IGD6BqsWDi5MtN3
	J4W2HcR1E70/kp5U5iZs8mTgkmLHAK0UrqsX3lGYY90rATU8Zu27SDZx6TwTZfckj26YAj6GCar+i
	g0pLniFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zpC-0000000CmHl-0Ytf;
	Fri, 25 Sep 2026 06:54:26 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zpA-0000000CmGr-0ivp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 06:54:25 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso3712715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319262; x=1790924062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIi+33qeuEkwNBz/fk+oqvqVziUPzN6OFpjduAUkZHw=;
        b=c5r1xifNEYvWl/HMRVt3MlcNjBcEQjNFVHadTXyhop3HSDUQQU8pt5z37P6HR76V0E
         q9LSnM+SJfFRPZ+XVMqsXg2HEaFtc8nl+xzkI7zYR4g20aqWceAeCAMnFlXUHO15FAtA
         JXKIWGeq7hVx+DW2591pPlw/amCRKWSA7Zq3T/NPeuiQk1kKiPBy+88ywNJrlmfc/NEM
         EDEvUdHUqfmFFb7rPZ6ZJeUAa/IIeK4PE/PB9O09RkLv+x8DfyLrSCWM3j81v4/E34yR
         EuepXgn9cOxqcW0NfpbP0UuGWOjgIk3bLXP1Ff0UaKg9YtTLpoyi638jad17VHGBDM62
         rBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319262; x=1790924062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIi+33qeuEkwNBz/fk+oqvqVziUPzN6OFpjduAUkZHw=;
        b=f3CVywNZ5LAQUIzw7a6ugPwi+WRG8yCBW7/cWC9chktv6jNsH6VXfoeVrbu2VrMPKP
         JSWHiv5eRIYu0XfTpLG+lDFCRniDCxxGI3ojmNK0hySEL0a52Lc+9oewNK1m2MOlqKkc
         mWdQI8OkUaISKmVkpyRtejqrz8ydLcn+WDsSGdFG9EZOK0EJ5ZaIgpbilC4fC4PbZaRR
         uHokRpcXd7hsFEIfmsgenWOmB504SlHFXTKEclBb1wX4hvubEzxfI/0s7xKyuh2fFiQU
         jErR5zO0ODw7ogYyJNIkAt8zvtwsg3swVxqAGzFGfsiL5PYkHmcn9srixJbxBZUMh+PA
         Yv7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwU/ULo1dfhRqicsytTf50i66nEtVS7U6bcCspL4U0RvTJM5QEegyqf/pWV0DtLGRz94mb1Q1L1QNcbfshPrrws@lists.infradead.org
X-Gm-Message-State: AFuF++naR4GsPO77nsqIO0xydtYEnA3gtaHtfFb7AaAYQpjXO6WdeWVk
	GVSSbzI1ONu3Am8Q3qgUbMyBgluNEddKpJ7P61w8AXKeUhHMsgznvViP
X-Gm-Gg: AYBFou0E/YsQpnYcvwuQwJNm0eIwTR6Tjr3sYnC1p2wNpNEHQnxuRJbD054Ksn1fZSa
	NPD9mv1cvqwyrUaX8UjXFpcG6TpxHTDGNR0go2rcEfUPv+c2wViyONkTXNxT9tYqCrevyThilOI
	Vq5ICcbxcfHu6kOiLa5f0+Ba/V+7P9fn+UWdZfLIXbbWHKanYQ1uXQiXtdM8FE3GjZUnaU9LzDT
	bP1gr8MhScSo3Mhvc5odyNEY+SiR3RDedp3Se6sR8I80S/z90TpLKqhVIGp8G68vLNLXKhInoO/
	PP6eHSwN638RbfPhKanUH34tA5JfNnexMo6do0sEXD9pnZPoNduDzIhUS7Z5rJriGDjyrn7d1SO
	Aj0EcGPunnJeUJjXfGN5NDD0+Gl6MYRCet2apvZzyWy02BYyvwD7fkNRjOX77NQGFF3s8T9IGFq
	6umKVXI60BM3HG1q8HsI/6Fvwx7dJ80LiQoFeTX1/pWk75JnlZ74o/r8P82MFMbkuSLGGCY8zb1
	FvRm3fl52jInncBM6KHF2vESDed7Z+e5JOE8KUvOW8UIK1xich2Nu60GKOFKzyqTyD85eY6U4+7
	mEYP018a7sILHKWs/45nx8EcakiDBHE7q11C9D7vD179AKnYL4JSOJYYxsmI5VAjMjtgJEFu/+t
	KrgxyVqJf+oDR2TCcpy8=
X-Received: by 2002:a05:600c:8b4c:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49fe66eb0f0mr80244325e9.19.1790319262338;
        Thu, 24 Sep 2026 23:54:22 -0700 (PDT)
Received: from cypher.home.roving-it.com.com (78.45.167.195.static.otenet.gr. [195.167.45.78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm14424155e9.13.2026.09.24.23.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:54:21 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm: dts: bcm2711: Add emc2301 to the CM4 IO board
Date: Fri, 25 Sep 2026 07:54:10 +0100
Message-ID: <20260925065418.2248731-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_235424_231766_47BA4F3B 
X-CRM114-Status: GOOD (  11.55  )
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

The CM4 IO carrier board has a emc2301 fan controller. Add
it so it can be used on the CM4 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 8e45de01d2ad1..4f81fbdb85b56 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -107,6 +107,20 @@ &genet {
 };
 
 &i2c0_1 {
+	emc2301: fan-controller@2f {
+		compatible = "microchip,emc2301", "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		fan@0 {
+			reg = <0x0>;
+			pwms = <&emc2301 26000 0 1>;
+			#cooling-cells = <2>;
+		};
+	};
+
 	pcf85063: rtc@51 {
 		/* Attention: An alarm resets the machine */
 		compatible = "nxp,pcf85063a";
-- 
2.55.0


