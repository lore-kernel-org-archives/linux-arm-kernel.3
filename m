Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912C8CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiH2J+dIVcecXrrAGCkcTfZdS4TOBQ+cjT9NDaaTuF0=; b=Obq6Z2fKLbsj6G5d4fOhFky4Pv
	BeC5rjo0tJcl0UerjJsJEQ4iNILA27DX75aHnyoEMnVfaMLfTVupPcdMLNLbfTY5/1bgVIyKh2UWb
	he9t8lyWq7mOUUd+9sKtSpQI+NqvwV+IymrwqGGWSxOS+Rn8RUPWNEs50OJYm0bILoWi4JAIMNgjM
	Ap52FHdklMUGmtid1t90mseOF0SnTOgm/doPxyrfrYbkYIqDBiTKrK1E3EcjFDpK9XAhn3xzbUsfT
	p3YQE35QxBEvI32KDNBlrhn2w7I4XbAjtlllV+Nf8j1PnX7UvBv3jbx1i20Uq7alqD12NcY5b/Puc
	iLfDzfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lkF-000000088Xc-1RHZ;
	Fri, 17 Oct 2025 14:47:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lkC-000000088Wk-3jpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:47:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HEkRt1031452
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 14:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QiH2J+dIVcecXrrAGCkcTfZdS4TOBQ+cjT9NDaaTuF0=; b=J9VrrRU/jdbJq9bO
	0EAk7acvt5zAn0ZR59QlF+A/Q6sJ6hGysgUBLOJNpFyYH5hoku1AQ7vdpigqUUKQ
	Rm+70vC4PnW2Wmddofi1eEZNooEf1eeffMljto/pEOdgZ3l5f5DYUuHBJ30s54eE
	Caf6AjtQO9quon4iMBrGB2J7+F+/9NlXMEAxoHn+rwaM8199FfxSTKqcfAZC9xGK
	iSxcDik/1ObWfEE1zbFpICVyLn3u4CGMRytMtYQ4Xg4nFUs16nLIo8enaDh1/aZG
	lr+n274IM3bv1A9bgfVy5Yf7YQnEnVfdPArXuAuCgGEcwIn9Nm7kD5ndBLjPNy9/
	q+7X9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49uqun804u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 14:47:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290bcced220so16735275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 07:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712467; x=1761317267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiH2J+dIVcecXrrAGCkcTfZdS4TOBQ+cjT9NDaaTuF0=;
        b=hzbe3uWOt0/UCvQa2BbyB6DzPxte84UAfOpO/i6aE+MyUBwcZSjXy3MUc0FvJWaoyD
         0xzAWm0Qhjky7H5KqlU14KkEOMmPc5BL3EIjANrKn1r44yStD02ViACBiY855NfS4rUc
         tgEtar2TTZPb+sfVkpBur60WOjCTO+mBFCZ4uzAv80mryonGqVo6OwT2gLiB8mWNTvTk
         H4QNtpFgRsRYe9iUxNxnZoCx4utcYj7nu4r5mX7Gtsbtl+hf9U6Q8NVS5OdHh8V/eFRC
         hOqONKfnijIenm2fEWAoI/0nuatGVUGRMD4hAjl9mkAvcJF1TbR3117aZUT1m9x1BRxW
         Ts5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaODVOycZlJN75kS5AWQ18VE7aykC6iPL9OiYY6toNW5denbr1FyFFiX1mlOYy82b4gGrHArwrFmoJ3s8/Wk72@lists.infradead.org
X-Gm-Message-State: AOJu0YzuinOHJQ6ZCEUQAED9NZbqCJtjm73XNkIuihRwcBchpaN3iUre
	f1pixuWHh5Calrp9jQFqag+xrYsD1XJoq3QZRuWzkVTFc/YALPYeNKRIydHOCDiJMB4AHNEab3/
	+Oe5sUR8oyLTdGSf+sX3a1R0NcyyCsnkHsLlLcnD2+RIbg+RU+/Bnx4C/Tpdwg7+r72ftXcoF5I
	KZLA==
X-Gm-Gg: ASbGncsRw31JMmOBvhWaFG0PPRaK8DtpuzW1SaGxvH65u4Ai+qcs71Fdvzv60yFJGlJ
	wp84QnOY/pIFfCnbbSBGPaNMTPkIVNilkQ941vUx+Rv+NxZ4QOwO85TCNArqYp1Fo7ApeWX3zMn
	f3N9qTgK6XlZ9UOVEzDFmyPiys6bA7ufVmfKzX4e37PjZa5+QEM+LdH+UaFyJlFkTPF/vvSxMhu
	2AvbXB5UfZoIW2449C2zC4raoCmT2bfnd03BGeSKpTPoOtwgP18zrFej7bbCMpL/lyfxpLRhVXo
	T6dSa3vCYIBvPESycKZfhjxwMBJaXcG6A5AnhWaz/6FKpHV15TGGvlW7jnelejcXVQh6bUbAjYe
	maJ/anofssBzOnnf4Z3339s4dDH5MpqVX8A==
X-Received: by 2002:a17:902:cf42:b0:269:ed31:6c50 with SMTP id d9443c01a7336-290c9c896b0mr41632635ad.10.1760712467527;
        Fri, 17 Oct 2025 07:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOjKbFTkJh0ezCxCdJ3kP6joxM9yMTBKLaFVhNRS3DcOSUHjMrOrZfMhR8o9cNnCg8mifCEA==
X-Received: by 2002:a17:902:cf42:b0:269:ed31:6c50 with SMTP id d9443c01a7336-290c9c896b0mr41632325ad.10.1760712467017;
        Fri, 17 Oct 2025 07:47:47 -0700 (PDT)
Received: from [10.216.52.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099388dbasm66275665ad.47.2025.10.17.07.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 07:47:46 -0700 (PDT)
Message-ID: <2c8e7d94-cacb-427f-02ec-ecc83a189479@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 20:17:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list
 traversal
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSeu_Y2Rra8x22kWN0B38jKZEwq7=B9C75zH18QdjDHAWqg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSeu_Y2Rra8x22kWN0B38jKZEwq7=B9C75zH18QdjDHAWqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aM/9aL9m c=1 sm=1 tr=0 ts=68f25714 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=js1QHsEmXU4TG3GKDNEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDEwOSBTYWx0ZWRfX4U/AFhukPkji
 skfybe1czd6tvfBHUisu68bCP7rpdpjgm3l3Vf5ot9h4VNBaiirZybmxbzPo+VYZl711ZI44GRC
 yeLv317gBAtIiMeDkc9WcRTDTw5B6IZLPkZni2TWBumDhHP5Ke9XeUwvwDWE6hqNwQxC/87WmXd
 jgaLwNgHfMyhowCs7fDUVHHCkdAgBEHRq3MHzi3mENM2JpoYI5j1oGbGfXl8lNRtkAE2/BoIVcU
 vIAbfeWvzRSjTKL9PZoY8A2bBxwYf8JD3Ju2yte3ehPb/V1cZSLP+7HULWY0yEL8Wwb+QQP/yxV
 YAB7JPTtAEengvjOIdzGrp/eahmVinNGXYZfFfl94loLrOlRVzAT7ipU6V9NBehEfyaYP4HDHYs
 4zjdwLFmPkxr0kWiWC7vj3gK34ItTQ==
X-Proofpoint-ORIG-GUID: TuaLCPB3alCo7pUIuQYriYkNMZplXco-
X-Proofpoint-GUID: TuaLCPB3alCo7pUIuQYriYkNMZplXco-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_074748_938175_6B112B5E 
X-CRM114-Status: GOOD (  22.06  )
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



On 10/15/2025 8:02 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Oct 2025 at 06:38, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> List traversals must be synchronized to prevent race conditions
>> and data corruption. The reboot-mode list is not protected by a
>> lock currently, which can lead to concurrent access and race.
>>
>> Introduce a mutex lock to guard all operations on the reboot-mode
>> list and ensure thread-safe access. The change prevents unsafe
>> concurrent access on reboot-mode list.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
>> Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
>>  include/linux/reboot-mode.h       |  4 ++
>>  2 files changed, 57 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>         if (!cmd)
>>                 cmd = normal;
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               if (!strcmp(info->mode, cmd))
>> -                       return info->magic;
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       if (!strcmp(info->mode, cmd))
>> +                               return info->magic;
>> +       }
>>
>>         /* try to match again, replacing characters impossible in DT */
>>         if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
>> @@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>         strreplace(cmd_, ',', '-');
>>         strreplace(cmd_, '/', '-');
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               if (!strcmp(info->mode, cmd_))
>> -                       return info->magic;
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       if (!strcmp(info->mode, cmd_))
>> +                               return info->magic;
>> +       }
>>
>>         return 0;
>>  }
>> @@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>
>>         INIT_LIST_HEAD(&reboot->head);
>>
>> -       for_each_property_of_node(np, prop) {
>> -               if (strncmp(prop->name, PREFIX, len))
>> -                       continue;
>> -
>> -               info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> -               if (!info) {
>> -                       ret = -ENOMEM;
>> -                       goto error;
>> -               }
>> -
>> -               if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -                       dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -                               info->mode);
>> -                       devm_kfree(reboot->dev, info);
>> -                       continue;
>> -               }
>> -
>> -               info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> -               if (!info->mode) {
>> -                       ret =  -ENOMEM;
>> -                       goto error;
>> -               } else if (info->mode[0] == '\0') {
>> -                       kfree_const(info->mode);
>> -                       ret = -EINVAL;
>> -                       dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -                               prop->name);
>> -                       goto error;
>> +       mutex_init(&reboot->rb_lock);
>> +
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               for_each_property_of_node(np, prop) {
>> +                       if (strncmp(prop->name, PREFIX, len))
>> +                               continue;
>> +
>> +                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +                       if (!info) {
>> +                               ret = -ENOMEM;
>> +                               goto error;
>> +                       }
>> +
>> +                       if (of_property_read_u32(np, prop->name, &info->magic)) {
>> +                               dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> +                                       info->mode);
>> +                               devm_kfree(reboot->dev, info);
>> +                               continue;
>> +                       }
>> +
>> +                       info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> +                       if (!info->mode) {
>> +                               ret =  -ENOMEM;
>> +                               goto error;
>> +                       } else if (info->mode[0] == '\0') {
>> +                               kfree_const(info->mode);
>> +                               ret = -EINVAL;
>> +                               dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> +                                       prop->name);
>> +                               goto error;
>> +                       }
>> +
>> +                       list_add_tail(&info->list, &reboot->head);
> 
> This seems to be the only call that actually needs synchronization.
> All of the above can be run outside the critical section.

sure. will add it only around the required lines.

> 
>>                 }
>>
>> -               list_add_tail(&info->list, &reboot->head);
>> -       }
>> -
>> -       reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> -       register_reboot_notifier(&reboot->reboot_notifier);
>> +               reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> +               register_reboot_notifier(&reboot->reboot_notifier);
>>
>> -       return 0;
>> +               return 0;
>>
>>  error:
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               kfree_const(info->mode);
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       kfree_const(info->mode);
>> +       }
>>
>>         return ret;
>>  }
>> @@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>
>>         unregister_reboot_notifier(&reboot->reboot_notifier);
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> -               kfree_const(info->mode);
>> +       scoped_guard(mutex, &reboot->rb_lock) {
>> +               list_for_each_entry(info, &reboot->head, list)
>> +                       kfree_const(info->mode);
>> +       }
> 
> Please destroy the mutex here.

sure thanks. will add destroy here.

thanks,
Shivendra

