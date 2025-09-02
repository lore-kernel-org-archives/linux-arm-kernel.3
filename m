Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A9CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obYU8DIvRl/LxP8rYNMJlTm9HAL4mQIynygpQ7ovWhE=; b=4V5TjtQPKPPxFgilZaWOLqM6W1
	BkNV3I90ITF4iwQzEyv/HFF4f/Ug5M6QUyigexbAPLsrPVa4ZbJzrtYlSs6CMLUowhVIs/yahmuUx
	9BIAzMIqFb3UgZiHmzsLyjuFuc+IQ8LSJjfm3fP7cIez803yvhSd6IPMhE2/CjjokbXWInKWqBhvJ
	xgYQclFuGK/IrLDyqyD7NdV72fCANkv7JixOP3bT4MaLshPfRFVQuz/hita8OWDb4HXFkjmNRpqXy
	ViUknvDZFwDFIJZAyQK1vrC2fdKPrmg9KSPBdMLnZmf+ks12q5mnUWfjLsH4yKAI7hxKq3DLBxw7s
	/577q04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAD-0000000HIPC-1ESr;
	Tue, 02 Sep 2025 12:31:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNnf-0000000GXdN-3GBM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3C1A601D3;
	Tue,  2 Sep 2025 09:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99184C4CEED;
	Tue,  2 Sep 2025 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807178;
	bh=M22+uJTa/W0eNL+3Bo93sBc6P8ROW0P0TJeVjfjQk18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzsM0CZ0400pFYojaPSN3T8hh4EfIYl7a/Mi8NEmZ1c6qb4DouJ9/F56YeIqbtCnD
	 XPjcrINJyIv8Zbh4dunh7pNK5xMkUjpk+oYVqLjqfbzxZWnOAxGUKQfxbo/NDarrLJ
	 JEW+8E1V5q1uCg7ZvVmDiEcF1mytSCutnNt4yLJ1BwpC6WmsTcll0jR2OlqMNpgpsV
	 +dZOiaM6VTJlzYzIj7P5wZSj0CV9C7St6uj3cJ70LnbR8UjM3Z82ePB9Tvd8WUfoMp
	 B7ZXtU1T6VcWritj/lKN9Hr5mDw/AXbn9BK/gnC4OUSgis9QTFw+s/4MJ1IeivSKee
	 3/US+8bpFiBUw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1utNnQ-0000000080j-2mDu;
	Tue, 02 Sep 2025 11:59:25 +0200
Date: Tue, 2 Sep 2025 11:59:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <aLa__M_VJYqxb9mc@hovoldconsulting.com>
References: <20250829132152.28218-1-johan@kernel.org>
 <aLG5XFHXKgcBida8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLG5XFHXKgcBida8@hovoldconsulting.com>
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

Hi Sudeep,

On Fri, Aug 29, 2025 at 04:29:48PM +0200, Johan Hovold wrote:
> On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:
> > The quirk version range is typically a string constant and must not be
> > modified (e.g. as it may be stored in read-only memory):
> > 
> > 	Unable to handle kernel write to read-only memory at virtual
> > 	address ffffc036d998a947
> > 
> > Fix the range parsing so that it operates on a copy of the version range
> > string, and mark all the quirk strings as const to reduce the risk of
> > introducing similar future issues.
> 
> With Jan's permission, let's add:
> 
> Reported-by: Jan Palus <jpalus@fastmail.com>
> 
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220437
> > Fixes: 487c407d57d6 ("firmware: arm_scmi: Add common framework to handle firmware quirks")
> > Cc: stable@vger.kernel.org	# 6.16
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>

I noticed that you picked up this fix yesterday but also that you
rewrote the commit message and switched using cleanup helpers.

Please don't do such (non-trivial) changes without making that clear
in the commit message before your Signed-off-by tag:

	[ sudeep: rewrite commit message; switch to cleanup helpers ]

In this case, you also changed the meaning so that the commit message
now reads like the sole reason that writing to string constants is wrong
is that they may reside in read-only memory.

I used "e.g." on purpose instead of listing further reasons like the
fact that string constants may be shared so that parsing of one quirk
can subtly break a later one.

Johan

