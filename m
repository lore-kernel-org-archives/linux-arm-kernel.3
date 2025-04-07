Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE8BC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=; b=T6KXv5gEKVmdKFccl6ma4gZA6w
	F+/xehzesCX0erLMT6S2Xv67FZWk3tBphgknNFDtO2RAE9/zNLgCeTA9rVupD8R+sC9TC87wJ/VLw
	0iFwEexc981pFtqt1EgzvAjBWXF7Fo+J/2gMi23Wmn/R4WHGEvUaB5WXQEaEKXJBhnyELC7ebbEw/
	jsBy/7I83rTTaWX/3zgz1zImWCvQ/0fzOvj89QoSILnCHdasfyCf7AuVYFGP55N2+wslDht4Ie+H7
	pRE7UuM71vXlzFzp5BEg468du7Lm8dhqByZu+YWUAhKT9mectz2Imao8JxkN+Z803zif+SZ/Oj495
	oS59QLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1exU-0000000GRXg-0iND;
	Mon, 07 Apr 2025 05:23:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eOA-0000000GMvm-3IGS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:47:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-225477548e1so34879545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001234; x=1744606034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=blocTgMLLPQk1YGFTmYSrRDkPkD6rlCu0Rz5es7Pg/NyCEbBhb2xrnf1GNDsvDyRtB
         q9akKyuy6HMwRv37r/VJSf1CKX+35qzblzoEw8o7gYYFm0u7NBitSGOM2s7jhKd+yR7q
         xD2jfxx6WpalCeHniS0fTXlQWj/jTZrADKeuUr5pJznwOyXAL+hP0yHO6F4We3nt0aP0
         wHhcZfh4qvaz+80Dqb9xUnwL4TIAV6V7M7BPps7RXqp2N2w0mDIUki6LgTnV8BIsiYgy
         DwHDlIAQzafBFNzg+bxO9fg6Ms7JiJLh3LATjqXu1PJBdClP9SF8/vDfIhTF+ie/gZTC
         yfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001234; x=1744606034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=YDkZ5oWy9llRDwv2jFLDHFu4WBWBrcGH1kFcToMLv1qIFAv4EiwoFesJuopoc4sPIf
         DAYDpYaAxk8HaIdCmyqwp66S2pUyFZL6/vQaJKkL/uWl8kcdQelyggA9CExMj9rtKnGI
         vR0w4YksXVPsbFrAZgcTV1TvJ2oYOA3UeP61LX5Sc3KxiKCtL6zqu6L19jlsy1Lg0kb5
         ujQmwN2R4aIAletgJBDH2vt6y4mHAGwUWjZP7+A/PLOfqKachRDb/M3Bw/kL/4APv3SJ
         IgMrvZlvBY1UGxEe/UZdDmECGxBaniuYPUYcUsGUpEebmSqcpZAL/xWCOyqSzDeqc1LO
         lQUg==
X-Forwarded-Encrypted: i=1; AJvYcCXQPSn18uARAPhOP2oLJ1LQD4on7fi9J/BWN/ibO782dW4YqwBd84DWIY43p3iGQYuCkowEwCGESpygtlf/iaFA@lists.infradead.org
X-Gm-Message-State: AOJu0YwXEfy86YfkZwSpRUw0phWiMh5Z9qr2Yr5KzMz3H8sLUZSmOZSy
	Aq+Wh6agT4wBaWx7oJoDNfbPKvLtznGiQ1hqQgRMfe844FsqYD4Ra2+Qsw==
X-Gm-Gg: ASbGncutapg3+QGrLUav+fKPFgwKdplYoLP8w/8kwVpyZEVywmQ5fpKDQDA+4YnxUm4
	5o+4sqluuaItcgozh9csDV+3I0HiXRcRLbh1FE1K4E/FTqLtDvE8Z9+W2iCArnKeeN041nW4ORr
	oYd2w6mElCkKIxuNWNtvuVuiphplQ7sTdoUMpF3veUcOfc8t3lFxrlbcX7v8aWM7sgLL6Yjc/df
	78PAUdpYtCBR3sLzt8RhAx0wCPuBLsicTXwOwiG63ZiBOc/QqkyRoL7Y3WvyrAWhCRmK1O9ShNC
	H1wiTO+mbGlO6BVHp9MEDRtc/c9AgWFzQrNO/v8yKt+Ku2c=
X-Google-Smtp-Source: AGHT+IGVRXDaZv4MaSqiCi64YlbFNaNr9jW0ETVrxcDxHOUBBfHyhpbXAoN/raHDXUOn4FNed84NSQ==
X-Received: by 2002:a17:902:f705:b0:223:4816:3e9e with SMTP id d9443c01a7336-22a8a8656e7mr153126495ad.13.1744001233923;
        Sun, 06 Apr 2025 21:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:30 +0800
Subject: [PATCH v6 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-21-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIlNNKyQ70bdORJ/DAimDpZx0W96Yy2ZPys
 e7RrOF6AcmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JP/bD/9WqrXV46Nv698aK45neuhPCPVAAc3Zr9tC7sjf1zp0kioLkofK6D7l6saQtbodG8jx1FS
 LMgQbxRn9DZ/J84t/w2rAzHNhmLwYbcZ8tZOxYVZS2eGFT6LffyzMAFAMe0yYJLVZ54UDqZh7NO
 E9sBG7INDBrYld8DtQvmMrz1Ior/Y0LfVO6vKfi6kcEcf0SF6HNn/gBZdgUTZLrpKgS02VM/tbY
 Cowa7yYIzwpJ88bllbQcs8gQlnNTidfz34h5gcxooIl2amFFndI1RxVihVTaPMJpKDN+ki9R1EM
 wEBj7B2ayLyRwgaCPZ/1fAeZdRQ7U46Tx9U7qLWgAt9jW0S6s1MN7PrUflv/VTyFMQeTp0ULyGy
 DkGNUU6ThWXz14WZ/FYItrLBlVqaL+YEvGyvOeJIi6jAnaTL7csuwGhcv0sHy6mTSSJOuLhRIun
 4gxCERceNX7oIH8TBdI5syXlfXL9RqQv7O4QgWZyOCk3LpoqhSxEhtcrU4msP4ZbYPXZNnZqWdS
 Hviw1ML4rF3DNGo4Zc7zDUDJhJIVbiivpjG8tQ6CusxNdTfaGthZe3tIXspiFDRp+nHy02wMQue
 Kma+c3RNQcuByy4bB95ZtjvohUO4RWK+V2Q+5moOG9+uGG+pPSTfD3VsyxXZvbaHRV7CDaMl9q/
 Jvv0FscN3xAoXJg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214714_869800_50DFD6CE 
X-CRM114-Status: UNSURE (   9.67  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -380,6 +392,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.49.0


