Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A88C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FIyhDFD2ShaUnQ5aPpqXckNI3ybWXEGGWfQs3+aXXb8=; b=DjY3nwtAkC/2UyuLkjuwtzQnkY
	JqO9hIfpB1c86wIaBJGRdyorgpan0kQZiSBWVmBGip8oDAXwDmmxv8AG3ElAQGi0KiQpYlgdhoKbs
	eteFuXNb2XzdArsESje9dZXXrn7lJKlHVxl92mICwM485Wpw22y+acY75cVFl9g0yPZVl8Zwukibs
	7Wojv42S6ES9PfxbqUs+kQYgogiy3I0c6N/KgRDfh0Ednjzq8OINsbqr6l9yWfrG+Fj3KRZ22ra37
	jWU8VMMXBcPieuDrc9jCXKVX9OCLE8QpJPsxxw0aini8bfv8m4/Pf6aEUNu5PpFxaALamjz2jpolx
	REkQ7inA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8WI-00000003esJ-278R;
	Sat, 03 May 2025 08:46:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8UM-00000003elD-3Xdt;
	Sat, 03 May 2025 08:44:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso15255425e9.3;
        Sat, 03 May 2025 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746261889; x=1746866689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FIyhDFD2ShaUnQ5aPpqXckNI3ybWXEGGWfQs3+aXXb8=;
        b=FNlJ79hM7MYnqU/vBNfjSxwuH8hue+u0kaFWWF2dJWTyC8J+mb3pz8YPIGRRtB7eNy
         yD3ByqcYfLkeoeM+9XTmTutNWyDQnX4rZ7gPm4EmtN/YWnjpOlQhdc+7MmBOPVmxn9x1
         Z5VZNdDXde9gSHcuZ0mpSUObvnbPXmFMpUUxuMhb6Akge/h41iaqO6y2vkzkETUCMANQ
         T9tH7ACuOhMhy2kTC+QB+Rt2W4Qfy49utOecak8dsyqxjBUMksJZeVuHqPKVTFzWPZ+0
         LaqT2cK2BCSFUQcCQpTv6b8U9R4nJF3cEFz/YFzABwN4CmCybKsjWnOy5gJzwN8aph2w
         Neig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746261889; x=1746866689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIyhDFD2ShaUnQ5aPpqXckNI3ybWXEGGWfQs3+aXXb8=;
        b=WQ0KWN6OaDEtIr6KPi20DcIDq70Kay1X5TPIVKJ8SJF0AOcdknlNCEwSCWH5BXupP+
         EXompLufDjWHT5R1HvmAV3Z7F82sIxSYL+TqUd0nrqQYpsmacs3gN+H9w5HCMjVBT+RU
         ZEE/m5N5FIC2qzp7DSZaqjkzOkZLBFKVMtp1VIfwUdPs9zzfTWgCOT2DjQKVW46rgcVu
         0Zk2hJ1xzS8EbXrgQw7etcBE5+TUFdRpgpHzO8+oqUKiuF2dSJEmB0q87F/PdCPsudeb
         YP9WkCUPbU0AnAZ2mr5/YrCzc7CH1JEBn1YhWcmr28p+Eh0VW3p+OKKbeCWQBe9H1TBe
         xyeg==
X-Forwarded-Encrypted: i=1; AJvYcCUIcWLDY4obPYl9mF+IV0g/lMqLJcM51jej4Vn1inmN1/ZzfmDp8u8DfGfeKbGBDJ9y/A20t7gEM9urM65P@lists.infradead.org, AJvYcCXItxOjpKMUGyQAKDdUSxsU12XrCjiFUaAjLYCDQeQt7YRydZ9lryPdTmWfD3Oh0voSbR8EpB8mZCMj4hceUsqvfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiNjjlKDv0iuSL1xaQ299LAbmwCq3AgYJA+al8iyMLSKPNtnlV
	YUMGBFjjwARiM5a/zflHZYD/GN8ZEX2lvbWIS/j5z87Qwefgvyq1
X-Gm-Gg: ASbGncvox4ibFSlZU3FsknU6y+Pa3k2EJbClkGelkCNKjedW3TcZsfQmE3wS+DvQRDb
	RcMiTv9W+T/8zB6wXxNjV16pK9E94OBtUSFqOxDYKrctHKqklb9dwWVcTVJ0BfPJ+s919eHjmTY
	eW9P3ra1kjyMqFU4/K7Zm/lSxjFXgES9O/V9lcm87J6Y8gcDhocLoZ9V/m2vaffckhoxoSQ7E1V
	VjtwvtW9JXAvT2ZdIkwvm6bw7IcIv7vC1YzzxMtMq+j25sbdXhbxOluPzWMWnr8+kydd8YAyCA/
	yLZl/l6z7Y0GGqhJa/VwTtgeqn2UmrB18nIgxQGUksEIPg==
X-Google-Smtp-Source: AGHT+IGHW91E9x7iKdlAm0GzfPNQ5njfrFDGWCgFzsQFKF/kcqFtWAJemLt2n3WbhqAF87oSE1YCNw==
X-Received: by 2002:a05:600c:8210:b0:440:94a2:95b8 with SMTP id 5b1f17b1804b1-441c48dc3edmr3167525e9.16.1746261888396;
        Sat, 03 May 2025 01:44:48 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad78f6sm115007475e9.2.2025.05.03.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:44:47 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Emanuel Strobel <emanuel.strobel@yahoo.com>
Subject: [PATCH] arm64: dts: amlogic: dreambox: fix missing clkc_audio node
Date: Sat,  3 May 2025 08:44:43 +0000
Message-Id: <20250503084443.3704866-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_014450_877921_193C5EE3 
X-CRM114-Status: UNSURE (   8.79  )
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

Add the clkc_audio node to fix audio support on Dreambox One/Two.

Fixes: 83a6f4c62cb1 ("arm64: dts: meson: add initial support for Dreambox One/Two")
CC: <stable@vger.kernel.org>
Suggested-by: Emanuel Strobel <emanuel.strobel@yahoo.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
index de35fa2d7a6d..8e3e3354ed67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
@@ -116,6 +116,10 @@ &arb {
 	status = "okay";
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &frddr_a {
 	status = "okay";
 };
-- 
2.34.1


