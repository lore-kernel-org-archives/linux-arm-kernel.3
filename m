Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4BF36C3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+PMqunPheDpnRHh36jfJVHwdYNvIo5Niy8z8RvHgeE=; b=eE4QvyCTTb0Acs
	WcL+4NmQ6IyiFS8wS0pWCqonKTk3JoeKEOvRzWv/8wjhEH6KUTauMuYCLOzsorEHQz9xOELLePazH
	pTpG1GI+jqbhCfjOrXPZkqcrVuJHMm61ZWKlMvSDRi1rQxN1QI5lH+btynRWmLn0UDGyf+Hoehoxr
	7R7YzBMc4tiV8oQEyk/j+ETYLo2L08rNwLDAsiUB6Dg0sRzBLWqPA8DHnFBROqLIJqIwnARXtfZOh
	8Up/IY2V/FP85hdj7jQcEBroASyPuO3R1nmBJ9CQL3A++UA399IihkQ5QTiXsQicSY94FJKWpcDxd
	SrfuukwHu08Jmd0os9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEj6q-00000006YU8-0589;
	Mon, 20 Apr 2026 07:31:56 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEj6m-00000006YTi-3J1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 07:31:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=y+PMqunPheDpnRHh36jfJVHwdYNvIo5Niy8z8RvHgeE=;
	b=biewVbRAcMstjpwy1CEjpijWGXQFptFPfmDBigtWMGmwcO2LBUBaw7GRKOaSQIV1ipmSa22up
	pQ9SQVpDIZQOJq6eVss27qdgbk62Ji/rJE0elgzWVoq8OolGD4hWhI93O69M20IXGhUvxCuOjYD
	ha6Aq9M6oyCtcQpkWEEtiqI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fzcT63vdXzLlVp;
	Mon, 20 Apr 2026 15:25:14 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 233E940539;
	Mon, 20 Apr 2026 15:31:35 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 20 Apr 2026 15:31:33 +0800
Message-ID: <1d9cee5a-38be-7115-51ef-b7109aa4ab5e@huawei.com>
Date: Mon, 20 Apr 2026 15:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
From: Zeng Heng <zengheng4@huawei.com>
To: <tan.shaopeng@jp.fujitsu.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
Content-Language: en-US
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_003153_437298_49A53E93 
X-CRM114-Status: UNSURE (   5.87  )
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
Reply-To: TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Shaopeng,

> Hello Zeng Heng,
> 
> Could you tell me which branch this patch series based on?
> 
> Best regards,
> Shaopent TAN


As indicated in the patch series tags, this patch set applies to the
linux-next repository, specifically the master branch at:
https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git

Keep me in the mail list for follow-up responses if you want my feedback
in time. I was accidentally dropped from the mail list in a previous
thread (see 
https://lore.kernel.org/all/TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com/).


Kind regards,
Zeng Heng

