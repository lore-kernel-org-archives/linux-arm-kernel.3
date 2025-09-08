Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B44ACAC588
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=; b=hXYAWvW9BqxhoTdsgqr7p+VIkY
	4B4xiAkJeuq448MnWBAeUdAlF0DiKUwUEwAQFTmmUCVn+LZZWcfrytwbe4NX1sfXKTDpawc3ioSmx
	57S4pB4a8IrxfWMLCtPT5S2wgCK8UcjWp69JI4e/kXzy9E1qKjcREkGbgmr+P0wZGW7Z6XU9Qpz+y
	pi3JCZTRcDhHSmW9RQIqiIQyOTG5cYZseduwSnSSFUra0MYaPlHbvRy0SvMl+5TQp6FtdvlXfwF2b
	hhPqETF4a1TOHZJkNJwRMOuph/MwpCnyfcldGh5zFSM2TP5NyGHBF3TXfcyX5zGDo5S/5nrPQxYLV
	TIvdDqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac8-0000000GqwQ-3ool;
	Mon, 08 Sep 2025 12:04:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhM-0000000GEOA-0X4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:02:09 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b5241e51764so61680a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325727; x=1757930527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=NSDWNnkCLi2jPWKGbvhoh/7byHENaGE6zhDzbom153KT1U/GRooYo/vxsn4x/Xjf8A
         yY16cGvWuG/6j5aZcfa6mMfC+CnSH5nuFyp7ooLgMBEkSSgnOxs1NG7k3cMzlOISKgdQ
         QdGAToKtEl7ubvKxcMn5AG0QfmDZO36MALKbPI0RIPfVehSWCSRBhtRoTTqFUJ9ONJ/2
         059GdqhmK5rpquVOvjh96HoUqL+MFR+TFMHxEniTYN+uvz0Rduq4uotCx3+6KKqc4TUq
         EWACwZQLlH5fyuk3yZNGE9VP5DxbCPw/z3o/z/G1aEG6CIJvQXuao1p7Mx95wiqCr9mc
         hsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325727; x=1757930527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=nHy51MsERdSdUTs56egv+CSMHS8E48w1FU9/lAZjJVlVFoKRIB2P45kYRozKPg5QeS
         S+pk9V+a6YU9KprCeY6kPXA6yWHERYBLyZhPGlf4F10EidfGq+pu4WCz8pVo1xn4qfzl
         ge7kbwY0lKofVsPAZ4uJ8hzTDWc7qmYw2QnreoQD/iR+kJ0dn+Rt9CJXc1ZLatfBSPeP
         8guxGxA032m8Es2iihfesFotzj4uVb6Z37FMN9FMtXVSK/oDM8HJkKKs2pcIldjFpZu/
         4M97wogMCgtgEA3MbJCnmyNArbx76f9h0JII1OG9nsuDaQbVghgKxCsFnjhrEhj17KSR
         1H8A==
X-Forwarded-Encrypted: i=1; AJvYcCUmo3whiFScS1v1Rx8Q0lHkIT36g2PjqjWdqp2yZHPuanhvvVao5tZn2NGnAQdgHp/eRcwwFanh8LKbTw8yONVz@lists.infradead.org
X-Gm-Message-State: AOJu0YzqH6AMxUwxarpfjXGwwLnHmoaSa4X6HTecZPE4ORGB3TA1riSY
	j19M1ANcLelWLK0MeZ/Ua8ZpuHoAzZ/aKBuOnTSE5qJYtZNC0g90y+m+
X-Gm-Gg: ASbGncsPmraJjCaOwAO6K+hfEeqn1F44YCZDNPnR7NVd+vWpiYdaEHGc13S0QJgh2cZ
	fdOkWYS9Y3Jzgz19r/ZLz8yrGL7g7W66dFUGqGjXtDNFBLowL4/k/fXwtz8o7pX/Wopj4gwluJJ
	wsfFefoQxM5m2NE9WmWFslcATXjO5mk0mPKK+8ZGwBlluZNDKEFuO1St6/I6G4CPgSbgr7hHBe/
	mFGoJa54WqO41Uxf1zLkZMcHJVegNS46dQE75oltdgEUCPIIak/MKT/J5gV6wUlgtat7Oql/+Du
	ZUsflM6R1umROcQ8eyVmKVAjmDga8vCaxB7mSvnzKEE5K4Bf4BgyRes3QvtiVkiW0+lGG7e35vK
	Bwu/gUGtjeclome/x1w/1B8oMPmwCC6quXLNAMA==
X-Google-Smtp-Source: AGHT+IF8LpVXd+WGZEtF1C2T+vTa9TSDeVl3CnSVMFCq8UOb/1o28OdTA4U/neCjSXbyvg/fcm5TvQ==
X-Received: by 2002:a17:903:90e:b0:24b:1785:6753 with SMTP id d9443c01a7336-251734f3e0cmr81802185ad.53.1757325727130;
        Mon, 08 Sep 2025 03:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:42 +0800
Subject: [PATCH RESEND v8 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-18-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFQ0cZrZzPeRGtCygbH95UuIjln1JvwKkJN
 24hE/EOxKuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JJaBD/oD5cXvCu2sBW1J09kC3JBBl28CAnlGWlecEz3qWOCDCR4tZ1cxWW3m2tnll3CaC7xlGu7
 PFTC5tfA8pMiz/mJCb/XZcqIg4WEU7QCxjbRE5azyf2ruTRo84eQxpT/JULcO6OxcY59PmSA7HQ
 BzlzXWiIngPq5ex4K5CwtOZNREQDsqY27ECGJUmuiH1Fetnhf7unUNbE/o6bX0hg48FO1SnotwT
 +Idf0JNbMEDMHrAzWwrnhZwSmQJ9tk1ED+AQo+idFCmgESTsdjfi2UXO858CcCvwxkdfcf+t5Ot
 hpAHc9BVLzeCaGhbZdG56La/B3tTDcWJmF8atVIdQYKq9bsveCRrPVi9GxNQVEovMhrlRJi4jte
 IVnYVenLFmtKcVrDBD9xKwLszBmrM/pYHON27u5fOh22I0D+YYEmirFLX55eMQWupggKY69Ww9u
 fvSuxrIQW1u7lI99XVZMQzL9T1CuVYHyBVgthtKBSTigZc9kUkWefEvHjF33M5gkgjqp8nki9il
 81mag0B5orFM3nSHKMtPkFv+Nn8RtQUxRtJEsk2ipOWtI7ckgSATmjLK1Gh1fwlTBV8NMhMRCNR
 CWBSJkIvuNSzwzpDZmCOGfhnPwdzrANKt1UgaZPuz8SecA/Fl+X6/JsAdk/83DLWwtEowYsw6gn
 x35Sp1wBumOXpyg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030208_167428_F9DDAC58 
X-CRM114-Status: GOOD (  10.29  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..d187fbf7e7a214cbbc1027034efd0724ef7f8b83 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -256,6 +256,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.51.0


