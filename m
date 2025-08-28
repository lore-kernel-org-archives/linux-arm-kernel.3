Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC98CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=; b=qSB/5wEgyVkYa1EjtSHMvvcLFT
	f5vtpQbx04T/Ot+auJT1zvLp6CkyEzDAkkFXcATlm/L264TOvj2ZMjGRh587/i1Ziq9l+r6W1PpfU
	x8u/I25ROrvTvCCKhOfEyo6TAzlXUG/l85rawbZRMkPAiLoQAP6CRoT0UkTTts1NBELXr/lfLCgQT
	INDbVt+Whb6mWUo7NoamnxsSI4wKYPmrjoMe2v5BAUfkLLUPkU4bbGEvvIdy4gr40zqAOj5wQAuE6
	ESqXs4cTG2GaNFv6uQPxXW3zi6slT+X76LS946+FwOsSmEbUTRpo82MwTWx+BuYJmq8GLS2+nL/VZ
	Q1Pp2xyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXFj-00000000dZT-26bG;
	Thu, 28 Aug 2025 07:40:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXAQ-00000000bv3-44Ft;
	Thu, 28 Aug 2025 07:35:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso1076635a12.0;
        Thu, 28 Aug 2025 00:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756366529; x=1756971329; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
        b=Xp9lOaB3SvM7m0dJqyvP+yP357DW5bsMH6P1yxF1ObYO5ez3G/zZVGV1Yv8zQrWPkZ
         lVIpHAruJk/r8/Dupxt8cKtmTMDSUwnSM9V9zZ4g0F6L48Fgdxa06gtwGsdLh9oBTUQZ
         gGqNuN41oblD84EWJCGjzvgWrqs3X1VvL+7iRTysKDp9It5XDSgPIY/ofHcFatNiGboa
         bnj22WXLTNVap7wXc4cOeGtD6rmJ8hH+c6akgW171PlzAjn8MniEr3tqrcn0d8C41ia5
         hY9BUEytWP5xKFU5KjNEJT2ZX6hhJVj7GQoxkawV9deVxOzePCBWEUqiHdJP/tAXlnLk
         Bz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366529; x=1756971329;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
        b=p5OIiHfD7CeSdV7SE8xmC6yPmOcrh8JO/Dg1HxJOQeMAVG4oplgbIgmiewNhQwknzN
         /X8hW08bXDrr1Ylyw1KTkDIrU3CMi79hP9gGEOf99kQV0MjJoEWd3cNhbShKQ65qPqyg
         i+aJEdTAlIfww8/xBQgc/DdvtSzXhEqfKXWOJCIb48+8tPapAMKClEIug3jkLlOOlkuf
         o8MyW0aC3ovLkiQgq5yyozqOD4cotO7fzUU89NHuzlKLH2HDTRr6eA6yj4BYPtOhJSdM
         2x4a19q4bbVAWbBrx3dSMbu49SwmaX/8c7EfWY7lCqOZXQBccuul5753QpWeFWvstzLf
         ZSkw==
X-Forwarded-Encrypted: i=1; AJvYcCUxlTRE3HrDNoj0r0JR/W2kyiOzeccrzPvyNmBFLmVZGpJS7dn9I+gkY1ZPnxi3Epqeu362KCoEejCt3n0=@lists.infradead.org, AJvYcCVB9vPCJ57MTHvYQC/yk6mihZ1KR7zlghUK4nPdti6eMriRgsd0bO00EiV24Y8UqKmZ9Eln4xPQvPSXeogMbIKy@lists.infradead.org
X-Gm-Message-State: AOJu0YxVP5dd48Ti1bg/mUUweUoUInkfR8ktIWKZDf+0XLMgail0VJaw
	j3BNAaIxYxSgPQ/mStLcwlAdfWb7Ih9K/bQ6LkrrpZf2aj72l/y953TX
X-Gm-Gg: ASbGncv7w2vZwMoR1tsc4yL5qTPk9WCcKnWNK5xyB/sTd8E0g33BcQwp12ol1Qb0TtY
	mKPvOKYGkH6bnXJ6CilRJ+aO1igpMvz5utB4uSv3uits+WN45Y2imY3lPV4A0Xx3sFSuBgaUSOD
	c5k2EwmUJ5V/2EJ2mFs5HvN969mJWdnnqH9cgPexTT1S6umWCAARfjdi7LpnSGc11yikFRw8Bgl
	PZfENX4DotOv0p4SjbhHHfmhQZVpRbmNEG8ATf4dAaA3LKchjbCowclvY2SjEjeNcyOW5REymLi
	iiaDs+hTZ9qauNBiEvVJkEj1dYM01k+F/MgZX6akHZoSPM30lZpPp3SUYYw6NEHUtZ8BSEZfQNA
	e31Om3qnjNW13vlKa0aRq9eXvQA==
X-Google-Smtp-Source: AGHT+IH+/HdQFSXw/W0bPc1NEIz4PAWk+piUx/7dt/vdSor64JcoeKILsFtoJ4Brv3+pRvjO+XdeaA==
X-Received: by 2002:a17:907:3f0a:b0:afe:d590:b6af with SMTP id a640c23a62f3a-afed590c109mr310258266b.20.1756366529084;
        Thu, 28 Aug 2025 00:35:29 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe77c2b758sm886311466b.84.2025.08.28.00.35.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:35:28 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:27 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 09/36] mm/mm_init: make memmap_init_compound() look
 more like prep_compound_page()
Message-ID: <20250828073527.u4k47fohaquzf3pg@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-10-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_003531_008502_183475BA 
X-CRM114-Status: GOOD (  10.23  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:13AM +0200, David Hildenbrand wrote:
>Grepping for "prep_compound_page" leaves on clueless how devdax gets its
>compound pages initialized.
>
>Let's add a comment that might help finding this open-coded
>prep_compound_page() initialization more easily.
>
>Further, let's be less smart about the ordering of initialization and just
>perform the prep_compound_head() call after all tail pages were
>initialized: just like prep_compound_page() does.
>
>No need for a comment to describe the initialization order: again,
>just like prep_compound_page().
>
>Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

