Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C931CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=; b=mkVwk7u1C1A/dFw1x2TU9iThIX
	+ZIbTrxDsmjCH3wXTXVvi3Y+/xZvZHfT+e+rXD9s4FRR+OMC6i3V5+vQGFyspHPGWa5CDNFNiBOER
	N6zgcbgpukMA+xcaPc5jNAaST93nIrWCOhgJ5+6ig/k5mFgXSZLg0xRxtiULU5Ow6VMlTojcZOD/p
	GpEu2AMkQtDb2Mzntx7JuwMnFe/ChbPiMnZALvOVhIheXA1ZecUzzdrLkYuF6f5YoRa/Wt9TpoQWF
	zzl0SfbmifgTBWYPe5EAzsAcgHhVCDAWigMBNdYkwpUBVV+TREnRCEx8N66MmYb2H0ySfvScVAyCR
	otMDEtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP12M-0000000GKGj-1rJF;
	Mon, 18 May 2026 16:41:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP12J-0000000GKG5-48qP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:41:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLBxJ1890393
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 16:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=; b=nXq4Gun5XcmOC5dK
	Mh4iQTzfSmdrY+wgULxisEUfKzQfDG7UDajUXs/gdYGfua2IDz00AY9tjkcE65/R
	junGhwRNh1RMCGjrImutOIPiDR58esbE44e2C6N8Slb2V5Kl+pw8iyvQhKQ3I1dg
	sAnvIHm4/N07gJzusBIBJjAEtoWaIDizjft2u49QjI+ADKs0ixM4Ct9Eo108ESjK
	UOY0dfLUBWfKjy7kjFZzYmmpd3Ju61ZFY/aAXoTihVLq2j4GNEC81tEfnsYD7D7z
	e5LawrUW6fWSCWZnD+x3gjbdQjiOzx961j36m89GJdFoM4gLF/SR5swWhq+DQqUY
	frFksg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw112r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 16:41:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so2191814a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122506; x=1779727306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=;
        b=SJ+s2YgaVV/gMCrtpQXjwhASPTGooAe1CmmPbOI15MfzsAuDHxF4xP9HkItY2o68mq
         9o5Unk8/9TnvCj6tvEpq4d/hVYN+8igSmscy3CZ08MlbzKx5F4hZD+GIlTMu1oyijj9E
         XXN0oWV2/x5rBsXLTaCNLY9VLvPXyxSuN914W6drtiqeLy1j0vf7q9cXVw+vvy3C3YuB
         j5vKvPhTIZrWAO3O/ZDSzRF3ydHMTXUnoabhpjS9S2WURJkCiPVKbLVrZJbInt7IBl6D
         4qx187ymyzyZcnNf9HhPLWNvCnR9OLhSerfv1Vf+97OifnRK+TqvWvtr/21oxngckW7M
         cxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122506; x=1779727306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=;
        b=chogivzrv3JOzUnADYwBUws4KNJu02p6O1PKTxCKzXcNEy9JC9p+0kkAk020tmml+r
         hCPqg1iR2xXGy7OlYmAagkdjlfUf2bTota6f9tVSBTJp6Gmb3o6ljy0oRvqX7YGxz+4D
         Be343b0aQM7oawKqWuhIxStbCrFYP81DFyP6ZKUROcHYuwiVBWGnWQBLvc+t1s+GFuv5
         qy8upESoRIA1h3eseV9hq63OjbiNiKGqgV/38Lwm4868N5XDSzPj4GrSI2W9YERraxiT
         EhNnd1BU4fypMEcD9zToyr9x+/m5twqNL6CTz/mIfbB6sMEq5Ww5aOBNAfPm/v3MMVdH
         wDQg==
X-Forwarded-Encrypted: i=1; AFNElJ/JgVHy4kwMFb9WZX5/m1Kj5RDDxBy24wq7ORVcHJt5QOXmdndch1n5TUeElui1C8GNiz+okqr6i6OQE7k8MppD@lists.infradead.org
X-Gm-Message-State: AOJu0YzaDo31w7PVc2FJJg8fNbRawm4euyWiWD5mipJhcKd1CgSx7CZ3
	hQ/z/6t5YQQUdSW0wCSQsEDNpocGOknmX380Qk3SCeVUURP25IuA7McITmFr+as0ybcJeEwasib
	KpA1MBieJpZ3u+f1jQcK2P+PaWz4ZFijVkPtRbhsVjd/njWw+Ui+dn59LY5fnboP7RwubytxMtb
	tL8A==
X-Gm-Gg: Acq92OE2B6ZuLTK4gMw1leOEWBBMGX/WypnbnfYPwKNPzUuESMX4iYl+QwjpJfLpsOx
	ciLXuG3CP+/JaVB42m6Ot8DyIMEm42NkjpCGyDIXUXeEW9N/w28nhqPnpdbfi6KQasY4Ok2SvyF
	B96fqVtZMGKO/Wv6eigNxuHfa6/f4JZZ75AH2YFypfvMiDpLAvKt6CPbNiFLtYIZrDb1S1c+khO
	ioX9g9hlGh4jXBLpiXl41fAfim39sDjFgplXbpf99Jkk99fliZow3wfeL7m5FyjNVvgtiozVVMz
	uqZbLhewaQBK6TyROP4Wx8pT4pkBlBvUQeJ7txlHobnTC3jd9EWQhtXNbMQ1dF7aG9y7rC3AV0t
	QOsIB/TD/IlFEINpRWvGIWmbnC8EC0Y7XrM6W9u/Cw+svXlET8wbYnq2D
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr15054676a91.20.1779122505869;
        Mon, 18 May 2026 09:41:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr15054630a91.20.1779122505327;
        Mon, 18 May 2026 09:41:45 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959f52fe4sm5744383a91.5.2026.05.18.09.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:41:44 -0700 (PDT)
Message-ID: <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:11:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
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
        Srinivas Kandagatla <srini@kernel.org>,
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
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b414a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=y87zbT2qfcRNAzJ9VcpEUA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GJNFty8P_8wqzycR5nsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX917FDFCItME8
 3edOWNWuiwmkiLWQoOufN4TexRl7TQs12Zpl0m0juQNtWPFIFP1c6FpPkJLOvtRrbBTRRE00Cfo
 37vcq83kuahyo3lFo5OxgTukT5hTSTUlbHBGkhRf585c/3k/y+9wEf7FtDVRvNiJARdFR/pNjnC
 LqFr2rQJPM7vbtpnGwAKlQhnAUs+t1sbmzQq8DvoK0BSzNpXHqyrJNS8R1BD9nyR22v0yykFwWK
 mV+AwAPipzmfgvvtmmLQvjL6rCB4OqR6wBlIztY/yRoM24gWr9QXfG8lyyXbuLt0FqpBv5XJ6JP
 +FCwGadCkX9l8z92uzHBhbZVeEqZKuALzcaHaRQuwcfVPYo8TZHjGAFiBjU+z38Lz4CeF2zHY1c
 H8yFeNEmdtz7OHKoVpNHvVsPR+IUws9Sr6Cs2Y8lRPOqOTxStT84qAPg8idDNJysdTw7Eu2KbjM
 WClK5wR1bJ2FaWFdFOQ==
X-Proofpoint-GUID: I8BkXKtet8T_ortyWOTwmWcgQ_tmZw3w
X-Proofpoint-ORIG-GUID: I8BkXKtet8T_ortyWOTwmWcgQ_tmZw3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_094148_041863_5E58E1A5 
X-CRM114-Status: GOOD (  30.79  )
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



On 18-05-2026 14:27, Bartosz Golaszewski wrote:
> On Thu, 14 May 2026 16:25:49 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with a callback that allows drivers to provide an
>> explicit firmware node. The node is added to the MFD child device during
>> registration when none is assigned by device tree, ACPI, or software
>> matching.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
>>   include/linux/mfd/core.h | 14 ++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
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
>> @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   	return 0;
>>   }
>>
>> +static void mfd_child_fwnode_put(void *data)
>> +{
>> +	fwnode_handle_put(data);
>> +}
> 
> Ah, this seems to answer my previous question, but...
> 
>> +
>>   static int mfd_add_device(struct device *parent, int id,
>>   			  const struct mfd_cell *cell,
>>   			  struct resource *mem_base,
>> @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	struct resource *res;
>>   	struct platform_device *pdev;
>>   	struct mfd_of_node_entry *of_entry, *tmp;
>> +	struct fwnode_handle *fwnode;
>>   	bool disabled = false;
>>   	int ret = -ENOMEM;
>>   	int platform_id;
>> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int id,
>>
>>   	mfd_acpi_add_device(cell, pdev);
>>
>> +	if (!pdev->dev.fwnode && cell->get_child_fwnode) {
>> +		fwnode = cell->get_child_fwnode(parent);
>> +		if (fwnode) {
>> +			device_set_node(&pdev->dev, fwnode);
>> +
>> +			/*
>> +			 * platform_device_release() drops only of_node refs.
> 
> Which is a separate problem we're discussing elsewhere. It should probably drop
> the fwnode reference it holds, not the one of of_node.
> 
>> +			 * Track non-OF fwnodes explicitly so they are put on
>> +			 * all teardown paths.
>> +			 */
>> +			if (!to_of_node(fwnode)) {
>> +				ret = devm_add_action(&pdev->dev,
>> +						      mfd_child_fwnode_put,
>> +						      fwnode);
> 
> What if the device never gets bound to the driver? The release will never be
> called, this is why it's wrong to schedule devres actions for unbound devices
> and one of the reasons for patch 1 in this series.
> 
> What I suggest for now is: in tear-down path: see if the cell has the
> get_child_fwnode() callback and - if so - drop the reference. Add a big, fat
> comment saying that this must be removed if we decide to switch to dropping the
> device's fwnode reference in platform driver core which may happen soon.

Ack. sure. lets me work it out.

thanks,
Shivendra

