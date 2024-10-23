Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35042CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaWidJfU3IgjixW6d/XGsWauF1pbmfj8wOb/yZzKIoY=; b=FVI/Urq67N6GX1to0VDe6j357g
	K2PZLfPcFZPLWt3e/tLMcfFbl8qJkMWdjsf4bszkDBkNOYWRCbGFT/9QfemkT/Oe8ehdtEnJta+XP
	mEnI2BKWIKo41bkhvVOwQpcD1yaNLZsj6H+UxfaI2EtTjnCQHmvodGqzIfTo1myarNAfkgv0nWM9+
	/uOrJJKUJaeCuylrspXcFSQ9oQ9HB2U5p5Sp84JTKRx/9cUwc9lZhvHCAn3vph9Oi0LbndABC/srJ
	p+efQ5JBPbtvQ3FUSGO0jsAhDG67jzfWus8eGvfM5LgwUHV3aF+InAICTRa8Y96zxEIzs8UKfRVFt
	rvX964Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fwu-0000000FV4d-0RSo;
	Wed, 23 Oct 2024 18:19:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3epG-0000000FIDz-2Edf;
	Wed, 23 Oct 2024 17:07:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so5048748f8f.1;
        Wed, 23 Oct 2024 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729703233; x=1730308033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JaWidJfU3IgjixW6d/XGsWauF1pbmfj8wOb/yZzKIoY=;
        b=ksanGxxu7idGx7yKKNYLKjj4hXXiin8C3pKTg5Up4UkmIy3LYq+cUw2bNzHXQFWWkj
         LOD+30xgNv6h5ue4s7R2vOD1lcgaV+yjZfESSDjVrzYohPz4pivBqMS3Xy+fsQBhEtgZ
         bnqYMN56ouUYZRu6CuIv8IL5l+yfvd6Abtcy2FAkkGg/AkEQxTjsCSw0jK4ZeTT2I7Nr
         8FR/Qm+0u9Ebgln2REWjhUbVVQg06vtrgnPhWQT64DtApiUxwMzHiWKwozNDdNm17mb8
         jBKwm+WFaRPqSBDaJEI1AzAMOrWf+Qxu7esg3XLR9GxXwgsfLvG1RpFSU2jzbAyTJx4y
         5Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703233; x=1730308033;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaWidJfU3IgjixW6d/XGsWauF1pbmfj8wOb/yZzKIoY=;
        b=dB4OAGKOiVRxYqG6hR2jMAjKAQuNF7aZR/MuHcqZNSkyR/fTWGPvt8ogQgKiV+wVa7
         Klrl+311gFLrP5A6eZ0mMFPa3wqfk84dehXB00oXPk7EpDorbpsZN/FP4o3oDrpXmLFP
         0Zu9DGHAo3Lgsg8aI3ThX13K6He56onI1gJGb7u8T5l2G9MkGg/FVzT3Y7g8YhDz+D/q
         l4pY4Oj1iTWkDe74BJgX5VsM8uFhGcNkGjHmHWhpd7NSZK5AQye6QRJtE9ZExCIgRVZr
         O83nT2oUPbgM6Hm5m0LOzv1vV45IErJeog6c9A1LeDeNhy/MyzvWO7BNI+5mjzNs5Yi3
         J/lw==
X-Forwarded-Encrypted: i=1; AJvYcCUOM16ajG3rcOBgNFf8v7yogWYPE0Bdild/REzJ+AtEIvdrSdLkJuWFC+04dEjk4yvEbTlBM5gIRzn/lvH9mOs=@lists.infradead.org, AJvYcCVTsQ1T1SohBhwETHMphSHOxM+3UoLZokgzquwhBbThVaTdSTTrXdVbp3O9gGUZrU3PDFxJsfbxd8KlqZqJR6Z2@lists.infradead.org
X-Gm-Message-State: AOJu0YxGuU6CJGqVj7TjNJSyaihrQCZPQduWTkLRCUL60O/XJzcJJvav
	7jhv6dy7PPMHdrd3TZ7n14M2ZY2tG30OvIlMtBDVyncnD2ySI9Bc
X-Google-Smtp-Source: AGHT+IEZmQMRACMlxf5P/dPNhbQTZyftTXwVXCqJKPwGo13eY5omo7juc5h7J60TFFFp/09QSCJXuQ==
X-Received: by 2002:a5d:4704:0:b0:37d:5496:290c with SMTP id ffacd0b85a97d-37efcf051afmr2301500f8f.7.1729703232740;
        Wed, 23 Oct 2024 10:07:12 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4aadcsm9357173f8f.40.2024.10.23.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:07:12 -0700 (PDT)
Message-ID: <67192d40.5d0a0220.33f6c1.23bc@mx.google.com>
X-Google-Original-Message-ID: <ZxktPEtzI2ItzdXA@Ansuel-XPS.>
Date: Wed, 23 Oct 2024 19:07:08 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-4-ansuelsmth@gmail.com>
 <4ad7b2e9-ddf1-4a82-9d60-7afd1856c770@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad7b2e9-ddf1-4a82-9d60-7afd1856c770@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_100714_592841_8ADF3828 
X-CRM114-Status: GOOD (  20.02  )
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

On Wed, Oct 23, 2024 at 07:00:22PM +0200, Andrew Lunn wrote:
> > +static int an8855_config_init(struct phy_device *phydev)
> > +{
> > +	struct air_an8855_priv *priv = phydev->priv;
> > +	int ret;
> > +
> > +	/* Enable HW auto downshift */
> > +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
> > +	if (ret)
> > +		return ret;
> > +	ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> > +			   AN8855_PHY_EN_DOWN_SHFIT);
> > +	if (ret)
> > +		return ret;
> > +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
> > +	if (ret)
> > +		return ret;
> 
> There are locking issues here, which is why we have the helpers
> phy_select_page() and phy_restore_page(). The air_en8811h.c gets this
> right.

Ugh didn't think about it... The switch address is shared with the PHY
so yes this is a problem.

Consider that this page thing comes from my speculation... Not really
use if 1f select page... 
From what I observed
0x0 PHY page
0x1 this strange EXT
0x4 acess switch register (every PHY can access the switch)

> 
> Is there anything in common with the en8811h? Does it also support
> downshift? Can its LED code be used here?
> 

For some reason part of the LED are controlled by the switch and some
are by the PHY. I still have to investigate that (not giving priority to
it... just on my todo)

For downshift as you notice it's a single bit with no count...
From their comments in the original driver it's said "Enable HW
autodownshift"

Trying to reach them but currently it's all very obscure.

-- 
	Ansuel

