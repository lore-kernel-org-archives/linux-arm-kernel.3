Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91798C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=; b=eoL5R3FOvAX105pZvJHlApDBfX
	7ASz8iZxS5JgN6qaHwu9hwdpEJA63rqfw/w+m05QAF73PkPE736KNo3xkGnO7Qsl+7qbevWkzL7qy
	ySXZIz3z/syX0cWtMRQe8VLrbUYX6adIbnMYFA61Fd+Vkl21TdBkm+llFZBDy7GFtnFcjq6nT2mMD
	4nzlVMgzosvvj/ZVi8vZKr1P8H+v9hu3orlwBgT/MEjr6noJ2hm50tvy2F/GVnKhnI4lIJbR94eY8
	p38a9T2yP45hauJxLWRN8bevSt0Ur+hzyTqW+u8uqKjH5P9TT27hT5WmAimQRXMCswkhocicJ5EVj
	1afzfNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzNN-000000038bA-0qck;
	Mon, 16 Jun 2025 02:15:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyin-000000034Q8-44HI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2350fc2591dso35519915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037593; x=1750642393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=HOXPhiJMB4njoaYTd7ZMh7nJR+zR5Kmf2EMBtQhOBPWbn+hotlVA3PJuJjIyKDilsA
         9VTzlEBKv24CdwSNIQbeu50udO8v0qylcqck3QNm+djqNxmuRBrelO7QDJVYD5tDe5me
         c7Epdp2lHivySUR8iXbHFMMljIOj0QDbWodpGd5Oxu5ZUsO9fZCyXGuNB0vjU71pYOZB
         WfzqApCOBC9qzY2EpLP6TnJjq+6L1crUxbA/3UgvpTyxBoec79ISZIZs8VeQcP7dDkEU
         LwoFzQyA3Sz/R7HajLfkQUS2WtRtY3RRIXF9nyQAKRRvEpJwlHFMD7VPp9A6CCbuYQI7
         +U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037593; x=1750642393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=P/STxD/CItm5QzRZGV8s4lRpGjDlixOxNSMgm7f/4lhfsmWosrfAjWHwqECyWv6WKL
         sRoYz//S5dE5bn1xphZMrd3tuUnvAIS9gKJkn9zrh4Q22qvtSzOrko6IEl7Ju16CmzVN
         TavUkwZFlR7wMvsG1oPAWmWaNkcWdO9VOPDMltc6L/KU7MYxXm5ezJwoitWVrY1VbOZd
         x7E2bYqfCgba32Gk/SHOaaEvP95vmqdARWzeYTJf1HmXdbqMHmUywLq5Pc4g/rATXjgL
         Eer1ATpzSHqqNehZ+U76BNZLZbDPkWjM2ksc0GGThBqaQ6fsryOqnYj2HcXiFczh1zwk
         3qbw==
X-Forwarded-Encrypted: i=1; AJvYcCWqbXn4sYOZgnJJadBns/kBdBacOldfOx9meb18Wx7clOIhotAyK/ZpJkNyx9UedNeyJAKxn8xEbnNs3TMjpEpI@lists.infradead.org
X-Gm-Message-State: AOJu0YzOlVA7N2uuqNa2xn/EYHdm3SWdnKZOOClsHY8H3ziCyamae2bl
	jLymmZ0NxBtyXDuYKubpxZ4v/fWDXy/SsgUSCP13ACCrTKLCUYX9Hvx/
X-Gm-Gg: ASbGnctcsM2pkkb2MHv/b6LHl+TCNIHhBNm4qX6dYaB9Ad/dvnxaqgONLvUy7GwhpAT
	TdjVN/zE9YrrhPmfd7upxV0yLWQPSxrB7wHkpSVwgue/VMbf/+eeEFfDL0iuJc+tCCShoj3pE8A
	eKFsHLZBbW28gs1cI9S4/Mbt3CGm2b7pUb5rnPxqimiE/i4blvaoFLpd/zETtp+i+QX5psKqEz/
	4q+bqYKVGy8RUCl2lpx3mHd7Xf8rHd+Q/tS1DWM9mha5E19MffFQ6iNlKDPZR9R/H4L+BB653ya
	2ZXPN/KtwdjD3TfTiNnI16OE5xLzqx+h0TyESnGDPM9uJIfb1OFHLo4gk+rtt1woKscstsrDdCq
	LEok=
X-Google-Smtp-Source: AGHT+IH8RHIqmgqFH9/PYcKJWUdxyaFMM6Kq/4bBmlVBjq5NMwMgObIJXACByRuQ2ziPGn9ASPeGPg==
X-Received: by 2002:a17:903:2ac7:b0:235:278c:7d06 with SMTP id d9443c01a7336-2366ae00e80mr122624655ad.8.1750037593408;
        Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:07 +0800
Subject: [PATCH RESEND v7 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-18-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZxkPB9WtUskYsmB64PvR/FecyGxWdQ2YOL
 BsUBeRO9XKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JG3eD/0ZWUsTwgTP6BVPRrhBb3M27+1DBsSZqei3zPBEAKmJHMVVMj1eVHoAGXno6RUOXd2MgZG
 1IpvY/dAJ06ulttFowr9wN2W1ZsdWANY9km7h7VSPfmcb1P7qa3+lKXTH/e9xvEjYuA79fiw5gZ
 +e/1mqV++Ai79/O4lA4m6uNHyw897f4dVQDiOwS1wPxFQwlpQZl9a9MN8ob6Pz+AZ/qYky9ZHBk
 RIZGmtroWuzvtOBsckFAdNLoaR9gzloq2VOvzqJzDrQLcDvxFirVy5gTs5jf4czv9l2iR04VxjR
 ATJs+PEXNAX0FaXKSFhpfFoBEzQjxRP4dNmWaUIjue/p3onMJ28G2cp+DR4mzI/gAGwA9ckii4v
 wPsRx6920SpmSLx3JQ27TTjQPm5nPNR7qejV+sXY44NnSicBmC+EhjY8DxKKTOfpePAm4T1EyKc
 Ku1cue/gswf9Uq92t0l5VuetQ8GvyrvLGghtQEy/qkfngMsV6ew88xqhXBuU/JdAjU9+p1Oa6Sk
 8jUYYAUqIrc1drr1vEU6CgNqm6qPLr5UGjAYbdpXb/LQZGNhw/QStM1HPgYzvbvs4L+E6uk4jrI
 HLqbrhp16ZiX/6uN3AS78HU0ya0IStsZU6O7awGVzrvsx5gHvH0y9Nrwvgo19VcmQT6g8fXxILp
 lXTFuPSNFf2jraQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183314_010901_1F9419E7 
X-CRM114-Status: UNSURE (   9.46  )
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


