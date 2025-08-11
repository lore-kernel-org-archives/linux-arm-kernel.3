Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1A5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gawbbaq1cv3blqa0/+0uXm4lYK8e4F+yAa+5XRwJxFc=; b=zdG0QWu7/Ne25eLzXtuNclqwfQ
	bqnDtL8p0CgLXGutYeLuTtGDj5hrZYKx1GwxGC+SLDCvAbWWTzzNFclp1KZtwKH1qkO3OwIc3Ky23
	CB8cjQqPMX8Ltbhlr6JQ5FDUh0iyaEP8kbC/hDaHnKUGFK5ZYfDhmkxeItkODOsanimcwSu5JNlAi
	us5gtFMjjwHN30rKSTcMv5eCuXPknylGSbgeDgeq2jvSNnuZMF3B7y+N+tdrvOnZ8rieP4yudziAs
	/ejQtmFFiFag8LVDwwQqvv8iZ8Qj7zrRFmDor4tb+KQwl4SEUDSTyN4mkSaAE50wccky8R5XUDliw
	0y2W/kFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUVL-00000008CyK-1MMB;
	Mon, 11 Aug 2025 15:32:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0z-00000007uO1-2DzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76bd7676e60so3674763b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920601; x=1755525401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gawbbaq1cv3blqa0/+0uXm4lYK8e4F+yAa+5XRwJxFc=;
        b=M1FliacO6ePJQ1FHwet4ODPjLCGEt8qOQoJemgS8mk7l9B/vjGp4fYGpWG2nH/f3QM
         /yhOi++dtMVb6LYjSiqwPjL132sg7VS5SBIXXpyrCyNuN96uS9hF8MqLcWdSVT1knieF
         lXg2evjfqzSXnFJlw8riQ5fTenAVk3HExFCBb5HDQQEamqigKh/lKZcQkb4umykdeKIg
         QVKn3ra72TQogsfSdWeWaw/1G/ZBQKER7Y0gbnnrwcetP0oxCKUlcg5/EKk12UsI50aZ
         crs6IiBohsbDjxCdzoroIVdj8RKIYkMhUtgCKIqLdZZiUlzpgZNme8cra7IH8YNyOQcM
         NHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920601; x=1755525401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gawbbaq1cv3blqa0/+0uXm4lYK8e4F+yAa+5XRwJxFc=;
        b=DvYl2275F/b20lbBqrmhkntWPm4oPf6ClZ/3JvCAlq10Bkwqx4j/V4CMXS22e/tNvI
         Vkc1A002yz5U6E/L8VCwPY2XPa93V8hk666VlJK9gffF5Hifg6eWPyxyJp5E+DVUwFGE
         HqpLgUYUb9LtPcDz614aVHdyohAFGiK6NxnAYsKzUA6pqrshvWenni17mkYtDp+MlEL3
         kBwMv2xw6VUXjAkg9RnLH9ooNQrS6vDRwWyprLsByGXo+U8FiKuHpbsYrrwfMZE3CTkn
         WkFm2j2qww+jMPbKISXLpyBZBhvxhfghroEunFVYtpPK1f631+NHdwswFQ1Sd2+6nabV
         BC0w==
X-Forwarded-Encrypted: i=1; AJvYcCWwZTZvXn734ZrPo+VRUsX8+O32ecG1m+CpG5qaUCSgy/wzLKd4SCXJoNY4G62QPVqZeH/MzBS/uHHThD2gT59v@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+euxcMyvHJOiFI+4saQodRROrV1Yd16WW/BQropsBNZolytr
	7oY4CsWrPebH6KSTJZpjQJplLc+ZANYYSbxOGHs9egRzR2PmgFFFJvRY
X-Gm-Gg: ASbGncsZeCeoqT807ug7jyE3C+/27Mb9fpbc85YPj+5ZkfB062FiIXFPS15NGUELGUY
	snyDEbnVknjoFdMoTqlV2dXj+rC3KxfK2zjgKagz+wWoTuJl2UVxm3lEhgGbLjICx8TNUWrRmUT
	a1mdDxNAsZmZ5Aul0XkWS17iuHBfHn/rGKbKhByjl+yodXAZ8TIdsm4j5eEV81JQWprl9uFTW8G
	ynhT+8f/tLx6w1BiyGmEQCATMO777sJCZEcX7bXg+8BlD+FlxbLmzzokkyArtPqn0/NIUnYI/uR
	BVlJZGj/sSLnxfjYW32kYCXOKts/evFchQcvHe6z5Ml2SYUB7jmy7On7nDxyylZybnzzaTDG8kf
	+jUf6LSxGZjr4moUTgbZWBzP2bru1Er+BF9LTbLUi56zVD77l0P9N+C/8mg==
X-Google-Smtp-Source: AGHT+IH71WLPBpcxqK6NsHSxFwYjB3csw8AeRr5tJLBkY9NMtUFUY4SScFUChnqL7Q1DXY7ZMZtZXA==
X-Received: by 2002:a05:6a20:6a0c:b0:23d:e202:1abd with SMTP id adf61e73a8af0-240551c2f84mr20231912637.34.1754920600698;
        Mon, 11 Aug 2025 06:56:40 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:40 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:49 +0800
Subject: [PATCH v8 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-17-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=YgjiNgCKjs/DNwvy+UP2u58jMtjv8ObMOrXgHvX0nBo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDGjdP3nLNuLMmtNtY4KF8rbKUlqQRn7uah
 mWWRWk247KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JPvvEACaGJTqM3D81PYdorlbmquincQl3+rGkRN6249kEQQ/01LRXsYF+LdRGWlbDaIdCZUOW6j
 wgdVy7NERRJFznDF7WMuNSzXNpdm3ZmuE4yCOYiFXj8itnPZnNMdkOp+HMqag5vZmrkS2Uuc5Lg
 JDt5ITfLVaHXKUH0wsLAOCad0IL9z2TAElvw/eic/SXPHXScg0qVnIySzg+01Ae87scR/xNkty1
 C2HkZLMCIEtCcPE2xPgChQVvutiYeH2M6j7BHnKMQAHka+P98Sw0vZPsfb8uqupg1O+ssNc5Sbf
 /sR/zVsbpfBKmdaUKs2UlhUmgq9aXS7+t1Kv1P83DDVgC0Scgekdopb9KSf4ISJJMD/vAO4s2H3
 4n/A4Isdj/9SkBHvbLVURyPO+IpYQW8JGavxzUj4UKi0+oN2f9MFHhojN8YWfs80Zu6NZVjGRzv
 Cg+CROdzA62zhmiXDD1nAEaF15dJZRDFDbbcZt4JSMVx0ATTENqgIzwGBDWNpsGwS5EPQMCjBzg
 E8inRRuPSnWyYQECWJGSguoeVzFvQzhgwOvrNZ4ta1xxguac5s0vM0gJROqY5E8LsC4h4/iL2MP
 l0NjbWuirRTThHbxfeZ9xj4KuNQrkF6C//hQI0xFWkrjldsTAyDINANiyxleCZP62sJya23+s44
 MD24C9318a+OcrQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065641_573095_4B0D4C22 
X-CRM114-Status: GOOD (  10.46  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.50.1


