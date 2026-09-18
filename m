Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB843C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=; b=PwjYVGvNtKbxxskymXeaarNSpB
	7bQpaATLsL/d8h1RLVCZyexeesBOt117Oq2vQqUl2jD1uRRsNZe9gY/jA1eh8YYU9wm7jMQ4iQF0b
	CDUlzoKdCE6VGWh50qaae1V0gt5g5+vffaizQfjy7+fUMng7ICxt47kEL06YGgllGdLXyvs4Rcw75
	lyOd8JNb0Iv0jKuFG6P9XC/BEU7NOU8kgol9vLaHojJCcmYBa6hBh+Qc/spprN9j+u1j1mY5L2LC4
	YpTj6L73/AosdETTPpzq7KY7GdldQ50qByq0O/QIuIZ7PnL6LRJLBfNW5xxw5GHjlZImc6ay3V1Sr
	/iWALbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZHb-0000000EfOc-2sos;
	Fri, 18 Sep 2026 14:09:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZHZ-0000000EfO5-0Af4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:09:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOes51900436
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=; b=k2LhjmS5ACIvI3NX
	unsTFOy+rADBx+5G3nXHA0JV0jlaGnpZWpyp9ueVVrR94fWvvh550HL57gV+PIzW
	9jn+4LTQyoqQ7+v9sYn99cdpqsD6x40N6ccYcxvGX8kEHQ0RhaIYdgUpqWEhyY+d
	0hD0E52MCW3XfUrrSHMujLsnI1+qEs4XnQtXD/V7BKsWd+MqH19iAOiQzx1VFWzd
	ubVnbwrCmRJmbYPuxGgopGA7kn1SYxBefIOIn9Gc8r5XoKDY9VqKGFAeX0dZQfNK
	UzTWUpJqYW602hTtFERrNhlz1HcZxhgEv86Gt8Y6Bwa63x2cx70qmRqZGWsApQdS
	XUuqEg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpu0rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:09:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a10c3de1baso639087137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740579; x=1790345379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=ZoNh4GNl4HBxCCjwQKenYLSy89ZP3IRHhnGolVFdj6ornUb0eAmsRl6w36SS5jJgDd
         RuP3LtdX+HAEtINKxyh+KBGyX5jwW9q56q0M5apEEg/g3Bm1hbcwOV+HurFy6apkYrMI
         BPl0EiY6kUIk+4k47JAVlxTiZxUVupJq3sbL0Rk9NPMfy45Li7JgJo6YN9A1bLB0lB9q
         4edA0S4VUAJEvAypOKfknWsfHQI5WIZkGkCE3tt4koa/tNdqubDmFAWpACuhvoUTRitA
         Jtkx+sJKfGnuXRURWzGXaC9td2eJCgnN92YXLiFk8HHyw/cSaqjlSj4mr7Xw90ILxXVj
         TTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740579; x=1790345379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=gAmW6EWJ4HndaAogleT5fjUgti8bEU19ocaLQwOWaxfukZcws7ZrUUSbpA61R6VoRw
         +o9uELHXpJAZxOrtIskWiw+ecYPxd8XuivQk2kxLSExoKg4QIWsr9nXhXQBvCl5h04Tz
         ROOQ0EAsL4kdzHwepKQ/QFa5HWAZcOpO4n8RFcr/8tBu5W/eB1qpXmXMCgTvGZSJqPDd
         fidf8wYMOaoi2qVmq7Jxw3rEUjh2dc2z0M3ISR+5iaU3Kg5xaiqWpoySKMozlhOT15bX
         7dCxNxsNJbLC2gZLLVEUERApuC9q7P4horKsWWuxYKmIFoYI1vQYkX0of1wtr+iVSxP9
         7xew==
X-Forwarded-Encrypted: i=1; AKwUvBzeS/vhBbEFQX7BCQ+rnR/Bk2+M8R0HHRM57ZiQNcG+PGWsxKl9b2xks18lvsB4uOWBeXVr8MojTlMxIxmRthOD@lists.infradead.org
X-Gm-Message-State: AFuF++mX+sv6AFNty+ZN3k8wL+snFFb3LNhep6aqFr3cQF7it/KiQ6H+
	SEK9zo/q3LBR19HZtzc2N6qSeLqYvoxu7XELGJkq8yRUH4Ipoy5MzRHx0uyvFC5nAvPUuoREvuQ
	EXPLGLbnJvVZD9UxnD9fntS6+Oih1nIHwEBP/fkMr3WFVYuc8vt9Lc6yHmPqggMye2LMwveFlkh
	4Odw==
X-Gm-Gg: AYBFou055MLS6zHSRTPd75620pUHwGt/1egIdgXan/gFa3JVcl76GjAjNGGPXMr/WNH
	DQUkmJbqAz93SCaEpO35hzXhFjVKvf5+g8Gi+4nWBwbpdaWtLiiVuOTSR7b+MZPoTdDOWV7/00t
	5TsdB6XVktsmParfrZZ5Au+apTqghn6CJlFlJbiomVhvxeirsMYDW0AwgXdqXbbCOug0j7LF2mO
	xYijFZ6cjQOBiiYo6UJs5Go0scKj767Z5lDEvmha6K8cAbL7HqIt7SsLbAetkPi/jDv8C01sFX/
	7hSycRlUkUWk+jG3HOwpQsTByDtrpzUssXycNNYhRqIJPpC+JtW7HnrZQ4wkKOP0o/kDxRAoHGV
	aYGZuBbf9UAYQ72wdLLC/s44kKM2fHMBUo8wVLexFoESjZ4+rUqXovlBaMCv1VYKpCXP+iOpxJn
	00ewq3HpYsnnt8yAhU6PWAmGJrndMexBI1tuUk0ePzpNfYyVD61BnTIqSsJVj/zt/wdw==
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1308047137.8.1789740579267;
        Fri, 18 Sep 2026 07:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1307923137.8.1789740578364;
        Fri, 18 Sep 2026 07:09:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a3a06sm58558766b.2.2026.09.18.07.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:09:37 -0700 (PDT)
Message-ID: <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX9rqSMiI6wEfu
 I2Akv+8ab5W7ykfkKxjHn9qDX4WE/pjEZTaCSvQD7pYDl4Ym39oRpO1fVh/pBtRaxnp7jBTLWOf
 KLPpBtXUPizkyZTRKimRTSwbpSml2PTrSnhLEdLQuSC9LFZj8uMDTIO7KdPdmmiYWbGKuJHPuTS
 9hDBEFAkNEfBx+qVda0xy20gsLFzMsFwgdBFfd6lxPKRShB7d4/xWOemI+OZAa2CMs7dDu5prK5
 +o5/bwrjNZ5MvtiwOIok2A5xzobqMZxTMeBRmeQEatS2yR7NCktoaMICq5AtlBDdCX6b+QNLYT0
 opzpmNElPdJLzFu0F666EMQtxaw76+/aCP+tWIRx/UTR/ZyotQk9xHa4kovUUJLfg3HA9smIPWt
 9LBjz3DFN49TLVmcuFY1ivB+mZGL1Wtp7weqEfk6K+iKe4CSZpfj8bvtLzOcndy5wftHgfzcxZw
 IwEV5VBibkdXKF3n3Kw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad4624 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=vTr9H3xdAAAA:8 a=2jV7UpksSA8eYliVEwMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX/wFWjzVzbMpI
 3ntuWNql1LqjxIPaKtwCDyOPpWAT+p+7hYKdogNFkQhPLqFT+/tMy2/8WHarjMGHysLsuIiVtff
 9j+xCEs/04XIVn0ybKvIbZYI7iz70Kc=
X-Proofpoint-ORIG-GUID: BjGAbMh_8oYXPlMXmduDe6ztPyUyRNNe
X-Proofpoint-GUID: BjGAbMh_8oYXPlMXmduDe6ztPyUyRNNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_070941_090087_62032432 
X-CRM114-Status: GOOD (  26.30  )
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

Hi Sudeep,

On 18-Sep-26 15:32, Sudeep Holla wrote:

[...]

>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..1b4ccfa9dcc5
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> 
> You need to include this above file in include/linux/mod_devicetable.h
> to avoid duplication of its inclusion elsewhere. That's the pattern followed
> I see.

That is what I did for v3, but Uwe, who is leading the splitting
of mod_devicetable.h from one large monster include to smaller
per subsystem/bus includes explicitly requested me to follow this
pattern, see:

https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/

[...]

>> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
>> index b4178c42d08f..91ec3704ee2b 100644
>> --- a/scripts/mod/devicetable-offsets.c
>> +++ b/scripts/mod/devicetable-offsets.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #define COMPILE_OFFSETS
>> +#include <linux/device-id/scmi.h>
> 
> Drop this for above mentioned reason.

This was explictly added at request of Uwe because the goal is to
get rid of mod_devicetable.h including all the device-id headers
in a big single catch-all include. This is done because currently
many files include mod_devicetable.h and then if any of the device-id
headers changes everything needs to be rebuild, making incremental
kernel builds much slower.

(and the same for the second include you point out)

Also replying to your other question here:

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I tested Bjorn's original patch-series but since that makes the kernel
call modprobe it does not work when the scmi bus is enumerated during
the initramfs phase and the modules are only part of the rootfs.

So I've replaced this with a rewrite of Christian's approach to always
instantiate standard protocol devices. The rewrite was done because
of various lifetime management issues with Cristian's original approach
found by Shashiko.

Note that Bjorn's modprobe approach also only used the protocol id
as modalias, which means that if a vendor protocol id of say 0x80
were used and we have multiple vendor protocol drivers in kernel
which share 0x80 as id, modules from both vendors would get loaded.
This is something which I did not realize at the time, but this is
another good reason to go with the new approach from this version
of the series.

As for testing, I was the main reporter of this issue since I'm
trying to get Qualcomm Snapdragon laptops to work OOTB with standard
unmodified Fedora aarch64 live/installer media and scmi_cpufreq
needs a workaround to be manually loaded there, see:

https://fedoraproject.org/wiki/Snapdragon_WoA_Laptop_Install_(Fedora_Beta)

As you can see only a few workarounds are still necessary and
manual SCMI auto-loading is one of them. So I really hope that we
can get this series merged in time for 7.4 .

Regards,

Hans




