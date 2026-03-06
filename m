Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC77BFCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9EbkxOhimqfk3l0qwEGtPXK1UaquMIBZmS0s0qP6OI=; b=UH3lhBkVH91TiTylaZvrXyDbv+
	LXdyBJf+MZ5fYYsjlJsgL3TV9yj7NKsTnTT+LnNAlXW8I2vIQ6cxFIRXxfGswoxqEbBR5MnKTmrxr
	p6hGgzRW0oMe8u4s/HeJlGzwm68KqrmM8mRRmr+lyYQtbIMkiMoRENVmIlyPI4J7Xpin2B5fqSH1B
	9l1YG3EpSKdcawA1zR7GhNu5BfYXHfqlnua0F17nf3gRlND1tX1M9++zVdfKJnrEizejnzP2p9m4t
	7ZQ+doqO6v75vdFCkylV55D4zdegAsYmTQi7NTNS1PlIxNWcjV72R4RunhFsuwMAAmI6SrNNaJO/P
	PgaDxwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaXl-00000004NSU-0KDC;
	Fri, 06 Mar 2026 19:09:01 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaXi-00000004NS6-3rsw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:09:00 +0000
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id yVrdvBKCdKXDJyaXgvpB0i; Fri, 06 Mar 2026 19:08:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yaXYvgz9kK8vzyaXYvlczh; Fri, 06 Mar 2026 19:08:49 +0000
X-Authority-Analysis: v=2.4 cv=cJDgskeN c=1 sm=1 tr=0 ts=69ab2647
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=0yR4CDxtN3si-e87978A:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H9EbkxOhimqfk3l0qwEGtPXK1UaquMIBZmS0s0qP6OI=; b=my6AsidB7LeVirLGay0lpPNp2o
	znIOXq53VwKjX4WiX9lbvWHiXRIvPhwh+kCmFh776QSqapB+/lxWyMTUotyobpqJ6FxCM4x01azfb
	ci1lFQfFhgrM0c4o8QttFoRRg05Xme1HmTmacHtz1Qw6TmIGFXP5fo8Sscqx3+KIh4EJpzVTn+7nF
	0McGYwFiNcSH+KPh+bCsXcUW9PBogQNug1JWioHcIPuuEitgv0X68Hy+HPy8rZzo3OJYtjuodU/2d
	6sX0WV5R211/9P1RyhYivG1OoP4T+LEV1OzmoTp2T3LswLDJsiDkMjwe5reIkD1+dnim5A7IJgYkI
	HoJVMD5Q==;
Received: from [177.238.16.13] (port=37112 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyaXX-00000001137-1zAG;
	Fri, 06 Mar 2026 13:08:48 -0600
Message-ID: <9555e8df-5455-418a-b93f-2693aa19b849@embeddedor.com>
Date: Fri, 6 Mar 2026 13:08:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk-lpc18xx-ccu: kzalloc + kcalloc to kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/LPC18XX ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260306032540.47815-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260306032540.47815-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyaXX-00000001137-1zAG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:37112
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKftRAxrnK88dfzkXd7m7VFnauUWAi+8WXd9WYDNEyFEuzKukCFdlQPRSh2eE37/eZ0UVBaINkRXAlrnPmcZAjOiDO5i/Haf6vlLsLXk9eP+Xr4uAzvw
 d/ZRhTdwQQTWl/OxRwLPHpL6NlsfolaKqfSQoVpMWRbbjJ53p/7xNfaNQWbgVS5mD/Ue0WYQ+V3QF1+fBAnJXq99zbRnwAWo6fXgcDNSXF+kwRxYkxw17kvE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_110859_035219_F3C77BF5 
X-CRM114-Status: GOOD (  10.54  )
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



On 3/6/26 12:25, Rosen Penev wrote:
> Simplifies allocation by using a flexible array member.
> 
> Also allows using __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
> index dcb6d0c0b41a..3793e701835f 100644
> --- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
> +++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
> @@ -27,8 +27,8 @@
>   #define CCU_BRANCH_HAVE_DIV2	BIT(1)
>   
>   struct lpc18xx_branch_clk_data {
> -	const char **name;
>   	int num;
> +	const char *name[] __counted_by(num);
>   };
>   
>   struct lpc18xx_clk_branch {
> @@ -266,6 +266,7 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
>   {
>   	struct lpc18xx_branch_clk_data *clk_data;
>   	void __iomem *reg_base;
> +	size_t size;
>   	int i, ret;
>   
>   	reg_base = of_iomap(np, 0);
> @@ -274,19 +275,14 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
>   		return;
>   	}
>   
> -	clk_data = kzalloc_obj(*clk_data);
> +	size = of_property_count_strings(np, "clock-names");
> +	clk_data = kzalloc_flex(*clk_data, name, size);
>   	if (!clk_data) {
>   		iounmap(reg_base);
>   		return;
>   	}
>   
> -	clk_data->num = of_property_count_strings(np, "clock-names");
> -	clk_data->name = kcalloc(clk_data->num, sizeof(char *), GFP_KERNEL);
> -	if (!clk_data->name) {
> -		iounmap(reg_base);
> -		kfree(clk_data);
> -		return;
> -	}
> +	clk_data->num = size;
>   
>   	for (i = 0; i < clk_data->num; i++) {
>   		ret = of_property_read_string_index(np, "clock-names", i,


