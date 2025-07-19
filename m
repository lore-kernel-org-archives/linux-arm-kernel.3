Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C733C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XydjBg1XxLlIiQ3n9lIqoq9TZugRKk685ZRW+FjNQmk=; b=mAhCXlTXlz7YQigur7B2eo9eZh
	xggjU40+ev10cyMh2wi9gWWWFokhM7x33SyOkDvm2LtNl124EX6aAAGr7dBGWeqmmtj6oGC29r0O2
	8CDoV1nHKsuRXJ5pv467jRz6sM2K2QNibzDlTvVabgj0TOFY8FSFRbW9kVkPs9ObbdDxs1ds9b15s
	mZGsWnV+RKbdnpKVc3I5dmcwE/lRserXdnW8RhGgOIPBFlR7cv9lM5Gjs9uWTVNvKOg2qxQOcOEr8
	6uo9VlWgCG7tfq02Fg1AIA3xpdRLjGKiHVhm8Kf3VFDizBE7JOaeZTO4EzA/VUyfAmOX/337PvZpp
	oo8fhl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9dU-0000000EOJd-2VYe;
	Sat, 19 Jul 2025 15:38:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9b0-0000000EOES-2Rf2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 15:35:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4JU4q012693
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 15:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XydjBg1XxLlIiQ3n9lIqoq9TZugRKk685ZRW+FjNQmk=; b=IzqsN7YlE9pZmOdg
	xEzykRiESdHT4Jun6FJu/RgkJRlF6xWOtrNhGsGehXW1YtcTmySinWj7anCc2lMQ
	XRSRj6kGx85BjnD41MMXbivYi+kHDtdu394/PCKnBW/t0h9KxbRv7H5IurmNICgR
	G6SuKzpW5QShLJiojYOfZnIbNk9rXAuok/UbvDwfO+jVVWLnNq075TtphqK4XVxX
	yd7NZmGOzJh63xvaosBTT1eMSm6TH52AFhtaiRhWMOMi4EMr4vpu09wHJhOhWNcl
	opMunKnkpzpBb2qokkOJJD+SBQed9nryGzX27KmOUnPIX9/q937PGQlNHv46CNuf
	YIz50Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q0uqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 15:35:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235eefe6a8fso23316165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939328; x=1753544128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XydjBg1XxLlIiQ3n9lIqoq9TZugRKk685ZRW+FjNQmk=;
        b=EhAAsJ/TXKpFxLtnwaraqhJiTYPp/BhZzOTsmvdXjNSOdzRG4ZkcFUJVytzqDGdB1M
         bgFkLFCxQKEhxkSIe0F9cSYFObBQ6FsOQp0JYvIio9/YLJ3zSGTkcTlxUY58GEfVkdTx
         E9nmlhs3AxZyU80yjX8857ucWLvvFRUZph4QRoubO5E72LgFVwoFjdH2ZcvGy/kG7oej
         LQXduhbfeYUX08HLE5bNl7S7T0Rm/rQviOexqBvrvbFkiMJkcTw3LXVPTXRHxUNzSIyH
         KN27uTkJSow95XU4ws8nRRJ8F+5/A0H92R7h5g5KR0vSX89DPTv+c4h77v0D13SuBUbm
         E/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeb2JaZo5MizoadCsBgLUJTCZTiIFKqAM2MUx3A/LNSmM0oI2Rf562p9KkC8a6LmPoICm0G0q/6ykY/MXLwMqJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyaDhrqdm5Dbye/Vun/jNLSGcjVNYlpkZDupTNS351eV6XOHqzJ
	50qCG5YIw7amyZ06ZP/e/gaoA1TUm1L+iSFkYaZtwmppQ9pEZpbc+YkJF4yL/Wb/QniY4g4Pw7B
	dAqTJdpnPBsdOqdB6mD25ZOci9fRf1ruWJ9dG31Ilz+UaksABL8+qps7wcXjIVv3qqwuRr9reaj
	/8Lg==
X-Gm-Gg: ASbGncso+NSRKrnawx3LnLynBn02c8O1hkyW82oAQl7YNnRJ6nXarPaJc0DtHWD2l9J
	YJtRs2gqQ563ESSTYAuQplDsu5HxQHKEpP4NC4LPJ8H2iUenxCGP1UFdPPwL8/Or23D+LbQPY1e
	k5Ole+9OPQAaMHg/PWFFMAjGJfVXF6b92rJLaXbvzC65xTEjHOou7w1qFq+YABmW8mtaxxqK0Pe
	hbMsjAUrs7zsPvFs3NEIK3dIlS5e2P7+WDfAO/0sFxPepUOivhF/gIj2e10y0gnAeQ38BOhWHZe
	XRQndb4zVXBcxUnAy3sbX4JVM3huvJ2CLVbjrsI5vFs4yvWBTCbx/L1pcrase9aIaSYGSdrYZ1l
	s
X-Received: by 2002:a17:903:1105:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23e3b79a73emr90077965ad.21.1752939327832;
        Sat, 19 Jul 2025 08:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsIXRK/U7kjcNQqkbSjngoR8dF0R0lYOxXpmmF/dV3BhNwAi2WvyTXE4mAh5pE2+0gLI3SlQ==
X-Received: by 2002:a17:903:1105:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23e3b79a73emr90077795ad.21.1752939327352;
        Sat, 19 Jul 2025 08:35:27 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d37sm30619365ad.16.2025.07.19.08.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 08:35:27 -0700 (PDT)
Message-ID: <54eaf8e8-2b4d-b0bd-b65f-1262e72a54dd@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 21:05:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
 <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE1NSBTYWx0ZWRfX9XIaV4eY4ULW
 i4L4Zcvz2uQ3CFZrzpnLsAMbw7VBRF7IAFJtMlKosrWjT7bdL92dOd01kjOTz6+y+hxNcGitn19
 T2EETfVjqQXP7vfo84kJA+PRzglrksfhQNdP7dYGCiFTEtKwfGr5jsvWxiZ8EwxqoWGkZF5m+th
 5ZYBU76ElEY/HSXJRjIA/ApwIWRILyLuXQWTpwTpiwLeISxQkC2DGWfa7GHZcciflILoBfTjP6h
 bSWrR7QElso3dFPW7SxvJBd1l0/t2VAcddX2DG+kqcIcVW0079C4keylKau1AvKanNSIBnuFBN9
 BaBXn2Ur6PH7GH/xFvqFOCU9L25V7StOj/YV8sEBUzgBNEcYZnAOruwgd8PdXt8M6xxqoZR27Dq
 gWZBJb9iMtNDqsBVGlSGLiuMffDypIP3UhHhq/gLp6yqWl9TycEX3LXunWrvK1DjtoDj25c4
X-Proofpoint-ORIG-GUID: xdHz-La5N3G_xkwaLd9BU5yNwokEoE3G
X-Proofpoint-GUID: xdHz-La5N3G_xkwaLd9BU5yNwokEoE3G
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687bbb41 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PsbcbGlCJbaar3GLNM5paQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=fCp3oo7GvzJIsszaBaoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_083530_755202_DB7A7D25 
X-CRM114-Status: GOOD (  27.44  )
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



On 7/19/2025 12:07 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 06:16:47PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
>>  include/linux/reboot-mode.h       |  2 +-
>>  2 files changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,13 +3,17 @@
>>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>   */
>>  
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/list.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/reboot.h>
>>  #include <linux/reboot-mode.h>
>> +#include <linux/slab.h>
>>  
>>  #define PREFIX "mode-"
>>  
>> @@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  /**
>>   * reboot_mode_register - register a reboot mode driver
>>   * @reboot: reboot mode driver
>> + * @np: Pointer to device tree node
>>   *
>>   * Returns: 0 on success or a negative error code on failure.
>>   */
>> -int reboot_mode_register(struct reboot_mode_driver *reboot)
>> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
>>  {
>>  	struct mode_info *info;
>>  	struct property *prop;
>> -	struct device_node *np = reboot->dev->of_node;
>>  	size_t len = strlen(PREFIX);
>>  	int ret;
>>  
>> +	if (!np)
>> +		return -EINVAL;
>> +
>>  	INIT_LIST_HEAD(&reboot->head);
>>  
>>  	for_each_property_of_node(np, prop) {
>>  		if (strncmp(prop->name, PREFIX, len))
>>  			continue;
>>  
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
>>  		if (!info) {
>>  			ret = -ENOMEM;
>>  			goto error;
>>  		}
>>  
>>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -				info->mode);
>> -			devm_kfree(reboot->dev, info);
>> +			pr_err("reboot mode %s without magic number\n", info->mode);
>> +			kfree(info);
>>  			continue;
>>  		}
>>  
>> @@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  		} else if (info->mode[0] == '\0') {
>>  			kfree_const(info->mode);
>>  			ret = -EINVAL;
>> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -				prop->name);
>> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>>  			goto error;
>>  		}
>>  
>> @@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>  {
>>  	struct mode_info *info;
>> +	struct mode_info *next;
>>  
>>  	unregister_reboot_notifier(&reboot->reboot_notifier);
>>  
>> -	list_for_each_entry(info, &reboot->head, list)
>> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> 
> This feels liks a missing lock.
Should we add a lock here? The list will mostly be fully created only
once at the time of registration.
- thanks.
> 
>>  		kfree_const(info->mode);
>> +		list_del(&info->list);
> 
> list_del should come before kfree, otherwise it's possible to access
> freed memory while traversing the list.
sure. will make it list_del(&info->list) and then kfree_const(info->mode).
- thanks.
> 
>> +		kfree(info);
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
>>  	if (!dr)
>>  		return -ENOMEM;
>>  
>> -	rc = reboot_mode_register(reboot);
>> +	rc = reboot_mode_register(reboot, reboot->dev->of_node);
>>  	if (rc) {
>>  		devres_free(dr);
>>  		return rc;
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -9,7 +9,7 @@ struct reboot_mode_driver {
>>  	struct notifier_block reboot_notifier;
>>  };
>>  
>> -int reboot_mode_register(struct reboot_mode_driver *reboot);
>> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
>>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>>  int devm_reboot_mode_register(struct device *dev,
>>  			      struct reboot_mode_driver *reboot);
>>
>> -- 
>> 2.34.1
>>
> 

