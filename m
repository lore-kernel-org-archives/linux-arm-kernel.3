Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105B8D30CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=; b=41QdOOFU2m0e64AFIZWo9HHgEK
	L9pxlR6HN2n71qhHDsNuCtXqXUgeF0yRgkRzJrXxAwgHLfqyBJU/+vLxLp1XggvFVDvSlKB4uBQlg
	urljjhPE7Is1lxIv6eNgukrFJpdzclQ165BbMh0Aj5s2HV82l5Tp4WSQT7ewozjqTdpZSfH1EX652
	sMpZ9zdayyNZycwS55brNmOlYD8lUJto2E6c9p6XNziBGts3Mvu+0bkDmzHXU1i1Grt8TReoybOyY
	J/IwjgYi2MowlBf7fK3yoDd/e4YnrPWmuYmOtRM87/Q3egxWvQMGoBKXtNkYNtv4IVRPRLKmigKGW
	lUPeU/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn2Z-00000007pxG-0piq;
	Tue, 13 Jan 2026 22:39:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn2X-00000007pwH-0UI8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 22:39:06 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso17016353a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 14:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343943; x=1768948743; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=;
        b=JRe1TVxal1Y3WGk9vJX07BBfQ9xzcX8jwYqdUcRF/uoc/Tg3ebb6mrOuFlNvMj5akU
         5bdgbbbKoD1rhPMAH8VE1Td6QiUYYgNqOqxjSa4B5W9jZGAXFgimHfa0mMB8JGwUSyHs
         DhbDxDqyAGunbTSIYs/9D8nSKcc+VUrAz9lCuFwKfJB11erxUxpOqsp4lfF6YNfx+0sF
         Qy6mGu5dCTjIqr83JJKTSqQGgA2fHnv7dUxEgDtmKzPYqH7Qb2Vv0DKwqb45b1zF8/fb
         cRg6Y0YlxAX2MVoh9juOl4b7UCOv/74SUW7igoOBfiX5JTZVUCUpZPI1FgnK8yHTcqX5
         FtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343943; x=1768948743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=;
        b=Mu/7QfDjI8e/a9ZYmZ4z8ikyO4kACPgiWRUOdGLB62DOlp5+vNKdu+I2Jp7V7Yl6ho
         oUWQ3KYvgwDHgFErZyQpI9CeiHJR5zBmGh6sDJu2ufVMfOwC4a7e11KQ1WNYGyO/F/W7
         qvrzhfCfnhViWJWqtWPIOuwdIdirHmqeRLoxQXhHsira7zxokv0hAbbEiNwsRvX9TAJi
         YdnV+r2sNUF7smytGoLjSeM6z69wLyWIesN+KSn5reCJ9kRGMtgl5LSKtQPqs1HKZr+K
         s4pZAtR9sSWVCdaju48uX3i2pa5nvYpYahxm6g3uvoYht5fB8hvBUHwzzHSzAnNzepnh
         15mA==
X-Forwarded-Encrypted: i=1; AJvYcCWX8qKUCGHHtTISVu6HsFdidEkf0RC49T2eSniiOfnmQ+z7DN9NPG+51uNSllx0uCRm783QoIZR16BSZ7vmss30@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ2tLcbqfxcugcJGE1zlgHMGFaRSNrK8bdfOtjlBJPYYVbuUue
	Cz4L+PinF1eNZSbd73p6ABX4lTRjbcFUe2iolpNcz6G+A2PNG20JkIFW+KCiR/Q4YZjYrv7jdrI
	CINJp35kgpLnDm2gLC0ny/bIcbXVGK/E=
X-Gm-Gg: AY/fxX4a7zNCxbvP6EwctPYELLsZmTv9yLauXE+pDj76Wsk0xCmpRfyAc/VNqzaKsJc
	XJBq7EvX1CToANun1hNbqidGxJmvqh4quV7hZF9zTMoIxJXFbT4zpbF4B5u06UNXDz/lGijcaX7
	zEJYB4Vi0vkF2yYK554QApjv90b6O46LvhrF8dVSrZA2lRrHoISCAY7TCSsz16kwHkpG7/8n0nv
	mLJd5GeKV3gW/XfGe63XU2KiI4Ujd+F9tz2VnvVRXHWSDhgvYH2TewiIcpnHHqitwHit6U9Gaay
	wD7NDJIhZNiJX6MaooQj/guvMg==
X-Received: by 2002:a17:907:d27:b0:b73:7a44:b4d5 with SMTP id
 a640c23a62f3a-b8761139a87mr45560466b.41.1768343942489; Tue, 13 Jan 2026
 14:39:02 -0800 (PST)
MIME-Version: 1.0
References: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
 <252d6877-d966-4d19-a38c-cc83ba908494@lunn.ch> <aWZVIBh6AKiIaxdr@makrotopia.org>
In-Reply-To: <aWZVIBh6AKiIaxdr@makrotopia.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 13 Jan 2026 19:38:50 -0300
X-Gm-Features: AZwV_Qjg4zpsS4od6KBCg5IH7ipEaILyUhtFhNBfGxqCxTWtWrTgv-97YJUF4cY
Message-ID: <CAJq09z727C=9mh2a0BEVcVLKkWcdVOL7oNvVBq12k6zm7nxXZQ@mail.gmail.com>
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: support using
 non-MediaTek DSA switches
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>, 
	Mason-cw Chang <Mason-cw.Chang@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_143905_165640_24DAC516 
X-CRM114-Status: GOOD (  10.83  )
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

> MediaTek folks also got back to me in a private message, confirming
> the issue and also clarifying that the length of the tag is the
> limiting factor. Every 4-byte tag can work, sizes other than 4 bytes
> cannot. As MediaTek's tag format includes the 802.1Q VLAN as part of
> the tag itself I suspect VLAN offloading will still need some extra
> care to work on non-MTK 4-byte tags (like RealTek 4B, for example)...

My suggestion is to enable it only when sure (mediatek tag) and drop
it otherwise. Something like this:

https://github.com/openwrt/openwrt/commit/2603d6d81d1a088c6ad271fe20a63fa6e3a75124

It is not worth it to risk enabling offload for unknown cases.

As Realtek was mentioned, the 4-byte tag (rtl4_a) is for old SoCs,
hardly paired with a mediatek SoC. The newer tag, rtl8_4, is already
too big (8 bytes).

Regards,

Luiz

