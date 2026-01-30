Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE882E6BF1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT8n7mz5blgMVxk1kwByCayfJGNrikSmLo3SENj10Lw=; b=qZREVkjOOUbFnXWTZMVNWZtvpY
	iv/CyZzVu3X0GEZpDXB7CrPRCWN894huKWiIzFQHLGYLxx0zmm5JulgHHgjiXOz2KmBF41U4iWiFi
	BNf50VcGR6cDii835wEa1TuxoqYif3ZLDvT+bh7j309idOjMg9Xva8MuDinif6I35hPfWh9T2+jaX
	7lxSBf4+/M+yKpVa2MYT1JIv9jULXz5/Mj/PvJW+Qu94mbiyU5nC9vd8ZKY+iIoqDWqeywGZpuuum
	fKQqhxYODh2/Vlzfidm71xq5Qt13i1OCTOaHdJmL5hIhYpIKW6jkmiEo10+8C6/6473IMeAFXizt6
	g0dWabnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq0S-00000001c6w-1abv;
	Fri, 30 Jan 2026 15:01:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq0R-00000001c6o-0YAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C6596001A;
	Fri, 30 Jan 2026 15:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69C1C4CEF7;
	Fri, 30 Jan 2026 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769785313;
	bh=jcI6FHxj+KHvDboDOSm66IUrFEGKvpzUg4I0CKx4Wrc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=stFcnulcSsZzbYrPkxAQSO6XbNqjmD/rteaSiwiuuy488UrObmFC1bfAGGRRgYqRr
	 8Vdb1dPSvXTo7ElbWqgIXwgB1JpoaPBBz1lHdJfjiGZ8EQSK70V6e6Dv3ICK/lCUWZ
	 sEQQ/CPBt3WLCLoqm9i1tKQZH86SWgpNmS50n5IkGZEaG3RaldVd0Zqfx2rHITTrth
	 soMO2df1BNV08yrlcVlt66aVe3hPsjMmd+c7VSRMgiU7f1cEly7p6UsOY8D1vQTkZu
	 FauITEOLZuCSvz3xXsGKm7CvfWnD1wo62Zxqhy3s81j9HYeR6+iRMPeMX9dk7UTvoF
	 1o2yo7ms0+BTQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de,
 akpm@linux-foundation.org, charlie@rivosinc.com, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 09/14] entry: Rework
 syscall_exit_to_user_mode_work() for arch reuse
In-Reply-To: <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
 <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
Date: Fri, 30 Jan 2026 16:01:50 +0100
Message-ID: <87cy2rkuu9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jan 30 2026 at 14:27, Kevin Brodsky wrote:
> On 30/01/2026 11:16, Thomas Gleixner wrote:
>>> Agreed, the comments are essentially describing what each function
>>> calls; considering how short they are, directly reading the code is
>>> probably easier.
>> No. Please keep them. There is more information in them than just the
>> pure 'what's' called.
>
> That is true before this patch, where it made sense to highlight that
> exit_to_user_mode() must still be called after this function (without
> re-enabling interrupts). With this patch there is however much more that
> this function is lacking, and it feels very likely that comments will go
> out of sync with exactly what syscall_exit_to_user_mode() calls.
>
> I suppose we could simply point the reader to
> syscall_exit_to_user_mode() to find out what else is needed, and keep
> the comment about the calling convention being the same.

I've picked up _all_ four entry changes and reworked the comments and
changelogs already.

Those patches should have been bundled together at the start of the
series anyway so they can be picked up independently without going
through loops and hoops. When will people learn to think beyond the brim
of their architecture tea cup?

I'll go and apply them on top of 6.19-rc1 into core/entry and merge that
into the scheduler branch to resolve the resulting conflict.

ARM64 can either pull that branch or wait until the next rc1 comes out.

Thanks,

        tglx


