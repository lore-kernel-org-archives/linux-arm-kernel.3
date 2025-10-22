Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8721CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8F+X3+wN0oxbBadx3SHyMbf6X2kDJDWo7WkuZHB6Sg=; b=kwLiJFctH+xyBe2Hed6sminio/
	B8968HN6cje6TIxQGt0SaVEGlcSDuEijcDHnxfPGzZOLX2wLVdsGHRI+CfumGVhDzX+GA7wzHbgTa
	RjaE8AqQu/A8w0Dfw6gxY3r8lufJi80kkDhSri1CudKaolz7ZIfcD9LBl/eBun4dy0Uofk9Mv3bq8
	gJwI92pM9F6PynTo79+SpgeVeitB4p5txEjjRCg9D/B4L4oVK70Z/XcMKIp9gsL2V+Z7b6GeBZd/0
	EhHMJH2wMjQzr1O8h46IkjHOGdKGRL0vBErTCpnWrQr/3XOeGpFDK6LF6OTtZcv/urSSsv0moY+cd
	47s7LABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZiS-00000003BsX-0S9Q;
	Wed, 22 Oct 2025 14:21:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZiO-00000003BrO-3RXz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:21:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7PJIE010315
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 14:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8F+X3+wN0oxbBadx3SHyMbf6X2kDJDWo7WkuZHB6Sg=; b=kaij6nZOfzi6M45l
	rhgTu4EBHYKUVMi+XsvzTeks8HDKCdaTj41W6LNOQgBKjPLBXSSeudVDtXbNK++v
	4vjI9RGnvS/ufFE5xkXZA6rvXob2k59mWy6xV9eGNdmBhtqmA5zRVtbEmz03nkZq
	Gg/dkP8QiiSlM9M4iRpdAmuw99sc4uVW8EFZTRzarudY4ZxFcvZXluNF2fnNFuMs
	jWQcsOJjD83U+RIWkYFLLS5IgDgKj0SdxcFZztcqJAKLiPgAu9fCQQok4btnteOb
	s7Z2X5cVu5TpPbq7EZsXLZlnt1edTKwPBdjw3Ed3aa34GWa3UsKA5kYG/UcgQT19
	GW8EZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0js57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 14:21:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f914b5a4so6237309b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142882; x=1761747682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8F+X3+wN0oxbBadx3SHyMbf6X2kDJDWo7WkuZHB6Sg=;
        b=PbglC5FL1H2tcq08CE53HjdX47+kymQAcfZ7X0jH+8mUbwC4xnEwLb5cmFERIx0wZq
         lLMCGsFtBNu0dCOa2I7l7+q+dvoYYWj/rlOsvp3f0Xwl99uJZureYBQkA0acNSCF9e+8
         +agI8mtrUukUL6VFfLYqsWay5dvlwuwpxpcUWPuyZsHfkEm4c6Zd2LLuQbsJKAdfxS1P
         ZQ0YwPc7jcmlAuUoQIHJKlrUna0r6y1edOikDySR2pl2xtP9Gk01KlQZi0ap+C1/mE7w
         JApndXtlg64RMZvYzWUoXzMXTKLkOk/ZLOjul7M7HvlsAhM03N1pLg/yX8CtpETCxDUh
         qTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdtL+Dlb14lsjnQ2LUxxfQpT2UvA3ASLCcN4Hc9H64ts1Rcw9DP7FnIyvHn+Amvgb1B8zYjKhk8ZKGMrOq15po@lists.infradead.org
X-Gm-Message-State: AOJu0YyjTvgum+blpW5z4z8V+8jHfWgkK23E1UgjnpbrRjQFoPqX85H8
	oXn/2CiJNkzoseNrZ0DJgtCHnKvmzol9UvI+1LDQ/T4LaioBdGYANJEyuJkcGHVdvVekTcLGGRp
	jbeOkvNqdSJXS1GwktY8+VkKTnRiz9ARpzqVRjXHNDwenwcd+qDFzL1tSmnuvrr0RQ8l4p05i1i
	btsw==
X-Gm-Gg: ASbGncvlOb+zru8JErt+XAcZJTL4dZGcwm+ov3fxy5JiMNx5D5JzFPXIivrrlZKrq7B
	JT6yjdRkAqGZB2tqLur8TSFdvJNgpkuzH46JBjKtNUUjFqGXAl60iln6sTpCIHy88QQ+EjDE1TY
	ZL+RBoWRTMLByzwrfDW7j5xXB4/bUpn3Nh863RTIkqOjei4JiMd3xnT0yiEt70jQIw2ULrDoMCZ
	ZbU+h9r28/XPXs6SPbir3oxbRthqQFuyBK+1lTEJqpLc+Kpo4G/vyK6iVlmtpoNBA3Lo+ZgYBtE
	9VSC0ciQDgc/+zPpVU4cqwr8aAzkpt1FlMjq1i3SqZoyw9fiQhd0BR1IAlVxCwxV3xLIb528TMa
	tXtSIaf8ciItUhEPm3zqk/osVM1v/TyX/MQ==
X-Received: by 2002:a05:6a00:1c8b:b0:7a2:6a86:c79e with SMTP id d2e1a72fcca58-7a26a86c860mr2191962b3a.24.1761142881557;
        Wed, 22 Oct 2025 07:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD1if09QbpZ0dFtUilgWx94rYjTY53E2gZyd9bH58StesMW+afVzo8P4m1jCTS9rTSPWBDWg==
X-Received: by 2002:a05:6a00:1c8b:b0:7a2:6a86:c79e with SMTP id d2e1a72fcca58-7a26a86c860mr2191912b3a.24.1761142880900;
        Wed, 22 Oct 2025 07:21:20 -0700 (PDT)
Received: from [10.218.16.150] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39654sm14567575b3a.31.2025.10.22.07.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:21:20 -0700 (PDT)
Message-ID: <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:51:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
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
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
 <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
 <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5aUbyxvVhIX3
 L4S9Qg6NVmjZz61H+tp7knNEC4jOoFcesLgIOCz0A5EtRfa7oC0MQOUtWIBa9tb5xFEwjPxOStY
 ChMlKrQ0B8tj7tvD3g6ivKKoOdLt1E/JR6/XNhzV37WSOEw3PEyDHzx1rGhRPnHDK9t4g0Y5GRP
 UyW8n79Q3HE2MK4aS7C6wzC+ccG7lysBL3dITQVNEOCe/1dSqlmp3nXy+LGuahfnRfMGrx6WWOn
 3sh62Pwd+CEt0NRZ5DUByVR5u5Hbj8KVPnBdh4KT+98zdZXMZMeagzxtambOt8GT+PrInKBtnuI
 7JMyG3OvIOD0BrtFXGzRslT2yxRi3OII5spLcb5rnKxS7SvP+C0h3KjDJEuDXgjSXR7wckUTTao
 F1h8eGgFr4SRaVcAbPSMUPC/0I4zgA==
X-Proofpoint-ORIG-GUID: v00VOgAAMq4-G4RZJH5Fxa_pGEAH5DGr
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8e863 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vdIc-WJG1MBaYulAjwQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: v00VOgAAMq4-G4RZJH5Fxa_pGEAH5DGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072124_980946_B21E175B 
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



On 10/20/2025 1:10 PM, Bartosz Golaszewski wrote:
> On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>
>>> If you're using devres here - at least make it obvious by adding the
>>> devm_ prefix to the function name and make it take an explicit struct
>>> device * parameter so that it's clear who owns the managed resource.
>>>
>>
>> sure. we can add devm_ prefix to the function name.
>> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
>> The struct reboot_mode_driver *reboot is owned by the calling driver.
>> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
>> will need to kind of split create_reboot_mode_device into two calls - device_create
>> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
>> Can you suggest a bit more on this?
>>
> 
> Ah, ok I missed the broken logic here. Devres should only be used in
> devices already *attached* to a driver as all managed resources will
> get released on driver *detach*. What you have here may "work" by
> accident but that's not correct and is very fragile as soon as you
> have some non-standard behavior or error paths. Devres won't fly here,
> please just use regular allocation and free whatever you need in the
> corresponding release/free/whatever routine.

Thanks, got the problem here. Was using devres to associate the reboot_mode struct
with the driver, so that it could be retrieved later when reboot_modes_show is called.

When reboot_modes_show is invoked, there's no direct way to identify which reboot_mode
instance is tied to the current driver, as multiple drivers can register with the reboot-mode
framework at the same time. Without devres, will need to maintain a global list of mapping for
all device driver structs and their corresponding reboot_mode struct. Then reboot_modes_show
would have to look up the correct reboot_mode struct using the device driver's pointer.

Hope its ok to maintain that separate logic here?

thanks,
Shivendra

