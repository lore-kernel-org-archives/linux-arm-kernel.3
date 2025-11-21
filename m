Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A52FCFA76C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn3wOGMh35VRAyLK1z47rfPXxroKNFJ6qRR7lUA5vuc=; b=c37hdFeYj6//UCWtb1jiXATrfF
	EuswCBoj/lYjmP/zeRjQonMcxP8aqMLkASKy6z2/c07kA9bsyhJQoeoj0DYnpbJ9xqaFB6fKgD4qG
	eNSmY7+Cq5VYSFX+G6ZB3DDy7nPmEPh098qo5lScRkIArnK9PS9mFebRllQg8Cwu5VOjUTqWWfCu3
	GSrgvyiZvIAbMuZ2ydmRhH4bSr0Op5qG7rsHqxmiuFXHHdSCN+XUvJj7RXt7kwnvcBi/A3rvGKdTs
	gssbbLzMMkHuyvnkRE3vMW/xBgRZUT3Q9VnZmr5Q4e4u+nKhxki6GF7X0gfZSVmRbm0Dt9cP5YjT7
	VYxB+ScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOPU-00000008Eij-3lZS;
	Fri, 21 Nov 2025 10:30:36 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOPR-00000008Ei9-3aeT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:30:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763721012; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Seii7yGgiAK8YqQd3A1uljT0JIy/Rn1UVCro8gYHBzeklgaoSJaCMu7uOlMHUgPEAhdXAhmjmlNsPRCTMhn7cpq97vpdfkT1BHJRmpTjNbm0oUj8FwmIEvqt+ZmA5Ytgxpc8/bAGyoq0/A2YJyOkPqWJYhTZqiEu4yux09mM/kg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763721012; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gn3wOGMh35VRAyLK1z47rfPXxroKNFJ6qRR7lUA5vuc=; 
	b=HFwMQKJpirHsE9HjQ/VIVGncO0FhTLIjc0JjMJfsDtKZ0TqCEbW480JVdpP0uL846XjpYMKjE2OzilpF/3oE4JGaQZujwLrpowTBeBhOrWubk0hUjSL04XlYAzvLcL5XSZ4RSqdPsZsq7Bq6mWOmX61Hxti+4M/zuqNzWInjOrw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763721012;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gn3wOGMh35VRAyLK1z47rfPXxroKNFJ6qRR7lUA5vuc=;
	b=c13HocQPgKuWgTuCJ2uA0XulrvwGkyEwubh0Q4UmVk0K7Z1djTilCdbbxC3s+llP
	PkzpvWfpHABOipyA778yBgcZv5fYSpzmFaFhoovo+i9b7hgKTOZx19rbnti5xDa6KAN
	QrNsdOGJBtc9CRESwezDzB+MPvrIDI9/1aMDs8Ic=
Received: by mx.zohomail.com with SMTPS id 1763721011318865.399722972453;
	Fri, 21 Nov 2025 02:30:11 -0800 (PST)
Message-ID: <ec5adaa8-078f-4c6b-94af-c75b1fe3ec84@collabora.com>
Date: Fri, 21 Nov 2025 11:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst and clk
 mask for 8mq vpu
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
 peng.fan@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251121081911.1682-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_023033_993087_A3B938C8 
X-CRM114-Status: GOOD (  14.26  )
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


Le 21/11/2025 à 09:19, ming.qian@oss.nxp.com a écrit :
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> The ADB in the VPUMIX domain has no separate reset and clock
> enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Thanks for the patch.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 5c83e5599f1e..1f07ff041295 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -852,16 +852,12 @@ static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[]
>   		.clk_names = (const char *[]){ "g1", },
>   		.num_clks = 1,
>   		.gpc_name = "g1",
> -		.rst_mask = BIT(1),
> -		.clk_mask = BIT(1),
>   	},
>   	[IMX8MQ_VPUBLK_PD_G2] = {
>   		.name = "vpublk-g2",
>   		.clk_names = (const char *[]){ "g2", },
>   		.num_clks = 1,
>   		.gpc_name = "g2",
> -		.rst_mask = BIT(0),
> -		.clk_mask = BIT(0),
>   	},
>   };
>   

