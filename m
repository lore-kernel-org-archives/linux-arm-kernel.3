Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07376D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64vyUWdNJftGuOm7IF2XaSwKPBkVJqodvt65O40/0gY=; b=gQCmuo5+Yu2IcPg2kRjgAQjyr0
	QmYexazKoe5MdjTEbBCTmVu9xplq2kEm3Js6IdZNQ3dpQKn6D0r5IH59VPNoaDnmexU7y9LO3RqfK
	N0BpK8Q0DNs21ITKpCwvY8SMMCMfkcFYT1TqMifjKYaE/Dj4OoEtk+Jt15mWkICNbAtpEMRSPZOn3
	NYFUiS8YSTi4ME9SLix1CNS/tLnMiIxxtQ2GSiRKa0soiZK5Bot411M1i1yCfgsfT0tAvchV199NK
	vV80WmczKZ5U7xU8+taadZ+XxYp+Ior4PSex0rrkwqtJ6snsMu+6Ri1jrqP0rfj3WmLchZCTft7fi
	9kjjLdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcK3-0000000GOc3-2war;
	Thu, 11 Dec 2025 08:46:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcK1-0000000GOZz-1Wqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442807;
	bh=64vyUWdNJftGuOm7IF2XaSwKPBkVJqodvt65O40/0gY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NOPKQ5h57DpM3vqHy81icDlrF63oyfNJcef/hUzn3NKElWk3qOLQggAftbYFRRIZp
	 nr93F74IYe1LigaTyenaCOjJPFMHRIGWWSv4VsDY81q5pIHdcEHSMq6aN0JqM7k73B
	 ayIoYa+pA5hSNsFS7mWVQnmhI+gjiFu2XXBvrhbupO7QRXeON5QsLIvOdwKy7pTR/t
	 zaaVcXEz5HkF/uoSOYHqGVJylkJ4G8bXmMz5wni4RDF6CdfjUIOk+FH6YfaqQRt23i
	 9ui0jkpD4X4IjsxSkQtsE3CBE2lhHehLuiNk4qsC79QHXFKITRqp6/IW6mwu4rWgbS
	 xrZborwCkR4JQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE9BE7D6BF;
	Thu, 11 Dec 2025 16:46:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:46 +0900
Subject: [PATCH RFC 04/16] ARM: dts: aspeed: g5: Use LPC phandle for
 pinctrl aspeed,external-nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-4-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004649_599281_4339D766 
X-CRM114-Status: GOOD (  10.24  )
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

The LPC host controller has no binding specified, and the pinctrl driver
can now determine whether its been provided a phandle to the LPC host
controller or the parent LPC controller. Switch to using the LPC node
phandle to avoid specifying a binding for the LPC host controller for
the moment.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 39500bdb4747..1456f04c2139 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -251,7 +251,7 @@ silicon-id@7c {
 				pinctrl: pinctrl@80 {
 					compatible = "aspeed,ast2500-pinctrl";
 					reg = <0x80 0x18>, <0xa0 0x10>;
-					aspeed,external-nodes = <&gfx>, <&lhc>;
+					aspeed,external-nodes = <&gfx>, <&lpc>;
 				};
 			};
 

-- 
2.47.3


