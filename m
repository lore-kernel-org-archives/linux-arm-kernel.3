Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B4AD6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82ryBTb0OYajbtmHnpP2vY6hULmAqRanYTWCsyHvjaM=; b=hBVPAxsBBqtbQgGxha3Nlo+jna
	B8STEhOHGol+bvzdUZri3BMA2eej6KZOkF8r2ff6QydGGrwoR75bbt2xkZH8bvGg5duOfzBtd/vI2
	suZXric1zBW4D6AFhAohfQDklc59Gi00LJ4pNTQ/gWM826G3DrDBf5P5+Ga5XB1oMP8nkvtLQ5YzU
	h1ETIIt18ohPwVEEvr2iHqikMkkHSX50J03vFxQEiOqUaiygkGtvOlpvHm5ImhLVguzN0gPL1cbfU
	aAP+L3Fms62jZgw26NwK72VqS70Ygh5dnaYzjSz2igdM6QfV85JSRnmvl52AUE0pdM19raMemdMqI
	Zd8V+DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCwl-00000008PmV-1DsY;
	Thu, 18 Dec 2025 12:17:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCwi-00000008Pm5-1e2T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:17:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso4152065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 04:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766060246; x=1766665046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82ryBTb0OYajbtmHnpP2vY6hULmAqRanYTWCsyHvjaM=;
        b=HXxiA7lxB9tcbz7IP0oyYuFd+5RDZiEX2lgKCpc4W8a/tOQYmlrtsMMLBU1nJLpX/X
         DAzzVzVsAtLPzXuFyAQk7tCt2d/6EZs4JKFVkX4Xsz+WVYG6a/GB+1ngcPBRupGvXhhs
         tVy1SaGvBy8p1o5YloTEP9BaEWKkKuqRBFeMdPJ2MTM3DEnHDCxhjErSh/q6yz2Iy9O7
         XYOxXBmsl6U7V2ySKgCvNcoc5QPMFGvqCYBXzMlFbcVsNfYmGdByR0oDgSiK5Mp46szw
         OQ8x5YxDXK7fo175fEB5OqplrZroqw0ZB8pyJXB9xRRtGkP6ck8NZMXYroUuqJtQCLg3
         T9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766060246; x=1766665046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82ryBTb0OYajbtmHnpP2vY6hULmAqRanYTWCsyHvjaM=;
        b=GEoXNHZf6J4ozuXEqZOe0whaHVN9bbFK8zpXoBwJ8IRmFZa8+UR2JM2lx2Ft2CFHg6
         q/GAMbE0QNeaF/sFsSF+KAGtHiZfDdjwK9MmNe/HvM/e8X4T741RtzpSGAMQYOx01UUL
         2Zk5CR2Iu449mZJHMHD+/CKcY6werf+6G6e/VfSvZbMHE6il8e1NhbdayuZf5xHe1ecw
         p9USOcEwPqEnhrvm+Y5HHq5A97faANNQBx9iGlk8Sl4ZT0J7hw4WAl720xoXuStesDa8
         srZDLkDIPm/WOPRI1q0nOcrazaij/KSXxPWEUOogjZtsnuGcYTf8f69YMfvlhKcvEKci
         MmKw==
X-Forwarded-Encrypted: i=1; AJvYcCUI4l4Q9CPKBr13hp/hg6sXc2oDYg+D9lxTEEL019OKwzUcGlDFwaCxKQQxIa2VJoINE6+zyijhs9Re3YkxfN5Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ENdDJG13nGPfBTVKL53oLCopOeL9Lz4/3ELNQWrZWYCoOHnb
	s8rpPb9rZgd2b7b9Qxxnbt0u9R1fKKJjJddI07g86/fQNI3Ie3h9Vz9PSoW8o9l6b10=
X-Gm-Gg: AY/fxX6wMm3v9LBNuanF8T1kDCulm2Jz8C+7J7FogCm6B+pTb7/FVJa4oF3Js9OTdHu
	BlbasdIO+aNkL/pe0StWRCcSAC2uUz4k4lktxJkvyiGzxI3b/J4wEIpd3woMX9YHme2pDbSTz2s
	2OZ1mtVCZpIHSSMI/FCvVg1NTgJDG6EBtnJJHSnG5SeEZaup4aH9deIZC53vodVN0cF8IiUARbh
	y6XLkRsgX7E85OVqimpPqtzSKRgUA+zZwIx77X52o7w1KwxIdVh7ciq3Yo+rvovAE9Fk6EWlQGz
	PMwGhIKFxHUvomreycveGmaVlhVYJ9dpUeDoMj7c8Rx2e0Q7xB2meJKoCRfE60vuDqYK+G0n1CD
	5hs/UKvq5/Jou4d0MPUPvsG8nsfldONivN6KBIVJKHLFD1DFKxdwvGp3PXpJ0+wjyUyxgJlh2dj
	e78Om1Ydz1LQwrAusvjyr+atoM+F+rMGzISMM=
X-Google-Smtp-Source: AGHT+IGTUeEzz8tNPQ2pmX/MnRbtFTT5HvfYasuVnspclS+oD1dD2L49trQ2Os59ODIZ3jVEB6x5aw==
X-Received: by 2002:a05:600d:6405:20b0:47a:935f:618e with SMTP id 5b1f17b1804b1-47a935f64d7mr172794535e9.15.1766060246405;
        Thu, 18 Dec 2025 04:17:26 -0800 (PST)
Received: from localhost (109-81-80-251.rct.o2.cz. [109.81.80.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449ae0ffsm4488541f8f.39.2025.12.18.04.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:17:26 -0800 (PST)
Date: Thu, 18 Dec 2025 13:17:25 +0100
From: Michal Hocko <mhocko@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
	rostedt@goodmis.org, catalin.marinas@arm.com, will@kernel.org,
	kevin.brodsky@arm.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while
 stop_machine()
Message-ID: <aUPw1YFNLf7ONqe9@tiehlicka>
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <20251212161832.2067134-3-yeoreum.yun@arm.com>
 <aUPJuZINNuNxddRX@tiehlicka>
 <aUPLCPAyxkPeBaoD@e129823.arm.com>
 <0d08b4bf-35c5-4c63-964b-ef886b8262d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d08b4bf-35c5-4c63-964b-ef886b8262d9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_041728_450079_5CD5A984 
X-CRM114-Status: GOOD (  19.53  )
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

On Thu 18-12-25 12:02:14, Ryan Roberts wrote:
> On 18/12/2025 09:36, Yeoreum Yun wrote:
> > Hi,
> >> On Fri 12-12-25 16:18:32, Yeoreum Yun wrote:
> >>> linear_map_split_to_ptes() and __kpti_install_ng_mappings()
> >>> are called as callback of stop_machine().
> >>> That means these functions context are preemption disabled.
> >>>
> >>> Unfortunately, under PREEMPT_RT, the pagetable_alloc() or
> >>> __get_free_pages() couldn't be called in this context
> >>> since spin lock that becomes sleepable on RT,
> >>> potentially causing a sleep during page allocation.
> >>>
> >>> To address this, pagetable_alloc_nolock().
> >>
> >> As you cannot tolerate allocation failure and this is pretty much
> >> permanent allocation (AFAIU) why don't you use a static allocation?
> > 
> > Because of when bbl2_noabort is supported, that pages doesn't need to.
> > If static alloc, that would be a waste in the system where bbl2_noabort
> > is supported.
> > 
> > When I tested, these extra pages are more than 40 in my FVP.
> > So, it would be better dynamic allocation and I think since it's quite a
> > early time, it's probably not failed that's why former code runs as it
> > is.
> 
> The required allocation size is also a function of the size of the installed RAM
> so a static worst case allocation would consume all the RAM on small systems.

Understood. But is it possible to pre-allocate early on so that the
allocation itself doesn't have to happen from a constrained context.
-- 
Michal Hocko
SUSE Labs

