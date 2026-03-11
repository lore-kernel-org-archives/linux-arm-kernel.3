Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0966AFD0621
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6u+clxOk1xQPulOiQ+56I6Oc3pHn31UoBWc5vHf46Y=; b=wngVe73loOz1DnfAVswPV9U/v7
	vr5UYjkZwG0kPYqlChG+x6j3Yf99uoy1ZgySgSEHzqddCmgZ5mdl7Qo8l+AmYViOf6pjxaWpgQdmb
	KNGdnNV/n5L3Ms5QCRVR13o7FZxGni5xTF4kHdF8u/aduM/d7065lbO0LqNAssdOVTlw/1OHaFMrY
	dedlbw7GW5FChp8xrgU1Om9VpTIL0yS9aMjkUJ4bDDkoaghfd5oxkYkIfR5kR3VzvqSvUHQCj4r3k
	8WO9hrZnRPxeqsmtpmwBDc2u1b/ozi3iV7HMuLUjWtanaTlUXUToQnfp3UJ1LNKd8BGpzPN8w71JM
	7j5kHsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DKW-0000000Awpm-0yjL;
	Wed, 11 Mar 2026 06:46:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DKU-0000000AwpT-36KI;
	Wed, 11 Mar 2026 06:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 526446013E;
	Wed, 11 Mar 2026 06:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6281EC4CEF7;
	Wed, 11 Mar 2026 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773211561;
	bh=4K6v1Z5uqrbPaJefI3o/9xr8KH389GbRCleWha8dTDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdj3vTzEsmEitF8OUwOBC4Z7mgN9nl2qpMZyAq3NGbvGf+E5Fnk63TDBjqtouqXdH
	 KFuNwxv6yz2T8EAIAv9RSlPM6zUKDG4ZO5932ROoDGKLIWT+1mYJbJIvJASRneeB4B
	 T+I35P8C69J22nUri6rrFfXwB1YhPK579ZzNmxDY=
Date: Wed, 11 Mar 2026 07:45:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	kernel@pengutronix.de, kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
	ribalda@chromium.org, straube.linux@gmail.com,
	dan.carpenter@linaro.org, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Message-ID: <2026031102-decrease-preachy-6096@gregkh>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-8-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-8-sanjayembedded@gmail.com>
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

On Wed, Mar 11, 2026 at 01:35:13AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
>  2 files changed, 11 insertions(+), 39 deletions(-)

As has been stated many times in the past, please do this for new code,
but not for existing code unless you are fixing a bug at the same time,
as the churn is not worth it (especially if you do not have the hardware
to test the changes with.)

thanks,

greg k-h

