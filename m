Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BDCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFXKLPNqRcZZrDvVKfr1wPjQMLq5JkCUAknP9xqaHrs=; b=1dSE1H6Si/BSMSF0fB8GpRn1FY
	eSw1GgZJn8ediSIpdX168dblsmRNgJ6SABe/BFGUliKz0Km0FT3v86MwmwtyB7egRLnFjGVwc62OZ
	HBIrMR8/m49/WMkZwbRrbIu2WSGBo0kp1sFX/mzqgcxCdtegRCtl0xMo3ePf8IImCcfv/NPKeP8Iu
	911MKbB0GHOgFslEyXif4XWvx38LqFsK2yTnqaerwqtxTYq+gU80ARk7ZLEYfw4FqkYiwWR2f8MGi
	8I8PrkIobL/ufX7ACRmMVnMoYESTNlz3a9jDbLCVZfae/9ZJ7RW/e+lj7aE43KzihmzMY7twDLMFn
	LH//2Alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51d-00000003JFk-1gIn;
	Mon, 15 Sep 2025 08:57:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51S-00000003IyJ-1clb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61AE9445B7;
	Mon, 15 Sep 2025 08:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A83C4CEFB;
	Mon, 15 Sep 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926637;
	bh=a5Pq4IyChIRNpCI1Y1MOptr/VB0oiXKYMj/CA7z9q3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qt2suhNtBryNbVM6DmZ8ZNhYrUzzxxAGTLn4ERk+k7tzEwRvzafwQ6VfjIMqfXSxa
	 8zX9+meYdetpRmN/NuHhlox0X8NsejOuszCIH316PfWfK1auIo6YbwmwWtNQdDbMZp
	 iGhDIS4rFdEyTAQBvpfRWCG7jdX83+MGY5/uGG5Jq6SWFvGce/5TcMqvmJr4ikZHXD
	 ZXFe3/53qH//uGugC3cv1IeWh91KElkNK5pj44gII5yh/mI63Vh+7/nxGKUDn4OgGV
	 ivlf1g2rRFsFP0rac7Tk9VRyo2LgaoHaouXU7B/5zujfKErLpGcX8J+EV1q27KM+ai
	 ji5DCEuT7/oWQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51P-00000006IHP-23aU;
	Mon, 15 Sep 2025 08:57:15 +0000
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
Subject: [PATCH v2 17/25] genirq: Add request_percpu_irq_affinity() helper
Date: Mon, 15 Sep 2025 09:56:54 +0100
Message-Id: <20250915085702.519996-18-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915085702.519996-1-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015718_549708_7EC75861 
X-CRM114-Status: GOOD (  12.41  )
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


