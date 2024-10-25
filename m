Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D77D0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYAT0NQ+qVm+2dkwsN0hxFRRjvOuoToskTsqyxD3qRs=; b=zZj+KK9mVKznDnyhHmO1/sZ7qb
	qc8xfmuWqk+De/mzUW2YQbqnNv5PwWO11uRVXy5Zi0lOGG+tT7scTZtFx20t+us8SSosoGOuPXLXP
	k1YFhVd4jh7yG+s1E8zpyURFVH8vdqHIlUWicobMWHDdBFOR/52335xM2xxpjSFDwpT3xPz+ZbbUy
	N0ZjM7C4Dkt3W+Vsyp6Qc8g3OGy1a4Z1L92AXdGXEnl56z5ZcvwyEs9agVIvpsDkG7o17YJVYe9Ze
	iGGIqHTaMjRVwtgQ283leFzG/T+vVCquo3oQKxgFaR60xI2Gw9lFRQHa9vSrDeZdqEReHRTdHKIna
	nZHUIFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ILO-00000003UFF-0kxD;
	Fri, 25 Oct 2024 11:19:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I2z-00000003RWx-2HUu;
	Fri, 25 Oct 2024 11:00:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1740232e87.2;
        Fri, 25 Oct 2024 04:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729853999; x=1730458799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vYAT0NQ+qVm+2dkwsN0hxFRRjvOuoToskTsqyxD3qRs=;
        b=YW97AKXUH9JNsZKHZOvZIm4hvC2mpxyYQeTWOMQKg7HJv6KTraHnh/4AyH2ivQBZX/
         qyLeKggaCmCHZ+rQ8k8DsDUEnU+SCtQic9jpWTLEZDp9SrmrfI3CEfTti3XKb2Y3CCdk
         pNvHd5q/jb10brofEJsacSLR3KlptLrSbdby2IiQINxiZnf44o4lDeQzm7cMpQAa3yUL
         xqjhwDBWc9sACrf1+o/Hy5JoI22sRVUxNshKF1sGwdpFJ9euVsXKXzP9qwFHtVe94iR+
         /CaiaaEl47yfzXztfcvuexsjKfz2ZFV1QJp+rkNNuKNTChU6tTJHpwGD9B2yEH77jP6d
         lK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853999; x=1730458799;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYAT0NQ+qVm+2dkwsN0hxFRRjvOuoToskTsqyxD3qRs=;
        b=RseYHtX5y4qsyZH5l4FfNDg2EBw+NIRr3SCUZGDbY8bwnJ9NpT7uHQrv1jdOob9dzU
         LTe72jHH7/0u989pxVX6PaFnY9p3j4eo47Y5CHmE5PpckwpSG/vdOlJfx3imlBo2R2ED
         8USmthWtFXk1BXuUt4F+4P7Ufq224GDfJeqUbpAaoD1QSRbaSbc0VRuRzdR8ex0RZcGI
         Seqf7GYgunedUzZfIAsTkjyvb9/Eajg0m2DAxCP3wYauduorSJsFg78A5RTNUGOZ0zLG
         FG51Er681HCVlCvshhyTmgAYYweOTWh3Xx2nCxKz9yvsRZNbBs9/o9GDHih/e8MZyqnL
         o84Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3OpZBm5Obil/OV6HJNDsgPRcfE5K2I/i386k228+ZrqMslAU4rJapzFAoO0k5Zb7GqiNNpU4r8Yyvwnd2nji6@lists.infradead.org, AJvYcCWPyNBIf1fcQf9vfbxrh8wK5CsvYF3EbQcmMow9NUJ/l+D8wCTaQhlwsvmg40mrQTNcGoDh2EK/tqbJr7bVM5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxJkPr707UKcqxzNICwg/JIfkMA3WXmDDCVh1Lae9rYIemYlC
	lUQd4zfNAnUQ5EIWNUWfwhdOrfVtKSq/3f4ikjknNSVpotTn/3Ux
X-Google-Smtp-Source: AGHT+IEl/0GC/p6zYFm6STSbQ+OEEJM2dBdSwzUo57zqE6B/riam1zyNj9qbCfaQqjJABP0cnfoh/Q==
X-Received: by 2002:a05:6512:1285:b0:52e:e3c3:643f with SMTP id 2adb3069b0e04-53b1a30c30fmr5396836e87.2.1729853999206;
        Fri, 25 Oct 2024 03:59:59 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5430edsm44822825e9.2.2024.10.25.03.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:59:58 -0700 (PDT)
Message-ID: <671b7a2e.050a0220.4431c.03f5@mx.google.com>
X-Google-Original-Message-ID: <Zxt6Koz2TYiUo9-f@Ansuel-XPS.>
Date: Fri, 25 Oct 2024 12:59:54 +0200
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
 <87aad5ff-4876-4611-8cf8-5c20df3559b3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87aad5ff-4876-4611-8cf8-5c20df3559b3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040001_916778_DBA85286 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, Oct 23, 2024 at 06:53:14PM +0200, Andrew Lunn wrote:
> > +	/* Enable Asymmetric Pause Capability */
> > +	ret = phy_set_bits(phydev, MII_ADVERTISE, ADVERTISE_PAUSE_ASYM);
> > +	if (ret)
> > +		return ret;
> 
> The PHY driver alone does not decide this. The MAC driver needs to
> indicate it supports asym pause by calling phy_supports_asym_pause().
>

Sorry for the stupid question, I couldn't find this OPs. Any hit how to
handle this?

> > +
> > +	/* Disable EEE */
> > +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > +	if (ret)
> > +		return ret;
> 
> Again, the core code should handle this, unless EEE is broken and you
> need to force it off.
>

They confirmed this was done just to handle kernel init condition...
Will drop.

-- 
	Ansuel

