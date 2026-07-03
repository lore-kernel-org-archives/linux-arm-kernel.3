Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9756AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhzwfdKhTuMTAOcT4iD8RFsrIkmNOcMgyrA0M5/090s=; b=Xtip6tZH6c9RYcnHtlAgaPvNMD
	kFoCd+XPLQFKT1ARnQsxbMJVlmAISFJNwbUYPcx56sB3DBllVpkcglgHk2i9BAqjrKX++o9Mf5A7+
	02WwdKQ4xtn7KTpxF5QB6yUZzEX0GLUyxEYvtZmrqNtUvxnffPxlDSaM2OqBiLv4Q4lmAKdmW6KCB
	y0o+ZshJWa8F3vyv3itft41Jlu7i60sC6iSAM7oH3vAU+AX9y6yxLC0E4YN65ov/FGE8ubfWRgulG
	SrH21faGS/k9JacuYcDOZm1tYbYZeMeV6nTjugG7RnrzjqJxWJ7/GQR3zKgHZloY3nsE97xp6tIAa
	M3UM+Rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffKB-00000007L46-0Zzv;
	Fri, 03 Jul 2026 14:57:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffK8-00000007L3M-3IL9;
	Fri, 03 Jul 2026 14:57:02 +0000
Date: Fri, 3 Jul 2026 16:56:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783090616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhzwfdKhTuMTAOcT4iD8RFsrIkmNOcMgyrA0M5/090s=;
	b=N8pSrHEfmQ0nIHyuLnBq7B9PeE26JJ6i6JuUNkB6AErxg1ZsJZrYjXpUiRBwV6WTy/kArw
	gLrBYbX5ujE+pMhJ+nz/vQIuptan7+PiNQr91clPODzPGyuOKXMAT4jBJmCAZTBgW6rwO0
	WTnkL3W5JRHjS4kJxy6nSRgDh8vcgGISPieH12Rmd8dhkxiwSh2m6R0k8h3P1g6LLWMZ9q
	qU10psMDI6xYcKMsz/PDAcWF5XlwCFt1O1jVVeWkpED0utDp/dJU6w4P90MreD/L6Ir5Cw
	/pp4RYdshAADZuypWEakuuPcxoIxO8Ezm927mKygUFM+/DTcGDll/4WpQO+QHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783090616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhzwfdKhTuMTAOcT4iD8RFsrIkmNOcMgyrA0M5/090s=;
	b=n1QKGesoiWFZPHP7w3oYq8LG0f80nKkIcc2D5Au3fKdGTMx5zz0lcAroYrnAoT2K0UOqdd
	F2VnPZHabXxb0PAw==
From: Benedikt Spranger <b.spranger@linutronix.de>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <20260703165654.71be8707@mitra>
In-Reply-To: <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
	<20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
Organization: Linutronix GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_075700_995616_35F60A7D 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, 30 Jun 2026 17:35:59 +0100
Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:

> The printk_delay and boot_delay features are helpful for debugging
> as kernel output can be slowed down during boot allowing messages to
> be seen before scrolling off the screen, or to correlate timing
> between some physical event and console output.
By now, it slows down the boot process, which is the handy part of that
feature.

> However, since the introduction of nbcon and the legacy printer thread
> for PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk. Thus, any printk delay added
> by boot_delay/printk_delay continues to slow down the calling process
> but may not have any impact to the rate in which records are emited
> to the console.
Using this feature to slow down the boot/suspend/resume process and
implicit make printk() happen, is the usefull part of that feature.
Imagine this sequence (which hit me on suspend/resume on i.MX after
shutting down all secondary CPUs)

  printk("A");
  (do some stuff)
  printk("B");
  read from peripheral --> system got stuck here since peripheral was
  not clocked or powered or both any more.

The delay (and later on a ugly patch to make printk() synchrounous)
helped to locate where the failed access happend. JTAG did not help,
since the CPU got stuck --> no JTAG communication to that CPU.

With your purposed change you *may* see "A", but never "B".
Quite challenging...

So please leave the delay on the calling side - it is helpfull there.

Regards
    Bene Spranger

