Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040B9D10F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7ja4D+EFSRvEgxPFCwdw7yOWGbR0ylzkLPujJe4pDg=; b=ezdaTfGKAk1qCfQfBcdmzwaDLl
	OHmQRdiazbKLkXvUQBZW7nmAeesG/tH6k8ZbFgjCAAQ9tR3b6DBTxIM3g4NGVtN7jHbMlMIUp0CD6
	deu74QXYxdAps/Pvs2w3u+g2MPgfGFKF83b7UX9CrOfLsNzlFkUvtsrlg0URmZkxUETYdkzEvnqSr
	+ORXB+2ZuD5QA7FObOXaD2yy8eoVTJ7G47JCZwPvLarcXJkjYk7V/w+N3d8plaOTNCDSftrlm45ws
	9zpaNKG8yegyvm4zLmK7Yf9Bn0EP6Ya0O1NXzhJ5WG6r8wh7uvG+NmSLEsyeBdS368UTl9gZvoj4h
	xHzT+piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGH1-0000000F5Rc-01Vw;
	Wed, 26 Nov 2025 14:13:35 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGGy-0000000F5RF-271r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A7ja4D+EFSRvEgxPFCwdw7yOWGbR0ylzkLPujJe4pDg=; b=DbG2fWv123X588I4/IsbpJhct0
	3M9zp9zl/J6K2hJ23pTlR7TEpVt1Gzc/r+yXQTHsBXldKLRi5ofPy8ZsOuB7Cnobmat8lK/bhVGLB
	DnCAXIbc5O0zbjat+wrSR1HOgnLuicjklU7bfz5y+4UVmcTTDpSFfoki8S9f6nSc9oHJVtEU7JIuc
	X3tI4jV5YM+rxr6zIqObgCV7y2fgYoHJdksEFimetx8ndXU5jeTrZFDCAAFdJYgG9e5HHsCpdOLgc
	1DzTMT6MIpERxE4ILj515NoNboQxOAb7OygV4Y0bqQLobO+/eG8PhPqxHuvpsMjcq+N9JAmRwkJj7
	4lVM1UZw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vOGGq-004GQD-Kg; Wed, 26 Nov 2025 14:13:24 +0000
Date: Wed, 26 Nov 2025 06:13:19 -0800
From: Breno Leitao <leitao@debian.org>
To: glider@google.com, elver@google.com, dvyukov@google.com
Cc: usamaarif642@gmail.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	rmikey@meta.com, john.ogness@linutronix.de, pmladek@suse.com, 
	linux@armlinux.org.uk, paulmck@kernel.org, kasan-dev@googlegroups.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061332_643998_51DDBC6A 
X-CRM114-Status: GOOD (  14.95  )
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

On Tue, Nov 25, 2025 at 08:02:16AM -0800, Breno Leitao wrote:
> 6. Meanwhile, kfence's toggle_allocation_gate() on another CPU attempts to
> perform a synchronous operation across all CPUs, which correctly triggers a CSD
> lock timeout because CPU#0 is stuck in the busy loop with IRQs disabled.
 
I've hacked a patch to disable kfence IPIs during machine shutdown, and
with it loaded, I don't reproduce the problem described in this thread.

	Author: Breno Leitao <leitao@debian.org>
	Date:   Tue Nov 25 07:21:55 2025 -0800

	mm/kfence: add reboot notifier to disable KFENCE on shutdown
	
	Register a reboot notifier to disable KFENCE and cancel any pending
	timer work during system shutdown. This prevents potential IPI
	synchronization issues that can occur when KFENCE is active during
	the reboot process.
	
	The notifier runs with high priority (INT_MAX) to ensure KFENCE is
	disabled early in the shutdown sequence.
	
	Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/mm/kfence/core.c b/mm/kfence/core.c
	index 727c20c94ac5..5810afaaf6b4 100644
	--- a/mm/kfence/core.c
	+++ b/mm/kfence/core.c
	@@ -26,6 +26,7 @@
	#include <linux/panic_notifier.h>
	#include <linux/random.h>
	#include <linux/rcupdate.h>
	+#include <linux/reboot.h>
	#include <linux/sched/clock.h>
	#include <linux/seq_file.h>
	#include <linux/slab.h>
	@@ -819,6 +820,21 @@ static struct notifier_block kfence_check_canary_notifier = {
	
	static struct delayed_work kfence_timer;
	
	+static int kfence_reboot_callback(struct notifier_block *nb,
	+				  unsigned long action, void *data)
	+{
	+	/* Disable KFENCE to avoid IPI synchronization during shutdown */
	+	WRITE_ONCE(kfence_enabled, false);
	+	/* Cancel any pending timer work */
	+	cancel_delayed_work_sync(&kfence_timer);
	+	return NOTIFY_OK;
	+}
	+
	+static struct notifier_block kfence_reboot_notifier = {
	+	.notifier_call = kfence_reboot_callback,
	+	.priority = INT_MAX, /* Run early to stop timers ASAP */
	+};
	+
	#ifdef CONFIG_KFENCE_STATIC_KEYS
	/* Wait queue to wake up allocation-gate timer task. */
	static DECLARE_WAIT_QUEUE_HEAD(allocation_wait);
	@@ -901,6 +917,8 @@ static void kfence_init_enable(void)
		if (kfence_check_on_panic)
			atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
	
	+	register_reboot_notifier(&kfence_reboot_notifier);
	+
		WRITE_ONCE(kfence_enabled, true);
		queue_delayed_work(system_unbound_wq, &kfence_timer, 0);
 

Alexander, Marco and Kasan maintainers:

What is the potential impact of disabling KFENCE during reboot
procedures?

The primary motivation is to avoid triggering IPIs during the machine
teardown process, mainly when the nbconsole is not running in threaded
mode.

