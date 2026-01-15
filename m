Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A43D41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMliUwDqBaPP5ftrxzLcCvtEBpKI0UiOIsqsdzxW70g=; b=dJKSH3B7aHM40t/mJxTyuDabMV
	GGV9TWnZg85ikQo0y1c/+z6e5O9BLb5VA8AyYKHUWiD5Yk9tuzVS9bKY9aFNJCh+9sGDrnITBWFLe
	+0Rle4F7ZCQON9oWuSpA8TfwJtEheSXsQrIVfTcMBGvgCR4pUYQ2EjA3h1HJ9vms5OUi8q6CloMtg
	Mwu+OAvytX4H14z6kfu+L76nYcYYxflQ8b8M/tnnhsjVljKl+ZYO3qcfRa1UxYhpeAU5f0ACZoutg
	nePuCfL+j+geOgyALCnmyvzFTQB9Wm7WbybcBLK6GAN1R22wGx2c0wjCYL1HAhFzxbhzIS5QJW4Ab
	D/190YNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLj8-0000000CFJl-0ODg;
	Thu, 15 Jan 2026 11:41:22 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLj5-0000000CFI5-0QlI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:20 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-121a0bcd376so2135295c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477278; x=1769082078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMliUwDqBaPP5ftrxzLcCvtEBpKI0UiOIsqsdzxW70g=;
        b=TvDe8/hf5ZSeMydAdRht6rtrrLhiQtBLOtUNX4wr9YbCaCHOE57TGlcomb5AfuVbtF
         Q43J8xetBDNYFOzuf0O7xyU5j3Mb4KfvWv2sldqh8RsjUsiRHTv+nnYzdmDrR+bmb3C4
         Dvo6C+9w59Mf4DnxqqSO3IWP5keuzxaotp34j7cdlpdOyTZpiASe1vgzVxGYJUmtWOwQ
         Xa7HuDdUlDsG3O/fmafKugx6NJzCpv7qmiZFy5KsMFDjL7DM9mpHLKSNGs28CyVu9bBW
         wxwm2BfVz7QysJBwVMIxX57yY7UNMbKRMGhsEAB6yXksOcTNXailUMLx+rAqe1kRbZ8Z
         zS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477278; x=1769082078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMliUwDqBaPP5ftrxzLcCvtEBpKI0UiOIsqsdzxW70g=;
        b=fsvZtsihKWBxfzPTwQGK1Dm04VcHISd+elh9KgLj52fJGGy62bgPtYWQe1iyIK8WnX
         KXgcYN+hf5+xTqCRzbYt+mj5rc/UxxQf+AX+a+Rb9YWsMEt5x3giUCT+SvWQka3/5Ye9
         yD+6IBCluaEXyIJc9nZobP+LVm8ElTJH7pItVBXSu6LKtqLGjNGT80BT44yuSsv1eA6n
         Z5RyXp6dGBMMi8w4j2APaNm8iFmnVXmxAzpyvdOhD2O+bsyLB7FxQlesdMxWX46bYWr2
         DK9D7wrOILnrG4hI4tAqo0To2E7URExi6RvgIpzSzVa2z6inExdAmmlDs4fvBekc+vSZ
         vZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV9OvZNupKC9hauJtc+2O6x9GrguDpqMlJijUwtpagkqNtMDvbgJHA31wmCZmrXEmDVe9H83ro7RFPIHnEhxJF/@lists.infradead.org
X-Gm-Message-State: AOJu0YxkzkUchdIPzxIEDBOuovVhDcyY8yvvnahfKubPoj8qIsTmxYI0
	LT9akik95SMggJW+C+QCV/nNPllqcyyKsnQSZeSkHHITGpRiPUSpeLJ5VBasHRbp3tY=
X-Gm-Gg: AY/fxX6CIrbwEQICTGgHS+uQhSsb5qaTbw8KAuyVB53yOmk8Isa3eYsrq2DKfClrypp
	8FsI68XxnuG4NsS7kVNhj/D/zOW73hhsTAtGLA/cA6ZGQk0U55LM83GOfyetcH+ZMjN6Lwz1zgL
	K2x9xbb6FiixKETTwfWbS9+a35ZBjVggkP4yzLf/y+XrJtHz7+OlBNWCDra40bmFUFOtC2XJkEJ
	A8aynw2g6PGetk8yXJcLHbS+ZPJnn8OiKLPASjIJFKDNubX45BeayttYybCCeGIWfW8LOI9F8Lh
	8BFrblwTxkRHIqrycu+hGxcKHYAKkZWm6DFdfstCzdg3N8XrZwM+QU9zYg18/+8s0F+HozilVXn
	vrOhOB4a1fH1PV3mkDP7ueeHrhU4cAeF4yz+474cxQVOTZLYwo6x7xxPA0gJd8dERfp1aVnEzdE
	98m/iAb0A6senS32Tj1iSqBEH6E8fpfW4Tp6Xv8IMk1PG9/G0YfazNlnxXKmDwlgexJAD1HiJlh
	recnYeK
X-Received: by 2002:a05:7022:c90:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-12336aa83bcmr5197544c88.48.1768477278199;
        Thu, 15 Jan 2026 03:41:18 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:17 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 05/11] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Thu, 15 Jan 2026 12:37:30 +0100
Message-ID: <20260115114021.111324-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034119_146975_CD220C7C 
X-CRM114-Status: UNSURE (   8.24  )
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0


