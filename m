Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43CE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyMV4bLyaktItEEO0O2hHQkcftcybGuVejNfsC7KtYY=; b=YWRIWNlt7hEP9Yl2YWSEZPkhDZ
	Mu4Zn3iGSjvQTiV09eZrR41Td1yoQj1mlkZ8ZonUEhAxhv2cGb6YwQncmqVVpRECb8TNtvl6Hj1uU
	pR2rES60E8UvBCyvNkG1PCe3PGBL+6TJdeBJA91d9HzQQb9B2by41DmkJ2zzP6y1LZlt7OpejYUH2
	22U/J3bcebTuBDBy4SBPU4LDyZ8ToD2LqzZQYSe8Wx8DhQixhX4I90Jw5rjbE6SJkuEllnWFNJWpU
	sQriXAZ56e1szu0/5ceckp4DgJrRJEg6S9AeW4sShBO8fiQjsqVzs11drGDdyXtMFD8alyQNYV0nl
	TkJwwFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInNE-0000000CLlm-1u6H;
	Wed, 04 Dec 2024 11:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInME-0000000CLZ1-450K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 11:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PyMV4bLyaktItEEO0O2hHQkcftcybGuVejNfsC7KtYY=; b=k0oabpdp/QpKc8oQdVhBVHKShz
	9o3fiqLC/SmfUUtG5wFfYWtJtvAEjBdCZlDlUV1O1du4L62jvpXyG5BzdJhgtoChMkVPzuUpKq7MI
	WFwFaXcqwdlFSz4jVfw4CiPHU9qm6kH7Ce/mqJShGHXrLKKbuQ/qqCICf7lBVFNkTHNXoJqkVgIlg
	JkUFqcCzj6x9Jjm7A19Ht0ITjkE0V+0V64V/gMuixtxYxXR5JRYtWf3T81DV/yvC9ynSebyM3/BzH
	7ajWcFeKdJTzCbEMc7Cb9MhZu7XaMsEMIXug7bJh6QorHlBcw7HNMZz4decteuzR2clDAMeyOnesH
	x1vm2YWw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInMB-00000002aMI-0DUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:15:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso61061725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310944; x=1733915744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PyMV4bLyaktItEEO0O2hHQkcftcybGuVejNfsC7KtYY=;
        b=sqCVzYBQq9wRfVv9CpqT+3fqrK8ncKFCyZmwlRZQmB+wJVtQu413cwcYi/4SamM8r8
         4gE9AC7SyF0ENDlqljyrGqkJbOZcNqfWIteAQad15TYCWWa854UzWDy0SHzs2/hjNBtJ
         aSceFQwVW9f5pmlF+avluSg+eQkQpDOjt74gLTAmMb5JOE8uE89Gcjhk5w+wHdW5EO9d
         RVUKEBO6pHBVEbsRsutEKCTL+z+goUERwBB92BTq6vMyQcUCMf+o5ycZHjAKTNVt6uxz
         fVUtr0kos/H+w/+dFZxQpbkatxuHdWy2jAm6ZpgyZr2bJaSmoB1zkV/5MKDkXmRmoFla
         nv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310944; x=1733915744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyMV4bLyaktItEEO0O2hHQkcftcybGuVejNfsC7KtYY=;
        b=L+D8rBJL3kScZ196M8/oNxtVs8+LRXpUPWa9nelP0A6chvm9RNr+Z4IuITyQWtcsRE
         urY6yFONYc9T8IH0Wl3AgLdLcupZZrEbVzz0GjPy4zXnXEA3dVGby/Jon1j8K2tzudBL
         ABcsGmgR8WHnPOpL5TUFyqGzv7oEiRbMyFJ31SBIexxZpv4KA/F3AL3xh3VL/Q2AxK89
         lb6ManjfK3d74QGYwQK2zB4U93TlTF6DGXwdWQ4TP3M8Sqcoi2oby1sqf4pZorILdw8M
         6EAVGbrk/BX8C4ayqwIh4Dvjz699XhteSZhX7At49KB6WrjNE/rWX+W5x+IH6kN0IqyF
         qHwA==
X-Gm-Message-State: AOJu0Ywey+zhDJoXDUUpZIRI7S6w1DZyncPeAW0nqNCkMRyizo1Pb3ht
	nrByzVgj9vgej7DbroI2PUmRunMDg0rFeE3YUoHjL+WST5UoZoM86m7gujz2a1Q=
X-Gm-Gg: ASbGncu/uFpypREQS3tz8SLRalPheup0vUb/jYIe2GuXxW9ojAilsYeH1Lxm4vbaICj
	0WBC4K4fgXOL5Y0zbjEtBumFDAAkmw4bsWZijmcyV9wAaWBBV+cjyLnn0fIwTYRpT0yeqC+7sUP
	NzuuyUSRLbyJwg9URD/NJCyAZR/HvPpvqWXgtNJ5eFMZtqvVhM/OPsMglfjit7XnqM3QXhvZsl3
	iR5ew2JgENWNgEKJSrl/RcwFMKT82lW+FgHijVdcpNxbknVnUJ/Bio6Sw/jwA==
X-Google-Smtp-Source: AGHT+IGfDnu2hvQw6lAXpCu8yTqKC7sSN3W0dVpbKUu+3ZC2h61wf1xZ9LgnpipofMZ5rmAaVuaEfQ==
X-Received: by 2002:a05:6000:1847:b0:385:ecdf:a30a with SMTP id ffacd0b85a97d-385fd3ee334mr5060123f8f.33.1733310943999;
        Wed, 04 Dec 2024 03:15:43 -0800 (PST)
Received: from [192.168.68.163] ([209.198.129.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385db37debdsm16833644f8f.2.2024.12.04.03.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 03:15:43 -0800 (PST)
Message-ID: <1b7aaa17-48b7-45cd-b468-ef54ca048e31@linaro.org>
Date: Wed, 4 Dec 2024 11:15:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: arm coresight: sysfsmode testing
To: Linu Cherian <lcherian@marvell.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, sgoutham@marvell.com,
 gcherian@marvell.com, Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20241129083813.3056909-1-lcherian@marvell.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241129083813.3056909-1-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111547_545692_30DFBBA4 
X-CRM114-Status: GOOD (  18.63  )
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



On 29/11/2024 8:38 am, Linu Cherian wrote:
> Add sysfs mode selftest for ARM Coresight hardware tracer.
> 
> Signed-off-by: Linu Cherian <lcherian@marvell.com>
> ---
>   .../drivers/hwtracing/coresight/Makefile      |   5 +
>   .../hwtracing/coresight/sysfs_test_trace.sh   | 144 ++++++++++++++++++
>   2 files changed, 149 insertions(+)
>   create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/Makefile

Hi Linu,

You need to add this path into TARGETS for make install to work:

  TARGETS += drivers/dma-buf
+TARGETS += drivers/hwtracing/coresight
  TARGETS += drivers/s390x/uvdevice


>   create mode 100755 tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> 
> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/Makefile b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
> new file mode 100644
> index 000000000000..7dc68ae1c0a9
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +TEST_PROGS = sysfs_test_trace.sh
> +
> +include ../../../lib.mk
> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> new file mode 100755
> index 000000000000..0d6307fff1d2
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> @@ -0,0 +1,144 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2024 Marvell.
> +
> +# Test Arm CoreSight trace capture in sysfs mode
> +# Based on tools/perf/tests/shell/test_arm_coresight.sh
> +
> +glb_err=0
> +
> +arm_cs_report() {
> +	if [ $2 != 0 ]; then
> +		echo "$1: FAIL"
> +		glb_err=$2
> +	else
> +		echo "$1: PASS"
> +	fi
> +}
> +
> +is_device_sink() {
> +	# If the node of "enable_sink" is existed under the device path, this
> +	# means the device is a sink device.
> +

Looks like you still need the skip for TPIU here the same as the Perf 
test. It's an external sink and doesn't have a readable file so the test 
fails.

With those changes, looks good. Thanks for adding the first sysfs test. 
Hopefully we can expand them more in the future.

Reviewed-by: James Clark <james.clark@linaro.org>


