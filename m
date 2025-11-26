Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D7D11181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt8tp594VQ0MckrxY49wnixIx3cX7VkTNmuZLYckmos=; b=n8ZUwaI3G4JIU0+enxs6pK0qzd
	VxXWWgAbIWSEVebDWx8z6Xvxcuo7AftfjnLtk/EhBA540t7QFvseze/96GxqlZuTcbWVJeLAZj9/z
	FSr4/XwLp0kc1Z0PGGJhtYacokDODVtjfKIsYfq234xEbPjjwSHi0h+cLkGO5w7f3G+Mr8I77LS25
	XPNhooAwfssuz0/OICLHWLQncbqqnxRgxwJVe8l5cY/WVx70TxJG6t4vxYmKMZe/K/grcqk+oTgIX
	sZbbtK5sIMHq/hbkoacCywfxwWcnfv2TLMJsMpD9RWFTo57JxuJLXNdoGpYPqlEs+9YbtuLZCMNFr
	RauUOHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHqq-0000000FDEn-19zP;
	Wed, 26 Nov 2025 15:54:40 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHqo-0000000FDEO-0Kkf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=bt8tp594VQ0MckrxY49wnixIx3cX7VkTNmuZLYckmos=; b=IVXFA76SU9qXiZVyqFGvXRKXcg
	DqOF4/AQ7Yx+EOfx/EZDf+mz0sG5mrXRGUWeCNFW4Qf9SYb1cU5zQRMyfcTksuAeEPGZO4R9gXxQt
	R8bD9cwRORRHEHef5h2wPB/rZKQE1WDvYjMCo8pjfZByUpcDZobMZFC0VwtekOEitfKI5TPyOiUBZ
	gh+LcajMBEkdbjBwWsZsXIX/dUs6rumKkMPUV1VyGOjMQkOvWzUMy5iCm1jZ9Tq698qWsI9G63x14
	qF/mbOTjH0aXPwiAHaytyg3bHbWcRdgbrJevCE1cr+9ZAs+rSZ1fnnrrcjT+l2jAGYfSMhjNSH0aX
	/DGlf4JA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vOHqh-004JzI-KN; Wed, 26 Nov 2025 15:54:32 +0000
Date: Wed, 26 Nov 2025 07:54:25 -0800
From: Breno Leitao <leitao@debian.org>
To: Marco Elver <elver@google.com>
Cc: glider@google.com, dvyukov@google.com, usamaarif642@gmail.com, 
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, john.ogness@linutronix.de, 
	pmladek@suse.com, linux@armlinux.org.uk, paulmck@kernel.org, 
	kasan-dev@googlegroups.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <l2tbxtfyjtu32wqv73hqc3loerzdshoq2mdkfpfnigtjjonrdc@3yacamzjcrti>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
 <CANpmjNOsSmKUxrLxTWYMD3RKnzSw5dfM=7QNJ02GMFG7BMeOGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANpmjNOsSmKUxrLxTWYMD3RKnzSw5dfM=7QNJ02GMFG7BMeOGA@mail.gmail.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_075438_127823_04174F99 
X-CRM114-Status: GOOD (  18.89  )
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

Hello Marco,

On Wed, Nov 26, 2025 at 03:54:26PM +0100, Marco Elver wrote:
> On Wed, 26 Nov 2025 at 15:13, Breno Leitao <leitao@debian.org> wrote:
> >         +static int kfence_reboot_callback(struct notifier_block *nb,
> >         +                                 unsigned long action, void *data)
> >         +{
> >         +       /* Disable KFENCE to avoid IPI synchronization during shutdown */
> >         +       WRITE_ONCE(kfence_enabled, false);
> >         +       /* Cancel any pending timer work */
> >         +       cancel_delayed_work_sync(&kfence_timer);
> >         +       return NOTIFY_OK;
> >         +}
> >         +
> >         +static struct notifier_block kfence_reboot_notifier = {
> >         +       .notifier_call = kfence_reboot_callback,
> >         +       .priority = INT_MAX, /* Run early to stop timers ASAP */
> >         +};
> 
> Just place it under the #ifdef CONFIG_KFENCE_STATIS_KEYS below, I do
> not think this is required if CONFIG_KFENCE_STATIC_KEYS is unset.

Ack. This is only needed for CONFIG_KFENCE_STATIC_KEYS, my bad.

> > Alexander, Marco and Kasan maintainers:
> >
> > What is the potential impact of disabling KFENCE during reboot
> > procedures?
> 
> But only if CONFIG_KFENCE_STATIC_KEYS is enabled?
> That would be reasonable, given our recommendation has been to disable
> CONFIG_KFENCE_STATIC_KEYS since
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4f612ed3f748962cbef1316ff3d323e2b9055b6e
> in most cases.
> 
> I believe some low-CPU count systems are still benefiting from it, but
> in general, I'd advise against it.

Thanks for your review and guidance.

Just to confirm my understanding: You’re okay with me adding this
notifier specifically for CONFIG_KFENCE_STATIC_KEYS (which is what
I need), but you would not support adding it for the general case where
!CONFIG_KFENCE_STATIC_KEYS, correct?

Thanks again,
--breno

