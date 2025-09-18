Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC2FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9nDJi034bpbirmFN9QGbcBuwYHlRm5SZgfLgywLJTk=; b=eFs2PFJUP3J/HHa1Pne+FMvqOu
	8zQrYw6KkH1ruP8lwceIb0MhZUVecpZD+f99oI9XmuCYdA8hARZGTkZzg+9guJwQPA/Ro+2CryrUY
	H/ujdfGW18huz2x1rYnkAcTx8/AT6O3WCvLAXE9RbMej18s89IYL45fhxHO8EMtjqdSUusvIBMkJ/
	fE4zkF1UXCsFmyB6Ssl9+6RfN/ruSwjhnJPcJwxOtFaKUtJmziGfDnIUMTbHNCvgP9/bRAATAJuT4
	sz80Az6EHEQ2XpbwGfG0XqOqHM7gguH8j/h+FpRK71liDPz1pc5OSrsREwyI+TstL8j3+VystcKa2
	Blnv1GUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGts-00000000UpX-25I9;
	Thu, 18 Sep 2025 15:50:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGts-00000000Uou-0UA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03BA4601BC;
	Thu, 18 Sep 2025 15:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4101DC4CEE7;
	Thu, 18 Sep 2025 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758210622;
	bh=x8rAaV+OPQrTKmQDJDYaSl77UVLnmG3EU6WqkBRlDWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+GtYi4XIL/N86WybQz8vl9+XN+NOq46VzvnhyawwIyUTsZCxCFkW0teI3YqJOdGK
	 BTuGjsT918vOWUC/3jcs08vZprz8dEz8CUSSc+jLRZtfelE4R2RDfBmj8HEDGLd8BH
	 8g++bqMx8IrA+uYvvdwC33vZftdDDyIFH6TRjllE=
Date: Thu, 18 Sep 2025 17:50:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: make sa1111_bus_type const
Message-ID: <2025091808-brick-glitch-5789@gregkh>
References: <20250918134429.270814-1-abarnas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918134429.270814-1-abarnas@google.com>
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

On Thu, Sep 18, 2025 at 01:44:28PM +0000, Adrian Barnaś wrote:
> Because driver core can properly handle constant struct bus_type,
> move the sa1111_bus_type to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm/common/sa1111.c               | 2 +-
>  arch/arm/include/asm/hardware/sa1111.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

