Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6555DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=; b=sw7THunxUiNIXa+vx+fWodJPmX
	40ywe05thFHL4ZfD/K2E5b0U2ZTCYXrAgZS+xo56L5LhmOtA9jI7dw3JzoT7q6f4Zcyvgw9/4nqlI
	4baQzqP1Y0pkNSeCYSoVhhvnrmOlfEB/1eU/HL4dMxau7TD2/AjSHG4H/FPoRPTad5WEAVRDp0AH2
	MKEqrm6V7NsEqBAr5T0sC1o6ImNGWKYmJEpzjrikM5IHRMtjamW/DfWpkUDEjln3HiHTl3Q3IqAHc
	wjFKkg0alFFbYkU38UcAUPBcOoN2emHLDKMvqlwO8hWhsrPsrTi33XxncHZwnvgfUW6Q52RvIIlTy
	vNfOAUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp8E-0000000AvBi-2HLC;
	Wed, 17 Sep 2025 10:11:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp8C-0000000Av9N-0dkH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:11:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45de5246dc4so14016655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103878; x=1758708678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=;
        b=NG6z1QLbz1boEgGuDGxjajYrCllA9V6zdLW2Js+TDgUhTcYO4XUop4harVwwlS/fWn
         y6S0tymTXCHRMi++gGydI0hgAUtZpLDk7Cj1wSqC/oc7ef3hWKeTSR7WHCvkY9PjgLTQ
         Z3rQXAUt58vKnrZOjKTJof+2KMEJ5QbDDl/p2tmS+zCbLI/MuVLOVSqA57Gdm7RUBipi
         pMAXblxi/kyrFtYfApU3ppFQqowL+fhy3E8067YvYiYZzD+hI62nBO5uZRhNtc0HXr5R
         vsZXNDH1Z6saws1huF4ouqi2lg1AS9DClT5wnjmEERRVaTw8u7YVzCAz9vjCOrSy9QWN
         HNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103878; x=1758708678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=;
        b=E0QFWYD7FhKYx6rTpOwgIHajfXidK7OK/6mbNlXzgMSLY6PNp+FGTY8GkHM/2/acjp
         OgqayTeQCtNcxgLI4uSXKAaGpq9P1VAwcydp6pXpz9QadzXW44tRjYTuH8laoHYvEUdP
         c0snw5viES4GO/WxjoIpnHhlfHo1TbsfdNfAOtJvU6iOD7rgVllx8ZIolOGL3/9YaMhV
         u0dfcYpcnUWgc3gVbjmwN5P1WfvSeQrgCFU6G5/KEu86KZ0hPNeBVIiAodStwevrjdqJ
         TZRqGY2jKnfMEfY01KK+PO3yemzd9xmvUBNl4ZvYdRTS+tPHLyu144sZxtwKNNTq8ZxW
         8TPg==
X-Forwarded-Encrypted: i=1; AJvYcCX4jfyBUK/UuYysKR6TBfRR2sh8Jy0Wfoj0/VTBRathyQ9yiKFK5lU+/yDx1RZ/cruFGab0ds+WRgPrNi7mpnb5@lists.infradead.org
X-Gm-Message-State: AOJu0YyT9QzhYr9bVCio+IS7NSeETT/WHq8XAPaWk3u3vn9Br3vU/YMc
	4riqnE95jCP8zcH10jZg8sSn2c0Mq/eAwNJ+wWKZX+jcE8L2qW6ZJnB0
X-Gm-Gg: ASbGncuvK/bQ8501xNQgx3mRp0Q7Ts7tJ2gfAnK5T8s5fdUMtkjlg9DtpehRw4bmCjP
	KCAsjPEUt5NguaH8LIag+TGCZarUTQfjsS07n2EipkLAcLDlhhXE1VN42XP4byUyJqlFM80rxee
	nDOJWvtWHkSlefm5g9lh0Mt188n9YHhGoXgqunhUs15XYJ84WXIRe+XqlsDW1eV+FoOwoBxGVsk
	D+DZmRNQkk7SU/BxAerXHVzFU7B3kjQFV2z71Xi36H5CgnlB2bYemUhbhlAGzcJO8/0VRfefmNV
	JMZAvzsBaRZP//+FYmRW6felC8D5MOh+BnAFG/VccNHugTE+6Jf1S6Wt3AoofEj7xNZv0mTIUhG
	lg8dUXLniaRgSdxI=
X-Google-Smtp-Source: AGHT+IEGAWHbOGCVA8E1ghCrTfok0wf8HrSSu83uqpK5rtG+yvptJ+uZiWuJFaorxUfrNpWZkT3p1g==
X-Received: by 2002:a05:6000:400e:b0:3e9:e2cf:cda2 with SMTP id ffacd0b85a97d-3ecdfa5ad4fmr599670f8f.8.1758103878166;
        Wed, 17 Sep 2025 03:11:18 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ece0fba34dsm1092120f8f.9.2025.09.17.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:11:15 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:11:12 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 6/8] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20250917101112.555jzhzlmpkhgmh5@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031120_202313_7614D15B 
X-CRM114-Status: UNSURE (   8.89  )
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

On Mon, Sep 15, 2025 at 12:45:42PM +0200, Christian Marangi wrote:
> +static int an855_regmap_phy_reset_page(struct an8855_core_priv *priv,
> +				       int phy) __must_hold(&priv->bus->mdio_lock)

s/an855/an8855/ throughout this file.

