Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F8CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=; b=vt6Z9cRERgbLJBaZ9cYHqsJz/O
	DOT752WgwSOUv7Gn12efhzvNigj+XxMLa3bmfncp2DaSkpjfF7OpyghK/ErVEC2yXj76wgZH2CGeA
	RC4GhO3uD1tJEdKwCCUFsfGL64eFI7rxj89Fj6ukl0BuVYVs0CgE1YPpyrhykuNt/PGg+Qc6P2Lu4
	s3BIfTUd+v9Z1JysCWmavpapt23OTKpgXbot37aWQeFRGXnZpYHpkdvp2BY2ACqbHmok+EpB6pZj3
	0QJ+qrednoDk2MqZnuMs4/K6Xwru2l+VBIA5gi33rfJHhKo8nOc/ryCjPiUh700RmbDdvfRj+K0Tz
	+Y9H4PFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7cj-00000006cNd-3Qg1;
	Wed, 10 Jun 2026 01:20:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7cg-00000006cMY-1gnQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 01:20:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso6134204a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054449; x=1781659249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=K63KACLYI/HTK04mA86hxKGh1wmOhUUL1e51Ot33m99NvIqjSmY7YP8C66uBDTNuTf
         S4kibW9igctb+34nfeb6SClDUzgBv6JhcgxWCSOQ06s3Qn/SfEBAE/sec0CFtPDEEfY+
         g0qn/G/n4lxAZkba/ZOCMGoGY89PzGXmTMFiQhPFllh1VXQSGk61CgxV5nniobzluHdN
         ubFhD0BUCyvd5r59vzh8HSUCtEHikPZwoTVPAnMKXaefKVM/+23Yz+L/EYEA+B9CVImo
         E8hR7IOQ6T/BKhDRZ6xlo45/Ez+3Ko/HXo0Q+TWlCyvF0IDyavaPxmO9VpnSorUQ1Dle
         WNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054449; x=1781659249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=IDESSHNBM0Q8iPl2jw1Vy7B7/FzF8vJSYRqjSl/TZpo/xCEd/SLHcbOIoFmrY2J2lf
         n6xH4cGuthSvMr9xTnWqmfiimT3fWCojgRc6MLc8oYg0gQ62zNCtTp0K0Mw+tF7jmwfp
         HOG2FTCkCZ9zS4nSdvBHkhtpymDrVWmG4TIyh7sv7kvTsxBkJziMNDEu8FKLtvVDpvI0
         jGe2AoTDixrK0l9IWfYLuOTp8RcjuJUWDE6Ivopdj4HLtIFuORKus6sv5EkOs16LpXqX
         sCMZTaJwJCQvHQlvl3xOwPZ0w0h4EJgzi8UFr67CFmt06RbMs7CREVWEVvn6d5W1MAjD
         zZaA==
X-Forwarded-Encrypted: i=1; AFNElJ+IwN03xeL7weBKlEpVSeZq9hl8g4/ehFQLIYCplUVp1XNRvB/SrnmihKEf6kGieMob9Cb2RaNkm9IJ4s84lc4X@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6gtX1kFj6SFWL34itrx3w0oQV6urn2AXtQWBPSZDjr1BiF+g
	vgawhXw71q/GNsE4AgEeF4pc7V020Dvy8vPjPDoCJG4dlDvPacur1mdp
X-Gm-Gg: Acq92OGfjwalMjEWHBlD2ZjTO7iPuz3ufSLPqlIQwx63FuF6DzMRA10qRqdMMuzcaw6
	eMEhJqOXNPKd0+f9u3UDVUoceYtuHNjzWA5oWo+mOWBqdlyoeYrcMZQcgW1pc0hMO0/YEh7GOY4
	VPCk4DIWPnchaNRhAH/LPefNlGmSKjNuLkH70RenyUtooSez9+/nNw1rZyAdOPYjwJBLS4sRMfP
	3C+lXTm4f/fvFcl19UYOvSg9gwmeG139WX63WIFvn2nMEFXW5moqg9AMT7q0TqXgPh7cXPKp5y8
	5gex7Iz7SWO12dyTSQHMVX/KGvoU1pYQ2m5cawql5kf/awmxBnFAwRnVzgLYzxxjkxXaJO3ksMY
	eJsyPlvY93cBCFJVdb9Wr6G9mbvhAd9YdaYDXPaKfKhqTMFzRhU3u35UsNQ26d5gKipwtaePna7
	lI+ighNlGJ34IDApzwAOdHht9KUhqA3RhasHMTeKvO+1c/dRvn/qejgZpa8NN89X7k7isywX1Ri
	8grvnlC3B1H
X-Received: by 2002:a05:6a21:730e:b0:3b4:cd6:891 with SMTP id adf61e73a8af0-3b4cce1eb3dmr27487969637.20.1781054449584;
        Tue, 09 Jun 2026 18:20:49 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm18858370a12.24.2026.06.09.18.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:20:48 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 10 Jun 2026 09:22:22 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ventura2_initial_dts-v6-1-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
In-Reply-To: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
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
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKLxQQGomj/MY0QPBIqzFE4b/nQvxy7GBQecMU
 jN9+PGGewqJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaii8UAAKCRClg0K3CVbE
 gdXPCADAy73/bW+SdL3BxXS48kI2micWMc77f0hTPtW7/ARo38XhPrad/p8y0qxLcx/U9E1PmLM
 ysqm3BOxFtkQfLPmWBl7TwNquRhFRZ+thPHif/iPRp92Pi5q9SGl6F9qm9PzDzIrWPCpytgdrCl
 xsQVS6d33NSECbhZaK9tFT3Iae8PDyqdVRNYtt0liewHKki8wtcdpyecfgxLHWtpeCOsYEesl5M
 Gkb9Z8asnU9gEwDT3EUuoX0YA8PmltZEP6QfCZ/VB3ZnwyT1Tx3BWwpq8gbjXR5vZqLxENxqo/Q
 plQh2rV+g3b3WkjimKy8ClF/nhg6n2PtbzF3Cwe3JVklbb1i
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_182050_462409_F44AB157 
X-CRM114-Status: UNSURE (   9.16  )
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


