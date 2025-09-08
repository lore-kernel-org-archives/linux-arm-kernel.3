Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619CCCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulgstPXYJ1Lcm8X/X0C5UkUUv5GTNClaAbTVO+S+a4I=; b=ZZ/gZjVuS4lRQ629Mt/DF18eEc
	TRs0UpnS8KcPy3LEv+MfMA04X/Oa67EMqotCeP75cgS3Xf71cmZlgnzPZFGu38g+S2ZPHuJjbIMrG
	E/yRFIHYu0HRSiOsp1PS0mc0ELN87vviY2L8EKA+JS8K0uq8XjmyR1dAqNPNRYyMykAz3ZwpTAn7R
	dXZNWv8MOuqO6nbxJYuwbX0ZwiedxAGh9ja/BOb/JXVsqzWih1GYySUx+DSfk0B80O06l1OlcWKvI
	GttPFFxEmy/y6sv4dFx/MxBFYWFRqGX+cKHteS8PuUIqLks4R67bXtw3IDmPtH+pEA5nUnwQLBbgM
	CmEwXq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6w-00000004mOd-1DH9;
	Tue, 09 Sep 2025 06:45:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemV-00000000lPo-1YBR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8DE544A83;
	Mon,  8 Sep 2025 16:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970ABC4CEF1;
	Mon,  8 Sep 2025 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349110;
	bh=FpP+wQwpUSsvvoV5l0PFF2kZyltIOuG1yyX8/6val7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=awFb+qx93m7wK7Lp9ei/bQMnb/uaAZw5ZDrOiZoPp80OE+U6MV9OSM8hwjjBHFfTi
	 rE64OCFNiDXu1kVsGT2ZW8iZlAe5e/+UyMjGhlqez3PUK218SC2qcwlay2LklC1ohr
	 hOItsAIzYX2J9zRScejz6nfXvyzG2DlYf2jsO4UBYeABwuO5G60yR72Hkqb/k2mbIN
	 sSHWhUyE4MsrTggGvasug86bfzLwCmhGypdvnI/Eq/08WuUwEI9pBG7WdnSv+oEsw4
	 VK0UQANe2i0PcLJeirWelzRtb3l3d7PpWbe0uDUt/YS5N4zOI7igp3KH45poBCywRr
	 qE+HFv/n7N1rQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemS-00000004NTm-28Kl;
	Mon, 08 Sep 2025 16:31:48 +0000
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
Subject: [PATCH 11/25] genirq: Merge irqaction::{dev_id,percpu_dev_id}
Date: Mon,  8 Sep 2025 17:31:13 +0100
Message-Id: <20250908163127.2462948-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093151_493513_CBFA1530 
X-CRM114-Status: GOOD (  13.86  )
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
2.39.2


