Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDADBE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecF4TE66khefvBf5h2UrJt6LgwhU3O5F2VlOQKZYwRE=; b=2re4K+uReZZ5TaLJ6b/yIE/B5l
	bMWSovfGcbaPzu9DQsSlsrcz3EefIJR70jA5bbzmlZMDNLkbRIRTOT5ZhB6jb5oMJmzYWp3eZ5enb
	TfSwAeaB7bRGvY2weW4vJq/ouhBFLkTnf4NFJFoCQ5gCqYBR+dFlpNatIVB55VXXA7Rc8bKFBeH5d
	WN0eoHZcocIZcgM17AGN4HXLHIoHjrUHyxzsQvqVz3GdO16R75OvJ2Rt0jRAQKP0ZzdgtB9RShN5D
	zNRCyQsJmo2yJ9Clhv3kMX6qacMZBUAP7h05cYkm+DkL133pn9o22vT9TraxmvnxjFXInpApc5Utq
	6tpizUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuPp-00000003xN9-0aBA;
	Sat, 07 Dec 2024 13:00:09 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuOm-00000003xHB-2wu1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 12:59:05 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1C90F89182;
	Sat,  7 Dec 2024 13:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733576340;
	bh=ecF4TE66khefvBf5h2UrJt6LgwhU3O5F2VlOQKZYwRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YrZoYS3EpSJcl+nxxUQImZJ3aUI06M2S+KIz6rT5LfZuCxXtlPe4HmZOOjfGRs5/F
	 eaBMNZkkBL9QI8MaCaJt3ofy6f+tvf37U/1eYOttO9HeCTkqixeeJz6IvndCuEo70c
	 p/YN7l+KA3thWROzL+kbRgMeAiWZO8koqmKKH1YW7TDp2mntcGxyvz8VNCMooV3fCp
	 5VBSJW0LNxGqdp/jJ85e6p387N5+fhFy4bzEW9rZmH0ymaxWE49y48WYqoTvyTVS+1
	 GDCuF7TemhSdDeOu+FoLsfXRVn3VlL1xEAlxUmHy6Qh0QOZ32bP6TywNBbi8lSwjnc
	 OeFwsC12+NQGw==
Message-ID: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
Date: Sat, 7 Dec 2024 12:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_045904_917728_0275CFEE 
X-CRM114-Status: UNSURE (   8.53  )
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

On 12/6/24 10:43 PM, Mingwei Zheng wrote:

[...]

> @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> +			clk_bulk_disable(pctl->nbanks, pctl->clks);
> +			clk_bulk_unprepare(pctl->nbanks, pctl->clks);

Use clk_bulk_disable_unprepare()

include/linux/clk.h:static inline void clk_bulk_disable_unprepare(int 
num_clks,

It looks pretty good otherwise, thanks !

