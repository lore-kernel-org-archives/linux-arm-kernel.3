Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2216BC531FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=; b=we0ZNitnRno2kZbKB6Y6IbwPz/
	0iKnr6Z/l7bKSb48CYgn4iMAZ7UttRcdEJufPzGVDt4oiEnjmNbSpWDhgpVzhft5Nx/c0yAqmB4Lb
	uNIOR0VVy47FNynOb2ti+7wIyA0efw8on9e1VvZf1lfwdWVcv6maxkrQCVvNFWvw9wK66zy5jgHKp
	BN+90vfOt7DhoGQr1CYWhtKoLDtr9W9j5/WYFl6hsT8Vk/lRhwr+lH/+5iAVuMIrBT6yh8xJBeWPT
	lmyL0VHcrs0ZVV/mtM69WTvJ2OxEAWMdLWJ6KygKQrPgiKnmdKCAx2xB52mjmsNHgB08wEpoh9nKl
	gOTGvHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG26-0000000D2eT-18P8;
	Fri, 20 Feb 2026 02:14:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG23-0000000D2ce-2RIS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-824a9348603so663773b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553654; x=1772158454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=;
        b=dyfCw3c26F0Ut1dfwTPL3c+Yd0LnjMYBHV9yTThMyVSTsIDnLNvxY/QTujIdBho25r
         +VN3aULbN5JQq16UzUo9vs25piSIVXVK71+THMqhD+3OcSe+XgBGSjKv0IgfpqZYlPbO
         FXntDUHYFzSHMjIotiTTenFiChhlmtAkVAAh/gcThRFlJREpu/AqriTvikv5lzKrglzP
         y4HEf0EZCmeOBSjzNpDbzUIzCyfBg5hzNsNLTewFF1noQYcEh1Lu3WsRdqIMLYP2Yjiu
         1sbmSVqBIQIoH48z1IU7pKTX9RqIQMMHe2leJAfnU5eWCIGUKO6FyGT3DkxIA1KXcp0B
         X7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553654; x=1772158454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=;
        b=JiYrdABYc+N9mdVDoLzmk/ttpZ+thQOUpA6UFn2gw2wrMVZJG/3Mj0jXjgSpVK/Uqf
         ZkcPMR9/d15g7/BAZ6bKKcKNpUOJkjVxdLSi1lngFSdniXa5dDoxvxJkpnUBOmlM6aEy
         BiVsSAUfGc6PmvpTNASbRgJq6t2saDjHM1JnxpM4uF0pI5SjZXv1Z47Qa5fXHLyv+pKG
         k2R+lHDvnRt3XFPAeP4F1P5EDb5FTn8r1c4+UV2HfjlAC5AVFRv2+pGyRvuFDtHMgHjd
         rJ0/Y5ETCzJKmC5rScGB3XweeqBhsr86pXxm5/RZWo7PmVeOjVa6BBcO+rZ3gHWpXLX3
         RiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlHFG4DUKB+5zLrYf1uPIf8I+VIKKHdppeDh5yLikCbZUbtEm2X2hp/2o8Gz+skHipijpphpX4ysUSnRovzZjb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkh12uNScegRlIANf1t1/CJx1qG9iX/RhTSMQ0ziS9cLn139xD
	JoYegzZtzi5sxjcYcCeH6rgAaVG43z1vJ8Ytggeye43QR5Ind4g/al2a
X-Gm-Gg: AZuq6aI4ZMgIEQdjDnz4oXYlqOACnsfAY2DbwPWnL1fl74n6GbpA0w2TveIxVadx+Ue
	YFbcfBSy8jL9IaHNlsjrPkBNPNVNgwVQyZ9/LuTmOGpZc3BlUcItsv0gw0Jobl5kDdVDrqdXF47
	z7cUKkTQHkMbq6jl0z0OSAPwfw672XKvh6TlNi0aRwNvjre7bfDTJupwGU75YQD90bfU+5FMahW
	B8rBUq27167Ljg3Q20dFBv6ipx17DWEMcN8y+nVMEk8IgAnJzpRq5VFeC4KPl8Gb9Miq2zNG+P+
	ZpJiGIdlFyW/lp8fxdwF3xTFsfrl38qTQBG7pgmOkbmxUexPln5MEHbcMDaybNgS3345fANgH8x
	yob5tCbsMrzwS1TlbHU/CrEFkslXPUWcZy3PV8hOzn2zBYj7cE3eXMcMjJzXGynAgYSHB
X-Received: by 2002:a05:6a00:a20b:b0:81e:b2ba:5b3a with SMTP id d2e1a72fcca58-826d06e9cc2mr134081b3a.8.1771553654624;
        Thu, 19 Feb 2026 18:14:14 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:14 -0800 (PST)
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
Subject: [PATCH 2/5] ARM: dts: bcm47094-linksys-panamera: set WAN MAC
Date: Thu, 19 Feb 2026 18:13:50 -0800
Message-ID: <20260220021353.40554-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
References: <20260220021353.40554-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181415_638883_0E21F4EB 
X-CRM114-Status: UNSURE (   9.78  )
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

The MAC address from the stock firmare is offset by 1. Define it
properly to avoid having to override it in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 2b5c80d835e9..74161b76008a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -25,6 +25,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x100000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -230,6 +234,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.53.0


