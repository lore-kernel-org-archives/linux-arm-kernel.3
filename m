Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E51EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=; b=W56ThtpTRfWrplSYeXwO5AUuVe
	FeGM+0wwSxoHicLvar6YbVMIYFC75SE0jGUCaUMUsVhgxKJO64bMTM4KcBvyGO8xqydFsPuG1/ekk
	i4tx78BgOcgPHgj7uHnQdINGRz4Ofa0TiBm669z1CGJYTePw6B3QzUNbUSCFf74YsWBsf6pPnLKH6
	D71olFdHo9X7LNPKd0W6UcBniiKX+gVD2edOddnp4LcjYHigECZdgRD0Qny3fPbG1YdCinVGXD0Q8
	R190R+jOJuSz5bPN+4S1Etfm4yFy7ZxSAMMGbpzhScBofwW29eweR1YHTo2SCV409pEyFaSLg7vud
	lK0aRcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmxP-0000000AWXK-1Utu;
	Wed, 19 Aug 2026 20:32:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmxM-0000000AWWM-33n5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 20:32:17 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1550639a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171535; x=1787776335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=mBuamQXKHfn77Ff0OKYFJZTEGVnYi55S1n4KiJgOlOVv2BuCUIA1s1X7bE7To7cnLi
         eh2i7KI2hYBQxWFsc4bUOu/J40F0zUR3sKsip9MmW+njBHMKHnMESMixvQtwXnuw70ZV
         yGxPyVi1PJnIA5LjUCEYCmejd2cKfwvrvCcCcSrm/8IY6ljcHBtVf4zuWcaz11JVFhQu
         htzqnsm+HfnJniyC2pn6JNpwMFV8I9MTWRzrhDSo673gGtVZ2b6LstKk6UDQ4L8jpF/r
         brDu6EAdraOtAPTVm+IDhEEW587FLa/Ivya84d8rOye582nYPYyFsBz3ZN7kFoN4pPXZ
         DH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171535; x=1787776335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=kg+X3q5X62cDhf31sG/Fg9+lt31XERA5eWH4eBescjN0dyobliGdE6r3hlD1Yp3Aew
         h2oj3m+UisWNNJ/VDVjohFY0+jpwdyzk12WaoV3MH4tmmvl+Fnix5CrXdjYYhkjmeIbH
         MkNr/n0B8hYaLmB/0wTR49NhLMKg14OnRozTdHB45vL8905g4oXz3+mXfb1Km6N9nZ6t
         KkxSWR+h/MaBNwJw1dOK7oXVn415HEZNYo7G/1rSXbKPS8UZQyGEGdTizTKVRSmS0LnT
         Qed4OHnn7ayWTA1m8POufwmWX86sYIkPEYPYN+r4b1dJYJk/4a4Iq4ttEjbGY4hrnfek
         IGSA==
X-Forwarded-Encrypted: i=1; AHgh+Rout5A+DaDDC7mXoNF4stKRdBTQFCnHvGy8dEJCKeafPm+8Ppwjz2O4dyRcuAVXRcNiaa7C2WV9fCQhBz25YzU5@lists.infradead.org
X-Gm-Message-State: AFuF++mwaMw1XxB4ZkKTupzJ4q98Z6GxxRD1OfXbLzFoPaiGYZWN0aGe
	kzLC7VXjwUnNO+YMQrlUdiSAGAnpAzjVgUtp5ky913hJFJBzGpZ0q6XX
X-Gm-Gg: AR+sD13pgFyHI24IyLcJ8vZ1jSeApJMKr0iNoTk3oHJ6xGIAomoinKJTUDT0/ZyOeth
	b4kQxCEp3/9I4aal/A3/f7Lj+WJB+VXtNPOyUwv5fIZrisG3Si2lXHxnyCsy5DajAoaUv6zJfJH
	4BGl1hVUdPUKMnIGrCFHbXzKI503vDVcDU5pQ2TGnK9d2EMkBLcGdnaHsXoPiqfGw0yhXEKZxpG
	Ra+rYUGNOAA0T/BC2h8SdL3/1uHTcrY/QEazII2vZkVnB5UGeYj84S0/QKHxBnbKio9EVtQaPrm
	QeT4t5/S1UEi4bIBDd9M7G5lv3jxc0mm7LHiihfYJB14lolC6T5EmmJkUGjWx0JrsLce6XUFKSz
	/uvd0/yfZgjPuVI+MiGR1P6pJT0+YBJCKbCeLfa3POvLZRZ3uCbKIJYoFTw1XE0b9BLqAyC6nWw
	yhKEJLvnx0RQzixiPnXBDL9ko9vb9dgVYCmc+Bk9eHNW0b72+0Y2J1z9VEcnzC+OrDhy47BCoE6
	g==
X-Received: by 2002:a17:90b:4a8d:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39580553dfamr13842543a91.0.1787171535016;
        Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm16706081c88.6.2026.08.19.13.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:32:14 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:32:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <0ee768d3-f913-4d29-902b-39f8bf973dd6@roeck-us.net>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_133216_770748_803BC2C4 
X-CRM114-Status: GOOD (  24.30  )
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

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

> ---
> Compile-tested only.
> ---
>  drivers/hwmon/ltc4282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index b1675dc5b3c7fd2f..54ba4b8542e94b7b 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -1106,7 +1106,7 @@ static const struct clk_ops ltc4282_ops = {
>  static int ltc428_clk_provider_setup(struct ltc4282_state *st,
>  				     struct device *dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_COMMON_CLK))

