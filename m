Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB010C9EC6C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adA1pfWwovY2UoWJPPih0D9Rj9g7yR5zYcd7adc9tVo=; b=R57ly48ozDkcCgtQuOS/1tDjN+
	l30rubzDqVhclHvz6OoMLHfZmLexc2QSCTK7HKrcUpSd7eprhZ0q/OAZ+xXbszcbUsiE5/aOlLsyj
	dM0Wo6s+62H6rDTUAaox5mjaOc+N87NvWFA2z6W4a8xZa4y5dhAZaLWuZEYdm1SndvWhsn4kwPanH
	kKzhAvNbMPkh0wGdC45Nh062v82GVXSK7Cg0ox2/p3JGVBtOkQXMMXR1xOr8ZB7Pvtx5FhVhdnPQG
	O7ArAoHj+jYcdZdSCjdKMjemSSK7iMbomDgvR5/F53l1gLDpE3Tkw1bstxlN7ZqMMxKI0pT3chI5Q
	rN2yS7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFUl-00000005Ccu-0dC0;
	Mon, 12 Jan 2026 10:50:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFUi-00000005Cbv-1Xkw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:49:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-598f8136a24so6731869e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214993; x=1768819793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adA1pfWwovY2UoWJPPih0D9Rj9g7yR5zYcd7adc9tVo=;
        b=kLTEtR3g4ZwnmnHpUhwiHzuPTWDNe0QTXgSxjtTKnsxJukAzaO36+GUV7IDp+s1B0R
         Q7ToUNhi53s6T56YaJOqsHhRDsjgFVvZ1oKogQFOk+2/ZcZKmE3h7GTTV+Nd9PcaDDTj
         59CNubbKb1WmCIt2ui2ESfQqAahO3FmzHGUA4DcixSAxwYW2y80Or+sMEmC4UQDahGve
         j6bxWPev1XrwVF74QggbIGrqNzmd0R6q6m2ilicCBdM2veHOUpNssqxe3NxahhNcK8mp
         ZID69HU3HKT1kpkqGT3zgu78/mkvCblvFpx7R6DRPJ8+PYdYcr5DmCwioGsp6xWNyZOc
         hjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214993; x=1768819793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adA1pfWwovY2UoWJPPih0D9Rj9g7yR5zYcd7adc9tVo=;
        b=M/OxxH3gZ+YrWaINX2FFhvRttI4jLH9QuyY/ggegXaP5qjQ7tDg5JV2QFSrvFYExUR
         /+0t3QGq+THRKbYMA6ex/1Lu3zaNmwI9kNvvXY6YLC84IRnYJ6F2xw7sI8DPZxVdNnyN
         VY8pCUHYau2AQLAPie1M6fQmhHXZ7SwxcN+4iu71arf9flWjanfEvJXRTS+PL4T8LbiN
         ndjdq1AUUqYg0rrGo0PsfiaCKtuH7TXDlK6jMSFOU4EpETnepUMf8G+0Dg9UnyL83V7A
         J36yAO5yc1AcLm3I5I9Gsz15+JD5AUOhzSGxPcI+JNW2Xjwy/YI0s1Ri33LSjsZrBahc
         wyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX5cw9W5rXol4caPo5jwXBL3Gd4tggTilAfGx2k/42rIpSQw8r9VozcyPWEP8QzPosYZrMr7mSZ5rPolDXoZ9I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3q0Tl43TgJJieBJMu+D+kXgZ0nbVLYoF5hs1yy5LIILUH7hdw
	2zhmWKIkl4nVNfMUYtCEopJwfFGJPZxlG46yg4auz2J1FVTta42Xe7mv
X-Gm-Gg: AY/fxX7zP4BEgYejBBOiiy7MC8Q5QMTVVR9nU81xYd9MRV5PVqTwT4IgyQF2pW4ivGc
	xiOrIkiTavyQElCYO3XjtlVLBt9X4gOKTdUBCf6+R9ejbKf23LC32tclyTmEcs6nYedF4iHHoZp
	4qv7eP/sDa2D+LKmknjAVZJc90P9I9fc8ulctgZsPZ24QN9uqyWWOUnnTdf17XD7Cspwfetd4P4
	WZ10o5fnlw7dtYViL1PaCo035maHHM8jVald3JXuUcviBNtet700NWFMf7iRStW6d+OpoxjeqND
	mPveXkpaSs3wMhv1HZ2W7RC+G/fvjTVGqyem+4j1VUafgKdBxZ2ow1WLy1nt2gyU89zrT2ZyR4k
	yynTSRYYVfHnHh/dF+Oqag6W9wHoWMyqPaN7D8nYrKU9VZPiSSmPgPzXNNhvdP5UvM+xWfUrTvu
	N/m5RBN230xjaBrdciojfBXzPQiHEFMoBl3sMyMw==
X-Google-Smtp-Source: AGHT+IFIVt+/tdqSUiLxiFU/IaiqCnvUOdwWT9NHpHXxTczIiC5LUsjaXO1625aooqF/NTCZiKX43w==
X-Received: by 2002:a05:6512:23a5:b0:595:76d6:26f4 with SMTP id 2adb3069b0e04-59b6ef0945amr6101844e87.5.1768214993308;
        Mon, 12 Jan 2026 02:49:53 -0800 (PST)
Received: from pc636 (host-95-203-18-139.mobileonline.telia.com. [95.203.18.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7a0ca367sm3018309e87.38.2026.01.12.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:49:52 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 12 Jan 2026 11:49:50 +0100
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
	akpm@linux-foundation.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	cem@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, npiggin@gmail.com, willy@infradead.org,
	david@kernel.org, ziy@nvidia.com
Subject: Re: [RESEND RFC PATCH 0/2] Enable vmalloc huge mappings by default
 on arm64
Message-ID: <aWTRzpqU5yWhlV3u@pc636>
References: <20251212042701.71993-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212042701.71993-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024956_429936_0348C009 
X-CRM114-Status: GOOD (  18.02  )
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

On Fri, Dec 12, 2025 at 09:56:59AM +0530, Dev Jain wrote:
> In the quest for reducing TLB pressure via block mappings, enable huge
> vmalloc by default on arm64 for BBML2-noabort systems which support kernel
> live mapping split.
> 
> This series is an RFC, because I cannot get a performance improvement for
> the usual benchmarks which we have. Currently, vmalloc follows an opt-in
> approach for block mappings - the users calling vmalloc_huge() are the ones
> which expect the most advantage from block mappings. Most users of
> vmalloc(), kvmalloc() and kvzalloc() map a single page. After applying this
> series, it is expected that a considerable number of users will produce
> cont mappings, and probably none will produce PMD mappings.
> 
> I am asking for help from the community in testing - I believe that one of
> the testing methods is xfstests: a lot of code uses the APIs mentioned
> above. I am hoping that someone can jump in and run at least xfstests, and
> probably some other tests which can take advantage of the reduced TLB
> pressure from vmalloc cont mappings.
> 
I checked how often vmalloc/vmap is triggered when i run xfstests. I think
it also depends on env. and can be different from one setup to another.

"echo vmalloc:alloc_vmap_area > set_event"

urezki@milan:~/data/optane/xfs-test/xfstests.git$ wc -l ./vmalloc_traces/*.trace
    2875 ./vmalloc_traces/generic_036.trace
   30117 ./vmalloc_traces/generic_038.trace
    8481 ./vmalloc_traces/generic_051.trace
   16986 ./vmalloc_traces/generic_055.trace
    6079 ./vmalloc_traces/generic_068.trace
    2792 ./vmalloc_traces/generic_070.trace
   26945 ./vmalloc_traces/generic_072.trace
    2772 ./vmalloc_traces/generic_076.trace
    2750 ./vmalloc_traces/generic_083.trace
    3319 ./vmalloc_traces/generic_095.trace
    2855 ./vmalloc_traces/generic_232.trace
    3537 ./vmalloc_traces/generic_269.trace
   21265 ./vmalloc_traces/generic_299.trace
    3231 ./vmalloc_traces/generic_300.trace
    3050 ./vmalloc_traces/generic_323.trace
    2831 ./vmalloc_traces/generic_390.trace
    4296 ./vmalloc_traces/generic_461.trace
    4807 ./vmalloc_traces/generic_476.trace
    3198 ./vmalloc_traces/generic_551.trace
    3096 ./vmalloc_traces/generic_616.trace
    6495 ./vmalloc_traces/generic_627.trace
   11232 ./vmalloc_traces/generic_642.trace
   11706 ./vmalloc_traces/generic_650.trace
    3135 ./vmalloc_traces/generic_750.trace
    5926 ./vmalloc_traces/generic_751.trace
   77623 ./vmalloc_traces/xfs_013.trace
    9172 ./vmalloc_traces/xfs_017.trace
    4145 ./vmalloc_traces/xfs_068.trace
    2982 ./vmalloc_traces/xfs_104.trace
    7293 ./vmalloc_traces/xfs_167.trace
   18851 ./vmalloc_traces/xfs_168.trace
    4373 ./vmalloc_traces/xfs_442.trace
    3550 ./vmalloc_traces/xfs_609.trace
  321765 total
urezki@milan:~/data/optane/xfs-test/xfstests.git$

Time execution is different for each test. For example "xfs_013" test
takes around 200 seconds on my system and is in top of number of calls:

77623 / 200 = 388.115 calls/sec
200 / 77623 = 0.002576 = ~each 2.5ms

Please note, i have not checked impact of your patch on time execution
or how TLB pressure is affected.

--
Uladzislau Rezki

