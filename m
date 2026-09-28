Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16510C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=; b=e34IYFAhKnqjRvc+5ExP0nTVTV
	r0ouLGdMgl0+UCpOqBqudSU7i3rGrWwjsuQbCtZaPtcKwOdrjKDJ/9zbtrn+ZlqavBqsQRgQXj/IC
	fcA1oDZkY4xeivD2XL1yu7TPrsMavm/wO9n8CV5v5jCmAIIRom2b2O+QTdS+uG9ekABu/vuZDQPJl
	oLGqq32VVNgD0My7FbQJg6cb8vu9Yy41ApzURM1yF6KPlAtxStTUnfZMRfCosGnypfOI1JfNXfoH1
	OeCMStvAwTRsE+SJ1VpqLCvATBqKNcKG8cD2yijinPakQKXVRyuzmCM9cWaL+9lccMsJ5ti8MaL+v
	Es8MBEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0CG-0000000H7ea-0Oit;
	Mon, 28 Sep 2026 01:30:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0CD-0000000H7dk-0M8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790559020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=;
	b=RE9TvltfcFvYaiYw1TvhEU7mvEh5N1EJoUMOAPUnaIJpLIZSWuisITBw/b6uJVWVGsUUWu
	JvhLIPMKGPsC8goxx/KZYK4s8S9ABLqfSW4qU10cvHMNFP7HRoBC/VUHZCl6xixZA9yL0c
	RvWBd2Py9uO2OzwuXeoAeIawSU/XPPM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-YYxuzdWJNl25cS08VuFFPw-1; Sun, 27 Sep 2026 21:30:18 -0400
X-MC-Unique: YYxuzdWJNl25cS08VuFFPw-1
X-Mimecast-MFC-AGG-ID: YYxuzdWJNl25cS08VuFFPw_1790559018
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e124796da0so8731425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559018; x=1791163818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI4MQAkrqHNpUjr7C93Sk+aRsKdy2XPiHpFNJDV/YcA=;
        b=2q1QLkJQWbxtR8T74BBTXCcKl0RamUZyxb/tYIG1EErzx2UirRLAlFwPe6s4btnRc7
         ozYD5xek3xMwhGYTV+9EYE4UovyV8Y6zo4WdcGpGYEGoBZ4I0nxgGi6ks760GPNHBS8u
         ELMKaJnrdh5nlW/1OGMwfR2fe067/sB8Fp7JbeQCxpINv0iwv2H3CaHKLqsKmWtTtBwT
         sw8ZpiMeXXsm8lLZ6N2/KUunQ4gxc3dTN0EXwJxrv7iQmzEhGQSCkwz9UnoVYlC+mEBg
         L8V2OXErgDGdUZTnnNzI6h+3lxEnA8HZGMbxlNyZHR1Og+Ya4ewj1RTuELMDXJzxqTJl
         iDaw==
X-Forwarded-Encrypted: i=1; AKwUvBx0iyPjwHkm4pSbYKxv0u+48Piyn7+i86rW8HLTgLm++SzU7jSA5hvQMo6CZGgywLzxa7pu9xXqoR+iWUhdtaYo@lists.infradead.org
X-Gm-Message-State: AFq9FYKewhq+pmaUZjoAoykQmHWc/WvrCOysnQB2Uz3304eFImBuIILI
	AeP1g3fP/gdXcX4V+PFRRS6M2eXhdTMzA6etP42mNVqjG/tMlDz4EdO7gAWxNkcR1oHXfrr1SZ+
	fKY1i0tY9MFSBg2xwyTq+vAgtfrDeLLWCdtfq3tkg3AF+OhYI+/SxYaMd/b78v+nPE3DPXppGQn
	QG
X-Gm-Gg: AYBFou0l8U3OVdSmkbiLVMV/vb8kmnbvCtl0w9wSWDV2l1Z3C1DTdBWtl0XNPA219Jl
	3v1N/NXB1PD+l4ruvSKDnvkokayVPCJCGCutd5k3uV1vICmdv2OXGBYBXoInmq2B3ctP8Wcfvoy
	TjK84oqqWNUIwfDoVGE6JYMdF1lVh3o2RF0mL8QNL9r8/cFSv4XYsXaWi8USgBMSziAbAwAmMpF
	ndDQSRdtVxGqtG09HOdfx2AnUSRZShgGh1/uW/+cMMu80XjjQApyyQX/ZPKVxD9EpBLRe1THQp/
	LAFV9MrQrxNDu9s5wdfCo+cYcpeiOchSKgU7o1Qr2JaPtf6pqZE3DKeYNmQ+OZJV0Rl9VWwI1r2
	CcUMz0tZlt9VDLOv7wGbMTiop8U1BNbxrddxPyUnvGQ==
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr9007853a91.36.1790559017550;
        Sun, 27 Sep 2026 18:30:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr9007821a91.36.1790559017031;
        Sun, 27 Sep 2026 18:30:17 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm17161191a91.14.2026.09.27.18.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:30:16 -0700 (PDT)
Message-ID: <98356890-80b0-47f8-bddf-75d75ce63272@redhat.com>
Date: Mon, 28 Sep 2026 11:30:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 20/20] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-21-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-21-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pnXtOEXYPmQSKosKFJPv70CwPLO6q2uMrW4KIkKIIZ4_1790559018
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_183021_202913_0F388D03 
X-CRM114-Status: GOOD (  23.55  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM restricts the access to the register states that the host can
> read/modify for a given Realm.
> 
> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>        requests.
>        MMIO emulation in the unprotected space.
> 
> Additionally we use the sysreg configuration to advertise/configure the
> following Realm parameters, which are required before the Realm Descriptor
> :w
> is created:
>   - SVE Vector Length
>   - Number of HW Breakpoints/Watchpoints
>   - PMU Counters.
> 
> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
> the configuration of Realm creation parameters. We don't support PMUs for
> the Realm VMs yet, so PMCR is not exposed.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>   - Don't expose PMCR_EL0 to the userspace now, we could do that when we
>     support PMU
>   - Fix check patch warnings
> Changes since v17:
>    - Merge related changes into one single patch for the user set/get registers
>      I have retained the Review tags, as the code hasn't changed, just the patches
>      were merged into a single one with the same tags.
>    - Limit KVM_GET_REG_LIST to the allowed CORE registers.
> ---
>   arch/arm64/kvm/guest.c      | 63 +++++++++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hypercalls.c |  4 +--
>   arch/arm64/kvm/sys_regs.c   | 28 +++++++++++++----
>   3 files changed, 87 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


