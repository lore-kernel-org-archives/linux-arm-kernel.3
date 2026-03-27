Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E608A10ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3EDHpPb5AhiaBsdFZsph770IiBUnt3skegE31v5MuI=; b=SREw4HyFpYAC3NnyyJoB/Vf9QP
	kCKx4NemrXGf/k2M0/iDa6Tz5UHE/Rb4y/fxtxeGApvTY8D938A28sybDceaZ7OoB7dElRQlrtNeR
	0myhNSWqHf0vCbtDCcbTs3dVZ8Kust9hJldwlATM7weI6KBvoVKQ/ON9RkmmmPQhJK7eNX2sgQN5d
	oLdqGBROVgWoODbk/kSfbDANaR30H9RvtAmKHWLoVMQPnoFO+X+F6DZES0jOyx6jivmRkKZOxNOu9
	teEMzLVxV24kI4LlNPArIyCp6fqDXjIta7cYp1UXIp3u5euyIlGBGV+8Kqg5Ed9mMIyBmfKRLQ3lK
	B+xQLa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64bC-00000007AWi-3I8F;
	Fri, 27 Mar 2026 10:39:30 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64bA-00000007AWG-3mCo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:39:30 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-79bdd50d6eeso6158387b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 03:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774607967; cv=none;
        d=google.com; s=arc-20240605;
        b=Yp1067lWZxmnbKU2V0eAafG3h2N5khIBBBsyRti0rX3Zw+tkY1L3ij/36cwa3VRWT8
         EXwuwTafPcSeMmCfpwTZ6GWkMxkmYoyun8EgGqPQBzWRAnhmaERz9TXwY82hIuIATket
         AEDmtEYbmYTWQhK6Q4UI9BJ4AntkrTVA+aeJNKJMjhkJNJ6CAaKFA0mv6Dh/VPgUmfUg
         0G4DE8e//6L5pw1XBQzVKgc/wtZfx0MVPkT8GdDTGNZY71VmhhLWhoGEG5Gj33AlN+Dp
         fAoPpFLuS95rXB2SyMjOKFSyV+LmbSAzMRWOefzJ1MN/y71jV4/qh+yxkjXvoPqwnpMk
         8E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J3EDHpPb5AhiaBsdFZsph770IiBUnt3skegE31v5MuI=;
        fh=kxLTKZVdYLqzGctDtJ3jbuGOcYKA8IkDowk14VoSzV0=;
        b=Etyy9qFCNtK1rfPnrIJxOIeeg5fT2dhnKH5jdlJqqeMWw7l3Te8QLth0y/SL3UyM+F
         +b/+wcDf2wWZR5GY/AZ6dI5dFZDwG8PRwYPE8zxq4X1Go58l/OjPilYeaQEan2OhPGU9
         mqeW5aloSLGt7YxuJs7jtttOY4HonJqyryt80Cbk4kBJZnooUsKThd7x/BvC/lzPRZo4
         hgI83FM1yEOGN6afIV2LSS4kE9+lNS2YFShHsNSybg0nnUdZ2sjuOi2Wn0aOetu7Roe+
         zUgPCOTUdQ+DwtGbqNtsEXzkhNzXRXGiMq+0to2gyXe5vz2ewUwZ2h6i7zS3UTupxdK4
         KTxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774607967; x=1775212767; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3EDHpPb5AhiaBsdFZsph770IiBUnt3skegE31v5MuI=;
        b=cQOstH9CKTeDi5iCCyeaFYRgUpyXyWx8W/ZS4LZSL/4wjS4HnWVTWHnZwcop1XERlC
         RwqAhTrSLh8sQU16qZPDE9vwG1WnQl5aC8uEGz0nwxncQbgKkaOp7HlgAHaFsD4eWbmb
         xjz3o7vxsftRbfUeTo+oDGzkR2zR6OgL34fr0+ZCU/M50IfK7pfaTRbd1F2vEA6COBGC
         RAwWA8V2fK6ZqgKqn8Ag5m6/v3lQI1LgqCICPZIBUmiVWm78u2k6WeXwPhtPvHzr7mXp
         eMIOdsm6/jO+KiwtQJRQCswsOFLz3ZfjU16TXoecLOOS2YMMRbvHOioq4hzss10N/Wnn
         ztmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607967; x=1775212767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3EDHpPb5AhiaBsdFZsph770IiBUnt3skegE31v5MuI=;
        b=qKadg9qLe5rx42Z2WKHeUOqcLJZMe8DTbbKlSGPxJK2Jfkq5Ad2n0W6P9L5czP6NpI
         +evd+Dbtlw2qADy5vfueDRlUO/PTmYtaLLCkmcM7QsdlPmFVs1+7+rDhQs2eBWCbZraH
         eT7uKzoAFOrvO1B5qATE9AcvHl5luicWYK3JEX2zlBEba71NkEpkdTZL5uVH4CUAcib1
         +vAHnyc9lt0xXlLY4DUK8YM1WIstLY711u0rJt87EVV9qYif4a/wCm+h8SSjEfB0HvVY
         6TDnoZyap3IlSbezgYec74pbx5xhEW634tyw3Is3ZhdKQp7cx4Ngh8+SwormspI3jq+/
         KlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL33B8X8d/VFvcfx1q64XZTMNIIr5reqeRIMM5Yfoxpi6SjRiQnxxE0A5+zKq3t84wgBKSnBiuYQApBpgsgBtU@lists.infradead.org
X-Gm-Message-State: AOJu0YxSCVQ0Mjq16dDU9hxwd6wUJeWNXKSQpJEvwyUQWnHBEeDhCBxC
	kWexja/oFchJ1+7ntrDKbabC20k+dO/nwQJf5r5+KghZWB5CC6KGRzydrOnrByLKgZ2QzEG8KcW
	sxxPqqZ2K91CTrFGGoVUYTKahLZWRiQs=
X-Gm-Gg: ATEYQzytt88J7TnjBHf9kZoJRN4zWzOWr7NT+3aRGLLxJ3Z1He211HRfpUYhKCMZBWG
	BMwXYPS3k7fdcR4y5TQYZLzbMr5ILwO/nH1rPLbGcc8qdgKxzpSHbMQkwhtdLgDWCd2gs9qrKqI
	1Eg5wSTOOoLDAiWq8rN+DbLB//6llX+ZwnjTY/yKMpTQ5H0d7rznpTPX1DARVWf+esokZc1ENkW
	NfXVSOoVTl59OjJoejJIXMCnI1dBk6aZ54ukXMXJRFgfiY3bC8aKV2/08r4nUSoVemkbzZLdTQT
	VIwBnuh0T7VCPqt3/Nn3A7fern8wjrqmxWk2YAsw0knt1n3s
X-Received: by 2002:a05:690c:4c09:b0:79a:b46c:e608 with SMTP id
 00721157ae682-79bddd5dedcmr18719737b3.10.1774607967433; Fri, 27 Mar 2026
 03:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260325125131.53399-1-devnexen@gmail.com> <20260327102924.GF111839@horms.kernel.org>
In-Reply-To: <20260327102924.GF111839@horms.kernel.org>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 27 Mar 2026 10:39:15 +0000
X-Gm-Features: AQROBzBJJOv5FvWWrA-8SBYmzTxhOKlhxOqal3cqYu71wFo9yUVcl9nKQidk5fw
Message-ID: <CA+XhMqzcdZcztwuar_j2Cv=3rogmaE=Xmn3Y1_avxYm6eGnsyQ@mail.gmail.com>
Subject: Re: [PATCH] net: ti: icssg-prueth: fix missing data copy and wrong
 recycle in ZC RX dispatch
To: Simon Horman <horms@kernel.org>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	m-malladi@ti.com, jacob.e.keller@intel.com, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_033928_943952_17FBA8A1 
X-CRM114-Status: GOOD (  31.43  )
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

Hi Simon and thanks for the feedback, will keep this in mind. Cheers !

On Fri, 27 Mar 2026 at 10:29, Simon Horman <horms@kernel.org> wrote:
>
> + Meghana Malladi
>
> On Wed, Mar 25, 2026 at 12:51:30PM +0000, David Carlier wrote:
> > emac_dispatch_skb_zc() allocates a new skb via napi_alloc_skb() but
> > never copies the packet data from the XDP buffer into it. The skb is
> > passed up the stack containing uninitialized heap memory instead of
> > the actual received packet, leaking kernel heap contents to userspace.
> >
> > Copy the received packet data from the XDP buffer into the skb using
> > skb_copy_to_linear_data().
> >
> > Additionally, remove the skb_mark_for_recycle() call since the skb is
> > backed by the NAPI page frag allocator, not page_pool. Marking a
> > non-page_pool skb for recycle causes the free path to return pages to
> > a page_pool that does not own them, corrupting page_pool state.
> >
> > The non-ZC path (emac_rx_packet) does not have these issues because it
> > uses napi_build_skb() to wrap the existing page_pool page directly,
> > requiring no copy, and correctly marks for recycle since the page comes
> > from page_pool_dev_alloc_pages().
> >
> > Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  drivers/net/ethernet/ti/icssg/icssg_common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Hi David,
>
> Thanks for the update.
> My understanding is that this addresses the review of v1.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> v1: https://lore.kernel.org/all/20260324211402.342474-1-devnexen@gmail.com/
>
> Some points to keep in mind for the future:
>
> * Please include a version number in the subject when posting versions >
>   This helps a lot in tracking things.
>
>   Subject: [PATCH v2] ...
>
> * Please include the target tree. As a fix for code, which I asusme
>   is present in net, in this case that would be the net tree.
>
>   Subject: [PATCH net v2] ...
>
>   Otherwise it would probably be the net-next tree.
>
> * Please CC all relevant parties. In this case that would
>   include Meghana as he provided review of v1.
>
> * Please consider including a changelog, along with links to earlier
>   versions below the scissors ("---")
>
> * b4 can help with most of these things
>
> * More information on the Netdev development process can be found at
>   https://docs.kernel.org/process/maintainer-netdev.html
>
> ...

