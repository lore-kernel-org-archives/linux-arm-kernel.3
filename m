Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A230BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZ2TiI2Fgy0JywNyy3GepEeOSIh6F/pE/b41mnhIWbg=; b=Fa46zQbwzaTV7VOEyBd5m7xGXR
	erapCB+jKIg8XLlVpU5Q0Wfxb6eaXani46SEWpr9lMFIRlqawfcKWAtecrxqvlUO+aReUZtQhC9qw
	0avDyJlkEX8+L1sbNU1aQeyIFXnHSUZR7Syz+5dWpQqai3KjVz6ZnLLaENmWMv8PODY8mXQlbWEMf
	WEMZAZa6EDRdTP2aSNASFMksaMW19ZPeE1dDpW0HMk/lDW978hnuYHMOYjHuwcXE3by0RHfu95fP9
	ONbt35TY9afpw6TKeKX5YQ8CqycJ6PMKB7eUxfs97v7FHdf0gaTDo1v+6fSrbAxDXjFXgtYx8Y8vs
	l+6/dyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjaz-0000000ACvz-164d;
	Mon, 23 Dec 2024 14:39:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjZn-0000000ACnw-3E3f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 14:38:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385e87b25f0so3427174f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734964710; x=1735569510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZ2TiI2Fgy0JywNyy3GepEeOSIh6F/pE/b41mnhIWbg=;
        b=Qb30Xjz1Hot7YAl1ZyOpwO8xLeMeJRhylvSUkZZfCJ9yD+FBlcKEgsXkmVZz+Q38jw
         9jJ2bHi7v44vIevBtMqkwYGWNW4KViQ35p+KAWBw84JNL99AZpbhoKKhocTnLtd6mqHd
         Xn2aQlorI2oHO8U5okOsAV4Rsi6CTmcP2Hu7kB8RYJsJrBe917TjOJD69xBN9hw+MfH4
         JgeooWb+shUFl/DjrskJqxUYEefuyRGk0vyWDO0l2UdhQeIrIrFmyyfpu6Oh2urBhHfn
         IXcWDq6aliaSJoqOU/ygZ7GZ5c0ZmAWCqAKCH4swZULo98hW/XSrveS197jgcqZyoH7H
         N7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734964710; x=1735569510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ2TiI2Fgy0JywNyy3GepEeOSIh6F/pE/b41mnhIWbg=;
        b=RGjRdSOHgrXGm53lfGobiWeUaT0HApA2TzkxVD5Uh5Rk/wzbdD68wQa2G2NdTzPMdM
         95B00h76bwfReK/y2XWgIke4GOS7xR7h4bO4LF26+Vnca5XSnx5oahR0Bo777Fw9GeY8
         t74d5r2EoK1qoMGUT8AbeTHbtkpYcKEWj8pmjOXwWRQh5hW8a+n1Q7w9qui40EDStcac
         keo0iigndqjP313eAEzqLepdyUv1BL9znepXppNi6Ocx7EVNs+UXHsWyDllMQtIczqWc
         Bef/OV/g8vAXUjjlpxzxtG3AcmaQneJYAOobG9OhK2B49b0xuNiXlYeGJuRei9zLELvi
         HMHw==
X-Gm-Message-State: AOJu0YyqEH4EjOAmdvF5nYwmiS2FyIijHZYStYGeq4kvKbcl0XUpnuKD
	stP9d+DW/RZgiSDEYH9weqv+Ktpd4Mss2jZ+tiftEebPmhBVpghAXrAYs7wCPgA=
X-Gm-Gg: ASbGncvgwtjo638elgrfUrDBXnKBYiY5n0GkFsz04HcAgudPwlvVUSEuW0hcTxXmTx2
	LAXg6FRXIwwctM6jPlFd7WzXrIFgRx+KMpJcM6Al8tZfzIlQir8wB3/m9MCOgyNHQW5xRDXsvGY
	BZE6bu2BXaonWSp++1DIgAvNMwblLYX5GGwYSK2svuGC8Am/EWmh+OjM23J1QZrNS1GOzPTSS9F
	y1kTAEutttZ/QQZMR+8qHJ/2wFj9QNA1+1ZblSMBhtBXqOHwOlhaamZP74JJWTuqA==
X-Google-Smtp-Source: AGHT+IFD877ivJh7j6VgtUymsDt077YchjBVTqnwRT73inVbvbhIX3OxTjcJOqsBtVXBf4OyihOyQw==
X-Received: by 2002:a5d:6d0c:0:b0:385:fb40:e571 with SMTP id ffacd0b85a97d-38a229ed1bdmr13402172f8f.6.1734964710020;
        Mon, 23 Dec 2024 06:38:30 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e3d9sm11370101f8f.67.2024.12.23.06.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:38:29 -0800 (PST)
Message-ID: <b1ffbdda-f5b9-46da-bc78-e90ccfa41344@linaro.org>
Date: Mon, 23 Dec 2024 14:38:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: arm coresight: sysfsmode testing
To: Linu Cherian <lcherian@marvell.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com
References: <20241219142456.3474879-1-lcherian@marvell.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241219142456.3474879-1-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_063831_868010_8026FB8F 
X-CRM114-Status: GOOD (  15.26  )
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



On 19/12/2024 2:24 pm, Linu Cherian wrote:
> Add sysfs mode selftest for ARM Coresight hardware tracer.
> 
> The test will run below sequence for all possible sinks for every
> trace source available on the system.
> 1. Enable source and sink device to start tracing in sysfs mode
> 3. Run a standard dd command to be traced
> 4. Stop tracing
> 5. Readback tracedata
> 
> - Test case is pass if the readback of tracedata is success else
> failure.
> - In case of ETR sink, the test is run with both default buffer mode and
> reserved buffer mode(if available).
> 
> Sample output:
> 
>   selftests: drivers/hwtracing/coresight: sysfs_test_trace.sh
>   Running sysfs trace with default settings
>   64+0 records in
>   64+0 records out
>   67108864 bytes (67 MB, 64 MiB) copied, 0.196945 s, 341 MB/s
>   32+0 records in
>   32+0 records out
>   16384 bytes (16 kB, 16 KiB) copied, 0.000805288 s, 20.3 MB/s
>   CoreSight path testing (CPU0 -> tmc_etf0): PASS
> 
> Signed-off-by: Linu Cherian <lcherian@marvell.com>
> ---
> Changelog from v1:
> - Added test description in commit message suggested by Shuah
> - Added config dependency file suggested by Shuah
> - Added TARGETS as suggested by James
> - Skipped TPIU as suggested by James
> - Added Reviewed-by tag
> 
> 
>   tools/testing/selftests/Makefile              |   1 +
>   .../drivers/hwtracing/coresight/Makefile      |   5 +
>   .../drivers/hwtracing/coresight/config        |   7 +
>   .../hwtracing/coresight/sysfs_test_trace.sh   | 146 ++++++++++++++++++
>   4 files changed, 159 insertions(+)
>   create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/Makefile
>   create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/config
>   create mode 100755 tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> 

Reviewed-by: James Clark <james.clark@linaro.org>


