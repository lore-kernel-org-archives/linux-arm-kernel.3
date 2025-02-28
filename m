Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F5FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGQwHVv9o7q6RnxPf9GZuF8RZdvh224WMDjiUjFtGtQ=; b=HWeTQRWpdD7uygdilae2jclPZq
	H9XRrVG3iVjOenVXUVWdPa+wG1SrN2on5e5LXiTyw79iOOjzOjYrpZ188gVt+wuFQ8ihSj+GrFu3Y
	Gp9M1rP020/1TEIFwzXnrgRQQp3DciA72FRhgwkcpyPZQuxOg7xV3gMsymq+whVoXXcVGU22tnbM1
	mUeGiEqB11RV1tzWMtf08sCz+UcmiNKrAKqfyrP0OzX3PDzRwgjoTEL/ZOFy9Sow4Ovl7jiWBZD9F
	n0k3W9SQamjJImScKFkpU+cC6TSPipWNrgDqEdHIg+nk+0b2edie20P6FC6JeVPktQW8G2UUVmCkV
	5AOD5FZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnsFH-00000009kzZ-20LF;
	Fri, 28 Feb 2025 04:45:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3L-00000009jlM-3Ogs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22185cddbffso49302765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717167; x=1741321967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGQwHVv9o7q6RnxPf9GZuF8RZdvh224WMDjiUjFtGtQ=;
        b=WBikSuU/serybwObQSlJAFEKdZyBP1uowWx2rpMjwVF6KVrORw1VUcm1RvGJTl5Zzl
         sQd4Po+VmYmHq3mVAlaoGvBrcUfP4AgGg8GT+TjbHd/fM7xhgXgXw6kXhBNbPjBGw+Gf
         ChaJNkRXuyTOxY6JwmeUahL3bTNSfm+SaKVRC+gVAmkNHvcU1QjFZQ6mv8yNUUJdULbh
         XU4oKhRmLOjKH4eyq5yVpbFX16VNkEVd3AGzEQgzgPrL9gliugXOJGv0sodCZBFtkv27
         tgJbvB7NaS9SlCtKWCZ9dgGTOyoDYXntZvt+YZ4nCbkfHt8lZD3uuy2sXNmzSayfSGlk
         OoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717167; x=1741321967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGQwHVv9o7q6RnxPf9GZuF8RZdvh224WMDjiUjFtGtQ=;
        b=aP7b228pBI2HnPmiR1IpIBb7lvKYM1BoW6mmtRCeIAbYK1hvtwOFDdDjj/Y0aIcqA5
         ZchZeu0Juz3yy3Q6fe7Xp8xnG7QG/rEzoEIoPwhMvKYIa4G2kQh5xGSdKLQIKdUXaGTe
         UQB/Xjxz8R0SAUotgspz2320X3LBTGd+CETK+ybEE0gB2Ov7cRoEkEcotyW4x3ZfiTXW
         oEmK/BwXPi9FqmqbB4ehZBk3ALUs5OzxVd1A3lTWE62vHvVmKesHJ+cePXwNRWTL5DeC
         HkHc+ta1ymNszU1LwOFusyn62LTcZ36b/yJmve3KFtfOVd/p+IgwqkvtLDqacmhN8hrp
         RuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe3lsQoS6BFDKMxjWQiUd6cUTKfZMWeQ4HCkqWG9OBz572UjLVqdnozff4kAazc9nJAAmiBdfOnL3VUgrtb+dB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4NwF8e4UwFyX4iJXOu/4PZKwzlLF5ckP3ZjC2u2qsj5qt+QQG
	Z1YVQ1ZcdrZxd/biEd1SaGottTQF90f/ciNKwR2K6Qhibi8ff5kN
X-Gm-Gg: ASbGncsXYCZ/3cNdMgAUcqzB/PlkZ7on1GvlC4o+1kP56CrNkuiihZzAPXOXLaag3lu
	/fi6eK1RhUkUAY+OBVXyKYr9ctkRZx8eN9LqwuFMdeSwgUUNE+aAPvTL141zWzvg3XRxNJkFOB3
	KOrNgCDvtU1A+YmcEHpzkvpGJERG0FayN3PzegJh3Br+QnDQ9uvWFF0oRTMkS0cF8e0Tm/R2bMr
	6E6I0KvLoFRslkp3iAPU+sIIUfGObMbNSztkvnonYjGLDVAiv6hc4nx4rOs/JtJX2Z6wE+FaE8V
	8lTL5VnldZ6jDmlkT73oVW6TvB0V+BGz3be+mHch6lENUbw=
X-Google-Smtp-Source: AGHT+IGdqGiYiPdIerWjEeRPZaQx290tWlUUMzSZCFp3qxHZqw7PvtgopI0dx2KaRwGhPRKQ58mphA==
X-Received: by 2002:a05:6a00:3e25:b0:732:6276:b46c with SMTP id d2e1a72fcca58-734abf1957bmr3901217b3a.0.1740717167163;
        Thu, 27 Feb 2025 20:32:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:15 +0800
Subject: [PATCH RESEND v2 4/5] arm64: dts: apple: t8010: Add backlight
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-4-69e450bc4bfb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vmNWEgr3rWQ5P/ADNnC/vtVzmlsIMI6tVOmt2QheHbo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhPCXsUBLNKB1jlR0unOqoSgScjctNiJtRy
 eumJJoBB0+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JJojD/9vMZhhE3z+GKHF8IjFsnsejUXINwfdWlWe/TAyS59eXAicjPkDXVdP052aQFCYxTRJCVe
 TuViwg/UBc7j9aTOnDTP+Olel2diEOFx37jsPI1/mn9xlld5c4mZ/gq7CFQG2MvYNALS9IP+jZX
 aHRcAwSLSpYWCO3ep32nonIjQ+zKrBsAnyDrCkS5BNo4NkkxkEXmdmcJhpdojFTXGex+6dDD1yD
 WqbnHQteGHty4jDQSkZ3f+I7dwG20kqlobY3PEfUzLBiiBYpqh7+t2RH1tYUjr6Felmt98kvhUu
 DDrjPg2qOANdF9McxbnNQpoGawLlgtzeEUB9RIbqUHCcPk3wycTuOHln65LEzZ/AOnTnOIYoFSc
 YKo6Om5l/YldQNJLOkjucNjNw/H89gMznY3NNzXD8F/aQ+enqhrb21o/AJ8aUn5KhRLgCxPcFgF
 B1r5rumVz3hih+SHeeUq+x2WkyhIikAy08RjVQXhUZXSH5RxdxpU5ebiW7bpckDhzJTpnhMDbwz
 faaefGNQgFpO1ZRx9MhI+3bq/ZGO38QG6U87cTKL1QbNNSojPibYozNXDv87GTXAxk2aHtccDrD
 5wFfjWUks63EdPYxpAHb0MAfDhe1evD6Bn4HP6ZT/E/zA9OsD51iNydcd9mWZDj+NLn6BaDTcqH
 g9dj7ovSNny9Frg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203247_861957_9322398D 
X-CRM114-Status: UNSURE (   9.76  )
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

Add DWI backlight controller nodes for Apple A10 SoC, and enable it for:

- iPhone 7
- iPhone 7 Plus
- iPod touch 7
- iPad 6
- iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-common.dtsi b/arch/arm64/boot/dts/apple/t8010-common.dtsi
index 6613fb57c92fffd41c34a61a78e7bb6b1888a5ea..44dc968638b13814baf94e782f2267191ce267f9 100644
--- a/arch/arm64/boot/dts/apple/t8010-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -167,6 +167,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,t8010-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1


