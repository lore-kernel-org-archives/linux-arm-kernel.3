Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5196BE9905C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=; b=DJ+4zGqtrvef/rtCvp+QzGGUWL
	A86+AfI77K8mCXDSDHIRs1EPriwWyswnqvy5u7nHlctQj1xIDmsMuFhXsKpQXS16tNtzCxkp7a3OC
	z4PYcI6TdOIelhsZc2pXWWOs0oLPhB1txAns4RmRTM82ZQv8wZvSos0CVHZTLLjr4PohuOmxk2MbS
	gAoM36xaBobDmILRliKZ8jJU67HIQWmPhzRDATU1bDkLsXAOhBQ78DOpQU0hRfoPDp9BwUMpueo3K
	yL84OGAJIR14Gix3zRQZRiWm+sMj6NBd4/WfUd7DxyCHeiTC3EXQMiRIYfam1Lsy1EXHmsq76JBQ+
	XnhpRf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB873-0000000BuMd-3g0X;
	Fri, 10 Apr 2026 09:25:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB870-0000000BuLv-3nCH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:25:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7TPvu3935245
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=; b=a509YB39uX5tBQyI
	MjdoU+aJR0HNKGwFxdLofDnW3SsFSU24zL9ESi4TehUi3fyuVpBvH9sPzuSjd21Z
	WPArMGUJfTGQTvyxzHZZetdoNiDcRYooORs9IyzieI7ZvZmPk23l3yitHyphFSgy
	WMBGL8Kf30ex3bNoL5zmkOCAP4/mNOPk2X1FPDZdZe6slBVeW4vAdmf2yVlIR3k/
	vWGH1o1WA862w0rHTZDEhhvQCslSWgNj8fxLJeSgKgkDT1jVAJY2MmV6i9Ce3ScD
	HJgUgjdLvSmgnZbQC4ofa2fNmSp4vF39don63K1KqiNPjrXzG4mWuqqd7Jy/8muu
	tFQ/Pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbejs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 09:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so1046777a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813112; x=1776417912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=Omb06DV9Sis/JTfq/paG5nFFEAYnWL0TjziHJ79/QaQfZ9y6DhOKYcMKfn5eZ2fBIb
         URKQJh2Johk2B4jdfhlnYMzi4LcFSSB6SlL6wA7tZ1FItCoxFQ6h2iWYloYjmPYqMZ7G
         YHPwh5SfgFTilcM6+EoECjALqNKUixnTbS0gDCTJuDDzNeCC0kwJDQcagd0raTo6J8Zd
         Tq8vEXN61SeEgWh6bnQoaTf5+GXJ3gZe5EVA1lICPQ24jNtNTjXLAbrC6WVNuvBXVMkz
         qfMwJsMX+eGDSN8S9ev/BoCH2bLz3NCZSeER4NOvtKTfwvA5o2Azmza7KUA8b+TWGKiM
         eqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813112; x=1776417912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=bTx4lH/+tP9hnANIvyl0YXkpcW1ySdGqbOEXqp8DPfOrEgo+9fZ7d99elZ4IVMJy8P
         jcKC28eqqa49JdCBxwTgMXFc+JJhx503gd4Ai34FSQ8GHcjKY/EJ/zUmLPmvMm2T9b64
         TCiuLRH4r0RzH60FPg8Y7FlvE1zUzrmA63oj7gFEtAtabd0ChfABfRdB0OMbNdrG+i3h
         uMk4t76vmIRKxPOo5NMbNTDhg5W7ADUuz1ESbW1x06rAcdONGCy2J0lK1DzchRqUFcpF
         y73DdmSm/owntwYWFSVA+LjUVE8QPjIuVPjmjCqrLOS1TKDaWWA6ac1yLdmi4mpr1F3t
         zKEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtscB3yrI4qweFS8rZWoekfa6XTpFVnzGetWJiZh7wnWPMrjpZMASSp5Ct52Vsp826K+KyYc27+3EC1UrcXJBT@lists.infradead.org
X-Gm-Message-State: AOJu0YyQht7M/Iz1YOvHihvTgsoiwhILU1W37ThNjjwszlBX8euXYt0d
	gv99ElI8o4jxOz+ePZGFeR3rXpbnEPonQrAfxXEecw6bq71E0d9DjfK++bnU8YWpz/HGoL0ztQq
	ucQF3D4+ZNw0qlsBsRKsv4cQygV1EfX/H2SF9iLRIIVQlCT2UCui4P9ev0e/ButxCq0WPZFia1a
	XOMw==
X-Gm-Gg: AeBDieupnXBgFEBMul9EWOGp+V9s0GLNF47i1WXjM0nTlXgLt/fMwFVpSd4k9RcTci7
	d5Ex/XIWw6o2/z/QMNgbTRYrXobdiCXraxEOcP+PlYvjVYNdUSeVpjervvjlb8eQdJCEuIZ07/3
	HvamIaJaL0NKW8oRrQGYfG8el+9sNcU3vdzpHKcOt/ZoSObV+ahrUEQ0kT1+zK8DNglqOCLsT/7
	2hr6mpcyGM8BZVgB72qrcIgXYiS0G8fNWNtinCBe3jfNttCHrYWGo9oR0A5eXswxljxQgFkI6Wb
	tGbA+sCmBZzL6WvJ16g4bm2rXYWBkqR3PsJTAcMPrVk68MQvR7+rgKCGs1QHIiBqDPd3fBRqFfA
	pwHwSEuRkVs1OoEFCMMmabq3WyQLgyferoSPKiTxc0NctVe+4
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705981b3a.15.1775813112208;
        Fri, 10 Apr 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705947b3a.15.1775813111521;
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c506150sm2123732b3a.52.2026.04.10.02.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Message-ID: <80d60c30-7e60-4233-b072-3d3719533481@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FV1IWRGNI71yT28kszvntoex1E2gVjYk
X-Proofpoint-GUID: FV1IWRGNI71yT28kszvntoex1E2gVjYk
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8c1f9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MbdO6sGYhmOsAQUEtOMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MiBTYWx0ZWRfX9UiI4Z4H1ILn
 0LskkxS/tPP8j/0/q17ih11MYXhmxw3AdUz0b2A1GMCIrbt1F1FfN43tpwlMLysRCn8A+wGnynD
 /uaW1LIf65lXYomqywuVujGnylgSqgst0AAUkcMdsSRSDAxrM7WGG8EQ31ygWo/tlBzOdVh/YLn
 fsCoS1+7NAXFZJx4I0irTb5gCj3AL16aZSx9lg3zEIoqRcvgTEEXlGjlv8pPvEDe3uU9/rWMiuh
 98lA8YuaFUR01N8uqe87J188DOdFvgbiPClHff/uVWax3JqJrZl0sJh1Fy2IJ/4HqNr36N6c7wL
 L3O90Ed8vzx2G4Q1Wov95hvA5Mlbth5uFlTE0C5n3xJf3sZ1spFhLtUzsEWT2r312VMwAG/+LQk
 qKKcjrvsjepJjJVehivRMCJjNeRDzo41CSz5PHPh0wkVi6RYGms0JiNT+sSrFd14oSIw7+NdZKN
 j+PPdxgQjvSc/Njh6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_022515_066904_56CBFD25 
X-CRM114-Status: GOOD (  16.28  )
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



On 4/10/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Note that this patch and drivers parches were likely not tested.
> 
> Please mark patches you wish others to test as RFT.
> 

Krzysztof, please find the logs, if you need the clk_summary I can add
those as well.


/ # dmesg
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd801]
[    0.000000] Linux version
7.0.0-rc7-next-20260408-00008-g476992104d28-dirty ()
(aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #19 SMP PREEMPT Thu Apr  9 16:46:11
+0530 2026
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Qualcomm Technologies, Inc. Eliza MTP
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000894000 (options
'115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] OF: reserved mem: 0x0000000080000000..0x0000000080dfffff
(14336 KiB) nomap non-reusable gunyah-hyp@80000000
[    0.000000] OF: reserved mem: 0x0000000080e00000..0x0000000080e3ffff
(256 KiB) nomap non-reusable cpusys-vm-mem@80e00000
[    0.000000] OF: reserved mem: 0x0000000081200000..0x00000000813fffff
(2048 KiB) nomap non-reusable cpucp@81200000
[    0.000000] OF: reserved mem: 0x0000000081a00000..0x0000000081a3ffff
(256 KiB) nomap non-reusable xbl-dtlog@81a00000
[    0.000000] OF: reserved mem: 0x0000000081c00000..0x0000000081c5ffff
(384 KiB) nomap non-reusable aop-image@81c00000
[    0.000000] OF: reserved mem: 0x0000000081c60000..0x0000000081c7ffff
(128 KiB) nomap non-reusable aop-cmd-db@81c60000
[    0.000000] OF: reserved mem: 0x0000000081c80000..0x0000000081cf3fff
(464 KiB) nomap non-reusable aop-tme-uefi-merged@81c80000





-- 
Thanks,
Taniya Das


