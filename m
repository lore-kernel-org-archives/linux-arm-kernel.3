Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D3DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TGAJHVkDaQILMrgf+9DsRvtoYw89TydpErL2J0/xE4=; b=2GydhLlSZbL9rtaFas5s1sy/jN
	07iGe1LpiiwDIzBDPXwnLDq/MqMIVBkS5ouK6sFw6j9z3Y1bmWRa/lAcBaGp6MI2AUru+yjTNLtdp
	pXhspOiwMZ5STe22WnVsbFEFQwesnyIZFmw4kxONc9sauit2LEZZYKcFdsREtp7JoFHHCbjM9Y3hp
	xNSRMFH9/JCjpT1lpN+K4Z3aOWtWGejNvY88DMQdBPD22eWul4H18HE2gtsbvXFtQREaDvFu+Jjzz
	a5lJsjeyzwZ9iBa5jQz+WnzQZlZf5h5lXC/kHd+LzfL5ZMlSuzTu5VeL3yGsLcBLGN5uASUHTAzOg
	H99Y0TgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9Hc-00000008z0r-1BB4;
	Fri, 25 Jul 2025 03:39:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9Ch-00000008ye4-1dge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 03:34:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmX7c015327
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TGAJHVkDaQILMrgf+9DsRvtoYw89TydpErL2J0/xE4=; b=PcIdVf1s9lDk8cjm
	V5/LNzY52BUGwXgLmmu+DhrVeFlqtIzVow5g/Y0QInr0aO/9tBPORLJMyOYE4pdu
	HIndr3qsx5OcIU7xYdjkEDmcasHPHHDfwwfzAImjajH7aYAv7FESonfRUylz6sLW
	yWRxypUYBqaLMhCNCOjk6C9BCK5Un34sR9i99Y1qsVwQozVHI8/7mUeIyMaQGuZh
	CFduZqi65q7f9+4GA/F3ZacPzx+ILGDSLkyHMfFocJvkPjveY6IJmCxDlj4wl7db
	SK4YKvlnYOQX3zCSfcujDwcVAJdH4Gb+iMMx8SG028DXEtwO5KBvZXIGHR/BwL7u
	3XxvNA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qgpyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:34:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2382607509fso12678745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 20:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753414477; x=1754019277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TGAJHVkDaQILMrgf+9DsRvtoYw89TydpErL2J0/xE4=;
        b=btuwJIpefQrMOb+5vWshhbfFhqIAPcBNCujTQK74uAkplFGK4ouiYRZkcggGnI3k/u
         iGHDzOhoaW8gdFRWRjTJBbYuGEpZy3wNvH3xIajnlRZ4VSSXQMWH9r8u9qWqYgoBwfS8
         pjIqFHTibLmmQS7SP4NJcXeTrxVyWW90gXqEr5zFXm+s8RvEjDC4INul+Kf3KvKT+2Ek
         KYlfJsCLhWb1vvwe8TM004oZabWIFyi6ablssdCCigObUub2VyTR98rZejNvJMzyzoNR
         xTvZA4c+05N2OknNJ+LH+5LEwUtYtjJJPmhfO7tOL43FUchMvF4B9V/Ff0VIfRJ6/zJR
         AQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwno7KV+OO+wCjUpBGGUGH5fUuWjVpTzNFjI8wDbecGVY7VlaQFwGFhLMSRXrTBjYGFySHKBds23bynw5xGXw7@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHzbekcjli7LyrUB+Oh23GkB3yERKRwHEosbODEqrtPDjG/f/
	jk68oFsMqRj3Z/fvEUH/9z7eRZEYdDFngEeWpuZN8ECtac9F30hxd4a8EU2i6a/ukpyFpABE0+d
	Fr+i7jG1a7xiw+KdH2FsnvyqU3nyblo8Sdj0Q1nCYs8m7ILwWFIGrwFFfgjIneTNlzG7vGR4g/Z
	9LHw==
X-Gm-Gg: ASbGncsBIs7e0D2kpEdy7opQNHO2vxK2lnDvNIF4YOrJ93Usl2iaLuu4MIyPszo72+t
	RWX/jFZBrXOs3y/FxlP9Kw5EXYXALY6OJC7Z0oRCk1FLYaPoxwy+9sKoFdM5KYt6Ns9Q6g8l1/X
	BljzU0by0ZCcXeXik6+j7JYOBqcl8gc0XAOIRKzeM0dZXe7S5vUOQ2mvyQD1CwawXw6DDFPJgoL
	sIDF4hGSUE7oBYnKlfWhvHosdHicnbPWfwb5aHQiZAJ4OZVRNcIk0l3w4rI0SJDtqA4fIK/4cWA
	IecKGMCPXM+W0v+QWaLaeCPCW5YCGqTP5DwAvnIrLdi7YWcscJbYV+1+UZWIfNHQUmv3YiW50CW
	O
X-Received: by 2002:a17:902:db0e:b0:235:c973:ba20 with SMTP id d9443c01a7336-23fb314746cmr6199825ad.49.1753414476840;
        Thu, 24 Jul 2025 20:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLeBuELUTdTQTY6HForrjFnof9GXWAfPhpnlGKHjmaYsVexcryNti/gt9bdOpBOUMNUqlyPA==
X-Received: by 2002:a17:902:db0e:b0:235:c973:ba20 with SMTP id d9443c01a7336-23fb314746cmr6199525ad.49.1753414476389;
        Thu, 24 Jul 2025 20:34:36 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc645sm26342695ad.90.2025.07.24.20.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 20:34:36 -0700 (PDT)
Message-ID: <a096af62-526d-2982-af49-a2ef2f62817d@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 09:04:24 +0530
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
 <58eb8f0e-a029-cb7f-e63a-9eac6a6444df@oss.qualcomm.com>
 <fd153e95-b06d-47f9-b079-566908c20df2@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <fd153e95-b06d-47f9-b079-566908c20df2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=6882fb4d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nZGjKI7HY8pVxP4eyoJ54Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=feOGgi2hklxqG8YMet8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDAyNyBTYWx0ZWRfXxxSa639nbEVA
 ItEs6Ikf3DNJG9N1HSy/HmTSkVBMPdkK3eeYMWWuRcsZf3ClVeL70OBytklFHxL5H3QiV5VRT3V
 OahW+ZnEGF0X6FrwSFW61rli0jbwoZ+mefBzztOSho0vkispQNMBSTLt/qraUolz34Qe+sT/VwO
 eBjKf8EwzcvYWZFrzzzRnjtR4ybL0jbxoy57zdk+GVVoHcml4szVGvp8McVF5NbkE8IO7tfI+0f
 DPf7xWcIHRr1wEZV4LGV4USo0QoxnTIjgcGz2JT0mzB1fUVK99n7uExsUTqbrHnw/82Fiic+Snl
 ORoS/FqbN4OQsX3F7D1jC1jlE76yay8RovE6KABFNeA2SMf+7fVqs8cLrWVhT/o6MMWWPaGg0EV
 eWh4vOO9Meoy6ATb46oB3/sMC2LfwBsdKGJ0/LAZsgNDoopIdr/W/shyR/IqSFboMVaLasTD
X-Proofpoint-GUID: eJvMm4k-Hw_DqyRckhbv8y2YxoeKpJOZ
X-Proofpoint-ORIG-GUID: eJvMm4k-Hw_DqyRckhbv8y2YxoeKpJOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_203439_438872_4D30EA36 
X-CRM114-Status: GOOD (  23.87  )
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



On 7/25/2025 1:44 AM, Arnd Bergmann wrote:
> On Thu, Jul 24, 2025, at 20:21, Shivendra Pratap wrote:
>> On 7/24/2025 8:13 PM, Arnd Bergmann wrote:
>>> On Thu, Jul 24, 2025, at 16:04, Shivendra Pratap wrote:
>>> How about using the reboot driver name as the identifier in sysfs
>>> instead of the compatible string? That would make it independent of
>>> devicetree.
>> In current patch, psci driver registers to reboot-mode using a device-tree
>> node. So reboot-mode does not has a driver name for psci's reboot registration.
>> its like -  reboot_mode_register(reboot, <struct device_node *np>)
>>
>> Now when we want to use the registering reboot driver's name for sysfs,
>> either we- 
>> 1, Pass an explicit name from psci driver(say "psci") while registering
>> to reboot-mode.
>> or
>> 2. Create a virtual device in psci driver with name say "psci" and then
>> register for reboot-mode.
>>
>> which one is preferred? suggestions? 
> 
> I would pick 1, to decouple the namespace from the device and to
> keep it simpler.
Ack. will update the patchset.
> 
>>> I had a related idea to provide some namespacing on the actual
>>> reboot syscall parameter, as we have two (or more) orthogonal
>>> concepts here, when there is more than one reboot driver and
>>> drivers support multiple modes.
>>>
>>> E.g. you could use
>>>
>>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>>             LINUX_REBOOT_CMD_RESTART2, "watchdog");
>>>
>>> vs
>>>
>>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>>             LINUX_REBOOT_CMD_RESTART2, "psci");
>>>
>>> to pick one of the drivers, or
>>>
>>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>>             LINUX_REBOOT_CMD_RESTART2, "bootloader");
>>>
>>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>>             LINUX_REBOOT_CMD_RESTART2, "recovery");
>>>
>>> to ask for a reboot from any driver that supports a mode, or
>>> combine the two and ask a specific mode in a specific driver like
>>>
>>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>>             LINUX_REBOOT_CMD_RESTART2, "psci:bootloader");
>> This will introduce an additional feature in the reboot-mode driver.
>> If a colon is present in the command like "<driver name>:bootloader",
>> Call the "<driver name>" specific writes only. 
>> We want to add this feature? 
> 
> I think this will require a little more rework in the reboot
> infrastructure, and I did not mean for you to do it now, we
> can always decide to do this as a follow-up, but I brought it
> up because the way we pick the namespace will limit our options
> later.
sure, thanks.
> 
>       Arnd

