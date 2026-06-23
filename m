Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441FCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=; b=Fyf9WpFyAVFzGZPgIJF1lypQjx
	6S2dl5XnH7oCxbSHjOwG7cR452aF2R7BNQGegr4vqMrCWtKF3Ia4Fja8rhlkapP1WhbJZWB3jVT+u
	AZsm3w4BrDvu9CxKF7CvOEsCNxIWiG8gNiRMbkBIt3U1IiHmxpCbwoihwFOjfIOBCxFPbAsZiClG3
	S60ZfTUk+r4TYyTeHLZS3Ygte+SofxAt8hLoCBM87NL5k1YSE/6SVnCgvY0eGudGaB7ODAEG3zPsp
	HwYrI9w5PGdCRb1Tr0bnXFrGbQTkMGAgTAEYE5+uLnfX/wv+cdupRcI+LaKptYAW3qKS4wYowIRu0
	GBf68y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5g-000000064CQ-3mvC;
	Tue, 23 Jun 2026 10:10:48 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5d-000000064BG-2Acv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:10:47 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso2798577a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209444; x=1782814244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=iOwLq3A9Mk34emsysJYnX2KmkczzdGk8zhrLdDhQfnK1Qly+Ie81pIOTxw7nOJlxYR
         mi0iKcK8WrHPYxbABg7UYS3hh7cJfgsTw11zBIA+A/Hh6ovtJFcqn5EALRCDBA9vBcK1
         IUAiyMCaUP5695mM+NIhUz6ohLro4hsswD7Bsz6EoVKrM7hd1YWhCq8rjWf5R4dcfUJG
         nH4tiuKCWyH32DVZoMxx9SlSZ1MMdN+217zNrI3/ARU2Xpdg0FmFsIxoyQsgwzCFpsmn
         kAh8KlKhHuToGHi2kdxdZXdLjxV3UwqX7RIuetwpwpYkz353CvEaMAAnxpurbm5jxuUP
         BATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209444; x=1782814244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=gss+XVNjs9j5RrG/btk8+xnoVkzvcDWLaM1c47f6J57MVLYHVGotyB/WFbT2G94doa
         VHq8udeRmDEnmLbm81SaO1Vi2yCAz6EdiUoMsjufJhPozJ1TiPQ8CQIiLZXYmEiOhORL
         X8NNbaXw5JlELpwwFIyyn8+M6osTuIK24zTCzVzIdvIyZk4jTGe85Py8yC6eeNlHzidf
         bPgwBcCR82JVhlnrlfvKT2B/y7/o9CdV57cGyghrYA3IArgvqaPnAWffEjt4FKRCw3Yx
         hkoOXv+0t0W7Ps5Q90rk+uBbY9CW8gDljk36CVN052SZvGFCplbMEhKmxSC+VaCD+rJO
         jO8w==
X-Forwarded-Encrypted: i=1; AHgh+RrslBtOKp5p9qYfZbnKB7A630QDf4ZpEcExUHPPoL/H+O3V3RG9sd8QZKLjIFF2yFB6FjChrl+07GTSHKH+8jWR@lists.infradead.org
X-Gm-Message-State: AOJu0YyoRxSeDlVGtl+BElTpz33CbhNu7B2jic9xGiqC6nn34Mqzqlz4
	yBcFMHd8mFTjAVwJ4f6RCnYxFF+Z/kMh8ux/GUaH5NLf7RLUH/NS8zu9
X-Gm-Gg: AfdE7clCrMcKF2cSEpo06PlzhtIgt0Ae472/h2V35750AhDDAqOjKfQI4MgXyGOO56r
	mCvYXwomuQZWK5HoAtT6BHln1E1NoEeTO5YNBeotxy02rKrNlyh36tlitLYOfgb0Ne9f5L2os2c
	Ih07qw/aJpMcWDIUYDi5GQgvp7a8BF4OYBQ7QtW1K1eW35cNFD6bkFTmh9qcjnZvah/AWB/xuCj
	WLT/jBpGNXmemTfCG4JNWg8tkXi2IWMuW/kcTpUhd+N9QEkL7CGOKLshvGPW/mRDw/j6fVlY8HB
	lLcd0+XKZ6EzphECnJyiKIjYmgTwg1CKc/OzAWIQb8xY/q/uBML2rxK0t9mLO4J7CNw/WalnpN+
	KegARVBoccaQSyC8s4t6ZCcYy0wHuQnXoMnAv7Ic9O9L6RYb3jr2kwrBGjAkwvrBSWrYA7uP7vl
	VADDGS5EzQLtqYlmMXLiHds4pBiGtRpZXjXCJJAS2y
X-Received: by 2002:a17:902:ec8f:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c7c99def24mr17988445ad.20.1782209444473;
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7e0asm118059125ad.30.2026.06.23.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 18:10:09 +0800
Message-ID: <20260623101009.522775-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
References: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_031045_554509_61FD49FB 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

On 6/23/26 10:02, David Hildenbrand wrote:=0D
> I know that especially browser usually use fork servers: a tiny=0D
> (single-threaded) process just to create new child processes. Any informa=
tion=0D
> regarding the apps above that use fork() on small vs. large processes?=0D
=0D
I wrote a second BPF tool (fork_info) that captures nr_threads and=0D
map_count (VMA count) from the calling process at the exact moment=0D
fork() is triggered. Results from 3 representative apps:=0D
=0D
  App (category)          Fork caller        Threads   VMAs=0D
  -----------------------------------------------------------=0D
  Taobao (shopping)       DaemonThread-6        526    8,987=0D
  Amap (navigation)       DaemonThread-6        289    7,120=0D
  UC Browser (browser)    OneNativeThread       350    8,144=0D
=0D
These are all heavyweight multi-threaded processes (hundreds of threads,=0D
7,000-9,000 VMAs), not fork servers.=0D
=0D
> Above you write "some call fork() from multiple threads". Any further=0D
> information on that?=0D
=0D
Xiaohongshu (com.xingin.xhs, social media) is a clear example. In just=0D
tens of seconds of normal usage, fork() was called 22 times from 4=0D
different threads:=0D
=0D
  PID     COMM            THREADS    VMAS=0D
  4206    com.xingin.xhs       85    4,140=0D
  4216    Thread-2208          85    4,157=0D
  4208    Thread-2208          90    4,211=0D
  5200    Thread-3200         337    6,519=0D
  5200    Thread-3200         343    6,563=0D
  5200    Thread-3200         361    6,769=0D
  5200    Thread-3200         453    7,793=0D
  5200    Thread-3200         450    7,779=0D
  5202    Thread-2219         459    7,846=0D
  5202    Thread-2219         462    7,875=0D
  5202    Thread-2219         465    7,899=0D
  4219    Thread-2219         465    7,903=0D
  4219    Thread-2219         468    7,922=0D
  5202    Thread-2219         467    7,917=0D
  4219    Thread-2219         467    7,921=0D
  4219    Thread-2219         468    7,929=0D
  5202    Thread-2219         464    7,909=0D
  5202    Thread-2219         460    7,889=0D
  5202    Thread-2219         459    7,884=0D
  4219    Thread-2219         433    7,771=0D
  4219    Thread-2219         433    7,771=0D
  4219    Thread-2219         434    7,778=0D
=0D
The process grew from 85 threads / 4,140 VMAs at first fork to=0D
434 threads / 7,778 VMAs at last fork, showing these are long-lived=0D
heavyweight processes that fork repeatedly throughout their lifecycle.=0D
=0D
Tracing tool:=0D
  https://gist.github.com/zhr250/ba7725d0ea55594bcafd3cd4806eed98=0D
=0D
Hongru=0D

