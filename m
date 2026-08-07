Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72C5C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=; b=PgHPaQDtKEVcU7St2AKp81o1ij
	DDqmwAqZ82p6G9dALTS57uFhqBgbY94XIPTljaz7mWWhlGsBmKPyzWQndmwUAXyQGiMxEb9UlpExU
	kYwdsFlIDYla/ojo1A5GLHX1OhxlSh3R1e/mPcYTdPNYytM0dGchRf1qKGsPEOmjEEpUe+lgSQwsi
	H6PvPgqLLl3e6Q9iP8zFMnnRnt+TdfKlm1T8+jORJyNfcod4pBb3cLP0QMtspZ3wpPNLSssFpVem+
	bs0jCtmz5Ukigz68Kxn4GUGdPB+xZtofr/OH3QXqqhQpOz2ydqoAzzPxyQHIF7obPomE2bem5Smfq
	b4fxpvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRV8-00000008jlk-0Cpv;
	Fri, 07 Aug 2026 20:49:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRV5-00000008jkz-3M42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:49:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47362928f65so3162033f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786135746; x=1786740546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=HXJ9+YJPXIxNCrYuKS3Q7+b5ZcALmZzJwlRzKLujF2c2we+pHVwSveNulM8Wv3AjWS
         6xPFUyfhXNd0yDGoKV9hmRX5b4OSgt1W2S58IuGa+hriexUcAA+l2ZBJ3aReW4+NiWwZ
         sBy8ePYgTJ8jF5wuvGZCENAKfrEWecV8QZHOvIGAjPkNIDUzhS2XTXIlPq60OFOtJ1g5
         x6JTcoRS4XzzF3UmF5DigGMtPzdzbmd/Ck2hCGo7WOF6dhGo0fjzXZVe9Dp1fPT2hia6
         hv8UKFK1/uHLCYxdlqdFkRhfn7gaGHD4JstXLIleKolpbvODQ07fAEbF0Jsn2YeUZORf
         hyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786135746; x=1786740546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=IJ+fpg26YdVJR9b48PZqO8EYegQJ+yBAwwc5j/hvWT7loHN5BZR7a7lE8pK4a111jG
         fg+dVmrJ7/z5l7BJbaA+k7uRGDzREaof4cHvQ7LKJHcfkhAgFoUNyhdB0tFUqcSe/5kU
         9KkZpewSN0xJ+a60Qsyy3eKEjKuwSbbWG7rnyrckDEXQlbpmEfI2/oIiqGSnJ6/fpGVx
         alyaTylP1BnkH1J50pacSOjwPXsdYbNVuEVQi6vaxWOI+c0YMJIa4ywCg4z+ulDsKKW5
         BL+I+qA+UwyRAPEyLBLl8wt9JnvAIQx6wt7W3YFqBirHgy8oI2RZFA2nxtorETvuyFtO
         OQQw==
X-Forwarded-Encrypted: i=1; AHgh+RprqLJeG1dj3Ya14kWmr1nDfCCidUPJRY4p/WJz/FVIzrSZJbbEKIJqiw6iYKXNEjXyqcpumecy+WaUGUR/hzjA@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfP9FA3u00LLy/CV0kkSsQc9somUMNQHe1VYizMI4aFuRAlKU
	muwnwS2pjIMOVxO5vZtJHsK/5fkzvajYkH9Pd3JM5E0xDN0uaLkDrcex
X-Gm-Gg: AR+sD10rPXLS70Y1gYARVVSOczH2Pvewyrkf5ZUE+5avLkvOQAVGhFEB1dLV1bQpND2
	llNZEODB0Q1z+tCXJJSfl3foiVqlwxeNw7TP1gkHBEbxM9yADIxT1o6jH/T1w+OKn2DXZQdDm6x
	m+MIcapHfk4DUpQ8aB+ZuHFdP7GguV3rM//JVejXEpJ3U+C89i9SD2gfvNxmNbNGK0DvAM37DUG
	fz7VbVc5loHrQyM5hmLdW7V12sKM7nDhFOj41RC82rQTu3U+X5MinL0ys5jY7shtZQa8S8k1de0
	NtNgk4YAQCZw8SakpS4agu0jqJXghvFGrECzQG77ZEUAChlChysBJmH7PBuj5IfkFXLQIbdseCM
	vXoB69nPbrs13r+lq3RNEf5aWnpO1Y7IbNwf3QlGqajijfWGz7Upw1oZ2yC44l2e+qpoAMD+2ub
	omS2DJS4T7vwRfr2rvQYzVXuVmRKI5PD0xwxjjH1BjUgwUYWWDJYu1T2ghfZifZnpSkIiaJ+STL
	T9Q7OIVFOdph92cQj7BjN0pRfI5u/Yx6G9z
X-Received: by 2002:a05:6000:41fa:b0:47f:fa17:ae0e with SMTP id ffacd0b85a97d-47ffa17ae68mr22949317f8f.11.1786135745578;
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm9756544f8f.23.2026.08.07.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Message-ID: <6a7644c1.df882948.3a7741.2280@mx.google.com>
X-Google-Original-Message-ID: <anZEvaEjN5i9h5ww@Ansuel-XPS.>
Date: Fri, 7 Aug 2026 22:49:01 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v11 03/12] net: pcs: implement Firmware node
 support for PCS driver
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-4-ansuelsmth@gmail.com>
 <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_134907_868706_DBED50B0 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, Aug 07, 2026 at 01:29:41PM -0700, Randy Dunlap wrote:
> Hi--
> 
> On 8/7/26 6:12 AM, Christian Marangi wrote:
> > Implement the foundation of Firmware node support for PCS driver.
> > 
> 
> > 
> > Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/pcs/Kconfig          |   6 +
> >  drivers/net/pcs/Makefile         |   1 +
> >  drivers/net/pcs/pcs.c            | 240 +++++++++++++++++++++++++++++++
> >  include/linux/pcs/pcs-provider.h |  65 +++++++++
> >  include/linux/pcs/pcs.h          |  75 ++++++++++
> >  5 files changed, 387 insertions(+)
> >  create mode 100644 drivers/net/pcs/pcs.c
> >  create mode 100644 include/linux/pcs/pcs-provider.h
> >  create mode 100644 include/linux/pcs/pcs.h
> > 
> 
> 
> Please address these warnings:
> 
> WARNING: ../include/linux/pcs/pcs-provider.h:39 function parameter 'pp' not described in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:39 Excess function parameter 'fwnode' description in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:62 expecting prototype for fwnode_pcs_add_provider(). Prototype was for devm_fwnode_pcs_add_provider() instead
>

Yep, they slipped in the rework. I already fixed these, just waiting the
usual 24h.
 
> > diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
> > new file mode 100644
> > index 000000000000..5df48022bc6e
> > --- /dev/null
> > +++ b/include/linux/pcs/pcs-provider.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#ifndef __LINUX_PCS_PROVIDER_H
> > +#define __LINUX_PCS_PROVIDER_H
> > +
> > +struct fwnode_pcs_provider;
> > +
> > +/**
> > + * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
> > + * @pcsspec: reference arguments
> > + * @data: Context data (assumed assigned to the single PCS)
> > + *
> > + * Returns: the PCS pointed by data.
> > + */
> > +struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
> > +					  void *data);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> > +			struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +						   void *data),
> > +			void *data);
> > +
> > +/**
> > + * fwnode_pcs_del_provider - Removes a PCS provider
> > + * @fwnode: Firmware node
> > + */
> > +void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @dev: Device of the PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function. While at that, it
> > + * also associates the device with the PCS provider using devres.
> > + * On driver detach, release function is invoked on the devres data,
> > + * then, devres data is freed.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
> > +			     struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +							void *data),
> > +			     void *data);
> > +
> > +#endif /* __LINUX_PCS_PROVIDER_H */
> 
> thanks.
> 
> -- 
> ~Randy
> 

-- 
	Ansuel

