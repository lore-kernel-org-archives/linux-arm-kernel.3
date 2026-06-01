Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77254CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=; b=Rc9qqBE7PyPh5/xZOXXfY4J5V1
	rJG8RHCe4kx8Rl1zhL8sAt7T8qPkClmTpZfWVfwumJAYrJBUgPa9fZyt1PQ/tNQrFDkr9Z44Y2Hrs
	Mq2pCcOQspcBc0fwAPUDmCWa1NhFXz/UQWS9uIKMRpzT6XOLmZ6f2xYjnhwC3VVlf9+B5w9yWtNWg
	k89WrcyhXwI8WPyn/ae3Zf11q7NXQhGIZjMk4F5NZAQYmOeg+d6G4dWI38UcBhvWqvvg1IORH9Yg6
	8oP3BFyJYYZ5iN5eOxsD5yAXTJYtnp8Edc3Xz1/rFmQ85XECjVR0BXekomJdlu9n8v//elq5peFhu
	iX+0TO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7AD-0000000BeKc-1fvS;
	Mon, 01 Jun 2026 18:15:01 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7AA-0000000BeJU-3I8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 18:15:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bec449d0af2so197342666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 11:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780337696; cv=none;
        d=google.com; s=arc-20240605;
        b=FKavK0u4SEwmn5oeUIk/Mk/HciAunCCW1rP05wv7nuqjNZkv2QMkDS4N9ipbCN7p8+
         bbxJXdHKoBKMUDmsP2z9ABinKPbRbax+aPrljfN4jQAY5igam6n95ryB/njIa5dJrzMw
         Twkb700/K+OdDoeocbjSzvZGbKuOfS1RT0vR4AfNZOQfHSgBskKDZxmjqbER5PoNSjZS
         grhf8Eh7uQk0nEPZWhj7GX4aPm6gITRC31SwDG+/wYKl2EILrVnEym7NNljA4HlYCl4s
         XAYGxdAEKlNK/vCsmBaDwe9U8zYestxAOHlDp6uMvHJ5e/+NLLQV3roeyQFt69ys56t1
         SXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        fh=k9cp7zok2/KHE5UvIqu0eOfryjMJ7/r0nOua+nE0i9g=;
        b=Wx7oBN7bg9rrFRT0HRr9Fq6b/eDIrB83BBSkUGkdYS7HfzmGNJRN0P9PvTUH//5bWF
         huDB8zhKmfrAFPDiV3Az6w3rreX60tmcCsJfr629nyY+pEyS3L9ThVC4wF9efCHBHGRb
         8da4L3fYR1E8grb0e0a6JUsJC9ktlQiIIzmW0RkKSFrNcT57rW2fChtyFHcHIfvP617c
         OCnP03lHIHKCtTvtqvh73neCNJk7yXZZcmtZES1H0dh5bfx2f6/MPAeRs9mArO23CxD1
         VGM6JWNMSa3xCgH30upzKuqvOd3hgfp7bKn6axnDoVFzPc3wosKy9ueIzDYs5dJe+bOh
         P3aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337696; x=1780942496; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        b=Fg96a6iHKeO8aKsoYBbe10xbzCjMdaE/behBNC9Iphv1Uh7a+brkrL1Yx99BAu08lQ
         sTkDpjqGjMqcgfVRjy+hgGj1Pr2ZXzG4iAUogsFM1bc/5J80CWPdfQ5A3DmaD1eAb2tX
         aWU1RvM/N+UfbRG9ITciS/u0O2I0FxYZR06K4aU8J76Fi30C98dxKhrJEvFx4Cy2me3r
         /PxsSN2RGW11LRI8FZEJsd/eA9GghLfVpTTexBK1bK44nc0pQK8xXWUvkowgBHiRhEGr
         6qNltHVCGGhUqHY7PxpMhOMcp/3Z9H9O2hBKZkc3XHX7ymCgOZg3HAkRTo+kGsE21xWL
         +yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337696; x=1780942496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        b=dBDAE+yJ7QM1rYbNDlr6KZevHvV/Fv+Wv3rbFTKX/Z/bNYAxKvtqEarfSosK3JIzsI
         Pm3f5zC3oQT2z7CNaYUcDyM9iaT7WxTcluU6+sFSmXbFmHxhChr26DN6QyTxZva/Qxf6
         B9KRM4GGyToIwwb5pHSvIOcy0uknaU3R5nK0U8n6Vx8vLleAflS2nohPbeFZZZzdagdK
         l2aU9uV26MI25gV07SFyouujV2UWpbOmeUncUylxUz+iFQBm0mcHvu7cp1bmz/ZtspJy
         0Bm7T8BjGVH24hfsWa5lBgx83yrzdTtkbcOOe+3GM3TgPjwJn5zVmfMNWcm+rDNrTfGx
         SzSg==
X-Forwarded-Encrypted: i=1; AFNElJ+JQI81bEqewYUI3Svd3S31T88rrWQg95aVJcEWKz7wGh1wrc/fniCbksWirrrOu7gP1UJz16OGxdI7pXpolbEG@lists.infradead.org
X-Gm-Message-State: AOJu0YzkIF55co0R6CYalvg7h2NZ2Ki8LDxavplsCnYd3Z0DjWBosT3g
	98okH5oL/EK9Px7mRsFDYqaEg8v07D6UKgLntOw2w+fr5sZf4f5/XM68MqS4SQNabwefxktCkZw
	s+BEoV8Agz34cekZq/j6vp/ZkrQQFp/E=
X-Gm-Gg: Acq92OH/sy2GD0O9IjqA8cXySwAnpdlnLx/kKPk/yawYHfxtRkOwnJ5Y8CCNiuQr2/m
	mbYvQtULjXa2RvVNuecnpn/XAJ+G5H3sBjAaJifo7tJMp3Gk4HFLwxjqQJ2On2vQOU8i+i0Tn4z
	tgY5PgIeTipeakWvBtLsR1yA8paKrodn5im8DF2SYMVmcUOEn2xuOcMy0yn4STx8xuWvh65rdjr
	uUL5bDFyy+D5t/nGJXF4cdb302+IC+Mi0uZZa3zHyPowhaeS+VuqgNphoOhnGgBB+eXg0C5m0c3
	1vwwXT4h0aER95rdD/BOT2PbY8pZlkJkuw6/oa6Jj4khwZ2//g==
X-Received: by 2002:a17:907:3e89:b0:bd8:bb13:2227 with SMTP id
 a640c23a62f3a-beab394bd54mr640730366b.6.1780337696213; Mon, 01 Jun 2026
 11:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260531-mt76_tx_status_skb_add-overwrite-fix-v2-1-b73c4b4a9798@kernel.org>
 <ee0e584cb2ad1b536d327eb89342d1646fa96570.camel@mediatek.com>
 <ahwla_obwnwr2cZo@lore-desk> <44c54ed4da0d294c567b3b0ad750f082a6f1be9f.camel@mediatek.com>
 <ahwzwHDF7fT9t7hP@lore-desk> <7f02be7c4f919413718a0218b3792d4b0a222ca3.camel@mediatek.com>
 <ah0fGek5y8Nha0kd@lore-rh-laptop>
In-Reply-To: <ah0fGek5y8Nha0kd@lore-rh-laptop>
From: Roy Luo <roychl666@gmail.com>
Date: Mon, 1 Jun 2026 11:14:44 -0700
X-Gm-Features: AVHnY4K7Rnr9HBZMT68ZgTpm2sqn42gpnxKwQoXBahDuVV30ZAwkIs0p7iRX8VQ
Message-ID: <CAHoxoj+N3AtJgFD8vGP+uDpj6anKMgPBtZGejLDgAz0ZyisSHg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: fix reading zeroed
 info->control.flags after mt76_tx_status_skb_add()
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: Ryder Lee <Ryder.Lee@mediatek.com>, 
	=?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, Roy-CH Luo <Roy-CH.Luo@mediatek.com>, 
	=?UTF-8?B?Q2h1aS1oYW8gQ2hpdSAo6YKx5Z6C5rWpKQ==?= <Chui-hao.Chiu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	=?UTF-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_111458_831787_2FFFFA74 
X-CRM114-Status: GOOD (  20.46  )
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

> > I mean the link_id is only corresponds to one specific flags bit of
> > mac80211_tx_control_flags. But there are other bits that aren't
> > handled. Wouldn't u32 flags make it more cleaner?
>
> Yes, I got your point, but my concern is if we need to sync link_id between
> mt7996_tx_prepare_skb() and mt7996_mac_write_txwi(). If so, I guess it is
> much better to pass link_id explicitly to mt7996_mac_write_txwi() since it
> does not just depended on mac80211_tx_control_flags and I think we should
> not duplicate the logic in mt7996_mac_write_txwi(). Got my point?
> If in the future (not required now) we need to pass mac80211_tx_control_flags
> to mt7996_mac_write_txwi(), we will do it easily.
>
> Regards,
> Lorenzo
>
> >
> > Ryder
> >
> >

Lorenzo,

I got your point and IIUC the problem being addressed in this patch is that
the link id assignment has unnecessary duplicated logic across different
places. However, the commit tile "fix reading zeroed info->control.flags"
seems a bit misleading to me - this patch does not fully address the problem
where the info->control.flags is cleared by memset in tx path when its
value might still be referenced, the field is still zeroed after
mt76_tx_status_skb_add() and whoever reads it afterward would get
incorrect value. With this patch, we avoid using the incorrect value for
link id, but the root cause remains.

The issue that Ryder tries to address in
https://lore.kernel.org/all/5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com/
concerns the overlapping use of info->control and info->status in tx path,
and it remains valid even with this link id fix applied. We have to be
cautious when dealing with info->control in mt7996 tx path until the issue
is fully resolved.

Regards,
Roy

