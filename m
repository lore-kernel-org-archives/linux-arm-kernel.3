Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29615CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=; b=hvpXj0xOdYQZ7OKIOyklwWD77o
	F0mbaIMyfyEg7xhlOqn5v22RS31Cee4+C5n5RzKwgwRjGCHH8VdxJOdoKASAPkiJotcCZp020Oz8F
	pj7QCy+EzcbSCPczboud0QpGynbUKOy/KXyMrXb6C1TXvq0q1bov5Sb2s9hYyPWGNs7qiHJ0RL5qO
	8ty3l+j2Lz/N4ia+t4WxorqxZ0s5nRf2+38X7wFXlUuyA5vilfqxjBEOxAUCQI18y+0gD1tM7wgTH
	7+KYtgkOXUibPuZnhTrzpzFh9Z8sNMyPRsPPdRHzIsQEFTJUPxp6C6c2e3b2P1uIj0iDM94hEX8TN
	6BKPJoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiVy-00000009mV9-2xJG;
	Thu, 11 Jun 2026 16:44:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiVv-00000009mUX-2qjb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:44:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErlx2832202
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 16:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=; b=luUTcME2sUlw61mL
	ReMyeiq0+X/1aoZE9CvGwEOvIQlQuWzUOedDJ/3cUnZ45h/B+oXs8/UysFWThEy6
	qPEEws8zhWxe5KJCYqvN8DjWs1W1nWf8oundDLi97+kbAeNwDrdXq/5DOwZYb1jO
	9vYUWJOSGfFqsRdDvUDeg7N1EqGwQOCBWWILNEF8gpNAAPYq0OFbiyqzBH50IQbY
	KMizfSv8hpypr/f4KRf1GemUOhia9OAlWoQqdvy9Q5FLc8E+vxNya4n4iHH9sn+c
	n57r4ascIllM2zZFrW9Cb0eCASmchsxOOXvK2uB6UvGBpbyKyjYQaAuPGo70I8qR
	9m7qUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vcft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 16:44:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf3636d6c0so277745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781196257; x=1781801057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=;
        b=QN/noVvhoYYnirfTvtnPN3Wi5vQXYSNyyupsA3l1ItTizAKSQXRx564zljdLjKaVqT
         F8lAGN1N0TMblyokH21cTTzD9+QnM3mCyvuiiO2WrSU0tjfyrP30wOZU7qMT6Svs+lY2
         BeQnNdnIGkWB4wGoH1ikgg9waBex3Qbb33jEX+6w9xqKNKaiJPGTVDf5ue3ED1g6moLV
         Md/RL3wTylzuSzZCfvFadD0hXddtTAZ2kSWiKCAdooiiDFUf4c0jVZgj8yKB4Qb66txo
         fcwWHwoYqd17m8FRXBHKZeZVNjPjtTuNwk3VUI/w7zU2qmrlgIIKGYlII93LSRwnqJGM
         PTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196257; x=1781801057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=;
        b=JJPuxU2z1r/5jJpCOpWuLQ5M5qmkrkPFI8vbjqeAsYopVDmZWBOC/Yiv8RECM27UJ6
         vV8K0c1jMhnilhQmTlYKNwQSAOz5+ZdH/d/O8vCb4mFPUXybCOXyijBW/1YEwsuK5UaD
         RRv6BQiHdBCt0q59J73jqfjlnDzeWnhPosQAIH4zVD229pygpXkvRQG9sAenJ+1RnbCo
         LaKumFgdxjrLS/ET7PZQNL5lKjse+xMY09jTXMITYLT52rZvXo43EdYDWzPZOdy6753L
         jkzyn2dClQHDe4xRbfmsAsHN0KGeggFuT3rt68hpi3rClJcObwWxZjpgXQAR3EpYSlYO
         rGPA==
X-Forwarded-Encrypted: i=1; AFNElJ9qbfeBnHJEZbzPFmpURIM9de0qi7xmOnyj0CipS5EHPjzRY3yj/I8HWKlck0PMULvdP0qIKOv4gdqQXe+s5ml0@lists.infradead.org
X-Gm-Message-State: AOJu0YyT826H2/noBL3+5lODue6p8l2sCdQgsjMAQ3GdtmChSLKPrFd4
	ERvFe4tYmNOsy+5XoqLIcIFjoTx82EpUAbg0n9gE7GkM+6W8UbMQOWpYbNt25WrS5pHnWtwTHDE
	dyPBPd2jP5Fvqn+P2ro6UwBR3+MgXnSU9LUHu2MBdYzVQfwIAZg3cCW9hZHlN4tBLmfK+llWW/O
	2Qxg==
X-Gm-Gg: Acq92OFvmIBltgwC6GA0VhKCMHjiQzpCArANX0lnpdUebpLYaAV/19NB68IjEqNAtGI
	crN9KGbjXQEGWLplkelEPLVhBS1C2zNwtjlJBVu2yPueOoiMxRL2gu/fHOdAYu/ueWz2TfRApuV
	bpKyN77FHXlaxW+ch3CPwrU/N4UXAsfqZwY9NXHqbmzaSxhQ/X5jGlIUULEzg3m6xYtIzHwjeUP
	tasDhfpPw4kfUXK7TRg+9w16yxOHAtc11Zkd5Sqc50bz3ZqeFVrJKHxwRcXkGSES/Q5MQFUjiNy
	WzcgDlhA/u39layAaS8KQ48NLmkBxJYufPVWpj4rf7tmMPxk48htGLWPkrOujgQ5IOjMR18d+Nl
	3RQ2LgKWdN+L25i3RtkkpW0Ko4gETEWkyWxl52c/0Swx5axcFGNOxJ5pV
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr40351345ad.20.1781196256554;
        Thu, 11 Jun 2026 09:44:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr40350855ad.20.1781196255866;
        Thu, 11 Jun 2026 09:44:15 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.224.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm285676815ad.22.2026.06.11.09.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:44:15 -0700 (PDT)
Message-ID: <9b1eb177-3a54-4e27-878d-b0e66362a30a@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 22:14:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
 <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
 <20260611164211.GD1212816@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260611164211.GD1212816@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JkRa7Lv-iAVs42skm5KiWlLz_29Km8Zh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2OCBTYWx0ZWRfXypJUq94RqOXK
 zHy9OgRJGqZLxsGINxrfUb9WiqgozKfFgh88+AlI3cMcs/Jq6og43t5UDdVE0Z84FDspnTyAMtE
 7A7zbSngHItVWdU11jvJIVeO5qxZqZA=
X-Proofpoint-GUID: JkRa7Lv-iAVs42skm5KiWlLz_29Km8Zh
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2ae5e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=7stYiaCvZhmFmS4NdBt+oA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=lPjybrl6nYg-Po44eRwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2OCBTYWx0ZWRfX32R5BthK6iet
 kmdnJsoHUSBFtjHwTcLeXKDSmxZZt3WoE9hSFMiaBIBPTZMPuu6Bvfl20BeB3CeT82dNkqznjCy
 DGq3wcf9GvSLXdG8/y6a1jLXL3POYqFIJdxMuIgvf+r4p3ya8+8zi9a3PSQ2Z14BiVpdMLyf7Po
 k5F9ucFboaikdaT1f1BWRTDkizg65TDzPn9Y2gX+O1kqUzwS6C/Orpo+x/Vw1ubhBFFsR72jRSG
 4SXTb6mhKKS6VFQ7OxhKYbHTDhmhQIQ17Wj/bzFk22b4Z1nvRya45Ynu0TCbBycmZTrdYoPjm91
 k8p/exv3XhFwEL1tRYoX4Sxp25FtYTmtVW4139phME9JdGnZjj0dOV4HZcj1oXLyr5Bx3UbHmXe
 y8INwaw5DO5JSHzVOS1blQ2exLfS/7DuJoyGGd431a5t1JHOfw0G9jDfGUIHcuZPqv+icU1WMNX
 nT2MnCV0GtLnrT3cevQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_094419_725586_A901BCB3 
X-CRM114-Status: GOOD (  23.73  )
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



On 11-06-2026 22:12, Lee Jones wrote:
> /* Sashiko Automation: Reviewed (0 Findings) */
> 
> On Thu, 04 Jun 2026, Shivendra Pratap wrote:
> 
>>
>>
>> On 25-05-2026 15:04, Shivendra Pratap wrote:
>>>
>>>
>>> On 22-05-2026 14:38, Bartosz Golaszewski wrote:
>>>> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>>>>
>>>>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>>>>
>>>>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>>>>
>>>>>>>>
>>>>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>>>>> mind is something like a new field in mfd_cell:
>>>>>>>>
>>>>>>>>       const char *cell_node_name;
>>>>>>>>
>>>>>>>> Which - if set - would tell MFD to look up an fwnode
>>>>>>>> that's a child of
>>>>>>>> the parent device's node by name - as it may not have a compatible.
>>>>>>>
>>>>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>>>>
>>>>>>
>>>>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>>>>> have the child device reach into the parent, look up the fwnode and
>>>>>> then assign it to itself after it's already attached to the driver.
>>>>>> This should be done at the subsystem level before the device is
>>>>>> registered.
>>>>>
>>>>> Leaf drivers reach back into the parent all the time.
>>>>>
>>>>
>>>> But drivers don't generally assign firmware nodes to devices they are
>>>> already bound to. This is racy as in probe() the device is already
>>>> visible to the system. There's no synchronization of device property
>>>> access - properties are assumed to be read-only for a registered
>>>> device.
>>>
>>> thanks Bart/Lee. Any pointers to take this from here?
>>
>> Hi Lee,
>>
>> To take this patchset forward, it would be helpful to get your views on
>> fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" in
>> mfd-core and then a lookup logic, or any alternatives?
> 
> Can you please make your best pick and resubmit the set please?
> 
> I'll comment on a fresh set with fresh eyes.

sure. thanks.

thanks,
Shivendra

