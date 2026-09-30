Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B262DCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTz7JFysavVzx+3a8DoDd2wDpfretAnN3j2Hpag3BAM=; b=HLuwsCPbkfMZ1mr7TKRS/9Qd3d
	BCBDrY17QYpSFCXnvDv5LxrSTKrAlmf+9l87Sn4i1ja/zBt5mHlwYA6DOd1gzjjOb/+Zj2YysjESk
	cq1PhHm/xOdORoUgfOqMZag3ifozOjLVyJ/tYoGnv+OPOWKEUCW+s5zUIfrWfnKHe/U48eVB4OyOM
	A66e2K00ltYlYI7zKbWhsdPnfAilbPjXjwER+0ZRa7md4ZKRTpYay22CF6YNZxijpuMWqeVyyWTBh
	DMJExT5O6uiTuu2FX/maCJjFpIAeReOBUVbHIcMYaAbwrC0EdBTVhyn8P7P4mtm0FlqPgenP88W2a
	J+/4pdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwCU-00000006V9W-2C8u;
	Wed, 30 Sep 2026 15:26:30 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwCR-00000006V8w-3pGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:26:29 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acaec6a74aso3049748a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790781986; x=1791386786; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTz7JFysavVzx+3a8DoDd2wDpfretAnN3j2Hpag3BAM=;
        b=ShGb3KzyIRe0iC4RYv4RvHoSIZIGOKUHZZcYqj+l19UpQe8cMBiJShRTxMFS9fML+x
         tYzfA1qDEAhLQvKNQ6L7NWynqj1DsTpZMUdeGImnHm9EekQaLHyPv8VwAaXHONPt27mk
         j7pCmFqBhNP244d/+UheqILJxR0s1P955cM2FRjxWQZ4FMNTdNOrCvCUc8l59SJEK2Kg
         +hhexNDXBpqNAVgvlUtMVAtDOv+42wTJHe1T6+OHUo6MNHzpRQX1JGPe4b0V1RkUzb11
         k00HgFu6jTGOyIH0oeyEWVi5Mym65ybVzBLA7r6TgyqezITn3oxRVcWapjlE5xATZ7sY
         wQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781986; x=1791386786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTz7JFysavVzx+3a8DoDd2wDpfretAnN3j2Hpag3BAM=;
        b=MWU9sLDP4EW/ATh+n0sDsHi+C8CwMI7Z7PIFhlr4dkREneEcCVrGsVvC8yqlKCcxbx
         Y0Rpymba8SMBQ7gEzxGHhuGyCUH9kF1P4MtGtv0Dx/Z954dzr48otKeNx+5tm7gSpRpl
         ydyGqB5xmoLsxp16Fr9K/uYpqIAZh35I2npKn+ESW2O65XgvrJvxMXi6pMWYPCfOUzMJ
         SgzOtJVNLL0OxXeG03PErZgC65FcqK2qOs5lkU2mHW6HWpdPzdAFQF3OwfV1nIrPW1Sy
         OOKOOhuPDKrFrWCg+Nsr8cjMiKFMVx0knWTerysxEH7r6kdR83TG/xExtNajvxwmHPrT
         3mSg==
X-Forwarded-Encrypted: i=1; AKwUvBwosJ0l69SqCTFX/hACsAksNxmE/GIXkzafz3M+moBDnNHD3S0Naelm+KwWmZbLHdgceqiRCDTse8KCa9vaPlcQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKhDFKi2LpEL85ZaCiCjDVyP3lBdmf/DN9qCknmo5IEz5zwa1SX
	1aAVwHUCWQfZ+aZjj3RUfcR/c1dgfz+JxpKR41zznJudCe6KyuKBdHQgEVDmUcxEV50=
X-Gm-Gg: AYBFou0cBv/izPFSbRut05wVUSYvjPuV+Smaj4ISdmghBcEgfhEG4i8UfYkYSoGUyuu
	BK711n0zOCUeB+L0Kz5gZiHuk4CDmDs/PureCYz4RoioDNg2sYXC/prc7jNXo3HFaGADPhyReaI
	fiu9Fj5vjZJ8bM10a7zdnGuWnFxgdA+j182pjvX6oNHa7aEiR53c2N5G8zIyAacX+/0Gj2sy+Dm
	Bmt41HEine2+l3KMQWxNgoaK46fTUCph3IrdxQl/HhmcvrB7I4JETP9sjOwB5xfGu6Z21e4SxHC
	tUo5ArNeMMx1VeP1Eqeo+dCVxQXsw0YT5uSl/++gl7zf0SjN8WkvagD5JylY6AeoAF5PozH1QRT
	3F7VrUksFrQ0jT7Gkx8dSxNhsq1UhAJGMQZ+ZkjMpWEnCLdRVvOGotG0wIq6YW5/W/mFL7uuNnc
	lZlZ+OGLdNbEnzahr5ZiP/M4iwsPI/E30BNyK4CYf2Kd2JfPfHIWnLLJohZoTfl2mwIpNDw56BK
	xs=
X-Received: by 2002:a05:6402:46d0:b0:6aa:f187:26b8 with SMTP id 4fb4d7f45d1cf-6ae1994fe10mr1077601a12.37.1790781985959;
        Wed, 30 Sep 2026 08:26:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm954439a12.19.2026.09.30.08.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:26:25 -0700 (PDT)
Message-ID: <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
Date: Wed, 30 Sep 2026 16:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Zide Chen <zide.chen@intel.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Mingwei Zhang <mizhang@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260924172928.2110956-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_082627_975399_3C309AE5 
X-CRM114-Status: GOOD (  14.18  )
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



On 24/09/2026 18:29, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> There is no longer a kernel command line parameter
> (`arm_pmuv3.reserved_host_counters`); PMU partitioning is now completely
> controlled via the KVM API using `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`
> and `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When

As far as I know there isn't a straightforward way to get the number of 
hw counters from userspace. You have to either parse dmesg or attempt to 
open incrementally more counters in a group until it fails.

This makes doing things like "use all counters for guest" or "reserve 
two for the host" difficult. Maybe it's time to add a file to the PMU 
that userspace can use query this.


