Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFTHvbHF;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=j+8jP0t3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zdiuVcrqXSCDP0HxvY49AL+onTI13fHzCVdhY2/D93w=; b=uFTHvbHF8uiYC3
	WGLV7vVfHoozU6AZzMHCnCu+u205+9b87Vys/NsmeuXj9FLRUfgli5ZzSzbTvMiKkNiww0Eayf2x3
	GNc+z7bo4QXq1O3/+agjJNNB/SGnUyqXlQqkMwh3br2WgrKx+eNZMwQ94qSTHzMwrpkhxOr1jLZZo
	i/6wxemxPEj7+7Kzf3GG2C7XplpPg966vmwzJW1MgfWiJW4Ri4NQA+Eu90Er1zLmLGuSh71sM6rBV
	DOVkcI4UXJ2fYj9fFVusaoHfDzyXDmNo+gvC5ELdQrq4Dh3UtcNlJCkW/KPZIvzUuYMouXlVidg/B
	ujOGC6A/iMQmXWSCMnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHIz-0000000BxVz-3Bu0;
	Fri, 06 Nov 2026 10:36:23 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHIo-0000000BxRF-3g0S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:36:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zdiuVcrqXSCDP0HxvY49AL+onTI13fHzCVdhY2/D93w=;
	b=j+8jP0t38yPoKZ3rHG/+O5xTmerw3/KNXeVSTgSVzHHPrxh0MWE1JX//C58bEdjJB+4X83pL+
	l5I1LHMJE2ZS202tfaKPcP5cOsxK88iotFDrJG+IjX6VS1DprsCNiQNWN21cQ3Ssbz0D8YMGqVD
	dpxxDOKtE/7splKn8XQRRc0=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jLbDn4QNMz1cypH;
	Fri,  6 Nov 2026 18:35:53 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 0748140565;
	Fri,  6 Nov 2026 18:36:06 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 6 Nov 2026 18:36:04 +0800
Message-ID: <afcbf19b-bd13-4afc-ab56-8bc50c793e50@huawei.com>
Date: Fri, 6 Nov 2026 18:36:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/15] KVM: arm64: Reserve dirty ring space for the
 HDBSS buffer
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
 <20260929103655.85107-12-zhengtian10@huawei.com> <auikG0clmr19sAjh@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auikG0clmr19sAjh@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023611_263363_D8132627 
X-CRM114-Status: GOOD (  20.92  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/2026 10:54 PM, Leonardo Bras wrote:
> On Tue, Sep 29, 2026 at 06:36:51PM +0800, Tian Zheng wrote:
>> The dirty ring reserves room for CPU-side dirty buffers via
>> kvm_cpu_dirty_log_size(). Report the HDBSS buffer entry count
>> through it, so a full buffer flush always fits in the ring.
>>
>> Pin the HDBSS buffer size to PAGE_SIZE when dirty-ring is enabled,
>> via kvm_arch_dirty_ring_size_updated(): a larger buffer only
>> shrinks the soft_limit and forces more frequent userspace drains.
>>
>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>> ---
>>   arch/arm64/kvm/arm.c | 8 ++++++++
>>   arch/arm64/kvm/mmu.c | 8 ++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 9d7bdece149a..5a7046acb62e 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -215,6 +215,14 @@ static int kvm_arm_default_max_vcpus(void)
>>   	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
>>   }
>>
>> +void kvm_arch_dirty_ring_size_updated(struct kvm *kvm)
>> +{
>> +	if (!system_supports_hdbss())
>> +		return;
>> +
>> +	kvm->arch.hdbss_buffer_size = KVM_ARM_HDBSS_DEFAULT_SIZE;
>> +}
>> +
> 
> On the same subject as a previous patch:
> I don't think this is the best approach, on top of adding a new weak
> function to take care.
> 
> Maybe during the dirty-ring allocation, on vcpu creation, we could take
> into account the requested dirty-ring size, and just allocate the HDBSS
> buffer taking that into account. That would make it simpler, don't you
> agree?
> 
> Thanks!
> Leo

Hi Leo,

The "set once" guard we're discussing comes from the patch that adds the
ioctl, and it isn't really needed. We discussed this earlier [1]: we can
just initialize hdbss_buffer_size to PAGE_SIZE at VM creation and let
the ring reservation use it directly. **That also means
kvm_arch_dirty_ring_size_updated() can be removed.** Thanks for your 
suggestion.

As for why PAGE_SIZE is the right value in ring mode: the HDBSS buffer
is flushed on every VM exit, so a larger buffer doesn't reduce the flush
frequency. It only inflates the ring reservation (64 + size/
sizeof(u64)), which shrinks the soft_limit and forces more frequent
exits to userspace for the ring to be drained. Draining the dirty ring
from QEMU is more expensive than draining the HDBSS buffer from the
kernel, so the smallest buffer gives the best performance. In this mode,
a larger buffer provides no benefit to users.

In my tests, I also saw performance degrade when more space is reserved.

[1] 
https://lore.kernel.org/all/5a096cca-713a-4449-83dc-c763dc06c085@huawei.com/

Thanks,
Tian

