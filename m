Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69286C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5LueQteSe7BZnxwZ8wBPpEEOfsmZYVVdUe5riM5y0U=; b=tnsaHCA9qr7QUZCV+YDkVv69HB
	eYDo/WL9NIzj6qyiMGvHpCTMZ9lzHCud1iJsYjdJeH+GQl4L1fipvbIBMxU8lDGqJsh+jGNicS1w9
	6ij0iDO9T7OZ3WyUWOC31k4YfzRplwAJuw5Z89nkTqus9RLjAweCQWbGOSzUuIpdNYQMro6GkYYwM
	XwRsTSG8sa+hKY/f1dPnLNwruLEhCR9HH08qPvrwE4K1koboSmjWF0EUB1iCh443aTDN5fTQ7KoHt
	N6oOirAE3CaalotQpwaaJpVH/cjKrYVcxSjeMRegY0PmVgbyuWiMkmYs44ukpcz5OJ7yZkaTgI3x7
	BqhwdLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG2C-0000000D2hO-0hoX;
	Fri, 20 Feb 2026 02:14:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG27-0000000D2fP-3kiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-824adc96ad2so1602482b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553659; x=1772158459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5LueQteSe7BZnxwZ8wBPpEEOfsmZYVVdUe5riM5y0U=;
        b=OSjU9Ur6b9stREfYUHmHh94j4ewRA2ySd5JeHZanilNP+wpjUMky7tHt2kE/RIcdoo
         8jwIc+HEak77cHPkoYqRoklJH/JFu6Fx1AQL3xhEfGv5157LosLjjSK0HwQX7HeBm/hF
         j/n3QkXXvqZCcQPMgpJcuyVLwc279YvA/dRR3oaKbR1WXvQL+lOLcBPTbBsOwurXjrjx
         9reYqin4yXVK0axKV0dPwfTUVGEetuIGZ4jLQY+1Oj7MvxCkL+VKefcPWLiI9HKAwUwO
         LzHlj6RYpx52DiyOO4DA+qDki1QVMa5fPoFEMlnuMnqzRtGBUwPfc14lDxoBsRr26a7X
         xZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553659; x=1772158459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5LueQteSe7BZnxwZ8wBPpEEOfsmZYVVdUe5riM5y0U=;
        b=qIaxz7tvBuVOOwRvpr76ii4b6U3U/FDWbiEeM1jsVLfAASg0XROw28gZdKCJgDR5jh
         /sZcaWemxjNfPndYKObFIe6aPzIRa7gynhPn2wte5REztF2Mu3wzU6vI3alzCdT2fEr8
         VrWvziJdcAyLn/uT6nZuEHpklVwQih4u/BDB2+AZzsDacnqmxWpdp8aPk5RtuTT3he/g
         AUHoceKFqez9l+L5a+zxAhoouKdH9T7t/C1xGhK+oqHW2kZudtIj7F1JI36qrCqIn5P+
         KkC+T6/ignNo8EC33uo7JCqpg2ocp2UFNPdiz9kvyZc2tBt43lCffWzGM7kvRgdtMrA8
         ZWhw==
X-Forwarded-Encrypted: i=1; AJvYcCXBVdpcuOZRP1ZVvELUwmf0/+XUZDmms+fVg+6TNqzoyBDezPwF6f7t3LyhdvEVzPMeayBKv1pt6xxV1uIWlBtm@lists.infradead.org
X-Gm-Message-State: AOJu0YyB20sHPmxYQW59grq3QSTeGO8HIyFIXltnq1XfH22mNZLrO/a2
	NUq0C8L2mjpwzwbB5u0A4Zbxakyt+Dwa9DB1w69J6a/Z0HtIA/sFFV5q
X-Gm-Gg: AZuq6aKFosvWByfMY0GA/6+TsfwRXRwiIBN0LP59NPhCFD83jZroEJOJtMgvcAlJ+cs
	qd5LBft0HnnFBk3fSGis/QAYm1kN4ZPsvDLKifuGQZOUL4EMXuN+Upib4DvGOdODC/XY1gkIagi
	fvEuhdlb85tIalaEQnLj7b6MEVqiY441o9KOXeoNjHVsb+jSUEngTQVdSK0vce1jg2AVXX7WFlq
	NPcJueY1Ho808S8ExogZji9QW69oieettczQLrbtowqCV+iEYEvdi+RIToayYlZdtx6qlHE2cip
	ajkMgeLTg56+9LEnADcmNTa5J5qKF51dZV9iMgZ3L7NJOHc6G0udoZ82rxNyoutiqexfyujFljE
	8ejoygIQoAmq7l2MT+2/rCm4ztaBo50NGBRKKUXeBxg+i6p5AvtR7PC5E+vbMCRRksFrd
X-Received: by 2002:a05:6a20:a108:b0:393:74ed:7de6 with SMTP id adf61e73a8af0-39534131955mr246948637.10.1771553658912;
        Thu, 19 Feb 2026 18:14:18 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] ARM: dts: bcm47094-phicomm-k3: specify switch
Date: Thu, 19 Feb 2026 18:13:53 -0800
Message-ID: <20260220021353.40554-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
References: <20260220021353.40554-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181419_957124_7F48C97E 
X-CRM114-Status: GOOD (  10.53  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3. Also allows setting the WAN MAC address properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5ed284b8f156 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -19,6 +19,12 @@ memory@0 {
 		      <0x88000000 0x18000000>;
 	};
 
+	nvram@1c080000 {
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -38,6 +44,43 @@ &usb3_phy {
 	status = "okay";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.53.0


