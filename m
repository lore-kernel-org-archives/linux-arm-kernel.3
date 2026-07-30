Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE61C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHf18rSlNZKDZKjkZzbb9NgJagDAkYivuavqTnujb3E=; b=siEAAvE0bGO3MYGddJMSFsf8BC
	FVPfZvC9hDZvsp5rANcbn3Eo5Ng5vHP6hLn0DtPJEwzmmOYTQJFFUvlKJ5d4fHC6WZ2rI8LAt6z8L
	UxKnO/TPIt1j5JS+05PXjsxub6AKJ07H6KdIolC+nZ6FPyDbbm22N+99xcXTBWK7HZgRhuszbIv4z
	NPX2ihvwrXMP8l3gHSvOj+qYRfIbkYyKE5o4wfv2LbLjFMEZpAI968mgireq72xlCWTTFSCNDUbNI
	e/OGXnWIBX1p0bMszOIiWbc/O+1/ycbOd5xXJsyJgNr53B10FY/1cB3ne/wr4LnUvXhTdcsqlD7se
	DEsug+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPRj-0000000APNy-3gXA;
	Thu, 30 Jul 2026 12:01:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPRi-0000000APNU-1i5t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:01:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 871AC600B1;
	Thu, 30 Jul 2026 12:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C6D1F00A3A;
	Thu, 30 Jul 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412865;
	bh=DHf18rSlNZKDZKjkZzbb9NgJagDAkYivuavqTnujb3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T9VtASufsi6UhkYBym/rW+7GIcQGoutZ15mvneRHOETKxWcDl45W8Yhwy6V5bQR2G
	 9RZoWt+/awfySOhU5icPHSUWu3HdhWH4YGGtLV58it9SnbVQwcyBt9Wdik+JIcE/S4
	 njdXmNbigKVKE1oytHZlvxvGONIcf7ZtJZS/bKREHbubj9mbiHxfZf9E4Ey/sjq3AN
	 3e24tBRr3ZuOrG3KzQ8RKE4kRjCjJ4KPb/kb0agLQ/6k7NTexEIDQeq6mpgOocANHm
	 5bSh1uieJUfJIerYD0L0RMoHd+YybKhy7cRsfj0d0bRznpjaARbNVZPHBW82tgOhz+
	 kKRh4qQcNM22Q==
Message-ID: <223afb76-9f6f-48a1-a5c5-beb1a641916c@kernel.org>
Date: Thu, 30 Jul 2026 14:01:00 +0200
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <e1bd8dcf-9b8e-4bc7-8ba8-6c06222e1659@kernel.org>
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



Le 30/07/2026 à 13:14, Krzysztof Kozlowski a écrit :
> On 29/07/2026 16:10, Christophe Leroy (CS GROUP) wrote:
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
> 
> No, node name must not be ABI. Especially wrong node name.

What's wrong with the node name ?

Regardless, I messed it up, I wanted to use type but copy/pasted 
of_find_node_by_name(NULL, "par_io") from quirk_mpc8360e_qe_enet10() in 
arch/powerpc/platforms/83xx/km83xx.c instead.

Is it OK to use of_find_node_by_type(NULL, "par_io") instead ?

We have:

$ git grep par_io arch/powerpc/boot/dts/
arch/powerpc/boot/dts/fsl/mpc8568mds.dts:               par_io@e0100 {
arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi:  par_io@e0100 {
arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi:          device_type = 
"par_io";
arch/powerpc/boot/dts/fsl/mpc8569mds.dts:               par_io@e0100 {
arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi:  par_io@e0100 {
arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi:          device_type = 
"par_io";
arch/powerpc/boot/dts/fsl/p1021mds.dts:         par_io@e0100 {
arch/powerpc/boot/dts/fsl/p1021mds.dts:                 device_type = 
"par_io";
arch/powerpc/boot/dts/fsl/p1025rdb.dtsi:        par_io@e0100 {
arch/powerpc/boot/dts/fsl/p1025rdb.dtsi:                device_type = 
"par_io";
arch/powerpc/boot/dts/fsl/p1025twr.dtsi:        par_io@e0100 {
arch/powerpc/boot/dts/fsl/p1025twr.dtsi:                device_type = 
"par_io";
arch/powerpc/boot/dts/kmeter1.dts:              par_io@1400 {
arch/powerpc/boot/dts/kmeter1.dts:                      compatible = 
"fsl,mpc8360-par_io";
arch/powerpc/boot/dts/mpc832x_rdb.dts:          par_io@1400 {
arch/powerpc/boot/dts/mpc832x_rdb.dts:                  device_type = 
"par_io";

Thanks
Christophe


