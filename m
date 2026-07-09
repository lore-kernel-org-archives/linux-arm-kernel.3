Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02051C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PzslN++gvwF111Oxj75aJ3QDVnvg6D0q7xeFijnE/DM=; b=S1/RllvsB2hgX7
	EwxJOtr+Q1DyAhfUG6n+BrLkB17zorBSo8aXmLCcAa4PDq1lAaV3kx4tUd+WO9E9LDLz8dLKbRxqy
	3gzDpPfxMLSwR2cHg189p5LhtBUJNZIZqd90seQcp57+R6zM3/Tsfekz/aBlnlHTOzkhtM9lpoI12
	RH67iPqNPeMwzybr0LFlnle3OjBggmqcsok1oPbr/rqQqRSo310tP9Y8QB8DO2Be6GFIbRvHNRnaq
	+fLdZz2lKpWcKJdh0f16jXl/4fXx/oAoymcfjAjt/vHIe1+3bsdGzAZtiIMbYI9LHtT26OdnX+rcB
	B8qNYZePssU/ZBanhhLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNv-00000003ZtU-1q61;
	Thu, 09 Jul 2026 20:30:15 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNq-00000003ZpG-2WFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:30:12 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-495f637105eso301705b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783629008; x=1784233808; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzslN++gvwF111Oxj75aJ3QDVnvg6D0q7xeFijnE/DM=;
        b=VjlGmfAE8c4N/27i6gKAvY8z9Rido8+3152zs4Auda0J9dAlGyut3FauX+JCTvhS26
         VBbSFn1lVGdddQ61MqFfCcyplC0DR3Wgz/ZV+pYcwolvh7xWEfbJG6SrjIlN0iZj37l9
         wi2GR2QphfguIeXHHogYTdoTiDaggjEiG5s5vK6/+OQb+piQr1xE2cqNe1vzxgmBjoCG
         1uYXK3+6NxsncVDyGM42GmRRm0ZqcqjkH6xv3tt6NJ/bv8cWo5CJA15pM5fgxfimUV6M
         se7hG6wv0eZmynu0J/y/yG/mgJcdbJlkYyjpr9WEvXTvIbpvhn3BJQZ5/oTXuyyR2W8X
         o6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629008; x=1784233808;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzslN++gvwF111Oxj75aJ3QDVnvg6D0q7xeFijnE/DM=;
        b=ivfWbVGH2nPuPn+0rMmx20PBL22ikXCuRweycMjQjUbvUuIefWKukPpvHyFlqlqBAf
         IzOzX3GKtIktCNdHriIbsBWJLtM4AYn50gpUIf1/SQWZUvS0FbugYOqzyFcVJ1fOhcLW
         t8AwURega2kA/o6BhHcXhm8WhsicE4XUkCT+A0xEY9xmYNZYnn0zx/ejjSZm3NdMWAG6
         QThVsqOQrAhJ3Ioew0JFcY377YVbJ54anVmghtLMCPNhsI2pCPrgn0dYO5sg2jYYzOZc
         Z+5xc1+GylpwziPBcjKIfBIXAnJ1/dOEv6Wfag906JuKnMRZDGePJee1G6lY/TSNmyG2
         u6QA==
X-Forwarded-Encrypted: i=1; AFNElJ/yC/UUutEcKGDgWtLOfN2KrxCvwbOQTfM6d1Fv/0uGyVfyqyxQSURjsFCN6YkRcUqMEZZbnOxdQCfmxcaNj6rB@lists.infradead.org
X-Gm-Message-State: AOJu0YzR5MsLLw7/7N3ZxwPJV2LWegtGWGwa4JALsT3aZUKPKaJ5Zmk7
	r35nCu9b1+k4NRPBqzuM7zjTMC9WpBWIU+pNw4GX8zOla/iabb+a1ncg6YAVzo5j+ibQePG0UYW
	0+0Zcz/u++UoKHL8hm4On0BGR5g==
X-Received: from jaaf25.prod.google.com ([2002:a05:6638:c7d9:b0:5e9:4c3:fe2b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a1a:b0:495:f85b:d08f with SMTP id 5614622812f47-4a20241e89cmr7170981b6e.18.1783629008168;
 Thu, 09 Jul 2026 13:30:08 -0700 (PDT)
Date: Thu, 09 Jul 2026 20:30:07 +0000
In-Reply-To: <87y0fk5uyi.wl-maz@kernel.org> (message from Marc Zyngier on Thu,
 09 Jul 2026 11:16:37 +0100)
Mime-Version: 1.0
Message-ID: <gsntjyr36h4g.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 6.6 v2 1/6] arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org, oliver.upton@linux.dev, sashal@kernel.org, 
	gregkh@linuxfoundation.org, mizhang@google.com, catalin.marinas@arm.com, 
	will@kernel.org, james.morse@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, ahmed.genidi@arm.com, 
	leo.yan@arm.com, miguel.luis@oracle.com, dbrazdil@google.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_133010_643389_2B5F0904 
X-CRM114-Status: GOOD (  11.05  )
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

Hi Marc,

Marc Zyngier <maz@kernel.org> writes:

> On Wed, 08 Jul 2026 23:51:19 +0100,
> Colton Lewis <coltonlewis@google.com> wrote:

>> From: Marc Zyngier <maz@kernel.org>

>> [ Upstream commit cfc680bb04c54e61faa51a34d8383a0aa25b583f ]

>> ARMv9.5 has infroduced ID_AA64MMFR4_EL1 with a bunch of new features.
>> Add the corresponding layout.

>> This is extracted from the public ARM SysReg_xml_A_profile-2023-09
>> delivery, timestamped d55f5af8e09052abe92a02adf820deea2eaed717.

>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Miguel Luis <miguel.luis@oracle.com>
>> Link: https://lore.kernel.org/r/20240122181344.258974-5-maz@kernel.org
>> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>

> Please read Documentation/process/backporting.rst, and in particular
> the section indicating the requirement for your own SoB.

> None of these patches can be merged if this is missing.

That taught me a few tricks. Thanks. And I'll make sure to include my
SoB.

> 	M.

> --
> Jazz isn't dead. It just smells funny.

