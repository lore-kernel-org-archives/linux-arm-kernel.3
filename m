Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA9D6C2AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guu0qtnO7AC41sSsrUKZUbeI4MLPFFd6TNCHnTLLH+M=; b=gEP+6QWLdmSQi/GHTXa4lCHRHp
	4C4GV/Zywo0UF4pHjeIilu/+KEBEOMSQNOt5SsYS+nXbk4ScwEUBrbHVZ874ce52DOiTU0TAsHNjL
	W53WnQDwg6MZvioN9E/ywDkaPj+VMgCy/HMrryOyhxiUUCUsrM33VwUt09Y+LwajRifSIZzr0wR9e
	iuZ0nsRfpXmYkQZGMStB/bf//0JoeCmTfz8s0vs+aMTAVCn1FKm0iReMzTAzvC7HQJEU4JEYt0fT4
	fSN95mxRoH6XdG9xGy2237uidvgPAD+k48d3n4bINLscMCByNeuQC4frRcMjeDnUG/Ck67IvO3m3q
	1N4LVAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWQ2-0000000DrwG-1GAY;
	Tue, 19 Nov 2024 22:09:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWP7-0000000Drqr-0HbG;
	Tue, 19 Nov 2024 22:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9773C5C58BE;
	Tue, 19 Nov 2024 22:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA888C4CECF;
	Tue, 19 Nov 2024 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732054140;
	bh=j7oi2RpEsC+JLluTl0fzDl1uvevxNhnsim4ubAK8WLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV62R8QJ6WWU75mdOAwk0fcyrp4DliyUCgFAyi2MZi0mE9S+7+jKgd6TEblvFBgZV
	 NU2wNVp/rqjLRGW6roxNBhvdGsbif1B6lUc7+vsFm/hWFmS/5wiHMHeEzY/NElqVnW
	 CfbEabHz5bJ/e4H7pEnXZ7Y0cG7b8SBhmBf/wYabr09ZQf9xIx5j7Ti2MVMKegCpez
	 U/4srwFMWtsZJtNcH4iJ/1upgrYWqkRAGAAetb6VivmueMod4MNFsYbaSEVoOoWN5c
	 qK6i236EULfpDXwfuPjUzcgntAmhRhpT4Vun1xba0CNqtEtylihAf6G/wbmfa7rkfN
	 VwuZI13vly7eQ==
Date: Tue, 19 Nov 2024 23:08:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin =?utf-8?B?KOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	Qii Wang =?utf-8?B?KOeOi+eQqik=?= <Qii.Wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <yi4ir6znmqjxvrbcbwnioxkdqyhsv74iwlridwh3nn7wmaat56@nqbqaa5zjil3>
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
 <20241106125212.27362-2-zoie.lin@mediatek.com>
 <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
 <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_140901_146513_34FA1671 
X-CRM114-Status: GOOD (  18.44  )
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

Hi Zoie,

...

> > > @@ -1486,19 +1528,22 @@ static int mtk_i2c_probe(struct
> > > platform_device *pdev)
> > >       if (ret < 0) {
> > >               dev_err(&pdev->dev,
> > >                       "Request I2C IRQ %d fail\n", irq);
> > > -             goto err_bulk_unprepare;
> > > +             goto err_clk_bulk_unprepare;
> > >       }
> > > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> > 
> > You had comments from me and from Andi on this delay, and you
> > completely ignored
> > both of us.
> > 
> > We're still waiting for an answer to our question.
> 
> I am sorry for any confusion caused by my previous response.
> The response to your question was included in the cover letter, which
> might not have been very noticeable.
>  
> The delay before runtime_put_autosuspend() actually executes
> mtk_i2c_runtime_suspend() depends on the frequency of I2C usage by the
> devices attached to this bus. A 1000ms delay is a balanced value for
> latency and power metrics based on the MTK platform.

Still you need to make it clear in the code. Please add a good
comment to describe why this delay is needed and where this 1000
has been found.

This is a constant that is not written in the datasheet, please
report how you have achieved this result. I want to avoid
arbitrary numbers inherited from the development phase.

Thanks,
Andi

