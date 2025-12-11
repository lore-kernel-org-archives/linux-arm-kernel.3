Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0A0D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA5RNQcEfirms9HgWj8AssmGCc/5FNo1GGf/ysp2RSE=; b=Hp7t3WXRfuTY4cMaT0nKzD2XrA
	5xvPP9lje3YlCTe0CHA7ZyDD05OWq3z/Hv3mdbuvZK6zZ8viqD2WDazM8xqkXtyDpnPA7p+AeJumg
	SkdyxF4FSChgQw0JGhpIgzgEu2N4vquvIfOgBICM/XboHNh3HUm5HuN8rJPRwTQWsbVVWjhB1DPTG
	Yg+X0S8AIXUR4OzomQBG5DUxUEulPvCKTb7ZDJSoBaJEHLTk9jB1La9bNbLNIrYTZn4vWjhrEHxL+
	wj5MrOWB1Gz62OrxRJmIr5Eucud5L23/Ie6cmWtqwK8BjRn5lqAUXQeg5JNhY9WqnEs1ALpQq8UAW
	bkh0qzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKx-0000000GPLs-0K26;
	Thu, 11 Dec 2025 08:47:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKu-0000000GPIS-2j5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442862;
	bh=QA5RNQcEfirms9HgWj8AssmGCc/5FNo1GGf/ysp2RSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N0E4UmYMR2ijnu8okYEs3ej0qTmDYPSsnolgBDBHQXQUyBeklOSMTxvmwqiB1XfUU
	 kN3ZpVQfS67dqTf19F28O4LUE8MSV38xyX7ibzXktLyUNi69uS23ZIJyY28lE5N+df
	 VBeUUNrZlX9i0MzdEEuxqoysSM/GgXD6esgTzWtH5H6Tcyoev2EhySg4EOCEDJk8XJ
	 GIa23Q/YY58ZvlrfHve5yA73oxn2+tA8rBnZhDPbz5bfvIEBVDYSuHX8w25wP0uPqw
	 /wg5SoDm2WGhjTpspHP7NTxW6ekroF7I+DLH+mP2eSdQELxc/1fLg0vNh+4Qd/zpZ5
	 kJ/XRzBv/LSKw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 29A0C7D6BB;
	Thu, 11 Dec 2025 16:47:37 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:56 +0900
Subject: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts property
 for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004744_882017_D9D77065 
X-CRM114-Status: UNSURE (   7.77  )
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

The device has interrupts allocated according to the datasheet, and
the devicetree already defines the interrupt property. Address existing
warnings by allowing the property.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
index 509bfb1007c4..249101b55cf4 100644
--- a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
@@ -44,6 +44,9 @@ properties:
       Input clock used to derive the sample clock. Expected to be the
       SoC's APB clock.
 
+  interrupts:
+    maxItems: 1
+
   resets:
     maxItems: 1
 

-- 
2.47.3


