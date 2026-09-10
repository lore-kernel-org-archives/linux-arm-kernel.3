Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932CCC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=; b=GCk/5t8XTI84+d4jHUt9JH/gHC
	w9cZg5pZ52uwRi9GF8YweeQHMaIUeXNAI+f1WqFFKByKUXA35frym7ghNHe65mX07i2JTkgONaTJC
	9Fw0Ig2Bg3N7CDTqiS3cWv6Itdtj05rK6qYw3VLd2kX6iOqZE1ZgwG2vvpr4EBEVzbyWu6+eUwt/J
	F47MG5KGayFfklHk4nHTzvnYifnVYoJmW+sflydTROsg4o5i9dBq/81G8YbVtKYmIJvLDarQrTYMG
	rdcmlCGDam7T+qKgfUDgCmSJfXL/0pely5yPwd45SAu2Tb9P5WvWs1K3DlfnzxmUpQgH7wgaiWrM1
	p760+hbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZUf-0000000DfFe-2JKM;
	Thu, 10 Sep 2026 07:46:49 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZUd-0000000DfF4-0VRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:46:48 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843971bdd0so744125f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789026405; cv=none;
        d=google.com; s=arc-20260327;
        b=YZbHZXGAPPFDkXPj9/U+W55Zfz5zLZIq4q+6XddCPEswWiaHVCFY3QtfNLKRp2Va2n
         3cD0WpX+Xp+aOkSF0egzmBKo5HqQzlPc0D8/cKe3Z8dtXHZWR4Jhr5iTnrNT+iJTkBnX
         2s9OrXxLKE3J1eEcIG/h4twMG/EjqkAKiz2ocH33MggDm9mIXOgSQGh6yboyOntH+p5I
         MaQgedsFFEm22s+essMkruUD+RTSowbn26orAyoDeiMO8dWNDKmsv6yUnd01GgZhDZqe
         0UvLJ29qODVOcvC1FwcVkViZv3Pxwgk6Np09W6ky1XVdDHCBB/+RxkRS6wys35nM6bfu
         eqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        fh=9g4asAUY17gzJUhSzrfTj3yzL/NFZ0b+SUZKMAzb4Q0=;
        b=MtsU1LJR9QKT6gxn++huHmKCee363KgoS+XIe8A4CJ/8iR/g3o7yMO0BRF6EldQeg7
         lHQObWhb33BFOOxM0//lbEHei2gCS2klbD4Knsui1qSuq4CQRBjV0+Oaf7K8LzAatJA3
         ddicCCun2DntBdjA5bF5I9J0uxBEGF+QzKiae9k/qCj5ERujLEp5LgaD11zSvcQgNI6Y
         rDAmoPnSp5i1lf2PRXYdXWGnfH6sXzeudYgEHqnXPxiCm9WIAUGi6AsmAqlMCIm+X/BN
         /z4G7klrjA6kVuODI2rvbGHYvLKtsXkr4ir8yllDfnxSv72geLqnR42omRDzaGvmpDOE
         2a3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026405; x=1789631205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        b=QN6JZXyC+GWeZywqAqotpsWIOdpkcKI/oC41AVbOkq58Ae0ey/euadE0tFuAx0V9Lq
         1V4VvAurfb0TuaBAoGUi6TCmFwIvdcNzzUK01SsPIFqg8ZODYHveQL2qs/lmW5e6tc2a
         TpXrEChcM8FIKeAxneqgSMxMsZFmjOjT/dYdWTsswVea9HJfu08Yf/FNFSy9nnsh57Vh
         5oI1tv6dzK4H7I519tzAT5e5Hr7Vq7BO+t9/7Zn2D67n19w0c0D4AiZfhooBbgozdKy6
         W6AM1HLqmc7nrjZR9d8o2xfpQZYOYQzBNkUQSPzPnIr6zJGD4RbuPg3HrZs4ZqJ6LhWw
         vzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026405; x=1789631205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        b=Z4M8+DnXVHS8me8Ka0HCffep5rlxo5VnQqb8ZY0yPtounVsIJzLaM/kgFICaOrazSy
         0J7zI2EEY7B025YHIdOirb2ICv64c/koSFH8RjoKcYTQmknmtaLHkqc+oJ6EgAz+wRWg
         i2JBWhVDgJ2hsgBYP2MfSKrzf9bA+0c55mUXTbcGXs1ZFLGfm3mOVbg7hWCW5DixTnzU
         ndMZCJ6VDRyDivigIHeEZSKk7aAQoJPG5/f2l3ykiNMs8RKYdJB5/796e26LM/syyYuc
         Gi72xSTVuXsmJ3taTQf7rrxgGgWxTQfSIoYuNjC5jRDSpyaJpgEbgDKmRI41yCHtdron
         J7cA==
X-Forwarded-Encrypted: i=1; AKwUvBz8SHAAj8kFmOqKeynfSSUMuPnEwHH4fJJcfwh+0LubQjXp82eoSxCm0Y9mVMIePBqkb4EsQZzSkk6+pLGYXEMi@lists.infradead.org
X-Gm-Message-State: AFuF++kD82F843QIeEI6+s5pOdChbBgxFnpXlDNxfU8ktlDiNza6GWTf
	RVYW8svkGevuYAl+Aj31LWvPz4I8hGp80RSQX3pSAIpDFAIN132VVLNGY+fSIxmf7FuBkdA2y6E
	V0HrTStrq3IS416aAJgLBR8VMhGRNOkI=
X-Gm-Gg: AYBFou33BSpofZ3oiMeGteU8zMJybdq2WLhRU2wpmYvcbG5KU9X613YjBr5Q+N8vDtX
	Ey+s1FppyErBf+04K/UuZwE8CnehEFNaEa9wPyMRyB0Ac/EjF5DdbOjKrS4K65iIPCQ/mIzoV8P
	fYaXyqRSxZqPMDZ3zSg6mpzB6+jeleHqV2TYScGtrZZweeGfPqDTKj+AJfkqZ85GAQBkfpWPMfi
	fYHtUNgN+XBd5vo/Km9cVguxqNob1RlP9rPQp9Ksx0y/oOAuSkdLHnbMCjOd03czjmiTGWe9naP
	+iRInzx0n46R5YZEMTwR37esc1hyAqDo0YABN6x5b2ip5hR+p/dNU9TQJUH0SBbIfBafVBkLrTn
	8E3ygVBIKaWww7iaaAf1QhXZZ9N4vY97HijrVldBRrilGEEZ6Uug=
X-Received: by 2002:a05:6000:2f86:b0:485:82f7:9053 with SMTP id
 ffacd0b85a97d-486d0de1a6amr3798843f8f.1.1789026404909; Thu, 10 Sep 2026
 00:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
 <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org> <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
 <aqJbFXjU53_D7SoP@kernel.org> <401e3beb-e2c5-4241-831c-005ccfb22e34@kernel.org>
In-Reply-To: <401e3beb-e2c5-4241-831c-005ccfb22e34@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 10 Sep 2026 15:46:32 +0800
X-Gm-Features: AcwNN1XRAKyh-nKS165ym6trfmmgm5ZhN281YBrKACOabVg8q_Fxhd9PqW2nK2s
Message-ID: <CA+qSx6yZ4R5_n0PvYMvt-vU7CfsM3YEjHxvBz+N4ann=+BQzdw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_004647_178094_E8552FF4 
X-CRM114-Status: GOOD (  16.43  )
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

On Thu, Sep 10, 2026 at 3:33=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 09:24, Mike Rapoport wrote:
> > On Thu, Sep 10, 2026 at 02:22:25PM +0800, Xueyuan Chen wrote:
> >> On Wed, Sep 9, 2026 at 11:18=E2=80=AFPM David Hildenbrand (Arm)
> >> <david@kernel.org> wrote:
> >>>
> >>>
> >>> I think getting something consistent for now is the most important th=
ing. :)
> >>>
> >> Hi David,
> >>
> >> OK, I'll move the highmem check into set_direct_map_ro().
> >
> > Consistent means leaving highmem check in the caller ...
> >
> >> Should I also update the x86 set_direct_map_invalid_noflush() and
> >> set_direct_map_default_noflush() helpers in this series to skip
> >> highmem pages?
> >
> > ... or checking it in all set_direct_map functions.
> >
> > I'd keep the check in huge_zero_init() in this patchset.
>
> Agreed!
>

OK, I'll keep the check in huge_zero_init() in this patchset.

> --
> Cheers,
>
> David

