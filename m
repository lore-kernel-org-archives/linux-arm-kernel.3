Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF16F33A7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5ZYbSJ+p2unF9EAiOIGwxbe+GlQAstMLFmMbExwuc8=; b=dsWzy77UX7+cqt0vWZKDyVWQTP
	COdnnLDv8fNl1wXwLqW9e0GfdX6dUI1fuUnkB7R9rpF8uMIl37nTtOW5+EyjIhAYZNOpFYrR/v91N
	4iked2TBmKK54Xavhmtl9n9FZBmzxuIk7549kz7ejMaTmH0iLTXMQQ8UafORpwu1QcZGXjNDP+3VR
	18wK4fQdxgMkOeHNHAB23+bQDzX3ZrIYDACf0poRj+kcH+WxqX7fZS/j+0f2yrcg3Wo/VEK5/38xs
	nB718BKaS2Z0dSGISdUk1J+EqckuDiHybw7qKgDhMb3lpfNiAi6D0YT9LZo6608ll/tpj3O0/kaN/
	5YZ9t+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA5i-000000024Wz-28oL;
	Thu, 05 Mar 2026 14:54:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA5e-000000024WX-3hnb;
	Thu, 05 Mar 2026 14:54:17 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fRXb85pd4zHnGkd;
	Thu,  5 Mar 2026 22:53:08 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id A5CEC4056B;
	Thu,  5 Mar 2026 22:54:06 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 14:54:04 +0000
Date: Thu, 5 Mar 2026 14:54:03 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: fengchengwen <fengchengwen@huawei.com>
CC: Huacai Chen <chenhuacai@kernel.org>, <linux-pci@vger.kernel.org>,
	<bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "Paul Walmsley"
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
Subject: Re: [PATCH v2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260305145403.0000394e@huawei.com>
In-Reply-To: <795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
	<20260305083650.54611-1-fengchengwen@huawei.com>
	<CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
	<795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_065415_101424_5AEBA04A 
X-CRM114-Status: UNSURE (   8.35  )
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


> >> +       ret = acpi_get_cpu_acpi_id(cpu);  
> > Can we use get_acpi_id_for_cpu() directly? Then just x86 needs a wrapper.  
> 
> Yes, it indeed simple.
> 
> But I prefer to have the acpi_ prefix for such API names because it's a cross-subsystem API reference.

Can we just do a global rename of get_acpi_id_for_cpu() as a precursor
patch?  Then this just becomes adding x86 implementation and using
it on all architectures.

J



