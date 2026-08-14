Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3BAC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=; b=tfwbC0gPcyb6pcvvskEG/UFoux
	CB/FmvqtUmk5c504s0aRsK/jQXiISxbxX5frghhtv0lury2jMhRju3/RMWd/zbDseOQCwqUAmGf1B
	AcwUewNw2n//uV/5eA1B6EM7RxfL4KSKZq2/v8SSVzNL76dhRZ+NDL8tIUN9yRbV4Pdqj3avyQo+s
	Jw5mkWMLwwvhUocZTsjM8V/2/9L2/1ZBeSqh6Gy29uyiTVbdXmOHmMsH4O+Pr3JL/UvNmnNQhqlI0
	5v38/rAgtaiBKxw9k6jMaVhhmSSW5jkcoQ87wdjJuqhj19nRAH6dQ6eFCsPCwRZXpiz/UZfEJ6kyL
	M36tbkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusd3-00000002lWA-36tY;
	Fri, 14 Aug 2026 14:11:25 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusd1-00000002lVA-28LI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:11:24 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-836c43641baso16350437b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786716681; x=1787321481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=;
        b=Pq1DWYXcXaxWjxHLzhkiXdpz7uNtS4nWGYHIYJ7waa0wikhwPIOyPvp7WkiqBMOSeG
         wHpMjmNQ0s/Y7J4u8c4S7r1eCHpMuFoxj0uKyGZufQfrXpLNG86EEOqkFaTqF/Gj86rI
         QUCJmzzwovb6+zmoxeWASyE17pNIhc9HegcfhvZqTMtdFWBZQ1C1RSWZyhUC0f2bDhsh
         hkuJlQ6ueXaVhpIENybWwM0MAuf57xeId0tcFYOb0FiP1aOxQVRo8va1RTSuKPZKhSXw
         OlAT6nZEelyyF1z72uW0f+oKBTprdHSFLsQj1UZKNC1OemulaQDUKwp/P5QFO38982B3
         X3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716681; x=1787321481;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=;
        b=Cn+KMRzylBgOrSu6jp5iRgScYoKq/km0G+oiEvebnwOmaI4ayjnqdUbgyY7sZAjh05
         OQvVx4AuqCoO1JMDN3F6A3iqllWwBKBU6BNpEtF3HdKV6E11iHxXVidN8pwRLT8/ZBK3
         lcVSOUfFVLxlbkbjcGac6jAEeQU+bW2pkBPVl6NWJ+trlRjzmB04Ii//UXiVYTUon85R
         +ZtE/QJ2cbBMwpH+p4KHJqW+r/LJaG83OKJUq3qgZnbeT/vSWdM1+I8cUfC4sUVDKn8l
         K8AQa2AKv4DwUUWcbrEFn9o09pF8tbeGt3Jm4W7hgb72fPhFTXmeeOH5U0a+Vgy6DV4c
         3mSA==
X-Forwarded-Encrypted: i=1; AHgh+RpzeiXoZDoSrJ0EK2LOAnirju8lFVHEFfzZII5Pg5k4Mjgthm4vpfl+AjMLYogEeOuU1WYTi13rLnymiBPBPs/J@lists.infradead.org
X-Gm-Message-State: AOJu0YyVEOQxTvGIUqNLIAshMyVXA5D33zQ3CsuGYGME7w1Y0TjZdz1L
	Oj9yEtyqMGXJN8TJ8sdJ4sWCSwz7oOIVSc104kkZmGFbsHtdL+QzSikQ
X-Gm-Gg: AR+sD11680SY3432pw535+DQYkyrNlrkusN0Au7Wz2+Jz1VmXowX3NxE6fpYN16WSlX
	dLjMDC+dQ7ETKN4tP2Vwv/ns6ooNOauLJhPM+d7hB1+J/bf5Mb3QH5vzpzdQI5/c1yqzsHAxgC1
	HDUqdKzh0k38M1rosnfDNJnFVvVfby4vFrHB3oEtYDVUzSYP9KtpbJSiwzeLDeMQWPfYoQKpIE4
	UTxgIVJQsIeOizmMkO9QowXXB0cdeySELktYxlSjcJqcUlGCUPNjzj317bEhBMDeQWg830D5LYe
	gel+47igdVrRMroBdfAzXZG+jNPW1TWcq9o8utZ7UmSAs8myD7T0MVlBGAwRTLn9qdkNbBkKWMA
	XrEz/mC8jwdSGMWyjydsZQh98ZCh7/dRd9itmIOXnO0OZgJ6LmjOLwuLDbm+LUsD28wQgW+qZ0u
	fHiOF9JLFM87tIkbr9ar2l7eFFqF0asX5tk7abSzozvdWkann9ecPXvdnSilgyhLjFte8m/EQdR
	HZdAu97gm2EEUynMcj2WLwATrgrroSvlO6G8tu/sJjESY0=
X-Received: by 2002:a05:690e:1c0a:b0:66c:4163:c4e6 with SMTP id 956f58d0204a3-66c72c75dc1mr2777139d50.26.1786716681408;
        Fri, 14 Aug 2026 07:11:21 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c79390cd0sm895319d50.19.2026.08.14.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:11:19 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:11:19 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>, 
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>
Cc: "kuniyu@google.com" <kuniyu@google.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
 =?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "willemb@google.com" <willemb@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "sd@queasysnail.net" <sd@queasysnail.net>, 
 "ncardwell@google.com" <ncardwell@google.com>
Message-ID: <willemdebruijn.kernel.82fd3c4505e2@gmail.com>
In-Reply-To: <ddb39bf238a544cb5c8a178dd0fc6e5cb682bbb1.camel@mediatek.com>
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
 <willemdebruijn.kernel.1372b82f50882@gmail.com>
 <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
 <CAF=yD-+AF1aW5D5H_QPKE1yxyU2wLxOmT8c2Fm4CJsPY=BjW-g@mail.gmail.com>
 <ddb39bf238a544cb5c8a178dd0fc6e5cb682bbb1.camel@mediatek.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_071123_560177_FDDEB808 
X-CRM114-Status: GOOD (  32.39  )
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

> > > > Would it be better to test skb_is_gso(skb) and only skip fraglist
> > > > GRO
> > > > for HW-GRO skbs, rather than disabling it for all skbs?
> > > 
> > > Yes, for tethering packets, HW-GRO skbs are aggregated by
> > > skb_gro_receive(), while others go through fraglist GRO. However,
> > > care
> > > must be taken to avoid packets arriving out of order. I will work
> > > on
> > > it and submit V4.
> > 
> > Oh right.
> > 
> > As long as the choice is only between fraglist GRO or not fraglist
> > (rather than GRO or bypass GRO), it should not introduce any new
> > reordering concerns.
> > 
> > But the decision cannot be made based on skb_is_gso(skb) of an
> > arriving skb. Because when such a HW-GRO skb arrives a SW GRO context
> > in fraglist mode may already have been opened, and it is too late to
> > convert that to non-fraglist.
> > 
> > So essentially HW-GRO and fraglist are mutually exclusive.
> > 
> > > > 
> > > > If treating the features as mutually exclusive, another option
> > > > would
> > > > be to replace these datapath checks with disabling one at
> > > > configuration
> > > > time, in netdev_fix_features.
> > > > 
> > > 
> > > If V4 work well, there will be no need to check netdev->features.
> > > Linux kernel GRO will be more robust and able to handle scenarios
> > > where both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are enabled.
> > 
> > What is your plan for v4?
> Based on kernel 7.2.0.rc7 code:
> Add logic in tcp4/6_check_fraglist_gro() as follow:
> if an arriving skb is the first packet in the GRO list.
> 	NAPI_GRO_CB(skb)->is_flist = !sk && !skb_is_gso(skb);
> 
> /*
> * Otherwise, the arriving skb is not the first packet, which means
> * that struct sk_buff *p exists.
> */
> if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
> 	/* Aggregate the skb using p's GRO method. */
> 	NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
> } else {
> 	NAPI_GRO_CB(skb)->is_flist = 0;
> 	/* Flush p and start a new GRO list using the non-fraglist
> method. */
> }
> 
> Another code change in
> tcp_gro_receive() {
> 	...
> 	if (unlikely(NAPI_GRO_CB(p)->is_flist)) {
> 		...
> 		/* if aggregate method changed, flush current gro list
> */
> 		flush |= NAPI_GRO_CB(skb)->is_flist != NAPI_GRO_CB(p)-
> >is_flist;
> 		if (flush || skb_gro_receive_list())
> 			...
> 	}
> }
> 
> After this change:
> - NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are no longer mutually
> exclusive.
> - In tethering scenarios, TCP fraglist GRO applies only to consecutive
> non-GSO skbs(!skb_is_gso(skb)).
>   others will adopt skb_gro_receive() path.
> 
> Please provide some suggestions on the changes above. Should I prepare
> V4 patch based on these changes?

Thanks. This sounds good to me.

The risk is that GRO might be less effective at coalescing, if HW-GRO
and non HW-GRO packets alternate regularly.

The alternative to make HW-GRO and fraglist GRO mutually exclusive
does not have that problem, but on the flipside cannot use the fraglist
optimization (esp for forwarding path).

So no free lunch. Either works.

