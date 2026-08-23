Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E68C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZF6HUGQYWvBUACVOKONbBRQQpsYWeEt/fKmrPzcNd4=; b=4ov5pyZNxiKOGe3UGwVK4vLqqw
	fvtMOsvvFhdgIrKlb1UfRFkBykM0IsEBAkmCNYP0VKKgrY5mEPm/xSP4Lx992oj0/6zkiZfp0EvBz
	Fer7IHqFPDrO+1RAGSjT9HgIEENXRlTicyvbbXIIM8lGkIFk1VqFxdUyS+N4efa6wsQ+4M4dtbLR1
	z66yPfBisjYhcedzouEwpNCvmyE8p8Lsnda+4zCUuHVa34WcXjlZvCDVy4ZVH9o/3nq+lMflkM6jY
	w7rFGjZP2fD3EaJXrFC5FVjCQ8Iqpacf3ei7PlWW8CS4Nqz9fEyQQ0VfaIMwOmsMDKu+1GB+x2r2Q
	WiRAuiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyBLf-0000000FUU1-0mH9;
	Sun, 23 Aug 2026 16:47:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyBLc-0000000FUTc-0KXh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 16:47:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fde295992so1766865f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787503621; x=1788108421; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZF6HUGQYWvBUACVOKONbBRQQpsYWeEt/fKmrPzcNd4=;
        b=UuSlw07Hkrdt5HuDC9RcIioiLdmLmSa1MImSQqiT9MbDUVlBPaJv4DBarmmrlsyXfw
         eTL5ZArSXmgPn5V7SoL8c1i0PjM6MCKTm/6dA1/FvX/oLH1phKKg19DQHrPYNrHeyxmp
         rsp+c9r3zVSTv+lzqJUzpDlAowah+KWVrke5FJIOU5xPIvifXbiY6Uvrnr1C3DitXoUA
         BzMoArIQVTUUt87EkTe3ZPvIJfmlQaCywYRhgTd5lVN9g0ZroxCNjjxNnBWrqH3CsHPt
         gomgG1LmzJ2IEzu66oPzCL/9l/kO1OGZYgMzmwMNilJGr1RqMantEUqztOXMlAJU7cku
         rRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787503621; x=1788108421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZF6HUGQYWvBUACVOKONbBRQQpsYWeEt/fKmrPzcNd4=;
        b=AFfGEFt5fRqLAzsmD8rn2bBjaH7RAT5klMYWh+bdHtjQ84U45peNq8eaihRLV1c3Wb
         UrZrT0fTGtFeQwC84KymVJmiWn7ggHMn0THfieeJcX9GsZfNcQnFzFxoawNOuDWihpP+
         qPFEXnVE7nAkc75y2i0Gjs5QCIwgwUwb/y0lB2r36TzZc8f13aXajNkwr7dbqgTQb8SV
         /881N40ZPnZRHI1b4nscMYbXEiYl6S43FtMbRf0P902ZXICpS/MqHGnOGsgo+WM+JmOp
         Q5agDFA3G8STvDpCYzgKtMVCeES9PEnixgA6hWJh+LCPGLXEwLZXBzBVfuQEqIriQ7yJ
         FoZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRbcYv6t6+9ztrfGwwNnoAQ1/pJVQ+zRSiofLY2Ef6wJpMjOcgb53Q64fQGc6NiDyZ9rjzllBfEGmt+iWQRSi8@lists.infradead.org
X-Gm-Message-State: AFuF++kfLpOXqBsNSOMaJ6N1RkO+veEZY5Di1NANrQcPzlCEQQBD7RWy
	eoMp8fazUzp9DFZxACMVJqwcEjzEnoqu39qPdYddW4Qe6uCCsAZEcNK3pPDPhbY5Nw==
X-Gm-Gg: AR+sD10GF+D3K7zDIAUlVwfpTyG+igmyBEw+vKmQTmTuclFzvemzZSiKLlXWyKmkS9e
	ajSMu1z9NtwFqjoWlPCmsDgHBz2yitDud3TnuXVtAjk0YJ2PtPXhMRbBtjB69DsGTGPahAqJwxm
	FOD0eTwfAXZmJdO4xGmwnaSk4iLtr+/GHv/EkmXuexNsj7kRltpdn5hmeFcrIP+SOEJN9bKbqtu
	MS4gsiFcIexgHwJ6G9aVvduDchJaHaRmhgwJqjzfY/FMbB4552MJBmz6BjC/eJ90HuDiukSrZ75
	Cp4nwuXe1x1xVhD324wYFC1WBz5y3igZIJmqAoF79ZmtRT4SqjvP1MH35e7dnJlGyQKZI0rWlnN
	EK9nsc6araRgabQRq/q5jxd5Vi3HjQUp3NmacIR+D1F6GGo6uDppim9r09IChxWRTcJROCofIEw
	Wes1XjRyfl22eQ7kOn+PBpvxXNEFtlmtb7cuCmZYla3Q26pb0si+quJi+2EFbKIk3wQQkxhg5Wp
	tbEeWQYaR4xd2ZR6v6axrAxIw==
X-Received: by 2002:a05:6000:3104:b0:47f:8554:a341 with SMTP id ffacd0b85a97d-482b784c4bbmr35989706f8f.13.1787503620630;
        Sun, 23 Aug 2026 09:47:00 -0700 (PDT)
Received: from google.com (78.207.190.35.bc.googleusercontent.com. [35.190.207.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd2bbsm5538099f8f.18.2026.08.23.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 09:46:58 -0700 (PDT)
Date: Sun, 23 Aug 2026 16:46:55 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org
Subject: Re: [RFC PATCH 6/9] arm64: Enable the execmem ROX cache for module
 text
Message-ID: <aosj_1LChfLM8xaz@google.com>
References: <20260822135323.795946-11-ardb+git@google.com>
 <20260822135323.795946-17-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260822135323.795946-17-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_094704_157188_4CB597FD 
X-CRM114-Status: GOOD (  11.09  )
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

On Sat, Aug 22, 2026 at 03:53:28PM +0200, Ard Biesheuvel wrote:
>From: Ard Biesheuvel <ardb@kernel.org>
>
>Wire up the existing support for the execmem ROX cache on arm64, so that
>it will be used for module .text and .init.text regions. This will be
>relied upon by a subsequent patch in order to allocate those regions
>from a single chunk of memory.
>

Until Mike lands his changes [1] on set_direct_map, enabling ROX_CACHE on  
ARM64 would cause a permission fault when the same part of the direct map is
used again (the RO flag is not properly stripped off after an execmem cache
clean).                                                                    
                                                                            
[1]: https://lore.kernel.org/all/20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org/
                                                                            
Best regards,                                                              
Adrian  

