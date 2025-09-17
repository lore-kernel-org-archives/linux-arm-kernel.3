Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FBDCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 02:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ejs0DfeIgjCv+z5FoYBCuNGBcmoT875zmGQTHUFovnk=; b=bYsmcoleaSFwRxts+h+dsq1FEv
	SYJISc71qNfuqtYUl57k6EacVpLoOx0w2uOv7B3r0T7FPgA+ROXrJey6uA9YuXTs5RzkTwwZUZxUp
	Z0ZVxm5oKZMhCui4aaWvS4IHTOizaPcslA7PXqaFKWDg/Iw1kYKxrqsiLQUcw9+BzumZiKHt0an2G
	9zFBwqa93xei++FoUmoJuhdR8dV8cHiqYqclls5Jpz5hD559rtPB9imqqKQVgmStrN1KjulokM0ov
	3FREJlDeQkWMgYJ3804l2/GU6Ux1t/KiuDvrn8iu5ppmkABm6Iil9uaCEIj6Qs++zCAkdhkKaSugk
	DgXhJgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiLo-0000000A1T0-07ft;
	Wed, 17 Sep 2025 02:56:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiLl-0000000A1SH-0QAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 02:56:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaLQo008470
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 02:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ejs0DfeIgjCv+z5FoYBCuNGBcmoT875zmGQTHUFovnk=; b=YFlCENv6AgYkfjAQ
	a96MRQT6oo/+q5qRjw3Tq5bQb93E2IHEwA62/okuhO7ckMBCljDhLDNyo+1kbB2F
	u4yPy0web9fEENwi+GcwDfmnaB+A09pEM8V1RTpPh79AifibQWq4q7fkcUg9vurH
	nj90HjiAGqdt0wH6v5VWB3nMqHkDnTBPj0CC/qsb1+OIg4o0AycvaMbT8Cb5atgp
	m6Aii1bFHI6i30Qu8Jj/3HApW+pz9cSqREFGRHWaHX/Ny4b4IRQ4uD1QuSrdYxwv
	Lt7hcXvgj7n6YG4vdDgvkW4+Xh+5/bItwz//zjHTnxP5/rwIbmZHW2wTNhwacSuY
	EvJugQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxrnhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 02:56:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2675d9ad876so34172835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 19:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758077811; x=1758682611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejs0DfeIgjCv+z5FoYBCuNGBcmoT875zmGQTHUFovnk=;
        b=TEBGAJjFoRRjVqQ4z6aGnqo3KYiwFhwQsnjtMAA0Llj9D9D+BXqPw+urYbGfd2FD2A
         skwt9qBPodz5FxKI/R8RrjSBhxDFrzF6NdfPJn7pz+PT1EBRyXoH+ox61LxRKvHViCDF
         lf1rmMF6SQFLLTGP73X9PmAdHpV8n5ze5DSUlyK/c3+6HFwLf/s/GMMaWbInmTa+iF/M
         JmDE/+kEYiukZ9+k9zfGqE+NFqOZGNP5DMlDqClaZBLPLqoKk5ai7OuVdqRsLIpWBJHY
         e2W9pgS3LuANdyx4b9Lqn7/oCC5OzBG3m4pFOIjPO0U3nWC2VQn/i38Pd8uoRfweE16Z
         ZV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrtZ79uR/dMs+ox2Lsjb9lHtMWCET2p+7eLaKFLfpaDoWSckUXgFpDuONcnxESqGJ3E5cefMZMU2/odCOEZnJs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuzsjo9HruHb4P9MqsnLC8Ci1cgWZOOMfu+6gvrceUl+SeTj8G
	f8NUgFIuHnKAj0emCrk3QAw+cK+LoeOC0eAsrq7kSobfZvy+PC5YNKdJEn1sqACTQ7SOPkW4gi3
	CrU3FKh4Y8lOB/RAA/oG/kHm5nw2dYH2aVJ8Cr5n2bzZU2tLLpRdIn5PcZ0lKLM8Wvw5ycyF67I
	LkHDeUnBXWaw==
X-Gm-Gg: ASbGnctf51RotjYXSj9bhahyuBstmVHhgp7Qjvc73UsD9K1izzFYE7V/2zIOp3io+1T
	YSjD0ulrzfoV3lloSk+JmcePV33XU0LTgjga2NxiiUy0K1Uvs2rpOy+NHYZ1e6/R2TjMuthbVGU
	JS4mLrIOJF+rKCv9XsLdJsM+nXADM+qf33UJlfxHYyoINHrfpJBlUT5O8TXygnCEjR6bl5+scnD
	fK0/LF7o+NRoptFFjFvJB2FJyaPtr2NSe07uqqObtNg4hHNfYAYQJwgQGX3fMHtIF52nd02hqEn
	0IdYTtmpGgJwb8yZcBDGSxqxJFhCmD7OYR9sjeRmnxw3Y1FfjL6oaIKyWFBq3TZAkp4qC+VTv+/
	fYw==
X-Received: by 2002:a17:902:ecd1:b0:263:57e7:8950 with SMTP id d9443c01a7336-2681217f3e4mr7419655ad.19.1758077811094;
        Tue, 16 Sep 2025 19:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnnI/XlzVFKrLai7UAMi0WGqhx8P9VAhzfg83kdhSwUBWlQHiBGFrNpl+Fk25QwPynEZGuDw==
X-Received: by 2002:a17:902:ecd1:b0:263:57e7:8950 with SMTP id d9443c01a7336-2681217f3e4mr7419235ad.19.1758077810577;
        Tue, 16 Sep 2025 19:56:50 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-264c4e98f8csm87739605ad.108.2025.09.16.19.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:56:50 -0700 (PDT)
Message-ID: <32d8329f-0d73-fb16-f12d-308e6ee6b45d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 08:26:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 05/10] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-5-37d29f59ac9a@oss.qualcomm.com>
 <lgoahuqgoajuj352h7rnjfyeeyf24x45pj3qmidc6qqrc75vej@3hrblxle7uyk>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <lgoahuqgoajuj352h7rnjfyeeyf24x45pj3qmidc6qqrc75vej@3hrblxle7uyk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwY4c+OpuaIet
 UrsEQ8xfWojHiASaNbilQu13+NQJwiPdggtLbqNkpXuRCHjPulfvPIZtwosx8nHVahaGdt5ck/4
 Z/M3vWgMlRuEsBHMc/igBo55Iw23nGNctMva2VY2u2KDbryOdakTQ4qdsxk90V9cc0DhF7ynfKt
 DLeUlPcsF0RPrqzAV8JMn0yc9TpMpgXQEltXJNStWsQekMkuCzNb0h7y2GvWFSKaCYI1/4MNg49
 AJ4Q/oGfYsUbfzZP22ZeOFr5FSi68IlC9NQWVH3Ezv2MRKGQeQ+2FIl8SqjqEOLGzTBFgAAVXAP
 P8ibCyIHMWGmPhgT6BQ8v3FDDciJ2bQZ4d1leEJl3WtYsn7mqfHYBmE55ik6i7VtfXtqwZs+uzc
 hTEQ1eIc
X-Proofpoint-ORIG-GUID: eoDk9f-XTIdlH9G8asCKZjPxHCs1Gw8a
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68ca2374 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=1kWWpRhd3BofgRIEiGpY3A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7WfyLBSIawAVH6obIBAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: eoDk9f-XTIdlH9G8asCKZjPxHCs1Gw8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_195653_147617_03E1E8F0 
X-CRM114-Status: GOOD (  26.35  )
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



On 9/17/2025 12:32 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 15, 2025 at 08:05:10PM +0530, Shivendra Pratap wrote:
>> Currently, there is no standardized mechanism for userspace to
>> discover which reboot-modes are supported on a given platform.
>> This limitation forces tools and scripts to rely on hardcoded
>> assumptions about the supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a
>> sysfs interface to show the available reboot mode arguments to
>> userspace.
>>
>> Provision the register function with an additional parameter to
>> get an explicit driver_name. Create the device using this
>> driver_name. For platform drivers, use the driver_name configured
>> in dev node.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported
>> reboot modes arguments provided by the driver, enabling userspace
>> to query the list of arguments.
>>
>> Align the clean up path to maintain backward compatibility for
>> existing reboot-mode based drivers.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 131 +++++++++++++++++++++++++++++++-------
>>  include/linux/reboot-mode.h       |   4 +-
>>  2 files changed, 110 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index ac81b8b0a9b7fc31f8ef21024333a050087ce90f..7ecab050e496af3e1cc01c1a4614787707cb74b4 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -6,6 +6,7 @@
>>  #define pr_fmt(fmt)	"reboot-mode: " fmt
>>  
>>  #include <linux/device.h>
>> +#include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>> @@ -23,6 +24,8 @@ struct mode_info {
>>  	struct list_head list;
>>  };
>>  
>> +static struct class *rb_class;
>> +
>>  static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>>  {
>>  	const char *normal = "normal";
>> @@ -75,26 +78,121 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  	return NOTIFY_DONE;
>>  }
>>  
>> +static void release_reboot_mode_device(struct device *dev, void *res);
>> +
>> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct reboot_mode_driver **devres_reboot;
>> +	struct reboot_mode_driver *reboot;
>> +	struct mode_info *info;
>> +	ssize_t size = 0;
>> +
>> +	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, NULL);
>> +	if (!devres_reboot || !(*devres_reboot))
>> +		return -ENODATA;
>> +
>> +	reboot = *devres_reboot;
>> +	mutex_lock(&reboot->rb_lock);
>> +	list_for_each_entry(info, &reboot->head, list) {
>> +		size += sprintf(buf + size, "%s ", info->mode);
> 
> sysfs_emit_at

ACK. will update.

> 
>> +	}
>> +	mutex_unlock(&reboot->rb_lock);
>> +
>> +	if (size) {
>> +		size += sprintf(buf + size - 1, "\n");
> 
> sysfs_emit_at

ACK. will update.

> 
>> +		return size;
>> +	}
>> +
>> +	return -ENODATA;
>> +}
>> +static DEVICE_ATTR_RO(reboot_modes);
>> +
>> +static void release_reboot_mode_device(struct device *dev, void *res)
>> +{
>> +	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
>> +	struct mode_info *info;
>> +	struct mode_info *next;
>> +
>> +	unregister_reboot_notifier(&reboot->reboot_notifier);
>> +
>> +	mutex_lock(&reboot->rb_lock);
>> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
>> +		list_del(&info->list);
>> +		kfree_const(info->mode);
>> +		kfree(info);
>> +	}
>> +	mutex_unlock(&reboot->rb_lock);
>> +
>> +	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
>> +}
>> +
>> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot,
>> +				     const char *dev_name)
> 
> Instead of adding more and more arguments to this, just add a name
> field to struct reboot_mode_driver.

ACK. will update.

thanks,
Shivendra

