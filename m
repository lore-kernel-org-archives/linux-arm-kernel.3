Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF52C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=; b=ionUmuK+BdPlZ3T9wljaJzRrHc
	XY6eIjYHQRxueqRGFZe6e4QhbZd7sgrAUas17818i9PqF362q0OVrs4Hcox/SRP3+hJoqsJKZyxbe
	TVD4tgwgYwGFv1Z9dCdTvMF8UweC6Dsq5Y0yAa7R7c37G6Q1QSy9r05AfPXf2wn33i1OwFMzl2wnl
	gExdMZQIhrgVomn/lmwArcTQ9yK/j149uY6DDiOYDZdBjv2gsBpo9cBoBte2TWvhQKXoqc8fHs4hz
	OH1itxXyqLzIeqS5/PRZxqpifnvnCyx9gvtT4zKsITDTThbX8b6ZlHAeoGGMR8bZ+boWwwitbpTiP
	p/bt5rkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh2x-00000005Sca-3cUF;
	Tue, 15 Jul 2025 14:54:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubffz-00000005CaL-2PVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:26:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3428085f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585990; x=1753190790; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=x1HeYETGAtwXCgwEC8Xm0bUiNtHP77PWUyKqOuRVBruWNm84VsBk1wuodRUc+p91nX
         02mArV9hqnWwU+eVEFnMQwHs5gmIqBSCwmxANMx1D7ZK6wyi5A0mldh+X2arECOOjcK4
         y1qXb4t337wdha6wGc0KUZ05y7JL2RRF81gy8lyDdmoRv11yktNdg655MhKDh7MJX9DZ
         4nDwPnzjRmJ7zYwRGPCBLzGh8+/uyO/1OK0cQ+u+qnzQe9m7TSNILZoTGQGejNher+NX
         jHEqwGV8byKqZHLbI+t7/JbsWV4SS7zbw23YIPI2HuDMs/UJtvJnUgixP/HLlSdPgFVs
         t/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585990; x=1753190790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=HHSFe43jgiRlxiaxneSH0X3xzL65X0ADYlj16f6INrxXIEa3gvmI5z/VhK0VoSlsem
         yKmDk4BUvmqMC4Q1q9tju8gfJxcQugvLA74yi09Wmrfu0GzRL2VzXKp5jpEbG5GhdP4j
         MXurXiXjN5fDCbp2efeyAY+u1iDly4/vZRTagqD5aZgN90aeTlj31qbto5v8+z7y06TS
         9cKmtVktqlR5C43iwK6wDhnbvd7b7z9b/517Mq0ZRVbfty07a2aTLVxez8uaGm3Cqf09
         EjhKxhQvx/91iSJS7G0/jq5D1jO4a8ogxOpM+WxMfsL36mdOrtai9sLDx+0QvlrcqVCC
         TLQg==
X-Forwarded-Encrypted: i=1; AJvYcCWjNv9rptiAWCerzLavF71KvPQ7Hw1Hwz9pdAN5anHIXQv2MBiCXtztUn6wRkKPtSS4nBt6rj1jOmqnEQxgtSf6@lists.infradead.org
X-Gm-Message-State: AOJu0YyyYysN6K0rtMsOG974snfK2/qO5ewxIVsYqu73kZb6/nQA4x2x
	rfKRVItXUvPn1b+2lo7uE39zw/IQzno2eWptXI48aQC7Uh/dwUIf+IHVKgyHVT9yX4w=
X-Gm-Gg: ASbGnctekXfhnXyx1AL7TXci4WW95fRVfJVx1E/fI3xokbvTX0ai6kB0WhqIP3jeJDI
	X94vSi+xLqdogf5TYdY8iJPSH3zO/18GAnkIBu3RLh9IXEIcLgHBfV3q5RinBCpItEbf/wg59UC
	g/KcBjy4r41Hxn7Hq9aHMCU7XVuDXnfMYKd3FmMp01OOvuByJWBkbzcahF9/tKcgmMp8uvOtbAO
	bTAhxLX30xHUDNm8JhpC5tEVpv6TKeNp2A4be2P5rtB38UYX/1Lp7nUrd9jwCnI7qSj3TNrCDdY
	vxLL2t5uW/s98rpEWhpIaHyvyQ8CmXUaqQ+sj3K0hb2ukUdd3Sme3EPG5djCbq7O5nPSVFlVCiE
	FJX09FkZZX1/+XEwXexvIevF/k4h7TvsxUBQr22Sgnb12j5AX2FQBe3Wy8ZB4
X-Google-Smtp-Source: AGHT+IE407KS8uKPTJWroRm8IILV/e+TMXBeoa0EGQKc6WbP+vL8QbjAW05nEN1glpgEAbE4/IV9fQ==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60463d8eemr6451671f8f.11.1752585989943;
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm15337925f8f.60.2025.07.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:26:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
Message-ID: <aHZXAw08359qCBz2@mai.linaro.org>
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062631_617792_978D6EB6 
X-CRM114-Status: GOOD (  12.15  )
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

On Sun, May 25, 2025 at 11:40:04AM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

