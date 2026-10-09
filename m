Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C89CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFmWCi2up5vRqSBkWFUwHEbyNXCZg+vH8tf6YUwRZ+E=; b=gAHiWygxoTLrdrI17wJbHsQc8Y
	IbKe0JqmWdRVkZ26tlARv4rOeMKxxZcIYkkM1wDqgR4tzD0+WSDkEbdUMOmTJzfol/MALB45C9tye
	Kb9EemEOhVVHAH86yNw14Zm+wUxcmDPsW/ijXmNyIKPLPwbjij8cMIXnIfTFXWGKE4n8pHazH8WoI
	YHGXNM0qD5ZGkDauWHKmt7SoTtn9Vuoo9SJGCWq15LEV7LHKy3JZje/P8d/1Gse40BfUYG8CdDQhU
	GevrhJrqLKV2+jgiT44Y8l4nllAEE35uu8eon9b6PUXr1yrqE5jD3JhO1lpok8qUaCUFziLNTpBZ5
	On9D/Rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Rx-000000068Y0-1wpv;
	Fri, 09 Oct 2026 11:07:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Rv-000000068Xb-2EjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:07:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F100C60DC2;
	Fri,  9 Oct 2026 11:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C001F000FF;
	Fri,  9 Oct 2026 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544058;
	bh=jFmWCi2up5vRqSBkWFUwHEbyNXCZg+vH8tf6YUwRZ+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gDU7cn51regFtSN9oMtRGZ+jprWSuvIKY6x1hSlPtwFlZjPUaI0yz40uNMQ2Wfjmz
	 VKZ9L64iEdFIoz0eox0QqJHZArTjAyNmW8QvxbwltRlrD5ZbUhbQdmZjR69ZeQhNAC
	 /gktJFy7HflqRMbMKAzYPxrpjvmxvX+QXHdjDvYNqwllodgsnUnUVPEH12AMnvWvr3
	 DwyCRHB07y7AKTVBo69yRYaKYvXGCtx/K35pVUGy4rvkBaTwhc3ykCzy5U4f8/gkjp
	 lnyB9vAKqt4lddMVYU6bh1idXculVyd4O8liGKAb7UQc8HEUutsbymVo4LAX4Afhza
	 vtoAiB05RaayA==
Date: Fri, 9 Oct 2026 12:07:32 +0100
From: Will Deacon <will@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	=?utf-8?B?yJh0ZWZhbmlh?= Ion <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 03/23] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
Message-ID: <asjK9JyBgopYxbyn@willie-the-truck>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-4-will@kernel.org>
 <7ba9bf65e714a17657252a7fb267928f8215bc06.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ba9bf65e714a17657252a7fb267928f8215bc06.camel@infradead.org>
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

On Fri, Oct 09, 2026 at 11:46:11AM +0100, David Woodhouse wrote:
> On Fri, 2026-10-09 at 11:07 +0100, Will Deacon wrote:
> > Change cpuhp_ap_sync_alive() to poll using atomic_cond_read_relaxed()
> 
> relaxed.
> 
> ...
> 
> > +       atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
> 
> acquire.

Oops, I'll fix the commit message. Thanks. I think we need acquire
semantics here so that the AP sees anything published by the BP prior to
advancing the state.

Will

