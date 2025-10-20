Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D02FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtrNcD9U2dZ6AV1VuhDmRC9eMKrX0YJEKYVBArt0MdA=; b=RT2Mc/PRZTx1935TymI9IugkwH
	Wyymfw+EYSkIp64XMqECEPnpCPCrZdqjU+8ns9f10t9H+Qn+bRyNp6Qdst+kqWNMDCk7YRV/2konn
	BGC47xt5GOvDYQX/TR1mG4ERqSevdEykBytgFtcokYmMVDi0wbOKHAtp1gW/S1bRdHIC05bMl+eji
	TQ6FyYkGfuO/gFam7IcVtyNDJjjwR6gAkgzWmKzB67rqg1Gn2ETyTUihvI5iHF6kXS2lCdayqP2MM
	/PX7L5MLbrJupzu5vRwtAWkEWDd4uw4afJKwfeUQ/Zz8Elm4BXHyvuO16bWYuKZ/H1CdFN7f5Zh7J
	Cnppvgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3Q-0000000DTIL-0TtZ;
	Mon, 20 Oct 2025 12:32:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp22-0000000DRQb-2Vp8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FB448ACC;
	Mon, 20 Oct 2025 12:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A6CC113D0;
	Mon, 20 Oct 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963412;
	bh=q1h3des/mWBZaJqah+p6h4WNGOU+koYIJ7/5FZVosrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PuXfohmKgI204IGoS0+aky5HAcJhTU84eFM27SgBRUEqP04vGYAoMu6oTaRfaD7YT
	 TmdyX8CPqTSOoVUZa7zbD/+CUxaBIhUT1M4/cChLA82T781x7WbzBpbZ9WxTOZjw/e
	 ixA4eYdS6YDgiTlPEhvlugo1/b19NIS22XR4hvgqcM9linZ3ZA1DDdAbTV/Alqg7GH
	 hQ5WGlbIp4Qj6tVbW3yZoeN3YUDYyXQprSwmvoFXYaPVbxdS1xwIvz+qOwYcdVFVdn
	 uzxZldKLtOH14LUz7tTkhz8mnNdWH4UfHv+cJlSdhEjv6aP31OMgaecmRHqlTf/Dvu
	 itG+N5QuouMRA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1e-0000000FUu2-3gip;
	Mon, 20 Oct 2025 12:30:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 12/26] genirq: Merge irqaction::{dev_id,percpu_dev_id}
Date: Mon, 20 Oct 2025 13:29:29 +0100
Message-ID: <20251020122944.3074811-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053034_796187_0A95EFA6 
X-CRM114-Status: GOOD (  13.31  )
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

When irqaction::percpu_dev_id was introduced, it was hoped that it
could be part of an anonymous union with dev_id, as the two fields
are mutually exclusive.

However, toolchains used at the time were often showing terrible
support for anonymous unions, breaking the build on a number of
architectures. It was therefore decided to keep the two fields separate
and address this down the line.

14 years later, the compiler dark age is over, and there is universal
support for anonymous unions. Let's get a whole pointer back that can
immediately be spent on something else.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/interrupt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 51b6484c04934..0ec1a71ab4e84 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -121,8 +121,10 @@ typedef irqreturn_t (*irq_handler_t)(int, void *);
  */
 struct irqaction {
 	irq_handler_t		handler;
-	void			*dev_id;
-	void __percpu		*percpu_dev_id;
+	union {
+		void		*dev_id;
+		void __percpu	*percpu_dev_id;
+	};
 	struct irqaction	*next;
 	irq_handler_t		thread_fn;
 	struct task_struct	*thread;
-- 
2.47.3


