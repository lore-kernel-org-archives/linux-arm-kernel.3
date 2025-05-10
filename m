Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B976C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=; b=tQ9VOp8us7LWfq01Ej7TUDxVdL
	Tdf0YX8AVOG+wBpAXkDm00YYSYxV4D2PtfXFI6Vo1aMTk4ia/O+JMns+UaEohZTuUJzG5V0LVxJl2
	2GR2VA39blXqQJmDPCPK1CaoQ3mmzhjZnBOrUZ0nHLx/3D6x7pPZBTNcy6IINjJLk1RCDd0L02gzK
	D1mjWqqF6IFtJximAAElee71IWIKAOOeKpA779jnJn4m9AI786eAe1U/JKFwz5dBB0IH4GI3cT0Cu
	xebh2J9ZLleKY/d7yX4v6z1xk9j4NMxa2CJ2pvZyBVic0lXr/Ht7H/8yUqhVD+ozMEQrNTLUrE3GK
	t3rJB8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmUN-000000067iP-3RRY;
	Sat, 10 May 2025 15:51:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsL-000000064H9-3Tje
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so1365481b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889949; x=1747494749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=QPfA32t1WklY30e0UlHq4NzBFzZ2CX1Rx4tgc0rUFL3DsRi3PL46S7Ew9xYOp9QLLM
         QWiRc3bC8MeGs85B5QqQ+lYhk0azxBMpCoEvoySt98nIKXvvJDgDNSxnsIhBLtT8atrx
         zXLbntUZ3BYk6oEWT6fdP2jyfa1XqejbhsnKkk0Tr4J0G4MAFph/Lq1D+5iDHBkd61wO
         3I8ADBVC9QKvzKX012cIfNdnvfpx6GASDbeVxcQ6kpt5K4uH9tSynbWNgwv8pB2Du7Y+
         XIiylq7hv4r8EhTmBRly4H3dUorhgGHFLgkHRkAzB/XGcu+29oVCkjrpCC2vi+KDhIhw
         gCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889949; x=1747494749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=PI1PLQfhJEzlMqgPkTgooHjZYxT0r4glaHL3SqoUr4Mid0KeODveEI2tshVAa43XGW
         L1BRZf7ITv6uC3ERtci06CsKMDBY3VvX+ms1b9unyIUfQdob/qdZEdaM7v0QcnChIen7
         lTKVHPe1HZ4G4SnzBZf0tBGtxdU/KLB1pMpGBXTbQt5dyNGMZwJiYC7lmY1LSPJyw7RO
         g5e4Rr2Xj4MD5ZVqgWkCMrWcdIvZdUmq02uaVfKKg+A8wmajJnedgFacozNj8rTiuFKS
         AtkQT7JocXQy9w8q1K6EenAhzJdprWI1NtuHpDK6WJ35hPy/o02S+K1XUr/gDu5D3Q5m
         Dysw==
X-Forwarded-Encrypted: i=1; AJvYcCWg4Mv9fDSeJQnKYPpJPz5iOMI0+6YQ4WtcLAdxYRPyfEuzWqT/2UBCMn3TRDKk79SrfuZDHrlX4WvT791Bzkue@lists.infradead.org
X-Gm-Message-State: AOJu0YzS9j6Ov5X7epZJ0+QoSR6P6p8qcB4EMpwqocCUFeZmEvWIabGa
	blenao01EWsjYYjejDbXjr3jB9iSzv/x3elCY7LDI5OBERMY1spQ
X-Gm-Gg: ASbGnculdMU5U4MihrlLPgUMsCY4w+cc9Y064m56O3w8ChrTQFjaOJEHS19V/qqknug
	gV3e6GdfR9FFcr1EoLBFRMDuY5dUH4eo4gxSMV9cYspprZtdfn5MntljN4OueNjPp93CA6Kg8ta
	KUa7/Ks2BkF7kMvNCFkdX7qrJQguYx07SpKgxiuiMWgNDdDf7y3MBy2dxjLNjnsy58u7B18GJUO
	NsO5cwh74Qqhd9Ynhdl49pIR1jpXGF8IiFhKdMY7E4mMNGifqeWeJOHp5VT6T+0cJlxo/hoQsJ4
	OxfLzsPpLTA5zZ87RRRBnLxeWqL4eP7GyEh1rSAi48mCyll+KalOqA==
X-Google-Smtp-Source: AGHT+IG+BSq894BgpcaZrLib3NkONNs7rilLsmX/wtUTZdydylmXWbzGgmMKEx9P+8gKkZDE8JcS5g==
X-Received: by 2002:a05:6a20:2d13:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-215abd2336dmr12629039637.34.1746889948989;
        Sat, 10 May 2025 08:12:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:59 +0800
Subject: [PATCH v7 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-18-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycVdANrm5JPMScq704wfLVmJ3Ig1YS3yWE6
 JmrAGJtLRyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JKTRD/4//D6qqQ1IsMdcZK65UAbsaZ/GsdPdkM/JdX0rv/HqppLdCinkLrRZrovJDj7mrzVAT4L
 /32dZ9kA3pXlbbJrGiN69/zvx2/vxIyVWvE7/WZGLvHHjaYVuAf0GxtLSkANeZIa+N1ZyzYz1ME
 MCtkUFP6lAqVDTXudSIIT6BNsK7tec29KvxFCjcf9G34aMe7QZMfEKCjWhcIHnC8UxSCiQtvvwn
 LW9eNIE9EY3w4YGXFaLmYNSzIU3Y3YZoiRIQTBe8ODgW+a315l+SKoi8WgqhdexDt9SD8nGJ0H5
 idBrXotwkNfem3hGkW7weriVLENtVVgCaMhLx8b7h40N5hUMdbx13slGID014S/YKxNIw+x0t/R
 u03LO03HYND5emkMBsqBq7WWgpMh8Qr93P7DChIPUopC0hvDMAG4oywYfVB5IRikD1YL8LPlN7K
 tTbw2pVIgCWdUUAfisGEJUXM/vQEOiT6LDs0eIvGNgHRDrLVi0wywbXK2rk2rYCoyv6wpp7Xz8L
 Y+HcBlbKWrMmpo2nPtMSV0faPh9pdgDf7XzNKTDQG9PMUiAR0P+TLMGVUgBshz3gCJ1wtcZUbHR
 vzY63JDjJutLAdTDnVk27jHSD5EIJwK/6RGd0T1Eq+a/z0oeTrb/hKPaRJUjCra2HTFrTcw7BG3
 owD4MdqJLKPSAIA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081229_872948_847ADED4 
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
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
2.49.0


