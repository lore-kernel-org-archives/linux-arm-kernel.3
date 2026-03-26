Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F2810A1E63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/oy7ceZgq6kafjM27/5aikAaDW1La3Nrm8k/wtuaRI=; b=OuCniwm5KQ8Kw1mJYDlhU03m1y
	0vSsPybO/rl9i3ba7Nudx7+M2cYMk9tPjguumiOSc6lMs1bOuZeEz5jUId541TXwPa2bNJQH4mdB0
	I0wH3rCd0fxPsBxoftHJf/74OP2CFgP+/peWX5f7slVADCNcso5Z0X+tjZu64n8yMweyieP6lyp8k
	oQKDZzlI3v4Xi830oFQd9b91QbJGGn2d8ksBEf7mSngNFErTfu9Ttaq+T9V/WdUpMnP3rzzsVLb49
	g4Zo5R3YJPnafugq5tLIyLRJ+fYR4UG6fyOgIp/78zd+0S/quKh7Ju9YnVXmqrXQGOSZfY0EZOOjj
	aohZVFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pW0-000000062Z6-1tzz;
	Thu, 26 Mar 2026 18:33:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pVl-000000062W2-3HNQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FE3C60054;
	Thu, 26 Mar 2026 18:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A31C116C6;
	Thu, 26 Mar 2026 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549972;
	bh=bFKagJn+6VDiIWYvBH/rDFVITDPxEwgu5uxJ1+f8eDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u71b93l3C5wk+oII1bPNa23kdKbAW1wkyQjBN3khkWAxcQjKrWhpc6NVHMb9YNvIM
	 h46rJrmUkzR8J3U34//01RdQRBkCeMBnUqGzTH65syUaFFxTuJ4LJC4j/ZejGsPh3g
	 Z5vCfNyi0l0qe0s4sT4aNSwTAkWJGG8p08/zVzNC43JPcgPW6v0GQ3CfEu5W+UgAJy
	 EXeJ3WSnr+lp0OierY33faj7KaJDTo45ZBO+w5XuMTUXElHBfRSM8W/9IdUws+Alc2
	 OwwbXfyLaEru3CLEuEDwJ+CkJLDuc9Q5L5zWo5sHUAn4N2lOD6RGyXmq3FOy/ixoMw
	 2Zxd2WxLBbhbg==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <acV2552t5X4OlNYi@J2N7QTR9R3>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com> <87fr5six4d.ffs@tglx>
 <acPAzdtjK5w-rNqC@J2N7QTR9R3> <87ecl7gbeu.ffs@tglx>
 <acV2552t5X4OlNYi@J2N7QTR9R3>
Date: Thu, 26 Mar 2026 19:32:48 +0100
Message-ID: <87jyuycugf.ffs@tglx>
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Mark!

On Thu, Mar 26 2026 at 18:11, Mark Rutland wrote:
>
> I've pushed a (very early, WIP) draft to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/entry/rework
>
> ... which is missing commit messages, comments, etc, but seems to work.
>
> I'll see about getting that tested, cleaned up, and on-list.

I've pulled it and looked at the v7.0-rc3.. diff.

That looks really good! Thanks for taking care of that.

As a related side note. Seeing that even more of the generic entry code
is moving to include/linux/, I'm pondering to move the content back into
kernel/entry and include those "local" headers from the
include/linux/... so that everything is to find in one place, but that's
a purely cosmetic problem :)

Thanks,

        tglx


