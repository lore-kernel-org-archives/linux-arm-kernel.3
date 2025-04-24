Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70561C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=; b=LbanFQWb9XMZYScVzpdghijLZt
	WwCfow3+Lv18/ye7htJ/It3N9RVjqcb+kGY22zFhvydx7uo3Q79bTWcuJ9sVXdAkJrf6yl8cnuIU1
	KUJCJl6yp1nQ7lURNWqHisYft68Y+dEYWpsek9ejIyo8aTGw/vmgmtRoYxpHzoLug4iuj+Qu0ANeI
	E2H53lFNPWjo1NRaxgmBxMBJiQs2JxalwmV/W8/5q4YfElG6Brr4U0Ylk+NEaYHfVg7j+Qk7v4bg4
	f7EM34AAbsBJvNA0lMfEq2g7uoPqhNygOkVsMP0zJePngVUUva4/2X2G9M7h7nF831Qm8Q6cCs9a3
	RDpfTp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Vv-0000000F3j0-1kxV;
	Thu, 24 Apr 2025 18:41:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Qb-0000000F2cJ-1KXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:36:06 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3035858c687so1168886a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519764; x=1746124564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=AwPw/fPg9gZOwLzsbAYK7S3ZVgDR7PmtdegmtA/QtJnjKh9hJxtEUcpCm30LBKUJ+C
         nNpc7zf1jq7IVDzwqIoX931kAlnchgddbHTXr8PQXM6qtNKkbvFAMz2UCqLSbdlWUQrx
         drHZ7S+bS4fm7V8f2bUTc3sh9/GIpnBpIVBDcZv91s2s7ZjSz/UfjnYdq4F2THAQZkVg
         iNSmuPWUeoFvRoPvCWKMPK3D3vdqTeTd8RrXDWRY8pR+Isl9LYdNgRl1ajZqHyNkrlRH
         cRyyCf3kTHwy570noN7Nwb1AzoYhAgwKBDIQHjkBo3sN9XQBuYHy7WqJ12OoPr8f+bEZ
         FLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519764; x=1746124564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=TuAtGB10XmEZOqnCqOEPi5t6a8/bFWeaymCSOKwswnbwfI1HNK+eBkNDS8UZBTqXNp
         dDaIiI8Qe+W/1X0RPCq9Xr0zoR6CdF1qn1Ca07ZydF7hUGdpNIm6NIFemn5F2qvXi+C0
         0efPG5xXX/CAP+uIO4T4G+VxzAwdntGoM4PV+Tir7wI363FT90qUrIeg5HGWsPV6T+rR
         cdDSSKSUiFK+oJ51E/jR6KnAJlhiuKlr7z7g5XDf+NYs67afMy+ChVeNVlnHR2rSO9cu
         kJ15V8hWbchRoXxN3ZooFDJBwOXvr0AHEafhYUtodolhtW1/tgeGizi63zcIF1UphmcN
         LV8w==
X-Forwarded-Encrypted: i=1; AJvYcCWs1rwV0tE8z5rCdWPl8MTbqJpdWKCItHaLGOhKQgrWWtLP8TVmZSZS707ElJHXFyHvY/jFgoUkF3psmfBeiwM8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5/psmTisdw96L0izuYmrpg7QOfenlFARqVlaNWyeg6B/KE/uN
	qiNZB7DyACuO+Q7fM6riBHQeOIH9pjtFs7bZfkjulQDPHrMNtyFp
X-Gm-Gg: ASbGncv+REpgN409kCOVSme6gglVi0fnbLW8hEnHUIcUxzgTye8NKyFhXpq0qzpuhS0
	pycSgIlX/grQ+2uo6BTjpU7xSkkZu3yKy5rcPw/E/PXF//nB0nLdiUdboaEq3tvW/2CiRedpmrx
	Z49eNeVHVdZmXgt7yr//qKgs9wdV4OqFVNtWBhHIIbtGa+ahVbqGHYoSYCVDXvYUhaIg8MNl3po
	eaLXFF4jarR13AlA+3KMnDU/nYrl26n5/aSbCKtpwx+2V9Mvj/aaPrCYZ5IzaovcDQN/saqeibV
	ff7iegQ9I5TsukjvCZozx8CqulMe5R60FukIcrP3BJVqmc3hsLjDCnoBe8vWLi8=
X-Google-Smtp-Source: AGHT+IGCSXn9IY6DXLjgv7TaEaRMForSpf5piyeU0bRjjr8ZKnekj7GpjXcUSx9E35YhE6n9xka1lw==
X-Received: by 2002:a17:90b:51c7:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309f56b5079mr982684a91.24.1745519764364;
        Thu, 24 Apr 2025 11:36:04 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:43 +0400
Subject: [PATCH 2/5] irqchip: vt8500: Drop redundant copy of the device
 node pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-2-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1647;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
 b=KLGt7ovQtPKKPs+n2tdAi90cNKFX2aFELZydig0i1+axAIZqPnlWa8YajigkPInouyOgxQr5I
 ZSDurVYZrEVB2wrj7T47o8y8Z4ZWfgawNj4g915UIT0Bga4Dlb2dIQi
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113605_357365_23C7554B 
X-CRM114-Status: GOOD (  14.42  )
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

Inside vt8500_irq_init, np is the same as node. Drop it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index d0580f6577c88ffd7e374d640418d1fc23db623e..6d46e1a0fda953d76679ad2318674fdf0a977f0b 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -191,7 +191,6 @@ static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
 	int irq, i;
-	struct device_node *np = node;
 
 	if (active_cnt == VT8500_INTC_MAX) {
 		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
@@ -199,7 +198,7 @@ static int __init vt8500_irq_init(struct device_node *node,
 		goto out;
 	}
 
-	intc[active_cnt].base = of_iomap(np, 0);
+	intc[active_cnt].base = of_iomap(node, 0);
 	intc[active_cnt].domain = irq_domain_add_linear(node, 64,
 			&vt8500_irq_domain_ops,	&intc[active_cnt]);
 
@@ -222,16 +221,16 @@ static int __init vt8500_irq_init(struct device_node *node,
 	active_cnt++;
 
 	/* check if this is a slaved controller */
-	if (of_irq_count(np) != 0) {
+	if (of_irq_count(node) != 0) {
 		/* check that we have the correct number of interrupts */
-		if (of_irq_count(np) != 8) {
+		if (of_irq_count(node) != 8) {
 			pr_err("%s: Incorrect IRQ map for slaved controller\n",
 					__func__);
 			return -EINVAL;
 		}
 
 		for (i = 0; i < 8; i++) {
-			irq = irq_of_parse_and_map(np, i);
+			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}
 

-- 
2.49.0


