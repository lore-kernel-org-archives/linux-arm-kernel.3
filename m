Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A058CDB462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khwed8QqQic+Mt/5XFoknvabbL7m4BPuoUjeMuesUbU=; b=BMlyqzZH77hdQnLgud8pJQ0+YJ
	ZexHRQoa/EEhaDrzFxzJrW0lutuDKigs53I4cEsLG87AFdKXZ5btHyUjStE7hHsu9GhTUBzPpNUlV
	Q5JpYBToF0ff4WzorHpj6hat6Da15exCJkSvmuQwoXU7oAW4iQTZULwBj3ctib10drmTMO7pbY/O3
	zpG4Y0fiyj2dg6pbHyNE0rAsjs0pokfvdXD+e+gKNIUUFyJ+qCC6zSI20XU6zajQ4lI/C9Gu0ljgh
	VFjCBOMPVeiklp8y8CQLOXPIkpPBUA+VltsaEpTmM3y8XVPIx6y+GaDdqMCQAs0UfJoOBwF/qVcFZ
	jCAxCsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJh2f-0000000BJF0-1KlC;
	Thu, 13 Nov 2025 23:47:53 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJh2c-0000000BJEk-3T9n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077669; bh=wfe3+QVKDuUk4kmXVMyxrndi9c6nSHlF9pQuYtQldts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dXFXFg1ITDq+gWdY+Yz7PEcVHCm2vqBDDA8DEizALg1VzbMGQF4KWzL6WnXEpmAW7
	 5PwbzWIMFKyKAQUUK/KNuV24lAqQxQ2puHq3ggwpSg0clnUDEkvpT+AiHBHo2uXi/A
	 jLUIsICZEEehV0EXR9pLjQvpJz/s1Rq84Npyhucdfh0FDoZ2CacjG5vOebEpXi6Fz6
	 8FoNKMggK84ftcbg5re9S4VXhYWI0L8snMumY/n2MtCF8l8O13X2KAp7uywRdYr/Un
	 ZOLbXKSGNDzg/r/EvY9WfV99x40qM+1pLB3KtqZ4Z5I57m/OTbjM+U6vhQ0EEHg+/O
	 iSBikoi62OC9Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 62D203E101C;
	Thu, 13 Nov 2025 23:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077669; bh=wfe3+QVKDuUk4kmXVMyxrndi9c6nSHlF9pQuYtQldts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dXFXFg1ITDq+gWdY+Yz7PEcVHCm2vqBDDA8DEizALg1VzbMGQF4KWzL6WnXEpmAW7
	 5PwbzWIMFKyKAQUUK/KNuV24lAqQxQ2puHq3ggwpSg0clnUDEkvpT+AiHBHo2uXi/A
	 jLUIsICZEEehV0EXR9pLjQvpJz/s1Rq84Npyhucdfh0FDoZ2CacjG5vOebEpXi6Fz6
	 8FoNKMggK84ftcbg5re9S4VXhYWI0L8snMumY/n2MtCF8l8O13X2KAp7uywRdYr/Un
	 ZOLbXKSGNDzg/r/EvY9WfV99x40qM+1pLB3KtqZ4Z5I57m/OTbjM+U6vhQ0EEHg+/O
	 iSBikoi62OC9Q==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id CE2003E0FFD;
	Thu, 13 Nov 2025 23:47:48 +0000 (UTC)
Message-ID: <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
Date: Fri, 14 Nov 2025 01:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-4-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_234749_422596_BDF43F74 
X-CRM114-Status: GOOD (  17.54  )
/bin/ln: failed to access 'reaver_cache/texts/20251113_234749_422596_BDF43F74': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_234749_422596_BDF43F74 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Frank.

On 10/29/25 22:28, Frank Li wrote:
> Add at25 required properties (size, address-width and pagesize), which
> duplicate deprecated properties.
> 
> Change nodename 'at25' to 'eeprom'.
> 
> Fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 21a6d0bca1e8a..15463a96938cc 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> @@ -200,7 +200,7 @@ &ssp0 {
>   	cs-gpios = <&gpio 3 5 0>;
>   	status = "okay";
>   
> -	eeprom: at25@0 {
> +	eeprom: eeprom@0 {
>   		compatible = "atmel,at25";
>   		reg = <0>;
>   		spi-max-frequency = <5000000>;
> @@ -216,6 +216,10 @@ eeprom: at25@0 {
>   		at25,byte-len = <0x8000>;
>   		at25,addr-mode = <2>;
>   		at25,page-size = <64>;
> +
> +		size = <0x8000>;
> +		address-width = <16>;
> +		pagesize = <64>;

Is there any need to have both sets of properties?

I'd suggest to remove the deprecated set in a separate patch, note
that your done change is not described in the commit message.

>   	};
>   };
>   

-- 
Best wishes,
Vladimir

