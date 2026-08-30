Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92617C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=; b=YuigLcbMJmxSmxrITxZ1+0+66L
	jE0q6Gkm0eDqe5rokqBWUpgkaxbJcRfH8WA2kpu6RoavniEIYbK7pU77Gmyk3R/JNjcnSv8wsTuwb
	aFvDM3o7gnS4x26SgAKvv+9Pn7NXhIAqKZyxqpp9eEhlv87wG4FdS+uwdDhb+TAx+WezToO4Utzt0
	nz+IcnNObj2em44316nAZXa3dO95zD2KA8vSMUsNpmpZaX4kFoYsNrglVEjAU8RcU8x5QwTlzRd07
	Q4NmrBJbdlTLQ5DmE/+4LLTQe55gyU5igueppv2BJTzP2kRjgh2tf8+gYdiZ6UUY/vwLO5kR1wXhX
	nXhSZhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lRH-000000081t6-4B7D;
	Sun, 30 Aug 2026 19:43:36 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lRF-000000081sk-0iWw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 19:43:34 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c01c79467so267111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 12:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788119010; cv=none;
        d=google.com; s=arc-20260327;
        b=KGdpKazaYS3GgAnFhnlaqOfzwThkLr/Yyb8ytReFQXWF0BwWh0Tzv9Cw1Hxa1QQ/Gz
         n2dchyhGe895oroPLg7XNlz0ynnH3r2mKqvM6lGSCKIlJXP+0rcgEnSmR992ziwVHhFy
         /qXE079oWXpqORlWa8pG3weny4qJesVYdBYf75cUyuClo43pmOccYaix9Ddf21b50nzT
         TUDjRAUClA1N+KegwbPhX1QPC2EUj+Ud0PRiqsbBN2SujAiHgn5TO3//0ba2iJ8bjIud
         Q3Ndw8necFZw0dBCXZSg8RkzkbX2Ta91EAYCop1KkPeFjWdRuuynAHk79D+NR7YEGv2M
         2D3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        fh=7e+lz5ITzw7m4EtNw0tVE+2oG5+zlFQrr8BJhc0KS8A=;
        b=C7i8W52HxE0Qyt0g/v0fJkNlcn5w0sZslx997Kf66P7MUJaZRQKM9xKM+AeaKIRCJu
         otqUqmj/papL/uzTO9hWRan1hpz6qd44pVf5Y2sM4qj3HVYtha7VQ/3fzESZBnCR3EEB
         MljKpF3x1Fr8spKKK5O5LoSVO0zwXaaQPA0x7S3e3dD5gxov0VwVxxBH2jPrD6RS9nRd
         B/qG80pLFugJu1HwZWK7ryfptELLw4PDlSUIcn2A4Cq8sSvsSRntPX4p0PjoiqHRX2P9
         Gsif3L8K1B8s7GBo914Wg1tHfU1ggcUOlWMhHM0JOeJFyjc1O/L1qp5ty0J2dde5MnfB
         y/uQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788119010; x=1788723810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=duA99RQaEuinDGTkQ0J/t54pkxWZVEq7PBJtbQYXgFqXKtmj1gBTI3lcIBuKtvtMyZ
         8AOrgkfFKhuAxigJPaaM3Jkm0CNrU7jZm4+Hz/kCOQUkmBBtxF0vHqeTTxUat3tBtgOe
         1Y6WgEsg24sqlXzEpKn6VIK9L3vjtv5q1dhLf/ZA6OxjB1kWwJ9mcAuUkTOtE58n/It3
         tRa+2LlJ3XX+8/Tw2BwhS87klcj7REsFOLiYDzl8co+R4rKANvK/nnksEXLtODtFMEub
         1zsrK/PIwaCx60xJypDsYcXD/xdwtgIc8E1vOLf88gsomUyLhcBlL+uKCNe2bQTBRv+y
         0jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788119010; x=1788723810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=T5gFDFg7Fhhrd7CqWUzUlsm6lKHHv5LTxBtKfpsKrp3phCF5NSQRJ8jgnsqgpvHmtT
         uEyoJW8chKRgG8Ej0vZjkySPXDcHCa7nPh6iTy/6RSb4hDWNSmVZNqV/2hkRcXPiVnZ9
         g4emNnhccLQ5au7uGeQ6qZ5PrZsPJzo/ByOrVVMp2CdugPePh34L1LteN9GAdvJOyOgT
         hPaVbI0S11zxTZZQE4S7KGOtLAWDm4asgqs41olM+ibDhAd9Ls5LwXiaLzAcb0kEXUUO
         haNJt8wxSFkpmLqEm7jDVJ4pfFOfr0EAPJi+w3ZMWwT1EPe8JVNa9NYtjcnBM5on7epE
         Qsdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+EjV7bdCXDxYP8Qc9LE5RZJIQOm2MdnZb+ULjWK/FuWlVbPsX8WXTYwAIpFZlP3lbFfGn/RpUNqkPXt0qFblO@lists.infradead.org
X-Gm-Message-State: AFuF++nKJ9PpYFzoQDSF5GHjEpsdGVyXZAwvbfSywHb1ADpimd0f6wyf
	fTyGq+NfJ6EbwuoevS1IFqMM3/0ezr9eP3K0LV00itHbRtqNuAZYfCfoWiFw5vWXOBknxY8BgwK
	cbVDMBgML9labDKTO+OgX+hPPjaq6ji6Bi4R/rkid
X-Gm-Gg: AR+sD13zuehIEmm9AssnxTtv8Y/BMqsRXoNfu5uo7G2id88u3kPQrhXFZwzRLqwOojm
	FzdOlyBfd400FbLmMO46tYDbeKufp7c/YxsbS8px2mVRcRI/ZVwmWQOEsQfWZ5c1YrR+iWIheoc
	Ph4p5iJ9fqY5wgS7wauglohTmbJ+kQyU9ZAAABHLdsvAkn9bKe9SDyIa6crvQuWYFTdgLLjgZhF
	QMpWSoViorsQhwPTifwhW4fKaz8EHOGuD0OnOmnvErO0PeK/X18iqv7nSyvQOkCLBync/6fOMBf
	p/uy2FoTosJfpGhjhH/S5GRH8i5jQvmbyHLHg1BDpw==
X-Received: by 2002:a05:622a:102:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52ff73ae1ddmr20100711cf.7.1788119009268; Sun, 30 Aug 2026
 12:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com> <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
In-Reply-To: <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 30 Aug 2026 12:43:17 -0700
X-Gm-Features: AcwNN1UIYogI8mjESAIE2AGofbpoBdd5z6oJmUJSI9USsR1cMoCFWy7kojgNdhQ
Message-ID: <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_124333_270569_AEFE3E7B 
X-CRM114-Status: GOOD (  35.20  )
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

On Wed, Aug 26, 2026 at 10:55=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> Instead I'll add something like below to arm_lpae_restrict_pgsizes as sug=
gested.

On  a related note, I'm debating whether we should change the word
"restrict" to something like "update" or "fixup", since we are no
longer purely restricting page sizes, we are adding new page sizes.

> >>>> +/*
> >>>> + * Install num_entries leaf entries starting at ptep (index map_idx=
_start
> >>>> + * within the current table), tagging arm_lpae_num_cont()-sized gro=
ups with
> >>>> + * the contiguous hint where both idx and paddr are aligned to the =
group
> >>>> + * size. Entries in a misaligned group are installed without the hi=
nt.
> >>>> + *
> >>>> + * idx and paddr both advance by block_size per entry, so their ali=
gnment
> >>>> + * relative to the group size is invariant across a run of entries =
within
> >>>> + * this call: once a group qualifies (or fails to), every later who=
le group
> >>>> + * does too, up to num_entries. This merges each such run into a si=
ngle
> >>>> + * arm_lpae_init_pte() call instead of one call per group.
> >>>> + */
> >>>
> >>> Can you provide an example for when this function installs descriptor=
s
> >>> where the contiguous bit is only set on a subset of them. I would
> >>> assume that the contiguous bit is either set for all descriptors or
> >>> none of them.
> >>>
> >>
> >> That assumption doesn't hold in general -- it's only true when the
> >> map request happens to start and end on a cont_size boundary. For an
> >> arbitrary map_pages() call it usually doesn't.
> >
> > I believe you won't see arbitrary map_pages() calls. I understand that
> > these calls are exclusively coming from __iommu_map_domain_pgtbl()
> > which uses iommu_pgsize() to determine optimal page sizes.
> >
> >> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> >> iova =3D paddr =3D 0x1000, pgcount =3D 34:
> >>
> >>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed plai=
n
> >>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed w=
/ CONT
> >>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed p=
lain
> >
> > In the example you provided, I expect that you'll receive three
> > separate calls from __iommu_map_domain_pgtbl:
> >  * idx 1..15 with pgsize 4KB
> >  * one call with pgsize 64KB
> >  * idx 32..34 with pgsize 4KB
> >
> > If I took your argument further, I could argue that we'd also have to
> > check if we can put down a block mapping if iova =3D paddr =3D 0x0 and
> > pgcount =3D 512, but we're not doing that either.
> >
> > Could you provide the input parameters to the iommu_map() call that
> > resulted in the parameters you provided i.e. iova =3D paddr =3D 0x1000,
> > pgcount =3D 34:
> >
>
> You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, iomm=
u_pgsize()
> already splits the request at the boundaries you describe before install_=
leaf() ever
> sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-gro=
up/suffix
> chunk for that caller.
>
> That said, install_leaf() is shared by other callers that reach it throug=
h
> ops->map_pages() directly, without going through iommu_pgsize(). panthor_=
vm_map_pages()
> (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgt=
able_ops via
> alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consume=
r, but does its
> own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ=
_2M, with no
> notion of the 64K/32M CONT boundaries. That can hand install_leaf() exact=
ly the mixed
> iova=3Dpaddr=3D0x1000, pgcount=3D34 shape in a single call (panfrost's ma=
p loop uses the same
> get_pgsize() and hits the same case). So the prefix/aligned-group/suffix =
handling in
> install_leaf() is still needed for that path.

Maybe other people can chime in here, but I feel, from an API
perspective, we should have only one way to make of use iopgtable. I
think we should just mandate that users honor the updated value for
pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
alloc_io_pgtable_ops() call and then choose page sizes appropriately.
Otherwise, we end up with two pieces of code in the kernel solving the
same problem. panthor_mmu won't be able to take advantage of the
contiguous bit until it gets updated accordingly, and that's ok.

