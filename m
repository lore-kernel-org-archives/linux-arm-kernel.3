Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494F5C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymHKN/BJa2+0pQ3DOlaBBtFOqaY7h/grwRM8s4BKdwc=; b=zgQBGtuWCbGYi46jwskZXlpGwo
	qSS5h3zokJDfaurPTMq0Dqzg7CX8m2b/fcFrhGib3iZUGZ4Cn6NIgEv+W5T9vcTr5k9cNXDoI/xoa
	zJRDxIbGtvxACGDf/x7TnfK+v97B5dQNJXWtWX6fSB4w44U+KFTmBh7+37uI2Pv7SZG+KkXHl0rAk
	CneviLqXC9VTtxki4NgCY9aRSMyUNQLlKNsq208SmL1M+OJKjNhKlvzpRoUvOe2IjbNK4zWr3yiN6
	VU6/2xc0KtRUDZ1IOh4eHEZ/V2+SouAuoZEWGzimisXI0eCTUuOBp6lMZqOWYbSHxhU7ZrzKM3WPf
	bMaflhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPeU-0000000ARPL-2nK4;
	Thu, 30 Jul 2026 12:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPeU-0000000ARPD-0coT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:14:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B28AE42B17;
	Thu, 30 Jul 2026 12:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7FB1F000E9;
	Thu, 30 Jul 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413657;
	bh=ymHKN/BJa2+0pQ3DOlaBBtFOqaY7h/grwRM8s4BKdwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QpWYFZtiv7xvBiD8yhhxjDR2I2Pxtdoj+NdAO8DyGiiTwd4gadDiR6vxblENSgQfX
	 uFyV8YPD4UFbBzs9ONRhUpq5rNQVbgT/Dism5miL278jpJrPywtD856VCMMhPTn19g
	 AK41e+OIieKxQsCeMpzobggMAUCCe2HEFu1MyAx5Eq0bSUizDgBYHiiR32/pMNkqCu
	 6Ev5KnnDPgr8KUS+AGhS767CbP9EHAZxhAB9qlB0gG4QRR3KWK7g8jpIWzNLRTE6/X
	 B5xvZbremozqKo3xssG6J4qhtATPnModw+eXSJ21hsjYV9K+0NEs5RMWOCPI4phGl1
	 /3Se2nMv/k9qg==
Message-ID: <59156118-27b2-453d-81b9-86a3d411a855@kernel.org>
Date: Thu, 30 Jul 2026 14:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Paul Louvel <paul.louvel@bootlin.com>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
 <e1bd8dcf-9b8e-4bc7-8ba8-6c06222e1659@kernel.org>
 <223afb76-9f6f-48a1-a5c5-beb1a641916c@kernel.org>
 <f1b4c866-6cd7-4d6f-812b-d95e94f69e83@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <f1b4c866-6cd7-4d6f-812b-d95e94f69e83@kernel.org>
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



Le 30/07/2026 à 14:05, Krzysztof Kozlowski a écrit :
> On 30/07/2026 14:01, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 30/07/2026 à 13:14, Krzysztof Kozlowski a écrit :
>>> On 29/07/2026 16:10, Christophe Leroy (CS GROUP) wrote:
>>>> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
>>>> proper platform driver") qe_add_gpiochips() was walking the device
>>>> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
>>>>
>>>> After that commit the discovery is handled by the platform core,
>>>> therefore it is necessary to call of_platform_default_populate() on
>>>> the par_io node.
>>>>
>>>> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
>>>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>>>> ---
>>>>    drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
>>>> index a5e2d0e5ab51..02ca556c8db0 100644
>>>> --- a/drivers/soc/fsl/qe/qe_io.c
>>>> +++ b/drivers/soc/fsl/qe/qe_io.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <linux/errno.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/ioport.h>
>>>> +#include <linux/of_platform.h>
>>>>    
>>>>    #include <asm/io.h>
>>>>    #include <soc/fsl/qe/qe.h>
>>>> @@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
>>>>    	return 0;
>>>>    }
>>>>    EXPORT_SYMBOL(par_io_of_config);
>>>> +
>>>> +static int __init par_io_populate(void)
>>>> +{
>>>> +	struct device_node *np = of_find_node_by_name(NULL, "par_io");
>>>
>>> No, node name must not be ABI. Especially wrong node name.
>>
>> What's wrong with the node name ?
> 
> 1. It causes W=2 warnings (which we might move to W=1 at some point)
> 2. It is not generic and DT spec asks for generic node names, although
> maybe this part of code follows more of ePAPR than DT. But ePAPR v1.1
> also was asking for generic node names.
> 
>>
>> Regardless, I messed it up, I wanted to use type but copy/pasted
>> of_find_node_by_name(NULL, "par_io") from quirk_mpc8360e_qe_enet10() in
>> arch/powerpc/platforms/83xx/km83xx.c instead.
>>
>> Is it OK to use of_find_node_by_type(NULL, "par_io") instead ?
> 
> Well, depends. Is it a documented ABI?

In Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt:

Required properties:
- device_type : should be "par_io".
- reg : offset to the register set and its length.
- num-ports : number of Parallel I/O ports

Example:
par_io@1400 {
	reg = <1400 100>;
	#address-cells = <1>;
	#size-cells = <0>;
	device_type = "par_io";
	num-ports = <7>;
	ucc_pin@1 {
		......
	};

Is it OK ?

Thanks,
Christophe


