Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76865C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn6sa08jrce+SrXB4mT8Tl+55LBGQlikiUQGmI3nyYY=; b=yma/oRzCkLe+mTjxOO2WBS3Und
	igMhQPL8X2RJwAHFvIzMsuNfIf/w4Ci0O0KAB/dK35XuRs2G6tcgcimtcFTYGwNSiBuq7xBmE9Ft0
	vsiXhM/hiUOVAjWpZ6ktAvdM8whxBuNtf+c44pnxY58LaTOtkBf9PIZmJGpFduzFqMXOvCXy90jcY
	kDQqe2cRF7Vddgswm52GMD7XsxE6HmnBzZQaleQXPYzHmrRoUgQnMn0JZj0FJA9tBptVF8sUcWklT
	OPJYZsUFJECkW+15RWw24ZIb8FgfHVIHXy8qgn9tfWT6viBmpyi3wP+ZWP/TiIxBYLzyQndumzEs/
	iXmNSLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRQS-0000000F4vk-0YGM;
	Mon, 28 Jul 2025 17:14:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQOd-0000000Ew0n-3d7I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:08:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNsv018226
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 16:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nn6sa08jrce+SrXB4mT8Tl+55LBGQlikiUQGmI3nyYY=; b=IefhWrKlB6nwWDNl
	TYQrgeN8mN/bUA+p8NXEabI65ZA3nD0vYV21+12VQDKlTEBxEWfuNGyxbI8YK0Z9
	vUv95DIGylToYjexSMCeGWoR2NtcMbtxL5lIQ3+v2SO792To//malVkDSuEybKxm
	9B7jkDsx4usbVsC4Zr6YLKwCWAIsCoPiYfqRB01gummBqpnuJzzgaY/QGTJQdzu6
	gs23oKaFZTWZ4xeBIXk7cf19j6Zi/qQ5vkDe/xk86tP1HYzTAhmqGG0XHI0rArD+
	O3mC6ZQvKQDeqklhejlG5dWuhgqm5MSScxDIUF7CZqu+z7ksOgP0coO0rpLZ3Zdt
	Hpm2BQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkw413-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 16:08:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31f030b1cb9so1238056a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 09:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718893; x=1754323693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn6sa08jrce+SrXB4mT8Tl+55LBGQlikiUQGmI3nyYY=;
        b=hsTe/O7dfB2U2kUD3LmmHaNmYPZEvOcHCqIkG95e+pDul7f1GF2oy+kMfPR+IKhlf+
         ovIDlyO2scCaFkMu4g/5UGUWKRSCTNzjoEEm2yQGYWxO4vXYNgK7d72GG3MbevtGJ5FV
         vobX1f6ruAjUXSxEeL04vYr2/n6xFtFcF3obO8N8QYZNGiEs1923j7IDFblpHu4PVEvl
         un2EWpsRH3WILQMf0G+MseEEqioy3BlPWOhkRm5G8CiLA5eO6bqw2Rod7chlUQ5fmh/g
         4HuLt4NiIDo5nhCPFbh/V/zmFVo1ZTBi6iyzfBH8sZl5FgZgYCb5wAI2vj6BjLcRDqID
         fRFw==
X-Forwarded-Encrypted: i=1; AJvYcCULvVa5HoEJpxV909MNq3qKgMzbLYVBt++4qjYLifDZaaFvjg1R4kAZPxRfrHQhj33UMHr9U8i4YujKrcSjf+0b@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuvg6NLw/ZMzrbbIpvOVMl6StGMx+5SZtJobMRHTvRaZz7qrKm
	xjxRqksLhRV/wsjY/OMuRT26PU9aj54JxKGmGUekAkY9bdg+RyP3TIiX/pg6jU34Y6kaTiFYini
	vuENo3gPC5EXbfv9mPDo5GYPBwLuvf2khEKBsQU4+4KLokjaVLIirPD4UKl7QRgorXaHLrAGIE8
	XTzg==
X-Gm-Gg: ASbGncvU7I8W+K0l9y/qYyw5xBCWg/aXG+J0uWIZCNsuXexP3P0IXjX8JiDWxhRx3v6
	qr3CvhUEVqB3ue0HDlMgZZqX+T2LOQFeY3JrIWXgvos7hZW5vUcDisHsNuXOWMN2+YFdANGMgOd
	QdAw6JuEvcNc+rQyX1Iz23SCViEifmd+Tuob8ZT2Uh7IrIxnxwixoxT6oPcc8GSE0UQQRARBLxU
	5VmL5RKwkPE1soqGFzC/+v0/2nc1T09igK161P6WRgNXHUX5n7eqAZRxsTAZtGh4S+TKNayLDFg
	k9WmqSWL1JWi/kZIOBaICM8KBcuiT3431xgJlw3yjB549Xnh3ajK18DqAitA+EJOhRvBKdn9RqW
	y
X-Received: by 2002:a17:90b:58ee:b0:31e:1311:2033 with SMTP id 98e67ed59e1d1-31e77a1a541mr16647259a91.29.1753718893360;
        Mon, 28 Jul 2025 09:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdgFqQRwLc4WbeRsTRyBtIJODCU+0G/vz7UTUiQVGLbmbQjHXF2a2GFm/CzGuJHOKwTFW5Lw==
X-Received: by 2002:a17:90b:58ee:b0:31e:1311:2033 with SMTP id 98e67ed59e1d1-31e77a1a541mr16647145a91.29.1753718892672;
        Mon, 28 Jul 2025 09:08:12 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66376377sm9863788a91.28.2025.07.28.09.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:08:12 -0700 (PDT)
Message-ID: <46261176-199b-4f6c-ceb4-14646087c814@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:38:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6887a06e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sFC1+cT0Mn4vjRNJ/HRkpQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=9xdhny6Toa8R1GZ1QJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExOCBTYWx0ZWRfX8d2qhA2F+a2y
 NhyHfV9RUWdLaE1FmBxa7bU49gqcoZzqMzRkKyTmQ52gt2lxYhDtC1pJWuqM0lcbzB913/JDUUV
 0KyhNcefpKM6NQTkJsm/J9KWR/2irPKZRdfzCmlBB3PdWtoU/ols9HSTxqVIh4w9cM0gwcduGhb
 2Y22nXcKfOW1w1avzoJZtjP2HP/e3ostpQr+QH1H6fQQlKzXeZQ7UQNM20Y/OoChwjRnxJHGIoo
 ZcE1ZPnvTnzB2uK3GubKpfKeNYqrk8C7dW31Ek8Ke62oAXPyDNJLDUMWEDdWDQm7vP42VaK8Di7
 knVdHv/gbl1fuLSgasHWyqyqmPtoGYulvyyh63qj0Sw9ysVzMWNhMtJjHUE6yujLIcbU8I4KN7j
 pgXkHaQEfMT1XXsdTbrsSfs/rXgUbk7K3QTAkv7C/3a2T6lfaLbLA1LfCpUiaITRH9ksnlKQ
X-Proofpoint-ORIG-GUID: XgNfgrfjvDD7qFlyC1pwq6y-CCZtgFNw
X-Proofpoint-GUID: XgNfgrfjvDD7qFlyC1pwq6y-CCZtgFNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090816_030673_B5B08224 
X-CRM114-Status: GOOD (  22.91  )
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



On 7/28/2025 5:33 PM, Dmitry Baryshkov wrote:
> On 28/07/2025 14:52, Krzysztof Kozlowski wrote:
>> On 28/07/2025 11:44, Dmitry Baryshkov wrote:
>>> On Mon, Jul 28, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
>>>> On 27/07/2025 18:24, Shivendra Pratap wrote:
>>>>> +
>>>>> +static int __init psci_init_vendor_reset(void)
>>>>> +{
>>>>> +    struct reboot_mode_driver *reboot;
>>>>> +    struct device_node *np;
>>>>> +    int ret;
>>>>> +
>>>>> +    np = of_find_node_by_path("/psci/reboot-mode");
>>>>
>>>>
>>>> Why are you looking by full path, not by compatible? Is the ABI - above
>>>> path - expressed anywhere?
>>>
>>> PSCI node is required to have a node name of psci, it doesn't have MMIO,
>>
>> This is true
>>
>>> so it resides in the root node
>>
>> This might be or not might be true. It is not defined by ABI. Anyway,
>> you answered where the ABI would be documented, even though as I said it
>> is not (/psci is not), but does not answer to first part: why you are
>> not using compatibles which is always the preferred method?
> 
> That's a good question, I've added one from my side: why do we need an extra late_init call.
"psci" registers with reboot-mode which creates a class and a device under it for exposing
the sysfs.
psci_dt_init is called very early around setup_kernel. At that stage the class creating fails,
so psci cannot register with reboot-mode at this stage.
At early_init, the class creation is success, but the created class and the sysfs does not
enumerates under /sys/class/.
So i added explicit late_init call for this where the sysfs creation seems to work fine.
> 
>>
>>
>>> and the reboot-mode is defined in the
>>> previous patch. So, I'd assume, the path is defined.
>>
>> As I said, path is not. only psci/reboot-mode is.
> 
> Do we have an _actual_ use case where PSCI node is not at at root node? If not, it's obviously a deficiency of the schema. Could you please provide suggestions on how to describe that in DT schema?
> 
> 

