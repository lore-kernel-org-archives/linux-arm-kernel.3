Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2258C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=; b=Lgx+bOlclYnkhAe9Y7MkwXAGeG
	QBKQ1wl09hM34zZkG4NvpbcOXBguBcl8+tqK3JOO6iB7VkkW1drA/EVFpMDpn0oyl3y+IenZLpGBH
	Fhi6UVTDFv7cy9G2XUdWf9JljPjDUq3mFJNv0mIeDxDrlHsvdwbMHhQMyH+vr4CNkNMjY7UJtVD5k
	9ASf4nJY31zDJ/pnp0OSRlYRctA2UPlbLTMMnFl+9sRBvQiIqsOBgJFrlSBwlJ3ox9rkb5iv1tpVh
	wvwgaEJLaIA+YmCb8eAhzcxzivCepCu9NTZTOTgBFtUViLBJ85+a/ATzHTptdkqUjEx9TWDq7SYtd
	/XytSNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmQH-000000067UB-1clX;
	Sat, 10 May 2025 15:47:33 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsF-000000064Fz-12TC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b1fde81de05so1906166a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889942; x=1747494742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=KVNfwGZwnGwmnTNMsV7yEHavc6cWWzno0mCvPqaifOrlhzcoNJGUMxPN/e849PYORY
         rdoefF9xhy5kNeXNqEUEg9ra05mV4EwtKgiR0hwGpDQE0BaqTgoJtT7EB0Df7M1pZrRH
         5qj+aPLMDishiRukFVL1tDAJt5rlOdk6TjKDhooLVM7UTyNRTot6IHJ4+9kZXZgq8MrL
         lS9yfp3wvPRfpp6TTEAYO8WlviYMX6uxPL6yfh3BmJvHxBxf4lCM5h2VOuDG9Fl70gLx
         SRSih0nP0bvlUx8MIapiuD+wAbdeWK4ub827fR3fsdP/I5uuEZ1RmTMap5D9kvjb6SHV
         6XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889942; x=1747494742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=ROOD5jnCrMQ7QgFvqd7ONb5CwGAGgHILLye8KmziXlSd7Y7ZjlKEAqnKt0vNiSg6sZ
         2EpaOy3J1dqsCk1Hppi3mxmVx8WZ/yBhI/rR622/Ps94JTPrRs/hcvrEJay6CrB+a2y1
         KQnkbbT42oWhWtdvzusCCsfr5WK97dk2ST0r4i3utr3GjrAh1wsNBBFX40Nxm5vxv8M0
         7CbHp2SoGcuKD00XWTMdP/FIhumFAvdJKIFlNxECBr9sKCs0Yd1wvdS6uIo2xxpem00Z
         OraRlxT6U6frEhHtabMY4s+WE7kSdzV2TPgbmGhjPRe5UJn8v6LqPx4WbybgOKRUZ8th
         PIBg==
X-Forwarded-Encrypted: i=1; AJvYcCXBSq8xyLlDuD78spl6JAWtMrWZ3W77NiyImznHajtQnYPIBkpiwoCVW7axFqy0UNPHX6fQhZhzuCoHG6uvKfML@lists.infradead.org
X-Gm-Message-State: AOJu0YwkDyjO7d302+HTaHu+YcEHc32Q4IvyJGbunHD8IKWe/yUqlwEP
	EKwzkIUUmlTwCQoOSS1DrmV2+S9A2jnSpF96nzjVxlKFt9XFuBDU
X-Gm-Gg: ASbGnctqozK18F7mbNrSuHXJUJs0kAhkvpC4mTY4HHGJka579CxLnjEqKK0/B8HrCNK
	dgwSQVup0bWRZvGG+9ZM27Sq0LAInWsPEVgEaM5Ep5idKqVSMq+bthJSNOKl2JOYEG+vKBoWGwy
	LCeuaGYROua57x4nKHKLaHbL8KIENfV04s7MuA7Z21MnnGvCAR2b0A/ayi8PjMOkixLQhtaMZMZ
	+eMoqzWdLv9NSpHUWiQvjPt0UaCQ8NfOXMW49hGuahr/CRnKNqEWragOTIz/JCFn9aGHW8/92AN
	sFcQLskfTI0WLQvX43JTKiXYZYnuuIc6bc3mzN6YqhR2Bm/4eWuzPg==
X-Google-Smtp-Source: AGHT+IGjCiaq7DPW0ss5kSC8m5rXz2rGLoebcSRmwEAm2E1zJtcjgOYnNTLJIp2QwACkdCzP3uIZDA==
X-Received: by 2002:a05:6a21:999c:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-215abc2a292mr10479573637.33.1746889942388;
        Sat, 10 May 2025 08:12:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:57 +0800
Subject: [PATCH v7 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-16-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yczRzniLnke3xszhfsW+XGkbCWQ5y3Qb5cp
 1duw4wxyu2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JMKZD/sHdqY7/eb2hXZJM9x0AcT6jctbVMU0POC1oe8iZFkkQNQhUTEs3yCishcMCmvQkqDCgK0
 8LbcyIOxnE2TnWL4QoayLcdi3KLGaoLZe8x4ahuZk45u0jnpnAeR7tb4PgTdbSwUM/7MJmx6XqT
 tbkU8bNsd4UoBDpuGVQ7E7f4JQULOxWYlk307fNflieW+4D1Zc0kr7Azw4ZNUXzFSSkxuKBN41R
 oKyLfYtyatf1edIp6kiM8SCNlNhZUPXtSsn0kVEhcKIZYJw5U7yqZqACMzQr6cYZZa98U5CDkmx
 hupO0pVY6XJo18lOwf50WcrM1pZpBT94JY/2cPdRf85LLbJg/mUxgESCs62YIoY6U9Q42V7flLP
 VqhwpRiqKapsynvnaOaL1DY0ATTVtUG4C+rSjVsjEJNlrWGRnLAEjj4nwJ0kkREME/PEju5P/CT
 EDSig8hTX4lfUfvxE/h+G7K8opgOTh2bEsUY6RDmA9HZZVSS+4+ltAHHWMdVLA5TW4hrF5R2k6U
 Prra/uwS7fNjXHqaatz4be924qUmfPnHbvfs5hNPLSX/CCZhf4MNTseeF9fpeiCg2yJx25ed4lz
 lLLY2mxQLwTsqMK4/athAgSarEOX78leckjcmOE62hBphzRtb6QkfEg2TC4T9CwWWAlc1m2C26F
 TSymqJmw7zJBK1Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081223_292043_CB132C38 
X-CRM114-Status: UNSURE (   9.93  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219..56ac6e7f3803a16beacc74764262b02c75a96fce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -167,6 +167,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.49.0


