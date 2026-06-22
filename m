Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABF8CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0E0JBlSRaUIEWVL2hII2Z9BSAc+EUsy9g19G1CKGLw=; b=CDCutiwcgEHzmzyhLxBtqrNtKd
	nQHT5mfiz3wk6rx5zzMVcBE0Ro21sEIdIfZP7Gta7rFbCWUHxj+VEIn+84XoZzl89GuLvGQLmYg+N
	+EzGZbWcGn1E7+6Scv6tSDj6n68ZBpXVgqKwe/gzk3DM9cO6YzNYcB848Ajf6CuRxJkbqq0az5mwg
	bZUo1TYMkEA4WLjCq4ZSmrd067L4AemR6w3tRVjyIvGFWiIASFeTB6Gf4ZNgRhFCytbDiSjV985/l
	0FxjH2S//k4vWVkutpwahHuVtUUtdWcn4TLMeGfZZ55IkfaByU/3kh2m4kjVtcKooKaKfIgDLw7yy
	HCYJT+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbNq-00000004nBr-2jMB;
	Mon, 22 Jun 2026 09:56:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbNl-00000004nBX-3xFz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:56:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b613a17bso33948785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782122154; x=1782726954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0E0JBlSRaUIEWVL2hII2Z9BSAc+EUsy9g19G1CKGLw=;
        b=F2w0ZAFdT8x1M9FkykepmltF/dEbEOfeIkom8c8tTt7oxpinoPL9AWEHJOhI0k/kFJ
         w0rvyLKyuyLLWaTX5ww14Xb99YQG4a9EW6bU/tmHE7L/cafhgd+zr7LKOXKZ4Zpy4hO0
         /p/rI0JIiPPtr98/2scMa6r0oNUZwHywfZFj2QLGq/GdpPHM/EmFITARnrVF3eNcElcc
         /y55A9geHwjWWvWWOsw+IO6f9GR1dzcwwlo5xuvJhtSwmmACZy2N2SnJ+3hR2yOJ0Gvj
         h9/Bu80ulCctT4zzbbGF4duqcm4WA4OAFoqiKc6UyfdZPLRTxkXqhgZZ5FRGha/TOlGH
         ib8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122154; x=1782726954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0E0JBlSRaUIEWVL2hII2Z9BSAc+EUsy9g19G1CKGLw=;
        b=O8WfGw3lGYrGa7xomYUM9Zwi0FIOWbCSPL0yNMEmtWZkh43Wl+eeh66N3GAzni9TOa
         Ey3Xi8GA07+mKyEgcm8oAFbkgbbjI98oJoqJY63SWolfh27zmfo9sWjxR2m279/xV/yR
         S26e3bkEZOd8vlk8QivCbMXOInrRiC/4Vx2Cp1yHuX4y55uhBorvJe0b+NDgX/bVtILD
         Ifmy2yj5rWPZCOkDXahS4caFduCYfUFVuNWUChS7SzSTy6oqU7BURk4+gJFlxJb8PxxO
         5Iy1cchvvopVJuwBYUmHBxwjf5UH9ujNS04qhDCVDAiuG0rFRIYc6tp6RyO/Dv0bv45s
         leRg==
X-Forwarded-Encrypted: i=1; AFNElJ/DF65jRtnGzCNP15FtewOW1f93IlqdJFp/Wvd5wN2e8/XoLY5wid9LMKwpTC1ZUCq1Vo+3ISPQgy8J5+Se2iTb@lists.infradead.org
X-Gm-Message-State: AOJu0YzM7+hOJ1J7/PsE/EumznLlNS4zMP3eEQWq22OeV1R0g0732yYi
	BnW20quBDXKQ5lQgDZaFb4ssIwCBI2QHHBv+LzGNE+5K4c0deeRQQ9JF
X-Gm-Gg: AfdE7clp5G79IsQYzCxmyaJU2xmi62vJszliAWmhoIGPp7wexDfIdPfBE0IEocKqpAb
	3TGP1liCSw54OTHBpgMlC6VkEYL4KtmFvauvhRPoPuEhKE5tWx33ElW6wNkHocRfDKRY+cfL9Tz
	JYFCL4eNXTUWGKSAk6PlgSNJBrtXYZRdzw7OnOsMSzVKZ61OGhKFt4ufy+zRlx9Letc+6W5pdIe
	VDO7oB3qD2hwfGKdimIeO88OFBOjxM7f6rvvRQn1gtoVxv5ceKmFjuBukLX0vS3AzDgmN8dNKUe
	x/2kuUaGd+QWdc+g2aau6W8zSZFhdud1u/49ESSyL7j+mhkioI5yQrEDb24PC1LkJIvJPHLy5rm
	Af/ezpOfYvMX/M8I38mJUq9AkASLJJ4fgHj4cH2sjtmf167tonbylFmfDdKU/G2kxRmLAcU/8Zl
	yQyiG/hKv5mN4/P9PVNdyf8DA6engTtdpNY800aZV62SLrMzZIEBIEX9YOGBQwsKY+g6W7qthGz
	WcH1XWZo7+z2PKVzgD1HME7D+Ws50LsBP8iq9yruSIXtQF4rs9ATx/bt0tA3xxiKQCTpv9KgJuN
	LGT/om4GtrFC3HDx+D1T0IzpZBxg2GSHbtyuokTyp8ayF14IEFeWAnQ=
X-Received: by 2002:a05:600c:6288:b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-492490a7778mr137140915e9.19.1782122154243;
        Mon, 22 Jun 2026 02:55:54 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15535sm313817465e9.3.2026.06.22.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:55:53 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:55:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260622115554.000036a9@gmail.com>
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
	<20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_025559_754934_587FB7B4 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, 22 Jun 2026 00:47:28 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
> +	info->clk_rate = clk_get_rate(info->clk);
> +	if (!info->clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "invalid clock rate\n");
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (ret < 0)
> +		return dev_err_probe(dev, info->vref_uV,
> +				     "failed to get vref voltage\n");

Sashiko raised an issue that I've missed on previous reads - why
are you using info->vref_uV in dev_err_probe()? The info struct
is not zeroed out on initialization, which means that dev_err_probe
will return a different value each time when read_voltage() fails.
It was designed to accept the retval from whatever function we're
checking. 

-- 
Kind regards

CJD

