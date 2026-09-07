Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13353C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=; b=OwzNMSim3oTVXg9lT5XgOfuIqu
	vnOVeQi8mqFKKYNEray3uR93NK7GslbErd3UsxTjDtXKB8xluoVsvB30hEyalwDcXabCw1ZVsiC+m
	u9t0WPEaETYfu8BwUYFLAACjNXN4JL5vofO+ZBW0FNaqoZ7tBLlOGnwfRmP8lGAxajJqhQ0cg3q6b
	1iXGBa4AwHLDQ8hJKHd+2mtBsXuT7Onnjpyu7b68qGHjr71rl9eXVPFVsUeYaO8uzNJaR0pDP98Ki
	rvLU0vx4kSMb+qnhPPsZy7EBgUd+o73MZPk/ylsiKI1BCXxnK3d0ZLEBidDM3dshVklGjisZ5UcD4
	wjaLs71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8w-00000005rO0-1vtg;
	Mon, 07 Sep 2026 04:39:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8u-00000005rNT-1q6X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:39:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d9b60c652aso36797805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755979; x=1789360779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=AJwYABinIvGa2IcgVozl1h3sR+RqL8HjS2xzczTWnbjPawSmGaNRtihRzgJH/pZSu3
         FQygcx1RbRRgMTwvD2LowASQb+ScxNC4di0tX0eHBJxnUp/YbGDyTamMYu9+k4x7J0rp
         vTdP9Gv3FGGJx5ge0BPvJT5Wb/VtgT7MEJSxemV9LRH/IqLJE7vmfT6l0isyQjPjMFmp
         3+5qsWh5Dbng6vwUS7mv6i9QH+kZVow5GI3JyG0Cnsso8BeeO1WMmBA/j0QE1RHl4I9b
         2gNV5RaMH5DAcCufVALLqF/EyGGVt2n+3pwuCdFmTs9H5L3a18A7JarAvItYj7HxgxgD
         rIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755979; x=1789360779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=LnARhvhzZuXhKcT1s00JIIFHh9/kHYm6tPsl4+wwTJb8C5ZDsbiU9j1p015KBv0psx
         QgpGelQCxRPYzz64VFgoK1nbiDrU+Di7/kgrUnvMDLZKyqGSom4kSJKY+7lGUZcyWNly
         W9B8quZSDYFhe9YDGsmgghZfGWwnLSEtJcWnpes5Awdwo3s5wFxZ72fbNwl8sn+IJEKN
         b8DrG1IsJSxEEgnfuCgxbttO9P2SA8CL/fUbrmV5c8j9Ce0GDpFIONq8/dBgvx+7TRib
         vJmX8NLZrRaT0MBLJFMQH7z8yobEvNSYYJVE5UjA6G1uWTCMmuraNfEiqRhvanlyEinZ
         4rbw==
X-Forwarded-Encrypted: i=1; AKwUvBygXsWfizdvC9OH7a+cAvTYM4FZc3sMLCBm69GwpZ8zPJr1v8MBVlY4DZiQfabtXYzlg+loCgglZqrVawbLxbmH@lists.infradead.org
X-Gm-Message-State: AFuF++kce+9pFbGwRysX8ECpDsOSElVV2ygpd2WZJnts+BoLi3lvqX84
	9TGFsatr27FBTjhZsivKzifZrlM1rbXDzfrWmwEcvjtFMmQa2btdTvHQ
X-Gm-Gg: AYBFou3gC0bs4mbHM/5L8iwdGpxJdeZOYPRJP7TIaHgURFrP3f28D+FtqAImkuAiIso
	mNssx8AQ7DDUBv9vWA8E4rM7Jz7iHYquqEHBhVy4leJwfyOTkR+eY+9HxEmLZ15IjdO8rFtkYNS
	ZvEeSpBN+R5TLfo85p3chU7F9Jr0/g1b+lqDhqznaFLjac8oTiOgDc6DpJNj0d+h6F1sZI6GsUs
	W+QLwuOg4Riki27TLqrTc03ueswkxoVCg1qFLmiR524tWql+gYtwNCw8eCTCw/NMCziieXDvR7O
	g3R6mlBceG3rxaEJoKU1EftitIKW/og+0qHEZz7jkyRnlS6J+N43yrF7zO14BiJaLMMNFASQgxV
	FifT5XwWIO9QnrR97zWLnTfnoNP4iognkqJso7CFtYQC05AlAzRjfhhiAeLEdiREIKqrCyvGFtm
	FeEAPry6Me1qEgynVEnMshTHRvFr/mmZHIKsthZSqpb2w76jQxoA+HLZcaYM6EVUWTjURK35FsI
	se17rFF2z9JQTA4XzparzlX
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr35245332a91.5.1788755979238;
        Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Mon,  7 Sep 2026 10:09:30 +0530
Message-ID: <20260907043933.33452-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
References: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_213940_478536_612B63DC 
X-CRM114-Status: GOOD (  11.22  )
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

Thanks for the pointer, and you are right to raise it - I checked and this
patch does fall foul of that rule.

The word in Documentation/arch/arm64/booting.rst is "zero-initalised", and
I changed it to "zero-initialized", which quietly moves the file from
British to American spelling.  The minimal fix is "zero-initialised".

I followed checkpatch here, and checkpatch is following the dictionary:

  scripts/spelling.txt:875:initalised||initialized
  scripts/spelling.txt:874:initalise||initialize

Those are the only two entries in the file that map a British form to an
American one, and by the rule you quoted they should read

  initalise||initialise
  initalised||initialised

so that the misspelling is corrected without changing the variety of
English in the file.  arch/arm64 currently has 58 uses of "initialised"
against 132 of "initialized", so both spellings are clearly in use there.

I will send a v2 that uses "zero-initialised".  Would a separate patch
fixing those two spelling.txt entries be welcome, or is that better left
alone?

