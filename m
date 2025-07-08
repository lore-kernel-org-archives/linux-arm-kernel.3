Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B64BC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdLp0YjegKAXW1He8H6sCHobxtr0SXLGuwvu5w7+xXs=; b=1pW1tdKqDzgr9+gMdOXw66n8FV
	d5wfqKQyTz53KyACcIdOKU88NR2fjdG17mQd1nx3wSm3ZjFtethzTgEAY/0Kugnqc1D7V5/PaAFFH
	TZXirGoTOAk1Su5h7sxBV42pnHHARlKELUhRP0QjEwdT261gjtsYu76RF0dWXRlPC3eR9NP2Swbgv
	QeT5WqshBaF3dyO33SPBdF+GPHwxugaYE+2dw0cFhHopQ1wyGjLoAV7bRA8MOuv2ndJCyqVkFvoql
	aJqc8a5JTi1iuUXUU7vQS8Qfkn4FLkTBsiVx9p9hYQ435hiJV9OrPugRw0bBjw4PZJO9RA8LGeU4l
	u2uj13KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5jR-000000055Pf-16zE;
	Tue, 08 Jul 2025 10:39:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5P7-000000052nC-14bP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:18:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235ef62066eso65502615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969904; x=1752574704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdLp0YjegKAXW1He8H6sCHobxtr0SXLGuwvu5w7+xXs=;
        b=GIm4NDIiX8PrPZGEEdyR5aGPc7/NfCdpPPpwK1CIsqGYRCHtYbjmz4YpFhjKw0My3a
         0aDUVquIMOBL93aex5cCjYeFL3WAbZkGwypiHAoYR/+xmiH3BVyVUTeNqADfjThwxtHW
         J69Dd2BQ0SDrJdpX08CjmJ4RaAqJOWsjPex2p4iLyC8D7YG3F7AWE4ZW29oUhMhNcSTh
         410GEt337d/MOxgr7V4MohjfeoOM+miy/0ufrci2CRqnbVxbg5aHgl1RuJjwBFjdxgFS
         TChS6ymfeicEwhFyOe7WAtNRFp2EWctrHwJL5N6cOTFoPAUHO9WMZGEeEJK2fHBWCk+g
         zsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969904; x=1752574704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdLp0YjegKAXW1He8H6sCHobxtr0SXLGuwvu5w7+xXs=;
        b=Q4fEvr1KWhFyE4Rz10Pgf8Ag93tsZiOkN+yeAhwqIm6KnylbQxQ8RvF2IEZTSM3GR/
         Gdvo2Pw/4tckd3wgDVsqoo47otANWRwtUb8x0ygdxHdMkYC2hsGGtCIGYLfhTCcHnFeK
         ToYLhTivowIxLrrX57Qsmlhps20MtjE4jIFvZv/zxIKrHA1MUTtF7WWzXEq74PzZrkI1
         ZSe49RVzVQCja7DL/JIAGX3ICorNo81qjXdpqwh/ww4EWMR2S59+hh/kr/7txhrwR8u4
         OHqltgZbs/4ShIO9nwnQR6vbf0Eh9zyac+/t4r35eKDi62ufzHOUPWexsiTezRw6Eykm
         lmyA==
X-Forwarded-Encrypted: i=1; AJvYcCWSoIa5pD89g8jjo60UqKESwiUYlzf/Zf53KB29P+GyzKHDlu1t28XHO5caab0c8Dd/F/TF1Ms4GosAX5pqUmYl@lists.infradead.org
X-Gm-Message-State: AOJu0YylBYo+uRvvmFaK0pnbNTsUVJiPsbDKIF605bbiLOd80e5djf9H
	KoLqoe0y6Ld94pofAtUW3IBlPr5MWD4eG0UV8sr4CMqu/VWCkTSY8BjJ
X-Gm-Gg: ASbGnct0/XBKHzX+pI/NS0E/FPycw42aVo6qq/XmFUgD0Mayp6SaBdWGaJAUONwGfmz
	d+lotNsGnUrcWZ/36jTykUYb1UXJUtjw31Tdo+HywtA5aFZ7Pw4ThzNvCZFwsr0tO2k1kv7m0tW
	wT07ntHXoqXWSsVNgX9X7vEXvDMZsPezzNXb/UD9OF8Fr6ymbas7YW1P3Gebw7s8PjjbUvjKbws
	ufn4yDJS7Fv6QE6Ed+kSH+bEWrgZ6oVHpDBbqAQa7YfOaBci8/JiuSF1NSYZIYhjnOlH7+ecVYI
	MAPmfX+4IA6X0McXvWSmFZU8TasPDXOyh/WsjDjrVToIZe7cCJzEsio4PMzbEOmOsVUyz7SuoRL
	Fo/ije+gvjkCKQo4O3eqe1YTsyW7gp/k=
X-Google-Smtp-Source: AGHT+IGu7WYapWMHc9637DgsnJHKg4bnLFJuKBic8k4Cy5AmF5szo6dnD7F1fr+X4Zl1kXa/RsNNJA==
X-Received: by 2002:a17:903:2443:b0:235:779:edfe with SMTP id d9443c01a7336-23dd1d5e471mr35706785ad.43.1751969904340;
        Tue, 08 Jul 2025 03:18:24 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40e3sm11114709a12.34.2025.07.08.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:18:23 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Tue, 08 Jul 2025 18:18:00 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>
References: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
In-Reply-To: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969896; l=880;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=Vkb9aXhwjRXn290zw8y+gVMx1U5e/fNse2oic6Bf6HY=;
 b=bPsPFlNf9KCv5/kLFTdwnvncwMCBUnDkJASOXjZZIH2IID/WfCpaxiJ2uad0l5I+UtHc3qCyD
 hfxgrBqr8BoD94uBPmk1ePYW7J8Kb4DHtjBSdGA9XGTcRGquyi3YA92
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_031825_306303_4ADED7D3 
X-CRM114-Status: GOOD (  10.70  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
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


