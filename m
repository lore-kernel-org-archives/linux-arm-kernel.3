Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855C510775E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsuRFxkPyyVGgkdo3YU+Oq4DrkAHZ3cwxEXT9hQFB6Y=; b=dgwgGVQclE/TZOX/1vHSLH0EkU
	0JmxUzHp7l6p/PLiHZa+BUEm42sE7ZP44226Ua2fxRnbX6p9ZfLvhD/hFCAT6xzMUQYWQIvpUJ29Z
	GH1wQmHh3GbC91UTr8Kf2brz0l5HOnGnkaW/HR5UcorTIxA8GiPzIlKohegR/Rkr02IS8n+QgD6Fz
	TuhI12XIikONvE4Qn04jmfOy+3mqJ7LwwmDvoQOHB9WjizoFjstvnwUcwzchlelhwC3uyW5jOm6Xn
	1Rap/mHzCTbNVKqNQ6nKEsPyeLQRmaNUAhMgs884UuHr0c/1D8/2Dw8OvDzBepHflsl8fMAmHIMmr
	/x+nDIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tY2-00000008u1i-3KOc;
	Wed, 18 Mar 2026 16:15:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tY1-00000008u1P-17rb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SsuRFxkPyyVGgkdo3YU+Oq4DrkAHZ3cwxEXT9hQFB6Y=; b=GH387wffI3QEOhHLBCSAZ2MHoF
	n3ig/5CvNnqTg5XJc5ph3KS2f1Qa4NQsy/mclqdYz+2WtsaQqh1IbTfIDF5dNCDrCniQImqOPvJmQ
	Yrm59qv8z8vBGchB9Yy2KMJgKOhqsLXbNbffhZa0cSkFkCI3ez9ZS2xr95t4a0f33qolLPl73jngM
	3RQw4C/uDgEwpaS70kwd7KFpvIR16kpqUq+1v5IzivI9EekZHtIFUqf7d9YFPRntJB8b5cJzCN+Sr
	lAL7kV/gZrMy1tRFuhdgp7x2S4aRvT1xivBz/STcdCMnbMkrcxHJvDW6SGrGzyfUWdR50CHkhV2gX
	u3vt7Crg==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tXx-0000000BgjL-43j1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:15:03 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50906a98ffeso597071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773850499; cv=none;
        d=google.com; s=arc-20240605;
        b=aZeQD0T08DeC/9ljhGxFjEWFH40knqc9qEKPmkgbM969+NQnCzu5rrTe1NNxEpx5C/
         LL7hmRfk6j1aNgvxpHfebusGeE9dhg61ATW2YltElVaSYPNe/fB5v2LabyI5GLWq00g2
         3MAI9bXS+GMI2iCADdM0hrQxDSx8LC9DWx3t392VupOCLFb6N0+8rLYVsK5An8QZz7kr
         RdJWPZ3bCrzN2RzXw8ZbrJyINF6JuNgh1fkBfDNgMGHVM7YccTFNOj/amMLlueOCxiQC
         G8suv9BXeF2aSit/7smQYgdccofnRCMUhl7dHKR4MNHwKuLIyMhxeODjSPet6C75wMrz
         M9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SsuRFxkPyyVGgkdo3YU+Oq4DrkAHZ3cwxEXT9hQFB6Y=;
        fh=YXZsoi7bxXiT/m1tKSSIinHhX70xi7VnAw17Z1rRoYY=;
        b=DMvYefp8L7TTVdPFmHx4zKLzrHbIkp0qTKLBTQ+HuUL2HzRgvQs1TrssaJzTVhmMiA
         xROCsl14LuqUEjNZkF8rGUWuIG4TN+g4WanoXuUwXh/QloaKNmnVHpZEbBw0+mNbrLGj
         uMiJZbrcCXBShANHOhKlQrmjWZ6RXKvnxZOdSW+fmJ7ASNi9CP6ZnWiOaleXt2uxD7V+
         /KcZOFdTYTjMjXTmPaWNNu/XLRirBbtw+cJZ1/pQ4CySeH+M0HR/v6EPcnS+w4ZWhgjB
         06S7aKPa7muAzSDpvAwI6wzpUgSqT3nRPYTS3u/z8c44/yCJU8ojTekHcRenrGApSN04
         2XaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773850499; x=1774455299; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsuRFxkPyyVGgkdo3YU+Oq4DrkAHZ3cwxEXT9hQFB6Y=;
        b=r0en3gZMbidxTvEF6Vwhaa2s1fJKRsA9gOvj5SvgZwtiaV/+saEVPyG0gvPZUfUG1y
         KQX55n4nZBMGSqiWSX+PuFiXGF1+FCnah7k9E8qVxQfj5/bv7uV/qW+FEbfknNZhOBck
         Wvi7JQ/ClNmfhm5HAnwjxEaYaHzSM3b2O9SPmZQuMmm6nl0MVL3dcawZR6/b4FRYkb6c
         Y/ghB3WXdTT1j85XwAjd5ciK3UhoywAQ9d25FFy5dSA+jiUDn4XDdT73BBzHnZlHg4cq
         oFTTG419kb1VK0OtPlm7uABnMsj4y7eWxQGYSEgMqyQGM1SwQ+9ddF8mZBh+3KgojdNM
         rVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850499; x=1774455299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsuRFxkPyyVGgkdo3YU+Oq4DrkAHZ3cwxEXT9hQFB6Y=;
        b=Iv8W36wAPZxGqXIqrfszIHmz7aCHjnH/A90EXvj4rtqQArurE5wZz4scXGSphbeXTp
         FScPHRc6dXy0Af7U174UVi9u3sdiVWkJZzGcKXrXwQt5qyanSNqADXfFhbPG7hhqbDVn
         dNjvpBIk17tJgXwabOzAsniC3xqKChQeMWA67OTVtta4kB+GblxUqfhR8/OPN/rIU6wr
         KHBYoAgVNuJgRFwsa3/DnNV3Jp9bS2QppTuB/vnnXjzbAfkXFmdza5uQoiv43dkaddcd
         ce5vio6yW0nDLVH7rvWgaRighDXXNG4cmE5klLdfXFllzDaIorck2r0OY8qXhh8MK0ny
         0y8A==
X-Forwarded-Encrypted: i=1; AJvYcCWaJNN3q88w+0DNhr4mnV2fny3yQ04dtpCtZg28y8iGajq87vA3JdmK/tOuxLDrwMNPvwSitX/gxBlO9Y7xsK0Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrhf4q4yytxRs6vBpNag+m26mULe3Z4h8Be8GOVY8hlILI0rEq
	au19cVthAUmq7FjxBdogslKjUSrbGFJvt1hBujtHUvXuoM5+4Qrgeo/R/FLzaL8Po3HLUY/0Ng9
	UlsIWV5zTSqbbXmw2nNkkm9ohp1HtRjeCq5nkvBfX
X-Gm-Gg: ATEYQzxwpyzNpvEGjDE7ncfsXLu9aGZz0vvn3MoqweAu4AX/9b1i26dLbvYxkLCu7LT
	6c6d014f9TIBzDrUbjSSJfNtNlQF/jPBPWyGmx7oqyOU85ZbyM0HPr6R4aDUONXxuXzWIp2Jt4x
	KlKwRRiKV8ZXj6HDJ8brcTrd+9cHCAovtFjIV4lA9rb5QZ8m4IaAU2auZSngCXNMbA88gk/LaKL
	3wQi3/A+ocfr2/YCNW5QrEWk04vtace/9qj3fDo1nbwbPlgknPMyuj2NJAoVzjNoDrX/7anS4Il
	fEABfBHg/4CKzCo79ttgQp0iWPfkILWuMKonKg==
X-Received: by 2002:a05:622a:1ba1:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-50b15a39ceemr14465991cf.3.1773850498064; Wed, 18 Mar 2026
 09:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-10-maz@kernel.org>
 <20260318142215.GB3915656@e124191.cambridge.arm.com>
In-Reply-To: <20260318142215.GB3915656@e124191.cambridge.arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 18 Mar 2026 16:14:19 +0000
X-Gm-Features: AaiRm52R1KVo8O1bCSfrDTwrCK5ONNhPNzMB6IjRQpBSlu7SdfMD-LgrxUnYxG8
Message-ID: <CA+EHjTwbxTHr_fzSFD38cG4ZMj6XKr3L=o+=8T13XDQF0n6Raw@mail.gmail.com>
Subject: Re: [PATCH 09/17] KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_161502_130948_2A6FD9AB 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Joey,

First, thanks for the reviews and the comments on my series. You're
right about my changes wrongly editing "page". I wanted it to be as
mechanical as possible to make it easy to review, but it ended up
being too mechanical.

<snip>

> > -     /* Mark the fault->page dirty only if the fault is handled successfully */
> > -     if (fault->writable && !ret)
> > -             mark_page_dirty_in_slot(kvm, s2fd->memslot, get_canonical_gfn(s2fd, fault));
> > +     /* Mark the page dirty only if the fault is handled successfully */
> > +     if (fault->writable && !ret) {
> > +             phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
> > +             ipa &= ~(mapping_size - 1);
> > +             mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
>
> I don't understand this change, why do we need to mask stuff now?

Let me see if _I_ understand it (Marc, please correct me if I'm wrong).

Before this patch, fault->gfn and fault->vma_pagesize were mutable,
and transparent_hugepage_adjust() modified both directly. In addition
to this being confusing (which gfn is this: the host /canonical or the
nested one?), it made it more difficult to separate the logic.

So, to mark a dirty page, it did this:
-             mark_page_dirty_in_slot(kvm, s2fd->memslot,
get_canonical_gfn(s2fd, fault));

which relied on the old struct fault to calculate the canonical gfn
using the (magically) THP adjusted fault->vma_pagesize.

Now that fault (or s2vi, its successor in this case) isn't mutable, we
need to get the canonical gfn using the host mapping size.

Cheers,
/fuad

