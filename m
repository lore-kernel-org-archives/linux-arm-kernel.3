Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B399DC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=; b=n0bm+WkxgzswPRrWpoR/LHX3+t
	aPtinzyc4WibWSnXCCBato6u0ALxBSnBvu4H4yjOkr13qnw9xpm53BDdAGltXWob6vJsj+NlOR2zQ
	sWGCwZ7cWKTOOe5TbfLRIEsH1Gatce91gWiy76IKGUaHGMl+apKJAMYjaMKk51qfC5LXFgbWECo5A
	9qXlmZLvj1GsTVKE4ZOjUg0jssasZuPrMoS8iFoTgBtKjgsivZpB1Iol7RdFtgRixyObWxoM1Tqzv
	uCyoVtp+bOAv39CfWGN4rjchgAub1nZ00x73xBElGMAFv2bM7UuVlr+tlEYFRodZs5Ajj4OunjcCt
	uZ8Z7bUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAevG-0000000Fx3l-3fIj;
	Sun, 27 Sep 2026 02:47:26 +0000
Received: from mail-oo2-x29.google.com ([2607:f8b0:4864:31::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAevF-0000000Fx3L-1In2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 02:47:26 +0000
Received: by mail-oo2-x29.google.com with SMTP id 46e09a7af769-7fcb425fc2bso1336117a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790477244; x=1791082044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=jzl3dfS18RNIJ5CaPk7PlwwexqhnovH4kzyyTOiciGGqMf/yqUR04m+oLD/CTuMtIU
         9Ou+KC5Pv+EDFt7JAVp1VT5o3thTRLzuwWtTroDLgeUTvfcEOxvKPESuKueaf9UHX26v
         GFyKlmWWki4+Gx+6ldx8mHiUmcNMZRXPb14eOu36JxcaR60AG/vHf/BjNECDBHqTJY/5
         95a5x16lu2gspsXWX4k/QNpeojgwuXbwdWABacyZBKgBmnPqLGaNU+tlk4Yg9Jr6xuyl
         WcA/poGhO2IeQQs+eP6EHONS/A5POt36/sSWa7NQ4uHnfKj/7SWov67pniUGw1izYkwY
         +LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477244; x=1791082044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=wNOa+V44l9RDAPNQda2aZhK591r/B1PuahldtZCu5P+4AdsCZuFSBFnSgQugn1kUSi
         AFyouvNmBxy8BLgu/z71Zc4whtnLhJeDVYFpOMtNJjVwcuF9vJdYhSWuyRE4nGgptHB7
         8fGgTHgyK+F2IiWZV0x+sQDCDCvpPXzzgBcWpWCpeAuZ7dWPNsKJ1mwEHsttZfG8RgE5
         fsHMewTxPaH8DluebEo2IbF/rI+zbC6IsMP3LzlyvxBCCyWxTwZvHcJC0lWgdrYRA8Lz
         QOtJjo5MJYSxOCS9vRx8oLgfagKJmmKP0nHk+G/FtjXQYXjGmw4nlY/RS3Bn93aE+8GB
         2tcw==
X-Forwarded-Encrypted: i=1; AKwUvBxH30Y/tWhNjxGFChbclCm+VXMVHO3bWB2wvrsLFfSVSRUvEdwrujy9ZoORmgj5wTOMrh/x5+ZKbdf0GNjMi3WO@lists.infradead.org
X-Gm-Message-State: AFuF++lIUNgBuuYQ3B8ZDj61TgqAWCmpu1ML4/AETCut5Mbj85SXyBQv
	YexBMyiRZrH9akioY26gscgGNxETvi6MZoP14XYRq8VjFjKbQhUYiZ0C
X-Gm-Gg: AYBFou2LFjEoMqX1kPGtpaYs9wf19zF/Yrflu9lutpLPFtCaaqMPZcNe68IO7vmv97F
	sGwx+JtkGFGRz9QDWalyODo9zq05jTI4YU+N6YvQKFKj8X1Iep0JWc+y1ww7Svy+3JYJXvcXCGo
	+cNBpLFPsVyO+EUMY6I7l5xdnyZJXOVhDHwIpk7hKvHKfcokpa7baJeNEowSCVirOKo6ojqirhk
	R0RWsAX9MhzPHAPevkKCP6hbCAgxhffB0wY7P552fweHVMOQoy87j3o35NX/9dOf5IvmlGmSKqX
	EAiQt+K08c3qiCmL+Nzju6/issD02ilAry0Dj2sia4Jx5zjMvXU220ZSayZKi87LsA3sZ+mwiAZ
	sUBo6VOxRPqVgcStkPNxqnEmfT2cgyOwhPLrFR4XA9xUdPH8vm9eC/adI9VvWRygmOb9SPGOsgf
	WfFkdh0MWQdkKdXmh/HJVtEww+Wq0JBFnadeqcMDE5L1FgOxUgtW9kZEtx94nhvlD+s/bCZezzr
	kzlkdGNCWL3ql085Wjiw7ZnoV1y5Qe8oyn50RGEpoEzGo9H8GNIrrYMrZPwY/KbyqiYYOq3z33e
	cdBHyT037xFuEj4=
X-Received: by 2002:a05:6830:6686:b0:7f4:edd8:b7eb with SMTP id 46e09a7af769-81780d976d8mr11093358a34.6.1790477243868;
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e33f6714sm6626099a34.0.2026.09.26.19.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Date: Sat, 26 Sep 2026 21:47:17 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <ariDteQPQ7BGtZZW@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <arfs_kX_gkH1o_S-@fedora-laptop>
 <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_194725_381359_675F7453 
X-CRM114-Status: GOOD (  24.85  )
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

On Sat, Sep 26, 2026 at 04:06:02PM -0600, Jens Axboe wrote:
> On 9/26/26 10:04 AM, Ming Lei wrote:
> > On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> >> Hi,
> >>
> > 
> > ...
> > 
> >>
> >> This is obviously an RFC, in terms of what I'd love people to take a
> >> closer look at:
> >>
> >> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
> >>   Is the set of refused states complete enough, and is moving
> >>   thread group leadership this way (the leader must stay first on
> >>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> >> - The x86 and arm64 register state handling. x86 refuses AMX users,
> >>   and arm64 refuses SME.
> >> - Whether anyone relies on a task's user identity staying on one
> >>   task_struct in ways not covered above in the series.
> > 
> > This way may break ublk server given 'task_struct *' can be changed
> > because the server issues blocking OP(fallocate, ...), then the
> > `current` check in ublk_dispatch_req() can be hit.
> 
> Yep, which is why is isn't enabled there.

If you mean .blockable isn't set for IORING_OP_URING_CMD, it can't avoid
this issue, because io->task crosses IORING_OP_URING_CMD, and one
io-uring(fallocate) changes ublk server's `task_struct *`. It can be
solved in ublk driver by storing and checking tid.

The usage is similar with prctl(PR_IO_FLUSHER).

> Known gaps are LSM state kept in the task rather than the cred, and
> PR_SET_IO_FLUSHER. Neither moves, and not moving them can only ever
> restrict.

A spare forked before PR_SET_IO_FLUSHER lacks the flags, so the user
thread loses them after the handoff, for good, since later spares are
forked from the new task.

> 
> > Also there is risk in 'task_struct *' keyed bpf task storage.
> > 
> > task_work queuing could become tricky too.
> 
> Like the above, the series does attempt to handle that.

I meant kernel tw uses instead of io-uring's, one example:

With CLOSE + FSYNC in one io_uring_enter(), the CLOSE isn't blocked and its
CQE is posted before the syscall returns, but ____fput stays queued on the old
submitter until the FSYNC completes because of handoff, so the app still sees
the file open.


Thanks,
Ming

