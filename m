Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BA5CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfACGKPe+h8nDKAZVwEcwCcmLmR66lsR2ZVXVM0MTwk=; b=RaEG4MSxRUIgo7anR5/k+88Nfu
	JzIeTX9u2soxKhxCrALSmegE29Z02KLwJI9Mkq9uNfX4K6xZ4QijLBUajDCCiQ0t23zHSYXeXtDNi
	R0iZHZ4E8Fb1mGDRBJDxxsLhvQBt3nxH3Qa84AofP2mihaq9MDy09fd5gvvEhPuLq9qoP8eMRoJut
	2zdvFLgsq4FXSPIcMBJoQPWNpp+wGM/xLsNDlaey6MFHxgFxDiGUw8y9FDia9vlN9o0ZzQXjcZ6Z6
	MjBJghILS7o3tpyJD2ut//msko3BnzfzuXY6lGAdh5em08VfrDhmYgR/eCJdzK80fsEJ4Q8touOXq
	ajlQSyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZwZ-00000006Ha6-2Wc9;
	Sun, 18 Oct 2026 23:05:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZwY-00000006Ha0-0ydF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 23:05:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B77AC411DD;
	Sun, 18 Oct 2026 23:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033571F000C4;
	Sun, 18 Oct 2026 23:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364729;
	bh=JfACGKPe+h8nDKAZVwEcwCcmLmR66lsR2ZVXVM0MTwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RDhzf4vOwQ7Im6J4biLteio5aHEFnsOkSxqX8OQhAYON9Wy3OAoBwYY9NTG7IzNVP
	 1s4R/DL9mVi71YEHjydDYoP6r2jV5dhKztw0iT8Nzt/2t5+FWA10SkZQvwnfEWI9pM
	 aPXzExqHA94vH7Lun3e2MmNPEs9rAmro3aj5QUGHV21bO8+Gag0pjfAipubi4OQX/x
	 otknxECxWSjbyLIVAYNIFlcyDtwpn2pLWev0imF0CHQwl9AWk2FVue7+rdcfmK7S7Z
	 Lwg802s2blWuR8kqaMpEsxSrxf3T1zZ+smhA65Nr6zMTIBSfv7EKI6GwbHRxQashum
	 VTF9+j6A8cHmA==
Date: Mon, 19 Oct 2026 00:05:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 04/15] iio: adc: xilinx-xadc: Drop unnecessary
 masking and dead code
Message-ID: <20261019000523.1d43a8d1@jic23-hlaptop>
In-Reply-To: <20261005094205.1045874-5-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-5-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 5 Oct 2026 15:11:54 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Remove a no-operation bitwise-OR with zero (dead code) and the redundant
> 16-bit masking when storing values into u16 destinations, where the
> mask has no effect. Also remove the unused macros.

Hi Dileep,

Why?  If they are expressing the rest of the fields in a register
simply knowing there is stuff there an be useful even if not
explicitly used. There are three approaches I tend to accept to
such defines.

1) Comprehensive.  Sometimes it is just easier to define anything -
   particularly if codegen involved.
2) Comprehensive for a subset of registers + nothing for the contents
   of other registers - fits the above definition of useful by defining
   what the bits we are leaving alone do.
3) Exactly what is used.  I actually don't particularly like this and
   prefer option (2) but I don't tend to consider it a reason to not
   merge a driver.

Now, if the stuff you are dropping is inconsistent across IPs or similar
then that is fine, but say so here.

Jonathan


> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>


