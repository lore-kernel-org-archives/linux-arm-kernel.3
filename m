Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC7F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63G8v1SmaEgTYdfJTyL6ai9ialxWPrLA+2LQvndcIO8=; b=fDXbnjNQd8DSa2PSOF18A2kijb
	ttSVd27PRGbjeSdulXXoah/9X8DyO6zQfAfthxCb5NwJG7W5XF+3jcFBilt0w6dbqzp7k20wdYSp9
	BCSrpcWhm9cQ9GhadusdFrt1nShg1ktjAvH8B8KEizr3w84P0Ye3e1FSVURzOdfTvzBYN2wEm22Ks
	szQe5+9Y4oswjaDwmADHGVOcBOcMDQc4ACTF336XniILxH/8HdjxDAsyryhe8laqsb3TN9BYtJnBh
	fz2pPPyz4nMiKsbBeAH5Yp6L0WBQHCNPav+Hi+0Zaz3i9LN0pwL6dRwtO9CbHHIQuRcHgVXn6bOQN
	EtlldIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKo6-00000002sml-1IfV;
	Fri, 06 Mar 2026 02:20:50 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKo4-00000002sln-0y77;
	Fri, 06 Mar 2026 02:20:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=63G8v1SmaEgTYdfJTyL6ai9ialxWPrLA+2LQvndcIO8=;
	b=mwQ0hElsHFrGBY+A3e2KK7IjK1rv0TAkhpGRCNBsH64nmtcpuKi+oWynKmiaLosb7CItekbvd
	7Ur566TDm1xinylYA/X8Q+XD14TchvZjfjiy4Cw81UnxzrRRUjK7AmWvdX6Y/jbCiVwouEIKPd8
	GTSznfAxZkaV5F0QVZ6bA9E=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fRqkq3J7bz1prLV;
	Fri,  6 Mar 2026 10:15:47 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id DF7C52022B;
	Fri,  6 Mar 2026 10:20:41 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Mar 2026 10:20:40 +0800
Message-ID: <e33affb0-e8f8-48fc-b344-90fea722d30b@huawei.com>
Date: Fri, 6 Mar 2026 10:20:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: Huacai Chen <chenhuacai@kernel.org>, <linux-pci@vger.kernel.org>,
	<bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Andy Gospodarek
	<andrew.gospodarek@broadcom.com>, Eric Van Tassell <Eric.VanTassell@amd.com>,
	Ajit Khaparde <ajit.khaparde@broadcom.com>, Somnath Kotur
	<somnath.kotur@broadcom.com>, <linux-acpi@vger.kernel.org>,
	<wei.huang2@amd.com>, <wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <stable@vger.kernel.org>, <jeremy.linton@arm.com>,
	<sunilvl@ventanamicro.com>, <sunilvl@oss.qualcomm.com>,
	<chenhuacai@loongson.cn>, <wangliupu@loongson.cn>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260305083650.54611-1-fengchengwen@huawei.com>
 <CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
 <795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
 <20260305145403.0000394e@huawei.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260305145403.0000394e@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_182048_426777_6BEAC296 
X-CRM114-Status: UNSURE (   8.67  )
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

On 3/5/2026 10:54 PM, Jonathan Cameron wrote:
> 
>>>> +       ret = acpi_get_cpu_acpi_id(cpu);  
>>> Can we use get_acpi_id_for_cpu() directly? Then just x86 needs a wrapper.  
>>
>> Yes, it indeed simple.
>>
>> But I prefer to have the acpi_ prefix for such API names because it's a cross-subsystem API reference.
> 
> Can we just do a global rename of get_acpi_id_for_cpu() as a precursor
> patch?  Then this just becomes adding x86 implementation and using
> it on all architectures.

Sounds good, done in v3

Thanks

> 
> J
> 
> 


