Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49837C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 04:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJCH0V1iXeB9NzMiOPM8tCVtTVKi/IE74JnfCDg/C50=; b=nloBe14wu8Zk/kma1RDHApi1cy
	rUAfUsfBUwCeXvg6K+v02hpAf6OmjgdI7iraiESDNaTJoujyudzs3v2T4xlj6n/a68PzcOdncbBZU
	22y9yq07xtRt7XFI1leFB5rFW/O+CYj1WSdKBBAVn/IqljeeZYQYm0TMrY92gHzaTfD0flqk6DMHx
	rHnPvGjU1Bwrx6Xx6MXH6MwgpqPWPACs1BOwh6O64lsOQGrxLCYMmeaoTkSpCMrk4i4fCuEEGcn27
	h2LrCbkRA/zF+AxkGw6i+BHJ9g34xv3JZrBXbiDcJO5AKe5GRu2ugVYveB+kRhvAEuaqggUS48Oph
	trPrPQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqph-00000005lrm-0B4x;
	Tue, 10 Jun 2025 04:43:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqnX-00000005lfx-2WvJ;
	Tue, 10 Jun 2025 04:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B41345C3F05;
	Tue, 10 Jun 2025 04:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B956FC4CEEF;
	Tue, 10 Jun 2025 04:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749530477;
	bh=Pyjffi+nSLucRE3vgdFGEa3GGlSbXak0lR4GOVC8Kpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LVurc5Da7zoxb7qboPt7il++of/iF6QU4W6ngC9c9cH9Q5Zm3udHMWscCLozL/j85
	 4wE9GPCewfsBRWY/U8pBfIS6emzt4I4nEZexQ/2Vd25NweixBY+HWoI+KHnKthbius
	 F9yp8PG2S9bEFIJqz9zPveWqbADBzoqQUHwcsYoM1hngikMoB7HadHgeZzG311ss3m
	 MK+YscFAOvLeGWsJbdSkAyb0DurXCHjGwtcWfoi23LQFMXYgoCTKh8NvYrARwnLQmd
	 CT5BeuTSzCoPiYsd2NPwNo775+RP9ngcS9qRoKlrTJzmPVg3rLsfJGohBzUTO+NFH2
	 tyNkq39TThvvg==
Date: Tue, 10 Jun 2025 13:41:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
Message-Id: <20250610134114.5ce2c929b683be6e4f228f2b@kernel.org>
In-Reply-To: <CAPDyKFrejbW1d+jSSJE4K8Zb08CeMHiH9pC=Sr=Y51Lyy4Fhow@mail.gmail.com>
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
	<CAPDyKFrejbW1d+jSSJE4K8Zb08CeMHiH9pC=Sr=Y51Lyy4Fhow@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_214119_736526_C1E45AB7 
X-CRM114-Status: GOOD (  27.11  )
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

On Mon, 9 Jun 2025 16:25:24 +0200
Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Thu, 5 Jun 2025 at 03:07, Masami Hiramatsu (Google)
> <mhiramat@kernel.org> wrote:
> >
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> >
> > mtk-msdc driver causes a kernel crash after swiotlb buffer is full.
> >
> > ---
> > mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
> > mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
> > Unable to handle kernel paging request at virtual address ffffffffc0001fc0
> > ---
> >
> > When swiotlb buffer is full, the dma_map_sg() returns 0 to
> > msdc_prepare_data(), but it does not check it and sets the
> > MSDC_PREPARE_FLAG.
> >
> > swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
> >   <-swiotlb_map()
> >     <-dma_direct_map_page()
> >       <-dma_direct_map_sg()
> >         <-__dma_map_sg_attrs()
> >           <-dma_map_sg_attrs()
> >             <-dma_map_sg()  /* returns 0 (pages mapped) */
> >               <-msdc_prepare_data()
> >
> > Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> > dma_unmap_sg() with unmapped pages. It causes a page fault.
> >
> > To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> > fails because this is not prepared.
> >
> > Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> > Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Applied for fixes and by adding a stable-tag, thanks!
> 
> Note that it looked like the patch was not entirely correctly
> formatted, but I fixed it up when applying. Please have a look at the
> fixes branch to make sure things look okay to you.

Thank for applying and fixing!

Thank you,

> 
> Kind regards
> Uffe
> 
> 
> 
> > ---
> >  drivers/mmc/host/mtk-sd.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 345ea91629e0..3594010bc229 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -827,9 +827,10 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
> >  static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
> >  {
> >         if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
> > -               data->host_cookie |= MSDC_PREPARE_FLAG;
> >                 data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
> >                                             mmc_get_dma_dir(data));
> > +               if (data->sg_count)
> > +                       data->host_cookie |= MSDC_PREPARE_FLAG;
> >         }
> >  }
> >
> >


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

