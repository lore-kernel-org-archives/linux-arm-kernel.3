Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BC7CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQIShJg6Ftimoja4PEgmZnx0HyZtrXTVnvJJnqLKevw=; b=qbGeeCp35EM7UxZ5FGW23TANzy
	YzvMBEuJAATlituiX0TsLXoULCb+4l4s3kWa+Mzm1hY6YDXaYZP1msC2aP3tUVbfgAsbkkrUMHdZA
	jIPaOHnS5q3icejh8EEiut6ryrWGiSFXZyorqOH7LM7PdR/ux1UpiWFX+xM7S6289MDUXtVS1dAEc
	w23R+0mXfJ4tgmzwcZKFS+JSET2ekUCKFaervey0jJX57lOmIHV7FJ76OIbqELbx3hQ7Rsokaij5g
	BLDSg1g3BxFyi5zLgKBILZeSTAvSGZhj/G+8sPjc622FglHsl2o8euxU5WnLk+mU838Jc73DrZg0U
	GQWvEIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQGH-0000000FWpY-1aZP;
	Tue, 16 Jun 2026 09:39:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQGF-0000000FWpO-3tKf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:39:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2A9B600AB;
	Tue, 16 Jun 2026 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249871F00A3A;
	Tue, 16 Jun 2026 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781602750;
	bh=zQIShJg6Ftimoja4PEgmZnx0HyZtrXTVnvJJnqLKevw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=KiGcSEurA0bA2tm0k4D1frf9Zo+Sb99JN0fq6GlsHkUL9WBcffL7SQogQSKoTHLee
	 wSzGQNbvdYE8YuqI34TdBNZeHWQHqN8vVHeXfi+TcxS/kz3xRAylqNTFhX8eiA/4lD
	 9lXRMg6haG1grL92pEsviJ+SfCiIosxOv5NeTzhp/IHXdILsYEYj4+hj0zBoQTBihq
	 v5SEoRxB1Sg8lqBpNd5+BAs2ZKOLxhmZw6qlFIUXLpnShwuHQIfz3KtSv6M40/nGd/
	 l7KO863tKNtuJoqpmM8Tbs3tdm8LTP7AtgSFoylKDVDLPRB6mUuu8j8AjxPkwU+PFu
	 xlxUIS5SF6F1Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3AF84F40088;
	Tue, 16 Jun 2026 05:39:09 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 05:39:09 -0400
X-ME-Sender: <xms:vRkxajW7YWBumGb6A4iRcA2CdL0CMXCVqrmEFkaQlkld6efNhHkzcQ>
    <xme:vRkxamYnOT7Tu1LGNsaGL-2Cs2csdc7vCCXbbvML_eLkqZVj0h25mbhal4_7xzI0V
    92G2AobgUAi__LtehTRIK8btatIts5hxPL3dec1vgI8drYr2YDlyjs>
X-ME-Proxy-Cause: dmFkZTFM51YHfFrDfAOUAPxdVwxe7tVW0qqhy91bxQZOzvwB6WQa1dxMIYZMNd4LkfbkRL
    vfFOiked41ElbEAn3yw6jWtw/GnNW0UbhyFevdJhaitnMWv80BWzsepnt721BLY1N5Mrmc
    KY3xZrIefmuMr0Tudi6CR4R5MzT7STOn/N0aASnqOsHxUnFvMEyrD5fi9VPwdzuYADMY9P
    D6rKnG37RFnjIQft3Rx5E+i3Xzxnagqk435WSY/e5rLTlIYWqnl0Zy9vAHfdmre0ITu47I
    CsvKOCyXHii8DIMoTkGxsMYdKiMPiL/6Q2RjwsHZYr585zU+vkpa5ObwgtkSzMjylBJwoY
    EJ/iKPFyFYIIJDWlxnMSXcC47ykW3VhAiE01YWBeE0RaU+uq4g8aGau1vzURjpTkwTy7r3
    5buxw6uQKcXDG2bUn3iqi/DkrZSA5BBTNbI30BFLCUpiL4iLGePz46afk/lJ5RhZSlKZG6
    mLYAtav9aH5JVZ++FwsD8K70cHE+UIebqjIKWf0ds5pdWhFFak3ioEObVVIWqkaP+HRlAW
    fakoXK4VYUX55+BsyRicMnrUjtPnHtrRFo6/t8ONaHLeI7X0a50zH6aPfzPdhVXnYCm+SR
    RmCdxdw9EecoUbZ045qoZ0pm4Sj/zZVVEPopTdOn3NmrtPxlHzLbnXCmzopA
X-ME-Proxy: <xmx:vRkxavLQboasl_4zj75TdNGPoZMNKlQ6WYsfMQ35OA0Y0kALKgxkew>
    <xmx:vRkxau2bprsBw1KMIzY_woFRVvAYItuIyxw0SYTKtU5E_-IXZ45fBA>
    <xmx:vRkxakJT-AonaOAaPrAmIRg5AoSz_H1qgJbbM-lRwvc0hKFGst6rXA>
    <xmx:vRkxahiXfh-vFI0wlyYbh2ijS5kdQnfDxN4T-eL0Zgcl0eCTpyqWVg>
    <xmx:vRkxasBcyBdLwTvaoBfNQGQz48mKn_84X9FY3ANM-VqPOL3W5ikkLDrA>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2D2D1820086; Tue, 16 Jun 2026 05:39:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 11:38:48 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>
Message-Id: <fe467789-ae72-4a74-a9c0-6062b522fbd2@app.fastmail.com>
In-Reply-To: <ajBcE3qfT7ldBNKG@lizhi-Precision-Tower-5810>
References: <20260604151151.150377-7-ardb+git@google.com>
 <20260604151151.150377-8-ardb+git@google.com>
 <ajBcE3qfT7ldBNKG@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v2 1/5] arm64: Rename page table BSS section to .bss..pgtbl
Content-Type: text/plain
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



On Mon, 15 Jun 2026, at 22:09, Frank Li wrote:
> On Thu, Jun 04, 2026 at 05:11:53PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Rename the .pgdir.bss section to .bss..pgtbl so that the compiler will
>> notice the leading ".bss" and mark it as NOBITS by default (rather than
>> PROGBITS, which would take up space in Image binary, forcing all of the
>> preceding BSS to be emitted into the image as well). This supersedes the
>> NOLOAD linker directive, which achieves the same thing, and can be
>> therefore be dropped.
>>
>> Also, rename .pgdir to .pgtbl to be more generic, as page tables of
>> various levels will reside here.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>
> I met boot failure for i.MX8QXP by this patch
>
> [    0.823515] Unable to handle kernel paging request at virtual 
> address ffff00000328f000
> [    0.831116] Mem abort info:
> [    0.833886]   ESR = 0x0000000096000147
> [    0.837622]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.842923]   SET = 0, FnV = 0
> [    0.845961]   EA = 0, S1PTW = 0
> [    0.849088]   FSC = 0x07: level 3 translation fault
> [    0.853952] Data abort info:
> [    0.856809]   ISV = 0, ISS = 0x00000147, ISS2 = 0x00000000
> [    0.862296]   CM = 1, WnR = 1, TnD = 0, TagAccess = 0
> [    0.867330]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.872633] swapper pgtable: 4k pages, 48-bit VAs, 
> pgdp=000000008211f000
> [    0.879321] [ffff00000328f000] pgd=0000000000000000, 
> p4d=18000008bffff403, pud=18000008bfffe403, pmd=18000008bffea403, 
> pte=00e800008328ff06
> [    0.891834] Internal error: Oops: 0000000096000147 [#1]  SMP
> [    0.897469] Modules linked in:
> [    0.900514] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
> 7.1.0-rc1-00016-g63e0b6a5b693 #834 PREEMPT
> [    0.909978] Hardware name: Freescale i.MX8QXP MEK (DT)
> [    0.915104] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [    0.922053] pc : dcache_clean_inval_poc+0x24/0x48
> [    0.926742] lr : kvm_arm_init+0xa78/0x1638
> [    0.930828] sp : ffff80008318bd10
> [    0.934127] x29: ffff80008318bd50 x28: 0000000000000000 x27: 
> ffff00000328f000
> [    0.941251] x26: 0000000000002000 x25: ffff80008219e000 x24: 
> 0000000001002222
> [    0.948374] x23: 0000000000000030 x22: ffff800081e850c0 x21: 
> ffff800082b790d0
> [    0.955498] x20: 0000000000000004 x19: ffff8000830a0000 x18: 
> 0000000000000000
> [    0.962622] x17: ffff800082f938b8 x16: ffff800082b8b4e0 x15: 
> ffff800082b8b4b8
> [    0.969746] x14: ffff80008308f0a0 x13: ffff800082b8b490 x12: 
> ffff800082b8b530
> [    0.976869] x11: ffff800082b8b508 x10: ffff80008308f140 x9 : 
> ffff80008308f118
> [    0.983993] x8 : ffff80008308f0f0 x7 : ffff80008308f0c8 x6 : 
> ffff80008308f078
> [    0.991117] x5 : ffff80008308f050 x4 : ffff800082b8b468 x3 : 
> 000000000000003f
> [    0.998240] x2 : 0000000000000040 x1 : ffff000003291000 x0 : 
> ffff00000328f000
> [    1.005367] Call trace:
> [    1.007800]  dcache_clean_inval_poc+0x24/0x48 (P)
> [    1.012490]  do_one_initcall+0x80/0x1c8
> [    1.016310]  kernel_init_freeable+0x208/0x2f0
> [    1.020654]  kernel_init+0x24/0x1e0
> [    1.024131]  ret_from_fork+0x10/0x20
> [    1.027700] Code: 9ac32042 d1000443 8a230000 d503201f (d50b7e20)
> [    1.033779] ---[ end trace 0000000000000000 ]---
> [    1.038428] Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x0000000b
> [    1.046026] SMP: stopping secondary CPUs
> [    1.049943] Kernel Offset: disabled
> [    1.053408] CPU features: 0x00000000,00000008,00040021,0400421b
> [    1.059316] Memory Limit: none
> [    1.062359] ---[ end Kernel panic - not syncing: Attempted to kill 
> init! exitcode=0x0000000b ]---
>
>
> Any idea?
>

Which tree is this based on?

