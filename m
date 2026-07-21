Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B4C4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=; b=gMLwuh1ehcqn4LSQn03pxAZCYY
	I1tTOXmrWsboMoRXVGtTWh1lLJ2wEL80QnqT+U4ie/I5YwriwuFhLi0t/P8QPP/KSXiEn7iNIWtzp
	2mrvbx/HqNChdwaci/0Spprv6Vh8G16g61G/BHDKeoEDoFZA1kNBGkin/uj5VO4t7CMspC3Ea5A+a
	VxmWckMQGR2gL2r+1srg3MvOgpEe6FR5/xtiJnHcMWdwW/yJa9xQ19A8QQpBa9gp40wkSIr8u66uW
	J9APNwKoiQoLL+MPCpkBMwA2jM2XXaEN/R5HmFNe0fzekA8WQORjU49LzNs0YFDP4kGISBq9Eh8Vi
	Sh54Y6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9uC-00000009SVs-2hqc;
	Tue, 21 Jul 2026 12:49:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9uA-00000009SVT-3hKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:49:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQtYe2502675
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 12:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=; b=EKBm/+U8PD5Z5AGg
	YzvjnAMBJq1hu3ScDdGMloMvw/terP/e94VjlsGk2RnPibtgn9qkcznlC6POejCd
	5RAIhuHMuTi7+hfh9NgPqxN+BXDmav7h2uEnbFwUeuJ89N/Gx5WHnkU4WrJnwVg0
	Cc9oPiZlTJcYBAOAaKoptZNRIKKlSA8bM/y7EIup1a1S+3AAucu+kSmG5mN1cwFj
	bGtNv/whd0OQvSBZ3lj6fCxGR4p86nmDXcaoOwLC5iblTzVpHoXjytKp4t85mPWz
	7eJjKyY0lxRfa3h8W8JAEoW1IbH2L1VAT1TGgXVNhfgFQdzS3ZImOqtuPS7SYbpk
	xWnjPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrsvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 12:49:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1484728085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784638140; x=1785242940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=;
        b=Re303TaD/9FRlTSA9xU5JKuHzyaafr/UrCV4JQ+Axe9IjxSh5UrbeXfgvNXOGoOFtZ
         +IaZnek72qTWZ9o/mW3phhVw/0NYAen9mqy/lNG8m2tiAEcZNGdKZF9Tq6lbxKS5ib7n
         9osEgfjZp97sukcPEFElFGG8lsfsMqHOWg4vLQzCwl4b5R+bktvMDwJ6eVz8AogohmOH
         NHOAB9/387qvA6RvRrBwFK80h7pYTh9hYDhEKPZLfB/qiPH5wP5dv9XIvk/mX5kgmzWn
         bV29aEYAUEB35B7UcOlNH+fdCqcszSUifYmsv4BU/+ULOk6e9bw+fR0uZ84TBAFSxgqH
         B25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638140; x=1785242940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=;
        b=tSD0tOTN/4LxbKDOHjRxAFj8Hk04mTgeF3Rl2zaqUMs3LYlj0rYPeIZ1lNoYU2MH3o
         qXHpmxZGmU+Dfr2e/G3fjMztDPmQZtBGnG7tIpUNz9uZbTdB7pdKQDn85lXH7KTpb26j
         2Jb2xxmrJ3jk9fVvjt9RSPMz3boNhHNSlorAI3TzhKzqvggit3P9jao9Fq6oS+iOaly+
         A2sbY2Hf6ItM7FhJnni8ndelXzOsaP9knJftRkqFLDR+zzUzNep3qZpp13HvAZnaA0yA
         9QCcqTBe49hMQ5gm9YU8QNPEIpmLSuMolQ3RVWaJRVagzl11MMwjBHOBXn3TGwYRG3gF
         5ewg==
X-Forwarded-Encrypted: i=1; AHgh+RrmbAD7RuUbNtj6aveSESmrPvAbh/grAZZtgHvJJG2l49Lnu6D5Dcuh/j9jwH7tokZAZVu+2xzZbUprXKHP0Msh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5/Tt0zrAxdocWFJlQEoRAQLVsl2SAKHmnLtcpsHMyLfKp4yz7
	UMwwRpwAEzorLJgdVGvN02x42N/VibRX7asH6RaCLMrOwzAU4qAN1lGnxGerYVnAXAco086WDkK
	d2CSwawZC4G3/+xntvb3DbODn3+JO7+EnWo0ixe6xa6vvhPFP2dxRDBoLajK36fMEw/wlqddaJg
	5lpg==
X-Gm-Gg: AfdE7ck4b+uGjRcQaKYp8zjjWyt25i+JyO6WX09tDj8cBJg0oEDzMZ9MWdy+av3F7wN
	n/ciKrsRDAfvnnzrQvVX+UrQV6AA+VF/63iVAdrJzZq7uUpLs1kPpIzQqGSN6TWvDb9Q3lkI5zZ
	6FFhtbcWCfPPvjOaR7VaHo9/6xpEzgiHSiHGHedVrz7dPlQofT3/YWmGvvXIHARdrMKUqpfO2X/
	Uats3mx4ksGGgyrzVw/kjLmhvatm0BYiUDKJ9nb/sOMLq5IpUi/lQc9kkyV2T49R3qsCgf2Ky+A
	WH44nAUB1jg1xMmKYWu2wZAuTvTJbSdAYo22cQVgtUNSPCPTV0f60W/ro7IQWdBQXGNdig86GCm
	+72Nk5pdwxdfCXEhInopv3F319sZNWOq6QyQ=
X-Received: by 2002:a05:620a:230f:20b0:92b:6805:91b4 with SMTP id af79cd13be357-930b431ca0emr1359560485a.60.1784638140073;
        Tue, 21 Jul 2026 05:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:230f:20b0:92b:6805:91b4 with SMTP id af79cd13be357-930b431ca0emr1359556785a.60.1784638139417;
        Tue, 21 Jul 2026 05:48:59 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52fb150sm1113767785a.19.2026.07.21.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:48:58 -0700 (PDT)
Message-ID: <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 18:18:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
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
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xpx4BWM2PNLHem7ozvm1CGArAjVyzrBo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfXzwoHVLCq8ixY
 jQOMb3WwgFtd8htFIcoDSA7Ec+PF4gNFO2jdQSGldHJse3wQKThGCbObxef62c34SbhIRNMXOHR
 XsclPjY2nzUnbkeul+kTlqyvUUW+sdc=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f6abd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EQpnHehRo6XFvJL-JpUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xpx4BWM2PNLHem7ozvm1CGArAjVyzrBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfX7PlH26XhkH5I
 Y4Zp6sqwpocEe9V+pgkEiibJANJSrzJ0wTcM/HO/Lm+amm4SsMSQXGOPMmP03G7UO7hE43fuSzz
 QSwg520SF1I9d05js8PG2cZOzhX+4w+P3xfUbUXoWletmJMQbwGtaQ3EV3eJsb9c/KO1HzV8nHh
 gyO1Sjc6u9GZXbX4CXkdDI8oEqNgyKd7ocbSIoiYgA04SRwCiCjBoHUkvV7FraSVibrcO1kQ37S
 0nSJrJuDY9TmO7GY4MhZLf2JBsYmKpNzd/Y+oJ1WuRLCVccdRu3/XCLvPSvw4KMFMcS8NUTsP/d
 dFNkvRYB794bY1pBTiQ74DXhxtzCWebMG8YycuRFsO8W5Hhrab5i8qY7tBh72QtaSmB+ijqLdyH
 30bFv7kHREYRjZlJQWWB4zlJWf7s7omrJrPO6T47M41BA2FkWbzxfqdHMFmLaga4VYTmMszSQ9L
 +YvTtRGwaJeDjEq8CcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_054902_942748_3EEE88EC 
X-CRM114-Status: GOOD (  29.03  )
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



On 21-07-2026 14:59, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:36 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with a named firmware-node field to identify a
>> child node under the MFD parent. The node is added to the MFD child
>> device during registration when none is assigned by device tree, ACPI,
>> or software matching.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
>>   include/linux/mfd/core.h |  10 ++++
>>   2 files changed, 131 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1e..ba9682ead2ca 100644
>> --- a/drivers/mfd/mfd-core.c
>> +++ b/drivers/mfd/mfd-core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/acpi.h>
>> +#include <linux/fwnode.h>
>>   #include <linux/list.h>
>>   #include <linux/property.h>
>>   #include <linux/mfd/core.h>
>> @@ -22,6 +23,7 @@
>>   #include <linux/regulator/consumer.h>
>>
>>   static LIST_HEAD(mfd_of_node_list);
>> +static LIST_HEAD(mfd_named_fwnode_list);
>>   static DEFINE_MUTEX(mfd_of_node_mutex);
>>
>>   struct mfd_of_node_entry {
>> @@ -30,10 +32,91 @@ struct mfd_of_node_entry {
>>   	struct device_node *np;
>>   };
>>
>> +struct mfd_named_fwnode_entry {
>> +	struct list_head list;
>> +	struct device *dev;
>> +	struct fwnode_handle *fwnode;
>> +};
>> +
>>   static const struct device_type mfd_dev_type = {
>>   	.name	= "mfd_device",
>>   };
>>
>> +static int mfd_claim_named_fwnode(struct platform_device *pdev,
>> +				  struct fwnode_handle *fwnode)
>> +{
>> +	struct mfd_named_fwnode_entry *entry, *iter;
>> +
>> +	entry = kzalloc_obj(*entry, GFP_KERNEL);
>> +	if (!entry)
>> +		return -ENOMEM;
>> +
>> +	entry->dev = &pdev->dev;
>> +	entry->fwnode = fwnode_handle_get(fwnode);
>> +
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
>> +			if (iter->fwnode == fwnode) {
>> +				fwnode_handle_put(entry->fwnode);
>> +				kfree(entry);
>> +				return -EAGAIN;
>> +			}
>> +
>> +		list_add_tail(&entry->list, &mfd_named_fwnode_list);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Temporary MFD-local cleanup for named non-OF child fwnodes.
>> + * Remove/rework this when platform core starts owning and dropping
>> + * dev->fwnode references for these devices.
>> + */
>> +static void mfd_release_named_fwnode(struct platform_device *pdev)
>> +{
>> +	struct mfd_named_fwnode_entry *entry, *tmp;
>> +
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
>> +			if (entry->dev == &pdev->dev) {
>> +				if (dev_fwnode(&pdev->dev) == entry->fwnode)
>> +					device_set_node(&pdev->dev, NULL);
>> +				fwnode_handle_put(entry->fwnode);
>> +				list_del(&entry->list);
>> +				kfree(entry);
>> +			}
>> +	}
>> +}
>> +
>> +static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
>> +				    struct device_node *np)
>> +{
>> +	struct mfd_of_node_entry *of_entry, *iter;
>> +
>> +	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
>> +	if (!of_entry)
>> +		return -ENOMEM;
>> +
>> +	of_entry->dev = &pdev->dev;
>> +	of_entry->np = of_node_get(np);
>> +
>> +	/* Skip if OF node has previously been allocated to a device */
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry(iter, &mfd_of_node_list, list)
>> +			if (iter->np == np) {
>> +				of_node_put(of_entry->np);
>> +				kfree(of_entry);
>> +				return -EAGAIN;
>> +			}
>> +
>> +		list_add_tail(&of_entry->list, &mfd_of_node_list);
>> +	}
>> +
>> +	device_set_node(&pdev->dev, of_fwnode_handle(np));
>> +	return 0;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_ACPI)
>>   struct match_ids_walk_data {
>>   	struct acpi_device_id *ids;
>> @@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   				    struct device_node *np,
>>   				    const struct mfd_cell *cell)
>>   {
>> -	struct mfd_of_node_entry *of_entry;
>>   	u64 of_node_addr;
>>
>> -	/* Skip if OF node has previously been allocated to a device */
>> -	scoped_guard(mutex, &mfd_of_node_mutex) {
>> -		list_for_each_entry(of_entry, &mfd_of_node_list, list)
>> -			if (of_entry->np == np)
>> -				return -EAGAIN;
>> -	}
>> -
>>   	if (!cell->use_of_reg)
>>   		/* No of_reg defined - allocate first free compatible match */
>> -		goto allocate_of_node;
>> +		return mfd_claim_of_node_to_dev(pdev, np);
>>
>>   	/* We only care about each node's first defined address */
>>   	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
>> @@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   		/* No match */
>>   		return -EAGAIN;
>>
>> -allocate_of_node:
>> -	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
>> -	if (!of_entry)
>> -		return -ENOMEM;
>> -
>> -	of_entry->dev = &pdev->dev;
>> -	of_entry->np = of_node_get(np);
>> -	scoped_guard(mutex, &mfd_of_node_mutex)
>> -		list_add_tail(&of_entry->list, &mfd_of_node_list);
>> -
>> -	device_set_node(&pdev->dev, of_fwnode_handle(np));
>> -	return 0;
>> +	return mfd_claim_of_node_to_dev(pdev, np);
>>   }
>>
>>   static int mfd_add_device(struct device *parent, int id,
>> @@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	struct resource *res;
>>   	struct platform_device *pdev;
>>   	struct mfd_of_node_entry *of_entry, *tmp;
>> +	struct fwnode_handle *fwnode;
>>   	bool disabled = false;
>>   	int ret = -ENOMEM;
>>   	int platform_id;
>> @@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
>>
>>   	mfd_acpi_add_device(cell, pdev);
>>
>> +	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
>> +	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
> 
> Use dev_fwnode() instead of pdev->dev.fwnode.

sure will update. thanks.

> 
>> +		struct device_node *named_np;
>> +
>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>> +		if (!fwnode) {
>> +			ret = -ENODEV;
>> +			goto fail_alias;
>> +		}
>> +
>> +		named_np = to_of_node(fwnode);
>> +		if (named_np) {
>> +			ret = mfd_claim_of_node_to_dev(pdev, named_np);
>> +			fwnode_handle_put(fwnode);
>> +			if (ret == -EAGAIN)
>> +				ret = -EBUSY;
>> +			if (ret)
>> +				goto fail_alias;
>> +		} else {
>> +			ret = mfd_claim_named_fwnode(pdev, fwnode);
>> +			if (ret) {
>> +				fwnode_handle_put(fwnode);
>> +				if (ret == -EAGAIN)
>> +					ret = -EBUSY;
>> +				goto fail_alias;
>> +			}
>> +			device_set_node(&pdev->dev, fwnode);
>> +			fwnode_handle_put(fwnode);
>> +		}
> 
> What is the reason to have this split into OF and fwnode functions? I don't
> really see why you would need to do it twice, isn't fwnode sufficient for the
> OF node case too?

We do a duplicate check here before adding the named_fwnode and split it 
for two reasons:
1. of_node list pre-exists. We add a new list of fwnode. of_node based 
duplicate check go wrong, if its checked with the fwnode list.
2. of_node need to go to its respective list as fwnode list, release 
path, is different for us.

> 
>> +	}
>> +
>>   	if (cell->pdata_size) {
>>   		ret = platform_device_add_data(pdev,
>>   					cell->platform_data, cell->pdata_size);
>> @@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	if (cell->swnode)
>>   		device_remove_software_node(&pdev->dev);
>>   fail_of_entry:
>> +	mfd_release_named_fwnode(pdev);
>>   	scoped_guard(mutex, &mfd_of_node_mutex) {
>>   		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
>>   			if (of_entry->dev == &pdev->dev) {
>> @@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
>>   	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
>>   					       cell->num_parent_supplies);
>>
>> +	get_device(&pdev->dev);
>>   	platform_device_unregister(pdev);
>> +	mfd_release_named_fwnode(pdev);
>> +	put_device(&pdev->dev);
>>   	return 0;
>>   }
>>
>> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
>> index faeea7abd688..8daa83dd31ea 100644
>> --- a/include/linux/mfd/core.h
>> +++ b/include/linux/mfd/core.h
>> @@ -80,6 +80,16 @@ struct mfd_cell {
>>
>>   	/* Software node for the device. */
>>   	const struct software_node *swnode;
>> +	/*
>> +	 * Name of a child firmware node under the MFD parent device.
>> +	 *
>> +	 * Used only as a fallback when no firmware node is assigned to MFD
>> +	 * child and no software node is provided.
>> +	 *
>> +	 * For Device Tree parents, lookup is by base node name only
>> +	 * (the part before '@'). Unit-addresses are not matched.
>> +	 */
> 
> Side note: struct mfd_cell could really use a proper kernel doc but that's out
> of scope of this series.
> 
>> +	const char *named_fwnode;
>>
>>   	/*
>>   	 * Device Tree compatible string
>>
>> --
>> 2.34.1
>>
>>
> 
> Bartosz

thanks,
Shivendra

