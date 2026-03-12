Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D24106ACEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zg6XMtE8EeAIh+U43OyGl3IYGEoYBFjR2P1yJw9hfSY=; b=jnqNKLO8EdlD9W
	fPAf/uHMmANrPOa2XJogIL9OXW5ACfi6BT3iJIs4YXDSQcquniEaZjG007juBw1RdDjeL0cg5V/XM
	1g+RsPVc2fRUOzhyZjIAvhtqJD2S/JKNxxDsrEJdj/Al/Wpd4sVy5FEiGK0Y+VpTWHRouZEf0cJ5U
	RckZMLPESLwgQrR0nOmtZHB6NlgWq2tgpry8cDUHR7TkPIMxJ+KqvTzj6iMy3D+nbCYfpRI8//Bl3
	osp9MAbODxomJXPlF/VLHorlicxNwtnoYlDA6hZG5LfLFmfukZoMkU4qb7LdsJKVQqGlAFpdpL7rI
	34xo18v7WUzFGMLMxcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0npF-0000000FVw1-15Cf;
	Thu, 12 Mar 2026 21:44:13 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0npD-0000000FVvT-0etS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 21:44:12 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-67ba64650d9so22514255eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 14:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773351849; x=1773956649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zg6XMtE8EeAIh+U43OyGl3IYGEoYBFjR2P1yJw9hfSY=;
        b=Epd/YDt5iW+x5k9YRtBvuOvhSOaN8FZ39n1DOp8ZR5ccl5+6mYbBJdfJFe6iR97DqM
         kELmTmwf7QPkm2mOKv1ga94XgttUfXGi5BuRvhU/Q+NJ9VaAigJcAcj9a8YccfpPF0vz
         U++ieU60jGaSK03H/Lc+t680m8lVybKzLaKYYuV/doXI1usWdW9JqrQll1VCSpIAWxOO
         Xi8lz4DMhmCg2Y1dC3YEYOfEQ3bKQ4Nnr9YauNwD6JZS+UsloBMfd3lFbrVsohr/vk7a
         k1y5K3u74+RDiWWr9PQxMg4jTPP7iCrv99zwF/l7uPF/JtVsFyJk0V8qSeYOflHFrwQX
         8zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351849; x=1773956649;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zg6XMtE8EeAIh+U43OyGl3IYGEoYBFjR2P1yJw9hfSY=;
        b=RudKokclDhiJE2tvHYbvgW1c+AyDeU6N/Hj79wCy7jVMpZqfjoShsVr/cTXBJjPbzM
         xenZtXG7sfQ8y+d9J6AnuTo9B/a9ZdMBCsVYJqQZRFSsYRFL6Cdw6+UdH8tlvbY9Eyxn
         7Hia7l+lAheXHVpSd1BiBaacSgmqbF4HETDB3pDsnpHxCBlUAU+c7R1yU/b1ONaAgsZP
         za9zC9EL9LQIQwaTyMrxatNQpk1xr+NzUtYjIpDnb3Mzsh0c4HUweU/zsP+m0L3Y1td1
         y14nSG0eVCCH5bsXnK9wA4xT/+Mr1HSei6ppeRlev7Usrlv96AqNtaB5wv3jGeKU1xrQ
         hCiA==
X-Forwarded-Encrypted: i=1; AJvYcCUTF0TIKF/j4990FIl25RjDoEsJzwJburHuQ9xxVsiGsPeP5gBH8tIpjbXavg4zjt+3Cz1E/63MwpnKhNNvH+aN@lists.infradead.org
X-Gm-Message-State: AOJu0YxK20/WwF/nRuVA/RbkfjHiAL+Xo9Gxjtfl7qpkSSuUtKYT8Hbh
	TRDEIKvP8R3rLfOGXglDObLNc3Ce59kPIn2JZ1SIZ5tHpc6EXPxLV8vWK27x+2ZjZsW/aIWe6m7
	hNlHfiYrV9w/Z9wey8Cv7qehMWA==
X-Received: from ileg2.prod.google.com ([2002:a05:6e02:1a22:b0:4f6:ee40:962])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2215:b0:67b:c57c:7abc with SMTP id 006d021491bc7-67bda9bc852mr600462eaf.19.1773351849082;
 Thu, 12 Mar 2026 14:44:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 21:44:07 +0000
In-Reply-To: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
 (message from James Clark on Thu, 05 Mar 2026 16:28:16 +0000)
Mime-Version: 1.0
Message-ID: <gsntpl58oh94.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 0/3] KVM: arm64: Read PMUVer as unsigned
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, alexandru.elisei@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_144411_217292_C92424C3 
X-CRM114-Status: GOOD (  15.11  )
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

James Clark <james.clark@linaro.org> writes:

> Fix some issues with the signedness of PMUVer and PerfMon ID fields.

> I ran into the first issue when testing "ARM64 PMU Partitioning" patches
> on the FVP. The second issue was only found by inspection.

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v2:
> - Handle ID_AA64DFR0_EL1_PMUVer_IMP_DEF correctly by using
>    pmuv3_implemented()
> - Fix another issue with incorrect sign in cpufeature.c
> - Add a commit to refactor has_pmuv3() to use pmuv3_implemented() for
>    consistency
> - Link to v1:  
> https://lore.kernel.org/r/20260305-james-kvm-pmuver-sign-v1-1-eea0a2116dd0@linaro.org

> ---
> James Clark (3):
>        KVM: arm64: Read PMUVer as unsigned
>        arm64: cpufeature: Make PMUVer and PerfMon unsigned
>        arm64: cpufeature: Use pmuv3_implemented() function

>   arch/arm/include/asm/arm_pmuv3.h |  7 +++++++
>   arch/arm64/kernel/cpufeature.c   | 16 ++++------------
>   arch/arm64/kvm/debug.c           |  5 ++++-
>   3 files changed, 15 insertions(+), 13 deletions(-)
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260305-james-kvm-pmuver-sign-fe830bdead2d

> Best regards,
> --
> James Clark <james.clark@linaro.org>

Thanks for testing my series James. Glad you caught this

Reviewed-by: Colton Lewis <coltonlewis@google.com>

