Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446E8CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNzTJAzLpoj9UCkQ0S0Kema5FeZLkRTnD+aulM3+7ZM=; b=mls36zfyodElIyv6UruCcuhJ0X
	VUEbRqxOFmfcT3wMpKMgAHLul5EJJeV/iQszsiM4OYeRnNcuIbW9KYJnz7EiAJH5Cj9+Az79u0/DM
	Hy3w78Y0MzzIkgSTMQa/IGa8URSMEg2OAFvGZDKno5dC5a9mMGCs+dtG/NzfQ5iPspGnjrsahqkfF
	dxpJdrSHx1A1zS1IodjFslUmAcT8i5NbWkIvukR4DxqDwhb/2pQJ94OBB93Zf8syK80h9hI1Npyok
	LaOqHu+mW9Vx1wncdTT0mGwxOcQzxCEApKXDs0dnmdZLhTnTr75EWbQMaSoQU0cuI32hjLtf7UPJp
	H+j1fk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8PF-0000000EQGC-3Z25;
	Mon, 15 Jun 2026 14:35:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8PD-0000000EQFG-1W4l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:35:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so23007045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534113; x=1782138913; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNzTJAzLpoj9UCkQ0S0Kema5FeZLkRTnD+aulM3+7ZM=;
        b=kY0JqbcXKt7MCyWoVokXkqoey0CZC9NgkHXiqze9EjRQccc7vRfQDfZ3h/l6VGRRg/
         d9pv1yU5tucAKRokjJSFq975Squ2h/EsazE0JWqIcn4qGKo6VpmI2mtEZA6FZXtLqcwY
         E1V/pNkfdW4YZppSG/F6qLoRvQHfwklArmha6U0ASRRes3q0hNB8t5vdmjgByMckkLi+
         etsmfeBCRGNcP+saH8Gb67IVRRwihAim7XdShKcNDaA0a09PKsMflVEHSRZZxFm277yg
         yGeUiY2K97eMhUXCKAKrmLiz9ooZA4o8EBXA7LYEYwjh3D//ooEOZVfDpEk/1ea8Fi9b
         neXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534113; x=1782138913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNzTJAzLpoj9UCkQ0S0Kema5FeZLkRTnD+aulM3+7ZM=;
        b=fTU9suLggJOFz2kB1z8vq1MSRoiosEGX/IA/UeAeRcz5wkVwx8tqHFZcjZ3VIaxJHA
         IEspuLN063kK8EPMl4kBvD3NJYTtKFNB9NEWKFhk4Qk1ESaLC1sdMGGn04LV7BiYmO56
         p6duqVCpWVgHF90oCFwWN/Pudz845r5qnGE5bneNwZkfop6CJgkTBqu+uiiVsOhTjheL
         5PyhUu0nj0w2R3Uf4ttl+E7yhrK6j0TBDac9lOTa9aUnF0WehHARzpK8+rn8eBeMvQuA
         ffCvu3MRM5mrKe86+il1ZyHpToKQSJq/NX4bCwayVmsz4/B0ZmxL2zzldVtYtdGrDVgV
         PeTg==
X-Forwarded-Encrypted: i=1; AFNElJ/aPH2ExihMen/SCtx1lHxQxbszKMcUxYCqMjgDGAHPfmIqAUCG9X7bTFOsI22pcbhw3ApReTGRC02tKmVSXxHj@lists.infradead.org
X-Gm-Message-State: AOJu0YwVsfOUvnMwXEmY77+CGAEh4eIt6EpY9P/tIAmcBQolz/EY8REF
	lcHX0c4JVGmrfzQ/cG6bEM+kxO37GUgF4N8dT8CNMrfhcl1/gq0sI/oW
X-Gm-Gg: Acq92OHKA3LRpiFjeuc19/myrAvK7W8Lu71Q2B9vAg5ih7sI09hNvIdWgIhPUWcgWT2
	WpwwC7HSTOtuKYdjmETVOmKC6QzI0Ufxw13IPbfoJvXVJ6j5Sw/QpZgdFcrvXzpuRX1qiIcppyf
	D3LJ/NKTWD+1WBaE7PZ7x2M1nNi/fMOISBNvJoMgslxcYxrH30iDfV94kZ3iewW58DMbtmi5UUS
	OZETROhsHgzfurq177LLU/yjOpcxzFJGZmQn2S2D26MopPkKKgiTfXk3aY6pX4sPTdtWNzfO15x
	M/ZUn4y33gtiIHdCmgzswql+pmNRQRTBLDDmTAGrO/hvfMNOvdUR25oNrAhp5iTFqT3kdyy2Qf+
	ZVA3+akeKp/Mp56B+y/x61BpebO7frwN0ePS6egTMC+HEgjGNvivx6mL9nmIHGx57LA5uQxmwkv
	oS/VHxFvh4CydT0dJJBF9hmEAhreM/OP/sQMfSFFd/XowY1YDDJkDXUw==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr148091175e9.29.1781534113065;
        Mon, 15 Jun 2026 07:35:13 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm35561117f8f.8.2026.06.15.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:35:12 -0700 (PDT)
Message-ID: <6a300da0.d5af3cef.1ca29d.19c4@mx.google.com>
X-Google-Original-Message-ID: <ajANmyh9gB9a8FGL@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:35:07 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 05/12] net: phylink: support late PCS
 provider attach
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-6-ansuelsmth@gmail.com>
 <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
 <6a3007ce.73de60af.3a056d.d903@mx.google.com>
 <7702ac09-75fd-49de-8ad2-fceaa122b627@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7702ac09-75fd-49de-8ad2-fceaa122b627@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_073515_427016_C7BA5985 
X-CRM114-Status: GOOD (  32.44  )
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

On Mon, Jun 15, 2026 at 04:29:04PM +0200, Maxime Chevallier wrote:
> 
> 
> On 6/15/26 16:10, Christian Marangi wrote:
> > On Mon, Jun 15, 2026 at 04:07:03PM +0200, Maxime Chevallier wrote:
> >> Hi Christian,
> >>
> >> On 6/15/26 14:29, Christian Marangi wrote:
> >>> Add support for late PCS provider attachment to a phylink instance.
> >>> This works by creating a global notifier for the PCS provider and
> >>> making each phylink instance that makes use of fwnode subscribe to
> >>> this notifier.
> >>>
> >>> The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
> >>> a new PCS provider is added.
> >>>
> >>> phylink will then react to this event and will call the new function
> >>> fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
> >>> provided by the event is present in the pcs-handle property of the
> >>> phylink instance.
> >>>
> >>> If a related PCS is found, then such PCS is added to the phylink
> >>> instance PCS list.
> >>>
> >>> Then we link the PCS to the phylink instance and we refresh the supported
> >>> interfaces of the phylink instance.
> >>>
> >>> Finally we check if we are in a major_config_failed scenario and trigger
> >>> an interface reconfiguration in the next phylink resolve.
> >>>
> >>> In the example scenario where the link was previously torn down due to
> >>> removal of PCS, the link will be established again as the PCS came back
> >>> and is now available to phylink.
> >>>
> >>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> @@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
> >>>  	if (pl->link_gpio)
> >>>  		gpiod_put(pl->link_gpio);
> >>>  
> >>> +	/* Unregister notifier for late PCS attach */
> >>> +	if (pl->fwnode_pcs_nb.notifier_call)
> >>> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> >>
> >> I wanted to try this out, but I get :
> >>
> >> drivers/net/phy/phylink.c:2218:17: error: implicit declaration of function ‘unregister_fwnode_pcs_notifier’; did you mean ‘register_fwnode_pcs_notifier’? [-Werror=implicit-function-declaration]
> >>  2218 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> >>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>       |                 register_fwnode_pcs_notifier
> >>
> >> I guess you either need to stub this, or there's a missing Kconfig
> >> dependency somewhere
> >>
> > 
> > Hi yes if you want toi test just enable CONFIG_FWNODE_PCS. I forgot to add
> > the static declaration for unregister_fwnode_pcs_notifier. 
> 
> I'll give it a go with this yeah, I have a few devices here I'd like to
> try this on.
> 
> Can you CC me for the next rounds ?
> 

Sure, if you can would be good to check also the other commit if everything
is logically correct.

BTW by checking test from patchwork I can see also another fix is needed if
you want to test this revision.

phylink_create()

-if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {
+if (config->num_possible_pcs && mac_ops->mac_select_pcs) {

Aside from these change I expect the current legacy code to be not
affected by these change.

-- 
	Ansuel

