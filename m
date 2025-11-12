Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D4CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIZoq3QwqYkf1fUAUYt511m3UvjZ0qz93SiTJIygqfc=; b=B5taIL18wjjqI2tkdEfIfw4K10
	oCtuR4HJfFQtUWa8dBI9Iap6OhuG2EO0Ksfy2BaHjGxDAI23BnMdnrjoh+GnwxXlV3zbq8fNr5V7b
	JBFn62mgq5LH9VBZlha9O5dZSuSdZYU13wYNBLopN1nwugmylbe5niK5HL4WOsyAgwlUQH5jxzOcj
	Co4uwW+P/5GQvH/4eFHR/Dc6CrEb50tAqVsTshZES4/++bDKvHk75vDVt3/lNzKB8R8QWQ9P/irKg
	EXkwlHbOfuk3ka9ntZn6WyJZMmuUXNUoLDXbd4eHMI2kGAWm+HlLjfd/gYyoYTNerQEKSBZIg9oYx
	298IkFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD8E-000000097qS-2Udg;
	Wed, 12 Nov 2025 15:51:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD8D-000000097qF-3SNd;
	Wed, 12 Nov 2025 15:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC20D601BC;
	Wed, 12 Nov 2025 15:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C6CC4CEF5;
	Wed, 12 Nov 2025 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762962696;
	bh=mPwMxgz3xFqEaJ39x4SnmbvTirPUZobKbYy9JCR6z9Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Lrlc2IGZmXcABLRyG4Z1Ak2n5LshnHH6DdKCi2hYT3t4x0gN4s/lXRpvQXK9VrW+a
	 C8KEcMOfixTu7L3p3SywEj3PHpV0YyJcL91Vd1okTs2qpy+HNe5lt7sRLLF1hqH50J
	 rQ3m2TOOkjuySQlcnp+F2WnfvH7T660gmCGW1OzPf4Nnx1iafRabqFKrZgWizvX1L3
	 ACwsJDcE5IzAtbnVQZDjlUji1o5l6HywH3w2fzP433WNiLtS8R9BjxRYLxZ343YdNO
	 1EHKJn+4+n6PSTxrt9CPeer6h7JEF76M1pTrAaqOXKHnnjdiWjn9T3xYxJflf4lJPb
	 Cf3509FZyrxcw==
Message-ID: <589670a9-ac91-4fde-b595-473408b3df18@kernel.org>
Date: Wed, 12 Nov 2025 16:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in
 config_port
To: Jian Hui Lee <jianhui.lee@canonical.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Joerg Roedel <jroedel@suse.de>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251111124853.2916889-1-jianhui.lee@canonical.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251111124853.2916889-1-jianhui.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/11/2025 13:48, Jian Hui Lee wrote:
> Fix a race condition where mtk_smi_larb_resume() can be called before
> mtk_smi_larb_bind() completes, leading to NULL pointer dereference when
> accessing larb->mmu and larb->bank.
> 
> Add NULL checks to skip port configuration gracefully when the device
> hasn't been bound yet.
> 
> Crash trace:
> [    7.605014] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    7.605029] Mem abort info:
> [    7.605031]   ESR = 0x0000000096000004
> [    7.605034]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    7.605037]   SET = 0, FnV = 0
> [    7.605040]   EA = 0, S1PTW = 0
> [    7.605042]   FSC = 0x04: level 0 translation fault
> [    7.605045] Data abort info:
> [    7.605046]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    7.605049]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    7.605052]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    7.605055] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106755000
> [    7.605059] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [    7.605069] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    7.605075] Modules linked in: mtk_mdp3(+) snd_compress(+) ac97_bus snd_pcm_dmaengine snd_pcm v4l2_mem2mem videobufo
> [    7.605223]  pwm_mtk_disp spmi_mtk_pmif spmi_devres clk_mt8188_imp_iic_wrap spi_mt65xx mmc_hsq stmmac clk_mt8188_ado
> [    7.605267] CPU: 5 UID: 0 PID: 417 Comm: (udev-worker) Not tainted 6.17.2-custom #29 PREEMPT(voluntary)
> [    7.605273] Hardware name: mediatek Genio 700 EVK P1V4 (eMMC Boot)/Genio 700 EVK P1V4, BIOS 2022.10-gb56d2a20f5 10/2
> [    7.605278] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    7.605283] pc : mtk_smi_larb_config_port_gen2_general+0x2a8/0x458 [mtk_smi]
> [    7.605301] lr : mtk_smi_larb_config_port_gen2_general+0x110/0x458 [mtk_smi]
> [    7.605307] sp : ffff8000867f3370
> [    7.605309] x29: ffff8000867f33e0 x28: 0000000000000000 x27: ffff80007c403fcc
> [    7.605317] x26: 000000000000000a x25: ffff0000d5107c80 x24: ffff80007c4040f8
> [    7.605325] x23: ffff80007c4040f8 x22: ffff80007c403fcc x21: ffff80007c43c918
> [    7.605332] x20: 0000000000000007 x19: ffff80008685d218 x18: ffff8000863b90e8
> [    7.605340] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    7.605346] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [    7.605353] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff80007c403fcc
> [    7.605360] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> [    7.605367] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [    7.605373] x2 : 0000000000000000 x1 : ffff8000867f33b8 x0 : 0000000000000000
> [    7.605381] Call trace:
> [    7.605384]  mtk_smi_larb_config_port_gen2_general+0x2a8/0x458 [mtk_smi] (P)
> [    7.605393]  mtk_smi_larb_resume+0xbc/0x130 [mtk_smi]
> [    7.605399]  pm_generic_runtime_resume+0x38/0x80
> [    7.605410]  __genpd_runtime_resume+0x3c/0xb8
> [    7.605419]  genpd_runtime_resume+0xec/0x338
> [    7.605425]  __rpm_callback+0x54/0x210
> [    7.605431]  rpm_callback+0x94/0xa8
> [    7.605436]  rpm_resume+0x484/0x668
> [    7.605442]  __pm_runtime_resume+0x68/0xd8
> [    7.605447]  pm_runtime_get_suppliers+0x6c/0xb8
> [    7.605453]  __driver_probe_device+0x5c/0x1c8
> [    7.605461]  driver_probe_device+0x48/0x188
> [    7.605466]  __driver_attach+0x14c/0x2c8
> [    7.605471]  bus_for_each_dev+0x88/0x110
> [    7.605476]  driver_attach+0x30/0x60
> [    7.605481]  bus_add_driver+0x17c/0x2e8
> [    7.605486]  driver_register+0x68/0x178
> [    7.605492]  __platform_driver_register+0x30/0x60
> [    7.605498]  mdp_driver_init+0x2c/0xff8 [mtk_mdp3]
> [    7.605519]  do_one_initcall+0x64/0x378
> [    7.605526]  do_init_module+0xa4/0x2e0
> [    7.605534]  load_module+0x24a8/0x2618
> [    7.605541]  init_module_from_file+0x98/0x118
> [    7.605547]  __arm64_sys_finit_module+0x284/0x380
> [    7.605554]  invoke_syscall+0x74/0x128
> [    7.605560]  el0_svc_common.constprop.0+0x114/0x140
> [    7.605565]  do_el0_svc+0x28/0x58
> [    7.605570]  el0_svc+0x44/0x1f0
> [    7.605579]  el0t_64_sync_handler+0xc0/0x108
> [    7.605586]  el0t_64_sync+0x1b8/0x1c0
> [    7.605594] Code: d2800011 d65f03c0 b9808b22 910123e1 (b9400003)
> [    7.605599] ---[ end trace 0000000000000000 ]---

Please trim the traces from all irrelevant information.

> 
> Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")

Add Cc stable.

> Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>

> ---
>  drivers/memory/mtk-smi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 733e22f695ab..8eb043ff8280 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  	struct arm_smccc_res res;
>  	int i;
>  
> +	/* larb->mmu and larb->bank are set in bind(), may not be ready yet */

And how do you synchronize this between CPUs? IOW, what certainty you
have that this CPU sees correct data and the checks below have any sense?

> +	if (!larb->mmu || !larb->bank)
> +		return 0;
> +
>  	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
>  		return 0;
>  

Best regards,
Krzysztof

