Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D00DC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cHIo81+4jXwVEo2TrM755naFSx7NjMdD+f4qpNkHU8=; b=dUIW+n9+RdTWQ+046yKIsIM8+V
	v+obqE6EYzJ+3LeWTYWrJyFgiijdmjcYtgnww9PVEdhBBqbTLJHSuputmDM3MFSRLDkLOknuDAfyL
	+MIkA5TWhyxZNd4IkpumRuDzLp+s7TMzszVGGwqPuBO+/ER9XM7+pT9WZgetVIBXVGJndEmBpojXK
	HoalGBz1kA8JA6l6//vc5Y0ekYoNzSy9ziWnlDuXsILkF35/Akre/AVl+Rpuu4Ibam+z3puaRaRg+
	RVsNRQQIKd9wVEktg44aePyQwblge3Sjlii8XIQZhSK7JV69Is1evtIR77cO5v6wiruFDhmTj38o+
	zXgDgLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ46Y-00000004oTC-0Vvr;
	Tue, 08 Jul 2025 08:55:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3oV-00000004ldR-3Cit
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:36:33 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbvWc5xZwz6GDJX;
	Tue,  8 Jul 2025 16:33:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DEF74140144;
	Tue,  8 Jul 2025 16:36:25 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 10:36:25 +0200
Date: Tue, 8 Jul 2025 09:36:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <mark.rutland@arm.com>, <robh@kernel.org>, <coresight@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH 3/5] coresight: cti: Use of_cpu_phandle_to_id for
 grabbing CPU id
Message-ID: <20250708093623.0000363e@huawei.com>
In-Reply-To: <20250707150414.620-4-alireza.sanaee@huawei.com>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
	<20250707150414.620-4-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013631_945382_79A11F57 
X-CRM114-Status: GOOD (  17.64  )
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

On Mon, 7 Jul 2025 16:04:12 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Use the newly created API to grab CPU id.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Here is the justification for allowing the node parameter to be null.

> ---
>  .../hwtracing/coresight/coresight-cti-platform.c  | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..cd821e926792 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -41,21 +41,12 @@
>   */
>  static int of_cti_get_cpu_at_node(const struct device_node *node)
>  {
> +	struct device_node *dn = NULL;
>  	int cpu;
> -	struct device_node *dn;
>  
> -	if (node == NULL)
> -		return -1;
> -
> -	dn = of_parse_phandle(node, "cpu", 0);
> -	/* CTI affinity defaults to no cpu */
> -	if (!dn)
> -		return -1;
> -	cpu = of_cpu_node_to_id(dn);
> +	cpu = of_cpu_phandle_to_id(node, &dn, 0);
>  	of_node_put(dn);

With change suggested on patch 1 this becomes

static int of_cti_get_cpu_at_node(const struct device_node *node)
{
	int cpu = of_cpu_phandle_to_id(node, NULL, 0);

	return (cpu < 0) ? -1 : cpu;
}

> -
> -	/* No Affinity  if no cpu nodes are found */
> -	return (cpu < 0) ? -1 : cpu;
> +	return cpu;

This an result in -ENODEV hence juggle above.  No idea
why the caller will care but I guess it does or this code
would not be here!

>  }
>  
>  #else


