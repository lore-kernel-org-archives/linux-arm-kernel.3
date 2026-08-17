Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7533C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/Re6YGkB/5+NfHRAlgNFlF60vE4TkJcD1A6bUVVMlM=; b=HOW3LM/R2QEtH3tSz7M6/6XFsO
	B+I0ZfkoCEXKbB0a9fqIWJq1aFjMT0+LObhsUvL+K3IWEsd9fqq2MaiF1HoRPRh3mt1dHSeNk3SsI
	LlW2NqzKl9zAx81+u8J6YwxQTR8wO8bNQ1U/aL9kzg6qovq5DFCTbL+ixOZO+zLc3CvzHGnF8ek1p
	bJjDTZosdtiKLEsBZpi4IXMRMh8VO9w62rlYQ9pc66+0K/TUdgmPp6S0wR8+eJN+JnWJe3v0Tvhe7
	tWlRNCrZLC8B2/DgjVZGfceVazVy0upmHXT2b9zdz3wAr9ANtGO5kXuKyArTUJfaTN2fJ9APRdEB4
	G+g7mmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtUb-00000005nNL-08Ih;
	Mon, 17 Aug 2026 09:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtUZ-00000005nMG-1Bp4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:18:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7bfr4788712
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z/Re6YGkB/5+NfHRAlgNFlF6
	0vE4TkJcD1A6bUVVMlM=; b=oRsMzJcRJIrqyGSqbpQPaQbyEqlkYaQCNtdwFGF+
	GdB++fE8KnO1AVWprWX+sc+uxF0CNHcXfIPtHLd8mzMCMtjCHgtaraUhrV1uDwYP
	tEWvle6cEV5tn1ZRFGNVLi3y6h9wfI/SwZIZGzft30C0gsLAVxEhSNay3L2iOIhF
	k0qtiYcftyMyOLOo3WL4DsOvY14hvXIYCX85bw53/XPIH7wrdohhepHoDb7zsgjy
	phlUoGh5LW/WevwkenMKLhdmNI9zYYAqQtiSy9da2sTUP3RIdFK+hAU5SH/mOrfS
	ew1cu68JHzwB34Up/mdv5T2lHuh7XMEeR1Ip42GfLg95iw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30gcm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:18:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso63703046d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786958329; x=1787563129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/Re6YGkB/5+NfHRAlgNFlF60vE4TkJcD1A6bUVVMlM=;
        b=YSq26wy1yVL1JVEdqxbzDOj20Y4lza/bMv/6NPMiZe+IKjCuMtTTYjEPEMfm4Ndund
         jnFyq0czjSudRrbkoLxIPG+36Qd52tSXPJdlmJ0gn2cegqknl8Cb2J6agt7ZGXZEqoxR
         h5NXzXnfR1M1tXdFpkQSnjdrL635ucEkJ9in+gfYVzBZmbqc1WTX/ePMolNNTdOFJsN3
         /tYzGe1NXPcaqFsf5MGzXUw1Nc8OZWVUz1oD/Nz3Yk1K5qIA4ZycAgZpe6nMVdFi2Vut
         g2lBom7OdWEVYM+eu/QTzmkcm5PkEZkYZDBgbzd3+1/Ui5s7kAFBZ+UldlQ+i+58DsHd
         ZwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958329; x=1787563129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/Re6YGkB/5+NfHRAlgNFlF60vE4TkJcD1A6bUVVMlM=;
        b=Daa+KfP9ygUNQUBD28X/FyNy+M3Y4/hIdSMt6g8wBF3vkXlLp+iZABy5rV4yCg8YCK
         gVmqBZ+xSPfbFhOQWIzqXJ8XzW+fJq7s+rxh0vcZF+aeQ8PWByj8H2nK0Uyv+49M7rQJ
         Z+pF87qACdgTLsuRfZSc/AwXhL7ljbAGsIUYVLiyoMW/hzHJttyo1bzhz/twJfp4TnEz
         UaJLc+6SkxmHK5XMXQg6QpBg16VMD9W6/PLgF3LCEDKDWjvbplWija6z3IMTgdL0y1Lo
         RGCLD0fsi+9Zql2AZKXUwj0AgjCcSPF2dq3Inmr63Wskr4G4D1vcrIhp9eLocPRQPU1U
         KoYw==
X-Forwarded-Encrypted: i=1; AHgh+RrBQ4QEMNCOB+NtK5Qf/yr8Xi+AWGBsWnpjnku/D7dJUL4HXZPsWlMY9Z0LDT0RMOwwc063jickIiWHBtGbgEiy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FWymFp+YI4GNdcQtEKbHyWyjb7i0Aym64jVIhPhH6wu1e5Kf
	Z1lIMzOdzA8aUPhvcxr22CFp8/OTbmDA+c5BhIm7o9L/sc2BMBHHwDjIqxlPgMRMryW6OdC7nWc
	MrVGTGJ0QH263gG2NUzlj5g5qKRPvJBN7qU4aQmuSpeB8QLT9RWi8ZrGCkea46VjwJxXFDnphYm
	sIhQ==
X-Gm-Gg: AR+sD13Ih0c7A5X6I4w1+KlwqWDcbP2hFeopgTj+CrMgDlf3a+3PXYCe2X74MbzK3or
	4N1VOd1QX10k8HYTUstqZ9l86nIJ+rH64mtyH1BBBggN3GjpUd67XPKd5w5FFUpCi5kzXrHe9tv
	1pQGjmn5eamc87f1Nykzdz4aFArvH8VTlYqga7CkhxxKrnKQH+4Zqdk5vZxtbtrKjo3yNqbMSIw
	K9Um0JQ0d2N69EEEH1YsK3N7XoJhstbH3zcMlOM+jAzJCbzYfr+e5ugLryXZGAw+35B7BdJWZFf
	9WDuoAemThOaITIg5y7d51uPW3mPFc9IeMEyT6epnHa1yHszHehGujmwKvV7h1ejTk3QZSApKkr
	ZwPVpXZ8MGN3l+RCyjczgGN++2gbqDF/rFEEhQHPeUVS6A6jt1H2OLmeKHsZ1YjPml9QokrElRD
	o=
X-Received: by 2002:a05:622a:5c14:b0:516:e249:e30f with SMTP id d75a77b69052e-52d8557d9b4mr267662191cf.42.1786958328604;
        Mon, 17 Aug 2026 02:18:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5c14:b0:516:e249:e30f with SMTP id d75a77b69052e-52d8557d9b4mr267661831cf.42.1786958327989;
        Mon, 17 Aug 2026 02:18:47 -0700 (PDT)
Received: from leviathan ([2a0d:3344:316:5100:f22f:74ff:fe21:6f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d10be27sm32706235e9.14.2026.08.17.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:18:46 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:18:44 +0100
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <aoLR9BPGt4Kzbr3y@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
 <an8xTBiCy_PEuwZi@leviathan>
 <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2OSBTYWx0ZWRfX0KPnB+e4VvK2
 bzQo5xFM9iyQDdtdtfUQuICz6RkMcuW2a6W8aaxQShj9NKeU+gszzgZ72NAp2KxqOwr0ooLGrrk
 Bu3DJXXlfJRcS714RKKtNjMRmEjV829tdL915vJkvrZtrYbdRlh3TVatbVno1tLZgjlhj+kbB+4
 F3cxP+DXl66YwYjEE+mEE6ariFRCEC9wWy0sUVifWsF9/+RMnlkFPJyRgqNW000BXZTden8BpiM
 GnDqKu55Z/x7V3ZhHUMMyhCS9FCNxWuDRMde7uympUePcIVoJLveKXCxb21uqCtIxT2YrN6YIp/
 PJgYboCBFuLuqMa3NXYeNVc60Iz8C2LHJV1Wq+baEpzjfmTxdL8gpIfH/LaG2eVCM9573UUH6Pe
 YLpFkePzJra8EUKAcrA58X4jaKN4vAKv9XJMMHdvSq+fPfbKgTEer4Mz49nfkAB6JlmCZ87F9k+
 wbYkbKIo40HV2PcqM7A==
X-Proofpoint-GUID: 0dQ9Q5qcSt6wDtz7XFZh-hCZcyTagf9L
X-Proofpoint-ORIG-GUID: 0dQ9Q5qcSt6wDtz7XFZh-hCZcyTagf9L
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82d1f9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=TWCjO1UoqHXKrXYG5nYA:9
 a=4OldKtP1pka_piUj:21 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2OSBTYWx0ZWRfX1dc+nw4wwWHv
 bqXg7hDhJrUuJOUOV12/4RyFExLj4PqcyaLiO5HCqK8BLK/F6ZVQWUCeYsHZri8QF1ZbsICkaGs
 oiWp/zC5O2AFpkL/hyevq34D8ql9Kpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_021851_337133_6B36DF71 
X-CRM114-Status: GOOD (  54.03  )
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

On Mon, Aug 17, 2026 at 11:41:51 +0300, Ard Biesheuvel wrote:
> On Fri, 14 Aug 2026, at 18:16, Leif Lindholm wrote:
> > On Thu, Aug 13, 2026 at 09:45:09 +0200, Ard Biesheuvel wrote:
> >> The EFI stub already passes a struct efi_boot_memmap populated with the
> >> information of the EFI memory map as a configuration table, and so
> >> passing the physical address, size, descriptor size and descriptor
> >> version via 4 different DT properties is kind of redundant.
> >> 
> >> Instead, pass the physical address of this struct in memory so that the
> >> kernel can just retrieve the values directly.
> >> 
> >> Unfortunately, the scheme with four separate properties is boot ABI for
> >> Xen, and so this needs to remain supported.
> >
> > To clarify, you mean boot ABI when running under Xen?
> >
> 
> Yes. We've allowed Xen dom0 to omit the EFI stub entirely, and boot the
> kernel proper in EFI mode, passing the EFI system table and memory map
> addresses via these special DT properties.
> 
> >> But for the EFI stub itself,
> >> this is just an internal ABI that can be modified.
> >
> > Hmm...
> >
> > So this leaves only three properties that cannot be derived from the
> > System Table:
> > - The System Table address itself
> > - kaslr-seed
> > - bootargs
> >
> > The latter two could also be given the config table treatment.
> >
> 
> The latter two are generic boot ABI for the arm64 kernel, and there
> is no need to treat them differently for EFI boot. Note that we also
> support passing the initrd directly via DT when doing EFI boot, rather
> than via the EFI specific device path.

Ah, yes, noted.

> > Is it time to update the boot ABI to say x0 will hold the physical
> > address of "device tree blob (dtb) or EFI System Table in system RAM"?
> > They can be distinguished by 0xd00dfeed / "IBI SYST".
> 
> Let's avoid 'boot ABI' here, given that we are talking about an internal
> interface between the EFI stub and the kernel proper.

It's an internal business in the topic under discussion, but if we
were to change it, that would mean updating booting.rst, which I
consider an ABI.

> This internal interface uses DT under the hood, even on ACPI platforms,
> because it simplifies the early boot code. I don't think we should change
> this.
> 
> Also, the DT provided by the bootloader (if any) may differ from the one
> passed by the EFI stub, and so discovering the DT from the EFI system
> table is not straight-forward - they are not the same, and making them
> the same may have unintended side effects.

Right, but this confusion exists precisely because of the two ways the
device tree can be accessed with the curreent design.

> > The use of a generated DT when none was provided by firmware has led
> > to both confusion and shenanigans, and might be nice to get rid of?
> >
> 
> I don't disagree with that. But that would imply adding new code to the
> early startup code doing command line parsing and KASLR randomization to
> reason about whether these assets are passed via DT or via some other means.

I take your point about the invasiveness, so won't pursue that further
at this time. But I can't promise I won't bring it up again eventually :)

> What would make sense imo is to pass the EFI system table address via X1
> when doing EFI boot, so we don't have to get anything at all from the DT.

That certainly sounds like a clear improvement.

> > Either way, it would be nice to get rid of all four of the
> > linux,uefi-mmap nodes if they're now completely redundant.
> >
> 
> Indeed.
> 
> > Minor bikeshedding below.
> >
> >> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> >>  			pr_err("Can't find property '%s' in DT!\n", pname);
> >>  			return 0;
> >>  		}
> >> -		if (dt_params[i].paravirt)
> >> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> >>  			set_bit(EFI_PARAVIRT, &efi.flags);
> >> +		} else {
> >
> > This condition branch doesn't in fact have anything to do with the fdt.
> > Should it still live in fdtparams.c?
> >
> 
> I don't follow. The EFI_PARAVIRT flag is set based on whether we are 
> using the generic or the Xen-specific set of DT properties. What would
> be a better place to decide this?

Apologies, I may have commented confusingly - my comment was about the
else branch:

+
+                       bm = early_memremap_ro(memmap, sizeof(*bm));
+                       if (!bm) {
+                               pr_err("Cannot remap EFI boot memory map\n");
+                               return 0;
+                       }
+
+                       mm->phys_map            = memmap + sizeof(*bm);
+                       mm->size                = bm->map_size;
+                       mm->desc_size           = bm->desc_size;
+                       mm->desc_version        = bm->desc_ver;
+
+                       early_memunmap(bm, sizeof(*bm));

So to restate - this function is called from efi_init():
---
        /* Grab UEFI information placed in FDT by stub */
        efi_system_table = efi_get_fdt_params(&data);
        if (!efi_system_table)
                return;
---

Before this set, this function called get_fdt_params() indeed gets
"params" from a device tree. After this set, this function gets params
from a device tree in some instances, and not in others.
Which feels suboptimal.

We could rename the function, but then there's still DT-unrelated
code held in fdtparams.c.

If we go down the route of passing the system table in x1 on boot,
then I guess the effect of assigning efi_system_table will already be
broken out. But should we then split the mm struct initialisation into
separate DT and config table helper functions?

/
    Leif

