Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7FAD216A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=; b=mN2pSe5sZYPaUXhe3si15dtmfp
	ZE8T/wue6BLUkQdq4NWqHs4IR6VxMKX5pesDzsKDkZl/7IpLkOoLA1hMLKb0X6BDANMcybekrAYH8
	1a1ceVdYlTlI0ee329giTZH6vG83u5VnCO5ZXfm2m6OIPoKc0L3TTBC11Vnku6Ez9n7v2p2yhr0yu
	4ZV+bmXReG5isU0tk11qMOmc+vqPth5hsoWZeHQUNI83T0IHFnEKw2XuiIne6ZDeeEF9VFDavwtq5
	8obLN+TOQrG0WjBkuoW4VSmlcPfx25dMLcwx4lV4C5W1J6tBmGoE8L7zMmZBeS5WjQu0rLfBTDjjp
	AMIDfU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOe-00000008DYf-42Nt;
	Thu, 04 Dec 2025 15:37:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOc-00000008DXv-3A5R
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Dec 2025 15:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=; b=BEz8jKMjcMnDh2VaSiTiflLoNy
	Wr5wruHnqrTtn6RGZcoPMEvcs8ri3oHrx462XRbP50W4gNYgpF6BuW6mkdvbRZSJfyXRZlDVEeu7t
	rIjZuN6Cg+YlXLzNqPzrHj6HLcL0i7eAPQ6dG7wPQZGv2PErIu23/cwu1xYVjfxaFgeLuWz/x/hT2
	WRKcoxhT0KsDGwZ+qNjUKxKR72k1sVZ3stkO1Z4fRow1aEZ63/KoPDoZYFgrpeS0zkO0dLHe0goAY
	kzpyMYVJsC61ktLh65ac7LyhajaoJhusO5pPRz3BXuyNasa+H9ilYMaOnHMg5cKjAROnRQqfgmgSN
	wNAOdUgg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAX2-00000004KWF-0eI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 14:42:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4790f0347bfso1213645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764862646; x=1765467446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=;
        b=OVvXp8OnnMFuW/GLaOjOvdEqkRsydEwFR4tg0cg3utGd0w0jJnRkGfxv7Y9nbLMNUO
         xYeHNx3sbrzzRkiZhIzmc70gHoKUxpSIQa7X19Wsl5gQ1+aCTcow8xQrCzdaYwP3LUqb
         Omk3Fkqa5R79xYoPGKPzK3jMvFHaMRnzKWjS0tHeEZKBrMaNKldJs5kJAMbSIAmRG1fi
         m0TYbm/azJwxd+4Z7zPdNgfagAcMzBCBGoVLAQDT9puCGexbH+lhBCW5Io4kaB+hsZh3
         NNdLonkbA23kbFmIRZ0m3YB/+Q6zwFeUnkmJ2iT4OXI3kMFKsY3DZfgj+LtshWcok74U
         IaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764862646; x=1765467446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=;
        b=kpNPdqkNRVr9uv4VDZWEoqeYnaeznhvlX15XHTN7P8OWWKyONaAzGs4UgHssTGaWxl
         Vid5kCyRfcIJ/LYc2t8OX5DjaNPQd7s3v/mUSmRDM1YSaOqVa5mrsILIlj56lrY+MUoc
         y8acc5nwBfQzOaLl3T2YEe8QF6wyse1Wi3vmwmn5yU+w2MMdXPlDMv/YjgABhWLEQ7Rx
         kyii78grgpcXlscKglqNc0yF/rXWReIvD83iQIKhE9v2Kk9Ieubur6Fc89btwP2W3AtW
         T+wmcjMfqoaAH9u0GFKCHMUOqZwl2iUwmVON9/MWxVOibUieNRfH1EFl+BTC7IGHFrQm
         o3SA==
X-Forwarded-Encrypted: i=1; AJvYcCXIyca7iE8Wdy5eLIFn1mOAK2H24uZTgWlFdlwkFw1YvY9uZMBCQCXWeNoA8fi5hwAMOxHMAkpTWMto8uSyAt0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi4A9bIOsy32l4Mh5/xFiF9CrWmDUV4mTrw7NchN3FZz4CBlED
	IYRVhEh0Jh+6w+p0J/dQi228COBnqxb/OkPkm1ofv32Elylt6e1c4Ru2
X-Gm-Gg: ASbGncszp5rImd6i3QqtZGsGRXwmGfSWvXtx57LD4A0o1jeZmqllL8MibuBmTYezRYH
	PCGzqXyk8vC8tFQG8TNMOwQFJKxo+UxEUEmE1lRF2jXm+JZqtQMyD/2WC2ka2mXbFIoYizcfzxc
	1ba1Ud8GKoA5aSc0GTpVinEkgpjnZ7svbLmQsv0dWiQk4PH553XGtGBf42wccEogwL0w6Wdumqz
	dBpslwx0OlqqTtFDkTK0/+hQZMhlaDf8QBoXoiyi6JKv/a8xWX22FMAfpHKQoYOGqP7pFU+s7b+
	82tGZLZa1K2YFxX7GnBFjqzQ1pRq4tAc8/ZttunWY6mS8T1SXZcbxlxeOhHBwDS11HlhD0s5nMP
	vCbnF2Pt1BspTND+6LhtQGxG4WSLnmLIIDsooiLiRXSlx8uKXY6jeHF9U9Z3OPI//RQENetZPXh
	kLdnM=
X-Google-Smtp-Source: AGHT+IG0YF6qmFx9hfyT69cJ/NJuiahXcMZFrcwdfYs4/eTXFVZRKEz/Y6SPeFs3HRVMeBHdDKXaRQ==
X-Received: by 2002:a05:6000:186c:b0:42b:4219:268 with SMTP id ffacd0b85a97d-42f7568973cmr3423808f8f.4.1764862645565;
        Thu, 04 Dec 2025 07:37:25 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm3948069f8f.42.2025.12.04.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:37:24 -0800 (PST)
Date: Thu, 4 Dec 2025 17:37:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204153721.ubmxifrev4cre6ab@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_144208_281369_F26CC4D5 
X-CRM114-Status: GOOD (  20.10  )
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

On Thu, Dec 04, 2025 at 04:22:10PM +0100, Andrew Lunn wrote:
> > If this is blocking progress for new device trees, can we just construct,
> > using of_machine_is_compatible(), a list of all boards where the device
> > tree defines incorrect reset polarity that shouldn't be trusted by the
> > driver when driving the reset GPIO? If we do this, we can also leave
> > those existing device trees alone.
> 
> I've still not seen a good answer to my question, why not just leave
> it 'broken', and document the fact.
> 
> Does the fact it is inverted in both DT and the driver prevent us from
> making some board work?
> 
> Why do we need to fix this?
> 
> Sometimes it is better to just leave it alone, if it is not hurting
> anybody.
> 
> 	Andrew

Frank said that the fact the driver expecting a wrong device tree is
forcing him to keep introducing even more wrong device trees for new
boards.

