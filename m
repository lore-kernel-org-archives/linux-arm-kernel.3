Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A58C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOxJd4NbFHO3LlR4MpOBylEfyAcyuSwlZhpBODqzhsU=; b=oQaniRV6JDoXHRK9nBgmHsixMR
	ozE6bRswqgXV61HC441wZc4HBuV/IJIJ7y7QX0XEK/IDY7kSJoZ8m3w7cveByzmgIYRfWlL5SKV3d
	AgxFPzVz+Ur1cJKaOy83YgenITF4v6Sba9XmpY5xFJgS5rqyEe6ntHeyrkTYwHpGT2pFlX70O3KBc
	ul5ps2lUUY/V8tWeIjlGnp4LCS8Wh60wbGZgYpn0RTtru00ZCCQrYC9t40gmwRM7rx7U5TUNgc2Us
	WObOUhMmwEYPfssMirCjXV3obEIhaaLtlzDhTzQAZfMLA/krHTpU7v8KRRpTwKonl2JRCYv6zZ1GZ
	dy10oOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6T2-0000000BZsw-00YB;
	Tue, 05 Aug 2025 01:27:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6QL-0000000BZfs-0bAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:25:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-240718d5920so61555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 18:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754357104; x=1754961904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOxJd4NbFHO3LlR4MpOBylEfyAcyuSwlZhpBODqzhsU=;
        b=PBRkoiRz04n37geRR3YSCceGqW97oT/Vn81wmWfKg0MgGlJRVCN+FodU3U900q5Cl3
         2lvylNlclmOfzlBMsxSQJtfEvxLOhstoG+l7O9erLTD6jvQ8rM3NBX1Kzzva3DDQnyFZ
         MU2Rvwqen4x/e1TMpae6r+tozbBf2NN1eEOsnkNIKxQz/rvU0PFkAuMzLY/V3ZiVzuRf
         rga2J0RYxfW7O4EkxskrReUU/e1Kv4ubIc7I35kUBnd6d9fLtSWJhAZfP3kz5mdva0U3
         Fc654zI09l8SO6hEBG0iB0Is/ctm91XkR4xa6DXl+AL0yyB/NHn9XT1yU1Ladz9uSaqe
         /xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754357104; x=1754961904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOxJd4NbFHO3LlR4MpOBylEfyAcyuSwlZhpBODqzhsU=;
        b=UFm5TNU8bE0xoe2KmSImDpgs5PTBwz6aisUajG4XxAYep0f5Czkp0YRrg3w1iM4wMP
         uoKyNrFcWeJnDaGw5V5xsCegQRh1VKazKkHnqjCLGVCB9sWTCJXklVOPGM1kvOR1ZfCb
         xtAVTD01irsChwAP//OIHJa/zA4zsoTBE0VFkDEpuR06aV70B1TcCZwheR6VT+zUeYJb
         qhCHIPPXP6l8PF8K+YDsTXZ//VHG4yIbhIBoK3nrclV+rPToEM+XYHwqK7TK4xnkBsIy
         EZz6SywRzO+1abYvVGYpUEKY2qOg1Zh6mcZBF2pm8J20EroJDyPXBHYc/ZCXaPWAFCLy
         bPAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiikNJhseqN3uPy1AEwnC3Hyn0S+d+cVCWFyRW0YRLYgXOt40iMG4GEemvvV8EvSBpFJ/xrBjStqgPsZ4/EYPH@lists.infradead.org
X-Gm-Message-State: AOJu0YwKQCf3rS4Cesl2MB5DjtBBGi/v/MPQGqCLwqrGlvePKLtInhPa
	DdbXD0dcON9/n+jaJnJE+Xpwji58/MqBpWemryHmWG8URorHdBkNgoLBP5Z3h3bRmNWQGPz97sx
	lFkEsw1HcTSOKDvS9TrcNmLN1lqBj/BUP5xQjAVlC
X-Gm-Gg: ASbGncv/rA9JwmFPwr0vU6fC2+PCxoLoUAQxnohA3s85sBHSMZgL4UZ8cO9LxQd7Yf6
	3lZEScxaiH+CKqD9YJiPzANPdZvQ2WmJZsrM+L6c4hIaLyRfyNAjQAI3kEDMHtvaGlHn4drmktZ
	wX63GBUXzB5zK1otnIBcrM/iaf1BfQMTdk9xY3QFsCYkhbOsXo1haVMt2lDcRIPg3ek0uUca1kh
	hM3Lt0EK674TDllO8DKs9a/+YnZrGShNDRZQR07
X-Google-Smtp-Source: AGHT+IGlJmNfwi/BL4sdNg3IcRsYuofmOwv7pzZKDekvC/MlCzimr5ljrnxQNNuBlGzWZKaEvJBcyRJkdCx796VG3hA=
X-Received: by 2002:a17:903:3bc3:b0:240:22af:91c1 with SMTP id
 d9443c01a7336-2428eaf97ddmr262835ad.22.1754357103774; Mon, 04 Aug 2025
 18:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <8A3D2D44-DCE9-48FC-A684-C43006B3912F@nvidia.com>
In-Reply-To: <8A3D2D44-DCE9-48FC-A684-C43006B3912F@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 4 Aug 2025 18:24:51 -0700
X-Gm-Features: Ac12FXywo_FBvKfn816eFQhOWDa_XVeaC7qAl3HAB468md2l2Uuye3UZxdQHZ5c
Message-ID: <CAJDx_ri28-_SqPoYgm2DHEwkA8Y8PU9+YjbRZqMdGpy_k0DKuA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, akash.tyagi@mediatek.com, 
	Andrew Morton <akpm@linux-foundation.org>, angelogioacchino.delregno@collabora.com, 
	hannes@cmpxchg.org, Brendan Jackman <jackmanb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com, 
	Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_182505_191036_95C312C0 
X-CRM114-Status: GOOD (  26.75  )
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

On Mon, Aug 4, 2025 at 12:00=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 4 Aug 2025, at 14:49, David Hildenbrand wrote:
>
> > On 04.08.25 20:20, Juan Yescas wrote:
> >> Hi David/Zi,
> >>
> >> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists=
?
> >>
> >> There are many devices that need fast allocation of MIGRATE_CMA pages,
> >> and they have to get them from the buddy allocator, which is a bit
> >> slower in comparison to the PCP lists.
> >>
> >> We also have cases where the MIGRATE_CMA memory requirements are big.
> >> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 50=
0MiBs.
> >> These cases would benefit if we have THPs for CMAs.
> >>
> >> Could we add the support for MIGRATE_CMA pages on the PCP and THP list=
s?
> >
> > Remember how CMA memory is used:
> >
> > The owner allocates it through cma_alloc() and friends, where the CMA a=
llocator will try allocating *specific physical memory regions* using alloc=
_contig_range(). It doesn't just go ahead and pick a random CMA page from t=
he buddy (or PCP) lists. Doesn't work (just imagine having different CMA ar=
eas etc).
>
> Yeah, unless some code is relying on gfp_to_alloc_flags_cma() to get ALLO=
C_CMA
> to try to get CMA pages from buddy.
>
> >
> > Anybody else is free to use CMA pages for MOVABLE allocations. So we tr=
eat them as being MOVABLE on the PCP.
> >
> > Having a separate CMA PCP list doesn't solve or speedup anything, reall=
y.
>
> It can be slower when small CMA pages are on PCP lists and large CMA page=
s
> cannot be allocated, one needs to drain PCP lists. This assumes the code =
is
> trying to get CMA pages from buddy, which is not how CMA memory is design=
ed
> to be used like David mentioned above.
>

Thanks Zi for confirming!

> >
> > I still have no clue what this patch here tried to solve: it doesn't ma=
ke any sense.
>
>
> Best Regards,
> Yan, Zi

