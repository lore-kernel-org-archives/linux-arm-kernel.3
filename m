Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46F8CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8QsP0PxfZWQK7EEkk/D6jF94UJEcsiLhTO6sey741I=; b=h6DPRtH0edOPF6sIARYHwiZXRa
	2USCX81esa68rySM8onyNYJarMV/xscZMh4v7gdrFe93UVXuKGmQ4dBE9dax2ISUcpTijeCAupHs7
	GHSg364Coz3RpCNvGKyvi1JDFwX2zUY3mb2YqWvcDZKerQbFzFFAjmapdK1UyyU3LD6+B5NHPimff
	lZ+3tyoIP7E0ltyoVZQn85P2RvRO+0eKydYpJjDDu5khQGD7mCyLP9jvzk4RyQQ1N9N1x5InSY/qW
	NrkSUaaJPvuDExS0YNBUSLhn07JSOdBkTDu8rDzdya3BAPaDWfBgRFD5dLN1dvrrdMqx6oRbson3G
	AWUv6Lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAFW-00000007H4X-2PTy;
	Thu, 20 Nov 2025 19:23:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAFU-00000007H44-28Ml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 19:23:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-299e43c1adbso1608975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763666599; x=1764271399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8QsP0PxfZWQK7EEkk/D6jF94UJEcsiLhTO6sey741I=;
        b=Wai8kVL/x3TYS/TcRxmV6ttDd9XU6beKTW4LaGGwPtb3izlFVyGUeUNgQy2gkam4TS
         vWi00X26bdbFiC5rGUo/GQhpOAjfhrcybJEtgC5/o70CkR2qvaIen44NtBOHKo/h48rO
         Ddd3Odt7xhRW23LxVC/Ql7LtYhYf60bo5mNusotk2Fa4qBnMbsUX4ktDD6traZxRcgNZ
         hEzcpF88+eB2+foauByDb8BSsIUDL34aIdBTtfMZyqr8+Y4ELDT4yqdEVy3vFJMFdwa0
         peMwzz/leWotuzPSvn3YfPE6c3GWFBjF2f4A72NZEz/c/usmMOaZ82qJVzLAzipjdnk/
         ZZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763666599; x=1764271399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8QsP0PxfZWQK7EEkk/D6jF94UJEcsiLhTO6sey741I=;
        b=qfCEd5MXfOsvOzenEtUbCF79l4bpN9UFoUjNKE1e59eMqRrv5ZTOaSRvHMXhuPp5VJ
         DnGrW4SC05bBaTr91mGiotNf02gv2oZPu+0tRbzwEj3f4Ogxz/6d0bZnRoavGxTocvev
         cuOkxPfSRN4q60trrp1F9t4hpuo/ZV5l5EEFMfObRBUDDCPqjLU8Z7oEVa3tAMfwEFRw
         Tdpd6skdbLCRBfVXTVTibvrFOjV828UI68GhrbXx8NE0lXC8eQuh4j1O3O7ch0unwOqL
         su1wAT94Ht4sSm7M7pO+TLxv510lTUovI4RG2MwIktqvIOEv1jvMkTw+PiOLt3PAKg88
         yTYA==
X-Forwarded-Encrypted: i=1; AJvYcCW8YScJzfXvA2TpksHCXtb8MOLwoR6C36dz3opo7ycgm5ISi73Hk9f+TX2xNiNYdxF02V531dmH7unlrrAxl3N5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl6aRoa7dwuNpG3JddRh162GfMQ8S3tYab3z1vv/w5JJTdO6Sx
	LYP78aHDPh3lc8aj366EdxVskOn/5L0RAfN7buZIDGy8PgZIjwoPQgLjJxRLwK+3QXM=
X-Gm-Gg: ASbGncsIbhGbz3kriG/7eLcMpVdahMLQ3ZlE9dCr7liAoEfm05zYmMf3mDO9I4cseUE
	TXOugPgTBhBTrx75VTMbi3v2dPubLzK7c7D2aeq9B2ymdq54YUGJqdwI7yfo+5J93XU03N/rrn/
	ksKzecAjJsoHAY4CH6hsAk7WUuvkhr3tF2iE1x3vkwmMbPsRVOaKBbb2Bt4yLxWsVC223xdhDZG
	l/9AJoIV0VcT/kjAga9O3UzRAhId84oa8OimRsVM1pNTR7ni0tBByreR35nA50dDDurc0CaUeRK
	IxK4qGqd+BTy2XFCgrsYOJ/FiSMLRJ0FdCfwihEW6rRPPW/dX/mtlQxAsVoOlkDburuXsK0Liim
	AVH17BH09Y74bCWZdGiZ4r+jxMMvEwq9YuEZTELog4q7fWDps8NuZHFEg/vjXgfmFBTfw+hB9
X-Google-Smtp-Source: AGHT+IHTgAAGIpuLMfi3qOYAUFJkNfXklq8UcLL7eoIA/fJXTZdw0H4yCNcTl1RjJj1OExsn5zv8gg==
X-Received: by 2002:a17:902:cf0e:b0:258:a3a1:9aa5 with SMTP id d9443c01a7336-29b5ecb6362mr28916435ad.0.1763666599230;
        Thu, 20 Nov 2025 11:23:19 -0800 (PST)
Received: from t14 ([2001:5a8:47ec:d700:51d0:d4a0:ba29:b604])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm33489305ad.25.2025.11.20.11.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:23:18 -0800 (PST)
Date: Thu, 20 Nov 2025 11:23:14 -0800
From: Jordan Rife <jordan@jrife.io>
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, puranjay@kernel.org, iii@linux.ibm.com, 
	mingo@redhat.com, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [RFC PATCH bpf-next 1/7] bpf: Set up update_prog scaffolding for
 bpf_tracing_link_lops
Message-ID: <2wc6cxyfuw77dpd3tobt7w4tpdlon4zysjky4gpomj6w2tyusa@mnem7dwqzmip>
References: <20251118005305.27058-2-jordan@jrife.io>
 <ad3ea8d7ccb10a7972db01b58d2596b425d60718ec09450a1ed6d7839488af51@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3ea8d7ccb10a7972db01b58d2596b425d60718ec09450a1ed6d7839488af51@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_112320_825985_273DB4BC 
X-CRM114-Status: GOOD (  23.40  )
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

On Tue, Nov 18, 2025 at 01:27:45AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 09d5dc541..23fcbcd26 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> 
> [ ... ]
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index a2a441185..14dd8be7b 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> 
> [ ... ]
> 
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 04104397c..d2fd02e10 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -607,6 +607,35 @@ int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
> >  	return err;
> >  }
> >
> > +static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
> > +					struct bpf_prog *new_prog,
> > +					struct bpf_trampoline *tr)
> > +{
> > +	return -ENOTSUPP;
> > +}
> > +
> > +int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
> > +			       struct bpf_prog *new_prog,
> > +			       struct bpf_trampoline *tr)
> > +{
> > +	struct bpf_prog *old_prog;
> > +	int err;
> > +
> > +	mutex_lock(&tr->mutex);
> > +	err = __bpf_trampoline_update_prog(link, new_prog, tr);
> > +	if (!err) {
> > +		/* If a program update was successful, switch the program
> > +		 * in the link before releasing tr->mutex; otherwise, another
> > +		 * operation could come along and update the trampoline with
> > +		 * the link still pointing at the old program.
> > +		 */
> > +		old_prog = xchg(&link->link.prog, new_prog);
> > +		bpf_prog_put(old_prog);
> > +	}
> > +	mutex_unlock(&tr->mutex);
> > +	return err;
> > +}
> > +
> 
> Can bpf_prog_put() be called while holding tr->mutex?
> 
> When bpf_prog_put()->__bpf_prog_put() drops the program's refcount to
> zero and we're not in IRQ context (which we aren't when holding a regular
> mutex), it directly calls bpf_prog_put_deferred(). This eventually calls
> bpf_trampoline_put(), which takes trampoline_mutex.

The only code path I see where this is true is where
bpf_prog_put_deferred may eventually lead to this line in
bpf_prog_free_deferred:

	if (aux->dst_trampoline)
		bpf_trampoline_put(aux->dst_trampoline);

In this case though aux->dst_trampoline would have been cleared in
bpf_tracing_link_update_prog or bpf_tracing_prog_attach so this code
path wouldn't run.

> The existing code in bpf_trampoline_link_cgroup_shim() carefully unlocks
> tr->mutex before calling bpf_trampoline_put() (see the comment "have to
> release tr while _not_ holding its mutex"). Additionally,
> bpf_trampoline_put() has WARN_ON_ONCE(mutex_is_locked(&tr->mutex)) to
> catch this pattern.
> 
> Should bpf_prog_put() be moved after mutex_unlock(&tr->mutex)?

I don't see how a deadlock could occur in this scenario, but I could
move it after mutex_unlock() to remove any doubt.
 
> >  static int __bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
> >  					struct bpf_trampoline *tr,
> >  					struct bpf_prog *tgt_prog)
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19450205468


