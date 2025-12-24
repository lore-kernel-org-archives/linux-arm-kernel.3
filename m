Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE8E776C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb1GWSMtwiCjjrRom1gCzEi9SBcGoDJFeRiB5e+S/SU=; b=NarqH+S+HWCROuAz+FAnzwbTBp
	LcppoaiWdwe4Gba0r4xb+bpL+vo50x+sUiPHsAzn/U5LeK02zlTlER4SubDPBwoKlEiErI6FgQTGC
	4Yg/6Jk0ao1F+1ky8i66SkU/EJidw2r7c25oSWoaC+t6upLQqNg2gqcok4DWWJTWu5D6q3AMy9wZl
	DWz4gnde7Xb+b5fr1Ss+UpD5GQJWT7u3WF/IMEA8err2TsrZrPq6kwLl6nGPtZGr63xKfP1RdWshs
	tbNKEJ8fdUtG+KJ4/p/KBrlZdoy8tOOcV7rIRRWGxhwFRr0p5N4xu2zuTHx1Czljc+0HxRfP/ncTx
	sNlJEj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRkH-0000000HEeh-3giT;
	Wed, 24 Dec 2025 16:29:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRkF-0000000HEeH-26qc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766593791; x=1798129791;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xnT+EvR0s5oIZp/3XXt4XA68h5snb9BsA7e9vL/N/vM=;
  b=Z7kFoHbqZ/o++SBytKaCVcxrDegJvl06VVeST0O9NHaQlYMgjMJ6faCd
   3ikEn1qt3+pxX2oaWogQrLvv50LtIdhxjwE6TaSCQU3lAOWECXiWDZZ5v
   1k5bg1UULjma1U4CDdgAZOOXvMvVFB4GvfY+42VRKD4AL//Ue+4Pwjp0b
   FzuReVbcTnK/rP9MBcVLkcfShGXQTd8Qc/pY9IG14vDFzVnC0mfOf2C8J
   XmQQhUbLv41CNnx+CXRWFEpxtgkySiMiaW0Wl11UQvamA8kvQjW0eDuln
   UGI2V9omZd0wUTPGRR4ciQrmldiGN/eKzgwzQ9MdjiAEk02EA4lZeDPEQ
   A==;
X-CSE-ConnectionGUID: 1mpAtqqvTWKDWP3ouM+OuA==
X-CSE-MsgGUID: bJulCPQ/SGmZ0iD/Mn03NA==
X-IronPort-AV: E=Sophos;i="6.21,174,1763449200"; 
   d="scan'208";a="51495333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Dec 2025 09:29:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 24 Dec 2025 09:29:25 -0700
Received: from [10.171.248.28] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Dec 2025 09:29:20 -0700
Message-ID: <9faff0a3-0f3d-4e51-ab5b-0cf0204ee4fd@microchip.com>
Date: Wed, 24 Dec 2025 17:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aubin Constans
	<aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Robert Richter <rric@kernel.org>, Paul Cercueil
	<paul@crapouillou.net>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <llvm@lists.linux.dev>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_082951_818745_3EA60FA4 
X-CRM114-Status: GOOD (  17.14  )
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

On 24/12/2025 at 13:44, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

> ---
>   drivers/mmc/host/atmel-mci.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index fdf6926ea468..3b4928f5b9b2 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
>   {
>          struct device *dev = host->dev;
>          struct device_node *np = dev->of_node;
> -       struct device_node *cnp;
>          u32 slot_id;
>          int err;
> 
>          if (!np)
>                  return dev_err_probe(dev, -EINVAL, "device node not found\n");
> 
> -       for_each_child_of_node(np, cnp) {
> +       for_each_child_of_node_scoped(np, cnp) {
>                  if (of_property_read_u32(cnp, "reg", &slot_id)) {
>                          dev_warn(dev, "reg property is missing for %pOF\n", cnp);
>                          continue;
> @@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
>                  if (slot_id >= ATMCI_MAX_NR_SLOTS) {
>                          dev_warn(dev, "can't have more than %d slots\n",
>                                   ATMCI_MAX_NR_SLOTS);
> -                       of_node_put(cnp);
>                          break;
>                  }
> 
> @@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "cd", GPIOD_IN, "cd-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].detect_pin = NULL;
>                  }
> 
> @@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "wp", GPIOD_IN, "wp-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].wp_pin = NULL;
>                  }
>          }
> --
> 2.51.0
> 


