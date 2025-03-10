Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcSG66+5FVg/6Rs+nS2gobG7eK6s/iY5+O6Rim/4akU=; b=wofPbe+4vXdU6132Ch6M8YvUE2
	zQio6XT7jNDooRFNLaJNv6fEeso5ujvoFuQlDM7WGDq3UNcaBPbJxJZwVAkZXWLGbLPSOrGgCCPFy
	GNHeyAVqt9WxejLs7cmpj5NL0flqxqY5qPdP79B2MlAEH8tJs9/llXY07biHQPdraP2NF66+d5rJj
	LS72iu0NeafkOUMt2nMMmdIjZk/aN+t8mHWC/ERHRVPx0q32cB8xC3znfRVmUwYwjOqsFyRyjMA3n
	/0r56wKnKywxTMQ/gPgTiWloWzzl30WTfKjlfjpfWpoAcFkuAtFRnHOJq3gpiwS3Q8FhtJhTcLsRx
	kHeEYFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trX7T-00000001hHf-415P;
	Mon, 10 Mar 2025 07:00:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trX5p-00000001hC7-36sT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 06:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38A905C03D1;
	Mon, 10 Mar 2025 06:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A406C4CEE5;
	Mon, 10 Mar 2025 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741589908;
	bh=MI/HwqEL2OPCjvc2aGnpiGs/AcvZ6r10iVYJLYV/Og8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xUiS5MiUa+D6x0z1UldzohtW1PhLDWG5az/jPLAl7x2xx5HSB4EcvDBqX4oMteBrU
	 mOSpieFnabDRFCtj5T5ZnYlZzjbfAW4kKQxF/oRUIcX7CTg6xvfa4UmylL7jSKBoPP
	 y1hJsiP7To4HTVLo2yf51biuTeO/GAIYrO+GTBMs=
Date: Mon, 10 Mar 2025 07:58:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: Russell King <linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] serial: amba-pl011: Implement nbcon console
Message-ID: <2025031001-outwit-outsider-b34e@gregkh>
References: <20250204044428.2191983-1-fj6611ie@aa.jp.fujitsu.com>
 <TY4PR01MB13777DB55F2231F7399E42609D7D62@TY4PR01MB13777.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB13777DB55F2231F7399E42609D7D62@TY4PR01MB13777.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_235829_832130_EE2FE8C9 
X-CRM114-Status: UNSURE (   9.00  )
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

On Mon, Mar 10, 2025 at 02:23:35AM +0000, Toshiyuki Sato (Fujitsu) wrote:
> Dear Reviewers,
> 
> It has been about a month since this patch was merged into tty-next -> linux-next.
> I would appreciate any comments or feedback on this patch.

What needs to be commented on?  It is accepted and will be merged in the
next -rc merge cycle.

confused,

greg k-h

