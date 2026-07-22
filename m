Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB342C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=; b=BJ/t6lpv75jc7bnarTyzvbDuGU
	ENJmEyajw9D1EsClW787KjZ/KUUmQypCZpOku5HBr8vLu3WfSUnv8G5QjzPdhIIFYh8yvZVLzbSup
	E7CLwIpH+otpjABevbF8IVyIozZePwcXnsgERqJN3CLoOevs++m/nO2wBfI1YYk6+iZNxbLZN6l5q
	XcVgfD0AKjCSQxbetZP7HWj83i/YIqbXM8RsIodpjpkxOerA3mSkuGwiocgTLFqK72cyL4BJJwEw7
	pb1s1nQEMWcuBuW0EuQUiizmAImYws45efHrQXDgZm0F/cHjXMGr+ewG1knOgmGO7yBYuQLqgc0QS
	uWtj7XTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX4x-0000000Buq4-3RwH;
	Wed, 22 Jul 2026 13:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX4u-0000000Bupb-3Za9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:33:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWR6G2030029
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=; b=p6jGh0aCk4giX1im
	UEUXR3cYR9ostzr0WwPUNMeTC2ZStLqADyNqeLXAuWslFmvcLOCRSbI9C9LAtlbn
	2yD9aSRJfArOChaUI0IOO7kuNkzsxci+L1TT+skYRM6oL1FSGpu7wbGV7U0ynamm
	LtR5jO8ABsmqGhPQJ/4S41otNC6IQHC1eUULxg/YCMtQP9j6Q/AnfxYLPO8Q2h9/
	In/CeWZyFGFW985RtvW3qda/Z6N7MHZSP8XnL3n/dYc23XSc7ElaTzSPgfsdMSA4
	MaR4E2/xjjno6CV85K5uXYCx/Szg5/ql4EjAD5XTDM0NyPYKfFFmUDAxbSu93wg9
	Dn7PbQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr839spw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:33:39 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-456b5122c7cso6295359fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727219; x=1785332019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=cqreWnEjHc4NVq03+dzSllFzydBRsTaQ1xoDwoWKPSUL+mLOH0qlEs0jeEsg7uXUD6
         +sKb6e7QJ0xBQXR0E0ZXyzrn1DZJpaQQC1b8OxoBRjcLM6FtqP7S3hlxZIynLCpqmqoY
         3S6KSuxXUA/0XTh73PKAxRc8AWRjPeYMpsE6Mpt903ie+QB61xnMxb6q4i6P9ZTNIhQA
         0sFrdKFciIJdscDOuXvArsMWa6nmz3gL2BpRrkqYqT4ZNit4vpjW6DVFXF+i1aHevfDG
         v2W8aKT/xDLlHOJl7oHOlZcVBYX2TDVzf+UgPcPi1I0tdhPua60l+0HPJkH2OU857b6A
         cvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727219; x=1785332019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=pkR8s71seSt7tCS4tlx+j6KuqeGygZPsJCBRLXzTJOMfH9aJF65sBTczF1f/PQ5yNH
         AeHaM6am+mwDQshrZWreuUfIurGeieJ5KcnqGp1eS8i6Yl0fUz0qnoyOYS+DkOAewrqw
         OdY3dysMTnRyNvb3OivmPAe5ZgWlSd1hq2JZMGtFzdsMZIG7Id223kjF+2wGq0gPG4yh
         HaGbUcEizA3y9gm9HCLyAer5iaE1Ik5iNzJPCtUG2N1cGJurgRI2oq3Z2LDKqtRGxn4h
         pkZJgHmWEGirPXu1yWRvCqo2gXQUcWBXfbBL1jhwu/KobOyOqu3+QcVhh6wBBwCiqjaj
         diHA==
X-Forwarded-Encrypted: i=1; AHgh+Roj/6cQBO7FZo//PSNWjqExMDHdrp0pUHjLVkNDTZjA8tl8Lpt8TL1pShHFMWvaKF/WfbGVDPpka5vAzYN/V38n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3DKFShRGotmkX3dEt8Uci9KmrrilR7LD+G8Y5fiDuE1l+U0Ej
	tEis3x9ypG9zOYznvN+lalFFJw/C8+oeeBXv6RI7xto7SMhYxxr2Z9Jxr/cAfxhDlrbnCTQbOee
	h7fXARbFdGgEBB//TSuV48IURsALYRVm4jRhj+lYmavxhgLSmOuVNrUElkqyyQuAYQ+PCvFHp97
	Ujnw==
X-Gm-Gg: AR+sD11whkRO9oNy6QppCwyfzVsyS7YOP/jy/47z31H8BS6qL8M1yEHWGLBaUpbZwPa
	KUntwvLK8M+6sLAB/gHXfm+yH/OCNiE9GxPhyJlcSlsX7LDNX9bmGuJLMrnGo6mr7wu8Uk9++rk
	Iqo5XBiI7bMXZjCrX0ICkAMOV74W0hvDWN8wdvjBLgcbZOPetP7XEc/tGoE7v+4OAqg75RtatrT
	XIdSx5gMGTioborZnnhzLnW4LIB4B18/W8GiyFH7e3AHo9ab4AxNz3mPdoQNhd3UZnGMtNU3Zk0
	FJV8QUbrQA33+3jbK/IqbMQ61DGIqL/qfaGWWSWTMXGtyouCRqVk3abxXZxbcHwK2NWagfJzsQM
	Lb3wv8jbeIIM8676fmsW0+aET6mlfXqQOKlE=
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653227eaf.35.1784727218658;
        Wed, 22 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653117eaf.35.1784727215447;
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79a09cbesm1395149eaf.12.2026.07.22.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Message-ID: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:03:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9YSKKYxiOqrkGgDFfwAx-6hzNAoJ5hmV
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60c6b3 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fs1vR9WLwBkDfa--pcoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: 9YSKKYxiOqrkGgDFfwAx-6hzNAoJ5hmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX0wkw4f9dn0Ui
 l+NTaBbTgy0r3wuCfOly8NAtC9rMMvkJ+mENOjTraHMdfIGYW4r8GEGLSfobRvRlJB+PWeVBJ0F
 8bs4uWpifOnmj7E34LRLYgb9YIONeGDEvnMdZvA1YD2J0jDJzu0kYcB374KWxrKxbt940ws336h
 pH3BFqOJLZ7zYEoCiWWEBrf7K8Ez76KrfpI+kHd7Wz7e1eG2I3CdF4ibCL6PT/uj38TqPiO51hV
 y0Wiq6y+uVgivXkR1G86M0vJhyLOy0pobGTBNmvIahZd3Z6hNNKMqYt47jGybvMvG5yVT3eDFwm
 wUUZuz8jFN4Pf9/DKMD9trOXME1WtS/SdnLGfJWEReXSWUSp29tL77Xsa3hGL55gUEM7dvKXqsz
 qippokSP6b19HGsyW1VtBJIgPKh+y2Gaq/4fqiGVWaiXe1PpWgQUS1ep/+mUavVFsX/HNNOElpW
 b53ht1n61t684ubB5Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX44CLWMe8X9zq
 txpsS+7p+iOqSlL0+3GjcvPNHJM3WG9H7vVvVNDHyfgwEIr6keUHUZ6bU8ZBJCSTr3+s8sR1jES
 d2gDXqzyoppk4c7Tu9uRN6sPxzZfyJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_063340_912126_6AC95310 
X-CRM114-Status: GOOD (  22.86  )
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



On 22-07-2026 15:20, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
>>   5 files changed, 46 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index d260715fccf6..ac69b5f39fb4 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>>   	struct nvmem_cell *cell;
>>   };
>>   
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>>   {
>>   	struct nvmem_reboot_mode *nvmem_rbm;
>>   	size_t buf_len;
>>   	void *buf;
>>   	int ret;
>>   
>> +	if (count != 1)
>> +		return -EINVAL;
>> +
> 
> The count can be different per mode. Because `struct mode_info` has
> `count` member. This single `count` check across all modes may not be
> useful.
> 
> Either drivers need to use count passed to them or drivers needs to
> receive `struct mode_info` in the callabck.

will add a once more write function in reboot-mode to handle the 
multi-count support. If a driver implements it, the multi-count write 
function will be called. And no change in existing drivers.
Does that address this concern?

thanks,
Shivendra

