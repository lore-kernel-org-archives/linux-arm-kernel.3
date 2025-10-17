Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193E8CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDFamMd0o9Y7qLZOjscAOp4r8I+m3aYXZeFPwTjn+lI=; b=laXDOJOUnuXMThPLJ8jHARSoKu
	z7k2xWAaTuUgPEo4PN8Mn3jNuBWP8p/rpF5pECFfJKesJr80g2Zlck8T1nnntmyVjUiHyMlg1ikbR
	bjga3qBuC/DaNJPsRRZGMFOZjN18A8MkQVgNx1PBaBpcuW/MZm0QWFFWblp9swEsBQDGMBZmab/LZ
	QgH2nY8aay86YYFHvxhtXNGNGO0xh1kvm7GhjrNqfOB03C/zB6vkEwcsenrtZZk6eUFVEQMqiL9LU
	ZPYZUbAoXhWgbvKpVRNTnPkCOLJC9eZKY/vhygzeV97TXhJYtmpec6te0FNUNl8iUmRbCi9eO6hgn
	I4UnAE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qJm-00000008qpA-1JOf;
	Fri, 17 Oct 2025 19:40:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qJj-00000008qoP-31GZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 19:40:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGc03017060
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDFamMd0o9Y7qLZOjscAOp4r8I+m3aYXZeFPwTjn+lI=; b=ab+lJnO2WjDFcY+u
	4mf4EfvpQGaWjRovEEcZWSSzRphu0skduP7aB5wQRV36e/nVbH1tjK/Zl8duA0tY
	pGqWIoLNeFXEjanyyJ6fVjmg75ID42a12X8EF01ZSeWIlbiem49Bn4vthoh+Pb6o
	AVSSTuQT7AscEh8JZlyZYj2YtzB6Ck23A3mr+JT8AuqYcNja4pmRG+Lw/w0OrDzU
	JytgiPWKz+Iwq5LNNV59sdD60F4tNzFA+OODdp5hmCBipRhVa+79zCXeAq07KcFM
	pvOFAArsBAwm4GimPMSpRb6dsfJhFIht6ew7jsTZqKsqWM1rGFbkI2aQ86m/yTIM
	8pvjyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkng6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 19:40:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-334b0876195so2477229a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 12:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760730043; x=1761334843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDFamMd0o9Y7qLZOjscAOp4r8I+m3aYXZeFPwTjn+lI=;
        b=Po3UlGA39jmYJAPBoUgq1Sb0xf2zu1iBJXVGB6MEW08i2XWKKpD81FoUgmxHTvX+/i
         gpdmzcteNWzPhnwfc6TQPIxzovrOHWo7xthULvPZ4LnE355FO/6KGDMOMgr9E5NurfWP
         fC4xtt7htS6568gUlFHpTyMqd+dv96dBF6ul45IevBsDV5a9YNsIXGCjic41IiwKLlrB
         /Zo5I9nsT1TNJyzWdcz+0cOItsnIyzJRDlAZ59GLUHMUjQ5ix+k7Ne5Xv7rm+sfXSMVQ
         Xl6At9XBKm8CTnWjzGYaL4GuS/msV74XHYLHnzpQ0a/MeQWEZ46ODKk1YtWa5QsLN2Zh
         1rQg==
X-Forwarded-Encrypted: i=1; AJvYcCXkRItnEmyp31xdiOskqD1Vry6SI5+sUBgIM4vZybAxohq0lzvGeefysoITaMKzMzyyYuSLMml2pVepVs8iXbos@lists.infradead.org
X-Gm-Message-State: AOJu0YwMXX/s+S2P8wJ6TQ5EK5DPwW8oxUvTuG8RlWYZH913O/8YCjmb
	KXhy13nuPfh/BggF6GLNvPKdLGtqsxn5wrcA0RIyNiB4vUJQObi0gjJRnrq8/fghwI2rBWNsKYP
	3Us9tvGrKSphfKKFr66RmZ0LAcCaLGNQizIjV7XA1DQMtKh+jf9iFugRhoy1N9VD0z38oTsIrK+
	NoZA==
X-Gm-Gg: ASbGncuIRBRCoAIdp6VOHR/ym2/S8Yhq7ZFIw6vThZEs7udu78QQz65vHcZjLRhbJFJ
	FvXklBq7F9eCYRPjaRepPP/53xVPF3Y3RI0+Gnh4jVETfH1LbnbpP+S8MiJeE30F0W0b+I43czk
	r6q2edGtQ88MgVUqUZVDLYvXXfW036lF5urrfXaVCrJvUH7ngY35r03QhBOSFpruOHhrdQ7X8Ar
	Xkdk9F9an0R18Uv7lHgf6w2T0nKNXlbDnNynIci6F2xs1ByJgNiBvFiCJT1pG0s7ogOKgZF0Z2J
	s88YYZvOyEcWLcwSPwwn4KykAnkzHrMzuLvJMRKD1vWTilF83UferNdbLK4OyjF/lxOE0xg8Tpi
	RLKXmAyjZFSaq1R3uaMUl4dmEKNcNlpmeWQ==
X-Received: by 2002:a17:90b:3f8c:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-33bcf87ab38mr6176218a91.13.1760730043205;
        Fri, 17 Oct 2025 12:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhslTnLw1d44+gxYWnp+m2GVuVioyNzi8Rgxtwtm1YnY0CsEHaMExcmSUWrki5gmUY0K4AhQ==
X-Received: by 2002:a17:90b:3f8c:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-33bcf87ab38mr6176158a91.13.1760730042699;
        Fri, 17 Oct 2025 12:40:42 -0700 (PDT)
Received: from [10.216.52.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de11392sm200332a91.7.2025.10.17.12.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 12:40:42 -0700 (PDT)
Message-ID: <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 01:10:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
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
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qp-iOfsJDQFuDJ0haahoUa9xO87tbpnb
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f29bbc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C5lFK0Xs5ZTp69CiT58A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Qp-iOfsJDQFuDJ0haahoUa9xO87tbpnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/K5q3qrky84K
 zvG5SSjc+tRA8t7jW955vY290b52/6/EIISV/WyoJenQP6KFnqMqZ8a1VXvUc/4SFiYFPlyEI7T
 bW/CyZv5E6w/aUiBEll/tpM0dQnW+ooangujbhxfY4Y80q+qLTnR0SKByA+KhRXweQQseJIgUaY
 cd7L1aVBE4EN4ar/XjiiR/TINXXdGoOo7F/SeudTyubUKArirt/XhfD3RNrEi3pvNmcauPxRc7w
 IGIRDVet3I/WIfyeZBFHU9PDULCj4gNPAHcmFZEKC9bylHA0UeUBkrs3RlUsFb9GtAsIrhSvXan
 7mUKbciQU/ItKJmBE9DoAFmzJtCu6QgdHV3ELXNCUdhylsC+f8roVeO17t+Js32bqitPVZgn60g
 K3V4rWt1a5kZrbNMCvCriDzUOWfD6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_124047_924014_FD838D58 
X-CRM114-Status: GOOD (  25.84  )
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



On 10/15/2025 8:17 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Oct 2025 at 06:39, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> Currently, there is no standardized mechanism for userspace to
>> discover which reboot-modes are supported on a given platform.
>> This limitation forces tools and scripts to rely on hardcoded
>> assumptions about the supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a
>> sysfs interface to show the available reboot mode arguments to
>> userspace. Use the driver_name field of the struct
>> reboot_mode_driver to create the device. For device-based
>> drivers, configure the device driver name as driver_name.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported
>> reboot modes arguments provided by the driver, enabling userspace
>> to query the list of arguments.
>>
>> Align the clean up path to maintain backward compatibility for
>> existing reboot-mode based drivers.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> [snip]
> 
>> +
>> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
>> +{
>> +       struct reboot_mode_driver **dr;
>> +       int ret = 0;
>> +
>> +       if (!rb_class) {
>> +               rb_class = class_create("reboot-mode");
>> +               if (IS_ERR(rb_class))
>> +                       return PTR_ERR(rb_class);
>> +       }
>> +
>> +       reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, reboot->driver_name);
>> +       if (IS_ERR(reboot->reboot_dev))
>> +               return PTR_ERR(reboot->reboot_dev);
>> +
>> +       ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
>> +       if (ret)
>> +               goto create_file_err;
>> +
>> +       dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
>> +       if (!dr) {
>> +               ret = -ENOMEM;
>> +               goto devres_alloc_error;
>> +       }
>> +
>> +       *dr = reboot;
>> +       devres_add(reboot->reboot_dev, dr);
> 
> If you're using devres here - at least make it obvious by adding the
> devm_ prefix to the function name and make it take an explicit struct
> device * parameter so that it's clear who owns the managed resource.
> 

sure. we can add devm_ prefix to the function name.
reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
The struct reboot_mode_driver *reboot is owned by the calling driver.
If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
will need to kind of split create_reboot_mode_device into two calls - device_create
in a separate function and then call the devm_ prefix function where we add the devres_alloc.
Can you suggest a bit more on this?

thanks,
Shivendra

