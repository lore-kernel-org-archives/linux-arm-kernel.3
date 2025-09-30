Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE013CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0BzqZ/4sw53r69E6XghJy873Mwyh6QyOXwyOoGLze0=; b=o8EXssgLnhaxqNNBfbdbS52O4Z
	ZdcjqKbhjUpqyPX4o+BcCqUd9L670BtBWnUV4YMS1vzCOLxGytHid6Jlg85F9FwHy9EVi1WYXrzOa
	yQ75ZNIk+CI0eynGp65StSk4Nr6cbme3CDVROaHo+HFbqk83V4QSo6k+DAU511eu2KX3hrxjj6bqD
	2apoOdZm/YUS+W+L1A/4ft7xOoo7nJTG7BxldEeZc8zT8DHY6hu4njtqoZkLDTt/K/Xyaw6eCBr1L
	TAeE/n1kXbVdzb8Qi2vGAwk97kUEKz5OGhJq9R2a2QirrBRyq9L312rvi+sz+jvIjhmOWCiP3jaZA
	SDLNkQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ymx-00000005Aev-0hov;
	Tue, 30 Sep 2025 11:44:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ymu-00000005AeV-12Ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:44:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBG5Qt027373
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l0BzqZ/4sw53r69E6XghJy873Mwyh6QyOXwyOoGLze0=; b=duebPmOWUOAADAgx
	Xb6oWB0SKfqaSemGSxG17Y6Vs2+ilBdL7yyen//7uO8d362HGEtd2/074EkDd+SS
	IsVxX9WI0eWeoss4SC8xRguh4eoaRufAUQdrAIJUfe+YfcBKWwMvQy21/GZW/FMk
	FyWRo4ZT2jiKA3mBZiUDE+Y8NcqHZi7sKVmWKttOntkBLsA1+H1insTqwZRxDXQZ
	E8rTmxsVTg/vWiXfNlhT1uCwfR0/PunLFoTRUuwqJ+rjDOAkYG0Ijsipx7khbAk6
	Ddluj2BFftVtdj9SyiVHD4cfvvidjAMEUj2a0IPpE3nKZsLnj9Zkx3AOqNL6newM
	4SVmgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851grgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 11:44:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25d21fddb85so105999035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232693; x=1759837493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0BzqZ/4sw53r69E6XghJy873Mwyh6QyOXwyOoGLze0=;
        b=Nn7+ajCHr6MM+CC9lIIqhkqswxho06841F1hlfTjaeFEFJWx1jagL5T5eMboDE81O9
         qYs7yIPppB2UcSsxhhycUxyqXjEWTCJauRVBklv/ONUWB/0Vg8g4GRW33Gs5x/Gnnfmv
         wd1l7qMbasxY36i3RHs209W1EMJiWlvaxLVlg/dBmIToTAn9qdQtpSiTk6zZIKktl+M8
         pjhSRQzNka6c2uIJ15/XM9Lk4ru/bTNLzm5FuTJawwk9+sXU6rUsN/n6vzKdF4k4fpAe
         uFYWj37kxryekGnEKc/FG/Zr3eGFy1mx9jgjOmn60ME3I11pEfGrrwrQUaqGs6Bnxj/k
         iRcg==
X-Forwarded-Encrypted: i=1; AJvYcCW3RtP1CiJ97DMfNHw0cgrPaAnXQH7WSf7REo7oTxMG72wqom1c+bT0xcubyXle5PQSYvpzZNOtf+kCwqfW3XY/@lists.infradead.org
X-Gm-Message-State: AOJu0YzG1SRivuLwjdYmMZj46vr6AZvp7FeeI2G6C2sV/4kIMlvjLGte
	eV0WDDhVrw21vyvUhr6N0g1Rsd04kNoPLK3DF/hWRnF5ejfXahviISH3RKxVTGT/xFmlrnW1GCY
	G17l5sg5piTreyOHUBHHuQaoBp92JitRK/WUCT9uq5LYBLcgsRnSC0gcJIJr6676iRsbw5ty6Qr
	1XAA==
X-Gm-Gg: ASbGncscrYmxAu0/drNHIZepVaEH4zaQeuwNd+b/D0kqiql3eZRmXg9bZ9jLsz8xeBg
	ncv0DI0GNLEL56WN6dcW5WEk1ARu2iFyDgJZ2pITJeHhnliqJEEIJXDouyDzdI65Sq0Ks6h3b2w
	oBNymeWsxA+9aSRyN4b6BH6HmbJN1occ97PlutINbKaX5rMTMXwxpoVNNeIp0QzidGcH3Mu5L8P
	ZPrhsNO+wumYdpjjlSNIKJdBqfjy6SSdz23GaKYkVYlnvkzWdWJT/MIlFqAL3bS9k5Bxbtryz18
	s5RCNm2RIC/i3s7G0cNDCuXnDhuCtYMxUqnlhmhtb1wS73hYaEEeyX/XS3nsE7cgN4zVBfrG19F
	GqTg0
X-Received: by 2002:a17:902:e54f:b0:267:9c2f:4655 with SMTP id d9443c01a7336-27ed4a49254mr215223005ad.41.1759232692518;
        Tue, 30 Sep 2025 04:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEve1eD+dd1r1YsJpk9PlBGwIyu3HmOFMAgn0RGL0ZK0pja/BCi89UoErtpan0WzMlLpeewzQ==
X-Received: by 2002:a17:902:e54f:b0:267:9c2f:4655 with SMTP id d9443c01a7336-27ed4a49254mr215222655ad.41.1759232691985;
        Tue, 30 Sep 2025 04:44:51 -0700 (PDT)
Received: from [10.219.56.238] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1fd9sm156376915ad.142.2025.09.30.04.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 04:44:51 -0700 (PDT)
Message-ID: <2a428158-551c-0da5-17c0-b47098aecad9@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 17:08:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v15 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
 <4276eeea-5877-4420-98da-a5f2eb5c0505@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <4276eeea-5877-4420-98da-a5f2eb5c0505@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dbc2b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=m9_P3jxxV_FW9xONvJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX6TcmZwiBZLu1
 kU/2pE011wdHiBivS/Rk5bDq4GOMprJUdLW0FGCRftNeoQqQS+Uzy1voOKjyQQFPkUavJiJ4pZn
 4qePsj5Wcd+bQhO4STJeW4Us0lphHIG/qG7rol5Qxm0F+2u+che2/3byQE2R/jhU5V2M/g21mlM
 9MyhplKkO9+ZPVrl+IUVe9bvnB476BxBhsWE+xLVL9ErV2BxHV4AyMvofp6qIWd9jniqwQc9A20
 1Zid8oqaTX63gTxFkbCQUZKHhXIl3bwtrC2I4hii1snzWRIeQQ8Tyae1fZIGv3hrTTgOSC9n0cj
 ai0QINMVZgCLjgeDHArP5zHYdzXKcMC3KnknKDg+UAkNSKYihVUkJjWch633vMIzb9vnSniIHz1
 DKy+q3idROeiUOlY4QJMhFKOzyaH2Q==
X-Proofpoint-ORIG-GUID: X2Ua4s0xrzxwWnI3LJW4UlF0Ku9clYsY
X-Proofpoint-GUID: X2Ua4s0xrzxwWnI3LJW4UlF0Ku9clYsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_044456_295889_FD5AF244 
X-CRM114-Status: GOOD (  30.77  )
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



On 9/30/2025 11:15 AM, Kathiravan Thirumoorthy wrote:
> 
> On 9/22/2025 7:10 PM, Shivendra Pratap wrote:
>> SoC vendors have different types of resets which are controlled
>> through various hardware registers. For instance, Qualcomm SoC
>> may have a requirement that reboot with “bootloader” command
>> should reboot the device to bootloader flashing mode and reboot
>> with “edl” should reboot the device into Emergency flashing mode.
>> Setting up such reboots on Qualcomm devices can be inconsistent
>> across SoC platforms and may require setting different HW
>> registers, where some of these registers may not be accessible to
>> HLOS. These knobs evolve over product generations and require
>> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
>> reset which can help align this requirement. Add support for PSCI
>> SYSTEM_RESET2, vendor-specific resets and align the implementation
>> to allow user-space initiated reboots to trigger these resets.
>>
>> Implement the PSCI vendor-specific resets by registering to the
>> reboot-mode framework. As psci init is done at early kernel init,
>> reboot-mode registration cannot be done at the time of psci init.
>> This is because reboot-mode creates a “reboot-mode” class for
>> exposing sysfs, which can fail at early kernel init. To overcome
>> this, introduce a late_initcall to register PSCI vendor-specific
>> resets as reboot modes. Implement a reboot-mode write function
>> that sets reset_type and cookie values during the reboot notifier
>> callback.  Introduce a firmware-based call for SYSTEM_RESET2
>> vendor-specific reset in the psci_sys_reset path, using
>> reset_type and cookie if supported by secure firmware. Register a
>> panic notifier and clear vendor_reset valid status during panic.
>> This is needed for any kernel panic that occurs post
>> reboot_notifiers.
>>
>> By using the above implementation, userspace will be able to issue
>> such resets using the reboot() system call with the "*arg"
>> parameter as a string based command. The commands can be defined
>> in PSCI device tree node under “reboot-mode” and are based on the
>> reboot-mode based commands.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/firmware/psci/Kconfig |  2 +
>>   drivers/firmware/psci/psci.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -1,6 +1,8 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   config ARM_PSCI_FW
>>       bool
>> +    select POWER_RESET
>> +    select REBOOT_MODE
>>     config ARM_PSCI_CHECKER
>>       bool "ARM PSCI checker"
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..40a27bc2cc3a3393acc14c7b2314155540ed06c9 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -13,10 +13,12 @@
>>   #include <linux/errno.h>
>>   #include <linux/linkage.h>
>>   #include <linux/of.h>
>> +#include <linux/panic_notifier.h>
>>   #include <linux/pm.h>
>>   #include <linux/printk.h>
>>   #include <linux/psci.h>
>>   #include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>>   #include <linux/slab.h>
>>   #include <linux/suspend.h>
>>   @@ -51,6 +53,24 @@ static int resident_cpu = -1;
>>   struct psci_operations psci_ops;
>>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>   +struct psci_vendor_sysreset2 {
>> +    u32 reset_type;
>> +    u32 cookie;
>> +    bool valid;
>> +};
>> +
>> +static struct psci_vendor_sysreset2 vendor_reset;
>> +
>> +static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
>> +{
>> +    vendor_reset.valid = false;
>> +    return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block psci_panic_block = {
>> +    .notifier_call = psci_panic_event
>> +};
>> +
>>   bool psci_tos_resident_on(int cpu)
>>   {
>>       return cpu == resident_cpu;
>> @@ -309,7 +329,10 @@ static int get_set_conduit_method(const struct device_node *np)
>>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>                 void *data)
>>   {
>> -    if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +    if (vendor_reset.valid && psci_system_reset2_supported) {
>> +        invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
>> +                   vendor_reset.cookie, 0);
>> +    } else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>           psci_system_reset2_supported) {
>>           /*
>>            * reset_type[31] = 0 (architectural)
>> @@ -547,6 +570,70 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>>       .enter          = psci_system_suspend_enter,
>>   };
>>   +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
>> +{
>> +    u32 magic_32;
>> +
>> +    if (psci_system_reset2_supported) {
>> +        magic_32 = magic & 0xffffffff;
>> +        vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
>> +        vendor_reset.cookie = (magic >> 32) & 0xffffffff;
> 
> 
> Minor Nit: Can we use GENMASK(31, 0) instead of 0xffffffff? Apart from this, change LGTM. With that,

Ack. Will update this.

> 
> Reviewed-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

thanks for review.

thanks,
Shivendra

