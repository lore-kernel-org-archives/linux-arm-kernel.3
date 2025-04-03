Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2wFu7TSeDjjvxfl4L13bngpfKqryMwLZ0iBvi8cco0=; b=D2LZaejRw01YkIrig1tJuDVHtp
	YN0S5glCuG9ypgA14UqXKeulv+5w4GIlf8VRLojfIvlzm9FnfHk6vYIEvkPuBGj6wK/6Q8OqH7oAj
	ZVTqHx3GULKG5yt6CiWO2TuI+EhBcUgOb5TofQejCChf5sr1cXL6leZKz5l1uyZK2sWrzt7zZMujM
	WS/9dtNVYNZWqko0OpQ2rz1wImIZ7vC85yJpAORvSSTSFK2y7p0ejry+/Qf0r2vBqb2Eyclj0Tsj7
	/1ZXLZkW7wzRvNvjbQtylXI6v2W7sAYcoNt4xowfxZmZP0ucs2a7gMuGf3UYrMVcUiYhKiW8GyrYj
	6FQPWW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HOC-00000008TZ8-1bKP;
	Thu, 03 Apr 2025 10:01:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GRJ-00000008KDK-1nSS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A48468429;
	Thu,  3 Apr 2025 09:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7480C4CEE3;
	Thu,  3 Apr 2025 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743670844;
	bh=WieTwftKJ4wIoBz+4UXZMSRR5q3d/MG41Yn+IFrvBkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzPGB4NtmFEwOJ+8kx/WZsDtdWgn1ueihPaqCjpqdxW+zYZichIiT5lD5FonrKK9K
	 0jU69pjMuyyxdayEXay4SCYHtwrOYYKBxIGaLgY6fQZ8/UgKYR7kfs8Z4GKJgWuH56
	 75tdHMRwBtVrHROXFf7U6JB54EMmX0PeiSnRTCDw=
Date: Thu, 3 Apr 2025 09:59:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2] serial: Fix null-ptr-deref in mlb_usio_probe()
Message-ID: <2025040310-gangway-obvious-5122@gregkh>
References: <20250403070339.64990-1-bsdhenrymartin@gmail.com>
 <970e78d3-e3bc-4a34-9ba8-40df4823726f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <970e78d3-e3bc-4a34-9ba8-40df4823726f@web.de>
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

On Thu, Apr 03, 2025 at 10:50:36AM +0200, Markus Elfring wrote:
> …
> > Add NULL check after devm_ioremap() to prevent this issue.
> 
> Can a summary phrase like “Prevent null pointer dereference in mlb_usio_probe()”
> be a bit nicer?
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

