Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F78FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=; b=pVX5Ss1aHQWgAAwA5100L7/j08
	300TOsEX/jfX2L529SnKl9XivQKLp7zmY9R1mKDhNKQ7SUV2+fhE4Go3Qos8qb1xHohIESfzJKOEv
	tLCsoH1kKOr6UaD/ISd1GlnErhfH7fdcR2OHwljXaKMG1yXKqx5RNe41A/pRPMeAArqdeQW4csoa4
	tENpD5Sf8FmmJ/4ojo9EJ7fEHxN+Ipw+uZ/esW+XjBpDU18UNffw0HesuPmz13Mm4B4aZGIjCF9p4
	of4PtUemz1VN0EhRw+IzTB8QzpAN8sIkUIf0HcaSPugnUd2X1WXMIKDzz88YAqn1OJKn2h6VPyf90
	wLRWMLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqgy-0000000Fi3K-2IJ3;
	Wed, 03 Jun 2026 18:51:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqgu-0000000Fi2c-41WJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:51:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6bFY1993518
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 18:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=; b=DSSI+CfaYqpxskZn
	Rjdu0PKMxKG+Uyb5wU5NB9fqm72SMVzbOmy2uhC5y9v/y+sCaoGLbzawaI459RbP
	hoi/XvgnEXXW/2ssP3yYhRcjsvLsX3MfeoK0vqc/ySRCgF+McqG1MnlU5mXZ4WPX
	KNS8sC2gxJ7tN2eDYdrTDeKDhl38WehZSfh+tC2OCggjSosgizvYsdngF2Gu0LtO
	QLltNj/mW7ziAPRoNPpeB1ySABpukGjr0OEWQeIuFwEn5GrXF3i6N9BD1KrbV8l0
	PyFseuIbl3VM1V6nkXBlSqw/7K/jRsNHMs/RoeO6Yzu7Q1uQyR7Z6lIbjypUqzd0
	oKV4Dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8pr67r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:51:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so5195743a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780512706; x=1781117506; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=JXiDH59KtfU1St0TQel8SuX6bEUzCWfar8oeyITsIfYza1VI4nkxI2c7prXLCZnr61
         wLT1AlJQh8Nz8F8dW6NmIX1Dgl8eV+rssdft7XJ7KGSLy/8RjxJ2bPSr1h60a6mXQ8dg
         ZcCCdCpZe8xWP9PlENfqmUD1L+f9DrW2BQuPGZGOi7i8LG7Ft8yTbdBohAOV7gBedqAF
         eiglILTyARgX96DwBrWL+yQ2VSMxScJ/qunza2xmblE1tkUkbCrkZAXVf6siCLcrSrSs
         uJeqyooUvy/xdq5cd7+SxynLJhgF2Wj7GixvfrbDRRePV3O/BhHmPk23heH7/rzUkCxP
         vmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512706; x=1781117506;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=NznY6pQe4ryngZgbixr3z7iv0v9tg/EaArMS6V+VeY7G/YiIgkV1J9pOR7DPfVGuB+
         1j/wtosrw40NqkViDZ8fGDWx3ZMkxwAq5YsScBOY+r5ppfV2Jm82Lo6eyIY63b4H7kDx
         P2dhaZiExg4qg5+rvKOBPNiEiYv4QiPIS4RYtCoSdRd+Z5YuGqUU7zaUyXIF2Rgh1D60
         HqzCE+jiLD06a+WlAV/jTR2xps62dePvUFZfHjq5fb9+YI7eorCd7op/xcrlbarWnnN4
         y4BOvmfZyVNQJ8LLCeIqqAs4YvEi0iRUun+BjAtzl5qS34O059FRr7MpAi6GLlgihgSO
         5aOA==
X-Forwarded-Encrypted: i=1; AFNElJ9p8nwtUAd4+TFajVEsZTJcYquSa1+U9q5ID9z/5KQk57IyK3zaK5pd8bIXHviFGEKkO55levpjXW9vTtRVn7y/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Wqflyjho+9oyhw7bDNkgOXUGANmd8p1Q9g1V9cfd2PU4f6SM
	+xQ4+rMm6+RQECTQvnDuhZrEISNwEoCShPvtOke6BnvUhuTKugmlfCEb909+EAVYKXNNmu6dD+t
	/xyIKs9ECV6uFs8bHE1ndy3abFb21dlEXXfSkoupOMfqAYYGWphESrXc/5YGc5VMTblruVCIvj0
	lnig==
X-Gm-Gg: Acq92OHQUasYA6trSc2cAtRGbv/EsQVxpVY6aFVNM3A3GlDa1KW6NAI5i0grfyitKa0
	eu6kDEA+NEE5L2m/QtdN5PdVYOXFW6v9ZVTt+sxRG/bpfv2hYHoSd9AuzlAxDZ0LcCx/wJ3L9BF
	F3stq04IljnaHLrow6ls8l5b9P/xYgW95SxRq+ZKFLr4sYMxobNBju+7to8rMVW7BCJC4eqRIAz
	qCxjjiPeBrbR3CNJ58zNKFkftvJLEDFHdZctS1LixLTrkMBhiYXFyOXeUNLWg+/KoTdPm1QDceq
	paZVAyPcDg3+PCx8o8Vt1m9aCURQezp+/QrrWY7b9Yqi8VcCW8s7bzOkX7jg0GU9tm7QbH2WuVK
	pEbxfn9hVVhgwPIwn22BPiRreczY3ecxRnzgZYp9yExTtDZPCXNtpp2RaE2QUTkiGbCuH
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701718a91.16.1780512706177;
        Wed, 03 Jun 2026 11:51:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701693a91.16.1780512705590;
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2001534a91.0.2026.06.03.11.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Message-ID: <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 00:21:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
 <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S0pVzvHnxZnrZLJzUTk113VWuwseZtca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE4MyBTYWx0ZWRfX+40jmeW3GAEZ
 tR2410VNCLcsVOSeAzLN31HIf98flPQq4ln4zVjRJr9AavKXs4eiGkL8c7EHwGsJDBlRO3Lkb0I
 zI5vBP4EkUWy4SVIGd0fx59r5wuhyXlSDePsytwNy8K3ANirurlxxvNVveyqlwC9lAa+FbwPTz0
 lg8+X5jdj324S/8EYnpq4swiU5JZ0TZFy9wpCuFLLidwkIm+wQ2rnev/GL4Dd338RkFr4WsnqmG
 p5HkhSj4iLgz71zU6DWGVVnZMRe303u2MZewoPKvwB7XPbIlWs5UYB+1JS3thaPfp704Q9Seoq1
 pnXYbenAtPxCHVrkwTZVxGdzX6jINx32x+fiPxWaEc43qKGi+eIKns/45+O5R1fjmzzVGr4eZH6
 7+6sieDTNIYHCir91tcZcf7wGqByguuREEekPP/GOxMw6FLtiScLUILaOd/gXiC2Lz1fMmKWek2
 Czf+FhaXLTlnz+RQxiw==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a2077c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=eYGGw6GSBUcLogt407YXxQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7l-9YH0O8PdptT7AxrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: S0pVzvHnxZnrZLJzUTk113VWuwseZtca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_115149_125719_859CF6DA 
X-CRM114-Status: GOOD (  20.41  )
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



On 25-05-2026 15:04, Shivendra Pratap wrote:
> 
> 
> On 22-05-2026 14:38, Bartosz Golaszewski wrote:
>> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>>
>>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>>
>>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>>
>>>>>>
>>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>>> mind is something like a new field in mfd_cell:
>>>>>>
>>>>>>      const char *cell_node_name;
>>>>>>
>>>>>> Which - if set - would tell MFD to look up an fwnode that's a 
>>>>>> child of
>>>>>> the parent device's node by name - as it may not have a compatible.
>>>>>
>>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>>
>>>>
>>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>>> have the child device reach into the parent, look up the fwnode and
>>>> then assign it to itself after it's already attached to the driver.
>>>> This should be done at the subsystem level before the device is
>>>> registered.
>>>
>>> Leaf drivers reach back into the parent all the time.
>>>
>>
>> But drivers don't generally assign firmware nodes to devices they are
>> already bound to. This is racy as in probe() the device is already
>> visible to the system. There's no synchronization of device property
>> access - properties are assumed to be read-only for a registered
>> device.
> 
> thanks Bart/Lee. Any pointers to take this from here?

Hi Lee,

To take this patchset forward, it would be helpful to get your views on 
fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" 
in mfd-core and then a lookup logic, or any alternatives?

thanks,
Shivendra

