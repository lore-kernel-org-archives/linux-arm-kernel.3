Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A5C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnVQL+oGYE/yquJC0x3nJUckBQQoVnrR8qx6ncktlCE=; b=u3QLWL1hvvshSdjDCw/wLV9GrA
	d1AzbZT78Vy4FWQenZSRfLXGn9zNHAd2k3Frl/xW7Q7wNKz1LrzQtOkaEHnqKElbvuS2FibbTsmaw
	usQ1nRxvWqsKdBA+EU2vYPySDNEjl5dF6Q0qo0GEu1NO2zpW06ml9VNh/2VrIcr/yBbdBHMfPaNjO
	EEgbY2c6LQwJC1vFK1mYdlb3BZMnIljwYgehPPBujnLuhOsNEeK/7KCibc7xyyypieLvURQpS0Edr
	LQjhY6QY5sCt787szgeMlL5C0nD2kOf9JghUxuso47lxSpVo/QTI+PEHYG3WuHL9pejEUGOXY3RCg
	2bQAzcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd7-000000033v9-42Z6;
	Wed, 26 Feb 2025 09:23:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDJv-000000030H9-1Sv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:03:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394036c0efso41443085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560589; x=1741165389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnVQL+oGYE/yquJC0x3nJUckBQQoVnrR8qx6ncktlCE=;
        b=WZo8WMSnw3QPFRVcmBXjIrbC/mhxVNpKRpe8W+WgoiJm/asb21v5CG6lhyZbZxJq/B
         5h5EMyOfSdsw4+OD/TjWTBNsH7mFNRMjJtQFOcY5m0VjVFTpq48W08WrsuB+eBNa5xGq
         Lm5RYvubpsG44tiiLYv9EykuYu4sbAjQ3WLJ1wzJaZMkhHpkX1pI3cxicIW1yWmWPJbT
         OgSTy9xHDCoUKvVlUuBV/Srxzw/A1ieCqhgBIGUQqwerb/w/zhqREpYay47smHaFG2F5
         7ELvLB9q17A7LrsLiNZSIPkxU8BT3Q06rW9p6ewrv50w/cEFome2nD+RchJfay9W4sGk
         Mi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560589; x=1741165389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnVQL+oGYE/yquJC0x3nJUckBQQoVnrR8qx6ncktlCE=;
        b=MYUp/bbxiH6SVD1a+DbORr8OZUQKhQPKZIAcwsIaX7gV3T2s/wHzrm/WU3DQeRlTup
         RlnEHoKxQmSG0Szm4ExeJFWhZljoPdX85qVDTZVewbN8vix/tqW/95KGchFpQBDF1RqN
         EzwQDm8X6dAZsY+saoARfQ0WdbBBq76zET0srVJ/mzbUZT8eb0/YRY81Fvqul63LTlat
         Joza2Vk1l2lwHwxcT321G7JXKPdyRJoXKtrvt3VWeA6FQRXZas2w0XYu94e175m/Dz/O
         6BlDoRAkWAp488pN/5Zb1Nz/XQZrmhWo2xxMVS9bG8RA2yb4dbArYd62OvDOJueqdNW1
         bpCg==
X-Forwarded-Encrypted: i=1; AJvYcCXrUC/1PSK3JLdOLV+NAI7t673DU2d3jp3QblOUgVjmnznr5eleUqpXonCmCE7IOE6qIiA674oRmpi86jxjiZol@lists.infradead.org
X-Gm-Message-State: AOJu0YwQiB3AwjOycCNjSSZeWH+BVoNdVLrU+j3f+krfvI0xu1Vfsa2e
	j82K2+4xcE7DgaELN16cmn0kFpvetkDoeX5W9mk/kdhhgWYf/1GQ1Z/ibvVDxOs=
X-Gm-Gg: ASbGncuSBlYLcMbQ3LdaoKU5w6HzjPwRXLxlN8QCMn8y0Qi1jZcc9z4EooWvb9uh2TO
	lBT9OhnHEiOPGUB6mVDS7YSicwuZbvFH2CjYdk5mg+dXxFjEOrzL1ddfd9KRxgFoqIg7AvZM7fN
	crUHMAtnGSqJJN+h5kfDKcY6GC0K4CywQMD+KThnrnAtW0GDsF5DmpjgR2URKNa7Pxn9/4Ssc7v
	MYrLVIBxXztgXM6eHZuad4PxAg5q+PIJggmupjjrBHOhzMopWrS8b8oNk7H309JVlhmHkb9IEhn
	exV7R1PRlg4C+HGqKoG3PGPh5hVUJBUWzg==
X-Google-Smtp-Source: AGHT+IEekDVoFKRzdCEBX1ap/zei/0aIH/Zy556MgAtLsIVJrpJvSHL/Ac8LxWjacR7hlg4AP+b/1A==
X-Received: by 2002:a05:600c:444e:b0:439:31e0:d9a5 with SMTP id 5b1f17b1804b1-43ab9016a21mr17679685e9.22.1740560589385;
        Wed, 26 Feb 2025 01:03:09 -0800 (PST)
Received: from [192.168.1.247] ([145.224.66.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc1cbsm4844675f8f.92.2025.02.26.01.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 01:03:08 -0800 (PST)
Message-ID: <b22731f7-3750-4bbb-b3ac-5e1cc27239e7@linaro.org>
Date: Wed, 26 Feb 2025 09:03:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/10] Coresight: Add Coresight TMC Control Unit
 driver
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
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
 <627fdd72-4383-4172-9a51-c77ea32b7c60@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <627fdd72-4383-4172-9a51-c77ea32b7c60@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_010311_404706_257C63B7 
X-CRM114-Status: GOOD (  34.97  )
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



On 26/02/2025 7:05 am, Jie Gan wrote:
> 
> 
> On 2/26/2025 12:13 PM, Jie Gan wrote:
>> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous 
>> configuration
>> registers to control various features related to TMC ETR device.
>>
> 
> [...]
> Hi, James
> 
> Sorry for the mistake, I just found I forget to add the co-developed-by 
> tag to patch(5/10), patch(6/10) after the division.
> 
> Do I need resend the patch series?
> 
> Jie
> 

No, no worries. If you end up sending another version you can fix it 
otherwise it's not worth it.

>>
>> Sincere thanks to James Clark for providing an excellent idea to handle
>> the trace_id of the path.
>>
>> ---
>> Changes in V14:
>> 1. Drop the reviewed-by tag for previous patch: Coresight-Introduce-a- 
>> new-struct-coresight_path
>>     due to a massive modification.
>> 2. Split the patch, Coresight-Introduce-a-new-struct-coresight_path, into
>>     four patches.
>>     - Coresight-Introduce-a-new-struct-coresight_path
>>     - Coresight-Allocate-trace-ID-after-building-the-path
>>     - Coresight-Change-to-read-the-trace-ID-from-coresight_path
>>     - Coresight-Change-functions-to-accept-the-coresight_path
>> 3. Change the type of the coresight_path_assign_trace_id function to 
>> void.
>> 4. Change the type of the path_list from struct list_head * to struct 
>> list_head to avoid
>>     extra memory allocate/free.
>> 5. Rename the file coresight-ctcu.c to coresight-ctcu-core.c to 
>> improve scalibility.
>> 6. Add pm_ops for CTCU driver.
>> 7. Rename the struct ctcu_atid_config to ctcu_etr_config to improve 
>> scalibility.
>> 8. Optimize following functions of the CTCU driver to improve 
>> readability.
>>     - ctcu_program_atid_register
>>     - __ctcu_set_etr_traceid
>> 9. Change the way to get the port number. The new solution is searching
>>     the sink device from CTCU's view.
>> 10. Add desc.access for CTCU driver.
>> Link to V13 - https://lore.kernel.org/linux-arm- 
>> msm/20250221060543.2898845-1-quic_jiegan@quicinc.com/
>> ---
>>
>> ---
>> Changes in V13:
>> 1. Move the trace_id callback to coresight_ops to simplify the code.
>> Link to V12 - https://lore.kernel.org/linux-arm- 
>> msm/20250217093024.1133096-1-quic_jiegan@quicinc.com/
>> ---
>>
>> ---
>> Changes in V12:
>> 1. Update the method for allocating trace_id for perf mode.
>> Link to V11 - https://lore.kernel.org/linux-arm- 
>> msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
>> ---
>>
>> ---
>> Changes in V11:
>> 1. Add reviewed-by tag to patch(2/7), (4/7), (6/7). Patch(3/7) is
>>     contributed by James, so didnot add reviewed-by tag of James.
>> 2. Fix warning reported by kernel bot and verified with build(W=1).
>> 3. Restore to the original logic that responsible for allocate trace_id
>>     of ETM device in perf mode according to James' comment.
>> Link to V10 - https://lore.kernel.org/linux-arm- 
>> msm/20250207064213.2314482-1-quic_jiegan@quicinc.com/
>> ---
>>
>> ---
>> Changes in V10:
>> 1. Introduce a new API to allocate and read trace_id after path is built.
>> 2. Introduce a new API to allocate and read trace_id of ETM device.
>> 3. Add a new patch: [PATCH v10 3/7] Coresight: Use 
>> coresight_etm_get_trace_id() in traceid_show()
>> 4. Remove perf handle from coresight_path.
>> 5. Use u8 instead of atomic_t for traceid_refcnt.
>> 6. Optimize the part of code in CTCU drvier that is responsible for 
>> program atid register.
>> Link to V9 - https://lore.kernel.org/all/20250124072537.1801030-1- 
>> quic_jiegan@quicinc.com/
>>
>> Changes in V9:
>> 1. Rebased on tag next-20250113.
>> 2. Separate the previous trace_id patch (patch 2/5 Coresight: Add 
>> trace_id function to
>>     retrieving the trace ID) into two patches.
>> 3. Introduce a new struct coresight_path instead of cs_sink_data which 
>> was
>>     created in previous version. The coresight_path will be initialized
>>     and constructed in coresight_build_path function and released by
>>     coresight_release_path function.
>>     Detail of the struct coresight_path is shown below:
>> /**
>>   * struct coresight_path - data needed by enable/disable path
>>   * @path:               path from source to sink.
>>   * @trace_id:           trace_id of the whole path.
>>   */
>> struct coresight_path {
>>          struct list_head                *path;
>>          u8                              trace_id;
>> };
>>
>> 4. Introduce an array of atomic in CTCU driver to represent the refcnt 
>> or each
>>     enabled trace_id for each sink. The reason is there is a scenario 
>> that more
>>     than one TPDM device physically connected to the same TPDA device has
>>     been enabled. The CTCU driver must verify the refcnt before 
>> resetting the
>>     bit of the atid register according to the trace_id of the TPDA 
>> device.
>> 5. Remove redundant codes in CTCU driver.
>> 6. Add reviewed-by tag to the commit message for APB clock path(patch
>>     1/5).
>> Link to V8 - https://lore.kernel.org/all/20241226011022.1477160-1- 
>> quic_jiegan@quicinc.com/
>>
>> Changes in V8:
>> 1. Rebased on tag next-20241220.
>> 2. Use raw_spinlock_t instead of spinlock_t.
>> 3. Remove redundant codes in CTCU driver:
>>     - Eliminate unnecessary parameter validations.
>>     - Correct log level when an error occurs.
>>     - Optimize codes.
>> 4. Correct the subject prefix for DT patch.
>> 5. Collected reviewed-by tag from Konrad Dybcib for DT patch.
>> Link to V7 - https://lore.kernel.org/all/20241210031545.3468561-1- 
>> quic_jiegan@quicinc.com/
>>
>> Changes in V7:
>> 1. Rebased on tag next-20241204.
>> 2. Fix format issue for dts patch.
>>     - Padding the address part to 8 digits
>> Link to V6 - https://lore.kernel.org/linux-arm- 
>> msm/20241009112503.1851585-1-quic_jiegan@quicinc.com/
>>
>> Changes in V6:
>> 1. Collected reviewed-by tag from Rob for dt-binding patch.
>> 2. Rebased on tag next-20241008.
>> 3. Dropped all depends-on tags.
>> Link to V5 - https://lore.kernel.org/linux-arm- 
>> msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/
>>
>> Changes in V5:
>> 1. Fix the format issue for description paragrah in dt binding file.
>> 2. Previous discussion for why use "in-ports" property instead of 
>> "ports".
>> Link to V4 - https://lore.kernel.org/linux-arm- 
>> msm/20240828012706.543605-1-quic_jiegan@quicinc.com/
>>
>> Changes in V4:
>> 1. Add TMC description in binding file.
>> 2. Restrict the number of ports for the CTCU device to a range of 0 to 
>> 1 in the binding file,
>>     because the maximum number of CTCU devices is 2 for existing 
>> projects.
>> Link to V3 - https://lore.kernel.org/linux-arm- 
>> kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/
>>
>> Changes in V3:
>> 1. Rename the device to Coresight TMC Control Unit(CTCU).
>> 2. Introduce a new way to define the platform related configs. The new
>>     structure, qcom_ctcu_config, is used to store configurations specific
>>     to a platform. Each platform should have its own qcom_ctcu_config 
>> structure.
>> 3. In perf mode, the ETM devices allocate their trace IDs using the
>>     perf_sink_id_map. In sysfs mode, the ETM devices allocate their trace
>>     IDs using the id_map_default.
>> 4. Considering the scenario where both ETR devices might be enabled 
>> simultaneously
>>     with multiple sources, retrieving and using trace IDs instead of 
>> id_map is more effective
>>     for the CTCU device in sysfs mode. For example, We can configure 
>> one ETR as sink for high
>>     throughput trace data like ETM and another ETR for low throughput 
>> trace data like STM.
>>     In this case, STM data won’t be flushed out by ETM data quickly. 
>> However, if we use id_map to
>>     manage the trace IDs, we need to create a separate id_map for each 
>> ETR device. Addtionally, We
>>     would need to iterate through the entire id_map for each 
>> configuration.
>> 5. Add support for apb's clock name "apb". If the function fails to 
>> obtain the clock with
>>     the name "apb_pclk", it will attempt to acquire the clock with the 
>> name "apb".
>> Link to V2 - https://lore.kernel.org/linux-arm- 
>> msm/20240705090049.1656986-1-quic_jiegan@quicinc.com/T/#t
>>
>> Changes in V2:
>> 1. Rename the device to Coresight Control Unit.
>> 2. Introduce the trace_id function pointer to address the challeng how to
>>     properly collect the trace ID of the device.
>> 3. Introduce a new way to define the qcom,ccu-atid-offset property in
>> device tree.
>> 4. Disabling the filter function blocked on acquiring the ATID-offset,
>>     which will be addressed in a separate patch once it’s ready.
>> Link to V1 - https://lore.kernel.org/lkml/20240618072726.3767974-1- 
>> quic_jiegan@quicinc.com/T/#t
>> ---
>>
>> James Clark (1):
>>    Coresight: Use coresight_etm_get_trace_id() in traceid_show()
>>
>> Jie Gan (9):
>>    Coresight: Add support for new APB clock name
>>    Coresight: Add trace_id function to retrieving the trace ID
>>    Coresight: Introduce a new struct coresight_path
>>    Coresight: Move trace_id to coresight_path and allocate it after
>>      building the path
>>    Coresight: Change to read the trace ID from coresight_path
>>    Coresight: Change functions to accept the coresight_path
>>    dt-bindings: arm: Add Coresight TMC Control Unit hardware
>>    Coresight: Add Coresight TMC Control Unit driver
>>    arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 +++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++
>>   drivers/hwtracing/coresight/Kconfig           |  12 +
>>   drivers/hwtracing/coresight/Makefile          |   2 +
>>   drivers/hwtracing/coresight/coresight-core.c  | 122 +++++--
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 326 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  39 +++
>>   drivers/hwtracing/coresight/coresight-dummy.c |  15 +-
>>   .../hwtracing/coresight/coresight-etm-perf.c  |  27 +-
>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>   .../coresight/coresight-etm3x-core.c          |  55 +--
>>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>>   .../coresight/coresight-etm4x-core.c          |  55 +--
>>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>   drivers/hwtracing/coresight/coresight-priv.h  |  14 +-
>>   drivers/hwtracing/coresight/coresight-stm.c   |  13 +-
>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
>>   drivers/hwtracing/coresight/coresight-tpda.c  |  11 +
>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   2 +-
>>   include/linux/coresight.h                     |  27 +-
>>   22 files changed, 824 insertions(+), 161 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/arm/ 
>> qcom,coresight-ctcu.yaml
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-core.c
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>
> 


