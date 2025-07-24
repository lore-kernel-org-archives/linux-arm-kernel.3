Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C558C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myhiipaB/wUQijkyOLcZiWvOTEGJM1xVMQUaHld2irI=; b=RGaa29WCJvGgoVy2e5gqvK2mL6
	5+ElvqhDkqobjW+GcZ7y7P1MrW7Ho33JeY13E+7dD0B2sq414SG8XQd0EE/NBCN/zhA6b5KsYdKh9
	W2GVsucLSKt6RVN1FDF/TacDrU/8NSNCaMHN5jA3Q65pSYyhA3oDtYmsrCNkn8nuA4+3SDe/S5fEB
	qyIX42//UYQ74r2hOeEgpHYXOIrEORT1QwGtoS6NGzj5R+ia7+oEXQoIFDUhvAz5j+Z+zhBuULwOi
	l6W9XWAeQSrKj2YlO00M8l/ePrnJWr9EbcMUvt4cYJwYA/3CPMXj8bKWktkoejIu8YWxzi+ZZKh/s
	Me21qkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0oC-00000008Dwd-136v;
	Thu, 24 Jul 2025 18:36:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0ZV-00000008C9G-1iXi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 18:21:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OI6O50022181
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 18:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myhiipaB/wUQijkyOLcZiWvOTEGJM1xVMQUaHld2irI=; b=n61+6JW9drxJ9pZk
	mpHo1EtIQ54t5WHCJo5diIH0sfmKMIWNMl41XGSJatRpsPVdOWEg0FafriPhEcdG
	lHULAguO3Ek6P9J/OES3MH//8IZbbCD8oL/6Mq6L5bT6udmeW56Q4HO7U+CStDLj
	BWi3Nboqc269o2k7EGPuB3gP7QQ+W3uDNIH8XjfQXZ8cJrVL/qZieu0pBAhtg3oz
	Pr/h4FFYm9sei22HZ6/SQwOmY9SH8EArdvycm3uBQ6cmLCHxw7cMTaEXStUoy7Z8
	7voQuGnAcKoae86ATFRS9yvk4uHQOdd6by6RLw7RKvrv/4wcIyjU5mWso/CKlc/9
	NyQO7g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kmdq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 18:21:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748fd21468cso1241359b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 11:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753381295; x=1753986095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myhiipaB/wUQijkyOLcZiWvOTEGJM1xVMQUaHld2irI=;
        b=VBbvW0/VIwfz1WP6AAfoP0dFctueGWrxxYLgU8oMtonDPB4EbFfFw3Clf6Whq6tGUM
         /iv5CHQb3FBj0hjRPwfmDlU/tNvZ31nrooZzdQjjpOuviK11gTINKlvD1mcznCJd2Uv3
         Mt3MiRDkMiyYDj/rGe6klhE0BcY1fr6gvfAgOk/Ch7PhgNtTzuMz7EagOROPc2tnDrm+
         U+bNfsmjg02TNMf9GqfY/DMbA+KDEm49Lk6hwuea0Ryd4YpWUBzC6r/Prag9imtb5+Z5
         iS2qfzbmLCmO0NWUqF16Z/h5jrPrcnssJkixVuFFrkwX+QaJ4lIXyV3AbNy8h07yRQWL
         YQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWoxMXAPnhZrqA6yhTzJeWESHXEXz8hVJbsPgmZmlFuL+s/xJpsCmIkkKXxgfbf1rhKm/m1yHOZfwimjw9PyZiO@lists.infradead.org
X-Gm-Message-State: AOJu0YyE0kVzcwXAG3Dtejun4GnIOZS8Yb/b3uWbC3+bqQ+Tz8HJ5KLm
	O/ZsH6jIQclmiO44B+uuntlxA/xebG0NyxUYv67a5eslVs0tMJiEYp1uJ7dVcISnSO1jBHW9Xxa
	v3saC+tY96p/W/uvm4l6hwyE4RA6mlBQjdehTslHN+aZ2/nRTUwhAtRG5bmPX2ihu/FuqZeCWO7
	Na+g==
X-Gm-Gg: ASbGncvj2OsFsPu4x8xk2/di8yULmnIO3YSmIdzSQLqRuGR7NmN1B7IITeRJg07vi9h
	nwTtqjnRRdoUpqmvhw/3uJ7+Lnh12tNesvQkAXbJh7pjLNG7SG5yRYR+uqp2fgjIN4vdlY6Nm/4
	BXPSrQ2KRnSZgcxTo8DW2SVV2bBPeL11g8oLIg4QhDdwdBj0nQWj30p5qaAex6v6SN8idL4mwxb
	B9e1qeMvhFWAypwmPxD5L5XNdo3TBU46TioO+HqbqWh5odchdo3A+tBd9U9eSBpE5wN1YFJOxrS
	I7VsFEjfWfmEuj9akuDo3DIQdPAoqhbbjZEs9Ytk+jkTEj2vpgFjW+ebF6t+WseBgfRnkJ+8OPS
	1
X-Received: by 2002:a05:6a00:2e16:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-76034c566cfmr10997086b3a.6.1753381294715;
        Thu, 24 Jul 2025 11:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8aaK+IvK/ni16DihbKGYP8ABP6VWfHjhJIfPMM3TuuE2gI7iQAOgMEB1kec1nuMpOExdHcg==
X-Received: by 2002:a05:6a00:2e16:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-76034c566cfmr10997035b3a.6.1753381294245;
        Thu, 24 Jul 2025 11:21:34 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761adc70302sm2162883b3a.27.2025.07.24.11.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 11:21:33 -0700 (PDT)
Message-ID: <58eb8f0e-a029-cb7f-e63a-9eac6a6444df@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 23:51:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
 <56599da9-0200-72b5-012e-942a1fc954b2@oss.qualcomm.com>
 <a1d3264f-a46a-42c4-b518-a66c8e0b70b4@kernel.org>
 <f4725f3f-1b45-ebd2-aaf4-4f986a44eb8e@oss.qualcomm.com>
 <36f62026-9517-42bd-8f9a-92f39fcdc136@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <36f62026-9517-42bd-8f9a-92f39fcdc136@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0MSBTYWx0ZWRfX2Ip7zDM3yl1H
 TdhYGgvyA+hp+xFEXwJ0+tCe4B7729Uk2CXOyW3JevZEYtSU7Zwi/8bS1qPnozYOy4ZuHS6+p3g
 ZSjiBfOyl12nxhk6n97Qk3ubvifNlu/HqKHrJvjDnZ1J+seBFmTVFqVNyNTZWhUQIjHGcHCpdue
 n2ulAf7UoRxmzxtWv5VWYL720exIaeIcl8xblzCN0A71mW39vtBmgbDKJyZz3XyvXH64XikqUXd
 iU8ToUrCra+rcde6Rn2LQit6HTI0vibn6GTxrEhkiyriiXu9FQcGHwzvW68xxJfQtHt0TpWOx1O
 x0opCzBd3n5I9ifISWdRhH8AHCE2CBfEa+qMH7Vz/5qXukaBKD9uqLi84VhG6xa6yrq0M4n+6ba
 1osdGrNSjEsOa5Wperwp4FHbenO5PZGfyRG9oFkBpL6Yt4pws4PDAnSVjAJntuAXXjMqxWUT
X-Proofpoint-ORIG-GUID: 99ZKESM99GKWS1prAzVuQTQylbuYQVvB
X-Proofpoint-GUID: 99ZKESM99GKWS1prAzVuQTQylbuYQVvB
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688279b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=EAZcAn6cL6OfK3FglxxoPA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=YF7pu-sQtpgReH5imSgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_112137_576086_966EE8D0 
X-CRM114-Status: GOOD (  25.01  )
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



On 7/24/2025 8:13 PM, Arnd Bergmann wrote:
> On Thu, Jul 24, 2025, at 16:04, Shivendra Pratap wrote:
>> On 7/24/2025 6:18 PM, Krzysztof Kozlowski wrote:
>>> On 24/07/2025 14:24, Shivendra Pratap wrote:
> 
>>> I strongly insist using compatible as way to find your device, not node
>>> names.
>> It will look better to switch to compatible. Will define a compatible for
>> psci reboot-mode binding and align the patch to use the compatible for sysfs.
>> Current patch defines reboot-mode as a property to psci, hope its fine to
>> define a compatible for this property like "psci-vendor-reset" or
>> "psci-reboot-modes"?
>>
> 
> How about using the reboot driver name as the identifier in sysfs
> instead of the compatible string? That would make it independent of
> devicetree.
In current patch, psci driver registers to reboot-mode using a device-tree
node. So reboot-mode does not has a driver name for psci's reboot registration.
its like -  reboot_mode_register(reboot, <struct device_node *np>)

Now when we want to use the registering reboot driver's name for sysfs,
either we- 
1, Pass an explicit name from psci driver(say "psci") while registering
to reboot-mode.
or
2. Create a virtual device in psci driver with name say "psci" and then
register for reboot-mode.

which one is preferred? suggestions? 

> 
> I had a related idea to provide some namespacing on the actual
> reboot syscall parameter, as we have two (or more) orthogonal
> concepts here, when there is more than one reboot driver and
> drivers support multiple modes.
> 
> E.g. you could use
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "watchdog");
> 
> vs
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "psci");
> 
> to pick one of the drivers, or
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "bootloader");
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "recovery");
> 
> to ask for a reboot from any driver that supports a mode, or
> combine the two and ask a specific mode in a specific driver like
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "psci:bootloader");
This will introduce an additional feature in the reboot-mode driver.
If a colon is present in the command like "<driver name>:bootloader",
Call the "<driver name>" specific writes only. 
We want to add this feature? 
> 
>    Arnd

