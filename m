Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C8DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=; b=hAL1TvUas/7n/tzz2xFn0Bi/wB
	Bwx7X/675OYkemv+E8rt4L3HXKsVZkOIkcE+Dmjt2+QkXQTB2g9BXd59gQM8mufsgewcDjvMgY/4S
	Qzjsx9qBF3TreyZ+lkC31YU3lycQGsC6Lh/1b8BaLnHhiqKOnW5cMJluXaAYhQvMqvOQtBpCAUeLd
	N+s1lzlFOvNq3MWp5X0PQaWn9a00aswZXo+QeHSIKOq9y1yUdLekAMG5ti4VioemoHJts4BjYTYNU
	F7uKeGZ2Ytv9V2U3TX2nemEtoJiciKw3nyrobj1lWp4/+iQF3iQzFCBdJiEwRUnqusGYt+dN0knZT
	phGCTxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp44-0000000FvWZ-0fFq;
	Thu, 26 Dec 2024 14:42:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp2s-0000000FvKk-1UIu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 14:41:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4363ae65100so69247805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224060; x=1735828860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=Yj8VmTkdDrk3rzYHvOU6TGZ1KQai2A8SRrUQWLPuqlnXrf6UbV+LsSsSXReZdf8JYW
         qk1+ccr39ebhU8twuiPF8YwwjyvgO+AThIEZ4cdaukyFkrUmpw9s43OVYXLtJMTFD8K/
         UiNT8WwMnllpumuhz1krIPS9+/MQwz6UlTnS8heMx3/P7b2JkwzdTtoSPw66D0Uxsh/v
         qbuTmNZEMmv40nJPvRSdJ0cvc0B0FCNIQ+dWFjW0GJUhv7ZhGyIj4ZkOxisi0Ww201bt
         MI3l+7SYnrxQ8Cpily7eL2xEfGTddpEK5VX6uWPSX75BdzIIJrwN6hSrsOGUeTVtoZY8
         ztsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224060; x=1735828860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=GCZn/+LX7gNFrKJG7gL4bp6M8rIJqIYR+08dQhfRleRAxZOZUp6knTD1S37k/f57Ls
         lUYA2cteg2S5TmaqK7k6Wc3pShPV5Pp2Qp/Nz9EBG9F2yNg7s583MkUz/iQgtpRPI6xE
         swovJ4pABKl843Lab27TEjxQTcckuFfoKxcPZGtGv6IaIh7JjlflrxHeWjOl8M7vGVi/
         8HVfEpMiPufJ//QWkJY4xNXOMftLpd2e2PO47NBLhHvHjfBaj/9z1SWX37dvdOOUrB2T
         NtXF2xgrUI2gt7X4NZEyKuhfvxL2Y8vHW5ExWHdOkR8BKSJC229Z/MZHpBksgjosDT64
         P5gA==
X-Forwarded-Encrypted: i=1; AJvYcCU6BTQb+rc9xwinxv7WyR/6SzpP7EtPAu5SkLRBz7BY6h3guARyRhvh+Qslgc0+3iLd/J560C/ZQAjxrRcphNqY@lists.infradead.org
X-Gm-Message-State: AOJu0YwN7zYt31TqoGSKt1AyNnsQykkNo1fnKq5OePyimXXtruXhCfaT
	BqbhE5jXxJ62NRMPwv8+HN9FzyfNHfVxTNRrRVzE46unBgwjKWZU7CIbCJyhSP4=
X-Gm-Gg: ASbGncsnom8lzv/xaVDvpYBGUQprpSUhuXtH0RgaSaTYw0zsy2Wfs8+yJjhgdCuPnxq
	aIZa4da+OWuyN+OjwJMjgC/SWBxMapGBfLtZ+s2sjFE/yLilqdWyeg2nN9sHJP+rGCPJWbSWGR2
	vGr89NO/5OUPXScETt1WbXa2pQ52yiwPuheMd50Pe87bnHb7GjJL5En+r5HR6A96gRdmqNM/K4n
	8LoGFkhqruhYK1DRpRxYqDQz4iitcnwKftpAUCY042SzvbBVEnK7Cg=
X-Google-Smtp-Source: AGHT+IFAkeYRxenuSnMh5whe4fj3qf2FXC2/YY8gmQiLBoDE4x9299sSrv8G4XcwveZUu2qAO5Z/wA==
X-Received: by 2002:a05:600c:1c95:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4366835c1b0mr210961505e9.3.1735224060629;
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm233695145e9.32.2024.12.26.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Date: Thu, 26 Dec 2024 16:40:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: abelvesa@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
Message-ID: <Z21q+Xyz7bQjN+yJ@linaro.org>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
 <20241119015805.3840606-4-shengjiu.wang@nxp.com>
 <Z1bkixjbyFhH3ZgL@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bkixjbyFhH3ZgL@dragon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_064102_404686_7D72630B 
X-CRM114-Status: GOOD (  19.17  )
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

On 24-12-09 20:37:31, Shawn Guo wrote:
> On Tue, Nov 19, 2024 at 09:58:05AM +0800, Shengjiu Wang wrote:
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which
> > missed the clock gate part.
> > 
> > IMX93_CLK_SPDIF_IPG is the correct clock.
> > 
> > Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Hi Abel,
> 

Hi Shawn,

> I guess it would be the best for you to apply the whole series through
> clock tree?  In that case:

Sure, will take this whole series through my tree.

> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> 

Thanks,
Abel

> Thanks,
> Shawn
> 
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >  				reg-names = "ram", "regs", "rxfifo", "txfifo";
> >  				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> > -				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> > +				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
> >  					 <&clk IMX93_CLK_SPDIF_GATE>,
> >  					 <&clk IMX93_CLK_DUMMY>,
> >  					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
> > -- 
> > 2.34.1
> > 
> 

