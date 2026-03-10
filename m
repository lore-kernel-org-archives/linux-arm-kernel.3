Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0EDEB1043
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fButc+f13SCo47DSHV1k0O12zbFQiKqnmSQCu0ZA38k=; b=TZOS1WP7J4Dras+1b8k/TJoEGT
	YQ9uzgJlAtxR2UxQCupeanVVefntixYS3Q61OiDaUIfxDUGUYVEnD3ZuiN8wqTnf0Nvz8w3+d8zuR
	R/t3UaP2a52EHvKxbFopmrRbptbjSLN0+5E9utVVAhA34RuUh+1dTUsNmycsa3p9FLeMQvQKMfxhE
	ThEQpHv97MPxkq2l+elt9sWrKl9lyn43gbeJ9S7XgKsNXNJtbDPf2FScZ11WzVeO92m1a63tcHFrU
	Y2RXB1RQ/o3R8X2GeX0sVWkiXbRLMTm2R4D+qhBTM1BnrnhKkqxNdOH2L5dqxti8SmbeRTw3kenV+
	ykZ974jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuct-00000009E7S-3pr8;
	Tue, 10 Mar 2026 10:47:47 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzucr-00000009E6c-2AUE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:47:46 +0000
Received: from pobox.suse.cz (unknown [10.128.32.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E03F64D226;
	Tue, 10 Mar 2026 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1773139661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fButc+f13SCo47DSHV1k0O12zbFQiKqnmSQCu0ZA38k=;
	b=UWMiFP8R5afxiY1vuQ2AfsUcr1WPgF1Qou1eEU9EFbNUTnNmjU2xhRK+FMvFyMFlUt2gnO
	0Vsn+JyfhVZAd6mrZmvgRDk+ek8xRs2p2fhPisf+BVvo3HyRqezCjqNtsmzzw8tVzUdtLI
	Ss+RstlXrcChXBYl5zApM8EBmauQiLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1773139661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fButc+f13SCo47DSHV1k0O12zbFQiKqnmSQCu0ZA38k=;
	b=eREMvylQzHgu5Vml5fCzwFY1vZ48NcNsjK/H+7BJbObhdZ6fgGzi8bw0/x3+ZB3Pug1HQH
	9C4447sJyLFfQgBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1773139661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fButc+f13SCo47DSHV1k0O12zbFQiKqnmSQCu0ZA38k=;
	b=UWMiFP8R5afxiY1vuQ2AfsUcr1WPgF1Qou1eEU9EFbNUTnNmjU2xhRK+FMvFyMFlUt2gnO
	0Vsn+JyfhVZAd6mrZmvgRDk+ek8xRs2p2fhPisf+BVvo3HyRqezCjqNtsmzzw8tVzUdtLI
	Ss+RstlXrcChXBYl5zApM8EBmauQiLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1773139661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fButc+f13SCo47DSHV1k0O12zbFQiKqnmSQCu0ZA38k=;
	b=eREMvylQzHgu5Vml5fCzwFY1vZ48NcNsjK/H+7BJbObhdZ6fgGzi8bw0/x3+ZB3Pug1HQH
	9C4447sJyLFfQgBg==
Date: Tue, 10 Mar 2026 11:47:41 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Josh Poimboeuf <jpoimboe@kernel.org>
cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
    live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 07/14] objtool: Extricate checksum calculation from
 validate_branch()
In-Reply-To: <7a1e22454a3fd1d968775c24aa0529a4ec7c5886.1772681234.git.jpoimboe@kernel.org>
Message-ID: <alpine.LSU.2.21.2603101144410.14672@pobox.suse.cz>
References: <cover.1772681234.git.jpoimboe@kernel.org> <7a1e22454a3fd1d968775c24aa0529a4ec7c5886.1772681234.git.jpoimboe@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[pobox.suse.cz:helo,pobox.suse.cz:mid];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_034745_837508_25BAC091 
X-CRM114-Status: GOOD (  12.91  )
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

Hi,

> @@ -3691,9 +3691,30 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
>  				 struct instruction *insn)
>  {
>  	struct reloc *reloc = insn_reloc(file, insn);
> +	struct alternative *alt;
>  	unsigned long offset;
>  	struct symbol *sym;
>  
> +	for (alt = insn->alts; alt; alt = alt->next) {
> +		struct alt_group *alt_group = alt->insn->alt_group;
> +
> +		checksum_update(func, insn, &alt->type, sizeof(alt->type));
> +
> +		if (alt_group && alt_group->orig_group) {
> +			struct instruction *alt_insn;
> +
> +			checksum_update(func, insn, &alt_group->feature, sizeof(alt_group->feature));
> +
> +			for (alt_insn = alt->insn; alt_insn; alt_insn = next_insn_same_sec(file, alt_insn)) {
> +				checksum_update_insn(file, func, alt_insn);
> +				if (alt_insn == alt_group->last_insn)
> +					break;
> +			}
> +		} else {
> +			checksum_update(func, insn, &alt->insn->offset, sizeof(alt->insn->offset));
> +		}
> +	}
> +

does this hunk belong to the patch? Unless I am missing something, it 
might be worth a separate one.

Miroslav

