Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45369C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 02:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=; b=yrD/VX8uh739iS6DmqkCBiPBJ4
	zYRkQitCcRzkJCGu7VP5Ai0CIZDGbmxpzQr4BefKP8xgdOLqk8MlJZsqu9nAg0GDjn4hoQQw6FjlA
	j2ESs3yoqArraum1Aug8CHF2iIQ71yrhi2vQKXZJ7M7PBGG6yKCi0UopVrmpP17rIdyy7PUEvTPcc
	5fdXJosrO2GCL0INNeHgIESGn8qP4uEXShZq+Y6Xze0qOupDI8SlaUt34IuoVhCzMTER7sD5M/+Re
	JHOpgr5bvtBUKnqfYMUDzpe8H6pr58B5sg1xeyA3X8GWd/Ekm8TJp81vppOOhDi72FxN74A2eMp0l
	SdSerM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjgP-0000000ANkE-1uyg;
	Tue, 26 Aug 2025 02:45:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjdn-0000000ANa4-1Xcy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 02:42:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-771e4378263so1353768b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756176150; x=1756780950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
        b=Jm2nCPa8GUwkDq6cvVjlLSdtt2Cxfgr77nhvlKg9r8j/liGL+u6GVAKGLZYq0W0i4+
         fc9hZ2M66lLL2B6Z6gKVu3/22QYo+ReftUO+eudex4/UIe8Gg+Bj9NiBG2B43yG7zhOa
         5BrayWkOBVKdlcwaxeynZAnbX7v/jQ3WUFnuVHbnSktM3z8/lieW9ixkl1r+vhv4XYGN
         /NSjm2EUHsE23EupDCDvgY5T24VqS+LmCAywQmzWWrAeTfaXW1/zr+2NjoF4cFupCzVN
         eTmn0MMn4EDYDX41aOiyllHWXblUDRsYQcTUifk27Lx0af9ZUwe5a+I0MCLKAyNtfIGv
         l0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756176150; x=1756780950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
        b=NvHOr0/xx1HJZl9+jjAQNnC85PUAdjn5WI6XQ8Idl8pPE24UIgZw2Hd9ZxlUZafrb1
         Ca8jlleIscd5GM4TL0Uteu04m5dfyoRo7E6wcsrHtubI2JRQe50YDTwlp5ZfXjP1yvkY
         KBAJqEtpM2GQWS73XRD8TBPd34Kc3GO2nairQ+2b4X+geFn1T3igGtgmTjuxi6GMNWeZ
         C8ko24RemOrDSFCAumQdhXxtHyr1s/Qpfe8NDQrBVjh3xD6oAILFJQY/yVm/CN/DY6ny
         wq7xSvb+porS1cgBGW9SWQh6tnV48c08OdjBHrI3rPkYmjqDFQ/LlWu6YUc/i++mJC63
         vHpg==
X-Forwarded-Encrypted: i=1; AJvYcCVnquzsn/tNyG/+ghYi8UohTPu70kzI9gxdn18ip7Gv/nSV4PrJw43cXJxvDExgD2PZOQ1CJdefpAEuvMmB0sIV@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZejh6Tqu2NOelTAKynH2NQPun3OKdQeE6pcu+Ht6Jy7ES2K6
	tzWXqqOVDk6WlgTjITKp4IO++KOn7MiXYECp42AkTxJo+ODso/I/eI1v
X-Gm-Gg: ASbGncubWusp3qHTW4jsimCQ1ugoQ10X94iHYYz0Ta+NcgjuQX9chMRuRo7RaRQVK08
	SC/BdjFSIz3AdyzXlnwa+C9lHPOa4BnDPZNxHyCxG16bG3O7Sg+dxo5YHOe5zeJli8h8a4i6RI8
	HCr6j0tpnl7AJdUup1MHUDONVIUB3qMI5WgSwL6tMYU/mBx7P5WbalreUmvXHH1V8UIxv+sufoN
	NAm/ZpFWAmhjwvn0YbKjnkpXg/kE61PLA2xXz5KTF8kybM9lwVKlOKfrsCABkSKBjzWHfpnnwU+
	GBRjKqhRyqwbGNtxwt2kM9xGntfvyl2H5oqXcIqbCH+89XOMOO3hYdpuBm+wZ42eyoflWeb5AC/
	ULFdwxPyOvpn92sVrohl7nyI=
X-Google-Smtp-Source: AGHT+IFpXXOz6jvKmc98oCi1NCiBQLg+bmp0DWJBuKZIBlouXbVcIiSBZxDk5lZs14cKqzF4SAkDxQ==
X-Received: by 2002:a05:6a20:258c:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-24340d91d6fmr19374286637.32.1756176150053;
        Mon, 25 Aug 2025 19:42:30 -0700 (PDT)
Received: from dixit ([2401:4900:1c42:3335:1f6f:7d68:6bb2:7634])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm7835430a12.19.2025.08.25.19.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 19:42:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 08:12:11 +0530
From: Dixit Parmar <dixitparmar19@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Message-ID: <aK0fA4QnFKH5AQas@dixit>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250825093150.3ba23f2a@jic23-huawei>
 <20250825123919.3c228ef7@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825123919.3c228ef7@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_194231_406097_41E5B2B8 
X-CRM114-Status: GOOD (  23.10  )
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

On Mon, Aug 25, 2025 at 12:39:19PM +0100, Jonathan Cameron wrote:
> On Mon, 25 Aug 2025 09:31:50 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 22 Aug 2025 09:19:48 +0530
> > Dixit Parmar <dixitparmar19@gmail.com> wrote:
> > 
> > > The drivers do not require their own error messages for error
> > > -ENOMEM, memory allocation failures. So remove the dev_err
> > > messages from the probe().
> > > With these patches, all the iio drivers now has uniform handling
> > > of the -ENOMEM while device_allocation and trigger_allocation
> > > calls.
> > > 
> > > Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>  
> > Series looks fine to me, after the minor tweaks to commit messages
> > that Andy requested.  However as it touches a lot of drivers
> > I'd like to leave it on list a little longer.
> 
> I changed my mind after taking the dev_err_probe() series earlier.
> I'm rather too busy at the moment, so clearing this out now will reduce
> what I need to keep track of.
> 
> Fixed up the () that Andy asked for in commit messages and applied
> to the togreg branch of iio.git, pushed out initially as testing.
> 
> There is still the rest of the week (probably) in which I can add
> tags etc if anyone wants to give them before I push that out as
> a non rebasing tree.
> 
> Thanks,
> 
> Jonathan
Thanks Jonathan.

