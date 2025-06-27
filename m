Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B94C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8turYrjCSXg4FbCo0vThIVPweI/6eUWlQbp/66+vk5g=; b=CE6fNkO6xMD+8azCS7YRZqsPkP
	gKKhmUORJ87fseMCWs9R87KSkZzopXFEdK4JoIIPokMSy5d3pwSSRchjk9BXs4huvKu0/WCEkfOzH
	rQva2dp3Gjfog41fwpTEnOzcHROYPxsyrUOsIBQPFbwzfyPK0KA3oA4sw1z+iHyA5gheYk2CePMlQ
	aGwAqcc4D5ge89lEXu/b9V3ZJs7SnvWPST3rV75wWhHhnTQPyXJMK2GSU3sNsEvOePQ+fOB4WpJ7O
	0eEgDZfe7iAcZBJF9uuZIFgiUBNZsbjSqnHZqWMIo2kLj4zKdsapWYZX2MDxMUrbhy6znQmafpQMG
	z3/Oid9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV52r-0000000E2D5-0SIk;
	Fri, 27 Jun 2025 09:06:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV50X-0000000E1ic-1sls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FDAA1A00;
	Fri, 27 Jun 2025 02:04:09 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7633F762;
	Fri, 27 Jun 2025 02:04:23 -0700 (PDT)
Message-ID: <603eb4c7-5570-438c-b747-cdcc67b09ea6@arm.com>
Date: Fri, 27 Jun 2025 10:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250626200459.1153955-1-coltonlewis@google.com>
 <20250626200459.1153955-3-coltonlewis@google.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250626200459.1153955-3-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020429_536742_F72E9414 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Colton,

On 6/26/25 21:04, Colton Lewis wrote:
> There's no reason Enums shouldn't be equivalent to UnsignedEnums and
> explicitly specify they are unsigned. This will avoid the annoyance I
> had with HPMN0.
An Enum can be annotated with the field's sign by updating it to 
UnsignedEnum or SignedEnum. This is explained in [1].

With this change ID_AA64PFR1_EL1.MTE_frac would be marked as unsigned 
when it should really be considered signed.

Enum	43:40	MTE_frac
	0b0000	ASYNC
	0b1111	NI
EndEnum


> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/tools/gen-sysreg.awk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index f2a1732cb1f6..fa21a632d9b7 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
>   	parse_bitdef(reg, field, $2)
>   
>   	define_field(reg, field, msb, lsb)
> +	define_field_sign(reg, field, "false")
>   
>   	next
>   }

Thanks,

Ben

[1] 
https://lore.kernel.org/all/20221207-arm64-sysreg-helpers-v4-1-25b6b3fb9d18@kernel.org/


