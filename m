Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ACDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2N7XAtorM72yACmDgop2No+2dzqpehTFwae9k1iios=; b=UHSftnOi+mIjSd9Xv38SdYEKWS
	O5hh8dHmAKjgry8hXp3fCsfEdvPLft1qIilw4VAVcE8CL6G+tIZlyLeoMcuSL0IePGzwlfZ6ziy53
	FhI0z7JNtlXCqTFnEz/oS0kZmLKra3YgH8jUCv77hayEwKmNA/gQJp5lA+nYDbwdJdVWeOvb5GR9a
	ekXUSZmAAeYOEGgxtfgQA8jD1DgQ80cMTxV1bOqQ1HcFW+S6Zt4cWHELRfEZNKrezTQqmH9KCH/P5
	LwOmcv6O8qgSr1Bi98CW/fGURjqg9UOnRf/LPLJtAvF0z+VbypX3AI47fPKdqAc45//GpMNsfabYa
	SMS5JFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1R3-0000000Boen-1bIA;
	Tue, 10 Dec 2024 14:42:01 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1GN-0000000Bljh-30CZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:31:01 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-84386a6669bso292631739f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733841058; x=1734445858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2N7XAtorM72yACmDgop2No+2dzqpehTFwae9k1iios=;
        b=fousoXGMyW5/UlcHRDzmbuTL3JnlHWCU4pnjNFWF8pZAq3+KhtEnxJbhtLqEdoTyp3
         6giLmUNXnm5nqaHzK51K7kQHpZR7/V4uawmaQ3NBWnyTFK3TaktgzVfe0gupmbCfh/HN
         +cLAr1LX6m9Urcho8LG6vIRtQ6YrimpB8n1ovuguS+/GaPUXttz2hTnN30WvKb3CKRjO
         xm6pK+95Iuj9F4lvm4P7a1EM611fsp+49Unb/tuXk+x5kWe/itbrDw/IoccFW5uRcUkM
         +I8MiuMZoWO0N7iu9ACWhOCj1iuU61S8DoI8kSS2bjz+Pf4g1cwKcQ96bPYmYHkQ2cAZ
         PzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841058; x=1734445858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2N7XAtorM72yACmDgop2No+2dzqpehTFwae9k1iios=;
        b=T6DCrvJl4N/+lDi7x7WJ0ZU5uBibODopwNYJbv0sdbDB4WMHI7JnyPN8hdYlEwLvFV
         saDU9nzCQGVKdAGfY2a1dNuUMWGJi9poemG+ARGnOX5+ueMdXWZlLRevG9zKcJC251ja
         zqrc9s+k4VcUvMcgDRNcxUf0A/qNvXYtS7yl6cSzuNPBhZGeblPsO0+SKo2QVAdFt1sL
         W8JoW1cEnk8Mgu8n8DBRDn4vzW+YPYS4FIhOJ3t3U8fIIXYryJhR/A7rslHJLctzk3pt
         xlJtwJmyhFJtnpWyChtv0ZL0oKpEmxqAOQaxsOA8VOOMI+K+qkLaNrw0qTOQvobc1gXD
         vqDA==
X-Forwarded-Encrypted: i=1; AJvYcCWWwpSsfmevCKa8up6mmNWt1dsNUADN0A/KnDheF0bHqpoczH4zKUtjGdq26V05hmgTKYHNbv37bXl1QzkGHjdb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/RIH7R63LYZk0pngJ8DiHQDwBmyBy0UFtljgYXCsX2vtsAuzQ
	z0qUhVdnr3Hhhpzv05d7v+6n/fcrwv66DMTf2rGzLe3B4+aFi6V5rJkrFqIBIf827B1OMcJOaBx
	IdV0+0YIRkdbfMoom0wn7HSxzEps=
X-Gm-Gg: ASbGncvwdLYqmQuVWQfUPno/SzGtXMr1zHAm3Fig8WWilrCTW5nVrItZ2FDaQIVQyUs
	PO8IgOsD/CyRjM2CgVD3u1N8nTJacEWQhcBw=
X-Google-Smtp-Source: AGHT+IGZsjUHNHgZScctt9GhUUISo0b3ncG99pwHqmoX8StIWNsTQgzRKfAm5Fp0Di2hDokmvL3agPwZ+93jj5g8oTU=
X-Received: by 2002:a05:6e02:1ca7:b0:3a7:6e34:9219 with SMTP id
 e9e14a558f8ab-3a811db26admr175649315ab.14.1733841056498; Tue, 10 Dec 2024
 06:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20241028213146.238941-1-robdclark@gmail.com> <20241210111450.GA14735@willie-the-truck>
In-Reply-To: <20241210111450.GA14735@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Dec 2024 06:30:44 -0800
Message-ID: <CAF6AEGs72rxvguSYbALWPL2FrO5coyijQXY4HEQdwvr8Fj4XKQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Joao Martins <joao.m.martins@oracle.com>, Joerg Roedel <jroedel@suse.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_063059_752548_3259BB46 
X-CRM114-Status: GOOD (  18.08  )
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

On Tue, Dec 10, 2024 at 3:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Rob,
>
> On Mon, Oct 28, 2024 at 02:31:36PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> >
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> >
> > v2:  Fix an armv7/32b build error in the last patch
> > v3:  Incorperate Will Deacon's suggestion to make the interface
> >      callback based.
> > v4:  Actually wire up the callback
> > v5:  Drop the callback approach
> > v6:  Make walk-data struct pgtable specific and rename
> >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty(=
)
> > v8:  Pass pte pointer to callback so it can modify the actual pte
> > v9:  Fix selftests_running case
> > v10: Call visit cb for all nodes traversed, leave the decision about
> >      whether to care about non-leaf nodes to the callback
>
> Do you plan to respin this? I see Mostafa left a proposal on patch 3.

Yeah, his suggestion looked reasonable.  I'll try to get back to this
patchset today.

BR,
-R

