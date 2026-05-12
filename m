Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD3CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppxq1CB1YXPO13jk9q1N7wyv/emP23uUqTwoj85xIew=; b=FDezhmuSU85hlf+lpLpLjcIAIs
	TYsiLv6oiFCtw0Rb6O99VSO3DDZ2LWLu6LGsaagnMotWwLhavcj6Trs/xOnIVs54nH4b+zhWatNQj
	BR0QYxX9+fCzsVegQBMJyWKZ0zIghRe3zRr1tiYdZWniqqMMlVF9OFan8+Pv7diO6pnTjYaWlz8BD
	BffGrg3fDIFu5oKvgELRgKrsyiZDymSWc6fdqzUsXzHwD1tCNqVVJneTn+aLozNlnWjGZZsOJamad
	uPsl4qvU2g8imcRAZlrq1R+Qpad8Mm6I/1KOJyZO7j2Z8iK5XuHuLhzVNQYC6K/5+X+3l6e2MhL/y
	a7xhcafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBD-0000000FrX6-0Tic;
	Tue, 12 May 2026 07:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBA-0000000FrWb-2RCk;
	Tue, 12 May 2026 07:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DE9844046;
	Tue, 12 May 2026 07:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DEAC2BCB0;
	Tue, 12 May 2026 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778569519;
	bh=CbKrYA7cN/wwbpVWPG+J7VYnuHQ+Y1RlkMJzpdzjJ2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tpq9cN3mXo3Rye52s4rApyI+1AFdgTwxtPdB/HYT1MCFvp9a7Jbr14L1eZLUokRl/
	 wCrOlSQWkhqywVOEc9gAmR+PCPDUBQrlCrKoxV8b8cMHGNd0ebuYkQXVHk9PzFW925
	 LF83+eoZKBvwxDoe396PpM1cvF5nuuhqtF/TCtPyRFrWe+NnQP5XifdUPQYsTP1knp
	 mzMXLvEMem5OE0L7yyrk0iwks0k/jEDEU6P4ZMymGGG2FJo1w5kPJ6/3m80TnI3wyZ
	 bpgWWyAyvJXsgIp5NSowbSc3tsxBnvzb9lzAZBfAZamK5+a2wBbHfkSVuBAqtcQLOV
	 HT3Iu/3zoO52g==
Message-ID: <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Date: Tue, 12 May 2026 10:05:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-2-18255117159@163.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260511055923.37117-2-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000520_665648_F627D8CD 
X-CRM114-Status: GOOD (  23.07  )
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

Hi, Hans,

On 5/11/26 08:59, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Introduce a static inline helper pci_host_common_link_train_delay() that
> checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
> calls msleep(100) only when the speed is greater than 5.0 GT/s.
> 
> This allows multiple host controller drivers to share the same mandatory
> delay without duplicating the logic.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb..d709f7e3e11a 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -10,6 +10,9 @@
>   #ifndef _PCI_HOST_COMMON_H
>   #define _PCI_HOST_COMMON_H
>   
> +#include <linux/delay.h>
> +#include "../pci.h"
> +
>   struct pci_ecam_ops;
>   
>   int pci_host_common_probe(struct platform_device *pdev);
> @@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device *pdev);
>   
>   struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>   	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> +
> +/**
> + * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
> + *
> + * Must be called after Link training completes and before the first
> + * Configuration Request is sent.
> + */
> +static inline void pci_host_common_link_train_delay(int max_link_speed)
> +{
> +	if (max_link_speed > 2)
> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);

In case of RZ/G3S driver the max_link_speed is populated based on 
"max-link-speed" DT property (by calling of_pci_get_max_link_speed()). My 
understanding from [1] (and the review of the initial RZ/G3S driver support) is 
that this is not a mandatory property (note also the "Host drivers *could* add 
this" from [1]). At least for the RZ/G3S driver, in case the "max-link-speed" DT 
property is not present in DT but the controller supports more than 5GT/s (that 
is possible as the driver supports more controller variants), the max_link_speed 
argument will be negative. In that case the msleep() will not be called. This 
looks like an opposite of what the patch set is trying to achieve.

Also, if I'm not wrong, there is also the possibility of having the 
max-link-speed > 2 but the downstream port to not support more than 5GT/s. In 
that case the mspeep() would also be executed (but I think that wouldn't be 
really an issue).

Thank you,
Claudiu

[1] 
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml#L117

Thank you,
Claudiu


