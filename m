Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0536CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qruWLc1VrcWUcas3tXlIKr/hpjz262pfZoarsKMxK9k=; b=GbkJFSdfa6jJqNSoQXn1QXlduY
	2J7C/tKmSyhEmSr879KRHNu+fSMZIaEZn2+uW/OKXOpeErwJUUV/OoiTFvby18RJyWXSoHEpTN85i
	/q6dLfLmQZ57yoRK3/TxDZjQTwWzE8XsUyw5Gt3dUkFzrO0vsGQ0rM32BzgTLwZKmEb0WkZIS4grj
	1yr+gnZRFEKDVnI67SV0ueU1RwG+9BHsqHXBlhN7UsHCDBwNlGS36axvk4FsWc6dvngo/lG/nx9vx
	YvxOZH+GUsJd6ivpWNjZh4mMxE7NDBqXDwt/uNCvsqonW4YdlnQgmrvq9Mng2HRWfj3FXIqL2VesA
	KAJ17DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaKB-00000002aH9-3lQ0;
	Fri, 19 Jun 2026 14:36:03 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaK8-00000002aFi-2bCA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:36:02 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F91D6DBA3;
	Fri, 19 Jun 2026 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781879758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qruWLc1VrcWUcas3tXlIKr/hpjz262pfZoarsKMxK9k=;
	b=tLnW9fynOO+N5fiDidU3T9yhwGmyZlcqWNLkGUFJbSix2evpC70DYBuXwNaxOXCVFXw3Ea
	XJ2wNCxqd9LdI0N0bdEaFDPGVjW1N+Doo2Y4ZMu5D4/g70SRY7ut3vUGb5z+bAjcxasX34
	N6U8N++DBkq/Gq1FccbtL/uCdbYhhoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781879758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qruWLc1VrcWUcas3tXlIKr/hpjz262pfZoarsKMxK9k=;
	b=Vl6HYejYPwel/QQoSGv02onV0eBKxF7H4jwja5tUkCJe+WBZqBCBNzcf7iytItWieounUm
	nlokLYUjznwsyiCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tLnW9fyn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vl6HYejY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781879758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qruWLc1VrcWUcas3tXlIKr/hpjz262pfZoarsKMxK9k=;
	b=tLnW9fynOO+N5fiDidU3T9yhwGmyZlcqWNLkGUFJbSix2evpC70DYBuXwNaxOXCVFXw3Ea
	XJ2wNCxqd9LdI0N0bdEaFDPGVjW1N+Doo2Y4ZMu5D4/g70SRY7ut3vUGb5z+bAjcxasX34
	N6U8N++DBkq/Gq1FccbtL/uCdbYhhoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781879758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qruWLc1VrcWUcas3tXlIKr/hpjz262pfZoarsKMxK9k=;
	b=Vl6HYejYPwel/QQoSGv02onV0eBKxF7H4jwja5tUkCJe+WBZqBCBNzcf7iytItWieounUm
	nlokLYUjznwsyiCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FED4779A8;
	Fri, 19 Jun 2026 14:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6OyMCs5TNWrIJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 14:35:58 +0000
Date: Fri, 19 Jun 2026 16:35:57 +0200
Message-ID: <87jyruiomq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Sean Wang <sean.wang@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
In-Reply-To: <CAAFQd5DyDQo9vBH80YYQBW7Bgf64F1m9q44-jhf1cc75XYpftA@mail.gmail.com>
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
	<CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com>
	<87tsqyirsn.wl-tiwai@suse.de>
	<CAAFQd5DyDQo9vBH80YYQBW7Bgf64F1m9q44-jhf1cc75XYpftA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,chromium.org,holtmann.org,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F91D6DBA3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_073600_854387_22F83486 
X-CRM114-Status: GOOD (  36.22  )
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

On Fri, 19 Jun 2026 16:17:31 +0200,
Tomasz Figa wrote:
> 
> 
> On Fri, Jun 19, 2026 at 10:27 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 10 Jun 2026 08:52:31 +0200,
> > Sean Wang wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jun 9, 2026 at 7:19 AM Sergey Senozhatsky
> > > <senozhatsky@chromium.org> wrote:
> > > >
> > > > Every once in a while we see a hung btmtksdio_flush() task:
> > > >
> > > >  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> > > >  __cancel_work_timer+0x3f4/0x460
> > > >  cancel_work_sync+0x1c/0x2c
> > > >  btmtksdio_flush+0x2c/0x40
> > > >  hci_dev_open_sync+0x10c4/0x2190
> > > >  [..]
> > > >
> > > > It all boils down to incorrect time_is_before_jiffies() usage in
> > > > btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> > > > to be terminated if running for longer than 5*HZ.  However the
> > > > timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> > > > evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> > > > timeout has occurred.  Using OR with time_is_before_jiffies
> (txrx_timeout)
> > > > means that:
> > > > - before the 5-second timeout: the condition is `int_status || false`,
> > > >   so it loops as long as there are pending interrupts.
> > > > - after the 5-second timeout: the condition becomes `int_status || true
> `,
> > > >   which is always true.
> > > >
> > > > When the loop becomes infinite btmtksdio_txrx_work() loop never
> > > > terminates and never releases the SDIO host.
> > > >
> > > > Fix loop termination condition to actually enforce a 5*HZ timeout.
> > > >
> > > > Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to
> work")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > ---
> > > >  drivers/bluetooth/btmtksdio.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/
> btmtksdio.c
> > > > index 5b0fab7b89b5..c6f80c419e90 100644
> > > > --- a/drivers/bluetooth/btmtksdio.c
> > > > +++ b/drivers/bluetooth/btmtksdio.c
> > > > @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct
> *work)
> > > >                         if (btmtksdio_rx_packet(bdev, rx_size) < 0)
> > > >                                 bdev->hdev->stat.err_rx++;
> > > >                 }
> > > > -       } while (int_status || time_is_before_jiffies(txrx_timeout));
> > > > +       } while (int_status && time_is_after_jiffies(txrx_timeout));
> > >
> > > yes, loop continues only while there is interrupt work and the timeout
> > > deadline is still in the future
> >
> > I stumbled on this while backporting to distro kernels, and I wonder
> > whether this change is correct.
> >
> > IIUC, this essentially makes the loop exiting right after the first
> > cycle; the patch changed from time_is_before_jiffies() to *_after_*(),
> > not only the logical OR to AND, and *_after_*() returns false, so the
> > whole condition becomes false, too.
> 
> The intention is for the loop to keep running as long as there is still an
> interrupt left to handle (int_status != 0) and the timeout has not elapsed
> (jiffies < txrx_timeout).
> 
> Note that time_is_after_jiffies(x) returns true if x > jiffies (or jiffies <
> x):
> 
>     /**
>      * time_is_after_jiffies - return true if a is after jiffies
>      * @a: time (unsigned long) to compare to jiffies
>      *
>      * Return: %true is time a is after jiffies, otherwise %false.
>      */
>     #define time_is_after_jiffies(a) time_before(jiffies, a)
> 
> Or am I missing something?

Doh, scratch my comment.  It's enough confusing about time_after() vs
time_is_after_jiffies().  Too hot here to review something today :-<

Sorry for the noise!


Takashi

