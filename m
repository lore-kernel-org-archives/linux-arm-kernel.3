Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3332FE6749B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KePd0afxNWtYr8KKYmPbFUVg6cS1GIlQLYN1F9TuuoY=; b=U0xvFJIPd0bY4rew467zOVXNbR
	/UyKSi3aiSn9ru4bvbjkQQ6ausJ4ECMuFcyM6NbRYPkyN1XiQ8vPtCDv2hOysTM92oRF9eNzL9VSp
	s2xSVSB6zB5G33zf9jqIFo5Koa2UAXE9ibLxw5VYUVQfhLH+W+vMQcSRp89rsrI4FPmixbz0lYGiB
	8NOmZvjhSPVgjvZoJ4uuN8ar65mqbwE86+EYdi2sp8N+mh7jovovuX7Ijfb+m22qiJoseBn/cIzZq
	ow7xmjfdOyHOXwyMASJ5R2KA40NWmEEUYjMfTj2d0OUJmapcLl/SgXRyA2WD0oph6bPzLysfKON/V
	1vkOg87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOi-0000000DgTl-3QKs;
	Mon, 22 Dec 2025 11:48:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOf-0000000DgSN-2hlC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:48:19 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dZbwg6PmSzHnH6C;
	Mon, 22 Dec 2025 19:47:31 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id D209D40539;
	Mon, 22 Dec 2025 19:48:06 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 22 Dec
 2025 11:48:05 +0000
Date: Mon, 22 Dec 2025 11:48:04 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, <rohit.mathew@arm.com>, <reinette.chatre@intel.com>,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/38] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
Message-ID: <20251222114804.00005231@huawei.com>
In-Reply-To: <4495db3f-cfb8-4571-b83a-10a24f7b73a9@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-8-james.morse@arm.com>
	<20251218113014.00002691@huawei.com>
	<4495db3f-cfb8-4571-b83a-10a24f7b73a9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034817_979860_C311B360 
X-CRM114-Status: GOOD (  18.08  )
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


> >> +static struct mpam_resctrl_dom *
> >> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
> >> +{
> >> +	struct mpam_resctrl_dom *dom;
> >> +	struct rdt_ctrl_domain *ctrl_d;
> >> +
> >> +	lockdep_assert_cpus_held();
> >> +
> >> +	list_for_each_entry_rcu(ctrl_d, &res->resctrl_res.ctrl_domains,
> >> +				hdr.list) {
> >> +		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
> >> +				   resctrl_ctrl_dom);  
> > 
> > I'm lazy so haven't checked for more code here in later patches, but
> > if not, why not iterate the list to access the domain directly rather
> > than jumping through the rdt_ctrl_domain?
> > 
> > Something along lines of:
> > 	
> > 	list_for_each_entry_rcu(dom, &res->resctrl_res.ctrl_domains,
> > 				resctrl_ctrl_dom.hdr.list) {
> > 	}
> >  
> 
> Unless I've misunderstood I don't think this works because it's not what
> the fs/resctrl code expects.

I think I explained this one badly.

This should be functionally identical to the above so no visible side
effects outside of this code.  All this change is meant to do is wrap the
container_of() in the list iterator. When using the _entry_ variants
it is wrapping container_of() anyway so just going one level further
up the hierarchy of nested structures.

struct a {
	struct b {
		struct list_head l;
	}
}

It's actually a list of struct a as all elements on this list are
struct b instances within struct a, but you are treating it as a list
of struct b and then using a container_of() to get to struct a on
each one.

The change is treat it as a list of struct a with the list_head happening
to be wrapped in struct b.  Results in slightly simpler code and makes
the point these are always struct a instances.

Jonathan



> 
> 
> >> +
> >> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
> >> +			return dom;
> >> +	}
> >> +
> >> +	return NULL;
> >> +}
> >> +



