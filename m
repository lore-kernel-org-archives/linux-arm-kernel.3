Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F94C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6cj/et3tJLOi8nZABzE1bZ8So47tTX91IayHIgQTo4=; b=tMVEj6VyRWAcTXSK5mZ5uadnUj
	p0XjAaf5jdIEqCfSNT70tM8DOprehPVHiKlv6lJAjCt91ZceCwMMcEK9hf063RBGpcfj7vLdxFdun
	hNazicsQVyIMVJfZlUhGHRLfYvcdKCHsaFiZmBdgMe3DFizNbOsT/Axyi/mhLfOEJF0ZSVmUS3mmK
	3y4drMDvArUkT49CxkWvODHLTtxNcAKv6yx2XZDJEpoTJa8HY6FBWDuVI2xYR37MY+qPkBmJKqZ5i
	zM+cCdtdGdnx/9pymDv0TFOpe94OV0sYeFvp8bsbBF293jjF4t3iyzMXDPQM+vZpjz8j/+ZyKvRbU
	jZWZgREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uTY-0000000B8Ry-2kph;
	Thu, 10 Apr 2025 16:10:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2teh-0000000Az9A-0K2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 15:17:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9007325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744298245; x=1744903045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6cj/et3tJLOi8nZABzE1bZ8So47tTX91IayHIgQTo4=;
        b=M2tR4dU3wKiQiWP/peASvwK8I8hjeoXFKQaYQilOgxXO/8kIH8QnVuM+hheQR4Vpj/
         CMYLKIViZxEPwj2OA4VR9d4qvKfRQp1GM+qvziCYG7Z1gilTVBrcNSFmkatkzwzdKnlr
         omByCXYG1nT5WmjJTYsoLpcqnJy+rJbjWuFhGoQDHfoez2lEByG35QBlzkDlWwlf1rDl
         YvJuxAZuxosHyyuwWCUhHqaAru9FxYXknu4xQmdhlbjeo7t3mrKbwAs/sAYna81Cmjmk
         rv5Ud81vb05mRYcL+AKcA9uGApVXvZivEu7kmJEJyaDJrIuJw75i6Ip5mORrgzvRIS9o
         QBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298245; x=1744903045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6cj/et3tJLOi8nZABzE1bZ8So47tTX91IayHIgQTo4=;
        b=fMyrx3nZm3dEjPINyJz4qbbIZjBgvEVuSqqTj/xby9OPHIe+p2bCG6UCB+1IqPuoWX
         g1AH2EwmsaddWyWE8Efq8i86GDEoas6uFc+wA0C/iN9CxsvtSvRqHP1Go3ifdWL9Ipft
         idIm101mUPMzEtjzE2PZXBhaDFfwo/xsjkIhTQkkJyYF13BGG6jrxwDenE9N3CWbIvh/
         cPVFP2q7nW94VvJAx+BM20vkTZPkz3WvF1tHpwTIb0OsGnkcdYpeoPjeMAgxZ6EF0/jv
         zuY+l9ptm/qB6OXla12OnDQbnDKMemIzbZnnqwdFUwsbLRivnavF9svWj8CWuHR759HK
         m46Q==
X-Gm-Message-State: AOJu0Yy3ReMqPlQkl5NcbY2Q6wXn7peSUSg6kPRPJoCkOdxa3lYeria9
	8eZegEGdGK8qpi2y+e7HKR6mSWfQ8BVvN41dSNNTqHnw3eQsnV1qckF66/tfqx8=
X-Gm-Gg: ASbGncvclDytWlV1PolWBj7r9vB6aZmXt+AtC0plTSF10Fgvtd7FoA4ksnOOFf812y0
	YwNTfoSKSOYcqgYsT8SrlT1DJulzH40KLLXLHcnKMzrMgs4zXvcILwGHsuhGHa7/996Nfj8SrAd
	NTQ9GLvno+p2aKiQ+p8aFsqctI1DBWG84B2M70AJgQ+iBiOCsNrC9TDZQoHk7BRpQ0jVsQXOFKR
	Q+dicIa7yMtJsEZ/nKmCMJMMlst8RAHwES1x15ktxG0hId1YilrCybJopy+PP0NEBKnQVX82RX0
	NlVmVK7CdUDVH/G2SEftLkfy6T5UImKdxERvMj6RhFXtrFhXp/5ZPQ==
X-Google-Smtp-Source: AGHT+IG+NzZVvrmsCa4ZlEdd9DFX82PR77L8xEbBogXJLZfgAsJhybLCQSoboxlSlXUt/tEoUyKrwA==
X-Received: by 2002:a05:600c:5023:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43f2d9529aemr28961245e9.20.1744298245314;
        Thu, 10 Apr 2025 08:17:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625eeesm58156015e9.11.2025.04.10.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:17:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:17:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org,
	will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
References: <20250320171559.3423224-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-1-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_081727_118628_6B9251BB 
X-CRM114-Status: GOOD (  18.70  )
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

On Thu 2025-03-20 10:15:57, Song Liu wrote:
> There are recent efforts to enable livepatch for arm64, with sframe [1] or
> without sframe [2]. This set tries to enable livepatch without sframe. Some
> of the code, however, are from [1].
> 
> Although the sframe implementation is more promising in longer term, it
> suffers from the following issues:
> 
>   1. sframe is not yet supported in llvm;
>   2. There is still bug in binutil [3], so that we cannot yet use sframe
>      with gcc;
>   3. sframe unwinder hasn't been fully verified in the kernel.
> 
> On the other hand, arm64 processors have become more and more important in
> the data center world. Therefore, it is getting critical to support
> livepatching of arm64 kernels.
> 
> With recent change in arm64 unwinder [4], it is possible to reliably
> livepatch arm64 kernels without sframe. This is because we do not need
> arch_stack_walk_reliable() to get reliable stack trace in all scenarios.
> Instead, we only need arch_stack_walk_reliable() to detect when the
> stack trace is not reliable, then the livepatch logic can retry the patch
> transition at a later time.
> 
> Given the increasing need of livepatching, and relatively long time before
> sframe is fully ready (for both gcc and clang), we would like to enable
> livepatch without sframe.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
> [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
> [3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
> [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/
> 
> Changes v2 => v3:
> 1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
> 2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)

The approach and both patches look reasonable:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Is anyone, Arm people, Mark, against pushing this into linux-next,
please?

Best Regards,
Petr

