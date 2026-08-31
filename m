Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253DBC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyqp9QN9fSv18RFAzbc+q3w72fkLkoZKcSxhRSYFTxg=; b=OvSAbuImeY+3y1R2jxbMkniGwp
	dGd8OA0320zinB8jYnIAgxyYZ2ch0Xg+36NfDxcB6YnCpTmtdorWhSFekXpE9sgpWYBSdDVykBF80
	c1R3MhfNuLhat43l5Zl/sIcHthA/qWQjTOEzER9xgiOw0TGsCIXW8nkauYAUmYPeYzHZHWcEDgAe/
	R/UAps70J5QhL6577tnw4UMOMIL2XFQYYev0tL2S6oznbEoi3u8/+0NOB7Dw217wtnWKOcleBdMdr
	IYSKZgnQ/WYtUykX0RndPtwqV3rnuCSUvQUues1d+//XCHYfk0EmP9pCZGzy5JunC9IrgxKjh9Wu5
	XRQvlAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rFk-00000008KUP-4BuP;
	Mon, 31 Aug 2026 01:56:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rFi-00000008KUE-3t0U;
	Mon, 31 Aug 2026 01:56:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11E0F60120;
	Mon, 31 Aug 2026 01:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5C81F000E9;
	Mon, 31 Aug 2026 01:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788141361;
	bh=hyqp9QN9fSv18RFAzbc+q3w72fkLkoZKcSxhRSYFTxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YdMwuCqqwUisYtwUM5fF3XW2e4TtD4hkWV9wmKO11GpaUanKVaGDARcc9K6Ln3whx
	 6Lr82lRmy4nqX+0JYqus0stf91cTOH1r9rDIgL65ns9yRXnTEV8oWJ63w3tjMIAIM8
	 EAPuIUtfVh/RzNaMuCkx9z4EAA51mkG/e+cR0LdnF9e8vei3jR7b3JiOJQO/LkdqJN
	 xmHJVnqHTtFUAHnJNJ8oQiVhV7U76fxRrnTr+olOYw39zbHQ+gehNtK3oBBd12Y13h
	 ervhrfmdfGFogjwSEYNDLS05khQxm8UHWRZ3KYmZslXYlvWbrYzmN+WZ+e1ltJNsE4
	 6rwqezb768v3Q==
Date: Mon, 31 Aug 2026 02:55:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Simon Glass <sjg@chromium.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix RV1106 SAR-ADC support
Message-ID: <20260831025557.6ee7c42e@jic23-huawei>
In-Reply-To: <20260823122039.20831-1-vlad@zlab.su>
References: <20260823122039.20831-1-vlad@zlab.su>
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

On Sun, 23 Aug 2026 15:20:31 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> This series fixes the support for the RV1106 SAR-ADC in the
> rockchip_saradc driver and its device tree bindings.

I debated how to apply this.  Technically patch 3 is a fix, 2 is an enabler
and 1 is also a fix, but one for something that we just effectively patched
out from running in patch 3.

So in the end I'm thinking take this the slow path for next cycle.  Shout
if anyone thinks this should go in during the -RCs and whether all 3
should do so or just patches 2 and 3 (leaving us without driver support for
now).

Applied to the testing branch of iio.git

Thanks,

Jonathan

> 
> Changes in v2:
> - Combined the driver patch and the dt-binding fix into a series, as
>   requested by Jonathan.
> - Introduced a new patch (2/3) to group single-entries into an enum list,
>   as suggested by Krzysztof.
> - Added missing Suggested-by tag to the patch 3/3
> - rockchip,rv1106-saradc compatible moved from the
>   single-entry to enum list in the patch 3/3
> 
> Vladislav Leonov (3):
>   iio: adc: rockchip_saradc: Add support for RV1106
>   dt-bindings: iio: adc: rockchip-saradc: Group single-entries into an
>     enum list
>   dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible
> 
>  .../bindings/iio/adc/rockchip-saradc.yaml      | 18 +++++++++---------
>  drivers/iio/adc/rockchip_saradc.c              | 16 ++++++++++++++++
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 


