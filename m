Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7550CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCfiz5Ut6f0Hmx5GZ2r8SOtef3xDzej4Rj97vBZKv8A=; b=EYhKDt0mECFYgYm1ICbYRFsv3W
	5TJ8bekwsIuIE+skkAcTRGbJZxaTbDctpvm7xpK58BBREgvqVi+QtwuoUGZ379WT+RU/SiICzCwr2
	9okd0l7ZYaGnVv/0Q4M/k4jK4psjyzVQruqh0nTQUc0xEvNerb+C5FrRgF5kvI5TfW1AjoTvIVR6z
	p7iqEIFrlNWSrLwBX2rE/LGqy0jBOA37UpleysMBo7vgl9IwbAFgOpfigOt0UKujqM2s+U9vb/7UF
	fAlTTmUTvspQzMe7jyT+SKIc6AEkXDw6kLJ/kPI5pY6RCpA/X7weAqUB7+3IgYIJ+s9LhrmalBJkk
	mp9gRv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uqc-000000011Ft-0DZk;
	Mon, 06 Oct 2025 23:42:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uqZ-000000011FW-11Zl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759794146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCfiz5Ut6f0Hmx5GZ2r8SOtef3xDzej4Rj97vBZKv8A=;
	b=Y+D/gyMg8fW2eCqdli5wXlocEvfQf5POOHAfGAUb3mcMIsdICfomcz6MQNV/qKUQx52JQV
	x8SngdZOVHxdbyL7jEiHIDiAq9K0l2tnWjlrSc2XbXNlvmGFd1uW5A1ZORO9tj9op3dptq
	Q8ugSBsy6s0hjXkPWnFnsj+YwDQAN1Y=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-b40tevqNMZOzELIYcWuiLw-1; Mon, 06 Oct 2025 19:42:24 -0400
X-MC-Unique: b40tevqNMZOzELIYcWuiLw-1
X-Mimecast-MFC-AGG-ID: b40tevqNMZOzELIYcWuiLw_1759794144
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b60992e3b27so4242048a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759794144; x=1760398944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCfiz5Ut6f0Hmx5GZ2r8SOtef3xDzej4Rj97vBZKv8A=;
        b=dMtfhWz9PG4fPuNtTYc9DtxGMNQdUXGler78S/hp1FKSz5eqxegjbYkyjB4312OLDl
         66VHLkAaetaXsLcFeg2S6ZCHHCegUk3k+nvbNM29bCXsywtPt/CuDNpnjCBN7yFOe7B0
         lquGO9rx40YLtcH+WuZsXmr/vo/04noiNMBM+89KoxkSyYPA/dvhVFa7i4jB5xcHU+pp
         o3Zhw4jJToYrx/+XC8vaeIBxrzRt8WFQp0SJNTis184C2S8KgQ9ScK6ARcJZv2bjZiuy
         vp5JkL1f97A3iUEUfUFY2jStIZXXk3TreqtuaOlo/9YEZZ+x0kXXCb/cZd6PDYwZknUP
         xF/g==
X-Forwarded-Encrypted: i=1; AJvYcCWrpZuTOZK0vHVrp3zBQ0wNOzmcd7HdU6Ys9s3Ds5B21FrGK+qa377xl8bJyjF+dJ3jOZcVQNJERzeqU9apbcW3@lists.infradead.org
X-Gm-Message-State: AOJu0YzG4d8f8g27BTJLNry2RlkVd7zVZP+dDHoFBMhcshtfHtusC6Zv
	BPuudBlrId8j3aoS2DWavTLYDkrzfpzlpS3IC1Xp64TpxaMIbl+EIjpLDVXsSm9Nb41av6M0Bq2
	BweMJ61nFLaWqhy0Ui+Qanod/VKE6vmL4s7I0WxxczsJx3jaeIKnTuUlyNfMDDhppbXfmYmFeY5
	My
X-Gm-Gg: ASbGnctcR2JcY77NHMxjoKx1EzBIFZS8dkHcca+NsJ7zaVbgqzQdcAL2NEM3aUWEfy5
	CREg4MfhGALAW3dSyuFhDi6SEWx7Q6f7pNpNS5KMZXDDuQ5ekaRP3w2X27V0VwXUJfh5TEgcOGi
	tKUqS2xHt2urv6kcpdOgB5O5XrOS53Oq61NVwV0OjOKsgCXXzW4y6Ir3yb3bbH9afRvaSNd1afq
	iJJho4r6vghaO9dp53fUYWWbx+cS5eL5nGfo+Kb/DNCyxghCp9BBMl2JwASa0K1Y3dVFy3SdPi9
	4VcC3DEaQbMOKK/vUoQtP1Iuuymi1V28A+r8zcTuzOM1MxTRjhAMEFzeZO3tqmw/NJ6uvBfEGvM
	321jn7Ws8Ow==
X-Received: by 2002:a05:6a20:1592:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-32b62136d1fmr19762254637.52.1759794143748;
        Mon, 06 Oct 2025 16:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErH3GfkI2IJHSlnVnK9KFQpJaGBBQh0aEIEhfAff2FkMCiATPoRFpGW3jxwgnd3xHSMfVm/w==
X-Received: by 2002:a05:6a20:1592:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-32b62136d1fmr19762234637.52.1759794143405;
        Mon, 06 Oct 2025 16:42:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1d27sm13937880b3a.36.2025.10.06.16.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 16:42:22 -0700 (PDT)
Message-ID: <ea7b2ab9-8115-4164-ba9d-6aa42ac57482@redhat.com>
Date: Tue, 7 Oct 2025 09:42:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/29] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-11-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-11-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OvWnhYewyjufBdcE9E4SrALKhq67ewwKDRdrJ01QyDw_1759794144
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_164227_704681_8234960E 
X-CRM114-Status: GOOD (  23.53  )
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

On 9/11/25 6:42 AM, James Morse wrote:
> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
> 
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed as each CPU's online call is made.
> 
> This adds the low-level MSC register accessors.
> 
> Once all MSCs reported by the firmware have been probed from a CPU in
> their respective cpu-affinity set, the probe-time cpuhp callbacks are
> replaced.  The replacement callbacks will ultimately need to handle
> save/restore of the runtime MSC state across power transitions, but for
> now there is nothing to do in them: so do nothing.
> 
> The architecture's context switch code will be enabled by a static-key,
> this can be set by mpam_enable(), but must be done from process context,
> not a cpuhp callback because both take the cpuhp lock.
> Whenever a new MSC has been probed, the mpam_enable() work is scheduled
> to test if all the MSCs have been probed. If probing fails, mpam_disable()
> is scheduled to unregister the cpuhp callbacks and free memory.
> 
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Removed register bounds check. If the firmware tables are wrong the
>     resulting translation fault should be enough to debug this.
>   * Removed '&' in front of a function pointer.
>   * Pulled mpam_disable() into this patch.
>   * Disable mpam when probing fails to avoid extra work on broken platforms.
>   * Added mpam_disbale_reason as there are now two non-debug reasons for this
>     to happen.
> ---
>   drivers/resctrl/mpam_devices.c  | 173 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_internal.h |   5 +
>   2 files changed, 177 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


