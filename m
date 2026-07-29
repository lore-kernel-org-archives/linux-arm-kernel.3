Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41766C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpR48eIXR1Ci0/Y8C1oaWZVWu8i3+nXBnNEaQ1vsjLQ=; b=OiQEYZUXkxPOg4AQYf/m5uCLY0
	UhiWKQoWAmvydg5Bn3l+8Y979rVFvX8g9n7tQIRZjISzXeONxU2zGHFZwN//+T0u4KB5WVgPitwP5
	3D0jMLQf2iRHAmhNfIHlvuzqTZutyICh5CKIbhn8aN9H/NNTth7ZNbjpkXChPMDmUSaNj342nx5hr
	o/T71qwkvvjh2KMlMwJtqnq48W6qmcvmhkgm/B9mWzHTS42Th4SImXfysrQojgxUFS93kWT5WGmJR
	zuWQoKds2ttxoPPaa9Ts9FvGANqJrWV2BQ8NMR8vVXclNcgGi8y42Zvwf6O9UjtAzKeMKwnu1oit9
	KL3K6+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6pq-00000008VNA-1sAL;
	Wed, 29 Jul 2026 16:08:46 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6po-00000008VLv-3LwE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:08:45 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-381c69ad0d9so587536a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341323; x=1785946123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xpR48eIXR1Ci0/Y8C1oaWZVWu8i3+nXBnNEaQ1vsjLQ=;
        b=n+tDinOVkQaOTXfevQRTqdUawEKJOMZweQc3nmg33Lmd7x+3xwcWQPemBX5Qi85bXK
         twZxCH8T5Q7SD5g5Rj4DNAkfiAjdYxODthmdocRo8skgroi+SF/6gmqGWfW+IagPf6z8
         IPFx4Oob3RSLvOmXG2+I6Q6BoT4x6L9Acjsrjo6uSt0QGTfhdhTzJXgcqWiKPMIyVSM4
         wKSScIIYxFU1IEgpNRl2Uu909p2lmWK/C6Fe/02SNTPeR6wWEvhQI2PvYpcHH7AN0F9t
         aV1TolSyzNlmTFNzExFOne2d5tV17rLi5GLV76Jzwhe98XgA8RhxH2roa4Kty6z2dBVe
         4HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341323; x=1785946123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpR48eIXR1Ci0/Y8C1oaWZVWu8i3+nXBnNEaQ1vsjLQ=;
        b=a1unZRUpVatB0sOJvqsLwuorTw+mM2qXeFryTs5B1UxuZVatKZgfHM9j5c+rlNmBIx
         KhaxB0PmDW4KKfzIa/0p++CmwXhC8luutjKznkLFyaKXtvxTLIuE5sUTeNf3Caf82R8n
         lKLH5MpaFOn+I5jvf0u/C45asFHZLE8v8IFaD+hsKpttr791kcbIGx9/HrHZgl4bF/aF
         SkJUjxAjRySbJ6P3HDsdCLwUkm7EHjmq5QiFX3STXwyuseVavvnvDr4eF+F6QILsAwMH
         e1e27mBe/dBrqnfcJXThan4YvVq8TBkF9zvED9Tsat0OOF1GzLvtbS3FEN5RLYjS/AZ9
         sP8Q==
X-Forwarded-Encrypted: i=1; AHgh+RorsedJF0pxo6oLGgx3JwcZ0fcLz5hKyoH4xnVbFlJT+D7o/h8SLbx5X5EMbhwlhFSn9QAVByJHfFHHvsR+l8xI@lists.infradead.org
X-Gm-Message-State: AOJu0YzRchhbpsxhG3UEfFkUNX9NGghO/ebc8LpozvW6mV71UKVEUH3m
	eLip7khVlvipcJCrW2TyBUg4DrN8Ikc6FzUnE58CCvVZ45DoRyD+1jTn
X-Gm-Gg: AR+sD10MMGqCicyTnUQhTWlO8TVzm5AvWGT6wS364MJTcTZEvxR8kyUePjou+RodVek
	RelxASdxXrOt0vAwxa673NPiJXMQD//MQsCvWOsFb+yT+xY21ZbE7dtliLTP6nrm15bOY5Ke9mQ
	QF1Glbft3uDGW6DiDCkYpoFZ2puuqSpMVnCg03tI9APH3k5nQ9A4v0a9qDf5STiu3s4qQotvJDQ
	iA73Zhb5o7w5LjMKwQxW8L6hI9rpq0wy2nrr9jXjZdbb8zIAIVLP+qDVn6EL7+vrHLFYI1SV/k/
	gkQ8kp/KQJclSqGdT0BdKS1B2szJ5Y0pJrfehUF7FgxvTE7KRsrthUn2QLDxAR+zHYf0R+mGLOe
	Bzqo1FNcGEs+eloYHDvRl4L5Bg5QwsMdttl5nAA2FibqA9pLoQI4f4XCNA48t8kzWh/2aeF964a
	uImy2+coMkAtH8FsXA5tKjZdnpz6bAQUbGi67EmZWZhpkc4gNHNjWzPQ==
X-Received: by 2002:a17:90b:4ed0:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38f6a373a5amr7799688a91.15.1785341323530;
        Wed, 29 Jul 2026 09:08:43 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:41::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64111008sm2958119a91.2.2026.07.29.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:42 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:08:27 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, aleksander.lobakin@intel.com, 
	horms@kernel.org, magnus.karlsson@intel.com, witu@nvidia.com, 
	alice.kernel@fastmail.im, dtatulea@nvidia.com, yoong.siang.song@intel.com, 
	martin.lau@kernel.org, intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, leon@kernel.org, AutonomousCodeSecurity@microsoft.com, 
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Subject: Re: [PATCH net 0/6] xsk: harden TX metadata validation against races
Message-ID: <amolBkuwEasuthzu@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <amnKVlHTITILY8H8@boxer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amnKVlHTITILY8H8@boxer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090844_851703_848C86B8 
X-CRM114-Status: GOOD (  23.97  )
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

On 07/29, Maciej Fijalkowski wrote:
> On Mon, Jul 27, 2026 at 09:19:53AM -0700, Stanislav Fomichev wrote:
> > Cen Zhang reported a KASAN out-of-bounds read when AF_XDP is configured
> > with a TX metadata area smaller than struct xsk_tx_metadata. The metadata
> > is also shared with user space, so reading its flags more than once can
> > produce inconsistent validation and processing decisions.
> > 
> > Require enough space for the flags and one request field, validate the
> > launch-time field against the configured metadata length, and use one
> > snapshot of the flags while processing each request. Carry the validated
> > decision through completion handling so later user-space changes cannot
> > enable an unrequested completion timestamp.
> 
> Stan,
> 
> I'm taking week off and I see one sashiko-reported issue which is not a
> pre-existing one. Hope you could clarify it and unless no one picks the
> review of this set i'll get back at it next week.

Went through the issues, I don't think it found anything interesting.
Everything is pre-existing, but still worth addressing, will send
those fixes separately.

> >  static inline struct xsk_tx_metadata *
> >  __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
> >  {
> >  	struct xsk_tx_metadata *meta;
> > +	u64 flags;
> >  
> >  	if (!pool->tx_metadata_len)
> >  		return NULL;
> >  
> >  	meta = data - pool->tx_metadata_len;
> > -	if (unlikely(!xsk_buff_valid_tx_metadata(meta)))
> > +	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> >  		return NULL; /* no way to signal the error to the user */
> >  
> >  	return meta;
> The snapshotted flags are validated for size compliance in
> xsk_buff_valid_tx_metadata() but then discarded, returning the
> un-snapshotted user memory pointer (meta) to the driver.
> Later in the zero-copy driver path, xsk_tx_metadata_request() re-reads
> meta->flags directly from user memory:
> include/net/xdp_sock.h:xsk_tx_metadata_request() {
>     ...
>     if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
>         ops->tmo_request_launch_time(meta->request.launch_time, priv);
>     ...
> }
> Does this create a Time-of-Check to Time-of-Use (TOCTOU) race condition in
> the zero-copy TX metadata validation where userspace can concurrently enable
> launch time after the size validation?

For this, yes, it is explained in the commit message:

  Note that only xsk_skb_metadata is properly using the flags,
  __xsk_buff_get_metadata ignores them. Next commits address that.

And eventually addressed in "[PATCH net 6/6] xsk: validate metadata when
processing requests". Couldn't find a less confusing way to split the
patches..

