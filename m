Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB87C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RbEOiIWtj30WRG7NAMuN6uYrlVHWhj9FUWYaxvqVoI=; b=WeriPUw0qlZCCp3mQqhW+ahTKo
	QB1eCwCBwYBfU9LQphj0ti1R94OUIx9DW3BPQ+m8JSQw9/9jj/gM/sA3e7tPcOY6krzyqVmqv40by
	WqEhSmwcjmIqsthAbnYhvUd4JbjjSrzp9B0MoTAcMp0B78wQ0buXwkCdtDNRJ0KnwKlqGR2Ys/Je/
	dEXQr5Y7NzQOYpNmT+BBy9SFg6SWiiVj8435O21dIwaFCqor5DU2/CNPXJ6QavFsjvw+uaGxU00tK
	cNjgIq9icwTN2VpCv6a6eANdM1Juhf9cUATC38yRhPVCcUB/w49WkY+QXzDshGxtwZgWAESfZQbMI
	pbNatbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tck2o-00000004oH4-2JYg;
	Tue, 28 Jan 2025 11:46:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tck1S-00000004oD2-2tP7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:44:52 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yj3LB4q6qz6L4tC;
	Tue, 28 Jan 2025 19:42:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 0982014051A;
	Tue, 28 Jan 2025 19:44:39 +0800 (CST)
Received: from localhost (10.48.150.41) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 28 Jan
 2025 12:44:38 +0100
Date: Tue, 28 Jan 2025 11:44:30 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH v1 1/1] base/of/cacheinfo: support l1 entry in dt
Message-ID: <20250128114430.00007ccc.alireza.sanaee@huawei.com>
In-Reply-To: <20250127121136.00007f14@huawei.com>
References: <20250124152008.313-1-alireza.sanaee@huawei.com>
	<20250124152008.313-2-alireza.sanaee@huawei.com>
	<20250127121136.00007f14@huawei.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.150.41]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_034451_023662_006A309A 
X-CRM114-Status: GOOD (  24.01  )
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

On Mon, 27 Jan 2025 12:11:36 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Fri, 24 Jan 2025 15:20:08 +0000
> Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
> 
> > This commit simply assumes that CPU node entries may point to a
> > cache node that basically act as a l1-cache and there are some CPU
> > nodes without describing any caches but a next-level-cache property
> > that points to l1-cache.
> > 
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  drivers/base/cacheinfo.c | 54
> > +++++++++++++++++++++++++++------------- 1 file changed, 37
> > insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index cf0d455209d7..d119228fc392 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -83,7 +83,31 @@ bool last_level_cache_is_shared(unsigned int
> > cpu_x, unsigned int cpu_y) 
> >  #ifdef CONFIG_OF
> >  
> > -static bool of_check_cache_nodes(struct device_node *np);
> > +static bool of_check_cache_node(struct device_node *np) {
> > +	if (of_property_present(np, "cache-size")   ||
> > +	    of_property_present(np, "i-cache-size") ||
> > +	    of_property_present(np, "d-cache-size") ||
> > +	    of_property_present(np, "cache-unified"))
> > +		return true;
> > +	return false;
> > +}
> > +
> > +static bool of_check_cache_nodes(struct device_node *np)
> > +{
> > +	if (of_property_present(np, "cache-size")   ||
> > +	    of_property_present(np, "i-cache-size") ||
> > +	    of_property_present(np, "d-cache-size") ||
> > +	    of_property_present(np, "cache-unified"))
> > +		return true;  
> 
> 	if (of_check_cache_node(np))
> 		return true;
Hi Jonathan,

Thanks for the feedback, I'll replace this.
> > +
> > +	struct device_node *next __free(device_node) =
> > of_find_next_cache_node(np);
> > +	if (next) {  
> 
> Hmm. Was like this before, but general kernel style is no brackets
> for single statement if block.

Makes sense, will change this too on the next version.

Thanks,
Alireza
> 
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  
> >  /* OF properties to query for a given cache type */
> >  struct cache_type_info {
> > @@ -218,11 +242,23 @@ static int cache_setup_of_node(unsigned int
> > cpu) while (index < cache_leaves(cpu)) {
> >  		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
> >  		if (this_leaf->level != 1) {
> > +			/* Always go one level down for level > 1
> > */ struct device_node *prev __free(device_node) = np;
> >  			np = of_find_next_cache_node(np);
> >  			if (!np)
> >  				break;
> > +		} else {
> > +			/* For level 1, check compatibility */
> > +			if (!of_device_is_compatible(np, "cache")
> > &&
> > +			    !of_check_cache_node(np)) {
> > +				struct device_node *prev
> > __free(device_node) = np;
> > +				np = of_find_next_cache_node(np);
> > +				if (!np)
> > +					break;
> > +				continue; /* Skip to next index
> > without processing */
> > +			}
> >  		}
> > +
> >  		cache_of_set_props(this_leaf, np);
> >  		this_leaf->fw_token = np;
> >  		index++;
> > @@ -234,22 +270,6 @@ static int cache_setup_of_node(unsigned int
> > cpu) return 0;
> >  }
> >  
> > -static bool of_check_cache_nodes(struct device_node *np)
> > -{
> > -	if (of_property_present(np, "cache-size")   ||
> > -	    of_property_present(np, "i-cache-size") ||
> > -	    of_property_present(np, "d-cache-size") ||
> > -	    of_property_present(np, "cache-unified"))
> > -		return true;
> > -
> > -	struct device_node *next __free(device_node) =
> > of_find_next_cache_node(np);
> > -	if (next) {
> > -		return true;
> > -	}
> > -
> > -	return false;
> > -}
> > -
> >  static int of_count_cache_leaves(struct device_node *np)
> >  {
> >  	unsigned int leaves = 0;  
> 


