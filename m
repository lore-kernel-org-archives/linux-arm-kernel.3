Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB81C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoNmqk4kFe1ffi9HtpCtyUHKbQwKZ6Jed6SDch4oW9M=; b=3OSnU5zDYxeM0wD1FbSNMopOOY
	+IlE9F14HtURvMpUJEgdl19shPr+naNgRyjV5TVpmYaP2DFW8LO2cahHuD2+E9EyXQ42be9Kfot81
	KjD9NHU7Cmdyhz1aAAoQ6R9qs9xC6hy+2OIxwcN7d4y89sJdxrsDRXTsumvXxKN89JYoJEbGuWsaE
	boLU8MZHYZHaOew8yL1MRFrxLheYTiwwmP/ueHa6qxXxqLYvCCdYvQGX3lAdY/Y+ZddT+stI2TO7a
	LsWOihPRKifgKLjnNZEsPSmiP9o8hE91noRBCmaKCBtxfOHbvT+yMkLL0fGJVlxfuVgJp3ASG/luR
	sEHbU88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJW-00000009z1f-1qoT;
	Wed, 19 Aug 2026 14:30:46 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJQ-00000009yyh-0ttK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:30:42 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026081914303314b7291527000207cd
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 19 Aug 2026 16:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IoNmqk4kFe1ffi9HtpCtyUHKbQwKZ6Jed6SDch4oW9M=;
 b=Krf5ghZ9dUUHTj7Dh50SkIbWovR1VpLHU5vQyUfG0H0aqDOFeJuPJpqsNWdfvGzz2tM2Yb
 62YwWfAmla6In6QMb96eWCeNtft/RpDt5ZAVgR42w0BTzqoZ+ixyK3yqwory5ETNCaldAYx2
 iTLhrkdNalnGyE9Wnrivw+ZbDmeLWx31WRnizgD3okPjOsWKfdQC6ickBE/XPeNveHHip8SM
 amtBqX/abZgRXsuhA9ecQqlohTyravo6wYZ8yIl1MlEoK6ijfJY7FuGSKSjx6mx8WRXmcpSY
 U6GeoZZHyZaDDTa4bBxkfuLryIrdwLalGGVA6BgsuFUXLiZzwES/cOkQ==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Wed, 19 Aug 2026 16:30:31 +0200
Subject: [PATCH RFC 2/3] genirq: Honor existing IRQ affinities when setting
 affinity hints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-2-3f79a99cadaf@siemens.com>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_073040_469395_67FAC7B3 
X-CRM114-Status: GOOD (  12.49  )
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

Some device drivers implement an IRQ balancing / spreading mechanism
based on cpumask_local_spread() and irq_set_affinity_hint() (deprecated)
or irq_set_affinity_and_hint().

__irq_apply_affinity_hint() was overwriting already configured
affinities and with that violating user defined affinities.

This was especially a problem on systems with isolated CPUs, a common
pattern on PREEMPT_RT enabled systems. Device IRQs were balanced over
CPUs that were isolated for RT workloads.

Note that only the first call of irq_set_affinity_hint() and
irq_set_affinity_and_hint() - for each IRQ - will have any effect.
Afterward affinities might be controlled from userspace using the
/proc/irq/<n>/smp_affinity{_list} interface.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 kernel/irq/manage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 7eb07e3bdb4c2419e0a58a75c29d88b4b00b8287..3937ba24df6d63375dda88164cf92fd49e70a3eb 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -503,11 +503,21 @@ EXPORT_SYMBOL_GPL(irq_force_affinity);
 
 int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m, bool setaffinity)
 {
+	struct irq_data *irq_data;
 	int ret = -EINVAL;
 
 	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
 		scoped_irqdesc->affinity_hint = m;
+		irq_data = irq_desc_get_irq_data(scoped_irqdesc);
 		ret = 0;
+
+		/*
+		 * Do not overwrite the affinity in case an affinity for this
+		 * IRQ has already been requested, e.g. by writing to
+		 * /proc/irq/<n>/smp_affinity
+		 */
+		if (irqd_affinity_was_set(irq_data))
+			setaffinity = false;
 	}
 
 	if (!ret && m && setaffinity)

-- 
2.55.0


