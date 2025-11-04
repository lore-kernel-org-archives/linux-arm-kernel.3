Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B228CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nVBl5r6hmuhvvbq9MpULBbT9ItrCt4YCDr9efMVybE=; b=jsuMIFtpnN+r0+E9KPO6iGl9eD
	r73vjEMoWuyUgE8mrtyqPMl8GlDYB1BWwA208oavvE/MHhwQpfKunTvXHAhUDAJzZiiRjJrqMGY/9
	WpGXfuxvpvnLTV2++E6V/Y6/nhUaq5ZtkMFPKdOxzNcW+Jey+npXVxjdvZYxMYPvJ8/z3TGizYfdp
	4l6dmHPMtSMmsYjYQaLewWvgp3MaDgcdWo/KJFQME+lC2XaKyvjO8XEUavuW/HplvUOVKeL3+YKeC
	1OGZW+yI7/mdU7QgyeyUwAKfX/unr80N9h+DSlxHxV5w6fSa0ffPhr0O4hdmeC6DHYvYsYrDFiTb2
	m5SZNw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEzJ-0000000BhEE-1qv0;
	Tue, 04 Nov 2025 11:14:09 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEzG-0000000BhDf-2Qg6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 11:14:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4nVBl5r6hmuhvvbq9MpULBbT9ItrCt4YCDr9efMVybE=;
	b=zbnfA3RezbrDNkzJJdE7pwbmng3YMVGS6Q5geiHWXqZ1ZZAgTPrgHz4KoS+Dys7sTiIwETiE4
	xIrEQ0x0B8NQ7+PNoNfBrnvPUrZXWlbVO/DkP0cZTQW2CKnXduyoyVVCdXp3EIWWfK+cpUfA5UX
	KJyEIVb/fmy0+I0Se2WiMKU=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4d15Q4535HzLlTr;
	Tue,  4 Nov 2025 19:12:12 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 06F0C1A016C;
	Tue,  4 Nov 2025 19:13:47 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 19:13:46 +0800
Subject: Re: [PATCH 03/33] irqchip/apple-aic: Spit out ICH_MIDR_EL2 value on
 spurious vGIC MI
To: Marc Zyngier <maz@kernel.org>
CC: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvm@vger.kernel.org>, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Christoffer
 Dall <christoffer.dall@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20251103165517.2960148-1-maz@kernel.org>
 <20251103165517.2960148-4-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4dfdc1da-5b5f-26be-f318-4a30ab0db1cc@huawei.com>
Date: Tue, 4 Nov 2025 19:13:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20251103165517.2960148-4-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_031407_097906_A8C690A8 
X-CRM114-Status: UNSURE (   5.31  )
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

Subject: s/ICH_MIDR_EL2/ICH_MISR_EL2/

Thanks,
Zenghui

