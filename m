Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21666E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4qEMLxfX1BseC/FdkMrRBTdE/BHic3wsmzo5oEqfeQ=; b=hHRElwSH/cnGmDKmJQ7C9yDWmy
	Iikv4aOyTo77XRFw/IsvbHXVlP+LqtU6M1OfRwVsWVhNIHEJXHmhO32vAOXav3eZDqDsIdlphVzIB
	ZRI4hDcCwifl4ngzbAOVe/IiTC3rNcNQ8p7GxE9YCvnkKZ8Kjz559bcS4jOyxa3ZmRqy/AtoNk/t2
	r1uaeMz5oAP6uwZzkXVfxUo5ZM1FfzL9Utt+ueYofzcxD+NwQs0IDT3GdQrnDfQPIRT1NXh76cnz7
	XReLSedejJIoLABf5yTapOufNztZjXTmFaRSOnR1UDVbrCJ+qETjTcMXjGpo0YcSnJPTttYurdNvN
	jjBEX3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Fm-00000004DFr-1W9s;
	Fri, 13 Dec 2024 15:06:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM77Y-00000004BPy-2KlD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:58:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so3062455a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734101902; x=1734706702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4qEMLxfX1BseC/FdkMrRBTdE/BHic3wsmzo5oEqfeQ=;
        b=PqIx+dOH2Dx6VKyF5fpne3VI/4dFngIWelRZ//6uSypsW24KfTgWVGSV80giC+48dd
         NwyEOzqQnElM+6bixm50NC3ff+XNgrvRD4Zp0wRYB/EgRJ2WJiK9CZMPQbJxsCtoNqjW
         dEsG8za6m0oWShfKlXPx5i0TDJjO2pWXE7ImSRPkmpynWDoYml3M0SKFGK73TalNDhyN
         t8EAJ+eptJcB07MHk/xJhXAhNNRwoyZt2Y3EGHJ9CnmcUR/39pcpNtc90zV2HFsNkKwK
         DNyZVr0GYa6zFGZX26Q2YH4zZfa0KDDWyGsDTLH+7CCLjB1KsqlOV5OnH1y8VQZSL0QP
         R8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101902; x=1734706702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4qEMLxfX1BseC/FdkMrRBTdE/BHic3wsmzo5oEqfeQ=;
        b=oGaGs3KWM4gShZDRKfSw64/qjmXLvXOQ4FwhtLAAIq8+aOqk4jq5QXbEBQYLL88unL
         Y5D2pLXS4tbzdpw1gm6BvoPgWQZUOpghSL2W713ySALnhh8R7irqmhWn0fzOimc7pXet
         J9mWMZFvJA8+2aX/KArB2yHyMG1T1jK5kZZker+kHz08gQywHvNdHoUvDQSVBGDUKTvP
         0W9E1dYTVJlh6ue2P0W0p86c4Ra7MgV9A8eauMCEK8FHliJ4Vcr9y5kQ2SxJPFVwxsKg
         t4T1FKGulnLbn/wPLNpl/n4SVfwIJ4xi+wjFLck6QYKhpj64lAXuDz9g4K7wHzvfTTc+
         VU6Q==
X-Gm-Message-State: AOJu0YzQU0Qi3x5NyoTD1AdCqpn4sE6eylzymgKj/nqfWzTu8nLUR73A
	i8F4jWkpYmw/mrnpaM2yzGJmbk/bEhZMyYmdtJmf7vprBD1uYd3PM5Uxl/O3
X-Gm-Gg: ASbGncvL6o5dHpebGb7u+VBlHgWS4U6eu6OOqZV1iGKqqt99le16njDdcOHYH/WvtNG
	PqK967OMxyyyOXgAkKwe8M4MhZJ0SBQjlAG4w7DQ5awJaJA3ptQvuzx8yfqKw/dLLJYmpUZ2YSs
	G4uw6DhBqv/SLtKIO3J16xLLf5UcE7vPB12cUx2spfPhTRP3WOV3YvC8VMu4CJ2xkwKBEdm6u92
	kJhAF7zUVBcxcSDLMVQO4CaS3Y3HFLMzLPOFBCrLHD8BBZOhDnz+I0Pw4pLOXw9vg==
X-Google-Smtp-Source: AGHT+IFFvoMSIBChWgea1OnryG31unMF7LtnV6rYFz6R55l7bdMGVY5c0jGGqI8Y+CKjTdPlJAQFJQ==
X-Received: by 2002:a05:6402:50cb:b0:5d0:d5af:d417 with SMTP id 4fb4d7f45d1cf-5d63c2e9df2mr2151151a12.1.1734101901967;
        Fri, 13 Dec 2024 06:58:21 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cedbb8fesm10048424a12.22.2024.12.13.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:58:21 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/3] irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
Date: Fri, 13 Dec 2024 15:57:53 +0100
Message-ID: <20241213145809.2918-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241213145809.2918-1-ubizjak@gmail.com>
References: <20241213145809.2918-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_065824_593523_3AC2625D 
X-CRM114-Status: GOOD (  13.21  )
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

percpu_base is used in various percpu functions that expect variable in
__percpu address space. Correct the declaration of percpu_base to

void __iomem * __percpu *percpu_base;

to declare the variable as __percpu pointer.

The patch fixes several sparse warnings:

irq-gic.c:1172:44: warning: incorrect type in assignment (different address spaces)
irq-gic.c:1172:44:    expected void [noderef] __percpu *[noderef] __iomem *percpu_base
irq-gic.c:1172:44:    got void [noderef] __iomem *[noderef] __percpu *
...
irq-gic.c:1184:26: warning: incorrect type in initializer (different address spaces)
irq-gic.c:1184:26:    expected void const [noderef] __percpu *__vpp_verify
irq-gic.c:1184:26:    got void [noderef] __percpu *[noderef] __iomem *
...
irq-gic.c:1184:71: warning: incorrect type in assignment (different address spaces)
irq-gic.c:1184:71:    expected void [noderef] __percpu *
irq-gic.c:1184:71:    got void [noderef] __iomem *
...
irq-gic.c:1231:43: warning: incorrect type in argument 1 (different address spaces)
irq-gic.c:1231:43:    expected void [noderef] __percpu *__pdata
irq-gic.c:1231:43:    got void [noderef] __percpu *[noderef] __iomem *percpu_base

There were no changes in the resulting object files.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/irq-gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 8fae6dc01024..6503573557fd 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -64,7 +64,7 @@ static void gic_check_cpu_features(void)
 
 union gic_base {
 	void __iomem *common_base;
-	void __percpu * __iomem *percpu_base;
+	void __iomem * __percpu *percpu_base;
 };
 
 struct gic_chip_data {
-- 
2.42.0


