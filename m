Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955D8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBdt6K+1FRRtxV1RM4zhQcREKVKV+utbOhrg0IIMgak=; b=PAYh0n6nnBADV1NJwr1+4/HbuS
	FcCJ6nDx8k6E8qY4Ez4JvFvX6U/lp7ElsjWOH9s3v09opaIOPfHE2af4/E8fzqGi5FDUo4Pl/SDnp
	lffqjNpFNXRpiK8FTVFd4UF7Gx2saDXQ/IOS7+KanVT9jhxlCpCN0reF0jqeKSMGSJ4gjdHJOlPHw
	tAIjDy4YHdAWd34e7cxqp9nVKqQEQ4hnVLVC9PSEPgbPGBjid98F5sKT+/0oVhkR9dr8FQCDWBjJK
	hsy22b2la3x8lObITryHW6bXwKWxVPyfYuFgrTRInfw6aDtyaR1zdv6KVa4zt2O3Nl94I7AwOf7wD
	wp52u69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twTju-00000001nym-0QDe;
	Sun, 23 Mar 2025 22:24:18 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTiC-00000001nqU-1xSd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:22:34 +0000
Date: Sun, 23 Mar 2025 18:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742768548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBdt6K+1FRRtxV1RM4zhQcREKVKV+utbOhrg0IIMgak=;
	b=JDUR9PGOmfNe81ydDTGeaPgibvwP+SUVdVLswyyJwxIz2iVH8XXxHPVGYF2LC/pY45mjzF
	PRpvDOQUvJ92PMV32TRGuW9xbOELBG6MGwDpMNq5uyxAUgAP2TEoh0sSBPRgbve6ImHre1
	1eKqPR/gkbftnMQ+vixiX7QzCCfCkypI88USsZ/2351OLZSNat8cu+/I5oqvl0Bo3JStWn
	+RmDK83Pu2Qywy+7pzss7KwJVDVBWdLCYI4/pmycEN5RzH6/An/O/LdaxhxQtoxDWyJqDo
	bixjdLUYkrjfUCbZdyfX4h/WASPJHOMW6d1s20h5dyAxhZpnpenFdoweKMBh0Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?=22Bj=F6rn_Roy_Baron=22?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	asahi <asahi@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CJmw9BKteSj1Qx@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_152232_960090_6F0C6B1D 
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

>  >  > +    /** 
>  >  > +     * @user_timestamp_frequency_hz: Timebase frequency for user timestamps 
>  >  > +     */ 
>  >  > +    __u64 user_timestamp_frequency_hz; 
>  >  
>  > Why is this different? What are user timestamps and how are they different from GPU timestamps? 

In v4, I've made get_time return nanos which should clarify things.
(Since it hides the SoC clock rate from userspace, leaving only the GPU
firmware clock rate and nanoseconds as the two time rates to worry
about.)

