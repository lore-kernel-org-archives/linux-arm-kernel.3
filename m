Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB144E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZuUaCOd0CHv8OPDDzk4Qc7PUxSYAYuaG0jg5TgqLAc4=; b=vj4T4FB7RpAQqQIPTdC61BNrKu
	TzSsimxc4e+ErrP8pY8lX/yogfE+2/DjgK6jyijKxsDCCNvTGsy3BT+GpEEwSuLaQlV7ehmEKVpE1
	EqbbRbTkvaN13f6of3ubiyx2FNX2KiPR3dHgU20jfoSZNTBgPrrWBi3wcukfucMV1nXefqIOo3ukT
	jX4fDlEOR+U6s2fP8LZYUzk2wdQ30/U6B902tPaTkmAftID8Y1j5THtxBG1htGQcFX7Mk1mWLN7ks
	xsmubwo/vO4+2rNDUFEMz5ABWq8gExu3oXNQQbsztEonmESLoSjWPJpB1IXaSiORAF+v7xUPPUak9
	lp+kGteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxBj-00000002g9w-0Czo;
	Sun, 12 Jan 2025 12:35:31 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxAP-00000002g3K-2CTG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:34:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so5744498a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 04:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685247; x=1737290047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuUaCOd0CHv8OPDDzk4Qc7PUxSYAYuaG0jg5TgqLAc4=;
        b=TgzPeovL2AkNhRZ2UnBREtuVr3ofegBmhqK+XCYSyY7Wrs6/jAiY+hDo2bFVDRrMB6
         hw5ZLQUpw8ClnbGiRjx/uPvdJmglCpoJNTypa4vkYmEuVdqyFBn2b5IkR7xrSd8RmoXK
         exYJ6ds6f1SwffvkZMTRX5qz+/tyRsSkR+EHlfgKsyW59xSR+nBhPYUvQicN1sQ3YWOO
         R4UpQIUmqoR60JNhFNHpzj+PJwnS2gAj50PbBvzbLZiRh7r0dJYJPHln8iZVfe8DXFq2
         Jl34VSd8vk1gBRQnJQoInUUtRV4zciMrYqSy6iLERZT1j4SnLCiGP6kHCETNq0Mlw5yW
         kwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685247; x=1737290047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuUaCOd0CHv8OPDDzk4Qc7PUxSYAYuaG0jg5TgqLAc4=;
        b=hjCiQfM7pUo3nqfa62PJIktPLZEZzSxiQwYaoCdZ+qZqAZiWV6cAeKdK2sK0XPlAau
         gsq++nrZPmykqMoqzDVa5fy8lIwEZUlEKNWmV4UzfiIgHufLiudhiSFEMC0ShAo+d7DG
         auBU+ewAA0f8PN3K961lIcXRlsDdjqRSpB/envHyW3acFSAcz0Z2t94eqH2MkGjfFd+S
         b5koVFEEBbTdC4YEyLFyE9qSeqPWXHlTHpZRvpP9o4QuCriRkA86Xjrg5k1d5V/l6hl+
         /+FCqmRjdEPuG0uOwgCht/yLQspm4V3EnNPuuuccPcPlqn7+BWzm8CFH5+Y/db3P9CX/
         9H9w==
X-Forwarded-Encrypted: i=1; AJvYcCW7zcnRH/6Qa2oE/+fFeCN97UbGGWwQasN9xLrKGfyM04ExhjVRQqamqlyss0izm9sitKbbgere/MRZWd8erzMt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmi/sJGzGUKpmP3SIdnMv+G5zXMp2/Ox4XFDS+JTllYm469CL4
	6Or7yB+ucjmtDcL36QZH7nvOz8pDkQI46G7Tzr/JOxTfMsrqPkcD
X-Gm-Gg: ASbGncukCvXH3IU8aXlWMCnTopDjjn0nmh7UBnjJKUcy2Q7LsF3JYS1TGBtpcwF/ucl
	9vKS2e4+UDBcPO7zz47lC69uu40Yeh6lbtHPNQ83eS8xx3hTYhLLjN5iuVQh5p5g8+UtSwOn98C
	IMJ4M7+/fhrmHZ9xW/zSEpJ06mrKobe/rYahY3Cct8iswkWj1rfg29Oi4EyS5Et8IUWiNvGsr4p
	yUNg+7Z2kRCOKS/S6iMMohTLhUjCL+CU3LPbDM6LqzMfrsZYYpvDCKhE6ReRdgpo9rDMdzq/9Rj
	zi18HaiDnqwdvaTXJmS/Ts8SaQYB/lWrPDIpscfUx5w=
X-Google-Smtp-Source: AGHT+IEgimICm5S4YoCABdNXTi31TKxcYwTAsjDlcsVhxwDErJSK3jk8m25wG7zrTUqLVorH3tNhbQ==
X-Received: by 2002:a17:907:9622:b0:aa6:acbb:3653 with SMTP id a640c23a62f3a-ab2ab66d653mr1638626266b.12.1736685247017;
        Sun, 12 Jan 2025 04:34:07 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b20b1sm365767166b.157.2025.01.12.04.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:34:06 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v2] irqchip/sunxi-nmi: add missing flag
Date: Sun, 12 Jan 2025 13:34:02 +0100
Message-ID: <20250112123402.388520-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_043409_584517_1F8C4DE0 
X-CRM114-Status: GOOD (  14.69  )
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

Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
NMI pin instead of a normal GPIO. Since the power key is connected
to the PMIC, and people expect to wake up a suspended system via
this key, the NMI IRQ controller must stay alive when the
system goes into suspend.

Add the flag to prevent the sunxi NMI controller from going to sleep,
so that the power key can wake up those systems.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/irqchip/irq-sunxi-nmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index bb92fd85e..8dda0a85e 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -186,7 +186,9 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
+	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED |
+											IRQCHIP_EOI_IF_HANDLED |
+											IRQCHIP_SKIP_SET_WAKE;
 	gc->chip_types[0].regs.ack		= reg_offs->pend;
 	gc->chip_types[0].regs.mask		= reg_offs->enable;
 	gc->chip_types[0].regs.type		= reg_offs->ctrl;
-- 
2.47.1


