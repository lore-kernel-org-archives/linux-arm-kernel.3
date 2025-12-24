Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3735DE7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=; b=ZukGM5o0rDRKLr0ZuVVpk/3G6J
	HfhBaJN0C3bEONHEdmawkoI5WmAZxpb5J6ANJ2i1v5jDa8brqTqdSpP42RvjK/OilrLfXtbNWr/cL
	Idv6j6mA+RQGkPjIlXdggplSmP4vt1e8r3NvJZfmi9K2jEHdk6DBuQzzJCbifF2o9V2192TJfWkrd
	IiB9kh4L4UZRFh+YNLE9QDp2n5ZMqukItqq3R4JiPpKLsEmT/soviBR1gY7DYQJzvoJ0uTqow5dlc
	/ynYeR+0FG+7droqnzkwLA67qWL+TOoUUKqQ+HTZheNjiSsmWt8AakNBEAZ/jBPO74lg3rkFUuXSI
	5kWVQW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQju-0000000H6KC-2Jou;
	Wed, 24 Dec 2025 15:25:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQjq-0000000H6JM-0xQB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:25:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so50617161fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766589920; x=1767194720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=;
        b=Qr1VowU4g/WhHubFgNPKD52npY1Nlu4UVO2IUjKvhDrX92T72k+KapZfjSJKx2kgA7
         1OP3alGmKPGw2ibNdN41dXs6nGDOjBSkRKIkWZCVl9bXnbpC8t/JcnYvMC9NXRINEzCT
         hDAAgdPV1oJZeH9IjPVjrkqIwKNryStGDesjL184qIkhuC209s4YjhPnfIll9WcFHN2E
         AUZxNVzfsBL+K3I4OhfFGYuVkGUy8wHARXm+e/F6esz0b8tLXn0xOSyawCHUXlfodaxE
         Lo7VFJXsfxJgyUebgYZxSyxILkRGu+qKsYyw+dJSwO/5F2geBeep3IsmQkHnotRWza2n
         G06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589920; x=1767194720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=;
        b=sAtIk9zLi7QAtNH/Y65ZM9FkFLuWOtfhyi+Xba+5yC0z7y1bELxWyEPaxiAhtbplzp
         7me0VoFZqWx0FUzDVEgQOTEDadr3tgHTGfAnYpi6Te6hkXdlmgUBaRGJwZ0JLV4WHRt/
         bkU2WgYVffBHcw31On9Z3g6gZzbKXcI6xacjao/9vusYW3fSoY5qsWoOU2KEs4HTi5Xg
         VljsJ/cBr+IUVIMK9MGvu7Y/E994zwBGnyj4UB1o+Vgv41mOAU6QMUQU0za/AtnZyR5y
         lPnIrbvGCbr2ODazDys9i7ooLFG0NaboalJMG96AdUUa6AM4Yg07sl7HWDoBwSz++mRK
         4GhA==
X-Forwarded-Encrypted: i=1; AJvYcCVML9v2gKTI+RjjmkDfkZNVKuD6znUG/MRqQRgYeP0mLQrduSG2jmebvcTz98/lPNh4tV/8teITEj0P94K4o68U@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmfh4trgOTiU3vPpJOmsTnmd7OQuiweGazU75048hVpifPAqI7
	OMkxtk+M+D58j18w9BpHNsk3+G6bg73bPbetkSj3aVJSlpburmOTsrayfwx76ZLhlzO0djAdHEf
	vPsoZjO3jKrbv5D1W+Q3zwMQoRPFu0MJzFrN4Fhu4cg==
X-Gm-Gg: AY/fxX5P1DCYt+r3J3bVGmdMYxZVuylMt3uc+8HoPYUrV7RZP0rzN3dQgyea1MQdlD5
	B19C7Z0TNjwFgHSX9QS3a2aymX1yKDvr7JroLgvj2T7x+ywXIWMU2za0mRlGLEUPzxfu4Hd63nC
	v60CDhTb2OQnFTkz2Ed8AeMOyuLkH5IpDf8e+HeBoCEdyyjmRZp0Ux6gGj53d53uRaf/oD75qnf
	h7WaUBVS8Dik2QWgNk4dlTuOw8l334i8bhP30crf5XLTLTwXoU5JjdVYjxEbCwGlEzQLvSzc7u4
	eId9pCLhrA6liOplim8FXvK1SK7K
X-Google-Smtp-Source: AGHT+IE18Td0Nc/XUXi4Cl/TcjHngwFgeghpA9tqLowzRzDj1icyD8qdVib+ULxbElUN5zQM7gG2Jag6BgFnSaqID8k=
X-Received: by 2002:a05:651c:b23:b0:37f:c5ca:b70a with SMTP id
 38308e7fff4ca-381215671e0mr64786141fa.7.1766589920090; Wed, 24 Dec 2025
 07:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20251114104325.116471-1-marco.crivellari@suse.com>
In-Reply-To: <20251114104325.116471-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:25:08 +0100
X-Gm-Features: AQt7F2pdx_yqBW3dZWH9yjaq2tVaCtyoU5kwu2elkW6Y4N6ZypwXb883yj0Z2S4
Message-ID: <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_072522_843866_9DC0D3E7 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, Nov 14, 2025 at 11:43=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>[...]
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index b9098a7331b1..95764b82da39 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -343,7 +343,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
>         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmas=
k;
>         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmas=
k;
>
> -       queue_work(system_wq, &dev->init_work);
> +       queue_work(system_percpu_wq, &dev->init_work);
>
>         return 0;
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/init.c
> index d7d5afe365ed..e33ab4849e8a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> @@ -420,7 +420,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
>         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmas=
k;
>         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmas=
k;
>
> -       queue_work(system_wq, &dev->init_work);
> +       queue_work(system_percpu_wq, &dev->init_work);
>
>         return 0;
>  }


Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

