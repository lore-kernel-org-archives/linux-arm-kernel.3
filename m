Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F94CA0ECD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6IrqtgdxmO+5NxhFJl5j4k2CHU9lAmIsv7IgP3iuNM=; b=5BTz7guxGJg0sHrCP6DawQUUCn
	vCWVdv7hxltSxNxqDbEBDHIJDkJm8s+os5D9xctJmpIlZoZTm+ntkiMTMW3RMOUV8hkYXJlJ63Vxy
	9+/nuEpgO2kWQgvvGeDyYM72D6kfBwZqopPInNshSFNEwcRDnOEUFvZLhqy8NNo7O6PzOsHAa7/fw
	ABg74blwDAXemMtQ7YYt7tePBpGtDyC9za8lAErrQwhEqqrsfncrLWLm6LMZjjj8zhCTeJhxN4v7Y
	ud6umZUYIfKUiePC5dxtGHn9Ua0eGbnkkr/lW/W7YbgRLO2jjSMHbAz5BU3eOu0QjK7j+heb504tv
	j/gErEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUQA-00000008CH5-2iKx;
	Mon, 11 Aug 2025 15:26:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0q-00000007uKo-0n83
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76b6422756fso6117130b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920591; x=1755525391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6IrqtgdxmO+5NxhFJl5j4k2CHU9lAmIsv7IgP3iuNM=;
        b=nHQvWhZl/ltUoDhgQdDYIwOLQ49ynZQvy8+rlL02xslbicTGsx5DL2DJlnxvZYtsnQ
         z663bK9aOtX32AMH9N+cGArUIM+5L/iTsws6OdMqv3VwBdqdVRiqa/I+xs90llffNRhe
         ilmw+F56crLV4GIsX2Yl/Gv5aTM9jLYhs8HuLucL4Vx1pq1Uzv68AWzEyPJbVwcRSrcc
         x831ncbxS1SO7KF1Jbd9VzU1FzzDzRWAfK2ZmlOq99dLwRIs08G24yw5vwATRDfxwdHL
         jgMACnfJCEWJa8GYtzBXZ1YcbeBetoeeBODxB0DDMLeo2lG+Lgo6nTzZJZAYOyZUysfB
         uruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920591; x=1755525391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6IrqtgdxmO+5NxhFJl5j4k2CHU9lAmIsv7IgP3iuNM=;
        b=gApe6qeTIfM5EmB2zKPEb0yFesRDZn5AUVBAC5LQnH6IQQr+GmX9gM60V00u/kdC49
         7pmlbuGzyBw8TKdX5p6NFh0qOSFZrNzUNn1u/UoYyg404Ml/ldFDmRnVf5FvnITxyEJI
         zZVvdWk8g8WOy6B0I3CjVQikAqBoWIajltzxkL/kS1h7GbaB9+T2H1V9WXb6GdOV65PB
         6Sznbud8D50iRVkavg1OJKmpjjfNNcUdDDORwPwJKqBt2obawDkQzgVpy+/m+PIdTk8k
         Fi96GwhtRKLnJphca0f1PUZuvFhGA0L0nfdvsAwFdjxjxAJ46XHHwJWTeHFwrkCjWxNt
         kNKw==
X-Forwarded-Encrypted: i=1; AJvYcCVFVFb54BXybi0gDrujSirNOSH6JJ6wwQ4slQeZ51iRopGknTsONnl/CiEMoMk7G84QK3ZZFZ0dAINsYMNCdl7W@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrw5n/lo2a7D0s6WOO7p1e8iWw/VYuW2ZMaYb1HvIMzynsRjSP
	ntRGNmcGqAwt9fkxQPSCugiasNlLuWlUL3bYphNQFab7L2bkez2m1zft
X-Gm-Gg: ASbGncvik9XbPn0cDm98b+3uhE+gMFJ3SMjyksBGky6gO4gWWcOa3VQlUELBQqu+sSq
	+65yU8GoRpdV0Vv1BzrulJJ7Ji7GdF6KStOiCCqes5Bnj/fkcqMdFXKvl1iTi8BAogHcQLKBdl9
	ILiu6IhZTBZTQGIqz2dT9//sz+nAyttZuFs3dIYJQoAAgYLnK/qnavQE562fuxzuyHRkRxSGQNv
	yzvXB22gAX/z+NcKUuH/lq9zRUW4zaqrSmyfHuuilINFL9ENm0jQlVeLfPPZ9dbWbohlOHPnHkv
	cU8vm7gaFMB37L/fOjsSRPllljOO+5Uqus6QDqTuZyRz6fhuf0ap5Kx6NEpmJzUdauTNVSGKsUw
	LwKOmOZls9mlC2JGIrqnNdH+6k5Pmz0eBoys7fge05TSqu+U=
X-Google-Smtp-Source: AGHT+IHjAtQwP+aWp0amp2HAfxxavIx04Q6gDYhnOvqodiiQYDQ+FqB1PnB8IQF25ASHJIttNYsq/w==
X-Received: by 2002:a05:6a20:5491:b0:240:196f:35e5 with SMTP id adf61e73a8af0-240551d6df4mr18725211637.36.1754920591372;
        Mon, 11 Aug 2025 06:56:31 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:47 +0800
Subject: [PATCH v8 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-15-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iQOR0q5XQVT28sD6ndbFpIVd6zE5nRLSJJDlvhWOuPc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZCBfFOvSHEgUCXK88RXHenFtgNmRrppMrfN
 axZ2It8yUyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JNI+EACRW8glfUF5YaGdOU0n3JljQH8oNkDc1zs0oE7c3+E9uNoYX9UiFiQlZ0GCHMCUZD6MFU0
 kgcgj/RKc/AspzvWwaG4Xi2rpJwIS+tLbtxZVemfotAixGxWxkzKQda7pC6UOqCAEebmOUIgAiw
 FlSRcJG9ancMD4ntZCi3pDqxbnqSEA9Rw6+IQDDMta+uRW8cFr1gL8fu1rf3ApyzJQrTd9aYDh1
 DFU6jSC4vvaMAOsezhn6RYD7wTo+nlVeQCPJgnXUtua8WlgLfWsWJmMkJrqv3PpGCwi0s11MdRX
 Vhz/+Uolqp1/GUcv3Jo6+37Od6QTKHD0nF3helJ8w+FdhdMJZXkG+UE0g6kqjWrNun35MzRUsGL
 p+7iAuLWmqLEXdikvzGmaD6SMeLLRiXYi9lG9EFXf/MAV3+vqye7a6kGq3CuLbyoCWg10SkTWA1
 eyKTs7X2axjRpX7RZUeYzBDQTefqqXDNtRDV/7VMw4+rykJ2z0ka2HAhlnzjUdPcKolIm6XA+BW
 MKyNmxUDIT7Jqe8YnBplsrMEMKN4kTYfhzv4pex0KucNLoQEInD5ntYuMG4UN51e9bNY682VtyO
 xfdkoBYhD+aXT+94+IdUpJxTCTyjhClJivuWi7F9Q/gXR/InabhRixJ4cU+fPWKC+A/4w0oHXBJ
 gjhLIu4GUWeu0ag==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065632_232542_85A2B336 
X-CRM114-Status: UNSURE (   9.73  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..0e414018f5acbcdb10db92bec6e26ba32e53c781 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -199,6 +199,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.50.1


