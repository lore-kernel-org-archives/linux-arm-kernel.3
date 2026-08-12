Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC40C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=; b=2SJJSUQhsRMXQWmD4vf4VwwzUA
	KKhotNdORg/IWhP7tVbxQR5fCQpzZQ/3e17JwD2THGNgoMfFCMP3ObzyoPFXyyl5Da2OaaylsLHAc
	RNDkP3rWI76uaGR87/rFAyX5hPHVwnS5gp9YHMMVXRYKsqOldYy55IiH/CKqQ40QyQf6X8hCL+SZS
	LrPuFzRnvW2+boT8GwfLe4Ta18eGYdbUCK0h4BcsJ7AOwxECBE0lViX4pZbU1LUUawV8CGl8VX/iv
	iHhMCJvr3DSMxfqdRrXfQ35VV+UXClncJbE5arW3ih6DbBVuELBR0wrezr3B9Gs5pD+mm4Sl4oTRD
	+Vfy/D2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7p6-0000000GA17-3SYF;
	Wed, 12 Aug 2026 12:12:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7p4-0000000GA0a-3n33
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:12:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1639529a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786536761; cv=none;
        d=google.com; s=arc-20260327;
        b=srAdNs3sPx7EYkRozFKGSxSQyyRvzmXDjVULiWmAlcUptU1jekA/CAWmMqZmxmvPks
         VoCWdogI3CwT6EhhWBBaUJx/PueDehtnOsVQC1Fq5odjOhNP9aUAOntJJZVUWvKAtV45
         KQti+D+JydPlumPUruQzhbxn5pXbDmJ0nzDLQih45neljT903Fr4Pze5kuZaAtx/JJYB
         nVUX14bBoS1X1iivXVg+cLGeRZhKGNqNDb+l42Rfda0knhLvbLWWmS4YnMnvJpE6KdWq
         922qxxlkMkE/LQhraXZ0hFHnIsxDe7hO21yr5/hLbiSz3qUYN/MOQ9eetSrZKKX1rFzV
         +krA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        fh=IpqDO53Dx9A0aNOul6bN8z1VaWLjiR4Nd6d8B5xSClM=;
        b=FmnVUwHHmSqpOqmHy+uC5eQQLwJB7UlOg8dTlPg1Kcw7Y1LF4JgRMkqdPBcgZtf1Kp
         nLNmDjE/00p7dd74+qnUvIlmkvyTvAX0THa/mJiRiKAZteb/MohBs/xlgjVN1nEAZ+Y/
         w7YZCPMUTKFIDtP4KZ5bEIbw6AH0eq+Z7DkuacN+koIcYv4yicbIzfuFgMJFAfVD9Lax
         qKaU+qZnsuWQzAYKHeoNMDjs0zugHXnSOOr92oSQhPcg5PzM9mJD9gVu46B3YIQvPhuk
         LQNJTumZZE/N4Kv/7i1Mhf2Ixj9B1iyqXNk/2cdWAUU5abqWAhF6YPIaJ392nCwWHHP/
         3u8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786536761; x=1787141561; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        b=CjJiELu1ZRXCMBjnoilCnewVAhqPSEFjhBp8GrLcH+vNzob7df4aoJQpzieVTuprod
         pVtaKKoMc2WQ8GvqNAPzj4kznicLNloSncoQaL7FV/b0sMK9CSCtEMfYAH/60SEQI2DM
         27v+e7z9kU/jpgDRBRgo0mRkf63CIafr5Fqc+WbSd7WM1TznWWR/SM/JhaIh1LMfUK8m
         Wa3jWHJcZS57u21yoQ0siwCAtGjx6DilVrJcK1yCtpYRfz02SL3VAm6+VS58hTUIVJoI
         7pVJ0H8sfMqIp7uTHF8/wzNdxEgGGB1l9RnlNY/7qga76au8MuFom5YkHeJgabUqPpe2
         V0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786536761; x=1787141561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        b=ML5r13uwkaZpnGXb83AP9EWIktQPEuVVz/eM2x0YzFeJ6R5/8pkuUbHZa9W4sUoMvy
         iMI2IOFU8gnF32o++vXbdpdmBGOHIYA9eSVAQWlTFWR4ojKJlD6PL9n/AuGKoHYiMwg6
         V3sr7r8JRs3nuunvnRpHlDdfEmwgEczftPEfmzG1pTYa0iO0hJc/KSPXJu3SLhCdLXVW
         S/nQmp7ANQdTFBAa9sRp/5sFwIP6I1XvAn24ts3Y78mPLncpRwgXDMgWtC1/9I0qywhg
         KzgU+cZ1SS2L1g5LZ9AZz2d1LF16G2brSVPQisR+8J9xuDUP3ZhDEzgnCpb5ACoJICT/
         ydWg==
X-Forwarded-Encrypted: i=1; AHgh+RpRZ67RrWicoyz8Nx6EZWIOmIik3oG9+MDAE9OkvVxJstBVjHc0mZCaQT2UMB5LkZpFGKiLDnh0+333ZnG+yubI@lists.infradead.org
X-Gm-Message-State: AOJu0YwfN/HmlRoP8kbMQ+nbyjucGJZsafz0nFdhZcLwbTHJGiM12xhf
	hSjfZtSHqoT7VWhQBNvaedmHDyZe2sH3Swt1lt6LGDl/tKbnLBVneHYDGAGGNe29CnlLIRhpa+p
	xjt8S4KMIdWWxfwECW8kBxXTf39JFAFTqtSvL2VdZhw==
X-Gm-Gg: AR+sD12KA+M0nQzX4z5+R5PYPAx7y2t4falmcRQKtCHgAdctYyFDCTHT4CMgN4ZV8eb
	KjjuKso7r9vrrAdYyD6ZaEg+B/yRjcmu9Jej1IfZfc3pJHLLJ2jlq1/RKlMg7/yiPaP3Ll1ChNl
	1pKZLmLKXt/rRxHWfD4YYZAyVuxdnfK7CREg2Jwnz+KomqLy154rcga479bFHA22AVMHO0wsUkP
	+aat60ulbu4hJ+li9hUCQywmicYZSRlTrDLJhHK62uaXntuVz9531dbfkomvkQ1xZB9aafJ+k3M
	mcvR+5Z/6cm6zh7Xilr1rjqwVnJx2vpZzYQ0A3jasVgkjCLfwOmcxCyl2HNPQbvjnKj4nSz/wvE
	ZJg==
X-Received: by 2002:a05:6402:5415:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a375eaed7dmr1884024a12.4.1786536760363; Wed, 12 Aug 2026
 05:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com> <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
 <20260810141553.GP200537@ziepe.ca> <048c8d59-d47d-4f64-b93d-3b041636e230@arm.com>
In-Reply-To: <048c8d59-d47d-4f64-b93d-3b041636e230@arm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Aug 2026 13:12:28 +0100
X-Gm-Features: AUfX_mwXOifN2coQLoTdXQNBH4WeSdADhQh1-gynQzc7tMiJ7JxOqAB8IwzRDWc
Message-ID: <CADrjBPpPqLaq75G4Rzxmf2VEwyZ_gwchf1f-jjzr3EXLkXaWsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_051242_978017_DE5CF951 
X-CRM114-Status: GOOD (  22.28  )
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

Hi folks,

On Mon, 10 Aug 2026 at 15:43, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 10/08/2026 3:15 pm, Jason Gunthorpe wrote:
> > On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:
> >
> >>>> @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >>>>        if (cfg & BIT(1)) {
> >>>>                used_bits[1] |=
> >>>>                        cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> >>>> -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> >>>> +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> >>>> +                                 STRTAB_STE_1_INSTCFG);
> >>>>                used_bits[2] |=
> >>>>                        cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> >>>>                                    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
> >>>
> >>> This adds for "stage-1" and "stage-2", while missing "bypass"?
> >>
> >> I need to follow up again on this point, but I don't believe currently
> >> we require the override for Laguna when it's in bypass.
> >
> > Oh? Why not?
> >
> > Is the issue the IOPTEs are set to no-exec or something like that?
>
> In general, there isn't expected to be anything in the memory system
> downstream of the SMMU that makes use of the Privileged or
> Instruction/Data attributes, so I would assume that is the case on this
> SoC. FWIW, hardware folks would be quite keen on relaxing the
> architecture to say that an SMMU isn't even required to propagate those
> attributes at all.

As Robin mentioned above, there is nothing downstream of the SMMU that
cares about the AxPROT[2] Instruction/Data attribute. So it could be
added I guess for consistency reasons, but it seemed better not to add
any code we don't strictly require. Maybe a comment should be added to
_bypass to explain the inconsistency?

Thanks,

Peter

