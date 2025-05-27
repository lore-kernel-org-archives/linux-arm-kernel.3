Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=; b=dO7UzGRqn/AL18Q0LbWEIwHgOR
	Cwq2RnM8j7ErZmMUnmPT0YeN4Ch9e+mOmVPLmb5uAOKMjRUVm1XRxMS4SjssTbf3qcu2ZDTZqcsTu
	HVy7HBX2Mocv8rizxZP9hxnaASUSA1Aurc2gNB1o9qFz1+eK5CgliWV5j86bTgJYePrvSWf+1FT1N
	94Pv6dKcpURZjeRT51NM0K1mmI2sUVDFgocq9/JIEQM2coyS0yvGs2dk929zQ9OB9LioY84TeQpRI
	MDS1FDe2VHfIJfnQhdtUcMRkAFvCS9WH2Qx0KccB4wa3rOr90z88h4OBUr2SK0IDt9WiciiTKzD5e
	BAFJcvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJw0l-0000000B1vm-11kg;
	Tue, 27 May 2025 15:14:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvwd-0000000B1Ai-2i6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:10:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2650671b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358623; x=1748963423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=YJ2leZys/w99OqlioOBrI8cV5WN5HhH+nLK7v8CLm5cZXPpT4SyklZvgcTQUUr5vxl
         FPuRrG+deja0pw4y3mzwjCM4B7gx9iehgq39P9TDjlQK60dznmiY2+uiz1Yvp1o9qIVP
         gLUoPty+/aGEj1vw7elQijtimJZ0UEbbfB8cZ/cIInCy2jE+TvBLueH937pvPqTaBVTu
         1t6Q8IJUuutG/f56GSRkOUXaSHIm0PjA93j3JUeEsV/jTlXp9IXluqj3KrKRaa53QeDf
         Oo5lqjsrx3i5oqZUbddYpQQt4hjLwF1NKT8EMbMp3G1M3tuS6jHYEcLsZTXS2l+gBvRE
         1sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358623; x=1748963423;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=FXX4AzGoHyypACoS0fWRnrL5z6xQ6z7Totq3KlM9vRN0ko+bcXnBFJL7KThZH6y/qE
         yC5JaezF/+N1yxIdxr+Od4mlCHishA1vlB0mV1yzAk9u39SEKC23zClWxTCsmBJcGxVu
         aQh9t0F8lsB8B0CUFMcuc7QesMltKxrFxMhrzd2N4yJ7Q1JEZD1njFbBmTFNy86GUemH
         GNWLbU7GdJSxYC1AwaVj9lZ0h4kNrtkI7J1hSGZ6gXHEqGarerjGojJ5vf+D6ZQPLuRU
         AuXHpaNF5khPwckCwVN8KNtFxADz+Z+ad8zfq8zghyqBjxUIOtiXBy/q4Qqy/BooMyB8
         ElaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd+R/yHeRCFwWSTMRINJhI5K/vAbf8EhKBtCnsX6SIPz35d/NnGk1bg3mU7ysyUP8xsrjP17lXhqGVzLascjw7@lists.infradead.org
X-Gm-Message-State: AOJu0YwZl16ApDZkYSwQHPti/PtEvrk8i1IG95Oc8T2HlUMNCTqcN+rs
	fQrZ5o7v5yV6muBqNhWhvmCPUZXGjzSKtDT4ed6VvCkPDD7sm9z6vaZD
X-Gm-Gg: ASbGncsFg5NzvuhBBuNA2j95R3OhdVxzT6qzg32KViqf3QxjVV3PxhCEPja2oWAmkn9
	JKqnMXPmvCVJlDWqcW7kGZgVA9WLkhKYfIkAgnmUNalUqTG1RpuKv4rEIChi19VX95Mx8/vsnOP
	vhUAsVwM7ZSJ0TvD6zGHoPWGfheChiagAht9lfdiIT3uykD7O8yUNiIDqzMfzOn3dbHuwbwibrY
	lafISWFhJz8EDooC7tL377SPlYAIx5JOqxSAGAVoPzdAtzVibY3mdqIavyxJaQLU0ua88dFfwuy
	gfSL+u3ObsqZVvz/zAexErmV4jjxbMRmeQNsG3jwwBj6cdw4fE1GACDrmG/cGWvdfHxeQVwC
X-Google-Smtp-Source: AGHT+IH0RFT0xP+3+dNVvU0bw/BAG60Nd9T6wKSR2SIUzdNr5GW2guXZ60yJdjSdkxe8OyWvVV66/Q==
X-Received: by 2002:aa7:888d:0:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-745fe0c7a55mr20646910b3a.20.1748358622652;
        Tue, 27 May 2025 08:10:22 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm18869987b3a.31.2025.05.27.08.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:10:22 -0700 (PDT)
Message-ID: <6835d5de.050a0220.14ffd7.0e18@mx.google.com>
X-Google-Original-Message-ID: <20250527150946.2815348-2-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Tue, 27 May 2025 23:08:48 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527150946.2815348-1-LeoWang>
References: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
 <20250527150946.2815348-1-LeoWang>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_081023_690691_0D8AC2EF 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0


