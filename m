Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECD9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umYa9El8e2QDeUO1K08Z11smvPS/0xmZz2hNA5NqK2s=; b=oSFAk3ZTMqx12+reu0i8wAsUTd
	hjGiN4tZTYoGuP9sifcUkrCHggXf5drrzrbMfgusKNLQbtj6lGuxCY6mGzpPDdax/4svIkuAk513Z
	satptuWWb05nbQMqfYkDWy+9lRAu4pHGo6bcHW7mslM+PDEHmYgXgqLPBz5l6OueXamVb/6T5N0Ba
	4DI3Kk04si/TiSW/C6DmOp01icmmbzjJhexuo5IIKOS5i/1eIAUkblQDjvJGrAdl4S8GiBhvwRb0x
	6Bmr4IjyEp52vtAWcUCLJrfsw0p+P9JeVDdmxm4blK5l4PDjfcl01lQ7byxTyveh0wXa5k9xBRzoP
	QcF78nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIkz-00000007DDn-0QIV;
	Tue, 18 Feb 2025 08:15:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIgv-00000007C0d-1rn9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 823645C5B7B;
	Tue, 18 Feb 2025 08:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEF1C4CEE6;
	Tue, 18 Feb 2025 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739866252;
	bh=Xn8Eug54BTNvbhwm4r4GgmUNpr3mOGqeFSI54sBSM1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCxShyY2pLEegHlZumDdUNGHJ53Wd9tracfk+YVj7jwbYw/+1YfexHq3y1Q+2oIZw
	 gJkKy85+K/IWvWhud0dItMxD+nTJPqLMn84F73dMqfKCcZZ+OwNwRj0izL1CK7kFNA
	 DfjdtE66b3QYtnmB8bdKQclSRD53/RNX9UeF8RWU=
Date: Tue, 18 Feb 2025 09:10:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: core: Don't use %pK through printk
Message-ID: <2025021822-plausible-poem-eb90@gregkh>
References: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
 <20250217-restricted-pointers-usb-v1-1-78da55158832@linutronix.de>
 <2025021733-strudel-curator-bfaf@gregkh>
 <20250217153444-4e1fd8ec-7f0e-4f40-8fc1-e323e4622284@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217153444-4e1fd8ec-7f0e-4f40-8fc1-e323e4622284@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_001053_529841_515A2AB2 
X-CRM114-Status: GOOD (  21.92  )
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

On Mon, Feb 17, 2025 at 03:50:54PM +0100, Thomas Weiﬂschuh wrote:
> On Mon, Feb 17, 2025 at 02:52:05PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 17, 2025 at 02:20:51PM +0100, Thomas Weiﬂschuh wrote:
> > > Restricted pointers ("%pK") are not meant to be used through printk().
> > > It can unintentionally expose security sensitive, raw pointer values.
> > > 
> > > Use regular pointer formatting instead.
> > > 
> > > Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > So really this is just a revert of 2f964780c03b ("USB: core: replace %p
> > with %pK"), right?
> 
> In this case, yes.

Great!  Mark it as such then please :)

> > Why not express it that way, and explain _why_ it's somehow now ok to
> > use %p when previously it wasn't?
> 
> The full background is in the email linked from the commit message.

That's not obvious at all when reviewing patches.  Please provide enough
information in the text itself to understand what is going on.  We
don't always have access to external links so we can't require them for
context.

> %p is more secure than %pK since
> commit ad67b74d2469 ("printk: hash addresses printed with %p").
> %pK was never intended to be used through printk() in the first place.

Great, say that then please.

> I'm doing the these changes for various subsystems using a common
> commit message. The changes are not reverts for all of them and
> digging out the specific history for each single line is a bunch
> of extra work.

Writing a good changelog is hard.  Trying to automate it like this is
going to be harder.  Just take the time to either do a revert (and
explain why), or do the change (and explain why).  Either way you have
to explain it properly, no shortcuts there.

> If you want more historical context, I'll resend the series, though.

As you are reverting a commit that was stated to be "for security", yes,
it better be redone, otherwise this is going to seem like a regression.

thanks,

greg k-h

