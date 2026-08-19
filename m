Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA750C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk5X8IvcrQF7wqe0wB7W8SN6CM872QzkIcdcGmdDliM=; b=QSImyBHs+hZ62ZTidXMeGzwLcE
	YjvGTVtOL0mwJKXziSAIGs13yPGhZpErnqLpNhMMYn0BYD6RvCJwOlpsSVP5VmHFrl0pFhc0Fobgl
	Y+pN8dtw9KPtGbsoTjyEJTJjOc++DUtGjNehnW/rgGJFFZzazsrXB2Jl4Ev7mitHnrobRmp7llXd7
	3YjCSPa1ozI0ABsrR40KbkhO3KMc2Qk+DGThiQN6aDQj1xynZdEo8VAmwFJ8dooT4/vhw5wPr6U7P
	PIe1m8IiUUzCLE8qeJXx0DrbZtvQkiQDG6os/rWp5zS1PAV++1x/RVIcxLaudc4SKBOMRT6klTVC3
	0YxBsWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhW4-0000000A0Vx-3qyT;
	Wed, 19 Aug 2026 14:43:44 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhW2-0000000A0VS-0k0i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tk5X8IvcrQF7wqe0wB7W8SN6CM872QzkIcdcGmdDliM=; b=tyC4IsKKLfdCZX31ZzIcqL9D/F
	n6IOfdQPUR4/O+LFSr6JSJyqBdNAGuM7fUpfrqjqmY9kGKMJxdKWnxUoNf3lsIWPTzjBVZkOZtlDJ
	4sNFJBFWqsZylEbzM/QmpHMEfRNcAUuFzNn68L8jwxQQ3V7eQCh06kjI03+kcJfZlNLtq1K9Lm8hv
	lkUo3U6xxl3zyR3g9TeUwm8x2lERthBB99QKW0O/fLdaK05y66xYaXcFvUY+uGjMUAJspdvXoz04U
	XxNEfmnUVzna0iGHuOAChS6gg0MmAep7xKMHH0sw6P4dzR2CUipqeqdPkkpwnALM+q0C29aUqLIZo
	cTfRnzbg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwhVs-009rX7-30;
	Wed, 19 Aug 2026 14:43:33 +0000
Date: Wed, 19 Aug 2026 07:43:28 -0700
From: Breno Leitao <leitao@debian.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <aoXAdSY_EyPlOOnK@gmail.com>
References: <20260817022335.3-1-kobak@nvidia.com>
 <20260817022335.3-2-kobak@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817022335.3-2-kobak@nvidia.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_074342_218529_42123902 
X-CRM114-Status: UNSURE (   9.31  )
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

On Mon, Aug 17, 2026 at 10:23:33AM +0800, KobaK wrote:
> +static void cpumod_attr_read_remote(void *info)
> +{
> +	struct cpumod_attr_call *call = info;
> +	u64 *value = cpumod_attr_value_ptr(call->subsys, call->attr);
> +
> +	*value = cpumod_attr_read_reg(call->attr);
> +}

Why do you need value in this case? Also, isn't cpumod_attr_read_reg()
anmd returning to a variable that is never read?

