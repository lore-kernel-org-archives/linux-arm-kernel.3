Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE20BC2A096
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOj2SP/49DK6lbYbEUaIzSJandCE20kY43SgwoSM9S0=; b=DPN8vgbcP4nGsJ+UoeQ9GBizp0
	DVp6i0RTbVOiJ5nJ98NDoFOYaZIy0r+YRKqVtqGu/rBWXQV/htGKC3ABvuimXtvgwKDyeHBC7hfnF
	Ho/M0T8FPMq3ukppt6uawM9YKpR5HnwL4S9Z/sS7q3BgrbBksqnaq+NLTt+njz1g/EI8zqMeDtRNg
	nOqrRPV0icXdIi5fPMu1UjCYEWRULAQyqpwsRFD8zDqQClL3kNRNGn6Tatil81hVV34OtwW5fPiJq
	fEMtfpgvhmKFQGIP26ZOcWnpIlKVVZlw+0syFSwufGjLdDBeQesKxjHSqWzIJ0IC/qBdA/SZcqNg9
	En3TnC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vci9Q-0000000B8kR-0T1R;
	Mon, 05 Jan 2026 10:49:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vci9M-0000000B8jo-1AQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:49:26 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9xm4b9BzJ46jX;
	Mon,  5 Jan 2026 18:48:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id DA0FF4057E;
	Mon,  5 Jan 2026 18:49:12 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:49:12 +0000
Date: Mon, 5 Jan 2026 10:49:10 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each
 OF child loop
Message-ID: <20260105104910.00006981@huawei.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_024924_464717_4DCE9EED 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri,  2 Jan 2026 13:50:32 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
You could throw a __free() in there for firewalls and avoid having
any cleanup at all to do on error (or good path for that matter).

Otherwise LGTM.

Jonathan

> ---
>  drivers/bus/stm32_firewall.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index 2fc9761dadec..fae881cea9a0 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>  int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>  {
>  	struct stm32_firewall *firewalls;
> -	struct device_node *child;
>  	struct device *parent;
>  	unsigned int i;
>  	int len;
> @@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>  
>  	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>  
> -	for_each_available_child_of_node(dev_of_node(parent), child) {
> +	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
>  		/* The access-controllers property is mandatory for firewall bus devices */
>  		len = of_count_phandle_with_args(child, "access-controllers",
>  						 "#access-controller-cells");
> -		if (len <= 0) {
> -			of_node_put(child);
> +		if (len <= 0)
>  			return -EINVAL;
> -		}
>  
>  		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> -		if (!firewalls) {
> -			of_node_put(child);
> +		if (!firewalls)
>  			return -ENOMEM;
> -		}
>  
>  		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
>  		if (err) {
>  			kfree(firewalls);
> -			of_node_put(child);
>  			return err;
>  		}
>  


