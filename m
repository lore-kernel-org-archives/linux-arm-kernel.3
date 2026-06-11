Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3FACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=; b=k4vyLiaIyK/+93aCzwlaF/BnmY
	L0RvdVD8G5PcgjVF4dMvLGbrCxM6s3b0FPT694vk9Ossyaxl9CRi+WAvnZasJu3qjPJblK7cnj3Ks
	8/uRLU4xGNZYa89shNDyCR9VJMWDMst+wroh0nnfI1i/zha+b2Ba6BwfgEOY+Y8wwuZN3aSrb8z71
	N2gg55Z27rIrxG6iz5CeeeCx9z0xt+7bgnmuVClakPh976EBw+giZd/FXLf2iLVjnQiI130sEnr57
	uNooW64UL7LZmAC1vMvFNt2ViPkEKAvrxF5zsI0Men+F+g9PoZb56gaOJv8VI7eCrIvyqaZrEMbmQ
	zXgT8TxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbLp-000000095Oh-2sQ5;
	Thu, 11 Jun 2026 09:05:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbLn-000000095N9-0FLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:05:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8423f869421so5783182b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168722; x=1781773522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=TQeMaO52Hd7tyrBFuFG8cqm+1vFnLfCIZwMnY7ESqd6+9wl2Ze095M9iQ1XtEbA8A5
         cCMbeLL7keiTb6paeQ36CgFkagatV6/G3N2fHuONdV1Zq/d6S06/adK0KmBvzi6aIcBQ
         h1TR7Su+V7hgHnZgSFItvqK3LBu2DGhSRf4xOJgrHAI+15plS9aGXGIGoU4FdfRrJXfc
         K+gRQYu8oMVa5RFg7kGRFCWMZQl51sV3moPHbzSsEz/tRz1KcYMlHwb0LmVOHjWtUeyr
         TgjwK9pOqipCMTUjp2rlbPyMQ887BKiqSVOWo3r4isVokvucjKwxNsOU2fS9l+u1gw4r
         xFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168722; x=1781773522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=oaY2N2JFZ6dExlLxiuLxyE1fMzX0SAzA/8pKwCoQgDkFWjiyraLYgju0AmY2UGbEQ+
         qkBtBd0gbusLEf4nh44Qij0nIGLKJ8cd0zHD30wc5OstBKtuXDurxb9TeBrsz0C/qaz0
         5U6wYdq3scKbn77N3DSvT0EZmNgLyRbmjC70cbRCWmL7Z+UV14OgJ7YYf4Vx5/ARujEU
         cIDubgD7Eq9fGBh9wCd99usS5BNzRHpDG6YFHJ3MgPlhjPckzHkHc10LnP/LUfq4UIqX
         oAMaB5u0RsnCnS+9aRoPoxnm4AvqcLGACQ08yTjg8KVXwhNIDjB3DQOiqocXJds4E5Oa
         YSSw==
X-Forwarded-Encrypted: i=1; AFNElJ8ShyAohUh2GXuW33De/37AX51Q9pYWcXjkA17JJgP5KvBFH0Glp2NLfxA/deLyKuWh1Jui0tTSEPsc+vvrTMcw@lists.infradead.org
X-Gm-Message-State: AOJu0YxRZQaP4UoWyo5/jXcAU0Yw4PRox3jTE8GTYqcMES/8PFq/3dZ7
	urBlhzu3EXag30V7QCHIcyuP2b1uCAIgICF1XD5RpA539U7WkLBGEgs8
X-Gm-Gg: Acq92OEbUeYKK5ntL4J+457wmYk4Ipdho/lbNCJIIjcj3Vu3/y8l7rVYd+ksQtwmlY4
	PhLz1O1xnDHiXZkLZ6iUD4g5QUeWyhroL8Jfsmybxj0Qn0ysIC28wvxBCtrk5UrWu1YMu07LyIF
	QT1LjGYL1AYnAdjiz2ILvJEZl5MPc5PrrullhBvR47WYiYa2qJGFiYEle3PLdlt7Acat32XztD2
	o0maLUhwPgDD3cVhvMfLWBf+JpkT3gzMokGoQgz0KoE34+bNRTMZWcU5emSsBWQxW/qFDAPOKha
	SK/bcuaFWsIRgRr8Bnlmqv1+PAMHdXRi5vZwd1CCJT7zxFNZ6bKdMvq0dgqPu5nslBFmISruhti
	dJOFGfoB6FL7c+4IJsnG/Gu8SAsk4YSr9Bb0OH04uJP0ghLdcX75ZHFJ5kxro07FhNOjZL74hyd
	U5ylLxljVrJ1z3ZqigLZuZHzINewF/Y6ZwcJaRB78h/x+R3o3/hS9oJpKTeWKKypZ4XwXDSaPCq
	Q==
X-Received: by 2002:a05:6a00:84e:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-84336bda738mr2313252b3a.40.1781168722062;
        Thu, 11 Jun 2026 02:05:22 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8f8f5sm1456306b3a.5.2026.06.11.02.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:05:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 17:06:53 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ventura2_initial_dts-v7-1-a61d8902bc5f@gmail.com>
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
In-Reply-To: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKnqyMNDpdkWIqPHwR0dlpgB0K+02uT58R/Zlv
 hr8jCJ7+g+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaip6sgAKCRClg0K3CVbE
 gTJTB/9N8Hh3uD2G5CWGKkfbVcJSGlj9ZoSzF0Glya/xrOJJFPVtC/ajfoCSwTVy1rhaYUG8jBL
 t/E1VKn5kHNWYTo1MHmgJU5QtoL2Bcc4qXVqIgqN0TLVBBmipTi7KsWH2LEZuJyjKsyw+i8UIia
 vJxfeXnNdPDZ/VPmgBBf7TjWgdDtAN5+04rc2SXuZiiPva+Zie5z79VWAXANblXvXaSZcRwghI/
 8JR/rKkBskqPb5CoijJNRpo+WKR/9uiBpdFyBZFNHVmrcc8R777orB33SUakJlNh/pWCWFW+D25
 lbYo4Is+5fnkYKLwGRnmPOA1mW0xdBjphl9CkVqnkNbDkimV
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_020523_098372_B571CDD0 
X-CRM114-Status: UNSURE (   8.72  )
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


