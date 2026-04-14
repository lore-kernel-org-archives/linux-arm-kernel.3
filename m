Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3449DF9D0FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo03UPaCbU5fCLB6rB8/Wfjvuj9xckNaS+amXlIhHFw=; b=tNkgQQDcSx3U0H5c+ydxe3ki5d
	WxBibcw2I4R2IysVcWIh4T/cYU7hrwZzxvfSCMLOuhRUpnUY1QfSVhmrfcMsPyUgcYuK8+QDIQoOE
	iv29DOEAQOueRT9P6wEGbrcrMFbaxYN2rP+nl7q71PMw6ZfQ+VMMk0w0IDaDB67Gp+Jud+QAQsqyd
	PTdkF3+hqBFxokXqFpsCoqYiVpReeM6YBCGGQr3UFnWasrDo4YvJJA/FSS2kAoj/QIxThSa3fMpQN
	HUrzBbxMEN1H85sSf3Q5jIFaJx/yOXhFKa0ypUxY5QqybWsFy74gB5wDyltwGN2b8q5LZ9qGaf4aZ
	avxLnOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmmp-00000000JSX-3GZH;
	Tue, 14 Apr 2026 23:03:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmmn-00000000JRz-0Vkx;
	Tue, 14 Apr 2026 23:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB47A4395D;
	Tue, 14 Apr 2026 23:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39872C19425;
	Tue, 14 Apr 2026 23:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776207791;
	bh=DPMIG0JyHD8TiANVF6tKn1krzB0C2AAq7YcH8D+L2w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMRqA8NWtpwh46bcDmDtPfeFSsI7VfEvufnIj70RnhOpvKpu2H2OdtOvM28jJ/Ujj
	 9+jkDC1wW77PceNKP5EnwBPHQltH4H80Yk98xbMrQUK/Y2PTwlWgiTVdQfE4Bs5Pak
	 dvLbqPBc2M65FwlOprrcEMb+9IbUaFGTtnNf7+S7d6471VxFutgK6KwJVnheiOAYHn
	 zJLsGczmt4x0z+X26vysLjD50SGqRe9XBkrHhS5jGRbv1EniaqNwP9lFNYQD6l9URe
	 j5f6u7Uk8ZpYlCxHTs3LgySB5fk+754sojJIaC8M290UrrYxXExY3VwZpquhJqO3Qj
	 /AtIApwXUlJ8g==
Date: Wed, 15 Apr 2026 01:03:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1,PATCH 1/1] i2c: mediatek: add bus regulator control for
 power saving
Message-ID: <ad7FOoevcOm0AxP8@zenone.zhora.eu>
References: <20260318084621.4127757-1-adlavinitha.reddy@mediatek.com>
 <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_160313_203835_E0A2AE83 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Adlavinitha,

On Wed, Mar 18, 2026 at 04:46:16PM +0800, adlavinitha reddy wrote:
> Add conditional bus regulator enable/disable in mtk_i2c_transfer()
> to support I2C bus power gating for platforms that require it.
> 
> This implementation:
> - Enables bus_regulator before clk_bulk_enable() if vbus-supply is defined
> - Disables bus_regulator after clk_bulk_disable()
> - Only activates when vbus-supply is provided in device tree
> - Has no impact on platforms without vbus-supply defined
> 
> This approach provides power savinggs for platforms with an extra I2C bus

I changed /savinggs/savings/.

> regulator, while avoiding runtime PM complexity.
> 
> TEST= Build and boot on MT8188

'"TEST=..." is a tag. There is no need to save characters in the
commit log. I changed it to "Tested on MT8188.".'

> Signed-off-by: adlavinitha reddy <adlavinitha.reddy@mediatek.com>

Please use capital letters for your name and for the committer's
name as well. I fixed it.

Now you have to explain me why you sent three times this same
patch.

Next time, please use the format '[PATCH v1 1/1]' instead of
'[v1,PATCH 1/1]'. Normally for the first version you can omit v1.

For single patches you don't need the 0/1 cover letter. Just send
as [PATCH].

Please read Documentation/SubmittingPatches.

For now I merged this patch in i2c/i2c-host-2.

Thanks,
Andi

