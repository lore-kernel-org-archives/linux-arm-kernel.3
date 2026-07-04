Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:From:CC:To:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34vNWbXe9tXff0tvnC0WcH98XXWhqm99ucJyEx2XldY=; b=k06hHZZ3YpQNTQyUdTWtZP0itJ
	/h+o4SiZbRKHLYcFN0pCUPnJ6OueQFcBmGE599AmN9sRhDV3KKKV8SgKewvNUc1Ilo72FXfMxhRR4
	TtVnBhb594C7w7m2MAAdWZWjE7amI9Cd6xEFg2ITeVpQDOacZGdnbzKHSh2s+t7vF+/xsuhud4/An
	3ptcLlTqWdvnZoLaj2E1dVSdxr9MVr+6HPKbHtjpmOlz6Az0R+lvdPJbsbeCePRibgdSG43HOSZxa
	mlVJl/DM3usao5oZ6pPUuBewiBgVnFHaNyZKhTvgR7c3lGIFag8+oY0AER4/ZPHdTrAiNWmzjekOd
	wPZykesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfv54-00000008Gng-3BOR;
	Sat, 04 Jul 2026 07:46:30 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfv51-00000008GnL-1W12
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 07:46:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=34vNWbXe9tXff0tvnC0WcH98XXWhqm99ucJyEx2XldY=;
	b=3lUxwxsODXylrwAAueb3Y3T+dtOigJ1WSNjGIlJ5lmfqowv7O6vWcBeZTjB8k6eK8FxQ4VZ67
	Ts2cepUHIT+r5Kk+WUNOP6VuJcOpgNS9M10jxIHlEsVgXsflpQqJyWQ3zhwCkKmkg+N4HjMyhAz
	FCfGcho3JiDDhzohIU0sXxA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gsjB62BhTzRhTy;
	Sat,  4 Jul 2026 15:37:02 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 86E4740594;
	Sat,  4 Jul 2026 15:46:12 +0800 (CST)
Received: from kwepemq500001.china.huawei.com (7.202.195.224) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 4 Jul 2026 15:46:12 +0800
Received: from [10.67.146.137] (10.67.146.137) by
 kwepemq500001.china.huawei.com (7.202.195.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 4 Jul 2026 15:46:11 +0800
To: Marc Zyngier <maz@kernel.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: "guoyang (C)" <guoyang2@huawei.com>, "huanglingyan (A)"
	<huanglingyan2@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>
From: Tangnianyao <tangnianyao@huawei.com>
Subject: Question about the "TLBs and I-cache are private to each vCPU"
 guarantee with VTTBR_EL2.CnP
Message-ID: <e85b957d-c8bc-aac0-b413-03441d05c3df@huawei.com>
Date: Sat, 4 Jul 2026 15:45:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.67.146.137]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500001.china.huawei.com (7.202.195.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_004627_897637_1AB826C7 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi, all

I'm trying to understand the TLB and I-cache invalidation in
`kvm_arch_vcpu_load()` that is intended to "guarantee that both TLBs and
I-cache are private to each vCPU".

As I understand it, when `VTTBR_EL2.CnP == 1`, `__kvm_flush_cpu_context()`
only performs a local TLB and I-cache invalidation, which does not seem
sufficient to guarantee that property.

In fact, even if the invalidation were extended to the Inner Shareable
domain, it still seems difficult to guarantee “TLBs and I-cache are
private to each vCPU”, when `VTTBR_EL2.CnP == 1`, as long as multiple
vCPUs from the same VM may be running concurrently on different PEs.

So I have two questions:

1. What is the rationale behind the comment that "guarantee that both TLBs
and I-cache are private to each vCPU"?
2. Should the effect of `VTTBR_EL2.CnP` be taken into account when
reasoning about this guarantee?

Thanks
Nianyao Tang


