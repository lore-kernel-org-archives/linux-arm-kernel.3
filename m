Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNDjzyGP/l854i6KT01aZoOncfqe5cUyUJTb5qnC1kY=; b=P3E1Rk5B1EEQLgM45ypsrli07p
	MS6RMxbp4rKPhQxFqnYAjgXdqSbUC2ATMuu9fHSYORtKxCzySRUy8xYOq8EzeA6GCPMdgUcztyjZO
	AKrPnj3E3DkG65w0FDraTxgekf45FpxWPhU8748fXIM1gtqyONIsJyC1pp28B3kFZLV/5s9sk69Bt
	ZsegNkPzXZXResTaVRMuTipKrIY0YxkHAn2gIxdBlcoVx95eRoMbTZxjMnRVa0T0ELCllwRezeiZ0
	fpCeHvvekMkz58CyzqiHG1K9giQCwDipwRKTOzFBSYflP+ZDcVR5xsIUI5+6evk062t4ZwSE3cyR8
	DMKVs79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6fP-00000001a3x-0Sg0;
	Wed, 30 Jul 2025 13:16:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6YM-00000001Ypr-2RgQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:09:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbf8G013128
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 13:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNDjzyGP/l854i6KT01aZoOncfqe5cUyUJTb5qnC1kY=; b=hZFLgRwkVOm0twVG
	7m3CXCrAyBdRSRzunSCBpu6djgXBoZcpeLkDHNYd2NpE5xF6cyxTZA2siSVH7HIa
	Tv/nAKLx4Q4QsS6Cc3XKH8hWf4UrPm2OVZZgwaXFt7Sbucn4Kj0bBVs6BIZ32v4P
	cLGuDWHyOqn969q4Tn8BC18yfsUAZCFSsSn1CfaLgmy9caCLf93LjRZwUcpCxUrY
	35EgB+ICiKCym9XzOZ+Q/l2l34T8Ufn2hfLyhLL1NGZ1874NdY24SBQPPouQU8To
	6f8oQGEQhft2GVVqTYgUNV7QNnnUEImy3SXRfmTlU+7Gfkry2a+7Xbd1tMQfxMcA
	5JbZGw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm3qtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 13:09:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so721329a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 06:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880944; x=1754485744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNDjzyGP/l854i6KT01aZoOncfqe5cUyUJTb5qnC1kY=;
        b=otPjiD5ZICHhrhEx0aNRm04AGo21IhstR95VyoSdO4+7n05IFP/XE3iCdEaQovaJNI
         ZmEpyssy5RhEw5KK1GS6GzPGUs084DTYomTYGCBCrCeCQMxKdPl6DF/wOI8xDFzPxB32
         AB8bxoYexWTEaUEEVFEBElkf/ky/Dedg8lMBoF9u3CEleFNeYZSerlqZeK9qKTvtLtSd
         onvEWr+f1sa2OT0kIEd9V7/n2DVq0gqYCkbAmnWYt0s2Wxiz1UHqHhv+KzLFfpMDAb2K
         2XD1r41kp3dDVd1KxbngGdypUtnlSjPppBc/AXL3g2HG+sryQZa4GeDbJy1RXxaBQRq2
         fIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeLZ113nWTRvMvr+dZKyYzpd/u48oaLKKyEORvV4p3xv0VL/23MBi4mWUQxuEVPVcqv3aW+VQx+fHQ/O/yc21j@lists.infradead.org
X-Gm-Message-State: AOJu0YzpE3Oq+fcERdRObGYgxsDZ8f6uIFM7v+1VH3pARTHY6eyHJwke
	P1DvWivKKZP0PqDjDpB3sjZHSvkw3oewuWYUeSEql0inaWjDaTpuDgN3i6bCAcPJRG7sbg1VJqc
	FN04xG7OOWULjEir48ROi3ZhkOXvMspKeeh57Kee1TACELud7VQZM6OtFeCPllVoOXLBG6GdCgu
	ULmA==
X-Gm-Gg: ASbGncsLeZf3i1+P6vgvb6Egrty7tZRJQ3mea1uAk760BIB1AjlcgyxB9w5Q1XqnUoi
	H3HzCQTuaDyFRncn2Uh9J2Kov2LI327ZeoJLJjfTQFnUlfbbXmC8ESmcrtvk4a4BsyYuHf3wXDZ
	M5bsuZxcKo3rV47HfbQAwePft9ws9Sv0ilcFqPBVUzJDUQxjk0accCvheYI4xnJk55yQOYSMYvH
	ZQoRSSAAFaeE3YQ/Y/A0RnEyIR1Y5i7WsxUqvUqnjrl/YGYD7syt6Ul0sbRfQKQpBwzMn6ndhTp
	aXxd8y0SpdPumdXckvYqrXpth2KI8jY2pMNgZT8+AoGKtz3/33wx9YWTgTdLxRHxwrmbB3538g=
	=
X-Received: by 2002:a05:6a20:548d:b0:239:c7c:8de8 with SMTP id adf61e73a8af0-23dc0d3e328mr4807701637.12.1753880943793;
        Wed, 30 Jul 2025 06:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6wjsf0Q2uV+QjNX2+BJebA7gZlSlrORRFmXImrXs/DTnl6FWhcQ6Ay1Cko/oB0Ikr9ynZQ==
X-Received: by 2002:a05:6a20:548d:b0:239:c7c:8de8 with SMTP id adf61e73a8af0-23dc0d3e328mr4807652637.12.1753880943335;
        Wed, 30 Jul 2025 06:09:03 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67c8fcsm7588223a12.37.2025.07.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:09:02 -0700 (PDT)
Message-ID: <2b8a2ea6-f13c-ea09-c089-f2296b887859@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 18:38:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
 <b1b34e31904f711e7cf82394843a9966238f2896.camel@linaro.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b1b34e31904f711e7cf82394843a9966238f2896.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688a1971 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=OQUscKAIWfOqcitIQgEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfX1ZdPvvRVcrjp
 zNg69LLqN65NSyC5Jm4HFgDzzdyTFqLPYtoAxriZYaz/TMmoxnIOjXMJQHE+Y4Qajpax31u9ZZQ
 5lSGUqUTROC6HeBCoMeXpGyO7tHakx6wmUytJ4p62qzstkMZW2qLHDrjqANJN6o04+RS4dYHHq4
 XpR+13FThtosikZoLd2yxoMEhvWaYcD4BLCKxkjyIqOEPM3i8MD/NJrFKQ1Lj6uxM926lng3TLA
 viVGkyMpQ5GFCxDXFJboyYx+AMEy/IEY3xTkehpWL4QRunJeA8pKYzCaa0YDTyLLM9KSxSr0FAc
 XRArCKMP8csCB0QCEFgVO6FS8elgldhycNOpz8L10vH/psLuN2ejYgkXfg4WOivlCXd9Il1Lq8y
 OS9yZoSgYU6bI+k27P5jx2jS9ImH5NmpTuZYP5pDOfDi9g1Z+E4pwhadjZoqg0MhU2oCjbyC
X-Proofpoint-ORIG-GUID: dAhdN2khQR9x23na3S26kTBkm9APMFKk
X-Proofpoint-GUID: dAhdN2khQR9x23na3S26kTBkm9APMFKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_060906_734858_01747FF5 
X-CRM114-Status: GOOD (  24.79  )
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



On 7/30/2025 2:36 PM, André Draszik wrote:
> On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
>> Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
>> a read-only sysfs attribute exposing the list of supported
>> reboot-mode arguments. This file is created by reboot-mode
>> framework and provides a user-readable interface to query
>> available reboot-mode arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-
>> reboot_modes
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7147a781e5d4d11977c3a156bf4308aa13310e39
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
>> @@ -0,0 +1,39 @@
>> +What:		/sys/class/reboot-mode/<driver>/reboot_modes
>> +Date:		July 2025
>> +KernelVersion:	6.16
> 
> The version should probably be updated.

sure. will update this.

> 
>> +Contact:	linux-pm@vger.kernel.org
>> +		Description:
>> +		This interface exposes the reboot-mode arguments
>> +		registered with the reboot-mode framework. It is
>> +		a read-only interface and provides a comma
>> +		separated list of reboot-mode arguments supported
>> +		on the current platform.
>> +		Example:
>> +		 recovery,fastboot,bootloader
> 
> I'd personally find space separated like e.g. in files below /sys/power
> and many other similar files below /sys easier to read.

sure. Will make it space.

thanks.

> 
> Cheers,
> Andre'
> 
> 
>> +
>> +		The exact sysfs path may vary depending on the
>> +		name of the driver that registers the arguments.
>> +		Example:
>> +		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/qcom-pon/reboot_modes
>> +
>> +		The supported arguments can be used by userspace
>> +		to invoke device reset using the reboot() system
>> +		call, with the "argument" as string to "*arg"
>> +		parameter along with LINUX_REBOOT_CMD_RESTART2.
>> +		Example:
>> +		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
>> +		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
>> +
>> +		A driver can expose the supported arguments by
>> +		registering them with the reboot-mode framework
>> +		using the property names that follow the
>> +		mode-<argument> format.
>> +		Example:
>> +		 mode-bootloader, mode-recovery.
>> +
>> +		This attribute is useful for scripts or initramfs
>> +		logic that need to programmatically determine
>> +		which reboot-mode arguments are valid before
>> +		triggering a reboot.

