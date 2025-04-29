Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695F3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=; b=WhnR6kT4OOrvs4SeNbDHwPbUNG
	pUTvINeBRgrS95doHQYasIzU2IGCW1DgnVEMCTrCr1W4VQzDX3CddYuTA5qNWwzwD9RvoEyfcxdUz
	XV9rhAjZib3ZxvV8bfe2I2Ns5ziAZc/y9jRtNBRQrQb/RwnS7SliySssEItVIsoBmpXLy9AxEc1HZ
	9geozMUwmZvualwcOq4m0Yl3DJ9Ge7RfBk92XHJKZRaxWwo3sP4GmAChJ1rePN8sbS/Y5Rg6C3gAD
	NVGYV1lf6KGiD7ePQVqmf08PQnBJHi3inxMauIj7JIsBakq8IbZAqThnpVEBtE4/UAivvVYatOOfP
	0KkvFoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cL7-00000008HK2-2HRs;
	Tue, 29 Apr 2025 04:13:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btR-00000008DCl-3GKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so4377740a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898265; x=1746503065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=Qq7J5qDRf7BDIXgAM7XsfYc5gN5F/9cijXFa+w/8TES6OIolPITsKmGVTRSPS9orO1
         OPGdGS3qrikmaaJnKLdgcG/0J7/9pm/NBpSSkZBzN4Mkl3QAKGib1rnv++Bw41vRFTBi
         dOYU+NJQNB9iDDh/Jr6vzFVDWN8mzw7KGlHYmmBEkUyz4rgInUjHnY/zpJydk1RPDqS+
         qZy0jrl05oQHXPHKIrYdCHn7sS3F5EcAD+sJTIF8mtI9/Xbumfe6gwTslbuFaZ9xKDdN
         TwVWWHnhTDxFlm6XgG0CgkO9HH981klfSqCO+7j59AweXEounlESwsPK7z7Www0sa2aX
         +ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898265; x=1746503065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=nOYyfDvVdSeXv76TShKXPg4Ued0SrTBqxUTEwBQFTWB4o8OMluqI3UrzLVXKtMMr4T
         MB7uOt+EKjDi9/t30SxMaY/snEW8BWKLE/yj2YKqbCoBEz5w5sYhq4KkSR8YmP65cIpz
         A1TVZfYe++GaBZdPFOakDH2Bhs/bRKA3HD9kFWN1zuDl+GNM6OVGBr8CAxouuR27d8eC
         /rwZP212Ig8RpXpzA/m9XEJM3CYwUlYlUTaUnrl8pZJ63CT8FtSN7rT0F4qwqmt/F8Bl
         Y0P3A8p8yPilvc1V3D4D/CSRlqCSpY1eRm/JLpURgbHhXBDixmlxHqVe9cov25VVa2dw
         aOBg==
X-Forwarded-Encrypted: i=1; AJvYcCWk8b/Kay8w+yCDF1d6cW/HKULge9OKP93tlpXcP5eugWxhRJJLyF7wrXIr+kZgyAJsHpdg2S91bsQ/bU7mQlq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy21mQ0O/NFwQ7JGwRhAtMmh9qShXYuNCtzAeYisiE53MTbPXoJ
	Z0hvmMR90aPpPMccNoteQ7WjPJqiuxyQXi/t2jNcmObMKNyft0KA
X-Gm-Gg: ASbGncuvp0puHwMm72SlpemfW29rvp95c8pCvJbkijUgPThIBJXTlGZMwVnbp+MPAoy
	rEJFyBhbWPHcS7eBRv9S1KRDk5Tttb/tnFV61JGpGOzOk0Fa3f5BcORZcBu5DnU0WMDBuvd1iTM
	WbiLGJFO531PBFX413mduK1wiPDKBcFIJDBDcFkhsIuyC/nWK4WexrnMfyk+sCOVgTOYLkFEoNv
	7s2olQYV1xcQol7e18wJ8H3J0bfAyVoO4HPuhdZLDkda4b/welX84OzKgQz3LAQwjpjJaRufMHH
	rqGjIxNTRkrzCQtDUcB7h/RQlcdjGwjROQ8foyPICRWSCFVnNM3fFH8S3T8JkOgHNc6Y
X-Google-Smtp-Source: AGHT+IFbQ5J8X9Uyjbt/tcsLIdvZTDaLR52CKOBn0GWmEL6qPYTK21ZRYjI9b02uRhJl5cb8jl39eg==
X-Received: by 2002:a17:90b:274d:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30a012fd061mr15573483a91.2.1745898265248;
        Mon, 28 Apr 2025 20:44:25 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:38 +0800
Subject: [PATCH RESEND v6 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-14-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErliqShfLZtY6dCUCyfNgW7SwP+NXzdz/aBZ
 TZq7Ys0jLKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JGhoD/0TNnuFZXjYLsyHlGSzH83pD51e/IIHTZF0h8zEZ6szGklAvPJ/SqCVelB9r/NiTpsxQz4
 Kntqe9FfHouFNxSbFtWnm6qQI+Ijp511HmdPDPPu0oKTtZKIh31XJ7iN0erIk/1O0XllijQBKJG
 ugs8UZsVqljduxJVWv7BtzEwD4oEeDJ1Emhy43mjZyngLY8LV4OkwbRUZxjSdz/iKi/yfA//Z0T
 rbrBnSIIdaUAaeVO2quUUc41ZRh+i5UMm/wUZj1CcRIprUskcPZ1cEgHgYRNEbUDUDD5VFdWJxW
 vyZcXWIW/Xibory1sDpxDgrjRzKHXLeawo1z7RnAsaEBfKZOsEwzwNt+0rQycpaniYlXJblC66U
 5XSyKhz/kuJ5PVTS2Bom37a+sLtd3x6LkjgP8dMdOT+ODWM73jWBFBFsmKUPOhMIOptOcVz4kpm
 sspCkZK+hAqTAtwuTIY9atL4H3785uGpjWxCWnd3/+GijKUf0acqdLCPe3ldJmbnCJhVvBMxZXc
 p4Cr7RmXgHTpj/AgVo72JM8NJnqyQEkPoJnSD+CwjIoiODUTDx7xsJLtFIenR0j56AZctExRHqL
 uk4dHGr4KLHVausx5xrQUdzyh7JcM3h0buPMA66jEmiO1iO359ZwnP+EGIjWHeWxeEnxpeG0uIm
 5gl71i8Q7tDCybA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204425_818493_17C9AFD5 
X-CRM114-Status: GOOD (  10.22  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.49.0


