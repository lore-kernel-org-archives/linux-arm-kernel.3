Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB0EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gN9j8IWdr/SYE/d3Avtp8AdFxeIwpiKz5SDihtLLAM0=; b=FP+YWolNIJs+A040SLKcT81FJY
	5fWkmufBcurRHd8VnD2EiWXI5ruEI5ikWhkIttxJ7EZb/gTNi89a+TE+M0uZUse4ByWNR7GBs8zjU
	RJuDbU36BYfxKke5L3n7U9zJwy7bUwAW8O0bXyaoBJgmCWSk5yKOB2um0zPEQoukadAZ4ATIQ0VNi
	NmDvKvHe7nnElkNkEjRkAdq35eglHDbuj8OUHmYRF7f+3DSMUejzONa3hZWslOa+sKEvbwMmpElB/
	4O4XN2468Fe6qZTkdn/7K6WToAIYWxoPuowQmNOm6w6AujyILvrpDlQ+AzAt9gXLbIl4YZd5gWZle
	k9LP/nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLra-00000009otj-2jmT;
	Thu, 30 Jul 2026 08:11:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLrZ-00000009otM-2xyi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D8FC600B1;
	Thu, 30 Jul 2026 08:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A401F000E9;
	Thu, 30 Jul 2026 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399092;
	bh=gN9j8IWdr/SYE/d3Avtp8AdFxeIwpiKz5SDihtLLAM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BsYVOZ/67qQbI6QKDC+hPmUtZcXQuauzsBmkdDFYlqLb7vCKYOVxrZuTUgLuiabJK
	 PKPTCkfe3h7I2qe40fki/Ag2Wwh8RBx5pq+WNJ8QhHkkJ4CNQCSaM3jg/Mx7EzSIcX
	 pFCSzhVlZQPyFO/Mg+GacXkKyIiwCROinNKtS841uqoCiNCl36hPKrXse65hy6oicj
	 p+fqu/8cBSjdyUWnohOLamtEJu4WOdh4Dg3/4ueWoU/Jo/yQFpiEBdU9olgtSshego
	 5DtPfRC9F3i2qKOhJrv3U8BLZSNYzqV3jUu108ODWchElZa+bM6ret8EiTOeh3eZLO
	 4MPiN/rgHHmyA==
Message-ID: <0e5628ae-886a-4a8e-8a35-6402737ad65a@kernel.org>
Date: Thu, 30 Jul 2026 10:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: Herve Codina <herve.codina@bootlin.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Paul Louvel <paul.louvel@bootlin.com>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
 <20260729172156.4371a8bc@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260729172156.4371a8bc@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Hervé,

Le 29/07/2026 à 17:21, Herve Codina a écrit :
> Hi Christophe,
> 
> On Wed, 29 Jul 2026 16:10:36 +0200
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
>> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
>> proper platform driver") qe_add_gpiochips() was walking the device
>> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
>>
>> After that commit the discovery is handled by the platform core,
>> therefore it is necessary to call of_platform_default_populate() on
>> the par_io node.
>>
>> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
>> index a5e2d0e5ab51..02ca556c8db0 100644
>> --- a/drivers/soc/fsl/qe/qe_io.c
>> +++ b/drivers/soc/fsl/qe/qe_io.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/errno.h>
>>   #include <linux/module.h>
>>   #include <linux/ioport.h>
>> +#include <linux/of_platform.h>
>>   
>>   #include <asm/io.h>
>>   #include <soc/fsl/qe/qe.h>
>> @@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(par_io_of_config);
>> +
>> +static int __init par_io_populate(void)
>> +{
>> +	struct device_node *np = of_find_node_by_name(NULL, "par_io");
>> +
>> +	if (!np)
>> +		return 0;
>> +
>> +	of_platform_default_populate(np, NULL, NULL);
>> +	of_node_put(np);
>> +
>> +	return 0;
>> +}
>> +arch_initcall(par_io_populate);
> 
> 
> The par_io node is a sub-node of the soc@xxx node.
> The soc@xxx node is simple-bus compatible. This child node should be
> populated.
> 
> Why do we need this additional of_platform_default_populate?
> 
> Also par_io node has a compatible. Maybe the related driver should call
> of_platform_populate() to populate children of par_io if needed. If this
> driver is missing, maybe it should be created.
> 
> Do I miss something?

As discussed together off-line, at the time being the par_io driver is 
not a platform driver. par_io_init() is called from setup_arch() by some 
board setups.

In order to fix the regression, I keep it minimal with an 
arch_initcall() function which is equivalent to what we had before 
changing this driver to a platform driver. It will also ease applying 
the fix to stable without too much churn.

It will still be possible to rework par_io driver in a follow-up patch 
and change it to a propoer platform driver.

Christophe


