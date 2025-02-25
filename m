Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF37C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJqMmHUqkMQRv1pCUQ/NkaJOdNNvIgd99Y68EjXn1jI=; b=3jSD5BAcSGpy7RerF7sl4fLrel
	I2gpgSnRAwmBKP6bsT1VRFFaVo8yHY9GVZF29wMDM1NjUV2I+HZBq4NxUnugKz+1P9BnAkuO1YH3N
	3gBPwjuhHH/ANFtvQm83m+kDL60M/cZslirSAXG4cDFqOIkppSNmV2IJoCUznq0JTx360WpV5oVYu
	MaJOljkkOxDKtsn4oq4egAUXcLuK8HTzxCQBwKroumfx6s9/f4/nBmhpVCOGki0Xi3RlIprGGlson
	MDDI8/qFxehFa9nZgdI1AYRsunNnHuvZLHr+7fMZH15mszCtjHzVmpkKRUMKIr0c++XPq87Lzqtaj
	MB1RmJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuHT-0000000HFBi-2MqW;
	Tue, 25 Feb 2025 12:43:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmteF-0000000H8Ft-3b8G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A0C95C0DB1;
	Tue, 25 Feb 2025 12:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59010C4CEDD;
	Tue, 25 Feb 2025 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484971;
	bh=5u7h0X12oKtvzpOzqx7CcREHMSTIyV6i4dduMgVCWvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ7r2+KtuJ3s25tsKTKD4y4Q8/vruepuHAt4+eVPb1PzmCX+NBcjxDUliictUO29V
	 3Onn/6qF2ZoaT0/fNmUiyGfz1KZFKg6gdLnT65gT5bXKfjgrD9DlMn14UAzM0USD4R
	 DHx2Ji4oYzbv9IHsEjgw8UFdjsLOCc/JQBN9judAOkDnwPE0ajl6jcDtcRHXmd0jjT
	 utTWIU9YZVLF1YLCPRncQ64YAZ6xb6LgG8vIjfFFxiA6UvTTJNHysNFk/GYYmCKpbS
	 /uoMPnrQQoqISJqqGjS/y8BTaI+m1p9rQ8QHyczw1GPk4oML1Va9sJDpISunAtyZR2
	 rWz+mOISKk/pg==
Date: Tue, 25 Feb 2025 13:02:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 4/8] clocksource: stm32-lptimer: add stm32mp25 support
Message-ID: <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_040251_938740_E642A67D 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, Feb 24, 2025 at 07:01:46PM +0100, Fabrice Gasnier wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add the support of the new compatible for STM32MP25 SoC in driver, as
> described in Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> and used in arch/arm64/boot/dts/st/stm32mp251.dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index a4c95161cb22..db055348e2cc 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -197,6 +197,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id stm32_clkevent_lp_of_match[] = {
>  	{ .compatible = "st,stm32-lptimer-timer", },
> +	{ .compatible = "st,stm32mp25-lptimer-timer", },
>  	{},

Same question.

Best regards,
Krzysztof


