Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60202CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CjmzQC2/ekjhmlU5sPsEceZ/rSuZIxXTtnWoWGfZ+8=; b=XlVV2Np86pGYHnZ1TFkVBwkqcX
	uacyK453EPqkdNXbAKfr1MZeD8lSp9q4H6Iw/T8lfJ5Qr7FmKEjxaOOlq/3LSU9A+nJ2lWhjvJB1u
	TOsHN+liYHONtvWVwD2OckTObfQzgnfaMWjcyvSRIY4pPOwxXvZ5RoJYoNNe/qDmX0PwayyvUKmrw
	OirYB79pZu0Nnf6jKBftbBU+iQ5zxPO9+5yL1W+mVP6IrMBSBDcvMRgetvUc6L4zix3drUFGYCXUd
	vM54IwYSSKHMGxZ5xD/taX8gEGN3mcFrjIiixlqRoA0/QuwzzVc5BixGzZnnj6OwdG2TNO/Z9cXW6
	AvhADiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDVJ-000000046ho-1g4W;
	Wed, 27 May 2026 12:36:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDVH-000000046gq-2Slz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 12:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4CjmzQC2/ekjhmlU5sPsEceZ/rSuZIxXTtnWoWGfZ+8=; b=A4mbyDUuFo8rbDz+GeNUkgvW6R
	GzlCilRQMvDWBJibSU1iflc2ghXyYS9yAH2ZAoPt3NBV3tfKyyFRZpu2k8kFkXZhhUjrjSw2T2kaO
	O49ms5EGpUbrusexwZck2QOUWuixqFuUGH7EBzw9x1deQnNVe+HygiRoxBFuUdLE4+6aUdrvV1NYi
	TsOLk/CfJK26idGdJHfjR5QN4vqCr2gGCkxe/d9b0mfG/n+YhlIsu3cEYLEXj5M6zR/lqKMasBMVj
	0pLZfWkzsR7FGrpnr0amQpw5kAmj7sUG0MpPze98IdmWCy3ivB40v9QiMbT57ybmtUHJxAC7WKKyi
	Oh5jAmDA==;
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDVE-00000002MQh-3ELW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:36:54 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-65c305f381eso12521597d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 05:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779885409; cv=none;
        d=google.com; s=arc-20240605;
        b=TPk69SqUFF5popzW7LjA+yWn22w2QC24Wz9j2NiguMidzfsxkUUqwPTGBjGf2HjDyp
         I3hTMCJRTmFZLJlchY6rsneNTVxh+80yeJeXz4vtBkXv90xQ0i+cQ/hKaIydiaUYW9lO
         qiuyCDgsGHIXfDonRj6FirO8ew5PKd7eu5D75YcU1lZzd+U7UwEsmaoKM7HLwDtePkm5
         GgHlOhY8RHIaKzkQ2TGbnnQtrJxCQSGVD+9q/nx6vloNYzbGi9Sr3NhN4kg8cyNajzsh
         WqpS2O3nuMxseRSN0HcMP1FPJxrmYUtZBQkSbC+CbJIlwRZze9PXP8lSy5nyNcWxPqC5
         aZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4CjmzQC2/ekjhmlU5sPsEceZ/rSuZIxXTtnWoWGfZ+8=;
        fh=sIg/v2vvWSXG6OqRdyRPnsUZ9wbPGDGlqmPTk6nO8Wc=;
        b=HMxNIGjiZ/hu9eoh0kVBzk2VVwtU33EWkzsVk+/aMCEjfqH+2IvjnGfwP1FHI5t1Fq
         SgBc+pSNpF3drfKZkyNn6mE5O0GGZQZPhoomZoXKxX7Ij+jLV792tJfLLtiRf2dmY3/a
         UFMHq5zHSHvaK7hUIyRSjovuvWsuYHqamdNS5kvAt5CKCskM89tqpNVBneDGoKb3geHa
         VQC630rOb6tEAwQdYd571PF19Now2rl8UJcK2NhhpawIVewRENJeVnd63PaZ8UaOxz/F
         rQ0J5dK02T2992ybdlG1TRtebPW6o2kBzXe2EcP8dt/iM4COoKA6WYWEPJ4L4MJRlhsV
         TNYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779885409; x=1780490209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CjmzQC2/ekjhmlU5sPsEceZ/rSuZIxXTtnWoWGfZ+8=;
        b=WwgRIf//Q6qVZKABAP6vFG95A31gSVNk3kDD9dT57WE5Np8TcDtqSXjrAD/qCrR1dG
         fVVYM231rSUNGHVBb2DCZulWVwQBThlJj0TWVrdOfuQ3R5/30arrup3d8NQFdOUFUefb
         n/JdKfMK0U0/ZLqXBD06NUhiSp4jVmDk/jshJ4R6hi3lC+X0GdY2DrDPJrb9XkDSmlXH
         RKu06T4KC4JsbFJ3O9Xf7cCvTSxGlW9VZZaUKDmHEkrgjmyk3hPDGU0HJtAkZT5c5P0s
         My7uXlC10JgtP7e4m5v9K2mdSLaraquBLluuwqFA/A7R4K5s/n1V65RdmV9mlm6CxLZP
         aGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885409; x=1780490209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CjmzQC2/ekjhmlU5sPsEceZ/rSuZIxXTtnWoWGfZ+8=;
        b=ewkCv6FnlEvXi+McQfA9/0+LKjxEh18sf3cFJlmO5Ivam5mMFs921ncLZ2aNRVUxmS
         5wYPTiZbEqjMGVjwB3+VfP1KqObFijOQDuAomZ8MU4SOuQtBQ5t2xFdbJvWQMH9rwWBX
         Mt40Imyz9wV495RcCuLu4RliqLD97FrtNZPPK3hQqPnyT/VMw5QeNy/DbVs0CmGVLkR9
         8CKBTBi3JlIJh+o7+VCfRg/plVI2ajtS6UTIfUMo2qeoA+UDIAIMcfLGRrT3Wte/TEUM
         ybq7zV1AiCiGYRd5JJNB2gB7suKoQ4EkawbDTTCiHKP8VtGcgmI5qZSt+7kP+DxZNqVq
         OOsA==
X-Forwarded-Encrypted: i=1; AFNElJ9NkeNGZXfvTmT1XaNGn+VuC+nYCDU16dt1KNJPP2eoLTedr7YGeAkU4qLTEaci0NSq2ueEIcwRp5f7JHg9u66T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Zu7hldxWEgDQoxws0DfrJK18Qk+oSvdXWX/msiDzhGXQCjZV
	QWGPw8C+zO6QC6m4/8Qu76IMrcAWGPlQAo8bOBfsCG3yiNRKdLnx/K13AyqAnkV1vFYVykM7CiZ
	7eeXj3Rzdn+uJqHDzJkL9qhVq/h7etWg=
X-Gm-Gg: Acq92OFcv/XfPZic+eqyLsChC/77AchGhfl6aLUyLSKjDutvszpMkkCN7LccXTssrTj
	zeKZGF3ynUzjaIUn9uYug1IHMmbkOIm7BVmi6C9xaPuW/yJp8qVPc8a8FD2+w9dcP1trvy9Q7P9
	S5IsyM50bhG3C1XLoq3LBBhE1I1m59gdX8tsgQ3Qm9u36axe0ciDoNCVpjEApXjRN0i+ZIXG5oO
	Tj1xCwUoqcCS4vJ0+uMesUrVzA0huPXcO1Q0mOsdgEJRZC/4JbDCKl0n6jJo+V9TjObrz72MsPx
	WoIWppyWGN9WcW4=
X-Received: by 2002:a05:690c:660c:b0:7d1:dd7b:b71f with SMTP id
 00721157ae682-7d3379ab714mr246354317b3.29.1779885409421; Wed, 27 May 2026
 05:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260513170101.1858213-1-ekffu200098@gmail.com> <ahXtGL7QI82ZHPDO@arm.com>
In-Reply-To: <ahXtGL7QI82ZHPDO@arm.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 27 May 2026 21:36:38 +0900
X-Gm-Features: AVHnY4K--4Sq9xnSydn9ULXkOvlOwJQebPvgzgugYfFeA-qVG9WcPRErEy_k_9I
Message-ID: <CABFDxMFhGqf6uVWgwiVyFjhKJGg=p5ZgxjuyVYraVFmr=ZjDvQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: drop redundant remap of FDT first page
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_133652_847292_D40EAA73 
X-CRM114-Status: GOOD (  19.66  )
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

On Wed, May 27, 2026 at 3:57=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Thu, May 14, 2026 at 02:01:01AM +0900, Sang-Heon Jeon wrote:
> > fixmap_remap_fdt() calls create_mapping_noalloc() to map the first
> > page of the FDT to read its magic and totalsize from the header. If
> > the FDT does not fit in a single page, it calls create_mapping_noalloc(=
)
> > again to map the rest.
> >
> > The second mapping redundantly covers the first page that was just
> > mapped by the first mapping.
> >
> > Start the second mapping at dt_phys_base + PAGE_SIZE so it only covers
> > the pages that have not been mapped yet. No functional change.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> [...]
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index c5c5425791da..f8aea5572f7c 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -167,8 +167,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, =
int *size, pgprot_t prot)
> >               return NULL;
> >
> >       if (offset + *size > PAGE_SIZE) {
> > -             create_mapping_noalloc(dt_phys_base, dt_virt_base,
> > -                                    offset + *size, prot);
> > +             create_mapping_noalloc(dt_phys_base + PAGE_SIZE,
> > +                     dt_virt_base + PAGE_SIZE,
> > +                     offset + *size - PAGE_SIZE, prot);
> >       }
>
> Is it actually worth it? It's not that we allocate memory here or take a
> noticeable time to reach the first pte. I find the current easier to
> read.

Fair point. This is just a minor cleanup on my side.
If you feel the original reads better, happy to drop this patch.

Thanks for reviewing, Catalin.

Best Regards
Sang-Heon Jeon

> --
> Catalin

