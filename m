Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6066AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1Q2krD33D/xJ2Bbailu1ILltQilguaJgFopg5WdCMk=; b=MDa0vZ+gUcxBpYrFdHwZBGXhCA
	KF/gfC5SZ3nRWm5ar59kbwdslsQfVSnf25j+VF1mnVp0qIf9EAupdgiLtb2PXl/MMQiyxK+TpayIr
	3ayR14S2dxULs4HNsTtiJJKpUFpfMw/BX0WFR7CGHs8vUrXzwGTLElcRpZxgTHMYdseGXAw9vbZ1U
	KDuwiuhOKTu5JeWIb2tv2cXfdTaGspf6EFgANsaGSqdxizU7K3N0SXsvTByhg+74QQb048TS9Whym
	x2+yCm5CqxoQ+y74yI+Q5Q3W/K9KCG78XvJRDZvPifZXbw3lr2PfZws58lQTHoj0Kq8wpRCXLIVwd
	6OCEbPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC3a-000000001Ec-1Lfp;
	Mon, 31 Mar 2025 10:07:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0e-000000000Ru-0p0b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C252A43087;
	Mon, 31 Mar 2025 09:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED166C4CEEB;
	Mon, 31 Mar 2025 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743415487;
	bh=WtzLinbXy3Fwr2WfhYAFy3MIbifKzfAyDAq6yh8KZdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Olha6VKyprn8Do63e/IQcMQFClU+a0DaReCkz9AyuzufuKRxPX/XlV0R23urfP6ji
	 Pianwfz0YKZZU+KTYJVu5kOsN9SigaIdrZ5Bbuz3aEZeDzlMXUVYOLQsN830Ix9lID
	 gEUVA6Be8aoSc4lANtxO2GHEExT9rv8XQklTka5d2N5b+S+tFyOnVVeiCadpC8YyzQ
	 S7nRhp3HgJh05BOoKlM5tTw7VeTlB287biI7sRrX08HbTp5SjQqc54hwuxGshgvzlm
	 Kkr8HFivsF8XVLd4gzSjnKyeJppAW+JgBnvjmyX7+V1w0sxVPDXGuSGCI1My1Qslwg
	 5UWTxxVwJKoLw==
Date: Mon, 31 Mar 2025 11:04:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <daniel.lezcano@linaro.org>,
 <tglx@linutronix.de>, <robh@kernel.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <devicetree@vger.kernel.org>, <wbg@kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v4 3/8] iio: trigger: stm32-lptimer: add support for
 stm32mp25
Message-ID: <20250331110435.26157ebe@jic23-huawei>
In-Reply-To: <30d13179-66fc-4856-ac70-af051ec5fe8f@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
	<20250314171451.3497789-4-fabrice.gasnier@foss.st.com>
	<20250315125615.065a2e74@jic23-huawei>
	<30d13179-66fc-4856-ac70-af051ec5fe8f@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_030448_409605_85185428 
X-CRM114-Status: GOOD (  34.85  )
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

On Thu, 27 Mar 2025 17:36:00 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 3/15/25 13:56, Jonathan Cameron wrote:
> > On Fri, 14 Mar 2025 18:14:46 +0100
> > Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> >   
> >> From: Olivier Moysan <olivier.moysan@foss.st.com>
> >>
> >> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> >> this new HW variant. Add new trigger definitions that can be used by the
> >> stm32 analog-to-digital converter. Use compatible data to identify them.
> >>
> >> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
> > 
> > How do you want this to merge?   If it's going through mfd because
> > of dependencies, then
> > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > I haven't checked if there are any dependencies so shout if I should
> > pick this up directly for next cycle.  
> 
> Hi Jonathan, Lee,
> 
> There's no build dependency, but the dt-bindings that adds the
> compatible string.
> 
> Perhaps Lee can pick it up along with the mfd bindings and driver ?
> 
> I'm not sure what the most suitable option is.
We don't normally worry if bindings and driver end up going through different
trees.  Applied this patch to the testing branch of iio.git. I'll rebase
on rc1 once available and push out as normal togreg branch.

Thanks,

Jonathan
> 
> Best Regards,
> Fabrice
> > 
> > Thanks,
> > 
> > Jonathan
> > 
> >   
> >> ---
> >> Changes in v4:
> >> - Jonathan's comment: simplify infrastructure by keeping
> >>   devm_iio_trigger_register. Don't need to cast compatible data.
> >> ---
> >>  drivers/iio/trigger/stm32-lptimer-trigger.c   | 75 ++++++++++++++-----
> >>  include/linux/iio/timer/stm32-lptim-trigger.h |  9 +++
> >>  2 files changed, 67 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> index f1e18913236a..3dcc8d2fe093 100644
> >> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> @@ -16,16 +16,43 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/property.h>
> >>  
> >> -/* List Low-Power Timer triggers */
> >> -static const char * const stm32_lptim_triggers[] = {
> >> -	LPTIM1_OUT,
> >> -	LPTIM2_OUT,
> >> -	LPTIM3_OUT,
> >> +/* Maximum triggers + one trailing null entry to indicate the end of array */
> >> +#define MAX_TRIGGERS 3
> >> +
> >> +struct stm32_lptim_cfg {
> >> +	const char * const (*triggers)[MAX_TRIGGERS];
> >> +	unsigned int nb_triggers;
> >> +};
> >> +
> >> +/* List Low-Power Timer triggers for H7, MP13, MP15 */
> >> +static const char * const stm32_lptim_triggers[][MAX_TRIGGERS] = {
> >> +	{ LPTIM1_OUT,},
> >> +	{ LPTIM2_OUT,},
> >> +	{ LPTIM3_OUT,},
> >> +};
> >> +
> >> +/* List Low-Power Timer triggers for STM32MP25 */
> >> +static const char * const stm32mp25_lptim_triggers[][MAX_TRIGGERS] = {
> >> +	{ LPTIM1_CH1, LPTIM1_CH2, },
> >> +	{ LPTIM2_CH1, LPTIM2_CH2, },
> >> +	{ LPTIM3_CH1,},
> >> +	{ LPTIM4_CH1,},
> >> +	{ LPTIM5_OUT,},
> >> +};
> >> +
> >> +static const struct stm32_lptim_cfg stm32mp15_lptim_cfg = {
> >> +	.triggers = stm32_lptim_triggers,
> >> +	.nb_triggers = ARRAY_SIZE(stm32_lptim_triggers),
> >> +};
> >> +
> >> +static const struct stm32_lptim_cfg stm32mp25_lptim_cfg = {
> >> +	.triggers = stm32mp25_lptim_triggers,
> >> +	.nb_triggers = ARRAY_SIZE(stm32mp25_lptim_triggers),
> >>  };
> >>  
> >>  struct stm32_lptim_trigger {
> >>  	struct device *dev;
> >> -	const char *trg;
> >> +	const char * const *triggers;
> >>  };
> >>  
> >>  static int stm32_lptim_validate_device(struct iio_trigger *trig,
> >> @@ -56,22 +83,33 @@ EXPORT_SYMBOL(is_stm32_lptim_trigger);
> >>  
> >>  static int stm32_lptim_setup_trig(struct stm32_lptim_trigger *priv)
> >>  {
> >> -	struct iio_trigger *trig;
> >> +	const char * const *cur = priv->triggers;
> >> +	int ret;
> >>  
> >> -	trig = devm_iio_trigger_alloc(priv->dev, "%s", priv->trg);
> >> -	if  (!trig)
> >> -		return -ENOMEM;
> >> +	while (cur && *cur) {
> >> +		struct iio_trigger *trig;
> >>  
> >> -	trig->dev.parent = priv->dev->parent;
> >> -	trig->ops = &stm32_lptim_trigger_ops;
> >> -	iio_trigger_set_drvdata(trig, priv);
> >> +		trig = devm_iio_trigger_alloc(priv->dev, "%s", *cur);
> >> +		if  (!trig)
> >> +			return -ENOMEM;
> >>  
> >> -	return devm_iio_trigger_register(priv->dev, trig);
> >> +		trig->dev.parent = priv->dev->parent;
> >> +		trig->ops = &stm32_lptim_trigger_ops;
> >> +		iio_trigger_set_drvdata(trig, priv);
> >> +
> >> +		ret = devm_iio_trigger_register(priv->dev, trig);
> >> +		if (ret)
> >> +			return ret;
> >> +		cur++;
> >> +	}
> >> +
> >> +	return 0;
> >>  }
> >>  
> >>  static int stm32_lptim_trigger_probe(struct platform_device *pdev)
> >>  {
> >>  	struct stm32_lptim_trigger *priv;
> >> +	struct stm32_lptim_cfg const *lptim_cfg;
> >>  	u32 index;
> >>  
> >>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >> @@ -81,17 +119,20 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
> >>  	if (device_property_read_u32(&pdev->dev, "reg", &index))
> >>  		return -EINVAL;
> >>  
> >> -	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
> >> +	lptim_cfg = device_get_match_data(&pdev->dev);
> >> +
> >> +	if (index >= lptim_cfg->nb_triggers)
> >>  		return -EINVAL;
> >>  
> >>  	priv->dev = &pdev->dev;
> >> -	priv->trg = stm32_lptim_triggers[index];
> >> +	priv->triggers = lptim_cfg->triggers[index];
> >>  
> >>  	return stm32_lptim_setup_trig(priv);
> >>  }
> >>  
> >>  static const struct of_device_id stm32_lptim_trig_of_match[] = {
> >> -	{ .compatible = "st,stm32-lptimer-trigger", },
> >> +	{ .compatible = "st,stm32-lptimer-trigger", .data = &stm32mp15_lptim_cfg },
> >> +	{ .compatible = "st,stm32mp25-lptimer-trigger", .data = &stm32mp25_lptim_cfg},
> >>  	{},
> >>  };
> >>  MODULE_DEVICE_TABLE(of, stm32_lptim_trig_of_match);
> >> diff --git a/include/linux/iio/timer/stm32-lptim-trigger.h b/include/linux/iio/timer/stm32-lptim-trigger.h
> >> index a34dcf6a6001..ce3cf0addb2e 100644
> >> --- a/include/linux/iio/timer/stm32-lptim-trigger.h
> >> +++ b/include/linux/iio/timer/stm32-lptim-trigger.h
> >> @@ -14,6 +14,15 @@
> >>  #define LPTIM1_OUT	"lptim1_out"
> >>  #define LPTIM2_OUT	"lptim2_out"
> >>  #define LPTIM3_OUT	"lptim3_out"
> >> +#define LPTIM4_OUT	"lptim4_out"
> >> +#define LPTIM5_OUT	"lptim5_out"
> >> +
> >> +#define LPTIM1_CH1	"lptim1_ch1"
> >> +#define LPTIM1_CH2	"lptim1_ch2"
> >> +#define LPTIM2_CH1	"lptim2_ch1"
> >> +#define LPTIM2_CH2	"lptim2_ch2"
> >> +#define LPTIM3_CH1	"lptim3_ch1"
> >> +#define LPTIM4_CH1	"lptim4_ch1"
> >>  
> >>  #if IS_REACHABLE(CONFIG_IIO_STM32_LPTIMER_TRIGGER)
> >>  bool is_stm32_lptim_trigger(struct iio_trigger *trig);  
> >   


