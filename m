Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8471FCD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPJXY6MK8upP/7k84ppdgI2s97aifSlJ0IZtcxsC/Iw=; b=VCYyNVqFXf8sabN+4qWbQRBPLB
	kA1HjeQ+WFMfdNEvav3O3KgQdBSJ+eADF9OjUMg4GQue3tksuHLkzJBeXZaXLEVpMt/REIu1xX77S
	++3eeSVkioe4duVsgmbHeZUhDSR+DyLuCE7LI2f0J57atWYBXTCeK/XLb9fdFutPGKt/rthWyGx+W
	2gnfXKYLQ5eLhm7zlaDubdZQFuMCPCvBBbvqeId5SIa2wQKYjYRQq2de94ETl64Qts79wNlpm+eC7
	nuA8+1q4LbTCGcbK8E5BdqM11MENYBH3iOg/9flu2JDMmci0vwEK3f81NPrB8AtbSI24XTlg1p5hn
	Tmtyc7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhH4-0000000BJtk-1jG5;
	Fri, 14 Nov 2025 00:02:46 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhH1-0000000BJtK-3zQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078562; bh=G9nAx/Rk8pmPIrDjulmm2k9R3JaqyIyaAjsqrCV33DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWfSqg4ohJGX3QJqM8i9cxILXT4uUcIlZZoLkAZ2NTZnDQfsYRl8euFxDksbVAGh3
	 zbVvZNlRE9LCxuCmGNjDPRYrwxtAHBzbCHUsADWd1+C5hjgHR/MuMIciyITXIukFrz
	 2dKDE9y3C9o5LHl5r/nkCTD7MaaznxQrMYsEA3VpA7L4r0sEuxlWqbZ/GyCqTjIk+j
	 X7vguylJTgB0HkEJDQ7LQq2UL0ZXzu+GQYWAcaxMJl74q9oy9hY2PiYR3iaS05p9tn
	 JB9I2//PFN1MI4y/AqAuB2TE4cjDpMq+Lo8ry1TxLmpn65uuEx8BIJiesZ35L+AKHN
	 9EagZmiyYgJUw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C94A3E1239;
	Fri, 14 Nov 2025 00:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078562; bh=G9nAx/Rk8pmPIrDjulmm2k9R3JaqyIyaAjsqrCV33DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWfSqg4ohJGX3QJqM8i9cxILXT4uUcIlZZoLkAZ2NTZnDQfsYRl8euFxDksbVAGh3
	 zbVvZNlRE9LCxuCmGNjDPRYrwxtAHBzbCHUsADWd1+C5hjgHR/MuMIciyITXIukFrz
	 2dKDE9y3C9o5LHl5r/nkCTD7MaaznxQrMYsEA3VpA7L4r0sEuxlWqbZ/GyCqTjIk+j
	 X7vguylJTgB0HkEJDQ7LQq2UL0ZXzu+GQYWAcaxMJl74q9oy9hY2PiYR3iaS05p9tn
	 JB9I2//PFN1MI4y/AqAuB2TE4cjDpMq+Lo8ry1TxLmpn65uuEx8BIJiesZ35L+AKHN
	 9EagZmiyYgJUw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id AB7ED3E0CE9;
	Fri, 14 Nov 2025 00:02:41 +0000 (UTC)
Message-ID: <b4d8a2e9-46ab-460a-ba56-ff8def8e36d4@mleia.com>
Date: Fri, 14 Nov 2025 02:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: dts: lpc3250-ea3250: add key- prefix for
 gpio-keys
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
 <20251029202801.3963952-3-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_000242_264499_762AF9D8 
X-CRM114-Status: GOOD (  12.37  )
/bin/ln: failed to access 'reaver_cache/texts/20251114_000242_264499_762AF9D8': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_000242_264499_762AF9D8 
X-CRM114-Status: GOOD (  14.85  )
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

On 10/29/25 22:27, Frank Li wrote:
> Add key- prefix to fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: gpio-keys (gpio-keys): 'joy0', ... do not match any of the regexes: '^(button|...)$', 'pinctrl-[0-9]+
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> index 63c6f17bb7c9f..837a3cfa8e7c8 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> @@ -27,55 +27,55 @@ button {
>   			gpios = <&gpio 4 1 0>; /* GPI_P3 1 */
>   		};
>   
> -		key1 {
> +		key-1 {
>   			label = "KEY1";
>   			linux,code = <1>;
>   			gpios = <&pca9532 0 0>;
>   		};
>   
> -		key2 {
> +		key-2 {
>   			label = "KEY2";
>   			linux,code = <2>;
>   			gpios = <&pca9532 1 0>;
>   		};
>   
> -		key3 {
> +		key-3 {
>   			label = "KEY3";
>   			linux,code = <3>;
>   			gpios = <&pca9532 2 0>;
>   		};
>   
> -		key4 {
> +		key-4 {
>   			label = "KEY4";
>   			linux,code = <4>;
>   			gpios = <&pca9532 3 0>;
>   		};
>   
> -		joy0 {
> +		key-joy0 {
>   			label = "Joystick Key 0";
>   			linux,code = <10>;
>   			gpios = <&gpio 2 0 0>; /* P2.0 */
>   		};
>   
> -		joy1 {
> +		key-joy1 {
>   			label = "Joystick Key 1";
>   			linux,code = <11>;
>   			gpios = <&gpio 2 1 0>; /* P2.1 */
>   		};
>   
> -		joy2 {
> +		key-joy2 {
>   			label = "Joystick Key 2";
>   			linux,code = <12>;
>   			gpios = <&gpio 2 2 0>; /* P2.2 */
>   		};
>   
> -		joy3 {
> +		key-joy3 {
>   			label = "Joystick Key 3";
>   			linux,code = <13>;
>   			gpios = <&gpio 2 3 0>; /* P2.3 */
>   		};
>   
> -		joy4 {
> +		key-joy4 {
>   			label = "Joystick Key 4";
>   			linux,code = <14>;
>   			gpios = <&gpio 2 4 0>; /* P2.4 */

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the contributions, I hope I'll find time tomorrow
to send a tiny pull request:
* lpc43xx board compatible strings,
* this change,
* any other your changes with my review comments satisfied, if I get them.

-- 
Best wishes,
Vladimir

