Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6847C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pz+VkJaf3rDADUJdpqmWyIZGulrG9C1hI5BJar5zt4=; b=n5OGCMY7WpWKeL/Wtjc4YyEGOl
	BeHr/qlda0zPepz+QwiFO9x1C5P/3+NBvqVpTPRg1CLFUJrRnJZ1z/nJt+sgF8FQClcS0xORPRwL8
	skXdUeu1s5xBEx+mSKur1cWqp1G+LqCiwhlNPZncaYx2Cw0JXWTxUzQp6J0rHxDL7qe8J58oVF98B
	3gxsyP4jK5iWMtd5jERKZq1rdaBJrepX25uXx6aEsvKVG6cBIfqAoo6Dd9fAsCDtJqpbzhttE9kvH
	+UETPlGexD1J0IczayzLyrKDgrdWDS2kC9krvbgQuLIpKghES4A/3D3zHvIWpz9wEhmkaMF18w0C5
	Es6MMX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0A7-0000000H7GV-1FHT;
	Mon, 28 Sep 2026 01:28:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0A5-0000000H7Fz-22Sv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Pz+VkJaf3rDADUJdpqmWyIZGulrG9C1hI5BJar5zt4=;
	b=J4FNYLc+OlOkhIASsAqSkGNmlG7SCzZfBrbTsQr2gbfZU83Fz6uylhEChpsl0MtOWKAtll
	ILtwc+wZ6lZgrCs6da8aC1tHyh3xLGiaeeSQ86MIBKsismkxS3EftLadokDkht/57alL5l
	uOCSkdepysYgiNkH2SK+X1H/61DQqOs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-jyO_t9wgMLytZP18O4c2nw-1; Sun, 27 Sep 2026 21:28:04 -0400
X-MC-Unique: jyO_t9wgMLytZP18O4c2nw-1
X-Mimecast-MFC-AGG-ID: jyO_t9wgMLytZP18O4c2nw_1790558884
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1676416a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558884; x=1791163684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Pz+VkJaf3rDADUJdpqmWyIZGulrG9C1hI5BJar5zt4=;
        b=tA3dVdfM4NYQ+zQnIWEfJU1lenC9J1O2qjgkAQNxwIAbKw2fRSTwbBwr0gwYyosmyZ
         eoyiRlShKnYD0qWZh9vrl+ZZWnGu35wJ1h0y5YZlhusWZ8Zkx/BKZJHqchspGHuFGRzz
         uvZFjZmQBudKJo948ORFcNAdiVR10+6WQBSotUz2cC4h3DuKhTXs86x4Tz5dzqX5cCS4
         bPnEj/Po5jSpcTYZWFVDWl98xUYTO6wzqpjJgTi0qkmllD+7rIOy/FswZXcHzUFqQndb
         udTWtnLAbFkDcHWRFtSlvRiHUEf+HDkFXK5/0XMN1JZvjpmw4m5liiIH56QAo9x00izC
         y3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoxqaFiuqm+FmFH3VUOaVF8/FV/BoZXG0TltTqDOq5ybSjILqjuUaacximNfyPaUxdgzAFh16xx+3cUhKRwGQj@lists.infradead.org
X-Gm-Message-State: AFuF++kaC9NpJeVzLtSx0V5hImE64NXHiUXvEhgQZw0ysnkzLB6cKP+x
	TbD5/54bu1SlyH1zS9bAUM3/h2xQv0X+pBODAa+EOwvtlt03reG2anZLwRah2/p4OXrM6MERGz4
	n2ld5cfZKO9dhlhT2dpobLPkAMfjBFWgO/HQRnGhjAvgPKfRtLzd+LmftO8yY+Q586JhS+QJGms
	t+
X-Gm-Gg: AYBFou0iMOf04sMD/Cbpvxe9QEudQAvNWzMPrjk/+lq7zsszutr+HZBhG/ntWHMTyU2
	XBU5TRR/a8FY5fOBKQmaT5+B1f8cF1QDupOQqLclMCf7UPWt1gCWFsJ9ZZ5r0XW521uvgSlkuQF
	t8WTp73nEIrOsBhV9p8s2znheZk0Ty0FFPmEHo8D6Eg2Ye7kTZ7eeM3znfFd1icwG3MW7Na9jhv
	3ZAiZ8yoMd/QKpbWrzud0CD5yhIsICAKySZNYI64i0VI0kBQsVz1JvBt1lCVJzKIPk9AuEmzQXy
	SVNHNEDQMKmV+Uyps5/qUsZB1VgbMJX2/HdxREu8vMd6OSvpvbhBCwJxr2zLcm+TLLnFb/3TPiQ
	I0vKNK3VDL6AMJGq2KGQd1lNUr84vygmtNPIxsLtnoQ==
X-Received: by 2002:a05:6a20:244f:b0:3de:6873:84d1 with SMTP id adf61e73a8af0-3de6873856fmr678764637.74.1790558883733;
        Sun, 27 Sep 2026 18:28:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:244f:b0:3de:6873:84d1 with SMTP id adf61e73a8af0-3de6873856fmr678737637.74.1790558883223;
        Sun, 27 Sep 2026 18:28:03 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc794ef8befsm2931082a12.12.2026.09.27.18.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:28:02 -0700 (PDT)
Message-ID: <346eb257-23ce-4a43-a17a-f532d7448582@redhat.com>
Date: Mon, 28 Sep 2026 11:27:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 15/20] KVM: arm64: CCA: Introduce Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-16-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-16-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rJqLe5H8luca64kSoFWozHnsdufJDkOQT4x7P8NKDAU_1790558884
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_182809_613918_147D34CE 
X-CRM114-Status: GOOD (  21.38  )
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
> From: Steven Price <steven.price@arm.com>
> 
> Add foundational work for supporting Realms.
>   - Add a new VM flavor.
>   - At KVM init, check if the KVM can support Realms (though not functional yet)
>     and will be advertised by static key kvm_rmi_is_available. This will be
>     turned on in a later patches, once we have all the bits and pieces ready.
>     For now check if we are blessed with KVM_MODE_RMM.
>   - Add realm specific tracking in kvm_arch. Since Realm and protected pKVM
>     states are mutually exclusive, move them into a union.
> 
> Please note that we cannot create Realm VMs yet. This requires further changes
> to the UABI and core RMI driver support, which will come later.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>   * Share mutually exclusive pKVM and Realm per-VM storage in a union.
>   * Move to the new VM flavor infrastructure, split bits out. Trimmed down
>   * Move in Realm state and basic boiler plates
> Changes since v13:
>   * Most of the init has been moved out of the 'kvm' directory so this is
>     much more basic now.
> Changes since v12:
>   * Drop check for 4k page size.
> Changes since v11:
>   * Reword slightly the comments on the realm states.
> Changes since v10:
>   * kvm_is_realm() no longer has a NULL check.
>   * Rename from "rme" to "rmi" when referring to the RMM interface.
>   * Check for RME (hardware) support before probing for RMI support.
> Changes since v8:
>   * No need to guard kvm_init_rme() behind 'in_hyp_mode'.
> Changes since v6:
>   * Improved message for an unsupported RMI ABI version.
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 16 ++++++++
>   arch/arm64/include/asm/kvm_host.h    | 18 +++++---
>   arch/arm64/include/asm/kvm_rmi.h     | 61 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  2 +-
>   arch/arm64/kvm/arm.c                 |  6 +++
>   arch/arm64/kvm/mmu.c                 |  1 +
>   arch/arm64/kvm/rmi.c                 | 18 ++++++++
>   8 files changed, 117 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>   create mode 100644 arch/arm64/kvm/rmi.c
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


