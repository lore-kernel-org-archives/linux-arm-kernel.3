Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD4ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wzEuS4KgwUf/si4HCRP4Xjfg9FTP53VK8rld0Pt2hw=; b=VycI6SuuBH4nPt93+ERnlVMjeV
	gx/jeqLLXI1S5/UbK9zOe8uy1CJPGa7237B5jaDRqS5CIK3CxWcS7xHup4lnPUZYr0hRH2AfxWqT7
	ah43bWvRIFJdZQW9CQ0nkFprfnwugD82sIpId6hpmrHmnlFcxb8vRxqC+XjQj1wtk+2ruuygHNtXD
	DbZ+QGZYPvTO8aA0KTwCTKz6+Q22Ai2y/ot9YC96kK0/egDV4ZXcruqK6/IoVON74cyEK5pj/inLs
	ZCG7n5ArknZa88zDGCmGhflNUVjw6b0sVDJnBEGSj0VuuPqSfU1owIpT5lUP8yLY069V/FHa2YRAn
	mEZ+uPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wEU-00000000no7-1twO;
	Wed, 15 Oct 2025 07:47:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wER-00000000nml-0Oqa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:47:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7Gn014715
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wzEuS4KgwUf/si4HCRP4Xjfg9FTP53VK8rld0Pt2hw=; b=GTGvq6sc6JxH0BRj
	ATrPrb5KfpdAAosrchw3H6kaMELoxGWp3yqbmmH/y8D0AjUvLOxzprSudsU1bZ+Q
	TxBCCCTKBjaI+EbGlJyNHNMwPGIDwH5Yq/0K58KY45PtKXZtRE0EtZUy/BiR9bdB
	7RfKDLwEGUEoLtyTJztloXRJp5obqdVQWiYMSUyr4qsnc+iyh27XpAyRk+n6bbBf
	i99KG671HDGIGK8V9oiQ+AFQo2ieOzwDQVXf+HCFcS/uAtIJR/bLuJCyUVulwGCF
	iWatMZCyif/690rRFP6oj6A8romXj3CPAjlRaWDSVFR1BzUDFyvbObTo1uhbBSub
	m8pakw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj3jmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:47:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27ee41e062cso141978845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 00:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514453; x=1761119253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wzEuS4KgwUf/si4HCRP4Xjfg9FTP53VK8rld0Pt2hw=;
        b=kka/G/2GnFvkwGQ+4Uz/t1G+xxVu558lCmyajs0ojw6NW1zIJzutigeSTA7/d/tdgF
         0hQWp2OgwNXXQdMe+sEsNe3h+u9HOvRFoBBdqILLLViBOVWQA9llpxWM9X7QXIVDg/cA
         DT3QKHXn+FmDC5huFjdB83mRwr3vcgauoyfGYW8MaXaulRY/JvdtbQJM/crpB1Ve/B9e
         i7iHu5jFKHdtnEsEK8oUkRD3F6itU8zUou1Ovh5vKSH/kiPRufEQfbLDdeozOxRGJL2l
         LVpEx/SgZVWoGpHkyBDDrpbDAeRu1OZzhkVrNmTJIE8967INt3vbYs6gMhq0vZ2so9bA
         R6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDeTVGqIrUhlggtA0Zj3a5u8ZUZUVda92nuiWltfWtVaF/SJh58sdO81o0Y/eIg4DRLof89kwFXCztOK7E/0w4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0y9vWQguQ4YiPrU+3KbkhsAy4z5RvzDdy0Yyvv5CRcRn0tnsK
	NIk/khIb4Uke4LszNvudSMeKSrBX1jqhZzxXBYo1voU8sQlkqBBVDoTz+mH6c6mX9TNCZIgCEQ0
	3ky4vZWfz5Rp81QOq4iQgJYyCCGJfATvcUIQh5kSX5yadFe9Hy6CYjAUx12YJkf+D3/3IeF1vfj
	V8mQ==
X-Gm-Gg: ASbGncs1BXyk9OMkRIXat0kK4hEOeY3YRCsywK+Kc5Np2OWR7ogTt0K/1RcklNgvUi6
	1UtCusLYf6W5tfpeY3YJI7Wx6Kv2LC4DJ+ezLlMWwfuZNUg0USJZf07KOaSZj5B0y6ifCEg4P1g
	U18IPLeNaOjLrmhF5x73Ixowdy2dJRi2ADjNRHRge/HX1ASTMMjIYnn8FCELx7kmdzruYArlZCi
	Z8Q1TFWacqgcQPmYzs/AJ3wSisC6UqON4qc4nUKUoCt+PAwlxWVxF91uus5u+h/gQd63LlWylLU
	cZPHLmI7ZCeeJR1I6698CjF04yz8C28alos5dPgb73ErvrQh1pTAfdNX1Q7xzv0TRHnaasEKBg=
	=
X-Received: by 2002:a17:903:2343:b0:248:fc2d:3a21 with SMTP id d9443c01a7336-29027290194mr277067175ad.4.1760514452605;
        Wed, 15 Oct 2025 00:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhzyOtK2t73BdHuEH9yQdQ6LRCYOnKx0D9BJpdqWj+pdvXaadxnVohWazYDT43ZnK/Q6nPCw==
X-Received: by 2002:a17:903:2343:b0:248:fc2d:3a21 with SMTP id d9443c01a7336-29027290194mr277066685ad.4.1760514451980;
        Wed, 15 Oct 2025 00:47:31 -0700 (PDT)
Received: from [10.216.0.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm187706535ad.22.2025.10.15.00.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:47:31 -0700 (PDT)
Message-ID: <1bf62073-fae9-dd49-c908-193c06cdda84@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 13:17:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
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
        Moritz Fischer <moritz.fischer@ettus.com>,
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
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-7-b98aedaa23ee@oss.qualcomm.com>
 <3978e740-0589-4872-8f2f-1162084d3818@quicinc.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <3978e740-0589-4872-8f2f-1162084d3818@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9wkA6jLfORmB
 i+ebbD301z0jgS7NhW9uJDYBhYMW3GrI8zuXZKsR/u08ZqsZGII5murXQKSkFrtMll8k57hmSb8
 8edEuGmet9bwPxtYUYQ4DzyV8FBACtch3ekpIr3S9AbBulPL5wz9NSARc8/1PumNIbEAl6tPIoK
 8xiLuL1yHvOa1qWToll2Quyt/yAKQE9fYUNefEaiR4CpvCc/5cqZxzLnHZY3kPQFiMl3FSoyPYZ
 fQw4Cp36uiLMTwFA5cCmFsGTCQlYGv8HDPcC5ZWMoM1tgODAXGMuRWDBOXLTJDLJTmzu6cC8Mb5
 7aywG+2DITUGsyXKtllRtvcH5g/eTLFG4B6v7uB0OgCYzPCNwBavXbGz7GbGV1iXhkL0xmec7+a
 cVTB6ar/yjQjCNdFSLp/GHHFpqKE+Q==
X-Proofpoint-ORIG-GUID: 3HVPVBA57HXEXcKx8TyR75EKjeksGBe5
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef5196 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=R8NOTgI61i89tWg-cvsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 3HVPVBA57HXEXcKx8TyR75EKjeksGBe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_004735_251573_885872CC 
X-CRM114-Status: GOOD (  14.57  )
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



On 10/15/2025 12:25 PM, Pavan Kondeti wrote:
> On Wed, Oct 15, 2025 at 10:08:22AM +0530, Shivendra Pratap wrote:
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct device_node *psci_np;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	if (!psci_system_reset2_supported)
>> +		return -EINVAL;
>> +
>> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +	if (!psci_np)
>> +		return -ENODEV;
>> +
>> +	np = of_find_node_by_name(psci_np, "reboot-mode");
>> +	if (!np) {
>> +		of_node_put(psci_np);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
>> +	if (ret)
>> +		goto err_notifier;
>> +
>> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot) {
>> +		ret = -ENOMEM;
>> +		goto err_kzalloc;
>> +	}
>> +
>> +	reboot->write = psci_set_vendor_sys_reset2;
>> +	reboot->driver_name = "psci";
>> +
>> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
>> +	if (ret)
>> +		goto err_register;
>> +
> 
> minor nit: np and psci_np reference must be dropped since we are done
> using it.

Ack. Sure. thanks. Will update this.

thanks,
Shivendra

