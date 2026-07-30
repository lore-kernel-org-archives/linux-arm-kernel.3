Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3AEC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=; b=v/Qe29d/mF2Agj5zQUr+wRyxme
	BYVYlj5LrFUw5QyiatDyoEo1IMUK+fUpsmlIJDLMkuR8D/ZW29DJk7ag4Jx8Tb76r6XTzWExlK1c1
	w6QdmimSHTisO6CPgEVD6Zw33Fbq2sPUl5IsuiEOINSXak7sUuIqcRYIm4NW6bs9Qw3spvSe+f3u+
	lNE6FDkCcqyxfN6YqlK0W3P30Pp2i23bmXlB0TfFKRtu0g6c5Vmr+uUQsetvZM7/EeYn1LBT3NMgN
	ZqiwPz6ejXrNAbjGYs3WCO39Rek70mbaGD2qcolleYdt+u9geXLWFt66yfDGJyF+fcWutuqIqaj0r
	c2qbh/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUi4-0000000B6MD-0K2e;
	Thu, 30 Jul 2026 17:38:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUi0-0000000B6LC-1lTk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 17:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785433095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
	b=dCkxqSXqqJL4mE6nhO57kWbmJh4GPGTgT0Nm/Fq9ho0kJnwcrU1m+QBBDDG01r+kKyxtZc
	5o1PnHUKvaRTPVK//7j7IK3s2FbJf93p3hLlBXoYyfgRkheCp5vNd+/eKFv2Yb0VBJ/bKH
	cytgUXkfE+u5odefvuwxUPkma2r84bA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-FfOnnifIPYSoVsX9qOxnTw-1; Thu, 30 Jul 2026 13:38:12 -0400
X-MC-Unique: FfOnnifIPYSoVsX9qOxnTw-1
X-Mimecast-MFC-AGG-ID: FfOnnifIPYSoVsX9qOxnTw_1785433092
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e6bb29581so2527627b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 10:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433092; x=1786037892;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=GGKYBSNw28lAifu57KxYEhGPNeBJTbqeP/MaIjuj1GT5hEOziMwQAKf028acCiBZNR
         ihMIeESpAA36AEUkGqbYs1RfHxRRmm1nHvEU6xoxeJyPIqwoiZFck4FghKdHFb4Q0kvK
         8Yu4x53AhNxGLxCsfXiVgl2IY4gkKZTgMDAszADQG6vSrl8Ht22ANI0PUxspbDns10Mp
         yBtfDQzTkXsZljFQw923T1TwqYiqRkJxnq/YxL7Q+LIFgkAK+P1m7O/7dsWHbwI5F7sT
         KO0avPcOm1yShROADK7zcH92IcPAoJU1DeVm7LjQdazkmU6QL4BuiCFbuNi5Po2tO7nv
         96fw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+BdxZUTfhB1ZTq7ffUYitp+c0JoTZTxsxxlgistcNQjJqmG9JsbrUp2G57K+Yk8AMrBOm0/nil5t1sJtgL/kW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Ji8az8zvGJTjRg90whCYoFiJg4rKOqj+LWKYoTQTECdBez08
	vos3DOjorY7lxd26rAeRHHsCXQqdcHbZiEhWIei+AXYk5a9LY1l9mi1caOeKkqXyj47iNnZPMTT
	EaScCeBcUZRdvDMAAoqrnyFc2sWmKKfjSXB8dDQDgNtinHVCl/fLhrqXXi4Pd/LDbbq2Tu3q2f5
	ri
X-Gm-Gg: AR+sD12XjsPEeI7qXGCgLGEuvd4OfeuA/pfrqIjpj7OdaoyPyhEXLD/+JwXS/1OBhPR
	QSW5UbtnzHOiUdSvmy7IZy+p0883RsNVyDiIPvyhHK8ZY6v7ds/lUzAYhfBzrlSzWbjbF6R3Ykx
	nzpAYgfme6MGcwwszLz9SeKKQ4glvKGMQLThK/bW53wP5cp7E3sQpvdA+dJFXCesoVxR01cGoyT
	SZcQIGGv9TQS55U+P+HUnhrks9LEl5iHHI2TQm+rkdINB3F02cLehFclbYGCuAXcr6oLKWFTmml
	fuRTTVZTaJ+2DX6kqDqt1/r6nf9ZggwNjGo4DFskO9PaXqbQ8POp4FjyEcBuHlgFbIguG2BFzLz
	hLUDigJwv/eaQx57wAXLcduGKaU7pW/6w+FM=
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018537b3.5.1785433091912;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018367b3.5.1785433091480;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb87315cdsm14274757b3.0.2026.07.30.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:10 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:38:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <amuMADxexEuJJG44@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
 <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
MIME-Version: 1.0
In-Reply-To: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YGNBpF-1LPG9VZ8NFPJyd7OEfaP77KTPtXdjGiKzrIk_1785433092
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_103816_527064_7BB9012F 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Stefan,

On Wed, Jul 29, 2026 at 12:25:34AM +0300, Stefan Dösinger wrote:
> Thanks for the review!
> 
> Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> > Looking into the other patches. There's more mixing of the clk provider
> > calling the clk consumer APIs here. It looks like this just takes a
> > reference and holds them. Would moving to parent_data address this?
> 
> I think so. parent_data::fw_name is indeed something I have been looking for 
> and didn't stumble across myself. And I suspect when you say "use 
> parent_data", you don't mean "use parent_data.name everywhere".
> 
> But it raises the question of how to handle internal clocks, e.g. foo_gate-
> >foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
> found via fw_name, and only foo_gate is exported.
> 
> For the other clocks I currently rely on the string matching to resolve the 
> parent named in the static init data to an actual registered clk_hw. The 
> alternative I see is storing the struct clk_hw * in a table by index and pass 
> it in parent_data.hw, but that'd require managing the extra indices. Or build 
> a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
> matching.
> 
> Am I missing something obvious? Is there a canonical implementation somewhere 
> that implements modern best practices? I learned that looking at existing 
> drivers isn't always a reliable guide.

You'll want to register all of the clocks with the subsystem. Take a
look at drivers/clk/qcom/gcc-sa8775p.c and here's an example I picked
at random that shows how you can reference the parents with the
parent_data:

static const struct clk_parent_data gcc_parent_data_8[] = {
        { .index = DT_BI_TCXO },
        { .hw = &gcc_gpll7.clkr.hw },
        { .index = DT_RXC1_REF_CLK },
        { .hw = &gcc_gpll0_out_even.clkr.hw },
};

static struct clk_rcg2 gcc_emac1_rgmii_clk_src = {
	...
        .clkr.hw.init = &(const struct clk_init_data){
                .name = "gcc_emac1_rgmii_clk_src",
                .parent_data = gcc_parent_data_8,
                .num_parents = ARRAY_SIZE(gcc_parent_data_8),
                .ops = &clk_rcg2_shared_ops,
        },
};      

Brian


