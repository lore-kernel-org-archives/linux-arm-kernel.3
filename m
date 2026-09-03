Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0691C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=; b=a8BTOkKzrjzyJS4kebA51XlTWP
	FVatcU+1yx0BFGEbCgsHg190VcqXi+82ARztA+AORK5i2N9zkMEycU7bMM4pLLWBjw+kOFsF3k/XO
	Ivyf3S4sHgVKwf/EjAGhehi422v02L14L4Sgb6FmT+2zRughzhTv5g2AfcE+JlxypGr6WKZrRGxiD
	brxMgQcOOoB0682okT0n6BxYytlq5MQxPV1VeKkMQeEVNq/YlhBKPZvmF0eK3mo45mVECg/QMmWzR
	XrsxolrIBE39R6OW62yQ+grGru2y58IPuLyUU11I2nKJg+cw4jnF9hePwieUciDzX4JDuN0U5g1hZ
	AKX60pVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wn-0000000GaoY-486g;
	Thu, 03 Sep 2026 07:33:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wl-0000000GamP-43hA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:33:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so2837553a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420799; x=1789025599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=fuLN9Z9Q0XJN93YsM3OUOZhyLu47cb7WvEq5kae+VWhI5BgnGZEf/IdLguiaErjVdG
         Ihk3TTI+squQGwj5DIhUoWr2a52jKzlQno08S09MY18cKT1aPpci/XOTd5UMaaWT/leL
         s8R4OdtZbGGQYciRJr1I/ktB1C3OO3gf1JGD8FoOYtpysrglRTU3ZBMmhLsvbr6ISPRI
         A4MNZFWCLiEsP4Q265bc20PEcMMeI2PTexj29vgfzk5O5h+Q7CWkxiGgzmnVtk38CIsX
         ljKROxTcU70tRTyVJ9KnA9Pi7zF+Y3DEEsGWTlN+9lO4GhtEhnUoGCksPFQLlY8ZLJXZ
         OIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420799; x=1789025599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=gnb3Kqz56+Rbwgv+VuXTS8p+it7wWn7O/t3ek/YiEAprpY0rRniv2GY4soKykTKCPJ
         gbMYA6hw36/7QIZx/+ZEirv5PQM88ifKIwsZofgxFRb8e369buKpPWURAze1eDg+n8D9
         qMi6qtRgi/mzHkaNkckLi2fHyaSJKVGdEqb3iNTIt/kwzL0+nhczK5u+JzE54dDh9bIf
         o9J4FHDG5KIi/qTQMTELU0Hw7271GUcqDTl5uWcpWTtumiyrPI9nsrEO40UgvJeQQ8+k
         vwXgLJXPiBSItcp7FxFeynF101+Fnu0LvZ1Im5W847eyFaU/u/w5mMWLebLlR+2Xv56O
         24Ag==
X-Forwarded-Encrypted: i=1; AKwUvBw01OIDiRLiizyGr7EvjXzCon8ziK2DEidZdwG3kiEEJs8qm44p8ifNF4/jfqQSjXDG79VjjuH2USpKhEqNqD21@lists.infradead.org
X-Gm-Message-State: AFuF++mXLe9stvV6jVazDF2nIlW4MVtYl8KPdzQvhG7JOCQiiGT92BAT
	oWvGFto3yZWWJQ4nSR058lnBW/Q5C/DqhZmkevm7X3TCBDXzIQtAVO3p
X-Gm-Gg: AYBFou2eggqT38yoXdHyTdGhZ9nm+BGHKL9oCr/9VXxY3sY0uTtKyVv0PJ5NUiSbikE
	IlEammoBFrUO2tRajM2YYU3f0Jrdz+AG5lnlvoGmni7zSvLLiYNLs3WB58fiZMF/I+HrxioSOjH
	HhS6AV+RYB85Yio06I6fhWrGiqZa7CUYnnO74/RkUjg1pkRlIXyPtKk7UQW7+7PKRhrqk954SfP
	Jfzc3AdfwQyLHzcDbGSvwR8xUCad0Jvnrn/V72qnYgt49zwmJ8A+PkkNtUJUl5ScRhIcK2VpwBa
	4BMD5WxVANrV071vUI+pOEX7dNOAMxvQws1GR1XzIAH7nzlFtJTY48JLyXZPsq2A4PaOaWxzw2P
	ghqgIuJIci7ITNLeodmB57fRtTtT/uFWCrozWf5df8bE67MY2fUt/34VFI5Y3Do1c7k0757qf9Q
	J8cGpvZt+CKO3HHP6iXhNQ6uTR0vrQc18mvzYdckJTU1tFuHpGRGzLwun+bpctyKJOD8iBuYkP0
	/E/7G1QifPS6c+tH7O/8Sljr4DX9GKIt4DlKTHxVDMta+NzyKCkDHjCr716nlEa3Hq/fZ7ppNPL
	sGig
X-Received: by 2002:a17:90b:2604:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39aedce056cmr16042015a91.0.1788420798943;
        Thu, 03 Sep 2026 00:33:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Thu,  3 Sep 2026 14:32:50 +0700
Message-ID: <20260903073252.339250-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903073252.339250-1-phucduc.bui@gmail.com>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003320_009648_0EF81B24 
X-CRM114-Status: GOOD (  12.80  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Fixes: d6349e3e14c7 ("net: axienet: Mark eth_irq as optional")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..207aecb5f8b9 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2975,6 +2975,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0


