Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED8D1BDDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrlGxeAxQIRjONh5DmYHR6Bi8gXK3gsqZm861p8ytLg=; b=NKfX6f6HYHowdsEclvMeTAsPwm
	JsrgZsH+49vFxw430SfbzUXhooWew10CG1Vu2iDenrqp8ov31nVcQWOSqEB8ntUd0EC+ri7QPVCW1
	y681U0y2R1pljTTl9idopSHTxdGL0qpcL2X0w48j4DWnWuB+S/XXR1U+AlKyMuc+zPvZ4KzqoWvE0
	Yo3EIUaiLLyo7T4aMWHCV7SYmN38DPkM8vnWg9KtubV9L3HbDjZQnSU7bL8C6m+4/wQ2Y0RkdMxtX
	f8RWnFbNa9UmNcNGvRPCIMAs9v+zloDB80yEHZ2JCG923OWYuN6zTxKM4xELRFYLL8qqiARqNSOyF
	k62OigYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81ed-0000000EiyY-3vLR;
	Mon, 04 Nov 2024 18:18:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81PS-0000000Edvc-3Gcu;
	Mon, 04 Nov 2024 18:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3AC4A43226;
	Mon,  4 Nov 2024 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39563C4CECE;
	Mon,  4 Nov 2024 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730743357;
	bh=yP3AzGld8FzxH9tOKTTB2o68WwDina53uBS0weY4OLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqfYcLrZDS69ybYADumbTjdNmAfqdeBwuYAUOic1Rj/10q6ggUWZLiDYkaCPK5aEH
	 zmu4eoFdrAUYUyqH09b4NU313JKh+C+MQEQsFnA5/S8o13oZAoiRFCI0ipBp/CIHrD
	 YYR8+oHSwIc4iDVej/js9QR02RkzVmrsSiipqECclpGLHtQIVef7t26FeafViOEBdl
	 g59QyyQs5LNimTKrFAcd2N9fUvHgiInhDc8gbGEok4vZSEw9RJzDsGauezslhgF4Jt
	 Un3HrYzRz3V3ubZQNfJ91sOIdTj3MsTjyaJG0bnzVO3UlO5jzUNETVnJiGJm8JQFgg
	 eaDC1K1A+1PYA==
Date: Mon, 4 Nov 2024 18:02:35 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 16/18] jbd2: switch to using the crc32c library
Message-ID: <20241104180235.GB1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-17-ebiggers@kernel.org>
 <20241104160136.GI21832@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104160136.GI21832@frogsfrogsfrogs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_100238_903828_763BABE0 
X-CRM114-Status: UNSURE (   9.01  )
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

On Mon, Nov 04, 2024 at 08:01:36AM -0800, Darrick J. Wong wrote:
> Same comment as my last reply about removing trivial helpers, but
> otherwise
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> If you push this for 6.13 I'd be happy that the shash junk finally went
> away.  The onstack struct desc thing in the _chksum() functions was by
> far the most sketchy part of the ext4/jbd2 metadata csum project. :)

It will take a bit longer I'm afraid, since this patchset depends on patches
that are currently enqueued in three different trees for 6.13.  My current plan
is to target 6.14, and get this series into into linux-next shortly after the
6.13 merge window closes.

- Eric

