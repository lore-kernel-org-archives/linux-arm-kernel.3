Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC2CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tT4lZcR4ZBn0xrtO1ZVUt8Qt1hpqfjpfEUFhsYPVrd4=; b=E87piEF39uKP0zVo9v68Bs2Hl/
	saRUYbehltQacvaNuwONvWf9TruxS4I/p5gauXE8ybOBIclxXAcB9qsARSHhnOy/npN8NfP1WGJe2
	37EGmoyFsiwfWYSJEPPCUXJYoMKLtgr5zGm03zlaNDm589qbNRZLmzNqXFxnQRvkw1rrKIR9UI6+a
	L8LwheOa82oDyvL+xix0wjnza0p6iqQSGrks2ZrH7IbqX0MKpyTV4v2Au+zpRBrNrnf3U2FodY3I5
	3C0YDwgtgDflEfoBCFAjSboNyDQ5kkdfaMWVjOQwumDPoHO3t7+3xX0K4iFPXOkinfQKmOvyq0prx
	NcDEmqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8l-00000000yVp-16DK;
	Wed, 15 Oct 2025 08:45:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8i-00000000yV6-1pZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:45:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sEGu002648
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tT4lZcR4ZBn0xrtO1ZVUt8Qt1hpqfjpfEUFhsYPVrd4=; b=IURcAa4OWNIyJpVU
	dkvIYnvv9CxyWyiPfN1Ayf/7fdLEaBNrnnowSgk+6ysNQV+QAvov8bdIXdv0dlia
	OAy1vdwUHRlVqVzzY9eM7n2lZxup9Vp+xuTt3/oomYvLT5lQ3V5TMv0OUTzZtrBV
	Hjdayh/XwxnLQEtxIiUyN1F5M7JTVPcxQOK44/+Jj/KcKkVdCQbKJJfTJYuL15Ko
	ONaEosj0SVOYB2TWVJMG3xDith2hfUicyMOFBFVnDcicT8ECuoyp0yPWki/qzjqd
	YjBdA+V7mci9/R6qI3utMV5s0JFCBGZZ3cfz5xKgCOwSMT1XCvjqD/Rj376uPaLX
	bZ+D+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd93spn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:45:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-286a252bfbfso249909175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517943; x=1761122743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT4lZcR4ZBn0xrtO1ZVUt8Qt1hpqfjpfEUFhsYPVrd4=;
        b=TreBewzNUCfdB6aDXwaQwA0lXWq8elUWDxrDa6WBW2nnqHoSOZJBMkEHR9GjMGtpzq
         cKYusJbHh8qZ0UYmNhTP3phLrw2AAwqH06WwofsHRarelruJXf2qCJwNJWYTK1KxFKY+
         7CX65D17GCnxqzfFar8Un0I5M25BJQycvidEkBhY9B7AgSjMUN4ZH++BrTo3d7ql4/dC
         GEsoNZVSk3WxoFUFE9+SouZTQIQYf2XTAWsSLJF2VxHR3hX5c0fV4vgAtz3qjjWbnih9
         33kvWfCuSy81UDHoMrVMWBrwGTOx56tuPCYlHZUFmBkvKhbBUwAScQUn5LCwFPvDO1oL
         8y4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8EsJObPLQYPWJrFKJM6itJ7g4+ozB4qTwEuMh7ZAFZ1aRj0aaMFRYDU+p9bCZMNaZIG/bXfMJMPzDU4qDLMBq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0tZHHtOCqCCe1fks/8EI/uMJjsJwIaHIeQRoGVIsKv+vGE7s
	ejm75ro13g5MneqpZh9VIvgo78TcoPyewGGJ4hWd8y57ojUCgbXQHTfGwy1xPWP37wAW031F/k+
	g0+yM9CHoDgVEUycL9Plm7qwjXVnJ/cF66IVEDUQFkW0U3AgQWd74XzXL9B3/efbOPtMoOgz1f8
	mSWg==
X-Gm-Gg: ASbGncvtL8jpwideFE8jrM14J4cXI7Ui+/kHSnDp8qw/JA+PFpd4yLl82uX6phSa2V2
	Ih9BrKitn7T/OlrG2z08bmk0FAe/fce6cK3Z+BEVXW9mvkfh73+deIWsCKkhZFc2SFmvRqJEolL
	oF1IeXV/Yfx91H5+jG8ae9PlrJAzpRg1ATlbErO9TNMwx/52RLPM0vRzPhxmh6HWJLIVOkg+n+t
	66XZ3ac1rhylS/X/qeY8Wipub/EmjRR7Gp0QkJYjdXgBfoNdhK2I16t6ZjeAArufQFWs6huNYBe
	sgem/Vp6nKG+IFEpp1OiUap8PxtnQ6cUnKaGAbCVThQULTLg5wf2BpP1vRdNYPxbhu4qyjw=
X-Received: by 2002:a17:903:4b46:b0:27d:6f49:febc with SMTP id d9443c01a7336-290272159d1mr366508425ad.1.1760517942809;
        Wed, 15 Oct 2025 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU68B7KHWBtJSF6bpxGSTAtxK+b0Uk28zSKf6ArLdpmJzPhB1kHcmTwbavGcRZRkHHk+Bc9w==
X-Received: by 2002:a17:903:4b46:b0:27d:6f49:febc with SMTP id d9443c01a7336-290272159d1mr366508125ad.1.1760517942284;
        Wed, 15 Oct 2025 01:45:42 -0700 (PDT)
Received: from [10.92.210.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07741sm189006475ad.61.2025.10.15.01.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:45:41 -0700 (PDT)
Message-ID: <f44083bf-a54b-415c-8650-a57b3b482572@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 14:15:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VE_du3_dcLFB0tlHNA6dnivFV8iBk24D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+rQggF+fEoZ7
 jbWOY1lAUaSG3Ys+FgKRKrHbxVt8qKkOM/BiQEog+hQ9NJvJq+aKzrpoDGVeiBouIfu81ObGhpb
 Wh5WiwZ5Ma5GdazfiyUXDjk8A6Mk3F1Fj2bVDQncI7dhVLcZr3H840/MCQpBTlhwGMiC3eoD6Hk
 AKQwPtj3H+DLq9MDiplVB8VTgKSuIE5tbTp9etACo0y4kBrBksLhilvmR4hC5zlwcuow1IYJ1sW
 HpDyEDNfv9XqF71FGldE8sCultRVF9v/j7lfVz5kX1AGEzD6akitN4eB4QbsQs6hLBvHZVk6Mx4
 E7uq+Duv3vgGLeVfLCTKoh7aVSOoThVufMmiwM4QjhB2bOBKgGGvJPVBavHRPQwQYJuZvf8g62R
 0O+9dn1M7EdQkcc9ku6+BqxuYe6iyA==
X-Proofpoint-GUID: VE_du3_dcLFB0tlHNA6dnivFV8iBk24D
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef5f37 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=obQkJn2dBRx5tTod4cUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014544_502935_1FA0F4BF 
X-CRM114-Status: GOOD (  20.76  )
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


On 10/15/2025 10:08 AM, Shivendra Pratap wrote:
> Currently, there is no standardized mechanism for userspace to
> discover which reboot-modes are supported on a given platform.
> This limitation forces tools and scripts to rely on hardcoded
> assumptions about the supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a
> sysfs interface to show the available reboot mode arguments to
> userspace. Use the driver_name field of the struct
> reboot_mode_driver to create the device. For device-based
> drivers, configure the device driver name as driver_name.
>
> This results in the creation of:
>    /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported
> reboot modes arguments provided by the driver, enabling userspace
> to query the list of arguments.
>
> Align the clean up path to maintain backward compatibility for
> existing reboot-mode based drivers.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/power/reset/reboot-mode.c | 127 ++++++++++++++++++++++++++++++--------
>   include/linux/reboot-mode.h       |   2 +
>   2 files changed, 103 insertions(+), 26 deletions(-)
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>

Thanks,
Nirmesh

