Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41399E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grMcytodYJK+yAAtJTqT9EcYuraadbQypdSGHtPZYzg=; b=3LFr0ZJyMCL7TBtlnwJ+9YcY2i
	j+MBdgfNZlAiJDhh0l7rB07uoJEDZneBCzO0JpUOuFcC5NTBCOMqoI0CoOApWGnaHXLGlxtLF1jrp
	/Yc2nvIVmrVXIJmTXFflq/3jrNmzNLjF/0RIWNyPsxxKDt5c3IRml4U/G/4jbaXcX1K0P5Vdl/vze
	TW2xDvPELSjQW96jQY+Y6bRqvBts9Lj5optKeEVqPUiYUtdLwlINz0kRWv2fIr/M+39ClXk/wb2UR
	ZCCizAjnBPfY57tamHvV5fppHYwzfoRB0L25S841Ao84tHVzqrEpoAkXIeu3hiH/M/MuaUTHyuauS
	r/tUf1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInPW-0000000CMFR-0iXW;
	Wed, 04 Dec 2024 11:19:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInOV-0000000CM2l-3Nsq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:18:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so2888158f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 03:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733311090; x=1733915890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grMcytodYJK+yAAtJTqT9EcYuraadbQypdSGHtPZYzg=;
        b=DDwy/gRF3Ye2gCDYLnJyzg2eN1Js3SGfjC9CzMLIcHMvWqWaRpuxmW8z1PynC2l1fc
         sMGEuLdGzj5RtpLQbn1BybCSJHqf39eRx87fSkLwwhJc34mrhFk6Fqw95icI+vY84yIt
         xX830eJQ9+/3+NwPr8HIa8LMAOCDZKDh+WeVqERY8G5+8pfAIEw24uPVxjjVtcxMFzD/
         k74NiaJQwab3QUr2KB4kjxZMQhuWBVC2YlpNGk4AIVQX1THSb0HaGV5YPwhbdgiQKvAt
         xmoE7SGq90K/DF19EM/Pj3CCPXzQBQsbt43XDFtcUzSl/tu96/dX46da86sj0c3GCXlR
         Tpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733311090; x=1733915890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grMcytodYJK+yAAtJTqT9EcYuraadbQypdSGHtPZYzg=;
        b=uwjy1lOVx7CKPsFhyjlTa8ubuGuNvH2XkWn25pgqG35b1kP9YWfLHHrj8hihWIWBzE
         VQ+mEjrCUxa6veY7yrmUL6wVg7bJhiq0gbBsZomQrd6zvfHB5R2gJTxluzBguxuLYk2L
         W0HBBOJOyoMwGbkp8AdEXkHiEr2/9KFXaHIbDYsZHetRo0str7H23inmJ1cWHsem/+0Y
         Wj92j7G38YPlaVjYnwFGXLubVIdfZ3UVnIQgEIMyM63yFNho+dirJmaOOpy0mHXpob+e
         S5pCTM7myrvNQ8+AGjFR/D0ySUBBHXhzS7IGXb7cJQ2jpTJtl1xmBSM9njdIiql/h5C7
         SXvA==
X-Gm-Message-State: AOJu0Yw+xeRYbMSpyWkTsS7EGeEsVT01YqXfsKaMCPE9ZnJh0pNc1Ejs
	YPf/WE73JfNcc63om/oUfc1WzgzyU2hnuWwjMGsLZM1Lb1zwq8ImooxLfOw3GtY=
X-Gm-Gg: ASbGncsvEysLjXHtXeKWst/C3nWS5xPgl9CFvtrTch+2Hb/6u8XhzPij8zH1TB+CYxd
	Dh/01CvvSL3nD3LKDYEf7jsgyI4PUpciFXAVie7ZlD53hDbATIFGslkxkg+GXc3VqvVrdSA8OFw
	nJNTmRIvayXr2nCur9iiPJ6nUAHnQpWpdVMmBolBwDerpFXEflooPqwUy+ZGi5J6uY2qHMKHvLA
	DkqIUS33YghmHzWFUIkZnssry/1H2pzLWsgYU9370LZwI9+o4Uio6ewoXfPfw==
X-Google-Smtp-Source: AGHT+IEboZtlYwyDwWy2/nz4tPekz9TBu2kwWpNNoUvNEhX86KgTe/gaLtaugdikQPzy6OgU/p9TaA==
X-Received: by 2002:a5d:64e4:0:b0:385:f47b:1508 with SMTP id ffacd0b85a97d-385fd3f35efmr5902451f8f.35.1733311089628;
        Wed, 04 Dec 2024 03:18:09 -0800 (PST)
Received: from [192.168.68.163] ([209.198.129.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e9c075e8sm11523453f8f.7.2024.12.04.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 03:18:09 -0800 (PST)
Message-ID: <91bb1592-4311-4afe-a728-fc9000b04aca@linaro.org>
Date: Wed, 4 Dec 2024 11:18:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: arm coresight: sysfsmode testing
To: Shuah Khan <skhan@linuxfoundation.org>,
 Linu Cherian <lcherian@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
References: <20241129083813.3056909-1-lcherian@marvell.com>
 <115bb206-8401-4475-977d-7dd98a2b872c@linuxfoundation.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <115bb206-8401-4475-977d-7dd98a2b872c@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_031811_844560_F549031E 
X-CRM114-Status: GOOD (  24.96  )
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



On 04/12/2024 12:23 am, Shuah Khan wrote:
> On 11/29/24 01:38, Linu Cherian wrote:
>> Add sysfs mode selftest for ARM Coresight hardware tracer.
> 
> Please add details on what this test does in here. Include
> the output from the test?
> 
> Does this test have dependencies on config? If it does, does
> this test detect and skip if config isn't enabled?
> 

Without the config the test won't find any devices and it will still 
pass. But yes it would still be good to explicitly mark the dependency.

>>
>> Signed-off-by: Linu Cherian <lcherian@marvell.com>
>> ---
>>   .../drivers/hwtracing/coresight/Makefile      |   5 +
>>   .../hwtracing/coresight/sysfs_test_trace.sh   | 144 ++++++++++++++++++
>>   2 files changed, 149 insertions(+)
>>   create mode 100644 tools/testing/selftests/drivers/hwtracing/ 
>> coresight/Makefile
>>   create mode 100755 tools/testing/selftests/drivers/hwtracing/ 
>> coresight/sysfs_test_trace.sh
>>
>> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/ 
>> Makefile b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
>> new file mode 100644
>> index 000000000000..7dc68ae1c0a9
>> --- /dev/null
>> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +TEST_PROGS = sysfs_test_trace.sh
>> +
>> +include ../../../lib.mk
>> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/ 
>> sysfs_test_trace.sh b/tools/testing/selftests/drivers/hwtracing/ 
>> coresight/sysfs_test_trace.sh
>> new file mode 100755
>> index 000000000000..0d6307fff1d2
>> --- /dev/null
>> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/ 
>> sysfs_test_trace.sh
>> @@ -0,0 +1,144 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (C) 2024 Marvell.
>> +
>> +# Test Arm CoreSight trace capture in sysfs mode
>> +# Based on tools/perf/tests/shell/test_arm_coresight.sh
>> +
>> +glb_err=0
>> +
>> +arm_cs_report() {
>> +    if [ $2 != 0 ]; then
>> +        echo "$1: FAIL"
>> +        glb_err=$2
>> +    else
>> +        echo "$1: PASS"
>> +    fi
>> +}
>> +
>> +is_device_sink() {
>> +    # If the node of "enable_sink" is existed under the device path, 
>> this
>> +    # means the device is a sink device.
>> +
>> +    if [ -e "$1/enable_sink" ]; then
>> +
>> +        return 0
>> +    else
>> +        return 1
>> +    fi
>> +}
>> +
>> +# Configure sink for buffer mode
>> +cfg_sink_buf_mode() {
>> +    sink_dev=$1
>> +    mode=$2
>> +    # Set buffer mode if supported
>> +    if [ -e "$sink_dev/buf_modes_available" ]; then
>> +        cat $sink_dev/buf_modes_available | grep -E -q $mode
>> +        if [ $? -eq 0 ]; then
>> +            echo $mode > $sink_dev/buf_mode_preferred
>> +            return 0
>> +        fi
>> +    fi
>> +
>> +    return 1
>> +}
>> +
>> +run_app() {
>> +
>> +    taskset -c $1 dd if=/dev/urandom  of=/dev/null bs=1M count=64
>> +}
>> +
>> +sysfs_trace() {
>> +    src_dev=$1
>> +    sink_dev=$2
>> +    cpu=$3
>> +
>> +    # Enable sink device
>> +    echo 1 > $sink_dev/enable_sink
>> +    # Enable source device
>> +    echo 1 > $src_dev/enable_source
>> +
>> +    # Run app to be traced
>> +    run_app $cpu
>> +
>> +    # Read back trace data
>> +    dd if=/dev/$sink_dev_name of=/tmp/tracedata
>> +
>> +    # Verify if read is successful
>> +    err=$?
>> +
>> +    # Disable source device
>> +    echo 0 > $src_dev/enable_source
>> +
>> +    # Diskable sink device
>> +    echo 0 > $sink_dev/enable_sink
>> +
>> +    arm_cs_report "CoreSight path testing (CPU$cpu -> 
>> $sink_dev_name)" $err
>> +}
>> +
>> +try_sysfs_trace_resrv_buf() {
>> +    src_dev=$1
>> +    sink_dev=$2
>> +    cpu=$3
>> +
>> +    # Configure the resrved buffer mode if available
>> +    cfg_sink_buf_mode $sink_dev "resrv"
>> +    if [ $? -eq 0 ]; then
>> +        echo "Running sysfs trace with resrv buf mode"
>> +        sysfs_trace $src_dev $sink_dev $cpu
>> +        # Restore buffer mode
>> +        cfg_sink_buf_mode $sink_dev "auto"
>> +        if [ $? -eq 1 ]; then
>> +            echo "Failed to restore default buf mode"
>> +        fi
>> +    fi
>> +}
>> +
>> +arm_cs_iterate_devices() {
>> +    src_dev=$1
>> +    cpu=$3
>> +    for cdev in $2/connections/out\:*; do
>> +
>> +        # Skip testing if it's not a directory
>> +        ! [ -d $cdev ] && continue;
>> +
>> +        # Read out its symbol link file name
>> +        sink_dev=`readlink -f $cdev`
>> +
>> +        # Extract device name from path, e.g.
>> +        #   sink_dev = '/sys/devices/platform/20010000.etf/tmc_etf0'
>> +        #     `> sink_dev_name = 'tmc_etf0'
>> +        sink_dev_name=$(basename $sink_dev)
>> +
>> +        if is_device_sink $sink_dev; then
>> +            # Run trace with resrv buf mode (if available)
>> +            try_sysfs_trace_resrv_buf $src_dev $sink_dev $cpu
>> +
>> +            # Run the default mode
>> +            echo "Running sysfs trace with default settings"
>> +            sysfs_trace $src_dev $sink_dev $cpu
>> +        fi
>> +
>> +        arm_cs_iterate_devices $src_dev $cdev $cpu
>> +
>> +    done
>> +}
>> +
>> +arm_cs_etm_traverse_path_test() {
>> +    # Iterate for every ETM device
>> +    for dev in /sys/bus/event_source/devices/cs_etm/cpu*; do
>> +        # Canonicalize the path
>> +        dev=`readlink -f $dev`
>> +
>> +        # Find the ETM device belonging to which CPU
>> +        cpu=`cat $dev/cpu`
>> +
>> +        # Use depth-first search (DFS) to iterate outputs
>> +        arm_cs_iterate_devices $dev $dev $cpu
>> +    done
>> +}
>> +
>> +arm_cs_etm_traverse_path_test
>> +
>> +exit $glb_err
> 
> thanks,
> -- Shuah
> 


