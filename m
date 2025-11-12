Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CD1CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=; b=rOaOXsH8wLN6oeEjH8Lk0z2v4U
	9kuQVUHukz2AUEUEEh04go0sB9DdcwU8RnuAkLJ7Kd5ktgWqE2Nm27mjnngAnlHozlsO0bqhhLu2P
	ArzfyJCpS1xPgom17ATtPm2wO4nDyzwtDzt6j3MHaPzIxkdkGH74STDI1/FU70BlrcI+wjTJuLwDg
	Yl0btxuNf4n9012WwkpFrWnWClgUrLagMNIZWupURA2/OefLWqTtHCqQkHc3P7kgBrbzzl2m8IgHg
	TMhqsUyjFOE8FDJVFcuJHdk/xHCedRw+6vtgzJLgHOoGEHa1+8Uksc4v1OLWiKDCVGkkKiPW7qcWV
	YxJLOMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEAE-00000009D9X-0c9a;
	Wed, 12 Nov 2025 16:57:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEAB-00000009D9D-17R0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:57:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACF2OJ71614587
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=; b=kSI/Mko5rQytHI4o
	0UyILDIryo/oRRhS4uRJWfrTMqF1DTTwY28tuBhZmNx35QHuq8sC9pFVXhRUv0d9
	r645yNYqtJ7RhujOLyW88aHPkg5kFVi5pkpL43hITAu3yWzCs2Aoto3fwOSdpd6i
	9QgAgH2cVDVCDs+ht63Dh6UoF4r/W0n0BP4awqw4hAxDLoooK/xtla8lO3IL9wlV
	kVZT4Cb0eE4WwIBNStOzk1PNbGhEsIpvT9yAqhuyCZCWnNzMhFrT+rCvS7H8j2hN
	iTmpLraVW1hoxX95FBUXA5soptbq+xkiUtQ+Lrc9l8nMBvfnlcfuR11t9pwx4Zp4
	vFYong==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acvhfrcd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 16:57:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ad1e8ab328so853779b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762966661; x=1763571461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=;
        b=FUpqHPF3hoddQfRZqypeSstj6d8nVvUAmnCA+zOLF5QlRBBIWKIl0i6FS2O+jUppiw
         DKctdX7CSHQ8Iniz56IHC1QfwanCRHQQ2w+XUYDe8Why5ebVEzZKge58HRdsmRQD4uk9
         DPmqaVTCTDC6KZVdluvqTROxbHybLP3omtKDIrTxddxp5CpzE9WWiPgYie/gNjHYF13u
         srVsQdIh+a5OJXEEOgyT1rc9AFNDxuBSwtLSTdk99I2sgVafJ5Rt2w0M1D67hco3dr1M
         tNPmzjXFQ+DBhJ/ZHkpAPlvHg1Mlv9SQETcfKeJV1p4/yRDJkhzRuXmBUP442mpTdjxA
         8bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762966661; x=1763571461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mpem797IAS5zUDgun5QkAafd9U5uOGw9KKyFmkJdJVQ=;
        b=dtIWyoxpn6E5MHlXGZHNpElvLCHQ46cIdcxm5HA5CLQ/tttUlLbpYgdbxgxfIHvzVu
         dYf3hgeIChCLtyhulC6lfERTHPsbifSBnwNHoG/3jDV5MHDd0zXrtzytaWfyE+5cagZ4
         p4K+XXoRLEaqTB8lblx9wlTxIelNCGZ2zdw0deUwBkRucsl0NpWgol4KMG1U+NkYxri3
         vxNFTX+WfaJHJYW5q/JFwMPnySGIJEyo8avJKmgomfdRdsDAVL/GI8LJCEmU37ULfLo9
         BC/e34oW5ksZF5FnLmQ13lrpKI2BFtr2AuX+AzGNXQE3NmjB2/jPcdXSnzHWc71vX+SV
         dv+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlfFc1IEF6AtK59Rd9kCsI8dwESK0Gi7Bkv+/LVVpZFZVNHarPouMcnqFA26Ir39MYClY530ZXqTZyYmvKR9sS@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWIMDtkao70TlvSajEyp6jJaWAHunW/DzcyU+hoRKP2OGo68e
	+Lqr8agadac1cd87Qma59JDhLbVC1cuBU7ozFA6wIOUqk2AsT/d/Ztm6pzBwVCdaQ71Y4G/XyGJ
	AJBAJKRPhYGsjVCORKt15rzFLVA8FFwBmJTC2b9rZsJVXXTRjGY5fwzqliK5KbAj1pNOX0E3cuP
	zfvg==
X-Gm-Gg: ASbGncuPHppzDDGXWmIbroCtNQxP801eOhKHMORvWf+JLF6vPyA1iMJX8rnojOWaXWn
	OAq1blxDF+E+LTqJ4VJSeiJZ4bWZHoem53Vp7UFPbDvPMEanZrjRFzYzPygPV4GKg+UCaPF519G
	3nEDLFDjm27yRkzjbSXt+yzw2Ct8odpRqdIZh82J0IHpYx6RO5ZT7hQEu3fC20FLd50aZk7zbpM
	UUt3aw7Zrrb5C7hjeRzp41ENbmg6WEaFZ4AIRDJq0qXkg7yjFhxynornDTJkQQvmMUW8+7HrCCZ
	m4Ccd8ifWtGnl59lA9u46wT2k3EPfcTPktzBS2JI7n3fnY4ujLNvRkFZsMhat7lZxzJzp/qq1Z9
	1SHa7vCbcFbAO1k01TMGo6MiI7GqiW4Aj1Xs=
X-Received: by 2002:a05:6a20:7d8b:b0:343:2772:6bdf with SMTP id adf61e73a8af0-35909c72d38mr5228940637.26.1762966660470;
        Wed, 12 Nov 2025 08:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCL8LcDYnKtT117dBOx0SxrkoJoefTb8xV70qNzqs+1oeeDhNffDRFT5zulQTb9lWo8KVYhQ==
X-Received: by 2002:a05:6a20:7d8b:b0:343:2772:6bdf with SMTP id adf61e73a8af0-35909c72d38mr5228883637.26.1762966659835;
        Wed, 12 Nov 2025 08:57:39 -0800 (PST)
Received: from [192.168.29.115] ([49.43.225.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc76c0e8sm19073083b3a.52.2025.11.12.08.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 08:57:39 -0800 (PST)
Message-ID: <41725ac5-843c-0e4d-8f82-a6b7cd8ba9e0@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 22:27:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 05/12] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com>
 <CACMJSesMK37D7Qy+rVq7w6bUt6bYGXykUid6bUKXvh7M9mntZA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSesMK37D7Qy+rVq7w6bUt6bYGXykUid6bUKXvh7M9mntZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D49K6/Rj c=1 sm=1 tr=0 ts=6914bc85 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=8+dZ2YuSHRys20a4ijOkGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JGhpyqB6T-AhYHNvuAAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: pR8gBzvwYE7uYgSknDZihYjeFDZFDhNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEzNyBTYWx0ZWRfX0hKsT9JFuwjI
 GR0RH1/g/GMkquU2ChYcmjjkhPu/AUx/h0kE+HeUogsBTsfA0ayb3ljhXbGsunv45mBaJRq9B2E
 uuyBsej4QDJ+BkNnE4OSJPSsB5ismCTpqbXEHY84+BTGhfcNYzFZ+Ao/hEq0APja+hvhQp2vRIt
 qxKtY/B7EXdtRavtiEM5aLOJSu2O9nOh8ufM7UfCdeH+4N41yHAXx30uUbTxWsYkAMfYqVt641j
 YDMvGi51K+/JY2u64yxzIM9wSKXCfTl6zXh6DbWgXnjFEVDX93M3L8Gfgac5+CGcsY8zduat8U5
 vVyBqZNj+Tu8PwTr444/VkCp/7Mwuz4RV6JXEIOIQGln/Y9VomHlm3n26iZA8BENC9skL8gRCMH
 CcNud1B3hfihBTin0Z5NNzVhiBSihg==
X-Proofpoint-GUID: pR8gBzvwYE7uYgSknDZihYjeFDZFDhNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_085743_495187_8AB2CEC8 
X-CRM114-Status: GOOD (  30.24  )
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



On 11/10/2025 8:44 PM, Bartosz Golaszewski wrote:
> On Sun, 9 Nov 2025 at 15:38, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> Currently, there is no standardized mechanism for userspace to
>> discover which reboot-modes are supported on a given platform.
>> This limitation forces tools and scripts to rely on hardcoded
>> assumptions about the supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a
>> sysfs interface to show the available reboot mode arguments to
>> userspace. Use the driver_name field of the struct
>> reboot_mode_driver to create the device. For device-based
>> drivers, configure the device driver name as driver_name.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported
>> reboot modes arguments provided by the driver, enabling userspace
>> to query the list of arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 62 ++++++++++++++++++++++++++++++++++++++-
>>  include/linux/reboot-mode.h       |  2 ++
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 873ac45cd7659b214b7c21958f580ca381e0a63d..582aa7f8ed7fa485c5a67877558c9b15d3600ef4 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -6,6 +6,7 @@
>>  #define pr_fmt(fmt)    "reboot-mode: " fmt
>>
>>  #include <linux/device.h>
>> +#include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>> @@ -23,6 +24,8 @@ struct mode_info {
>>         struct list_head list;
>>  };
>>
>> +static struct class *rb_class;
>> +
> 
> I know C is a spartan language but the rb_ prefix makes me think of
> the red-black tree. Please call it reboot_mode_class.

sure will make it reboot_mode_class.

> 
>>  static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>>  {
>>         const char *normal = "normal";
>> @@ -65,6 +68,51 @@ static int reboot_mode_notify(struct notifier_block *this,
>>         return NOTIFY_DONE;
>>  }
>>
>> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +       struct reboot_mode_driver *reboot;
>> +       struct mode_info *info;
>> +       ssize_t size = 0;
>> +
>> +       reboot = (struct reboot_mode_driver *)dev_get_drvdata(dev);
> 
> No need for the cast.

Ack.

>> +       if (!reboot)
>> +               return -ENODATA;
>> +
>> +       list_for_each_entry(info, &reboot->head, list)
>> +               size += sysfs_emit_at(buf, size, "%s ", info->mode);
>> +
>> +       if (size) {
>> +               size += sysfs_emit_at(buf, size - 1, "\n");
>> +               return size;
>> +       }
> 
> This is a weird logic inversion. Just do:
> 
> if (!size)
>     return -ENODATA;
> 
> return size + sysfs_emit_at(buf, size - 1, "\n");

Ack.

>> +
>> +       return -ENODATA;
>> +}
>> +static DEVICE_ATTR_RO(reboot_modes);
>> +
>> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
>> +{
>> +       int ret = 0;
>> +
>> +       if (!rb_class) {
>> +               rb_class = class_create("reboot-mode");
>> +               if (IS_ERR(rb_class))
>> +                       return PTR_ERR(rb_class);
>> +       }
> 
> Why the lazy initialization here? Is there any reason you can't
> statically define the class? Don't you need synchronization here if
> multiple drivers try to do this?

reboot-mode framework does not has a init. Should i add a inti_call
here and create a class? Can you suggest a bit more.

For if we at-all continue this lazy init, will add a lock.

thanks,
Shivendra

