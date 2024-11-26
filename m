Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8008D65544
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHc9DsmrCpPDADsEIwfh6Cm9s8wv5NTaM5qoX4Z7qxA=; b=rgzP8JJokB88L0b/hZL7a1fBmg
	3lO/uCa6vqNbHO53XHMF23tJyzNClXGEcMRCNKxt/Q3iAbXtAH375+5YPV4DHz45fzkbKs2R14E5K
	PXEKPsHAzm04ouoLgxYj/vAr8MVB4RQcch/8+suvxZS4C9O53aZaGchaYh8aeSi2xg1XUHvOhuZ02
	7kODBhs2+158nviNCy6oAjUyxBSMajO0ATcEYMhgrpUAgnLXIv3Te1BVXZZqK1+M2U+dPoMigzazR
	x95k59a0wWrGtO+uKtD5Ir772JyLJwuGDKOSbgvezpJcTPaL1XA6OWF9OMLJe8QlWbCkmcgCSoSs7
	uvsI/h4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0Jw-0000000BQw1-0bwV;
	Tue, 26 Nov 2024 18:29:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0Iy-0000000BQpe-1Rxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:28:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E21C4175D;
	Tue, 26 Nov 2024 10:29:23 -0800 (PST)
Received: from [10.1.38.124] (e126864.cambridge.arm.com [10.1.38.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A1FB3F66E;
	Tue, 26 Nov 2024 10:28:51 -0800 (PST)
Message-ID: <100b6b71-22d4-4513-9f8f-849a11c0a809@arm.com>
Date: Tue, 26 Nov 2024 18:28:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] KVM: arm64: Rework specifying restricted
 features for protected VMs
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
 will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
 qperret@google.com
References: <20241122110622.3010118-1-tabba@google.com>
 <20241122110622.3010118-8-tabba@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <20241122110622.3010118-8-tabba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_102856_431989_33CA502B 
X-CRM114-Status: UNSURE (   9.13  )
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

Hi Fuad,

On 22/11/2024 11:06, Fuad Tabba wrote:
> The existing code didn't properly distinguish between signed and
> unsigned features, and was difficult to read and to maintain.
> Rework it using the same method used in other parts of KVM when
> handling vcpu features.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---


> +static const struct pvm_feature pvmid_aa64isar2[] = {
> +	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, _vcpu_has_ptrauth),
> +	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, _vcpu_has_ptrauth),
> +	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
> +	FEAT_END
> +};

Just wondering - did you intentionally hide the MOPS feature from protected
guests here? (It was exposed before)

I did notice that the HCRX trap setting is currently broken/missing in upstream
pKVM, which means MOPS instructions UNDEF in the guest. Is it related to that?

Thanks,
Kristina


