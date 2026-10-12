Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA116CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqiyZVjkntXe8Srgp8B776IbtfRgPC2Bu3z/Zlg+Hq0=; b=shCnGhe0zH6V4EQkfK5OdTxuaI
	SBI90Gq7K65bjReRHUMN9hC7vJQNnbVk7UADFSt1dmuyJe1yRfNn8VGartc0P6NqnZqep9xZekqXS
	GA9HsTDVj8NkYEcB9U3YBgq+9ytgh/AuNa4LT3wefwAxukB1bfZglflZ9JLc+ptvHqhtAAnIR04G4
	hptBc9vEdx8hdnDTcldmOoZqU5r327gBcUzBtlQTKG40eeGtb2uJ3C+rYMQ6K27ce3YMLrnXnTogH
	h2cpXceWetdlsGWFDhjUDcSSxM5YbM4i+ozv9meA3YVwANKPNpoDM10CARAZ8NpLqKHYY23NLq3Jf
	Sa9FDA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBaI-00000009xdd-34JH;
	Mon, 12 Oct 2026 08:40:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBaF-00000009xcZ-2WH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:40:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9EE1650;
	Mon, 12 Oct 2026 01:40:25 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B41EA3F66F;
	Mon, 12 Oct 2026 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791794429; bh=3acPOqONrLSgFKsfMg1vrNwvcicAeebuv1jTEDu2lI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QeBL8p1nmOxulVfYhZsdUz35b2f/XQND/DCDMC+Bx6ksy5y5X8n8d7OHCkX5tYh7U
	 WKJP0q1BR+BZUlFPNboMC41r+nBKjwd2UjbDBx0GFAEswa7PGDy9/lhufIuApyGTnn
	 wpsufSLGQhNPEmR1IUFb+1S8CDoUsbU0s5hCd4eI=
Message-ID: <803c1787-999e-4239-bccd-b89e7a066961@arm.com>
Date: Mon, 12 Oct 2026 10:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261007060107.62221-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261007060107.62221-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014036_232217_F029F677 
X-CRM114-Status: GOOD (  15.49  )
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

Hi,

On 10/7/26 08:01, Pablo Mazzini wrote:
> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Reset it first.

Yes, thanks, this is what I had in mind. And I think it deserves some 
backports:

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> v2: reset npins instead of counting into a local (Andre)
> 
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..8bcd566593ae 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>   	 * Find the total number of pins.
>   	 * Also work out how much memory we need to store all the pin names.
>   	 */
> +	desc->npins = 0;
>   	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
>   		desc->npins += pins_per_bank[i];
>   		if (pins_per_bank[i] < 10) {


