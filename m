Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28034606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1TnpVp1;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WrESf68H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QV64RGtqfAWvcrVEQ/J8fVuvfalRZ9xgiHmT8AuAPYU=; b=Z1TnpVp1UXk6Cn
	gIt82iBUvPGIiTGoH4XByP45CCX9ThrLpfXstZxBm3AiqzF5V4WVsxGxc02aKwwSO/ZaGru8uQtIO
	lGXlBqtZ2jWJ/qZ+Q8MuxBB4yoBPqddTfU9o4b6JD+ygX2dvftkpXu3PxVvUIDUMqCa0spp2Z0DDl
	/ozf0uSXR/A3+1PPWCJ0qYs1bOwUtGZCiPwwaVEaLolOrTvxdxdRPvJNlR9B9BkRz7P+SYf9SziBX
	uUbPKerWs6r8+MD/kdlApXG8NVXpUK3z0rmRxQlm9pdOgpEJwK9mEymoLtm7eO55NcDxMjeNU1pNH
	tAI96UraIWSctNBGFNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgq-0000000AsQr-0ubj;
	Fri, 30 Oct 2026 06:02:12 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgb-0000000AsE0-1CYX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:01:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QV64RGtqfAWvcrVEQ/J8fVuvfalRZ9xgiHmT8AuAPYU=;
	b=WrESf68Hs0YRccK+XTYqrJfLNsgVzD1tFRK4UfgJfK6v9eiCHydujqzBqR/Bwks32HSm99JSJ
	yvt1zNYgJBR5nwE/R2ciu1QBW/2WrpfgPrq3hPiw3I9XbIs1YCBbapoRe4nlDW26KEOxSrwn3Pt
	DdlrRNDetKULhgh6Sk4aBhw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jG9Tg2GvTz1cySS;
	Fri, 30 Oct 2026 14:01:43 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C4D840563;
	Fri, 30 Oct 2026 14:01:51 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 14:01:50 +0800
Message-ID: <b8f76a0a-8b1e-4167-81cc-b3a4ee79fb6b@huawei.com>
Date: Fri, 30 Oct 2026 14:01:49 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on
 migration
To: Leonardo Bras <leo.bras@arm.com>
CC: liuyonglong <liuyonglong@huawei.com>, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly
	<joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>
References: <aqneWnlsdpocLIl6@kernel.org> <aqqhDs3NyjtkZzXK@LeoBrasDK>
 <aqsl1_IqnV2r8kUL@kernel.org> <aqvt2gnlBZeNsaf4@LeoBrasDK>
 <as-mH36YSMxAosND@LeoBrasDK>
 <3e464bef-8dfe-44a3-afea-3c276ae87cd8@huawei.com>
 <attMtUqxNsuPooix@LeoBrasDK>
 <8eaaba87-7881-49c4-a76a-51dec2f29ffc@huawei.com>
 <auCPEQmnFwWldTaM@LeoBrasDK>
 <52945586-8c5c-4991-bd92-fe02aaf79fbe@huawei.com>
 <auM0CWJTPzYUTknh@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auM0CWJTPzYUTknh@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230157_823687_42B9AF0A 
X-CRM114-Status: GOOD (  17.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/29/2026 7:54 PM, Leonardo Bras wrote:
> On Thu, Oct 29, 2026 at 10:54:24AM +0800, Tian Zheng wrote:
>> Hi Leo,
>>
>> I've read your discussion with Oliver on DBM RFC v2. As a suggestion,
>> maybe we should go with Oliver's approach, i.e. revert to the v1 scheme
>> and continue fixing from there.
> 
> Hi Tian,
> I have been reading a bit more about permission indirection to try figuring
> out a way that the change may work for both ways.
> 
> The problem with the previous approach is that it assume DBM=write at all
> times, which is not architecturally correct. Having DBM=write only on
> HAFDBS=on as suggested would require us to transverse the whole pagetable
> to convert encodings when we enable/disable it, which can be quite
> expensive.
> 
> One option would be to always enable HAFDBS when system supports HDBSS, but
> I still have to figure out if that causes any performance regression before
> suggesting.
> 
> The option I am pursuing is thinking on an unified code path for direct
> permissison (both HACDBS=on and HACDBS=off) so we don't have to convert
> between them, neither worry about the impact of HAFDBS=on on performance.
> 
> I will reply on the thread once I figure one of those options out.
> 
> Thanks!
> Leo

Hi Leo,

Sounds good. I'll wait for your next version and review it once it's
posted.

Thanks,
Tian

