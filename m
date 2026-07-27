Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rILz7wtfonvqpyG5c3H5MGKD51F3LkusCc5Lk22A8tw=; b=BHj/2nVFAcGesPpAEanJMfacew
	b8OnERlcvyVwg3e2AC9tOOY0WGyAXSf89nA4Ytmuft0WMpAZw4STwGyecaylOIZusiQ9/QBJdqaPw
	PAv7CZyhVwKI3rIrEGYXDf0bl+TpoepcB/9wTgbdNozsg1Cn4yPfFxPNedYtVBoh/v1Buydz4S+ri
	i9JdyWjRDBHZPB/c7gYw8bNUe3dh/7wAqeqrXocMcwobsDMBNoowCJICY2CFrr2IoaeYo2Wqd4mLE
	5XTuqoW3k/VBJltHnYb6MSJqpe2x4/UT7wDZQs3Q9cQmB30R/Fq/S0hCXmCB95fEpVNPk8MR6PEd8
	GthRmJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK0C-00000002cWT-2wxq;
	Mon, 27 Jul 2026 12:00:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK0A-00000002cVa-1bnL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:00:11 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785153591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rILz7wtfonvqpyG5c3H5MGKD51F3LkusCc5Lk22A8tw=;
	b=l+dqrzXU0ezzpa4jwucaaZP3mvNR7xBv2+wWm7RNSDpfCceoK0Nbd9ynHpfN+aS1W5MyF8
	h46ebnRT2kVW+Jbzrb+bAtCbIndTVdqov5nd5stFcKHE+EDUc9R35A1w7jaWJXJopaf4HB
	ymrDJ+hF7nDXWZuUYcTXBxBq+QdCEn/t9pL+AjEWiADvtBTfPqQ/3qwp74OBNn4QJwNoVa
	ZD5YWLbjVU0C0Q6viY2zb18tCv5ps+bnq16XZx5ybSjI/TF6mD9Q/E4sqJXnPOn8BBDm0+
	arC6B7NQhfBPNxA3ZtWGCztzLpKDWHrtiF942ReR4wyK1zOnGde3HNzk+gvoCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785153591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rILz7wtfonvqpyG5c3H5MGKD51F3LkusCc5Lk22A8tw=;
	b=t1rl//il0I3uF34i2WLNAaP+jeSDiuWIUpDruy5uOPOxcCcmdYu33tcDFe+LoL1ARkvsWF
	XrnaSPgtfuKXtFCA==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Karl Mehltretter'
 <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
 <linux-rt-devel@lists.linux.dev>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Clark Williams <clrkwllms@kernel.org>, "Toshiyuki
 Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Subject: RE: [PATCH v2 2/2] serial: amba-pl011: keep console clock enabled
 for atomic writes
In-Reply-To: <TYXPR01MB15199DA567AF4541DD79359FBD7CC2@TYXPR01MB15199.jpnprd01.prod.outlook.com>
References: <20260724213348.77418-1-kmehltretter@gmail.com>
 <20260724213348.77418-3-kmehltretter@gmail.com>
 <TYXPR01MB15199DA567AF4541DD79359FBD7CC2@TYXPR01MB15199.jpnprd01.prod.outlook.com>
Date: Mon, 27 Jul 2026 14:05:50 +0206
Message-ID: <87pl0863t5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_050010_612377_D5EC0614 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Toshiyuki,

On 2026-07-27, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> Regarding Petr's comment [1] as well, I'm concerned about the
> potential impact when the clk remains enabled during periods without
> console output.

Can you elaborate on your concerns? Do you actually need such low-power
_and_ kernel logging directly on serial?

> When creating nbcon patch, I saw a similar patch [2] from the past.
> Have you considered coordinating with the clk subsystem implementation
> for this?

AFAICT there was no real justification for enabling clocks per write
other than because we can. A lot has changed since 2013 and neither
spin_locks nor raw_spin_locks are appropriate because atomic printing
can occur in _any_ context (including NMI's).

If the amba-pl011 insists on enabling clocks per write, I would
recommend not implementing the write_atomic() callback. Since I assume a
significant amount of users _will_ want atomic printing support, perhaps
you can add a Kconfig to toggle building with clock-disabling and no
atomic, or clock-always-on and atomic.

Note that there is also CON_NBCON_ATOMIC_UNSAFE available, if the driver
wants to somehow blindly enable clocks on panic in order to unsafely
dump panic logs.

John Ogness

> [1] https://lore.kernel.org/all/al4KdsU9YLOmwDoV@pathway.suse.cz/
> [2] https://lore.kernel.org/all/1359475526-17523-1-git-send-email-walimisdev@gmail.com/

