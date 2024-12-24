Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D69E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 06:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/eYjt1YNWe+BS4z83PEijl/eA/1gkbPcpUvLK03t90=; b=ANf6/G2mMr4cIw3uHfaXROyBzY
	0FewPUL6dUgAgYbwK99gbvNeBQ1bBeD2vSd04BKqRD4TqD9NBsbf/9J98dl2RHUuO3fHPzpNJ6cqx
	HRBvkPFc3DhWChTW0wk8DAtg28FvPvIUXUcu7vRpbUNQde4rlDbcbfTaAB8W1sYBMkeA0XgzzbzKn
	yw8CGrOK3kkM46PXdbyB95QxSQ2DpPKRZhHtrbo7I4zM8R/sUljo3Jz0tFB38hFR41Dg/lwN3j1f6
	8SkCeNKTi2ERi/dXV+c/4Zwmq6SSFgt7aAKWd8sofQV7iyBPe92ThGqUSb+HxcaP2Z9BMZsbvcX3l
	cZpoNtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPymt-0000000BOIt-0p3P;
	Tue, 24 Dec 2024 06:53:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPyli-0000000BODy-11Zw;
	Tue, 24 Dec 2024 06:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E05C5C4C0E;
	Tue, 24 Dec 2024 06:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82464C4CED0;
	Tue, 24 Dec 2024 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735023108;
	bh=ziqgA+4cQyECAcPibuRjTjPwIwUUuJchTAYtrhObgG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2l9+wDfKH5Sy/3RTTReRB+k4AXnFFbn0JGXhnhvwxjZGRy5pOWINChNGRxZtKTSp
	 ZWu7isB6yuSpu4/aPRTAvez5dciTYg/lJZl4bV1OPCUpxFxSrlpzFwc/Ty124IFHva
	 cqkk1f9tgNRVTIvs1ZzukpajMBkPiuGpiOAE4QBqxQxc0sUMIsoW6N8XxZBKZkjOo9
	 z5stvhnspV+Lfbfni/uknKrEwZZsCM1OY6S+lYQlS7HKJaWKJS7rSVyzm/LlBLo7iF
	 8UOabiFet3EeDnxvxX07SG00jVFBhN/wJeeoZbriK415a3ehF7Yp+JhYEeHDfMLyrF
	 ae0VoAYuUy5IQ==
Date: Mon, 23 Dec 2024 22:51:46 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: wzs <wangzhengshu39@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, x86@kernel.org
Subject: Re: WARNING: kernel stack regs has bad "bp" value
Message-ID: <20241224065146.5ety7gme2tndv4dq@jpoimboe>
References: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>
 <20241223141135.g5lkpzhz32pcpzku@jpoimboe>
 <CAGXGE_J6zQip-4jSMghKXSHnE2dASLF1maw9Ev-4EwyfJL99Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGXGE_J6zQip-4jSMghKXSHnE2dASLF1maw9Ev-4EwyfJL99Mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_225150_336293_81E13E93 
X-CRM114-Status: UNSURE (   9.49  )
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

On Tue, Dec 24, 2024 at 11:17:30AM +0800, wzs wrote:
> The output of objdump -r --disassemble=vmw_send_msg vmwgfx.ko is as follows.
> Since the content is quite long ,i need to split two parts for saving.
> Similarly, I have also saved it in the attachment.
> console output 1 : https://pastebin.com/mBi6fTdM
> cousole output 2 : https://pastebin.com/89SMLgCy

Thanks, this seems to be caused by vmware_hypercall_hb_out()'s misuse of
the %rbp register.  Unfortunately there doesn't seem to be a fix for
that, as it looks like a hypervisor implementation detail.

The good news is it's probably nothing to worry about.  Regardless,
frame pointers aren't very useful anymore and I would recommend you
enable the CONFIG_UNWINDER_ORC option.

-- 
Josh


