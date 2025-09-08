Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B44CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFXKLPNqRcZZrDvVKfr1wPjQMLq5JkCUAknP9xqaHrs=; b=VBr4QbadvqvR8SjHeSvp38/G5D
	d6kAfrZBj4790yhS9PQVB6OauRzllbFCN8eB4I1OZ/s76pbB5S6anyfphzLMGwVRNG4YLkVTPjujq
	NORxn8odTObqFDytmzQIex3JHezbG/IXty3vchzuaXUM0JKrhBPdcbM2yYVbCuyS9qjRaUv9QtQ40
	uMWPCKZYaHB8ofFHBuNtZ4B69etk89tWVp+ck/BiWnrGVmBGHuFtG4ul7kvvX0v4YnkE8dRHSYxMk
	5z4tyZoYBQ5V4ZlUVkbFbbi7RIRRGqh6P4c1BseNDQsSaBbtnEgRiayfRAFJE1q48Z7Cp5weEU9u6
	P3c7hEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6v-00000004mNK-0AmV;
	Tue, 09 Sep 2025 06:45:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemW-00000000lRY-1yfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBF11601F9;
	Mon,  8 Sep 2025 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F10C4CEFA;
	Mon,  8 Sep 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349111;
	bh=a5Pq4IyChIRNpCI1Y1MOptr/VB0oiXKYMj/CA7z9q3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gy95G8maMfmMge8QcGPbs+tYvH4MiN/OP8OT3gniHAqU2h5Ck5FJSgJ+QBhs0hqKw
	 sRikmTOW7kvJWgzdo//bRwXLGAZdl/Hb4NlTkl6VrgZE7N46g8CdH9HqJ3/KgGz9i5
	 5PEcIHYp3jbMyTm8mxarLTZRvjbaGRtsPMWdCESy5lrLSipzOQvlMxSZd6mvfsI4Ec
	 nd56LJQkuA1gcYq4WwcoZbooFMEOrbUmb/0P/2Ot5/Ljaj74JaXmSdst5pZ8K+yevE
	 O15J62feK2gLgIMi9xi390ijkPUq7MZLYnZjC9wq6PSSDbO2siBhBW0xZ37HKcEPZK
	 bOJcEkIGAlHfg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemT-00000004NTm-3XkI;
	Mon, 08 Sep 2025 16:31:49 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 16/25] genirq: Add request_percpu_irq_affinity() helper
Date: Mon,  8 Sep 2025 17:31:18 +0100
Message-Id: <20250908163127.2462948-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

While it would be nice to simply make request_percpu_irq() take
an affinity mask, the churn is likely to be on the irritating side
given that most drivers do not give a damn about affinities.

So take the more innocuous path to provide a helper that parallels
request_percpu_irq(), with an affinity as a bonus argument.

Yes, request_percpu_irq_affinity() is a bit of a mouthful.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/interrupt.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 2134e7c08c169..c8e6f4895782c 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -196,6 +196,15 @@ request_percpu_irq(unsigned int irq, irq_handler_t handler,
 				    devname, NULL, percpu_dev_id);
 }
 
+static inline int __must_check
+request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler,
+			    const char *devname, const cpumask_t *affinity,
+			    void __percpu *percpu_dev_id)
+{
+	return __request_percpu_irq(irq, handler, 0,
+				    devname, affinity, percpu_dev_id);
+}
+
 extern int __must_check
 request_percpu_nmi(unsigned int irq, irq_handler_t handler, const char *devname,
 		   const struct cpumask *affinity, void __percpu *dev_id);
-- 
2.39.2


