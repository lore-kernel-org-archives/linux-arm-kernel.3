Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F164C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVEmfdcIK+nAC24P6F8Ud5S0YAAGuFYjRvgCZ39ZrCQ=; b=ppQhJw/KYdnTuPsBN9C6W5r6eO
	+NfTBYarSGiRZWOUmeXwYn/chHHWHxST9c7Ze0nBS2+nFH+EmHjeCJ0qkU6c2fLl9ht7zNJxId/lN
	8hr36UqkC8/XBsHfqorKpPRgZ0U1LBpu3CgfAL0kKtKOi4ElxVPmKdtZFZ2dhVs/7LFA6DUpWEfv5
	S0RmxkXSK/2XPWwagvvsKBuug5eys2CRQFJYbqF9rXr/hcyFP2moCh+6+LCFW0R7Aiw/CUbEadUpT
	3anr6vl7pVpS1sj54O/MgKYxfy5NYgJBnJiVhfsHs5uP0+o7sFL7f5/isrhhVF/SLYvUwBcaPvarB
	nFEsnMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgH-0000000BWLq-3Mq2;
	Thu, 10 Apr 2025 18:31:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vd8-0000000BMa0-1K9W;
	Thu, 10 Apr 2025 17:23:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c2688619bso665324f8f.1;
        Thu, 10 Apr 2025 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744305836; x=1744910636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RVEmfdcIK+nAC24P6F8Ud5S0YAAGuFYjRvgCZ39ZrCQ=;
        b=m9t/RrWfzN3ejrUcFLtu3NGpbdNof2lwVq6Ts7pt9fdrlw4rx7t+Lg9Ho2nxt9FxFu
         Bw5ueHMh0hoG4UsCcBpY5b4njIeNAEqRXWAfBbKkN15OpLScPOLDF0TkmcoGN/S0Qiue
         SKJRedAmgWo0FvfRg2n3Kz5Dqh8VLZKccOUZzq/Dw/otzoNwpYBONJn3oREe+nERxfdx
         7DA+ACPx+vuQPuvfDO/7C3ytPl6Nx78LBZS6Ssp3uyo9roE+LCO7bdYPED3oy6nw0UJP
         r2CQmeooIRyUSCWe6Tazom5kASNhhnIDB2v/EELc67vHsw1W8/CyEVdgkuKyUkGJf/4r
         +l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305836; x=1744910636;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVEmfdcIK+nAC24P6F8Ud5S0YAAGuFYjRvgCZ39ZrCQ=;
        b=tKO/2gSRHbabXXvRAzhZIQaGIBSOtNlIlDx4nbT0YNUwv2gxG6o/iAmE4RXzmOl6um
         J7CpJ0pXBQr7JfoFd8XQCQSB3rPnSYWESR0VIOyYyeFHAbMR/ILWp9wYdzobzx933fvJ
         GBfdWCDe2AVTiJRgVU7cybPHO2RqE0qL4uJFI7auc7OZtS2Q0abpUu+ljvO/IIuSLYH0
         mv/RnpaJv2Eyzzbzegzk3NVpMkRIvEIve/2pOj8/uHtPy6DoTyVY7aTtwOCtcbq6OzNA
         m7zzIpq9gYAXC07YNIbYTEqD+SqYA5WCN+nHamv5gLIqc37jj29h/RGfi1ELrRJP1QM0
         h6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmjsQ8pjpB/jzN9cQPVLUGYbMV52SU+7tDbYtZLdfZvtT1W5YTDvGrbMlYtpUmdJtsj9wTuo8kKA6vFZNrnFfM@lists.infradead.org, AJvYcCWxX28uuZWXtmQzU13dS7t7srDT5B6aVTR+eYF6uMvYJl04YMQqDOFNi58ZyQBrBcvxgpBFUZHzrLqzwqZalds=@lists.infradead.org
X-Gm-Message-State: AOJu0YweetLD3LNAp1qPXdNb1Smz7n1Hzn+WIslX5V3BLGnceUd4wVS3
	H0TiXMamw+zSpJ/T3Wmyi+AM5XHzgCeoI9nz9UcYgUJ/R51S5dLo
X-Gm-Gg: ASbGnctL4Aj4OCLCbpRJt+wc6JgmZUX5jyXBHAq6TgDNBYzz5S1/IacqvOFfhvJ0q/e
	mwadNT4DcaryqLea6jjv3308pk+7xZOMC+jhQUajloO3I/DxQrUVmaW2nyicRhsZAqc3ixodLBQ
	KIbIDX1HGXrMrYwAVAJqzO6Kv8oaVSaKOTc98h5HPa3R7RfUmNAu/y3JpwcHcb4zgr2yuw8s4WQ
	2u1xMh9hzqpPgDWuYg461jPaPUBVUYgSNJTslKhbpvXiNsktu471v56BHdELnb/RIHctCgW28/q
	Y5keXluCnrvDB5KZX4T8VOpxXhaWhuisQo5QvgzMIZrfQ2Kw/P+XqY1U4jeULJvDnGNl5fr8NN1
	soTKFToE=
X-Google-Smtp-Source: AGHT+IFqhoIbl8rG6Xm1pydrcNvSBmIecSBYlMaEofFIFMZzgUR9B34igWvZcOG2E52kzZjCqGGyAw==
X-Received: by 2002:a05:6000:2586:b0:391:3aaf:1d5d with SMTP id ffacd0b85a97d-39d8f47497bmr3207232f8f.27.1744305836300;
        Thu, 10 Apr 2025 10:23:56 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5495874f8f.62.2025.04.10.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:23:55 -0700 (PDT)
Message-ID: <67f7feab.df0a0220.40a6f.c911@mx.google.com>
X-Google-Original-Message-ID: <Z_f-qflwHutRYS6_@Ansuel-XPS.>
Date: Thu, 10 Apr 2025 19:23:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v14 06/16] net: mdio: regmap: prepare support
 for multiple valid addr
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-7-ansuelsmth@gmail.com>
 <6f29a01d-35da-4d51-b309-a1799950a707@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f29a01d-35da-4d51-b309-a1799950a707@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_102358_352031_D81C3030 
X-CRM114-Status: GOOD (  17.09  )
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

On Thu, Apr 10, 2025 at 07:18:02PM +0200, Andrew Lunn wrote:
> On Tue, Apr 08, 2025 at 11:51:13AM +0200, Christian Marangi wrote:
> > Rework the valid_addr and convert it to a mask in preparation for mdio
> > regmap to support multiple valid addr in the case the regmap can support
> > it.
> 
> I think it would be good to pull these MDIO regmap patches out into a
> series of their own. We know there is a user, so i'm happy for us the
> accept it without that user. But this code needs further discusion,
> which will be irrelevant for the switch.
>

Ok so how you would like to proceed for the remaining patch? Repost as RFC?

Still waiting feedback for nvmem and mfd so I would love to get feedback
for them (that are also irrelevant to the switch)

-- 
	Ansuel

