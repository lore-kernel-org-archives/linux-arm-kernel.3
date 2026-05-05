Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42835CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHZTb6n+KvqvYEtebqkQe4HIy4j42NHHqjdkTR0J2Hw=; b=EgiISubH02Da8DF+XQm0NcQ/sf
	qHUdNSa3exjtVYgrTlV6IfybynvF68bkkzst7agAee32ct6IK6gSgBWvraOmLIi1sSnTaWUdDXxpW
	aPCqlBeYhipGcFrYn+TecP1eoZQGy/r0ySr/Xqh5jNvJJsNY+BBTplCeuiUGmTfXDDXvxthvaI8C+
	hIRo0rLQMs/cRJB1wPKbLdAYLFjBQD9nzTYU4FmTk4IFnejYlvIb2y0fbjpBnr3yF1MyhdTZDhq00
	8CT47yQNka5vOWHMt78mjEYzn1GzDfdufUwhIbLo7h0AIbCujkdNjrDoxZEoheZiHDlZu6qK9zMRQ
	d/df4LGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFxY-0000000GMFb-44Ql;
	Tue, 05 May 2026 13:37:12 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFxW-0000000GMEq-0rqk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VHZTb6n+KvqvYEtebqkQe4HIy4j42NHHqjdkTR0J2Hw=; b=YB6QYryUqpX2gSTgIChWdZ9EHo
	oFk0vGvoxBh4K9fqxQibZe09Jg6ig8cOEJ8YXAG/IEuNN9aOmv7H6puIjHOKef3TVW1rbw/TlptZ3
	YBrDC/oGfG5p4i8xACHFqzlAKMN3Wj5JYOuROZVB6vZ95Nvw3mxvy9dC4vxnvwcHlBMM17FHcIjY1
	59UtF2t9VkINctNQkSn5+/x079agbUWZ6itgRyhhu8Gsjoe/SvpncqMqEhL/mEXENweTCTSg8qkTF
	yNnxoGgjsellET6FuLk7DwuHiLodMU33PQsXWEP1zCYHvZhai2tiH1W+BHB6QVu+/vWdR3bmw+3aB
	Io4ybtvw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKFGF-002ouv-03;
	Tue, 05 May 2026 12:52:27 +0000
Date: Tue, 5 May 2026 05:52:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Jie Zhan <zhanjie9@hisilicon.com>, 
	Lifeng Zheng <zhenglifeng1@huawei.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Sumit Gupta <sumitg@nvidia.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dcostantino@meta.com, pjaroszynski@nvidia.com, Al.Grant@arm.com, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH] cpufreq: cppc: discard out-of-range delivered_perf
 samples
Message-ID: <afnnPRZBdWlriZON@gmail.com>
References: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
 <7e55dd1e-2841-4918-8e3d-82203a70451a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e55dd1e-2841-4918-8e3d-82203a70451a@arm.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_063710_246088_78DD28F4 
X-CRM114-Status: GOOD (  11.56  )
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

Hello Jeremy,

On Fri, May 01, 2026 at 12:41:45PM -0500, Jeremy Linton wrote:
> A little jitter over, is probably expected. If that is what is happening
> then clamping to highest_perf makes sense instead.

Based on my analysis of the code, interrupts appear to remain enabled
during the delay, which could introduce significant jitter if an IRQ
fires during that window.

I'd be interested in testing this under an IRQ storm to quantify the
actual impact on the measurements.

> But then, this is really
> a sampling problem so does it go away if you double the udelay slightly.
> Maybe the udelay value should be proportional to the reference_perf value?

That's a reasonable approach. What would you suggest for the
implementation?

I considered making it a kernel or module parameter, but I'm not certain
that's the best solution, since the "user" might not know what to
set/use.

Thanks for your review,
--breno

