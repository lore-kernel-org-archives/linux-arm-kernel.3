Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC4D5CCA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAHJQTr5TuW3GGReDV5UZFJDEXYorIucpYIzOsAyFUg=; b=D3a08jyyXJaS9ht5e9O4tPl71N
	/z2qELxFvXWE6yon+O+7l6D5g7h99RiYbcgjsfx+B3z3EjuUg2iGA9VB8UOXWYJkQuD958WeFva2n
	9pmcivd0I2OhRBbmY6L9fZPJ7bZn9GmcCTb9yEu1TlEDiB4M16thA60lqcWKacnzMDc8B9dNgsntO
	BmwhTG6dMVjUFyPhXopeHdB6FqwJGzQM60vjRqDheDGw7lJadAGMLCbJ0RZRtNl1vD+F2eHy7yaN6
	XWg3/I+yF7zM3hEQ84bEx6fBeNowGAdTEf2Z6ciATpq64nB42kT8DY4oVSanrXjHa+iTQhWCM7Dwx
	L+87dMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67dW-00000000Htx-3VUy;
	Wed, 30 Oct 2024 12:17:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67XH-00000000Gss-1yqO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:10:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so8045275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730290250; x=1730895050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAHJQTr5TuW3GGReDV5UZFJDEXYorIucpYIzOsAyFUg=;
        b=bfFwIEYDpQwAlWZTzXI6k4LQD30BZA5UqAiRzrs3er1BkYMYZSB+EAl7OdxbpcvzSZ
         LTD8jzbcmypyXbhr1XMqDc380HcoCuM+sG3Ky4l4EvtXHugppF8zHZZE7a6r4IU7Ad3O
         ODBRGkykR4203Ji/GTs8tIYhpdTUXyxFHAnBFUDgW8cAK+78NDf/MOoAvE1X7FX9uqTF
         8sQXY+wtTKI8CVGDdiOStXvEnyoymD+xWXZ+XsQ5QtarPa6NjyNyyWadFxUujfGbnR3v
         bJAk0AfOgXemRVvHjXS9YTK+KpkhaSnac54b2pHLpfzfpxYBcKZI1ARLRT+6hwJGbcqU
         F+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730290250; x=1730895050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAHJQTr5TuW3GGReDV5UZFJDEXYorIucpYIzOsAyFUg=;
        b=raAmImW5sDJ13HyNMmmWJ9iRom7ZUNZpGM8tfdFNXtuSJ3IR961Uxd+cv/bJwfswWv
         eu1msYB9pPZ3NUH4LpLQEMtnrIaDKfJP43fb+bcqgd9Hvm1d2o4XR+NGUa7DK0hEDXJb
         GnpOUjSZT46nRSaGm96VVtaQDk41b/N5rELUYVZ7YwZJ037pUPGrHT5IBbIrFjTC9bOa
         AxC/RrY3kmnbANgU1+BZLc8YPKiyo3NiwC0hDNWfpf7Eo8rF9DccInK/YQDOD4xqyU2m
         7lT7Z6xRtaL7+0hZ8k8iMx6wbhNSQqLIhcQQ91/c/qT4V6UIVA/iLwuNXwmsYVq7N0Hn
         67dA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrl/SsvAyGuWByk6jROD5z7ai4S4iRK0AmoAU+bl7TRIr0I6M7IOeQhnlYaCR5DS4qvFpoAjIw28oFnFebMP4@lists.infradead.org
X-Gm-Message-State: AOJu0YwBM1i3zKnXGGNjt71vXiBN+NT8X9lZ/2blcloFnk4s4HqVbWjl
	JmS/JJiqTPuE9isRCzxIn/UZEnuWYYqS2BqoiZDE7UZJlEG9fKm0plxGU0tn
X-Google-Smtp-Source: AGHT+IHqD0tQoJjotGQMbkT9O5ybcV1GKcOxiI7uSjH0+aXwp1A/frWiXiw3u1p9Psnfso7u9ygY7w==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id 5b1f17b1804b1-4319ad4ee8emr55092335e9.9.1730290249500;
        Wed, 30 Oct 2024 05:10:49 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd98e823sm19903975e9.38.2024.10.30.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 05:10:48 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:10:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v6 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241030121046.ojd7zx3jbyg4l4iq@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_051051_530475_1E48AEDC 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, Oct 30, 2024 at 01:36:12PM +0800, Furong Xu wrote:
> +bool stmmac_fpe_supported(struct stmmac_priv *priv)
> +{
> +	return (priv->dma_cap.fpesel && priv->fpe_cfg.reg);
> +}

Should we also add the condition that stmmac_ops :: fpe_map_preemption_class()
is implemented? For future implementers to figure out what they need.

