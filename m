Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC4ACD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wo+pAlvSm49r6D2GoIWRU76W7R/YCiyr2qsoo+pkb4=; b=gL41DQOgdBCk0u/BVXRjwT//cd
	vFpmcCw0T4b+pwzpnn7167VfXeYlW2Cyqi/VgmhxO0iR9WzWNe/D1AadPymYj7c6KLynJY++tqA4x
	JEzqNVI460Nbs4goLFApW1iTcNpLCbi/KWr14LNzRe3Qkgu3frc3HtU4oVeEeIMqMS6+g4YjDl87o
	wmlpONU4GWFY3GWjrj+ygSTeoqQOMm0iVxH4WaRt2YJnd/r8Yk4vTTeaxTbdxbtDkguRroG9Y1CUI
	FeGf+8P5zojbwuIfbX2f5jZ6LvHghgVcOiqY3IN5T0/JqLS3ylYv+JyxAjaKxRE5cRV7Ed4k7+8oP
	1RVNEw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyNw-0000000Frd7-2AiA;
	Mon, 18 May 2026 13:51:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyNt-0000000Frca-3Ndx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1E4944279;
	Mon, 18 May 2026 13:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33A4C2BCB8;
	Mon, 18 May 2026 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779112312;
	bh=tTiSLoD171HOH9MG6UW2Ctw5fFKZ7i03l/tZXd81gA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpVPMYOOQGSZUQyavZov1lTId0F2PnFZ5ubdKezcRZizgMLp0LPs1hklw+3/6K6LW
	 7BNdCNjZ1mYNLUPSPgPNP0Kes1UGCcZ/h2BAJ9TGgoNw73xdnoah1kb3Jh56JGcyro
	 eRh+o9IjS+j2TPCyxxpoBj8dVwYJLs/Wl7Yfdck1392G0aYpOkzoZw8UJSDqIr3Ww1
	 ii9ahi96yMY8BRaky6Ib59I5LV+mWCZh006nV+Pn6H3USUdbpHqYBYOUbctJZmhhXL
	 SvB/q2UZPZR/oq/nacuYEZe7tLh88cVtmTGnDdT3PlmeeUG8YLpkyxzx1iXyrB549K
	 NvIWXAwBsbpEg==
Message-ID: <4f34dc22-8dd7-42fb-8c16-4e359faf60d6@kernel.org>
Date: Mon, 18 May 2026 15:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
To: Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20260224100936.3752303-1-maz@kernel.org>
 <177209938125.547814.7154250802402503122.b4-ty@kernel.org>
 <87v7cva080.wl-maz@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <87v7cva080.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065153_896901_CF57D4F7 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Marc,

Le 10/05/2026 à 15:00, Marc Zyngier a écrit :
> On Thu, 26 Feb 2026 09:50:43 +0000,
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
>>
>>
>> On Tue, 24 Feb 2026 10:09:30 +0000, Marc Zyngier wrote:
>>> This is the second drop of this cleanup series for the fsl-mc MSI
>>> infrastructure, initially posted at [1].
>>>
>>> * From v1 [1]:
>>>
>>>    - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/6] fsl-mc: Remove MSI domain propagation to sub-devices
>>        commit: 1fb7392ee3408494d4d62c09a8c3e5f5934caba7
>> [2/6] fsl-mc: Add minimal infrastructure to use platform MSI
>>        commit: 0c9f522f2d41c7e055a602a0d2c41dc7af01010b
>> [3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
>>        commit: cf3179b4e53f527aba9f0c6c3b921619c8adf761
>> [4/6] fsl-mc: Switch over to per-device platform MSI
>>        commit: 4a958e47c246fa3fb8954f4303e0da15ab3d026d
>> [5/6] fsl-mc: Remove legacy MSI implementation
>>        commit: 14b1cbcc6cec0b02298f4adf717646cd943b7ef6
>> [6/6] platform-msi: Remove stale comment
>>        commit: f0a2eac6a597268034fd40d92c1469182438b53d
> 
> Is there any particular reason why this didn't make it into 7.1?

I sent a pull request [1] as early as possible after Easter break, but 
it was apparently too late. Or maybe that was because I did a last 
minute rebase, I'm not sure what the real reason. I tentatively sent an 
alternative pull request [2] the day after after rolling back the 
rebase, but I got no feedback.

> 
> I was really looking forward to some additional cleanups in the GICv3
> ITS code, and this gets in the way.

It is still in linux-next and finger crossed will go in 7.2

 > > Do I need to respin it?

No, I'd like to avoid having to rebase again. If you have changes to the 
series please send followup patches.

Christophe

[1] 
https://patchwork.kernel.org/project/linux-soc/patch/69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org/

[2] 
https://patchwork.kernel.org/project/linux-soc/patch/310b65ba-1d73-4ce0-b332-00cde70acc69@kernel.org/

