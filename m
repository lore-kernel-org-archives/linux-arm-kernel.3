Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E49CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 04:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/js+3taDhrejgB7UpAvscxRkqjCCg2tof4BrdDtD+8U=; b=I3fZIA0LtmWF5kBvhi+HaQ6TyP
	ASEeQl5bfJyb6bzhLpttQJFIiofbcG1985Mwqo+qHomXNd/KMNdYkPMwcW0t4nBOZp0O0qP+xsTK4
	cIE8PvDic37L9I9VXJsRV3Mm9O8i54F3q6gN3mSswWqv8jIHpSysxJA2n7/1BNj6vO2zSXyejGnGY
	jJj8AjTncSASIdDoD64tIau/+pZbu0cK61jzeSNG+N+H5qdZbD0p4HbhaWCPTZ+UV/3xuoRkDHCnY
	nWvUTzqIilMddSleMqN731vUtKgAjhRk0JyE7b0SIOq7oQ8VQ+JAh5N3V2qwvCBcZdNd6y6PDQxVR
	YUcDuQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6i3T-000000059H3-0zym;
	Thu, 09 Oct 2025 04:15:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6i3Q-000000059GO-2oIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 04:15:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5KTs002704
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Oct 2025 04:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/js+3taDhrejgB7UpAvscxRkqjCCg2tof4BrdDtD+8U=; b=kWW3pZxibhYsonos
	xFC0Upj6XzEn7h5r4ubL8lgzYXy+Q0HtPkjbzsqXRM18PRMGM9cyKHwjDEX5qYPF
	ZY/Wk1YVir1y0qjNR0J8silgm524wvvCaPrdA7oPaZakeKmDjFwD1z8tcfEDnThV
	5QznhUwAmIjzmOZX+M+Nxokx/dnz/dFtADSLWaq26b8eJWvs0LlxjFrqchiU34G3
	ItF5lxyUg9dRPsSDfRq3XEKOPUIg4qGP+O8Cqz0nRPK1CV//hcjxz/ObvGFose9E
	p9Vk6gT5CEWB81YKxm00drPgcowOoU0hrMVX0jKOiToYs9PRLDp5MrUpQBJAJQ1I
	D4TI7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m1ej1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 04:14:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698ede62c2so1608775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 21:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983298; x=1760588098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/js+3taDhrejgB7UpAvscxRkqjCCg2tof4BrdDtD+8U=;
        b=ksD8vSa3CSIKROjb+PmBHKdXRjfFMB/jPvMCYQSNlfWc5L05H0k1K0NMLAKyasz/Wi
         6xT4+zniM/Mb1jcc7yoshhHPTxRWRn2vYWPaW+jG2z2WW9zVUrTRUrXKO2+qG5WTbXpw
         ICbi/BMrRCInXGCrFeu3Q82PrjigPefsSDIm9JjqjBJLl3AXAESA1sZ8sL2K4O7KFB0J
         XTXmOTO0lsYp0CAOlGqEdZBnjueRTtVPaEcibJRBHplYmOX6yIXI5aZjObl0ssvmb3Nc
         yzVcY7ezkYm6TpW2zb+FkSElvRHt1c2pJaTXpH9Xy+V20EsfGWi3MaKpz0TAVyrWJUEk
         N12Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+JJ7sHcK5ByYkqoyx+DpYrX9GkWPSOommmlFWpSQH0yZ4sjsbMMPie7WS0qbphNu6MUmRmRPm4hg6Zj4vde0p@lists.infradead.org
X-Gm-Message-State: AOJu0YynE9U842EKlM0B/IcTyMs+KhfuSchYS5oHeV6DeLUhD9qQq2XO
	b49ftETWbEcg3o9FNc++rnJIGPIucCasm+qO3zb6IvQfPoKc9we357YEORdyVPxcgvXVpM69Odi
	7aCmwC44t27RjHCn8Eok2WWQ4zrbLMBNfngjW6GKWNpPcHcREwr/71dxGthRE+2GNNt1KILhZO6
	6TFg==
X-Gm-Gg: ASbGncuZWmclyCpC1WXNl77JABx3cQSxpvGbASwWMmhv3uDjgQbJMhwxVzNRQB/Ktcy
	oGmkNa71rz5/Sw0drmGzq0C9DqL9jhP2Rr+LlwLkRx/6WO3mvDakSRTzb3zu9ezsN5LcCKK8Ayx
	kDvwPybf6OdvTyUJHQT8iy+mhzhOx17YrkXXF2GlFG2haLbytzi258DB3fU0MOZE5ExujjOgTT4
	dyrcykj0ig/mu76VwrAsuPq8OZerUZsR4z+Zrmm9ZFcePfpCD/TvmubiO5whbylbbx687CiosXO
	YiToxXO4X4hZJBPLXhxmsNyUvxbQvtQxMJQ6KTdkWt04X4DMw6fpCBkJfvp1kGsfEBJQ1pEWjN+
	mZfjoroN0SfdR/Ydw4RsSExdxarXkFv3SqIML2zL/Qw==
X-Received: by 2002:a17:902:d491:b0:253:a668:b638 with SMTP id d9443c01a7336-290273c598bmr46026575ad.2.1759983298277;
        Wed, 08 Oct 2025 21:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUYcLZvr1TDduUWf5IW+YzwXsZMsBV8TnFvLqPUsLDWvggUY7/sMA/hO5Cu4Ze/JJFPYsNLA==
X-Received: by 2002:a17:902:d491:b0:253:a668:b638 with SMTP id d9443c01a7336-290273c598bmr46026265ad.2.1759983297782;
        Wed, 08 Oct 2025 21:14:57 -0700 (PDT)
Received: from [10.240.201.55] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm13510955ad.49.2025.10.08.21.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:14:57 -0700 (PDT)
Message-ID: <9ba7562f-bf6a-4759-b4a3-aaa80c45e247@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 09:44:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
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
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX43xz8VoLmu/+
 kwdN2M6thZFfkub+TuFRxhC7s8Pw451vZgbiBvp9XQWbbLw+YTWQEG944ndXkMFcMAeh5Sh4oEh
 EvtnkrNgQFbk3zjnCap8thOWCgHlZPMqz7RMmPHXSNXSUF+vYhfwhpLR1qImRlgrlDqFNeeyOyH
 gXDMbAvTKDcqPG3jdz6UnjDGLFrBF3baStTiFHEuUk6WGP1egHjVS/hIb1WeP0gBAAtOrjAw9h3
 +l5hJyqnIJABhhTqOohDrx3SFEyGy+gWrO/51Z3fpt73tc8BQOjZG/Qu+l9yYoV6lko7HEtavnK
 5XDvaI7u8mzIrkRfpL5OxrMrYyE5yF59JfI7/DuLxcR/3TzV/iIMp/JYgXUATl0RvDP/UiBr9wH
 UqKBllUsteX6pVeLcD+166OvStIdOw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e736c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=yVxwAGkkkSKiqd9de7UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: T5JK5LykjzSfim-eQZYH0vj4ZksjqUou
X-Proofpoint-ORIG-GUID: T5JK5LykjzSfim-eQZYH0vj4ZksjqUou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_211500_721746_95858E9B 
X-CRM114-Status: GOOD (  25.70  )
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


On 9/22/2025 7:10 PM, Shivendra Pratap wrote:
> SoC vendors have different types of resets which are controlled
> through various hardware registers. For instance, Qualcomm SoC
> may have a requirement that reboot with “bootloader” command
> should reboot the device to bootloader flashing mode and reboot
> with “edl” should reboot the device into Emergency flashing mode.
> Setting up such reboots on Qualcomm devices can be inconsistent
> across SoC platforms and may require setting different HW
> registers, where some of these registers may not be accessible to
> HLOS. These knobs evolve over product generations and require
> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> reset which can help align this requirement. Add support for PSCI
> SYSTEM_RESET2, vendor-specific resets and align the implementation
> to allow user-space initiated reboots to trigger these resets.
> 
> Implement the PSCI vendor-specific resets by registering to the
> reboot-mode framework. As psci init is done at early kernel init,
> reboot-mode registration cannot be done at the time of psci init.
> This is because reboot-mode creates a “reboot-mode” class for
> exposing sysfs, which can fail at early kernel init. To overcome
> this, introduce a late_initcall to register PSCI vendor-specific
> resets as reboot modes. Implement a reboot-mode write function
> that sets reset_type and cookie values during the reboot notifier
> callback.  Introduce a firmware-based call for SYSTEM_RESET2
> vendor-specific reset in the psci_sys_reset path, using
> reset_type and cookie if supported by secure firmware. Register a
> panic notifier and clear vendor_reset valid status during panic.
> This is needed for any kernel panic that occurs post
> reboot_notifiers.
> 
> By using the above implementation, userspace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node under “reboot-mode” and are based on the
> reboot-mode based commands.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/Kconfig |  2 +
>  drivers/firmware/psci/psci.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

Thanks,
Umang

