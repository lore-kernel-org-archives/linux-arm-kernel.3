Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF1DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=; b=Cy26W5jBclWpw6zH6quIkdQEwA
	XYBhcaCVzlFwv4nay/kx/XcFmNPujgOQ0+SzdTZQWeyEbkC7bS/AFx27WoReosJlnfEhvlcFY4Sgq
	gatmvxOG0r7HBIeNH9WrnL7czznHOLEHxlEsDq9XQ9JZR5smU/2Fbtty/OM/dP+ABuTKRsrr3iFMo
	wMaRQLWRyvEbmbiYsWymaSqpyz4NlaqsGSIWHYp5N9t5C9LcaQZFW/Owee/m5wA1NyL49hzPKchoU
	n7iE8kK5vQnzxhFPSnDdOkTAIO2TmCiaIBa/ZGltm9Z+RbbdhTJkOPQ8aVqnP6aiycwYN7HatPnFq
	MuH5PaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzfj-0000000Ewsv-0K5a;
	Wed, 15 Jul 2026 13:29:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzfh-0000000EwsD-1ga4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:29:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcqxB523538
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=; b=UQRuEAmPLakw2Yq9
	WGKbJjpnzHeqkGM10aWtkSr7o25OTdPiJpRneCl6UpY+nAcZerSWlQZGSS8rk5+Q
	91dRhgRrJmyqT55CT/N56GZU9xgIOBaIcpXc4Aufaxrov86WKCrAg96fGbCb7Kg6
	Wgztym83nrAsPKy9BghxCVK2FYa0uOdaTvqbt+TvdfDajvV7pqoyfJqulCNRU9GY
	yhOpSEp7H0ebSjuq407tJyLWIY6YIFnBSaRoNlQHksldgLi08TvT9awzITfbJpCZ
	uShW6sREE5OtxIkUMRKlsCCArUHjWHKZizaGuprYc8dvy0W8lQBbgh62L3zwVjqP
	eM0OyA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68ws90a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:29:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so8545265a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122148; x=1784726948; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=Fl44B8mNfBVdwUPY9ZLjz5Of0ukaHARObiNhNJR94JVnhbxjF3zkpfrbPwXZ0UqMB2
         PPekPvZV4CisK1FK0x19sfh+h2tLqJi5IfiNrUpvdaKmZq/jIDSt783vjkhhkOuRCOwz
         M2p4Yoyaj6WqIXDwjHyNO03MiKfIWH+d8VuaLdLBd4IXlbJBD0eCBU8JWf43xOO6UPex
         eDCIfwlspCs50hexZ3KseLVbWKQl5ApTd5Mgo8RFc9ZWZiejr5kNOJ8Zkq58ma/yqF4U
         v+AAiY+aXhV0zJGv7H9sX3Ilel67cAvJMpRYc3XLAVhBVP73++ntaQGSqwq+WjekPf7L
         k/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122148; x=1784726948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=OV4cognreqKWjAt6EcdZokwSqqlhWPKInbCguDXWTY4K0eMlr1L2e+mtg9KBVFMGdZ
         v4yCEnrL8ipNNQ+Cw2XWOtqXFUKk4udQbbafjYdbnAI4xsVDV6EcZaD9zUr44J6tTnhu
         Mu7c/huXA3GTKsHCzfSKr+NqHkcsr/VbO5fQdahj8JrZJqyaGySujxbFluFdmuuo/pZa
         EsvuLOJynbWpjklu6uAH4YQ0c8F89iAYA5zPVKyzVoa9ZIq+MOEpwqOVwGk6GXVRH1id
         8Tj3kgfRSuxsw+yEARcqsuRYl1w4CKbYcD+h/VB9MGf/WKHJCpizflQ0Q/TGOvg3QaPr
         P8Kw==
X-Forwarded-Encrypted: i=1; AHgh+RohjW8XgkHdiU3uRxtS+aD8bJbRi2YeHmerZ/3nhVXgClDIwcLEYKfc88IgBGYPYuSsC4ZEAY5wZZWkv9C3KNU4@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3RftBwfWndMlRSeadm1tO5aU2bnQDUHS3n7jP1k1nGJiQua9
	H/Nv9UJwEZyHli/zs0eGRjoav1Jb/Lg1SgWh3wgkLnxYjZ89/d2gO8M66cfsU4Z2rISzUGUdL0I
	UsoamTwGe+F25Z/ek8U/QtFPMSvcNwInCSIaL3t4c7Uu+x2PEf+Tl8FtVxxr4hkiM6nd6bZbRxH
	lHNw==
X-Gm-Gg: AfdE7clEVPyc6qcgH5L9rQmBBgVVpk05fUnJpzZd9x1dShNPXTgD0LmgpMreQuBda7W
	23DVqOXPDlVxB2drN30r8FhMEjO55gerOTsW/C7TtAOFB7jgnm4fRHnYFgM5JgemUYv/+3IjB9X
	iHm5fEhPUjgIwe7jmx+vYGRTZXa9Y2NnRTHaWcO0Prua54+pwCQ8m1ajZBEIpTlD6gWKfCMoU/U
	anekwyY/3va7X/vFfm0Ot66l9iM+1EnE+ZPfGEeEgdYAad4QpKyEM/D4rdgTPkBcCPa5rupbFZA
	/sRXVXvjT5/98B4mKWPkWEHN2rwwNHCHX1mEL58cjCjdqoDgHF2qvfQCJ7zGXhjtGoVonXzg3AK
	lUNehw4LzMMLhknSP/OCehxbuf8oMGUYlC94ZekiMs9iBtw==
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942632637.16.1784122148013;
        Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942595637.16.1784122147562;
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm2735217c88.15.2026.07.15.06.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Message-ID: <4c52d360-caaa-4c77-b1b3-d6b7e78f7fc7@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:58:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
 <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KRbHsdfXvK2lJpr6zGdismy-wKLl5JsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX2TFrvB7oeAlc
 vg3cAq0L0ceuKt/jnyjvrYbez9OHDZB/o86c94X+U/IlRdHRgDBDaPn4EZYYnBHr396bLHRk0w9
 Pybjw3OFf6Xpv3rHaBcxqK1M/n2nkBj5HqiOYxpjLwMFEyDc946E4gFb7kMBi7+33DvKN64v4Mr
 3D8gJvuDg6saZV0X0apw0igeETPFwieusSjaxMbo1g9CueaUdIoJdAyh003O13g3aveKHinW3re
 ZeWgP5YwaXDYRJb9nDE8tAzh1JaDBBKESRoIffmqlwS6Y54omJbD7CqJxuh5yrSTR9HBlK2JCWI
 eyrcsn2PZcRG9qmFhoeoNonmUnBdzB4hYUrSyCzYjD2EJgv6t4VChyV1rCtLd0v4439JCaPWWWa
 QscGpbyPRiRPKtDjF5Xom2x1PkK6fqMCKiud/BaizLgaxPzWNfpFrbSDpzBAaGKE3FGoZClPCG7
 gwBVmSlkX5l6blQ6Fkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX8p7qQkTNdBHR
 VYCZkiHcgYIkFAfrnTGIJ4RrUV1teegorgj8tGWBWJBETwzztIW9+UkO3K1mbw3m9i25L38h6pF
 qPCmHSdXiBqnk9gEnqnHGwlWwitMQgw=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a578b24 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Tp_YqcUnzpVuw28kZAUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: KRbHsdfXvK2lJpr6zGdismy-wKLl5JsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062909_455099_55A6BAA3 
X-CRM114-Status: GOOD (  22.37  )
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



On 15-07-2026 18:44, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:37 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
>>   drivers/power/reset/Kconfig |  2 +-
>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd..8c6b78ac471b 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>
>>   static const struct mfd_cell psci_cells[] = {
>>   	{
>> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
>> +	if (!fwnode)
>> +		return 0;
>> +
>> +	fwnode_handle_put(fwnode);
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret)
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> 
> Why do we have to look up the named node here anyway? Shouldn't MFD core handle
> that already in a generic way?

yes. MFD is handling this. Will remove this explicit check.

thanks,
Shivendra

