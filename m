Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02171CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=; b=mxIostNrWH/cg04VPIeZFgMDdy
	7c4D+5PbOCl8yEy63HoJUXtEBjt7tNzEe+/tKxkvh+LYKJp5otyApVJYSpH2RpW1PQB/TWeVbZwXi
	nvyLMua3yTbKHaMfhVKH8ixufGVoTaazQ+2URJ6xHMjhEF/JwcUtxXyPPOhiWOgGnH4IFzVOhy64Y
	I/dxz2MAbOzHg3fZvDcre9CrYuswY0895aWbcr/vCa6aN1jWd1dgCMKBhABDCAH/xMPGcshIeCThp
	s+Gml6+0hEieVplVPMtdQjq04RIxbsp6fENHtISmAhFpNiCZVnEL3Q6Vy9hc9HzmIw6X/1qLLmtpC
	fOkuq7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDLG-00000008PTk-0Dxm;
	Thu, 01 Oct 2026 09:44:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDLD-00000008PT1-10zi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 09:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=; b=nQERN4BroBv2NH1+VNNEMBBhc6
	hAGEATSoML1p9s3/UkTWLcLLd+6P0wYpdDH7+JFmNSb0mrLSM3otsdSBbkyXg72HTmQn2FVevA10/
	H1D2MsMgq8pXbCLDmPwxBfWcdN5a2B3/X8HE7+S66FLwzJFGRDuUu3PeOzGxm/dUnrDcP4M4Yknrv
	bs6CKuW3OuxsFth9GKHq7AF07eklT+LvPWi0tLWMCmXyMgBSbzLQkhR87YWD9+yrCf324DrjRyM4a
	nh1POVZOppIoNgBDvK/Q9tajIBpGAScOYPJE98nvARVn6kpQ8pLZ05ABTyl0babQ7+9T65B6HLczc
	qZBvEjQA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCDL9-00000004o6y-2IFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:44:37 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso32087855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790847874; x=1791452674; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=;
        b=E6EmmIUOV7dVqrgr4jNeWGQbZOt6CTgaK2F8IFV7ATVdm73UJ0z/2o0rxVdxch2e8w
         MH6e7W6+bBR+KV7toFdDchkvW9Ye6xuwlwBuIpof7GgYphkEF1d8qzH5OlfOiBIIWxHB
         qFswAEGJEt7JBcs0Ojsk7DW4feIEBPb373MvY8N6xaqM7b7qhEIX4Z2aAhJXJYtxoiTo
         v7GMPWpLElmbTZhb9sZRaryQe9gX5gQhS4TtpANjvv1jY3dTUpGUMJ4SxlgeMj1GSN+2
         DJ/z3ejX784aFxhs3uiFmYW3m9QEozJ3oJAB8q9tE5PLUkiKMDSfu8kEpDVzqKs2KBYX
         7x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847874; x=1791452674;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=;
        b=ItfGQDm+WFCklhNwZxSfMzp0PSXM+VFLJSAj4Sq/qm4VIbZFnE2dKOhKk47+ORw1Ch
         LJUT0MJJ6RtcMEjfQyj1RwQJ02gei2OmiuebftvGe4kAvu69xy6mvZiX31NG36yfwmDq
         v8giEWRdFChIGHpB4oN3u3Ms29NgNg1IW1EBgTAqoRXe5TEBLODXkQzcrZjoHtwqRcrG
         b2HeYpl5pXMAcmp1PJy8nxL/4eR0gn7dUUfQwLmikEzpcHr6hiqB95sfrskvNpjRfxb1
         /+GJavfpmsxS3r3ZGlPxFtLFGAzEeJgBBKSgRnH46GE3JS5Hc9LYoWphqOQKRuuGi+fu
         6HHg==
X-Forwarded-Encrypted: i=1; AKwUvBzGS0SaV4Ohucqw47gJdmosfup2PaMvtdr4PUCL+FeqalL8xuW9j0BEWwGCqPOUG8xeQRV/GYyozykgX2hVJdLi@lists.infradead.org
X-Gm-Message-State: AFuF++lMJRE3aSYSem/kOB4cwB2gAOSNmb9xPtFhEiCvNCcY0W02nFIc
	/+aCS38NETBgO7EEAaBwTZkDYT8VPhFXBDwpL7gJR83dqvbD9oBfpYimRNaFCKO5lPk=
X-Gm-Gg: AYBFou2T1Uda7nHoqzhh/S1Zj1WRRacUU3y0tGm6a6665ORSvDy/u+8zeHA7J8q/iAK
	hGxDzvVvqJWxjEKQ6wDyuzthDbBcgW/5O4y0b6MQcnPTv0Urfa8D2xeGMUhiSIe4PtruuOmplGu
	RLxHrav5UocS68CB9WlgD3aOSBMoojPCsxtaFvjtBwUmOdpswXK7/+kjr2jiBZlpwY4+OXPpmsj
	NeFASPOlvKLItruP4LMdQtXn3/s95B9rwAaUVZ9xYuGqHsVVrv3dWb/A6fPfTaoJ6rXX+Uvzib7
	6oW0OE1t5Uc4U+NkBHxbfd4zKMA+uQhq8BtmXI9V/HpyqmrsRZ0PIxzBsEv8n6N0xNtKaVSOnhn
	hOLhNMNqkS2+LC0En1bL+79QoC39QZdo3SeA1lgcqJ5ZaYTnSPhDFYIbcMiMoTVC4NA3f2gEezl
	q/bcWviGwVYTDW4jpJAdiYlsYtcq8tqSNK30EvrV2caEWktFtqM7loRnAOHLXDVUm17KdIB6jNy
	KzafFfoG2umyZniPbmZeaNCnmAH
X-Received: by 2002:a05:600c:a015:b0:4a0:22d5:9087 with SMTP id 5b1f17b1804b1-4a022d591e7mr16229865e9.31.1790847873729;
        Thu, 01 Oct 2026 02:44:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa137basm53110945e9.1.2026.10.01.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:44:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jacky Huang <ychuang570808@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-5-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-5-48937ee6c9bb@bootlin.com>
Date: Thu, 01 Oct 2026 11:44:32 +0200
Message-ID: <1j4if53gcf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104435_772697_CBA9551C 
X-CRM114-Status: GOOD (  19.72  )
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

On mer. 30 sept. 2026 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
> possible parents, but the driver never registers the corresponding
> clocks, so these parents could never be used.
>
> Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
> and pclk4 and expose them through the clock provider.
>
> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/

Is this is a mistake ? We usually add this when applying 

> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index 6aa42a3e1be3..c914079cee2d 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -17,7 +17,7 @@
>  static DEFINE_SPINLOCK(ma35d1_lock);
>  
>  #define PLL_MAX_NUM		5
> -#define	MA35D1_CLK_COUNT	236
> +#define	MA35D1_CLK_COUNT	238
>  
>  /* Clock Control Registers Offset */
>  #define REG_CLK_PWRCTL		0x00
> @@ -544,6 +544,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
>  	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
>  	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
> +	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
> +	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
>  
>  	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
>  	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
>
> -- 
> 2.55.0
>

-- 
Jerome

