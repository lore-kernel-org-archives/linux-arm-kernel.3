Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C2FCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=; b=Pz3Tg2ix9QNdJFt4H/Alf8xKXZ
	sJzs8fjKp39xEtAdKBsyfgSSCWJjFkmHIe+W2mHAdCMqfdHrytqzUOaUnHcAALXTY7zs6vogFA7uu
	hEExYUmyi8VeVB/TQ1pwNNzxUweU23759LUefZL7OVTtKGxNLiluXkgRnHikLYnPOe4xx+6ohGEsj
	NFKbwx8qCRkTIVSS+281JULmDOUKwmBnFKJalxHOI0WqxPE/pc5N9Y+1k4CnHnr8Lfnzd05CGc6ed
	tuwnWH0iJAs67p4BKgT+Bp8qkn9h/QhlOfE48f0GTuA2jtrE4nD5bU800CtMoNCMGrbP0UlOWq2Ou
	k5jD9qpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6i-00000007rmK-3FZc;
	Wed, 24 Jun 2026 13:57:36 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6f-00000007rkv-3wC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:35 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-963a722ed59so389009241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309452; x=1782914252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=a6sCkiWhjr9idD8/rhmhFBH3NcSMDahiurXI0ry4IIZyLIWvCl1KOvfL1rQzFdQDZe
         Wkd5Ml+JeaaG3cxydrzuNplttiPZZ/fsv8AEYu5b+3ZBsldFrzEqWLfnPSOKoD86nYHi
         TFvWdQLpDYZjEkYSGvW4ct0M8yTEvNVv0ouWeOVxKkVJt/XuHTbZzQDTf8R3x/FaKnFj
         V7VCqCpTJw5ac9LNlI9szoUuWysjNui4fRs6vFJwbNZVBHFIOONebrfpzhLDvoogwz5k
         9uJV1g2Lle4VzrEcFXz3K9ByaR87lcXH/wwiQty75WmCsjs0svBCAL695fr/L6DwVevO
         A5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309452; x=1782914252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=civn1aQs2thQ94LlT19Zfydr5oe5b9zuXwQGcksOGk41WsZPb/ABMKh/YJ3kLHcwnQ
         Z4z6EdzQKgGMH/9WwOkk4hBt6qvwFUsRnd5WDunieMCHC43XYoY3DTiIxiA3G4lPCWIV
         XkJUB4755O41sXdrg+naKaXmV6ss69vR4ndPsbIPb4jr0KevS8wA/uEXQfC9SdSPcskz
         GQF9BgI4HptUlMWzy2ZhuNwGbX4whMnUCmypCFu3CFwFNqe9XpR6Y5ckeFGQZmiyhNEm
         ljwkLh/7ZqBDXhauQFJmhkuDMJu1sp5hO0arXy7gEtTcJkicbuqi0jv8BULGJ5KVS9t+
         rxBA==
X-Forwarded-Encrypted: i=1; AHgh+RqebNBDr/2c4HaHbDpXjtkXzCW8dIS2EI+Hh6cUVXvohOih/cnYpySwPij3p1JikygGZ+VbLfDZfqHr22l089+O@lists.infradead.org
X-Gm-Message-State: AOJu0YxscWyUdGMyNYdiiNeymmWqyGYmxEyGzmYIniPaPAddQq0Qj8um
	N/MN7Wld+5J+rW08kkSTwcfcBH74BJ8OE+//X6Vkpya4mrYPdVHGs3/a
X-Gm-Gg: AfdE7clRCFAG3NZLYfdBrIr7Ht3JYsWURuyqTO51FjCYusKAzUW5R/yf4nBMnhT2M+T
	RRLT8rnvdfafn5mf2qPJ4ToTziniUTXeBVsCDZEZzkL4PLEG0gQhXp9cwi6hW57TT0UpVMJvoku
	/VXQax3QJuamjViEQpSSburklLf9yFUrQEv22f3WpAXoTg1nVbLzf/yxcDBm08LsULwUIrgenx/
	RkEDN5/7Hz3B3z8nFjcPYpttI21cog5piXuqs9E/ZX2G9JH1Uw1+4O8WZbocmgPDx8YR4FEKcC6
	H9+05qXkaCQj/UwpL7l1j8QQ25wW4V691191FkqBBjLa26t7UlnMEp6k2hLM/svkrCccB51zcej
	X0PD2ioOQ+bxS6fpqNz68h73Jn6qnGRPZLy1GCE5iI1HKEZau47vIqupYY3JVr7QkDhfPNmfaY+
	HliTfFSdzn6usY1IwK1r40dNuRsU3odSPlGQI=
X-Received: by 2002:a05:6102:26c5:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-73114f11320mr1562339137.13.1782309452608;
        Wed, 24 Jun 2026 06:57:32 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 24 Jun 2026 21:56:41 +0800
Message-ID: <20260624135650.727077-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065733_982154_0E6189D9 
X-CRM114-Status: UNSURE (   8.61  )
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

nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
disable nfc nodes by default to resolve pinctrl resource contention.

No mainline AXG boards enable nfc currently thus no extra DTS adjustments
are needed.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..6457667d974e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1999,6 +1999,7 @@ nfc: nand-controller@7800 {
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					 <&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "device";
+				status = "disabled";
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.54.0


