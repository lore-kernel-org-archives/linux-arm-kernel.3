Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F4C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 05:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=; b=qouNFhfGbd6GtL1u6Wiq2PBgQ3
	f3FdgDYTYM8uQQlUINXyszYrBvElMP3dE0w0/agF+AO/nS7SW/YeLDdZepiYjHgrv5vQ9z6zdla+Y
	lrFWlvoHAfAHgS/fh8Rp4hNZJezKP2QuR9YGLL6ExNrvu8o8+b/2JdgLmDGxlRxRp2wCwcwxueeDO
	66IjKd46sx3IWoWRtl0nieS7ecNqPZi/drHGFhASupUvGB5li8vpwRyWrCz4PbyRnIFlCeC6eBsLM
	dkw7uZ8IiUtSs+GLYWewh+/BsAJwFVDogrZkg2o7WbJMlGQUcYItj+Yv3Fh6PJIiRKs7To+Hoofii
	xdm26XYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yij-0000000CiBS-2jxi;
	Fri, 25 Sep 2026 05:43:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yig-0000000CiB1-3yaE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 05:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790315018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
	b=HOpw2Gwt0nETuNZSRM6E0tzSyfYLBGtK+z+SPvlpvpOcF5HwD9Dna57U3LIOjU6/Feuf72
	WSKXWvUjdNO4m+Zt4QqbTAqW++Nsuc2X4HCXP/MwQ2FSv/ChAo2ufucgkukbIDVDHgQb0T
	OfhH3ut68gptXR9E/IJt8/fhBr/F5lI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-_Np8V9ugODO5f-LCPs46XQ-1; Fri, 25 Sep 2026 01:43:36 -0400
X-MC-Unique: _Np8V9ugODO5f-LCPs46XQ-1
X-Mimecast-MFC-AGG-ID: _Np8V9ugODO5f-LCPs46XQ_1790315015
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so6683365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315015; x=1790919815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
        b=Jv5gfZ+Q+T8IjNOq46KWajpx/0i6uN6wZFw7egqBD3y0qgKswJFuTEZIeKLOryTGTS
         ri+Su6sO3V1a0Gd/MC0/hieWWPWBiMGYoJqfO5Dr9aAjqrGkWckNosCMGjT1cqTA3ZBs
         hwCKk5ypV3tf2RssukV+p74uOFt/jNwhsS/DdrnBg5r4SAHWq0xiaztZ6CZDOLJD/7rv
         y8L5SUVLPaog4ivzToWsJgRTS5vZZY/T/CjJMCijaIMFSrVlHIhJ1XZkbcUiGyb15BhH
         l1kjDs1Oq6XAosyGUM/VNpD0cgPgCEK0c2BzbVA8jK+HAQwsgWighPykjnqixEsMjHbn
         4wXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRAPt2gNuvw6V6oR597uw7JtRuxuz/d19i5qoZeBq9gBYKB9ZjDpJa739hkvUFba/ESahdIjn49zh4KG9UDbA4@lists.infradead.org
X-Gm-Message-State: AFuF++kFBOiXY5V3Hfin9YCmzwBccd0SJbHFEL+FDYdgIYUAF5IinpIg
	2/PF8UxHZT4eOVjKCra21NnyIUDJ9tlF3Og5BfGgzyLj+3rT7I4XSAGW3Ku4QWmllZtpHAiiNG7
	VCHMymYSGJNWmtM/VwRg3Fbvx3TrFUtyM/IG5yhbnczMaiLDlagN52/dbAoD/1Ra39G6BwlrYWW
	m/
X-Gm-Gg: AYBFou1I2ZDW5PdMi3HJgowAPwUMlZtBEI/U/TODtdD+PXoHlAT2yXsnBhLaPs9q27x
	3lFOYrpasfQFXhDky72VWo+mNcEHFV3XS6kULw8FKCHdz8vq6w367WZBtIqyPyODijQdvX6KHf1
	WP0FNhjH2QBsWtIkRfHdMBEp0ck/YcPPQzPevEUmT0z1lU1yVQzehcGtxJZVmQZbeTYIN3Kuuie
	wx1aCvaoHV+CVBUie0yz0ywje0IKqC+3gsuzqfGAqoSSSFg0mBJtEHyGSudlPHklDg3ix4L+VKe
	/521f0tUvxF7RT4SX+mX2chT8s30CkweKA+uTBcYPLPGUErNyIOCf2HHiCBEe6RKcglCXkQYK0N
	64RL9tddM8Hn1RaRhA2OicvqImGiuPE5y0b9tYqx9hQ==
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840305ad.51.1790315014901;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840225ad.51.1790315014491;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91443823sm4588265ad.57.2026.09.24.22.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 22:43:33 -0700 (PDT)
Message-ID: <295014e8-24d7-494a-8f3e-0e17794d024f@redhat.com>
Date: Fri, 25 Sep 2026 15:43:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uzBIO2PWksGXl_YnWVMVvOyzBcmByANa_8WJkndd3nk_1790315015
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_224339_071758_B9A18F96 
X-CRM114-Status: GOOD (  23.41  )
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

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v19:
>   * Read all implemented RmiFeatureRegisters - 5
>   * Use ARRAY_SIZE(rmi_feat_reg_cache) for the loop in rmi_read_features()
>   * Fold rmi_features() into rmi_read_features
>   * Fix comment for rmi_smccc_invoke()
>   * Drop default y
>   * Add retry for RMI_BLOCKED and return to caller
> v18:
>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>     parameters are 0 - Sashiko
>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>     support, which is also in progress
> v16:
>   * Update Kconfig text to include PCIe TDISP.
>   * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>   * The code is moved again, this time into the 'firmware' directory.
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   2 +
>   drivers/firmware/arm_rmm/rmi.c    | 109 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   8 files changed, 188 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 0000000000000..65171988fdcae
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RMI)	= rmi.o

Unnecessary blank line at the top in Makefile. Besides, why doesn't this come
as below? :)

obj-$(CONFIG_ARM_RMM_RMI)	+= rmi.o

Thanks,
Gavin


