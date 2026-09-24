Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A838C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=; b=AmZCowuHOJKx2n6/C7rt9/VTHi
	gL0a//AYS8g1MHTShde2uKZ3yuBQOwfWMqV5OoGECtN+xDQ79blwVA1Mo415ilVi7n6+eAAWdrp3R
	cwE/xGXlW2KGZnLfvm9TAIUejchZ9JY/+mEsr0dDjoHPpXZ6/TEwUuW1J1zGv4RI9D8FLTiOIb6js
	T6MmuFI7TLu4TCxzSyZ79Tb49Sfj0FtrodzoHDD7oCQkvtaHuMxLWp9t8AeJUsU4PvzW/Q2pT7xnJ
	h9HFpyPxkTwOLfuYNVfCPghW9KsEMmBcJ0QFguiYCDybdjKBCIpS2QsW/NSs6+3qpp+WwXhHSXNJi
	JCILTP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oWF-0000000Bxyz-46x1;
	Thu, 24 Sep 2026 18:50:07 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oWD-0000000BxyA-0MOZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 18:50:06 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-532e9ad9a1eso50881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790275803; cv=none;
        d=google.com; s=arc-20260327;
        b=srscVceUyCmC0iYgeaMoIg7IkNrTEbPTAJiTslfAFpG5n9Jl2f3y/ni6Yhc62AMxqS
         l88a8o14d4d0kp/o8jcEGo6FjLL9A1fHULhCVJLm1sgPZF8GNKZ/gGfCY8wA8xg4Naj2
         VeAx/3Y8tuG3Rs72yQLZs7z9VqfV41wlBL49NIPQCPZIAWjokPzydola9ujBaOXASRQ4
         PVaJoID8mqfvL7hszkvHsES894cipfOZ2zcoQylSx3VsZ/ROv49IfnU2J458SgbGGUre
         OYJUevzwb1IT0F0aKEHeONlIUlBAvWhC5l3Bv5uroK/gmLHWZFuRuUDXjmYxAATO+OmF
         THsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        fh=wi9+qwfbIvp0pcBKcHwe0D+bEX8V0rn0D9ssYCL9KhE=;
        b=i2uz/EAFs6UOQxZxVH4XsuQWJo0fj9pA90VlxFymCFv0F+NB0Io+FSUPe9DY/n5REv
         c5xTIR5hP3lALyQ1wxH2SjQU0KYaFL5df6YJVQyGc5zYiJIxMf0tAygywZr4k6Dae/wp
         TBS4BTYMMD3YQ0uEykdn8HWUTKW4h5ptasyZkncTSEQo1QZ/bd178sfEZkrKSEUyB3TJ
         uagwomAgWEEByd5uN33dpNOnV7wU3p+h/F5BX5pugkle5UxRBcBJVYRpP0DRD3tpk5Pb
         2CuI/N9CAPCuZasOmb1bWfrEgRV+sj0uSsQ1yBJZqV7SHxsjsCT0szxPzHKZN/PJrUdG
         be2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790275803; x=1790880603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=Hn4nuC8uo1ig0c+Mhi62/F0vclpcQn7N6UYDfNHfs6Az0EwvP/w+NVxmXgzmfs80tG
         BImNhGqVHAcJrF84PRZLk5T8pL7uM9827R9QwQPoJpLtqr6RUIEOpYuk1HrjRJibyczW
         RYDQYnkGlDfqFIfARvTccLVxWUCXIs8gGWHaptPZaZHY5WWY92fwYfgOr8oiysbf2sMx
         B6Ts1bOsk3m8P3LdW4QaVhhLkdmEQnyzXvxSIzDMfSx0tqLr1cvVrbUS3ELxR0lNlBLW
         QzScp562/9gCAPQI15ZCQCr+AAOAmHmdNiA4oFm2BuyM4bBuG/S2Bv+jnShIUXidEBDX
         Y8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275803; x=1790880603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=wGAy0uV4oP40E6GZFZDJDir8A0hwR2sStvSUUFXzs3irxL0Gqil6QgQTmNn8qrx2K1
         JV/kGjBoY/8rO2Qld9YkBIi22f7PeaQGiXxmOEcK5nTSgh6etSUuH6XczNjXmrbIYFGR
         Nod9UV9wuUx/G31N8NM8a3K9qf7aSffpbRlJAGpkkCZt/Sz/n2zPbyOa/MTygq/Nf39L
         1zAarmBJUOOwS3PHWxyNVVszQZT3agrtvRlyA92y460ZGGaGgjemX6X3ZJuajxEWhJY6
         gosn/k9+z+hdwor/82O3LWBP4XzHqGbS2Gg2mtF+XhFRgthf4nbwR4pxdeNh/lpNMBCt
         K5gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYLBQ8fRV6CLybEAdodrMme9k57poisL8RLvRhrIU0GbivX/VU2wbWVNFmEL3mqdySW+WGHYZPR6FIQj8owLQR@lists.infradead.org
X-Gm-Message-State: AFuF++kbp1Dq4+4LhywGWD0JiCP4jDC8vYHlkuPLUpxEEBDKd0SB6ijN
	9+TbwW+H0uJSxzBMmYlW8Ta9Q0GUjwjXwih8gU0EJfzCJQmyWKpeRCvBpvjAV5aE+daFpplS4Gl
	cHgpv7Xm454UAbSRVaamrYI0MoUGHtlP//0peI4l9
X-Gm-Gg: AYBFou3OQ04LzBjzbufr3eniuceGJs7GNw/eTqmRSrKwYL9hAEEtvHkLbvLT4mvDLWQ
	apd5fDOuKeDowER8P66rfF1pztDSaxsJhr7Cc22TD3C44HRXkSQvgV55l9VSyMlTj2BEJOiVuQT
	8MTOhwZrQ3C0W9az8FcnUrXiGe3fPBJZ4L5lj9ThvB4/Dv75rcr3ENI4CZ7SJqhuE5x05IQTyOO
	Ct30AeIRCu0xpO85uzjMNLGaxSD0csSoNyENR7fmekPCBK7NHUe+yr9+Pr6kR299GbX3yHC6j9b
	qWfL47Nwhf4TibPyt3AWm2kbt82poeDOsXssPLA2njlqu5BrDGXA
X-Received: by 2002:ac8:5a47:0:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-5330b91b69amr764001cf.15.1790275801917; Thu, 24 Sep 2026
 11:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com> <20260924001502.GO1540250@ziepe.ca>
In-Reply-To: <20260924001502.GO1540250@ziepe.ca>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 24 Sep 2026 11:49:50 -0700
X-Gm-Features: AclHuK8NxjjK4LAAInZh9B-AiWvxMmczV1znpTfWeKjoAyhZX_I7iFt3P7YZv3g
Message-ID: <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_115005_155327_9DC25F93 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Sep 23, 2026 at 5:15=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> >
> > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > When a set of consecutive PTEs map a naturally aligned contiguous block=
 of
> > memory, set CONT on every descriptor in that group so the hardware can
> > combine translations and improve TLB reach.
> >
> > Advertise the supported CONT group sizes in pgsize_bitmap. Callers sele=
ct
> > those sizes through the normal page-size selection path; io-pgtable-arm
> > then installs the corresponding tagged descriptors directly. A partial
> > unmap of a tagged CONT group is rejected before modifying any descripto=
r,
> > so a rejected request cannot leave the group partly unmapped.
> >
> > The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disa=
ble
> > CONT support for hardware with implementation-specific errata.
>
> smmuv3 has this errata, it must be disabled there too. I didn't notice
> it in this patch?

SMMU is an architecture specification. I am not aware of errors in
this architecture specification that would preclude the usage of the
contiguous bit. I understand that Arm MMU-700 has the following
erratum

3777127 Under invalidation in TBU possible when using contiguous page
table entries

The recommended workaround is described as

"Ensure that contiguous page tables are removed using a single range
invalidation. Arm recommends using range invalidations to remove
contiguous entries anyway for performance reasons."

and I believe we are already doing this.

Which specific implementations of SMMUv3 do you have in mind that have
errata precluding the usage of the contiguous bit?

