Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39163FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n42meaqGDUGzjj9bzqWNF89weGMYcF1c/cak04I5XA=; b=fxK2jY837Rr81x1bqwoF2BhoY7
	Gbb3kO/i8v0ctmqIdEysKysbRheHk4Wy27siMr0mK8vmrLBDimwpZBiZwI7H5tVZQ9aOYu4YN0/ls
	Zhg5dUH1+coIhjqL5r4Pj/vjpc5NsniUMHDBU5uokJJzHXWjXaXkx0EoFdyj90/V/inleuBH4Qgbm
	574kwhEf2zmZPHJFU2v/qmR/daVoWM1CPBf08OUJuopBgZDPoAUcvKIKy+6ctuFPygbxYAJT30kpn
	1rqYiBnGHAGimfeXxjvF1QkRZD8BiV5PF0YfyxCiyGFYXuy6kXluNZ5PbMqRgp8KyzLEIvkXnWqh3
	QPN8tO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyajr-00000004OSR-0GTS;
	Fri, 06 Mar 2026 19:21:31 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyajo-00000004ORr-16bl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:21:29 +0000
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id yXN2v2X5wCxrGyajmvx9mK; Fri, 06 Mar 2026 19:21:26 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yajIvKEEeOs9RyajJvLaL4; Fri, 06 Mar 2026 19:20:57 +0000
X-Authority-Analysis: v=2.4 cv=HPPDFptv c=1 sm=1 tr=0 ts=69ab2936
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=EcUihO1BCf_UJVK-1IMA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0n42meaqGDUGzjj9bzqWNF89weGMYcF1c/cak04I5XA=; b=O9y9+73+ouMsaM0xhKXiJLvW2a
	Ywu4XqNxZDNA1lNVURcPwpGMvAnMU7PlOFI9ARxlq1vzbhxgwjvRjBAFzEGF7BIbj/G0ADu2tgwij
	9OWq5wtMF2uaEedEWgX0RivJ03Fw3lUwSIE6/s9jLLPIYYduNkyeHHCPnGH883u2sxfkPAqLV4g4T
	jZp0qeP4m8iTd+1/5kRv3QoZXgu6+Q/fifr1woOnsqC2jPjGJlRmKZiRvjhi+jVZO5ZDI6NXIif5K
	5qWQJVoEN5uB5MOb5wyZ65bg0DqTe0q6rhCA6aTIhk6PBhNhw9ajWpW+owBAT0rQ+YWIMkbMwZimX
	no7nUOPw==;
Received: from [177.238.16.13] (port=34680 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyajI-00000001Gcm-09F6;
	Fri, 06 Mar 2026 13:20:56 -0600
Message-ID: <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
Date: Fri, 6 Mar 2026 13:20:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
To: Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304232014.164408-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260304232014.164408-1-rosenp@gmail.com>
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
X-Exim-ID: 1vyajI-00000001Gcm-09F6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:34680
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 25
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNZzdMIlucAz5QYJ+H6jKXLT7lJozyJCoA4NCVw1O6JDRewR5WxouipRcB67KFhEfsmRYbGSqO829YxVAORNQo7S384HIOlsamlp3/HpOFmy2k1ndyRO
 ks+DdW2jptQPdu11S+08N2kJypKNpHxgGSxD/FKsI2Zby63HWPMQZ7gyii0qROqtfZF+BggsGafrcsnj8h6jM6MAazXTl5isjmSaNJPAsuXGU5qfjgRH1xNm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112128_375695_ADEB6B57 
X-CRM114-Status: GOOD (  12.30  )
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



On 3/5/26 08:20, Rosen Penev wrote:
> Simplifies allocation from kzalloc + kcaloc to one allocation.
> 
> Allows extra runtime analysis with __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/soc/mediatek/mtk-dvfsrc.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
> index 548a28f50242..48b1fcf3e101 100644
> --- a/drivers/soc/mediatek/mtk-dvfsrc.c
> +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> @@ -71,8 +71,8 @@ struct dvfsrc_opp {
>   };
>   
>   struct dvfsrc_opp_desc {
> -	const struct dvfsrc_opp *opps;
>   	u32 num_opp;
> +	struct dvfsrc_opp opps[] __counted_by(num_opp);
>   };
>   
>   struct dvfsrc_soc_data;
> @@ -489,7 +489,6 @@ static u32 dvfsrc_get_opp_gear(struct mtk_dvfsrc *dvfsrc, u8 level)
>   
>   static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
>   {
> -	struct dvfsrc_opp *dvfsrc_opps;
>   	struct dvfsrc_opp_desc *desc;
>   	u32 num_opps, gear_info;
>   	u8 num_vcore, num_dram;
> @@ -520,24 +519,19 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
>   		 num_opps, num_vcore, num_dram, num_emi);
>   
>   	/* Allocate everything now as anything else after that cannot fail */
> -	desc = devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
> +	desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);

Mmhh... You should really consider building your code before submitting any patches.

-Gustavo

>   	if (!desc)
>   		return -ENOMEM;
>   
> -	dvfsrc_opps = devm_kcalloc(dvfsrc->dev, num_opps + 1,
> -				   sizeof(*dvfsrc_opps), GFP_KERNEL);
> -	if (!dvfsrc_opps)
> -		return -ENOMEM;
> +	desc->num_opp = num_opps + 1;
>   
>   	/* Read the OPP table gear indices */
>   	for (i = 0; i <= num_opps; i++) {
>   		gear_info = dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
> -		dvfsrc_opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
> -		dvfsrc_opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
> -		dvfsrc_opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
> +		desc->opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
> +		desc->opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
> +		desc->opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
>   	};
> -	desc->num_opp = num_opps + 1;
> -	desc->opps = dvfsrc_opps;
>   
>   	/* Assign to main structure now that everything is done! */
>   	dvfsrc->curr_opps = desc;


