Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpgOCEZuVIUWNep2gTFj8ylP6/HyHac52qszIRih0MA=; b=wS2GgaCxVQJ0Vcnzv/hyH6bv/B
	5meSAPvMt5qLybZTq8RVXatXZ7XlX6Lv7t5jtt22ofSqz5soJuADnhAO3PSSTfdL8whf0PAgsMW6Q
	FXeeVbKevvDOaNSLoTy+wnyz8fJsnmZqrAWznRBgmJo6pl7oEPvwbx6K0gvwEzjQUdQ+ZBWgnwqO2
	D8vYRLNCcfr/gNFCcE/VLEc/67XAOaYqSfo9mkRgw2Fu9uyKHhf0nNWjpGbZFdkGjIqxtixSkFmqA
	IvzfUes5joS2hCdWUwMMeuOgOAs74RJ4u1e2ZxsZZ92IRFX3K4QKKg7YO2v8xiF6c91BsDQ9vxXar
	dma9bz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRO6-00000008doD-3uYv;
	Wed, 26 Mar 2025 14:05:46 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR7E-00000008bMM-3750
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:48:22 +0000
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7921B21179;
	Wed, 26 Mar 2025 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1742996897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CpgOCEZuVIUWNep2gTFj8ylP6/HyHac52qszIRih0MA=;
	b=ncox97gATOX1alCd8mq6tMQ+oN4cqL7jSUyXj457qSKzkZ0wwVDb6s22LmHLmdDrIbEv7m
	tj3S82ZSwDi6rr+7+VSppcricoX2dq5P1xkjwCeILRV/CCugFh0R8HvF244ewHqntUeqIi
	qL4FhvAbn/7+FK07EUFQosNn6jztpWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1742996897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CpgOCEZuVIUWNep2gTFj8ylP6/HyHac52qszIRih0MA=;
	b=K/zATkkHnM9kjBG8iYRQBG1YwQdnPko+sQoF0gFiV6R2inYPMAgxuA+dkiqlZ7RKLx7Nqa
	i9I2r+OSAeN/C6Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1742996897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CpgOCEZuVIUWNep2gTFj8ylP6/HyHac52qszIRih0MA=;
	b=ncox97gATOX1alCd8mq6tMQ+oN4cqL7jSUyXj457qSKzkZ0wwVDb6s22LmHLmdDrIbEv7m
	tj3S82ZSwDi6rr+7+VSppcricoX2dq5P1xkjwCeILRV/CCugFh0R8HvF244ewHqntUeqIi
	qL4FhvAbn/7+FK07EUFQosNn6jztpWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1742996897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CpgOCEZuVIUWNep2gTFj8ylP6/HyHac52qszIRih0MA=;
	b=K/zATkkHnM9kjBG8iYRQBG1YwQdnPko+sQoF0gFiV6R2inYPMAgxuA+dkiqlZ7RKLx7Nqa
	i9I2r+OSAeN/C6Dg==
Date: Wed, 26 Mar 2025 14:48:17 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Song Liu <song@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
    indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
    irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
    mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
    rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>
Message-ID: <alpine.LSU.2.21.2503261447500.4152@pobox.suse.cz>
References: <20250320171559.3423224-1-song@kernel.org> <20250320171559.3423224-2-song@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_064820_953368_75807505 
X-CRM114-Status: UNSURE (   8.42  )
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

On Thu, 20 Mar 2025, Song Liu wrote:

> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> Signed-off-by: Song Liu <song@kernel.org>

Looks good to me.

Reviewed-by: Miroslav Benes <mbenes@suse.cz>

M

