Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB41C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=; b=Ogf8u6627pLP1rWDPWxnpOAD5m
	iSrzsIEqB2gIucifv/TbhRzn1DyiVYBnDbwJEoik4iXuogLLFNTC/RyXudS++fSTXq/ScvOE9Kb3h
	rQK334Yawb/RKmsV7WU4DV6cU04iagHYDqE3skjGvcKN50Tu0NHbefKl1oJ7dAV5pNJF0l3fBUixv
	NhzBl3Q1KQ4mLUJ17XHOB4AgW+MzmunTGhO7fqXsnfaNSV5meJ0j2MrhIHuYJmEkIEx4e7VaYH3PV
	73xgAu9GaE9JmdO2NWwrIKEFh90S5kQFbtogDsxvkEqwpM13oplt5e7G1QdnR1yibQigO812TvaB6
	0Byv094w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnsCE-00000009kju-0WC7;
	Fri, 28 Feb 2025 04:41:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3G-00000009jj5-1o6v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2feaca4e99cso1975088a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717162; x=1741321962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=PauTj1Fbzv997DlCjt+abk5oKMbGmZ/56EVplwoPVueP8SYRKpkpCWrW+K2SQSHpZT
         Tzjs948qUU6TQnyf0kX/qAdmDyDY1a1vydncinAA34jUAQ7T7P3fXKtjJ3MaZX2QzBF6
         AWJ5UbgxVvn/HzGdufbn8dt/qqBYHOP08Fxps0KQ3MNU34LmYnKWVmOuJBf38IW13jXR
         XYuafBNtQ4Iyh5RY4q2EaDiHzRgs+4ihe6MCpen/QE2dOjipgHc8iBtfAui8oq/80w07
         4kz6NBmeUQIqNE+CSP5U8HK/fKYVj2xQLqbq//DmkVBb6q1+yIoB90bWHLWixtuyNSXE
         hP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717162; x=1741321962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=XeteUPZFrJp/lzY3Erd+tZyu5+wtIvvdHVPqoWb4nvlKbAn/JpMOP24iPIpNA7kSEe
         fOvV7thTbhr/UOJ4ji8qmbb9lcmRMdDvXIobDJDCqJKe0vmj1UFSnW36UyqVQXO+wqZn
         +kTedCFIq+jhyMPQboAQo40LEtp6CdEeisG7LhQkd4RmoTmwd8sRlGP+MLdcbhHP/ZOG
         lHIcJ5PEKPb2SIUs9YMV6M1l7vTjsoIYE2DlPpjP7m34U4xie56x76dxuuE24XN/SSVB
         LPdVpWcKH1hopuoJRwm/8zqYYi4jW1IUmUW6As23e25iqq0u2NLjCNaKt3i1OLeFcNif
         iVYA==
X-Forwarded-Encrypted: i=1; AJvYcCVcIzIu3fsbvb+v9OYa96x5PEvttdU7EEkvJ1URnAskOLJMbPJZvcWPZ4JktVEUWGiQWwXyjzkUIdpm0w3C9stT@lists.infradead.org
X-Gm-Message-State: AOJu0YyBW2TWWbqCVsio31fIQUBQqc4mCVTxXEtQVIqCixCafvU27cL6
	5liW/o0zsBc5QDiX8ob9bfwbKG5PdkLg0B+pylC8TUdu5mp5Jzf3
X-Gm-Gg: ASbGncuy2Xu2MXFeus03J84YLV3AqXt66LKcHI0NPCHKKp1BKXfZpzT7xyGf63aS6ox
	CVyn+WawSBWWAUQik0ZqLDeMmKaPDc8NDzNQzYXkCbTTjriTKILGze1Y5BGYBFqi4Osd7kc7ka9
	hL/67S6n4pyKW2MMrXVkx1d6vNdk3Umlfv9YQL0VFi1lGmol11Ow8KZaL+IVjmrzRgvst0SN+hF
	IoDO3oJGsi/5O4E2YtI67QXEz5gVNRSR6M9ZXqyIJYIZpVu4me8fFvM8lSAiyiFqzd9hIzTVHbM
	iJlN9zf9OqQRpgcxwlNrOj1Ou43S
X-Google-Smtp-Source: AGHT+IEmut3mjvd9t7e4uQ5c++69AVnSEKUizaMEaksq0QUSCwyJe+y8zLL9BrDMTMpqMp62yCDG+Q==
X-Received: by 2002:a05:6a21:48d:b0:1ee:69aa:b665 with SMTP id adf61e73a8af0-1f2f4dfc296mr3428809637.29.1740717161789;
        Thu, 27 Feb 2025 20:32:41 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:13 +0800
Subject: [PATCH RESEND v2 2/5] arm64: dts: apple: t7000: Add backlight
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-2-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oCtYD6WrFTqNAI1VrGeNu5viopS22BzTCxA/dheRKnA=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxgX2wM5nSlNR8mZr4uHhX/RA6TbIYprmAXx
 +RyoS0oVaiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JFzzD/9wvCup7jCFw3YaxVVUGBWHeHFXw8aHYaVftpKBX9756i4oc4jGoRVu0aQArSTOVGUlN13
 2UrxX7m54s69ymovtRGKp3bWk4CwB5jQd/Q+IRV0Llp4nJ/zR4xZvWrjB7yfkoptDGREscYloRX
 6eU97W3OjuQLxg/DSV0Ezowe4fYqpHcN02kUtKqbFIdwCuIqKYahWEHnhUHBSPewjcUrJzErjdh
 rDqSNswanKlbnIeoyHAlYILzr84ACRCpRTdJti5ZgoiTzRlkGhVDzSygCAdDTRHRNf72aClegft
 GDd1CqZv8yB2Q03PfUZEZlluX1o6l6PbQRIPA5ezMETfhR+O5k0pbiHLjSjORlIklUTIofP9too
 MV4D11gZsZ/wq+9YszMPKcTvEp5Xx8u6ApzL96bMTPpyZv5ATZMH13fNoYaotc7ilCRmyc69Jlz
 z2U/7pZQVwEAyc4TBfhZ7irPDpbBKWUHvC26d8QasHeoTPV443/aCYcRsv98K7EezbrQva777fO
 59heovbpJTbgg8H8zmxR7VadzJQgMLoMS8Cdkwd97/du/OILDRTjuaXlLFSfmzWcBmuoGGtP01e
 lE5m3e6BwYC7C10IQU1aljtmjL5F0svjawTCtLtv3u6IQGIalgTnNVgzOxDpllav20EVWWUQdUi
 tXENaa+yKQcDkog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203242_464793_9AFFA9B9 
X-CRM114-Status: UNSURE (   9.94  )
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

Add DWI backlight controller nodes for Apple A8 SoC, and enable it for:

- iPhone 6
- iPhone 6 Plus
- iPad mini 4
- iPod touch 6

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
index 8984c9ec6cc8e3c86281a3da719edb56c5bb7f5a..7b58aa648b53dadafb3a01d9ae1e01afa6cd5869 100644
--- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
@@ -22,6 +22,10 @@ framebuffer0: framebuffer@0 {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..85a34dc7bc01088167d33d7b7e1cdb78161c46d8 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -155,6 +155,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,t7000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


