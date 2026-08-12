Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB99C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=; b=uE/Ax6CZa8E8clHSJ9DqVGY7IC
	sh86hG7bgirDEeQXnIGyy/6/IUi1J0PzeeZciSW5OTNAvCvUqMQ4Vi3kWuF84RGW6qZK+GEVL/sHb
	Gl6UA909xSAYFWi8OhgUVoHrJVy2t385mlkrNnnpbSFew/rX7Q1cSe4AgFouOo8CjKLI56GE7k7G2
	nOYTXBlAgOyWH3dkIBMgnLjul4Ee/qzaMm8PxjfseSWcJJ2MoJwPDsU2ufXmDRE3/tG/gR1OfHVCa
	h6C+o23EzEYKi3WRgHZQ6NxoBuGmotNvTkdOdyHz8mlVcgjt7pJEkMw5eCZjFc3V+pMMDqr9m5fqF
	6hM/moWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6sM-0000000G0xb-1Los;
	Wed, 12 Aug 2026 11:12:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6sJ-0000000G0x7-0ODA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:12:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB48Ge3319909
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=; b=UDIf2T/YdF5UCB9r
	oZ2MjTxUAxBMd6zxDRE3PpC/hkOqQLqXGPCZ9yw4UBXsmIES8WaFccZs4nLf1F24
	ZjwQ0iSmI1ZNMeeChWCVTqdKl37k1e3d8uWE85nRuU2v0nkCFtWOAG7rZ0YzImn2
	2SCp3x3KRCAEMFN8AFMfOUOB8wYdp89yv2wPDaCWM3UQfa6zU+DXvnJYS4W0DJfg
	AXcBnlnuHc26FJZ+Z6g06TC31QLV/dJtRVEnaAV19BaEqN3wz2qbWWmWy3kWK4ex
	QaFDDRhpwSFQ+x3c0Y7HqRQ7WVC6ok44R4X7x8ITy74+vGavO7jkvZaLQhFs7Qnx
	qfn3Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyr930-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:11:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so15808575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786533116; x=1787137916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=;
        b=KHR2RbwyuV1cW+80zMnYVrahuCR3qIsn1cQ1YZHiCepUSMhKn8mlmdgmowwGXr0LaN
         7AKzkkXkim0yRkIIHE2GTFSY9UQ+ON1QqJFpClmE8YdVG6bWBt5jtryrkCq5QIsh3nqs
         Eg8rwkobD9VoC0CsUoEs3JPUKwgv/mFuQjgRo1TrNUmrTJ9jlyGYnET1hLCDVOtwW2MD
         Gr1CqYKXbHPA/T4Uj227h0vnd/UKacueKQuHmribQ203DobZQYqXApq/sPK40fsDnNny
         DFCfuqDJGThHgEMu0bZjUB/9lo5n0i3iJnB6MMxu3igeIlBRmJAJXzJNvzU9nWRKIc4R
         ih2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533116; x=1787137916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=;
        b=HcF3wesNz7MsZipbBlX8Bx9Uzecp10iPbgqYZi6D2Z9L8uWemGdJKqRTscFzrxuQzi
         rLk5BQg3j+ovePAIsIHc3CkQPapTBcdyKpa78ZnCZ0+1AgcOHDidH+qnrT0rhTFqL8kJ
         5uO5rLkmQJryVsQNRr0Y+go5hc2q5ri4UHYtVlYvCIHsGOjDjEZOWzv+CKdzXLU4lZxs
         96Rw8F7FHssitnupT7tARJlkIN19yUc8wI5Dzx/a4H0B1yDncDsP8fIVZjuvyoXm3vFl
         flU+cvzcvArYBnJEXCX88EM2ONXt14Zr1wxZPmibhyLYBU53hWfCMIKEbmguLYM+v+VN
         99sw==
X-Forwarded-Encrypted: i=1; AHgh+RrdLhsK7IJCor0vnanI9N+hEB/G4C6pzZ13olCWcb+lKv0hkkkL/l8ksgydbmFu9gwaVSYBkgy8mDplCRsxZuiE@lists.infradead.org
X-Gm-Message-State: AOJu0YxhT9Qq81aD35M46pxil0hHWcOFtJpyJKSOTMjWXPgtQ1yZ8YIT
	YECNjCE1YeukwVtMSQ4VOmpdELrHeFqXzuwSlfrmhqCFR/zfzzwIu0S0AN7bpwKYkwXem8uYRrE
	X7fIPQj64jb9bic7nS9c53Y3QX2i+fQMe4jVyOlxjdIgsmejtFnndKdZO8v27QR7iDC5bzqIc/1
	KZhA==
X-Gm-Gg: AR+sD125xKEjfj2LUZNeRLKW0DjjaPrdwtScPhdWyzYVLPiAPBu223SwnD21Zkjwkb5
	b29+nhxF125BiNQe27iotSDPEBmw6bv4Y8I5hH58GtqtQc+kgHqe/DGQOeNrvBs9JmNVM08xhls
	qp65TIV/kximO8fYKo0/wJ/RJgQbzShHaeSio+I+/k7bnJbkHEzwIP7yoaf6xtIRz66N8LXMcQH
	WOPqYfTqRFThyNbnNWtQORgLBWlEBLOoERArZY4jYspadgUMpZjBgfy2vr7ZjYtQ0qoxGHLPTJh
	1KQ4ES0xuQ+U9xxx7wONaiqBa76VycNBhfKuV8cnuZkNywrnwTLO01J79P0GwsyYRUT7ppF2OM2
	YwolyjZ/rMlsOd8oNXYsARWCtkjbqLLXBEw==
X-Received: by 2002:a17:902:fc8f:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d3456f5f5cmr56902505ad.23.1786533115659;
        Wed, 12 Aug 2026 04:11:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc8f:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d3456f5f5cmr56901585ad.23.1786533115222;
        Wed, 12 Aug 2026 04:11:55 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d350be1504sm4886065ad.0.2026.08.12.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:11:54 -0700 (PDT)
Message-ID: <b7b68db4-a3cc-40a4-8748-527abe08934f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:41:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260812081856.GF1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5MCBTYWx0ZWRfXysuxEfUr2i5k
 1VueXncWROlcP8tpJmp1Bf/p1emuD0MmPHLBGL7uZ5o9Ycux3/CY7gGpYozeS9yy2n/MFJcmCPK
 G7N6tpD4CKgS0yEa5GVMhm4R7v3nuYM=
X-Proofpoint-ORIG-GUID: MOZBwNHZb4vwsPmEpuYfwwndc70rGybq
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c54fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Tp_YqcUnzpVuw28kZAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: MOZBwNHZb4vwsPmEpuYfwwndc70rGybq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5MCBTYWx0ZWRfX9Du3P+6YOV/X
 JnnVtxdFq6gq/VdoZ3Qjrg/ssYYXl/6tcurIwIvo6fn+g/Vzl07/LMYZX+RgINR8o6JC+zaavf6
 uGpukMsXomeOhEL/JmBgucnrC59vdfHl2/9WN1s7wwpYWDmeW075fH6NBHGiBbv+1CBh2rBWC6q
 n+Wy+slakss4IlVWLx7/cuNt9//V22kIv7LKSL8UkoKCV+fT69QuSF2ykFSxTgCtOJV9o7H2ATr
 4W+0TaHRhK+tuU1xYYfJS8hgBc2YcZ8fSW0t8Bx7xnvNQNSQfCQ5cKIbYh2johyHeRQKacR085h
 nnJN9EHCQBPHYY+nJ5y9hwuxa990RmDEORmcb7/Zv+Nuh7plgxxGIJoWMm/zTUF9c6ixgIhCd+K
 zyhGz1ooPLRE9QnZWOjHxlt6GCMQyeCXjYXLqrBpdhIwPG3RT7ZUOyRFxOu7MEab2RXuxIrcwD+
 V5rqx6Z76XOHKIBqx+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_041159_177032_47305A11 
X-CRM114-Status: GOOD (  23.80  )
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



On 8/12/2026 1:48 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
> 
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
>>   drivers/mfd/psci-mfd.c      | 27 ++++++++++++++++++++++++++-
>>   drivers/power/reset/Kconfig |  2 +-
>>   2 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd..7befc4fa86f5 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
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
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> 
> Okay Yoda, but why is this okay?
> 
> Needs a comment.

sure. Will add a comment in code.

psci-mfd adds two child cells, psci-cpuidle-domain and psci-reboot-mode.
psci-cpuidle-domain is boot-critical on supported systems.
psci-reboot-mode is added separately as an optional child. For 
non-critical failures from psci_reboot_mode_cell, we want to continue 
the probe of psci-mfd.

thanks,
Shivendra

