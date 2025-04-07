Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=; b=yKkRD+NrrGEEv/6ZAll6YL+iEM
	EaQBSZrNmuiHgPPzo/F5bbbvstmMSLOmMwLkNImjp5JmUsV2pkjdbF5bAMAS1c1/YnrkeyjcklHWW
	oiGa4i2ckAqplX/3dxzuk/1yX6Yb/q/7htjDxrpg/1iOtbTReGdJABVpiObH/9MBM6LVGsfZ9iyAp
	BOm6PBo10QsKGxCTJYTfbdZeusA6haKDFpMcJG+YQlZt7+kFGHYH1C3wds072S7Njcx45+MEXpfoG
	pf/Bgc1QVfrJdS+KkO7aaqD67ZDn3Ml+JUZyUhBKnzheew9rCA8LYgun9/svNr7jiE9gqh6GRXT1b
	uG6S6ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ezC-0000000GRkE-43eG;
	Mon, 07 Apr 2025 05:25:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNu-0000000GMra-1FuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30549dacd53so3035586a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001217; x=1744606017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=Tgsmj6SHWMquI6qbcTL38qaPDt9YUgelrVFDjRopojeOr3c8KS4oNjvyxYx+B+8ton
         CkBGJniuzPeCD8xsZTJd4OVKmWwmsMdbBfyY7/wXhtVMoRXhTXoIazSZhwxW0lzH+bX7
         B9bqT+PXZkibo5LaXCzCBtS1lDDT5U+Y6nRlzh1GK8N7lh2Xs7wswom/Ee/q/0j+Evnm
         Qun5txm42lvz5R0JzTVS4feYxmv62Uvr5XqkT3VFAEqgjVbxpfgfNPcUzsk92HCeoKiQ
         qjdp78QRJ2rnHYUxcWyuamTpHSNSwoLwXpMQxihufiwLiqJlinm9jJpsh7pQH0xDmkbX
         bO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001217; x=1744606017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=vPdoerRTvgcPmtiXmItu13q3yxnNoLDg0eS1DAfaZBjg+sy9L5ACs8x988XBxT+QK3
         OPnMooUXOtZ/oPNQot8l2ttTLiAeD8JohtgOVIgYs3w4MvHcPN1sICLFEF3vCbLB39yE
         rCDeA29InrBPRYOENa8fbwiu0QAJx80lT1isbwqMalsGKSiAPC2adO9q5KtpVuqIUxt9
         Sfc/xf3U5Xujnpykzsd2e5IE+6BpO1R12OnG2IMn/aiJtJa3DGmenlHNs6QmTErHF4tn
         rfz6HCztn4ejjJu/7Jp4TYeLXFPX1OgsXVjSTgWFaiN27B5G4/yU470M6EQPbS50vJbR
         l3wg==
X-Forwarded-Encrypted: i=1; AJvYcCXTVwODavsaaH46kUu5Ua2W/+ra61q/VFtstzjOCNL9cphfvI4XFCb2tuiF+FB06a/T8BFXKRx7Dtet9R5EoKt9@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7K/Fxf6kBlz64AfA0RT6uSELBvtt1KkL7WLyMMeZ/i+eMbdO
	iAymPpsDk6hABS3O/uivRQXvSOYHjm6FsbWO2mG8d6j5zD6dfkTY
X-Gm-Gg: ASbGncufl1PQUvXkCZ1jA43H9DN2zHn2XmwZyzgz+7DJ5dicwsCgw123lTrkQFtZkx+
	tfbGvjCU+7VmKtt3F2rvxxQHYn01HG+f8TjGms2JggKc1cDbJePdn8ZYElhhtOKpuG2yRUMTqKi
	zUGHJ7kPq3M4N+QBiphqqMUKKTOlDGNf0i+VDuS56ZDyKxlS81bR4vcR5y54RGyYjEL20BhMZQn
	t0Q0cqlm8AL+43UTHNau3xOYaiHH6/5T12W3O1AUoQh5/52D2JEmgaL9fJ6emHIxBOlywyfh/PM
	ooZcavZySrqsikaYfDKZCuPfuEKi/VDe2K5MS2NIZkvSXbM=
X-Google-Smtp-Source: AGHT+IFp1o6jGnfgrWBgWwZCg12gAuSqGW7BBd8Tj07WjPky9rEWHsz3tgzeJQgC9fscCCvAKkH7og==
X-Received: by 2002:a17:90b:544e:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-3057a5bf0b4mr20505582a91.5.1744001217377;
        Sun, 06 Apr 2025 21:46:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:25 +0800
Subject: [PATCH v6 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-16-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iHn/Y14SjkGwKn8A7kTk3bx4cArLbVYEHup
 S3DW2jHrfqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JCMWD/9GZvoif5wFE9u7k5VLtRXa7bx03z/aftHbvMECDAdgV57PlyAlHnJqn2iZ0Vo8etfl3jO
 2UK57oGCoI8AEo6xeducqncsZ+ok8PNklu1uKutNYxcdlvBQOgJnl37DKm7uJ0SqfwnOiq1FNaD
 aCA9cm0EfH4/PnkMNc8UIniEHVG5En7VkQ9dywMsbSMw+03vXp95JCOtgAgpmUchmvXp/1dn8ir
 ZTtGxKmJjZ/ag5+93yFED4w1QaHJJsQttD16NEWPXjlhZ2IkZzU8mhsjoe2hDqDbj2V9tZ77QpF
 EQnNvq5kCMe1bQLWljMIGMwT7mbSc+PaQomyZFNIYE4b3sZiW1C2RJvqOi4y4MAaOcGfDf/o362
 jiSxnhxJmRO9qh+NF7/+YTI09ejh/ruGFHTIKc841iF9dRLgYu/SvQZ/N45sezzp5DeN46VkwKW
 z9VwoWf2mzT9QzDD99HE1SYp9Ym0N9W0Qr5fLd7nhWUPVy3uTsH51CcZoApxpwiFaiuGjWTdKeF
 Sg6snS5A0AtUgEr9R0SzxmM74UR+XryNNGGcbXwQeob3TWDEqbX5H7Cmgli7mJ32N0SqPK/dsGR
 8Cnqe/8ike3/pwrtHIGJ6mhCzYIIz+60ZRVXuHZp8SSX8KElbKRQWwLYj2AKZdCH4CksAC8SMVo
 jcnReLZ7raZBYsg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214658_339553_4D80A51C 
X-CRM114-Status: UNSURE (   9.62  )
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


