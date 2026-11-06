Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPEf4EGq;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BqDcONYA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=chII47/1+ntpuddMK/yMlIxPkKF4NybCV4vRHvKCUco=; b=QPEf4EGq1HTCt1
	GSSxb/hLX6/4AQGiayRxr9uQPS3lyQumS9jePNW8POPghHP70b/HiNezBGyt8Ws3TP1R5iHeqJwwV
	65m/M3dSePCKJs5vXLd5B7AWXywbLkIZ/f8UXN6RBHM+/4ld+Ma7/Q3f8ZE8ZPwMi/mg8GMU6vGBW
	2Iryhnht5M+0ns1Fu00Bzc9BHUX9M7D3pUQSxRN5ICn56hhdyb8KzDJ0pFF9IHH8ZVJ8kz1RroJfB
	Tyq1AIGnLFqijYIVv9p8APcl1tcVZFr+7I4oyyzO184EfzA12zbg2/xTLIp34MIBE78a5Aq4Tabto
	URQJ7NiUzGP2tGlVLABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTH-0000000BzyK-0Cx2;
	Fri, 06 Nov 2026 10:46:59 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTB-0000000BzsR-2Bgx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:46:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=chII47/1+ntpuddMK/yMlIxPkKF4NybCV4vRHvKCUco=;
	b=BqDcONYAZxAgTfJDTYNrFs6jHSYv6zk/Vd9HVV9Gc4jpKk7bHF5wANGASsXqZVJsiqlHE7zfM
	jkl7XbQ6nTxZpuQ5UxUo8xnTgQeizL5KZOpQI5eiSVryAQzZMBifNqfgeIuUFacPt72iGoSAs/C
	4bcCsxjE+JkUlaZv6zym+x4=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jLbTQ6VTTz12Lc0;
	Fri,  6 Nov 2026 18:46:50 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id DC11D2011D;
	Fri,  6 Nov 2026 18:46:48 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 6 Nov 2026 18:46:47 +0800
Message-ID: <191ab0e3-9913-4927-9f84-c861c8f3bcd5@huawei.com>
Date: Fri, 6 Nov 2026 18:46:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/15] KVM: arm64: Derive the VM hardware dirty mode
 from dirty logging
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-13-zhengtian10@huawei.com> <auimPtktqZ1cwk3-@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auimPtktqZ1cwk3-@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024654_087091_F4FB71C1 
X-CRM114-Status: GOOD (  10.36  )
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



On 11/2/2026 11:03 PM, Leonardo Bras wrote:
> On Tue, Sep 29, 2026 at 06:36:52PM +0800, Tian Zheng wrote:
>> Both HAFDBS and HDBSS flip VTCR_EL2.HD at memslot-update time. Two
>> independent toggles allow an intermediate HDBSS-set/HD-clear state,
>> an illegal combination, and need locking against concurrent updates.
>>
>> Replace both with kvm_arch_update_hw_dirty_mode(), a pure function
>> of the static capabilities and the number of logging memslots:
>>
>>    - logging && HDBSS-capable  -> HD|HA|HDBSS
>>    - logging, no HDBSS         -> off
>>    - !logging && HAFDBS-cap.   -> HD|HA
> 
> This last one is gone now, so I guess most of this patch has to be
> reworked, right?
> 
> Thanks!
> Leo

Hi Leo,

Yes, the last one is no longer needed as we discussed earlier in [1], so
I'll rework this patch.

[1] https://lore.kernel.org/all/attMtUqxNsuPooix@LeoBrasDK/

Thanks,
Tian

