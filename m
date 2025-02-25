Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED69EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLCzImq1hJawjaZFIBCHuGmG+bGHJyK4C7PGyPkYuQo=; b=v1jNGIUd+rBKu3Y+fq3rtc6e3e
	JB8nBO//ahdJ4guB0DWD71yJ+r/qzT+7ZJ1n4rjQ+/GY/CMQpaGsU51n0bErLI2lXkNp5qkOVRgao
	XW4l+HoovCxHeXMrxyo28zWynd/456snLp1jzt6ohsffC4zTJGkJfdx5p8S84Wvz2AbFxubbvoNGM
	GImRBqQLVjho3QmMsQsnXh64pKxIztF8mBOkZ2DNvUw7OtU/xoIx1YGsArw58HnYzKfufJeohCSY8
	I18IwnMo+Ra6PS871abFc7Y9G13NzT10DaoHgEejZGceOP3EwiRwQPnHCUGAjMnO2Rj5njpkSm83h
	OKZv0n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuFx-0000000HEzX-3qrt;
	Tue, 25 Feb 2025 12:41:49 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtdv-0000000H88o-3DeA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:02:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 692D16126B;
	Tue, 25 Feb 2025 12:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F7DC4CEDD;
	Tue, 25 Feb 2025 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484950;
	bh=R/cOn0v6QuOZo+xg2JB81n4XEbmiI+jQBlxb5k5MOhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLchVBJ6qU4UVRV6lO0rj81zD64IBrcFV9hUCD26oKNlj8cVUHLFzrrh650n/hUyW
	 RbCcgSSiKYp6/fkoFFl/k+7cymdhXiVhYHpdwQzRAfdp2WWlRZwipEMnklw2Da2rs0
	 yrNzkuef8f+gsJvQKmNaWlMgEFljgGCfrqSlu+QHTyh/bvk5eHR4RHhf4AKotnGhZV
	 aXvWD4VoSD+xyArJSBO08WLi4Fd9wPs6rGXeTno5OuahP9dDxGAgzdd0NXtMDqOSBN
	 GpffOR5JOQJuQZMOYEMPKofZG9xb3fpfSZSTvYfqLRsEH5pibqqPwvdlSwPeA/anSE
	 9WyRKty0cPwUA==
Date: Tue, 25 Feb 2025 13:02:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 6/8] counter: stm32-lptimer-cnt: add support for stm32mp25
Message-ID: <20250225-pelican-of-pleasurable-might-e9a7e8@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-7-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-7-fabrice.gasnier@foss.st.com>
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

On Mon, Feb 24, 2025 at 07:01:48PM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant, even if no major change is expected on the counter
> driver.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/counter/stm32-lptimer-cnt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index b249c8647639..a5dce017c37b 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -508,6 +508,7 @@ static SIMPLE_DEV_PM_OPS(stm32_lptim_cnt_pm_ops, stm32_lptim_cnt_suspend,
>  
>  static const struct of_device_id stm32_lptim_cnt_of_match[] = {
>  	{ .compatible = "st,stm32-lptimer-counter", },
> +	{ .compatible = "st,stm32mp25-lptimer-counter", },

So fully compatible? Why this change then?

Best regards,
Krzysztof


