Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E807CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9NxPfe6XfxXUjr+vI8y3+8zDY9J9m+A8OFmzTDnis0=; b=E/Ia4wKxknEOMRS2VCJZpIZzzz
	CewtYC+PzVTOId64ZJGV+tIhcfqxj0LuDTwqDGxyST5K1KxO9/wtRwnzun4kd4QsH+XeNTKPaIac0
	2EzwWmKI3j2OYej4eS+XpskGJZVCEe+EGIK+29Ulhee//qxV2R53evb0sbe9NxtxiUaGS2D/AgDEZ
	pgtNjwyEM2oXbYAanNc/3Ob8xdx2a8BH7ddCVe96u1ABW9dAYbIaLLSyRr5ir9Ty0ADfCdxx7gwEc
	J7xhjlxxksBmcdE/FxgPusJ/o4MuBtd9G4YPF5ii5MY1KUbHqceEBUFptbYjYxMlV/DGg8tAYXOKi
	HpEo97dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAQqf-0000000Avov-2bNc;
	Sun, 19 Oct 2025 10:41:13 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAQqc-0000000Avo8-3uQJ;
	Sun, 19 Oct 2025 10:41:12 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vAIke-000000005VK-0PXI;
	Sun, 19 Oct 2025 02:02:28 +0000
Date: Sun, 19 Oct 2025 03:02:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Changqi Hu <changqi.hu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] serial: 8250_mtk: Enable baud clock and manage in
 runtime PM
Message-ID: <aPRGsKGDrYlyoTje@makrotopia.org>
References: <de5197ccc31e1dab0965cabcc11ca92e67246cf6.1758058441.git.daniel@makrotopia.org>
 <939cea9e-d7bd-4a13-b462-17e483f61e4c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939cea9e-d7bd-4a13-b462-17e483f61e4c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_034110_993199_14895FDE 
X-CRM114-Status: GOOD (  28.61  )
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


On Wed, Sep 17, 2025 at 12:00:57PM +0200, Matthias Brugger wrote:
> On 16/09/2025 23:37, Daniel Golle wrote:
> > Some MediaTek SoCs got a gated UART baud clock, which currently gets
> > disabled as the clk subsystem believes it would be unused. This results in
> > the uart freezing right after "clk: Disabling unused clocks" on those
> > platforms.
> > 
> > Request the baud clock to be prepared and enabled during probe, and to
> > restore run-time power management capabilities to what it was before commit
> > e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock
> > management") disable and unprepare the baud clock when suspending the UART,
> > prepare and enable it again when resuming it.
> > 
> > Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")
> 
> Most of the issues from this commit are already fixed in
> b6c7ff2693ddc ("serial: 8250_mtk: Simplify clock sequencing and runtime PM")
> which is more or less a revert of e32a83c70cf9.
> 
> I think we should add
> Fixes: b6c7ff2693ddc ("serial: 8250_mtk: Simplify clock sequencing and runtime PM")
> here as well. It's a fix of a fix :)

Just a friendly ping about this patch :)
Should I resend the patch with the added Fixes:-tag? Or can it be merged
including the tag added my Matthias without a resend?


> 
> Regards,
> Matthias
> 
> 
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v3: squash into single patch
> > v2: add managing run-time PM in dedicated patch
> > 
> >   drivers/tty/serial/8250/8250_mtk.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > index b44de2ed7413..5875a7b9b4b1 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > @@ -435,6 +435,7 @@ static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
> >   	while
> >   		(serial_in(up, MTK_UART_DEBUG0));
> > +	clk_disable_unprepare(data->uart_clk);
> >   	clk_disable_unprepare(data->bus_clk);
> >   	return 0;
> > @@ -445,6 +446,7 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
> >   	struct mtk8250_data *data = dev_get_drvdata(dev);
> >   	clk_prepare_enable(data->bus_clk);
> > +	clk_prepare_enable(data->uart_clk);
> >   	return 0;
> >   }
> > @@ -475,13 +477,13 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
> >   	int dmacnt;
> >   #endif
> > -	data->uart_clk = devm_clk_get(&pdev->dev, "baud");
> > +	data->uart_clk = devm_clk_get_enabled(&pdev->dev, "baud");
> >   	if (IS_ERR(data->uart_clk)) {
> >   		/*
> >   		 * For compatibility with older device trees try unnamed
> >   		 * clk when no baud clk can be found.
> >   		 */
> > -		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
> > +		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> >   		if (IS_ERR(data->uart_clk)) {
> >   			dev_warn(&pdev->dev, "Can't get uart clock\n");
> >   			return PTR_ERR(data->uart_clk);
> 

