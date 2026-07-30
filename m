Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D7C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB+1/VcAurLNVMM5ndJqiyvxdLgZ7zdkHDifPc4bAgQ=; b=WGqWfsmU5NWbDEfJCVBz18yVAz
	G4A39pmz8nmfE7OZUZW2TRGUOoNsIiPxNJp5fxLTdiQ+jwMEXwkddeBqsLJ2KizQ9TQe7tOdRCuvr
	XzMTedldX/MGquFFBjJsxTX+WSurySnQArwqfUplqtyB/KodQCDzDzuu1CJYmTPDyxOB5DwjotOZo
	6jpdcRp+BHyUrCwepTYa8WkjrD3PGRyUwjoIhi+zb3y0KXTZPI3EmZRFq+rkGJC5x7xqX6ay1uoIN
	Hf1psF3TbNI4vlcFFfEChsxWhgor3aQwY0Xt+bxzXktHTdkHTbdLLcbVcQ0BgcjI4PiAqjxWSlNqt
	X/K0SZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPVv-0000000APxA-2rtG;
	Thu, 30 Jul 2026 12:05:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPVs-0000000APw2-2scc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE7A041771;
	Thu, 30 Jul 2026 12:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C68F1F000E9;
	Thu, 30 Jul 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413123;
	bh=GB+1/VcAurLNVMM5ndJqiyvxdLgZ7zdkHDifPc4bAgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NLwNWWaeMvG01Gjpp7uMwgO9G7vUki4N/1xrJ4tu5DCJcxUNDllGTq5yEwLkd30eI
	 HQg/Nm7ekIhMETcHlPO7MqTHuqIWpWsGamPgw3MVuB3MvhpOoFpEMhbToygWKw/Akh
	 kCEBQ4krd/HJqHV6SUOa2rKpSQpqUfIPOrAi8tQ4GEf5XfUySrOGTMQsEBR+x95UYp
	 juSeKcWDcem0HsFiloMpB2R+Xxn4IK8MXcOgNP5Pxo5aT3EITt4TDIfeowUe78nmQx
	 Up1HCJ3dKR4Iuxob+xdwf4iVRjFlGMC3unZZcQkCWyD9kLzm7+JsXHK0TJPrD46aLx
	 wQ/kZdTsnuXCA==
Message-ID: <f1b4c866-6cd7-4d6f-812b-d95e94f69e83@kernel.org>
Date: Thu, 30 Jul 2026 14:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Paul Louvel <paul.louvel@bootlin.com>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
 <e1bd8dcf-9b8e-4bc7-8ba8-6c06222e1659@kernel.org>
 <223afb76-9f6f-48a1-a5c5-beb1a641916c@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <223afb76-9f6f-48a1-a5c5-beb1a641916c@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 30/07/2026 14:01, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 30/07/2026 à 13:14, Krzysztof Kozlowski a écrit :
>> On 29/07/2026 16:10, Christophe Leroy (CS GROUP) wrote:
>>> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
>>> proper platform driver") qe_add_gpiochips() was walking the device
>>> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
>>>
>>> After that commit the discovery is handled by the platform core,
>>> therefore it is necessary to call of_platform_default_populate() on
>>> the par_io node.
>>>
>>> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
>>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>>> ---
>>>   drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
>>> index a5e2d0e5ab51..02ca556c8db0 100644
>>> --- a/drivers/soc/fsl/qe/qe_io.c
>>> +++ b/drivers/soc/fsl/qe/qe_io.c
>>> @@ -15,6 +15,7 @@
>>>   #include <linux/errno.h>
>>>   #include <linux/module.h>
>>>   #include <linux/ioport.h>
>>> +#include <linux/of_platform.h>
>>>   
>>>   #include <asm/io.h>
>>>   #include <soc/fsl/qe/qe.h>
>>> @@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
>>>   	return 0;
>>>   }
>>>   EXPORT_SYMBOL(par_io_of_config);
>>> +
>>> +static int __init par_io_populate(void)
>>> +{
>>> +	struct device_node *np = of_find_node_by_name(NULL, "par_io");
>>
>> No, node name must not be ABI. Especially wrong node name.
> 
> What's wrong with the node name ?

1. It causes W=2 warnings (which we might move to W=1 at some point)
2. It is not generic and DT spec asks for generic node names, although
maybe this part of code follows more of ePAPR than DT. But ePAPR v1.1
also was asking for generic node names.

> 
> Regardless, I messed it up, I wanted to use type but copy/pasted 
> of_find_node_by_name(NULL, "par_io") from quirk_mpc8360e_qe_enet10() in 
> arch/powerpc/platforms/83xx/km83xx.c instead.
> 
> Is it OK to use of_find_node_by_type(NULL, "par_io") instead ?

Well, depends. Is it a documented ABI?

> 
> We have:
> 
> $ git grep par_io arch/powerpc/boot/dts/
> arch/powerpc/boot/dts/fsl/mpc8568mds.dts:               par_io@e0100 {
> arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi:  par_io@e0100 {
> arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi:          device_type = 
> "par_io";

These are all DTS, does not matter really. ABI is not documented via DTS
but bindings.

Best regards,
Krzysztof

