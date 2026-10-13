Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE8CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCvuGCgbSG8Y+xpTFr7MEL+ldVl+Jz9SiKtT/R39MNQ=; b=Z8iSzwiODpWXE6ld7dMte6P6u8
	nW1VRYERZ4ZS5hSKEzkHTUksH+Zlo6WBbmtw7rXEERm2SIH/+ioGNHSKtC/VblIRJbR/I+xKzqHCU
	RKbqyZv7SOR9tNd9NHKShbBil+MiCpCXwBWFnYZQYBHb1Oyy7xClqabMqpezcU2CK/azG/K1uZx3w
	nS5kGkPOhv5k0CbhrjfSJ9hVHryutrR6jYyAUGyIam1YMFKS01eAyk7TVNS7N33itlP9ZawgOscIV
	iJyGHgk3Xmhyyj0NDnBjCBI4gBZoyyXGP7CU15eD5tOp7B/IcqnAHhs4AT2LGz41pmW6ovObqo29+
	ZEg+5HHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZgT-0000000CYg5-3PA2;
	Tue, 13 Oct 2026 10:24:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZgR-0000000CYf9-2kph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:24:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49ff680331aso22960585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791887074; x=1792491874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wCvuGCgbSG8Y+xpTFr7MEL+ldVl+Jz9SiKtT/R39MNQ=;
        b=w+HpbxiG4zbTSxwxA+KcykAzLXjcOpiA0ugsB6crlF5ViRv8KAs8JzvjIJeocWhYMD
         y2Df6z12fY4EuH8b7LMVBEM7O27ua/08xfUAJ40AEhIVdBAwUVymLgZuniB0NEvLHxCe
         BuQup5qjUIqiEeAsECKcsvocGRxRBaW++a76KnKQxP+YL4/eevGmfBeqlspnJmAK7//z
         A9sEFngOAPkXRJeQAlL0ZqNc4/xbNdNSzmGJFRh62UVJS/PjfyY7vHtxiCcYmRHffM3D
         FMpj9x+9GqfuJfYuOkQ+XHQZHmXi+nO2a465K5DlZ/BQS6oExEU35lDiOAeACOZyngpa
         42sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887074; x=1792491874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCvuGCgbSG8Y+xpTFr7MEL+ldVl+Jz9SiKtT/R39MNQ=;
        b=iqJXVYrBmMhYuaCwWIs7dtUv5u/zaoenuq/zWqgbhY9Ii7md9BqLAPE4GgaVRW2lC3
         J6VDz24p9edaEKOY8n8t8xws1DOYsd+wo2WMRpnsksAVKMGkAKk09JjSihS1hApArhuh
         Yz+/OhMPcowRiqSXAg52iGqOjBlCWCOft/OWAFs16HMLPFCBaitTloYDVXMjbVctuJ44
         naf2o357KrcbsTs6NzcdUVUlA86IV6RbtounXqtPSEd5B3sCV6/wK5GXiT9vBK8nQBv8
         0ahbfOlRQ0vY85D4V1F7PW5oU7AUEg+uUzknAdBY0F0+d0ANzj0Diw4Ss5Wz1PMs3Mo5
         b49g==
X-Forwarded-Encrypted: i=1; AKwUvBz0FdB1M3RPGSbu6ShalyeB2OEs4n3k336R6k7+s8ZE08qzgaCFg+hWuDQbokTcYPVZQK7yZDB+q0hmHNGYucTW@lists.infradead.org
X-Gm-Message-State: AFq9FYL4Z8iHmaYOOP0UiU/5dWa7W1eOJxQNchuJwC1Qv6GLXvKGV1xs
	h9A+uPhN1p2LUpDhIJaFFc2guMVsAL7wz+cPRAqzIMczV8rbG5TNrfnDkDWkBihUV3w=
X-Gm-Gg: AYBFou1SnWG8yJCw5QzYTFI2WbJ1ILp7sJViUS8vjZsRnizlP3V8LUZ55Y3wsqUcnhC
	ilf4nF3HtdEHRus55OfXuitNEODzkz7rbQMtlLG/TmSz3E6wJvJmmgpC/6Yyq5j/odWrA0/9C7l
	o//pfjg7d27FbDZLhL6CE3CrB0ETF2qFCksVAulgWa1p+XlB+o+eI7ZokxKf6SyNljbYMJa+eCN
	vCD9yGeuL1RPSfDKkeQHgLGcod4y+aHXY1vNkmPKn/R4cGWOdnYVwuqwZgeh5IVcCLSQuwe2Og9
	0LThy0U53gJd7RSuq3rP+NuvWYz7nqm7Ry6+QtZyszR7rDzyDw5D9+3t71DKSocxKfVn90/qNe2
	cljFn3QJYcxD7QFkxgnoHvNzaV39UsuSpKCaUlusDxW8u6G5IetWNyWMyYnr+HRN/VnbN2D2tVe
	45tMoLlA+gQ84gXHj9IHB0j3yyu6lzcZzpzCn5660sq9MHxirtHa3vuXNZSdB5+3e3rxBt66/lW
	Z4VffbQ8NokxrHZyd/Hwd2L6+S7/EpcfDsoiZkPehMTTA17ceOQjtvuz6pjkR1D+6nmQS/0FKy0
	NfuAxv0WR8awSqAe0I78XRYvccGHxgjR5G48iFtr8TfcRJwFx7/hz2JWUTQ=
X-Received: by 2002:a05:600c:3d96:b0:4a1:746e:5898 with SMTP id 5b1f17b1804b1-4a18e4835e7mr204484115e9.13.1791887073091;
        Tue, 13 Oct 2026 03:24:33 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm185108485e9.2.2026.10.13.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:24:32 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:30 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
Message-ID: <as4G3gXpyam7oGeK@aspen.lan>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
 <ase3UrUehtLY6b_5@aspen.lan>
 <97bc33f6-1566-4449-9343-9e3463d5b8bf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97bc33f6-1566-4449-9343-9e3463d5b8bf@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_032435_728155_BEECF416 
X-CRM114-Status: GOOD (  27.87  )
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

On Mon, Oct 12, 2026 at 07:02:39PM +0200, Paolo Abeni wrote:
> On 10/8/26 17:31, Daniel Thompson wrote:
> > On Tue, Oct 06, 2026 at 12:46:27PM +0200, Lorenzo Bianconi wrote:
> > > Implement the offload of the tc mqprio hw queue priority in the stmmac
> > > driver. When the mqprio qdisc is configured in channel mode, the MTL TX
> > > scheduler is switched to strict priority, and the PSTQX/PSTC priority
> > > bitmask of each TX queue is programmed from the set of frame priorities
> > > mapped to the owning traffic class (qopt->prio_tc_map).
> > >
> > > The channel mode offload requires the DCB hw feature and a 1:1 TC to TX
> > > queue mapping, with a single queue per TC. Configurations with AVB queues
> > > are rejected, since forcing strict priority conflicts with the CBS
> > > algorithm. The CBS offload is refused while the strict-priority scheduler
> > > is active, and so is a channel count change that would enable an AVB
> > > queue.
> >
> > I don't think these CBS offload checks are necessary. It's quite reasonable
> > to mix strict priority on low priority queues with CBS on higher
> > priority queues.
> >
> > In fact on the hardware I have (TC956x) the lower priority queues don't
> > implement CBS so mixing AVB and DCB queuing (whether SP or ETS) isn't
> > just reasonable, it's pretty much unavoidable when using CBS!
> >
> > As a concrete example of combining mqprio and CBS, the following works well on
> > TC956x (when I tested an older version of your patch):
> >
> > --- cut here ---
> > tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
> >      map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
> >      queues 1@0 1@1 1@2 1@3 mode channel hw 1
> >
> > # No CBS for TxQ1 means we can't offload this (h/ware stays in SP mode)
> > tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
> >      idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 \
> >      offload 0
> >
> > tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
> >      idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 \
> >      offload 1
> >
> > tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
> >      idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 \
> >      offload 1
> > --- cut here ---
> Given your later tested-by, I assume you are looking for future possible
> improvement?

Not sure how it appeared in the thread order but the Tested-by was not
later chronologically (at that point I had only checked mqprio
*without* CBS applied to some queues).

Direct answer:

I'm pretty sure it's *possible* that the new CBS checks could trigger
spuriously on an existing platform where the queues are statically
configured via DT. However do we *care* about these cases? I think
than can only be reached when are attempt to dynamically reconfigure
the statically configured queues. That would be unusual... and made
even less likely to happen because some parts of dynamic configuration
were broken before Lorenzo's patches anyway.

Indirect answer:

I don't know if the new checks can cause a meaningful regression but
Lorenzo has shared a patch[1] to remove the checks. Taking that patch
is probably better then debating! The new patch is late in the dev cycle
but should be low risk since AFAICT that patch only removes checks
added by this one.

[1] https://lore.kernel.org/all/20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com/


> Also it's not clear which revision you are referring to: AFAICS this
> patch is (attempting to) refusing CBS + SP since v1?!?

Oops. I guess I might have pulled a pre-LKML version from a git repo
and forgotten that!


Daniel.

