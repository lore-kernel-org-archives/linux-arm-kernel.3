Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09BCC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w73H4Wybt7wskLAo+yX+hGB0G0F78nZdnr+eiPJjGEk=; b=pPficoE2vtRIeAWPP+oQn1rq6M
	0e/B1VmqDQqVq/fTJ4k09X2adjaZBmt9n3RraySITOfWOwIA1XzrkCQp5cgd2Sw6bUidlAIALr+dd
	JadDvSwXeJUICJJD0Kml7wKcWKOZ5J7db9ImulIi+2ueTts8x4ksbDyx7jIyK1mQVWNrpQ4jKL3TO
	5rTOgvWr0zQtyElvN7YKfNJCb9t+fjop/1tYOhD27wx0opsLO/2xn8Oehk/67tbvBAvctATiKvU60
	m0ASCHhlKakKZNWWHKVCMjfaTst+gXHEyYMcgzkcHMad7SbaJ71SyD3UeWpbf/QN0cQpQFsjdvqhs
	moth1unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy1H-00000006GyG-3H2m;
	Mon, 17 Aug 2026 14:08:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy1E-00000006GxS-3AbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:08:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5raM2008348
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w73H4Wybt7wskLAo+yX+hGB0
	G0F78nZdnr+eiPJjGEk=; b=QgYlvCG77oGFmR4vVaqFYH/eiCpR963MafF/bOUm
	04BXHqtg/a5OQatFvxFIdmmlEqlipC1WKdAZ5iudgpTVdGX1p9flt5QMxjuCo5Qq
	dV8XMQo4cwSkBMF+lux6buXG/6QcfEsD5Lf2etMo48byMhPgSR16Es8ZeQp8Pk+C
	gTdp3jhKUaKvQIMEZEtiHDDw/ziUzjIhd8d+iI1zCPc+CdoI5G7zUgeqMtwmzwMO
	hbEVNpk7Rpe9BF4c6wqKAUS0rm6+HKN5PNYFJMFlVXdlito84jeMei35Gd3kuaup
	KGfx2rqMeAZgiWmvskKTFxifbEHAHFPZnn6VwWe6hKjsmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h8rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:08:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92efd2ca21aso597121485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786975715; x=1787580515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73H4Wybt7wskLAo+yX+hGB0G0F78nZdnr+eiPJjGEk=;
        b=ZmRJpJAlyMUU08f2FniCEhe05zMEEny6j8BtUao70RXJv7G0RggE+BsGnvetdGtH/v
         y53BuNEjps2qAlCbT3lnuhEE/y8mE4jC858e6uTjC9SyZdsPzsi/6JnZJGYjdJapZudD
         4jx+khYQc09G3jAHNngqeftVvqUf2yCo+p51Z6i4m2st50tZcMYsPNiV57cByrp9YZdh
         EdMKN0CozDDQgvzVM8o8h3Dn/LUaow5qZ3a1S9gtHlHkgSVW4XZ8Sp6p+W9su7llrMph
         7FV7P9FVu6zY4NlcI7LBwYTg+Y3uwTZFpiN3R4qMNLVwKZz/l11BAXBKVMiZKBeOLxbV
         qHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975715; x=1787580515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73H4Wybt7wskLAo+yX+hGB0G0F78nZdnr+eiPJjGEk=;
        b=pOcmjTY2CX9v85SjHY3uGn//xVGRp3EC3stKwlA2hTbS0ET7vLjPTgeVIOuXGHiz3/
         2EFMtyHHMn+AVVj6EwJB6PJlR977NW0LMT4hfaJoFr7nCHZ594VAmkTEO3YNhUF7U+Lj
         h8YQ5FBMmhmzsby6j7LCnfSd0VhjX6NCqPZBo7q5ZcuKLWB9YeotXJ8shGPMJe+aB1oZ
         /mNceskcnFzYYRFSV24ag1tJ8rX/T3qgoulzdpbHITWdd1QujSe1C8bcoWxjmiqd9CfU
         e14LJAPMcXpc6hRPYOJHh0FVxyUnrr+g7b4XaymnnCafyPkdNIGeoLgJgSWv8/u+4Zyd
         oCbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/pjeOMWBzqn46PAnzZxzQQXVskFZVe408UPpMw3+uwYWsygYNDtWQMGp4VzcUinOSsc09m8HJOjIfLDxijc7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwCekuyMtWHQMVeQriKWNitUDQSBmVwd6NTQfBwjAIwBuzAcPVQ
	s7Nz2ht7a8pPUOBXUgg+1Eok/aI8jhhWZVny/xUCGpPfn7r+UtnMrrIBJJai0qWzzspRK46AZA5
	22yUhpVDotAUcCogdEXZUk5Sd+2s+7HtH/F8LqBqcL0aZabw+WWSIMjE+p6T4tr6FjPnpLPSqw7
	8xhQ==
X-Gm-Gg: AR+sD11QeoDn7D6wVOx0V4ZtECYjckFLV7n0uEXvkfSlzLlrt+jDJTlWaoXFYyxDaVW
	g+iYnH7HFOOfTjgwtbdRnz2priHeVx72ovOzkjn8uFhqYDY2PqEtrFsSAOCllzJxqjp5My/B4Rk
	GTc0qw3rJkGznYDfxMvxX//A9z4f5c02CrjGfrwFntFKKQX0wApEHxb4bJy0jOKf2QPHyjSstIG
	8Z7im7V9WbFLYTfEadoYYvDzCXB4t2gs8rEodWy6aOPt7SsH2gzTZO2J+rCISNKoH5Z6biHFoA2
	DrqyG1FuvzIWbwbon239IZ4kEGNa/kI5ZPialeE2PKZad8toshur0n3ycxLpY+uXD5wpRlbYr9m
	fkZUBz1IiY7Eg3rFhKuF1hDMEpS3sGO0MHT+MWOjRVGvI5Y9shsp6qMv07ayXURaCpiGIe6KFSo
	0=
X-Received: by 2002:a05:620a:231a:10b0:923:8612:f15 with SMTP id af79cd13be357-936d2025d63mr2020361185a.18.1786975714524;
        Mon, 17 Aug 2026 07:08:34 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:10b0:923:8612:f15 with SMTP id af79cd13be357-936d2025d63mr2020345785a.18.1786975713522;
        Mon, 17 Aug 2026 07:08:33 -0700 (PDT)
Received: from leviathan ([2a0d:3344:316:5100:f22f:74ff:fe21:6f68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31543sm5005404f8f.4.2026.08.17.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:08:32 -0700 (PDT)
Date: Mon, 17 Aug 2026 15:08:29 +0100
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <aoMV3TX0hgTsj3_m@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
 <an8xTBiCy_PEuwZi@leviathan>
 <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
 <aoLR9BPGt4Kzbr3y@leviathan>
 <92baff04-d30b-4174-b5f5-87b24e6a1cc0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92baff04-d30b-4174-b5f5-87b24e6a1cc0@app.fastmail.com>
X-Proofpoint-GUID: jpxUqPqad23RsQ0eUixJWBDzjJBxf7fL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfXyQ39ekvgCs/e
 PoQ+8fxZ5CMVu39WRcP2sSEb47+za6zuak4QjkRn1yzPb8LAM8yr6g4ybrXfcXxu/ineDCf4oK9
 HqH6rojAb799EsQkQ2T33UrHe0iI/1M=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a8315e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=otMJZyyn8YdxdvHBrc4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jpxUqPqad23RsQ0eUixJWBDzjJBxf7fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfX3ygLmrJWGJmy
 NIR86j6RK6fyxJoL4GCmK6UY0F0j2g3IN8LwwalLEp7DETLczLVdM2wKW1MMRL40C2tybIFGQeG
 e7BKTYjmpVf36ig0ehbr3uc8LiJiKwdwklYWoFpHFYm+eZBAFCTJyAksaB9vEDheVTmF7xUrixl
 N4CkJFRzArCc1746WA2ttjpMXzW2uT8Q4r3Fz+b4MrG8hVonBF9FMl4AUTipy4AniGCZFpH22DN
 6IIIw8JHIHZYZoqCmAtW/NbyWVKMczu+OMQB+fLeJBPNBWEEx/6zweQaOE4neT8ghpbtwmG/s+A
 bckfqhRZhxUcA7mEdfo+kEKw4hVa3leekme+JZgWovhdcB7eAhkCl5aRrOKfsuj6byAJSRM0c+5
 eYskE+ne3Myx5WVNMnlq71sip25piaiE+pWsMOitZ9l37u4MQvoUkGLkV/tWpovpm58n2pYnLRW
 8VzmlZfVWQHhWYpG0uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_070852_920080_CEEA5893 
X-CRM114-Status: GOOD (  51.14  )
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

On Mon, Aug 17, 2026 at 14:00:16 +0300, Ard Biesheuvel wrote:
> >> > Is it time to update the boot ABI to say x0 will hold the physical
> >> > address of "device tree blob (dtb) or EFI System Table in system RAM"?
> >> > They can be distinguished by 0xd00dfeed / "IBI SYST".
> >> 
> >> Let's avoid 'boot ABI' here, given that we are talking about an internal
> >> interface between the EFI stub and the kernel proper.
> >
> > It's an internal business in the topic under discussion, but if we
> > were to change it, that would mean updating booting.rst, which I
> > consider an ABI.
> >
> 
> But not an external ABI. It documents specifically how the EFI stub
> interfaces with the kernel proper. This might change at any point,
> without any obligation whatsoever to remain compatible with the
> previous method.

So you're saying if the kernel proper decides to use x1 for something
else, we'll move to x2?

I agree that in the context of how the stub calls the kernel proper,
this is not ABI, but x1 is one of the registers currently marked as
"reserved for future use" in booting.rst. So it feels weird for me to
allocate one of those registers for this internal use then not mention
it.

In that case, couldn't we instead pick a register outside of the
reserved ones?

> ...
> >> > Minor bikeshedding below.
> >> >
> >> >> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> >> >>  			pr_err("Can't find property '%s' in DT!\n", pname);
> >> >>  			return 0;
> >> >>  		}
> >> >> -		if (dt_params[i].paravirt)
> >> >> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> >> >>  			set_bit(EFI_PARAVIRT, &efi.flags);
> >> >> +		} else {
> >> >
> >> > This condition branch doesn't in fact have anything to do with the fdt.
> >> > Should it still live in fdtparams.c?
> >> >
> >> 
> >> I don't follow. The EFI_PARAVIRT flag is set based on whether we are 
> >> using the generic or the Xen-specific set of DT properties. What would
> >> be a better place to decide this?
> >
> > Apologies, I may have commented confusingly - my comment was about the
> > else branch:
> >
> > +
> > +                       bm = early_memremap_ro(memmap, sizeof(*bm));
> > +                       if (!bm) {
> > +                               pr_err("Cannot remap EFI boot memory map\n");
> > +                               return 0;
> > +                       }
> > +
> > +                       mm->phys_map            = memmap + sizeof(*bm);
> > +                       mm->size                = bm->map_size;
> > +                       mm->desc_size           = bm->desc_size;
> > +                       mm->desc_version        = bm->desc_ver;
> > +
> > +                       early_memunmap(bm, sizeof(*bm));
> >
> > So to restate - this function is called from efi_init():
> > ---
> >         /* Grab UEFI information placed in FDT by stub */
> >         efi_system_table = efi_get_fdt_params(&data);
> >         if (!efi_system_table)
> >                 return;
> > ---
> >
> > Before this set, this function called get_fdt_params() indeed gets
> > "params" from a device tree. After this set, this function gets params
> > from a device tree in some instances, and not in others.
> > Which feels suboptimal.
> >
> > We could rename the function, but then there's still DT-unrelated
> > code held in fdtparams.c.
> >
> > If we go down the route of passing the system table in x1 on boot,
> > then I guess the effect of assigning efi_system_table will already be
> > broken out. But should we then split the mm struct initialisation into
> > separate DT and config table helper functions?
> >
> 
> Not disagreeing but I think it is fine to leave it as I suggested at this
> point.
> 
> Some additional work is needed to get rid of linux,uefi-boot-memmap
> entirely, and until that happens, passing the EFI system table via
> X1 and linux,uefi-boot-memmap via DT is not a huge improvement.
> 
> linux,uefi-boot-memmap is needed when SetVirtualAddressMap() is called
> [with a non-1:1 mapping], as the EFI system table contains a remapped
> address of the config table array in that case.

Of course, the devil on my shoulder suggests the stub could always
add an address fixup handler for the config table too...

> There are currently two remaining reasons why calling
> SetVirtualAddressMap() is required:
> - some Ampere boxes crash otherwise (but these systems tolerate SVAM
> being called with a 1:1 mapping)
> - kernel configs with a VA space < 48 bits are not guaranteed to be
> able to map the EFI runtime services 1:1, so there, SVAM is still
> needed as well.
> 
> Both can be fixed, and I have been meaning to address the latter by
> always making the EFI runtime map (which is essentially a 1:1 map)
> use 48 bits of VA in all configs. (The ID map already does the same)
> 
> Then, the former can be addressed by installing a 1:1 mapping when
> calling SVAM.
> 
> That would remove the need entirely to ever call SVAM() on arm64,
> and therefore the need to pass the address of the EFI memory map
> separately.

Makes sense.

/
    Leif

