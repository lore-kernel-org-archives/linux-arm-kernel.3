Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCA9C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL0anKCCNHS8lBH/DXkYwepz3RpLYqdwtzdHZ34oLBY=; b=qnm4+ZDPcSsfNHIK4DTHzr3JVX
	nxRdm5xiX0F+wL+phCYpAp80tTzrm6Pxbk9Lvv6UiB3hDyf4NG0IbKe1yoKDqNquL+ws89wRoc7Jn
	QD7gl2m/xWJbbKAJeVUMJO/ozmAMd5RnbKtS5ttsTezy3jGqQaiToTT0t7pAhWPScZaEaNNZgloY4
	FjBVi3cEr5SAtT4KBB/Y0hsMF4nhgkqPYwIzcJBERkDNNc6J2+7I1Z2kH9RmSwDR+xx4cOHU7urOe
	gqhVviTV6bgB5GljOhlLijCvdqXr53VWDqx8DsP0Isqc98QPfKtmKHjGhiAUObzBj2jGmtGc3BElP
	XfAOUxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlihZ-000000068CT-0Ja4;
	Mon, 20 Jul 2026 07:46:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlihW-000000068By-3LkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:46:12 +0000
Date: Mon, 20 Jul 2026 09:46:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784533568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HL0anKCCNHS8lBH/DXkYwepz3RpLYqdwtzdHZ34oLBY=;
	b=cMnKCGCzfsQUGrZ5SRzflc8wn458KWZ/7jKX5dyNyuAJEULrznVC/iGZ0NKv4FJcuL6K6D
	jV7y8x5ukz6M3arA4IVE80xuYi5BNWvYikffz+XGB+TN5wpYc4/jzczpIgfBdZmfDmlv/F
	CT+EmncgDkN+wUKDgMw6aNjy0gooKdLtUfvO0bV+4zQGCGWkTBbvjhn0CzG5fdNbTGo+6X
	D9ZyifBixOSPDa/R/vi5cFSWzNA6H7AqQVtaMV3K44W2gzg4FL5lwi9pkPKHosEo7UOhbn
	YV65FpjGmvlEobAjlBnBmhp871bCcCv98JIHpTR4ZpZbJSgtnN+Gz2UwuTEXJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784533568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HL0anKCCNHS8lBH/DXkYwepz3RpLYqdwtzdHZ34oLBY=;
	b=rChR4oaqIlQ08LSl0w5be1BICsXYDLIiPgt59UlSncLC2yLwjhSFJjubzzzynntA6+aqZ4
	brCh4cmVdq2jeqDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, arnd@arndb.de,
	clrkwllms@kernel.org, liaohua4@huawei.com, lilinjie8@huawei.com,
	linusw@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	rostedt@goodmis.org
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260720074607.4QR_L3Gh@linutronix.de>
References: <20260629075726.McX9yWi1@linutronix.de>
 <20260629083150.72460-1-xieyuanbin1@huawei.com>
 <20260629094022.Ml4PCqsB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629094022.Ml4PCqsB@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_004610_983512_C7504EF9 
X-CRM114-Status: UNSURE (   6.22  )
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

On 2026-06-29 11:40:22 [+0200], To Xie Yuanbin wrote:
> On 2026-06-29 16:31:50 [+0800], Xie Yuanbin wrote:
> > Thanks. So, can I take it that you agree with the first one?

I am going to apply the initial patch to my RT tree so it does not get
lost. This needs however to be routed via Russell.

Sebastian

