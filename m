Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADEEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMCXuuWhvs80SUVrpcx0tfx4I7iY46SU/rJlaw9irZ0=; b=lKbfYuiCFgq2XmGjKMotk+gaVr
	IliFQS8eZxGkasykehfQwRZ5R10f0fekX8cJW1avMhaiE/C7X57xrFqVhzN9V7cKG0tr3wtilDh3O
	eJOLaZSr+iYRGXlr0FQOljTRY3qiJLIqsP4WR/Ks9zzm0Jx/Z9nJa3rKN4LYxDs+KNWTPDMad7fID
	sL7f1vHA5slLebcbk3ND9T1t4DiHi96Aos7lIBpXjdeLJRXbhpWGbgj7SxCau8pFO7BQf9hSMSZlK
	AHjEcz0k8ByqqHyxrc/yB/yF1Tn3k0bBgkEx7D2Gr9nR96ubOubqtyQ+E+Rv4zAhFZ08gnlb5t3+4
	TBG6bwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibq2-0000000BhwX-45Vt;
	Thu, 13 Feb 2025 16:13:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibeU-0000000Bf4U-1LRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:01:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4394a823036so11808275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 08:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739462481; x=1740067281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMCXuuWhvs80SUVrpcx0tfx4I7iY46SU/rJlaw9irZ0=;
        b=a/g1r0HvLvAW5wwODcqGgNK8eN5BkNAWUJdXcmC6SDlN/chTBEx4NfdTVxQsKWiCuz
         eTxXsycgsfN92Bl55tVaa694AzRyyx3zsXq2Al0vbM6QG8JUHOV1PhbEI44r+S7bG8Q8
         VuIb1/d+EJhLfTEOO6ARBKjPiNIdzI+f7ggnPRpJMPxEW6Ib5Ko6+8vDeEP1cTxP2UMN
         ETSamBzKlXkeZneIInxLZR5R7s7R+BBsatBvomfgtWxSbKUcragh5hlq1tyqx4FH7hok
         elbql3n5GVYvDamyStf5/C9wLGf/CT+sNUWICDGh5sWnz87/CLaw7nPyF867pJ34qi/w
         m17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462481; x=1740067281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMCXuuWhvs80SUVrpcx0tfx4I7iY46SU/rJlaw9irZ0=;
        b=bye7FbA0znuspb6FhjeIE5u1s1lhVeWXMjgTE5xE+9TLzIB5bOFogSQBjM6II1c7kO
         wYHFx4JICeaa1Hj1eTESIJ58JimZFxR8FgR70W4v6mLPXWity3TZvAVVFRhtAbRV9w9E
         aIu7s2K/Sa2KNL7/mk8bEINfISS7JRAMKa/ltuHUrLaYHOfOxbN+HgwrJtVErDWdCiMG
         G+tBgRgP7/Lu/rJj42I4C6HR/XCmzRNkB2SADmoUCjCIPrEdfILdd/pJ4+G3oX/YHjsG
         Dbjp7XjoYIhR0EOsAT5aneLCh+03qrdex7llYtGkWtK19cT2F4gZCZ4fWUgZe7uuP6Ot
         cOgw==
X-Forwarded-Encrypted: i=1; AJvYcCXX8MHdRq1V/FN2Dz5LarZNFlGYTarKyV65ewDuIK4HnMXOh8V/KFMvuENrbnFe6gDM4Q/otxYfCBqLa2mB9clO@lists.infradead.org
X-Gm-Message-State: AOJu0YxpYwLU0gSkSiN674zivWZAMO7OoE9+gvYLixFSu1dmJ2Um1ix0
	gF6AUXRPQfislPYs08WbY9r/PH4F6bdFD1AKVBduqTqrVzZC7IZz3xV6Jqyx0vw=
X-Gm-Gg: ASbGncvx8URV6ncJ8TtXvQFQddiupdCFvga/zz/yeChq4niLxmFpgRmP6c3lcQ597XE
	gr7myrQL+qzy6519X8Le+xKvTaFmQLgEfETe6q7R/4O9rPp+wfb/qhyGLYiEiu8DcMI/VZyGfqX
	0YXQn0RpFriERUvmpPmzd6CZQJFe/haBXOoQKw2Fn1VAgYI9EjihYhvGSt/sSzmkXGIu2L7cdi4
	Z7FPr0S8V7p9MNkAw1Q4P/TbWuShJdICi7qYMvXtjLW3pNw8zN9XYW44wXIIspDPeElA98HINHK
	v8PdNzARo1e8LWmQcfJomgFRXw==
X-Google-Smtp-Source: AGHT+IHXadwT9zoo54My1hxvFDl1i3QimhcQUXkZEa3t507OLocLzzGFtocOFYXp17+rEQxmKj0CxA==
X-Received: by 2002:a05:600c:46c7:b0:439:35bb:a5eb with SMTP id 5b1f17b1804b1-439581604d6mr85236315e9.4.1739462480296;
        Thu, 13 Feb 2025 08:01:20 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396180f231sm21319985e9.16.2025.02.13.08.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:01:19 -0800 (PST)
Message-ID: <b921e582-fa82-4b97-a5fd-29f52f4c7a85@linaro.org>
Date: Thu, 13 Feb 2025 16:01:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_080122_365774_3AFEC683 
X-CRM114-Status: GOOD (  42.83  )
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



On 07/02/2025 6:42 am, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> Based on the trace id which is programed in CTCU ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer
> while other trace data gets ignored. The number of CTCU ATID registers
> depends on the number of defined TMC ETR devices. For example, two TMC
> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
> and ETR1 with ETR1ATID0-ETRATID3.
> 
> The significant challenge in enabling the data filter function is how
> to collect the trace ID of the source device. The introduction of
> trace_id callback function addresses this challenge. The callback function
> collects trace ID of the device and return it back. The trace ID will be
> stored in the structure called coresight_path and transmitted to helper
> and sink devices.
> 
> The coresight_path structure is created to address how to transmit
> parameters needs by coresight_enable_path/coresight_disbale_path
> functions.
> 
> Here is the definition of the struct coresight_path:
> /**
>   * struct coresight_path - data needed by enable/disable path
>   * @path:               path from source to sink.
>   * @trace_id:           trace_id of the whole path.
>   */
> struct coresight_path {
>          struct list_head                *path;
>          u8                              trace_id;
> };
> 
> The atid_offset mentioned before is the offset to ATID register in CTCU
> device.
> 
> Enabling the source device will configure one bit in the ATID register based
> on its trace ID.
> Disabling the source devices will reset the bit in the AITD register
> based on its trace ID.
> 
> Useage:
> Enable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the enablement:
> ETR0ATID0:
> 31..................543210
> ==========================
> 0000000000000000000000...0
> ==========================
> 
> Bitmap after the enablement:
> 31..................543210
> ==========================
> 0000000000000...0000100000
> ==========================
> 
> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
> STM device.
> 
> Disable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the disablement:
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0100000
> =========================
> 
> Bitmap after the disablement
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0000000
> =========================
> 
> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
> device.
> 
> Sincere thanks to James Clark for providing an excellent idea to handle
> the trace_id of the path.
> 
> Changes in V2:
> 1. Rename the device to Coresight Control Unit.
> 2. Introduce the trace_id function pointer to address the challeng how to
>     properly collect the trace ID of the device.
> 3. Introduce a new way to define the qcom,ccu-atid-offset property in
> device tree.
> 4. Disabling the filter function blocked on acquiring the ATID-offset,
>     which will be addressed in a separate patch once it’s ready.
> Link to V1 - https://lore.kernel.org/lkml/20240618072726.3767974-1-quic_jiegan@quicinc.com/T/#t
> 
> Changes in V3:
> 1. Rename the device to Coresight TMC Control Unit(CTCU).
> 2. Introduce a new way to define the platform related configs. The new
>     structure, qcom_ctcu_config, is used to store configurations specific
>     to a platform. Each platform should have its own qcom_ctcu_config structure.
> 3. In perf mode, the ETM devices allocate their trace IDs using the
>     perf_sink_id_map. In sysfs mode, the ETM devices allocate their trace
>     IDs using the id_map_default.
> 4. Considering the scenario where both ETR devices might be enabled simultaneously
>     with multiple sources, retrieving and using trace IDs instead of id_map is more effective
>     for the CTCU device in sysfs mode. For example, We can configure one ETR as sink for high
>     throughput trace data like ETM and another ETR for low throughput trace data like STM.
>     In this case, STM data won’t be flushed out by ETM data quickly. However, if we use id_map to
>     manage the trace IDs, we need to create a separate id_map for each ETR device. Addtionally, We
>     would need to iterate through the entire id_map for each configuration.
> 5. Add support for apb's clock name "apb". If the function fails to obtain the clock with
>     the name "apb_pclk", it will attempt to acquire the clock with the name "apb".
> Link to V2 - https://lore.kernel.org/linux-arm-msm/20240705090049.1656986-1-quic_jiegan@quicinc.com/T/#t
> 
> Changes in V4:
> 1. Add TMC description in binding file.
> 2. Restrict the number of ports for the CTCU device to a range of 0 to 1 in the binding file,
>     because the maximum number of CTCU devices is 2 for existing projects.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/
> 
> Changes in V5:
> 1. Fix the format issue for description paragrah in dt binding file.
> 2. Previous discussion for why use "in-ports" property instead of "ports".
> Link to V4 - https://lore.kernel.org/linux-arm-msm/20240828012706.543605-1-quic_jiegan@quicinc.com/
> 
> Changes in V6:
> 1. Collected reviewed-by tag from Rob for dt-binding patch.
> 2. Rebased on tag next-20241008.
> 3. Dropped all depends-on tags.
> Link to V5 - https://lore.kernel.org/linux-arm-msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/
> 
> Changes in V7:
> 1. Rebased on tag next-20241204.
> 2. Fix format issue for dts patch.
>     - Padding the address part to 8 digits
> Link to V6 - https://lore.kernel.org/linux-arm-msm/20241009112503.1851585-1-quic_jiegan@quicinc.com/
> 
> Changes in V8:
> 1. Rebased on tag next-20241220.
> 2. Use raw_spinlock_t instead of spinlock_t.
> 3. Remove redundant codes in CTCU driver:
>     - Eliminate unnecessary parameter validations.
>     - Correct log level when an error occurs.
>     - Optimize codes.
> 4. Correct the subject prefix for DT patch.
> 5. Collected reviewed-by tag from Konrad Dybcib for DT patch.
> Link to V7 - https://lore.kernel.org/all/20241210031545.3468561-1-quic_jiegan@quicinc.com/
> 
> Changes in V9:
> 1. Rebased on tag next-20250113.
> 2. Separate the previous trace_id patch (patch 2/5 Coresight: Add trace_id function to
>     retrieving the trace ID) into two patches.
> 3. Introduce a new struct coresight_path instead of cs_sink_data which was
>     created in previous version. The coresight_path will be initialized
>     and constructed in coresight_build_path function and released by
>     coresight_release_path function.
>     Detail of the struct coresight_path is shown below:
> /**
>   * struct coresight_path - data needed by enable/disable path
>   * @path:               path from source to sink.
>   * @trace_id:           trace_id of the whole path.
>   */
> struct coresight_path {
>          struct list_head                *path;
>          u8                              trace_id;
> };
> 
> 4. Introduce an array of atomic in CTCU driver to represent the refcnt or each
>     enabled trace_id for each sink. The reason is there is a scenario that more
>     than one TPDM device physically connected to the same TPDA device has
>     been enabled. The CTCU driver must verify the refcnt before resetting the
>     bit of the atid register according to the trace_id of the TPDA device.
> 5. Remove redundant codes in CTCU driver.
> 6. Add reviewed-by tag to the commit message for APB clock path(patch
>     1/5).
> Link to V8 - https://lore.kernel.org/all/20241226011022.1477160-1-quic_jiegan@quicinc.com/
> 
> Changes in V10:
> 1. Introduce a new API to allocate and read trace_id after path is built.
> 2. Introduce a new API to allocate and read trace_id of ETM device.
> 3. Add a new patch: [PATCH v10 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
> 4. Remove perf handle from coresight_path.
> 5. Use u8 instead of atomic_t for traceid_refcnt.
> 6. Optimize the part of code in CTCU drvier that is responsible for program atid register.
> Link to V9 - https://lore.kernel.org/all/20250124072537.1801030-1-quic_jiegan@quicinc.com/
> 
> Jie Gan (7):
>    Coresight: Add support for new APB clock name
>    Coresight: Add trace_id function to retrieving the trace ID
>    Coresight: Use coresight_etm_get_trace_id() in traceid_show()
>    Coresight: Introduce a new struct coresight_path
>    dt-bindings: arm: Add Coresight TMC Control Unit hardware
>    Coresight: Add Coresight TMC Control Unit driver
>    arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 ++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++++
>   drivers/hwtracing/coresight/Kconfig           |  12 +
>   drivers/hwtracing/coresight/Makefile          |   1 +
>   drivers/hwtracing/coresight/coresight-core.c  | 133 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.c  | 268 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  24 ++
>   drivers/hwtracing/coresight/coresight-dummy.c |  16 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +-
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  55 +---
>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>   .../coresight/coresight-etm4x-core.c          |  55 +---
>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |  14 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |  11 +
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   include/linux/coresight.h                     |  30 +-
>   22 files changed, 765 insertions(+), 164 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 

Just one small comment, and the kernel test bot report to fix. Otherwise 
looks good to me.

Reviewed-by: James Clark <james.clark@linaro.org>


