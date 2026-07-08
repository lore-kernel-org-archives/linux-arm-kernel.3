Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D75C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oSZ0VvgFHGlDOd8o6hkiwFx03nfgdvtHM1XfLEEIwY=; b=PN7xAgUDf0yHiz7h8cDvTa1yhi
	DBhlNcnTAU5CZHFBtvFF7DcJ01ZnGNqDVtHZgDAyeEEPXkTnDZkXFoy+HtNzaI3L49fklL04niBZ2
	6CtGNEW9N+QbaPL8T04jCpMgygK9JC1kqc8E8ggEK0bWqMU9rJ6AH+4aMAne7dMfymH/7ImS1Syxd
	bsNmmSAZ2Bvp2EF9QcMmDEJi0TEHOqzqq/xM2NozWYts2Lk6nzZ5VKaAK61DLsIO6dKZn4pjab1TV
	wEtk4jsYVUH4FDGqwqwYFEwiLYwAdRe/WXjUII8x0V6aWh+0SkBv+624ctyRP8ndvmSClRAVx4Tqs
	bIl5ssPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdo-0000000Gv11-0m2S;
	Wed, 08 Jul 2026 10:36:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdi-0000000GuvP-2nPe;
	Wed, 08 Jul 2026 10:36:28 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783506983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oSZ0VvgFHGlDOd8o6hkiwFx03nfgdvtHM1XfLEEIwY=;
	b=Gb3HtCoKx6JK0GUWAyn+2ejS0xH2woEWxw3+K/nj2+wIJBR7fWvEPMFvFkyMvlwrSHvH3y
	eYqC9WH6f0zAbTbuXVSWvtLBe4ST35ka3Sx3qaoz/My1koLC2UrFc5rGvE+V0VwrOd6njF
	/6QPl/3E393XAhbRW6KoVsP/8FRAxYG9XY/ou3u5uSQQnxhnOp9j85d7VB+TGEBiacExE3
	xJRbPhjE0DAIxiNex0yDdcKTec11EZmdD/YpK0wBUMeLP0I3e2YCMqu/Pyf5yPUyWPHO70
	yB/zK+5LOoE4/L0SthgVe+xva8k3B7NyCM772BL/6skjkpHuTGfdHgW9SEka3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783506983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oSZ0VvgFHGlDOd8o6hkiwFx03nfgdvtHM1XfLEEIwY=;
	b=fRArbuaPMd9AD20Wgcx6lGklXPR5RU5QhFZJ34To/S8oQ81VuWWkxh+y3qq05R2rkX18yj
	OVN5nvYiWZtrpKCA==
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <ak0b2S9jjYy49a8V@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de> <ak0b2S9jjYy49a8V@pathway.suse.cz>
Date: Wed, 08 Jul 2026 12:42:22 +0206
Message-ID: <87echdvkd5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_033627_036832_19F20147 
X-CRM114-Status: GOOD (  14.53  )
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

On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
>> This is too deep (also pointed out by Sashiko) because it multiplies the
>> delay times the number of consoles. For the legacy printing, it would be
>> more appropriate to put the delay inside console_flush_all() and
>> legacy_kthread_func().
>
> True. The question is if the proper solution is worth the complexity.
> We would need to pass the information down two level of the API.
> It would require adding a new (output) parameter to console_flush_one_record(),
> nbcon_legacy_emit_next_record(), and console_emit_next_record().
>
> It is not that complicated but these functions are already hairy
> enough so we should be careful.

Fair enough. But then it should be consistent and
console_emit_next_record() should perform the delay before allowing the
handover. Something like this:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a..62fd6a5ebef66 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		 */
 
 		con->write(con, outbuf, pmsg.outbuf_len);
+		printk_delay(false);
+
 		con->seq = pmsg.seq + 1;
 	} else {
 		/*
@@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		printk_legacy_allow_spinlock_enter();
 		con->write(con, outbuf, pmsg.outbuf_len);
 		printk_legacy_allow_spinlock_exit();
+		printk_delay(true);
 
 		start_critical_timings();
 

John

