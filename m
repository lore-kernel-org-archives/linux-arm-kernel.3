Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB48E9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ11vK6VtIVd139Ojxs5lX7W/wK7C3IqSgUGtUMF/Tk=; b=kU4fNJLuChYQui+r7L//P1xwwL
	DE+/OEnXWBd3tn4KmrQPVygByrL/ODsYhSD+/bfJabBEoYueGG0tvbbORcU/8ny11EAFRjRdp2u/u
	RHXZeUn6rXfDc6DcW6XPF9KkSSX1838Pa13KJzzcl9aXIucf8YHGbGRHNqnHP7B6CpIGZxc6ApR0o
	QGP3NwdEtZywML6JeD2IyOCzc8aSfQuwPdmmQfBuvP+HsE0EU2s/Gjt6Wb9nsZ7QpArmozcdr7CaI
	GQ7GmBMvJgH1UW/7swUuw6HxbNFJ1ocOX2ou5Jk5tlMfAdkYcXD/gmjSiG056nNfDDQHbZnGg8y2k
	dbe9Xpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0r5-0000000CkM8-2dSc;
	Mon, 02 Mar 2026 10:50:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0r2-0000000CkLm-210D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:50:25 +0000
Date: Mon, 2 Mar 2026 11:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772448622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LJ11vK6VtIVd139Ojxs5lX7W/wK7C3IqSgUGtUMF/Tk=;
	b=luUvFsCRasCPcUrkKVKnAtbIOrxg4rL3l2Ho6jb0Sr9ebUjjDOodCMV6DEFK+OLsdjhnlx
	Vo53M6cpIua++yWOi99HU/jxlsdZBNrWFtIOO6eVjV0wpXCLjugSDIj7psDMZR13yfEwrY
	e1o4vl9BKxXA34alW176Fkx/47Hji9j6qe6bpA/xC68rT7Q8WQnW7pcX3rmBXX56DUiZqf
	3mQJqlHkeHCjPc5uffcQoh3DrFQoa2lMqSdSsCdTNSZm9qqBIX+PhL9veQuN72GRMObuvt
	DDmV/zme3z1uE7L9AZHycWpapiaUBW6t0JKY1MqMNMNyQgBWCIv/iDnlUUXBIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772448622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LJ11vK6VtIVd139Ojxs5lX7W/wK7C3IqSgUGtUMF/Tk=;
	b=Wecf0X0QCqKCWRC00mFP5q3KVKxeVz52yJ5P7FF+yXVbrqHG3w18h2LGlu6PSCc9uvnhp1
	AR7irSQo3cS+c+Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 4/6] ARM: use BIT() and GENMASK() for fault status
 register fields
Message-ID: <20260302105021.JEoFiIoj@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzch-0000000AwoC-3JkD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzch-0000000AwoC-3JkD@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025024_660935_CD4FDA7C 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
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

On 2026-02-27 15:19:23 [+0000], Russell King (Oracle) wrote:
> Modernise the fault status field definitions by using BIT() and
> GENMASK().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

