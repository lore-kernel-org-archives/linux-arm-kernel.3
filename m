Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=; b=bsUqSdx9DLpXzHTcmX5qpFAHBb
	pnomZLnVsX7m5MbDijdWvihvvX5V9B35YFxNyJSFybRu2H/Q5hDozbHVVpiJNWa8GaknOmGQhWDm6
	gq7YccqkMhPZx8vyYMNdVg0aHIqntPMo9ZuGHT+FrtWOaEcYaEBxWnAfLi2zitEyXYjf7mfuPT6aq
	zJcyvrF1Ljpq4WN76rjbXDANdqBWvIcI4WREsKox1RVRj8nJP9E/helFTucoicRur1MsfXbh+YRWC
	j2/UBBYnH+TXDEYGj9YWNIjrY3HlUGekJ72Z/M0CVvpnOj60YyDSqBIXEzNpxoo9JCI72AXVmi1Np
	vGogWRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoAN-00000000m9H-0AAs;
	Wed, 01 Jul 2026 06:11:23 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoAK-00000000m8X-2L8y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:11:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6976b0b2c79so294136a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 23:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782886277; cv=none;
        d=google.com; s=arc-20260327;
        b=gUA/TjG/uDhjCFL6SMNN3ETwwW1KrjHjf/8ZpWZg1yC4LIvppRc8MzQkAiiRiFJHAG
         r/801u+E+9K3S7W0c6ri6Vut7KlgiPYrLpHtgTUAgkZbStIA1ddaGHg5OBJIyKCDOO0w
         t583L7sQwH74g9le1wqtQKIVhHxXV4Yvcb82qxq8mu8R9/D76dhnq5AYauBudnm+zyg2
         eT41Nz7AziH0Y0e0xvvtD0Ky1FCySCOsvgo/zWKCHV8TOKDsSMU9VksMVA9dXxpFsNaz
         yELalgLPLr+fEq9nIUw+5i/g5kPHQS7lipsJdmpH1pGDkPypo8A7wgYcut8UF69Kcm6S
         NGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        fh=/VJe+oKepMgNZKL3cQRO8SSpDXV393lZrMUxyjewd24=;
        b=BT1n9nuK2WfynU1hPP0PlbUZyqdGG8r016Ti855hoQCQR2HI6mtOIwCitj2rvYuv7z
         M4a+COwmAEL4oVsbh7+T5clWsJXM42CaTXsy91wkFq4IrhMlJyDed+uT/KtXDzcB7URh
         plajHnlcJLRCfcmGhx+QCg5AkeUdtPPN0IjgA8cpn0YQvttkqxqAUDqfxg8aR5dGa4z6
         fT+8fyzZ5vT1Fi/M73v1cvyJO48nLjhykyqAoyA1HZ0CNKBr0ByaJyLqV3LxubkxQdVI
         BJtAjQdc+RAPeLxYZF4MpL/lZK7bXMA64Cz5DOarWl2LsmnFpMLrjaxcvFQyuj4detqw
         cFJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782886277; x=1783491077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        b=bDQg94/XgUcmmNuEJM/JkjKBJ5K7npfYNI3tnfaR62C+Q4mmNivijn+xR5z67LqdI3
         bJCxHA5nodZyDq+bd7ckST6asblq5pQ2ppFSq13k0rht+073syFFhBuTVL8Aw1mEI7hO
         BKXCKtp42nWdxCJOBipYOEUaN6gohyguC447jBMQNG+3NLflmJgaS5grM5aakg7Ozv98
         hcu+S0mGQ4AUTHZoAXMjqabUH5/za72mCfWCzGaf5D1e5meUVqMkc9b09kJcSfis7uhJ
         Thqw7wAa3LbKKcbd9JDVlmKw/yh/sJ6FOcZb1r3b8/SD5H2x72+zAqu/hY1iKAYeKFIn
         erSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886277; x=1783491077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        b=m/UI527JjBgK6il+I1cFiflsHX94IQtRtLy/yGBU/48exfCdp3V9E3eJI3AgQpOeGK
         rDpVRhfBaRbjDig1jfFQ+n5t8SX84WN09Y/R9rtnUcSKzYIDNQxmKlaIp2n01/iaDm5G
         N69FSpWBKpENL1Vy2zqjSG7XdKdV0PbLNyiTSFUedNxK6/jKxWcbIw6GyqFL1/4KXvzN
         cJKQ8yqbzeMBHeEJ4y3vJCho3MDDoN74sFt/svqhrUIu0c5iPGPx9e4c5rCnk5evjvYs
         4Vu3ImFWXqZCsUOvGmV1FL5DzeZ8t8ikPC72Z/6GQsOHpd3uWT4v/wbFwVpBO5IX6OHZ
         0Ajw==
X-Forwarded-Encrypted: i=1; AHgh+RpCV/m6/89yQ8PINpsoSARLr9oT/4gYyU4KIP1GT/teO4pt6/m33qGKhlfmZb4kLldPP78CCi/VZfptfHtNRxv8@lists.infradead.org
X-Gm-Message-State: AOJu0YwRP6JND1LrKYkYnu4ztNbz50raj4y+TEJ3IMjuAfCsSuHBfh5Z
	8g0o6nIIC6y3MNbM271rwd22Zmhgy1opX/ZFSXes0KBlUngnRKBSVScFJeRLt1/Rph/veOfplCK
	3mn6nSFcAoFbuQtH19wuM/bs7jN7hHw/zoYM9lNc=
X-Gm-Gg: AfdE7cm/KAyAN3PMzF1ooeJ7lCZAJu3MWEMX8IIUMcCqAK5MzifaCTJJcF6J027uZCJ
	cNSu6eRUR3H8zFRXZBjORBniu3WhVOjundhp9QGFVRg+seRw8DFWdvG77ZKBXAJOwW5ZxpUOp6B
	13HTSCXlGTXf7qifgHuNgMwsAdL45iUW3/iIFHNLFRa8lsHUE7bkbz71CT/r26Yp4ABci8FrByG
	p8n5A1Xu95Gx57rZMajDHwLO1BK/CbbkWZdozhunY+/e9JoN85hTa6X0qjRTExEbzE1ASsFi8dH
	IlY/M/0=
X-Received: by 2002:a17:907:3e18:b0:c12:a330:b92b with SMTP id
 a640c23a62f3a-c12aa14aac6mr6173366b.40.1782886276371; Tue, 30 Jun 2026
 23:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260630065735.3341614-1-pawlik.dan@gmail.com> <akOCJI-2kAAwOQzz@chamomile>
In-Reply-To: <akOCJI-2kAAwOQzz@chamomile>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 1 Jul 2026 08:11:05 +0200
X-Gm-Features: AVVi8CfA9uhypD8RuUIaiCQhrLk2tdtBO915kC01GwUewd1n6TYEXO1SRl3IXQQ
Message-ID: <CALC2ApjGZFFPXr4d-r+4VNCpQO1N3Z4NOiBXwYU307jm-626OA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] netfilter: nf_flow_table_path: L2 bridge offload
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, 
	bridge@lists.linux.dev, coreteam@netfilter.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_231120_669404_04611CF3 
X-CRM114-Status: GOOD (  29.92  )
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

Hi Florian, Pablo,

I'll leave it up to you - if `br_netfilter` isn't the right approach
in this case, then we can drop that series.

Before your reply, I wasn't familiar with Eric Woudstra's
"bridge-fastpath" series - thanks for the tip.
I'll take a look at it and try to build on those patches.

Thanks, and best regards,
Dan


wt., 30 cze 2026 o 10:45 Pablo Neira Ayuso <pablo@netfilter.org> napisa=C5=
=82(a):
>
> Hi,
>
> On Tue, Jun 30, 2026 at 08:57:30AM +0200, Daniel Pawlik wrote:
> > This series adds L2 bridge offload support to nft_flow_offload, allowin=
g
> > bridged IPv4/IPv6 flows to be accelerated by the flowtable fast path
> > without requiring L3 routing.
> >
> > Background
> > ----------
> > Hardware flow offload engines (e.g. MediaTek PPE) can accelerate bridge=
d
> > traffic but require that nft_flow_offload detect and handle bridged flo=
ws
> > differently from routed ones: no routing table lookup, MAC addresses fr=
om
> > the Ethernet header, and VLAN context pre-populated from the bridge por=
t.
> >
> > v2: Fix missing Returns: tags in kernel-doc comments for the three new
> >     bridge helpers (br_fdb_has_forwarding_entry_rcu,
> >     br_vlan_get_offload_info_rcu, br_vlan_is_enabled_rcu).
> >
> > Patches
> > -------
> > 1/5  net: export __dev_fill_forward_path
> >      Refactors dev_fill_forward_path() to expose __dev_fill_forward_pat=
h()
> >      which accepts a caller-supplied net_device_path_ctx, needed to
> >      pre-populate VLAN state before the forward path walk.
> >
> > 2/5  net: bridge: add flow offload helpers
> >      Adds br_fdb_has_forwarding_entry_rcu(), br_vlan_get_offload_info_r=
cu()
> >      and br_vlan_is_enabled_rcu() to expose bridge state to nft_flow_of=
fload
> >      without requiring inclusion of net/bridge/br_private.h.
> >
> > 3/5  netfilter: nf_flow_table_path: add L2 bridge offload
> >      Core of the series. Adds nft_flow_offload_is_bridging() detection,
> >      nft_flow_route_bridging() which avoids nf_route() (fails for
> >      bridged-only subnets), MAC/VLAN pre-population for bridged flows,
> >      and a dst leak fix. nft_flow_route() becomes a thin dispatcher.
> >
> > 4/5  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path in=
fo
> >      Fixes zero-source-MAC in PPE entries when a bridged flow traverses
> >      MT7996/MT7915 WiFi WDMA hardware.
> >
> > 5/5  netfilter: nf_flow_table_path: add VLAN passthrough support
> >      Records VLAN encap info for passthrough-mode bridge ports so hardw=
are
> >      offload entries include the correct VLAN tag.
> >
> > Rebase note
> > -----------
> > Originally developed against OpenWrt pending-6.18 patches by Ryan Chen
> > <rchen14b@gmail.com> and Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
> > Rebased to current upstream: path discovery infrastructure moved to
> > nf_flow_table_path.c in commit 93d7a7ed0734 ("netfilter: flowtable: mov=
e
> > path discovery infrastructure to its own file"), so all netfilter chang=
es
> > now land in that file rather than nft_flow_offload.c.
> >
> > How to enable bridge offload
> > -----------------------------
> > 1. Load kmod-br-netfilter so that bridged IP traffic traverses the
> >    netfilter forward chain.
> >
> > 2. Enable netfilter hooks on the bridge:
> >      echo 1 > /sys/class/net/<br>/bridge/nf_call_iptables
> >      echo 1 > /sys/class/net/<br>/bridge/nf_call_ip6tables
>
> This requires br_netfilter which is a no go.
>
> Sorry, but we should really target at the native nf_conntrack_bridge
> support.
>
> > 3. Register bridge member interfaces in the nft flowtable:
> >      table inet filter {
> >          flowtable f {
> >              hook ingress priority filter
> >              devices =3D { eth0, wlan0 }
> >          }
> >          chain forward {
> >              type filter hook forward priority filter
> >              meta l4proto { tcp, udp } flow add @f
> >          }
> >      }
>
> Yes, but br_netfilter makes no sense for nftables.
>
> br_netfilter was made to fill gap at the time ebtables was lagging a
> lot behind iptables in terms of features. And getting ebtables on pair
> with iptables in functionality was not feasible either, because it
> required many new extensions that were specific of the bridge family,
> which probably was not a big deal, but it also required to get
> the ebtables command line tool on pair with iptables userspace, which
> has received more development attention/effort that the bridge tool.
>
> All of this does not stand true anymore with nftables, where the
> bridge family capabilities are at pair with the inet families.
>
> I am looking now at the native flowtable bridge support, I will get
> back to you with updates.

