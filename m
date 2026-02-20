Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9770C5B568
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=; b=O5TeonfCroN+W6+Ob8gopCPuH4
	K86b1U1qiP0maltT9nV+WSrYkbH5sMtbqO/ntA0PebKzzKIfc+Ki8voIzYd6t2WphtjYFczBFkZd0
	ziABQ6LqrOzUbhY1Eki+X89qOddSp9PRB0dfENbsLFYVW1j5SqsMXuNRkY7RSb8Blca+ihn69L7kb
	D4yuWx2lBICX8p7G6LIWZehaUyifLGqw3gzeyHTiLtupflcoQH8sb7tzvwhyU4ZqxQx0aP1PpHydf
	iNNzXHiX+IRo8P/rbm9vUBaBLlOj5Nmu3xJG9EMSPdW98ZIelJty+TJNlchDU+WfMA0ibqjSl3lxY
	CUcW0AeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYMV-0000000FdQ0-2If1;
	Fri, 20 Feb 2026 21:48:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYMQ-0000000FdPZ-3OA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 21:48:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KG5gmX3697617
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 21:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=; b=JdQ66zrluqUy5oLB
	Q4bOyiX9UpzfZk/rBtIix8lptSOscEqZVg8tdASFTwRzKsb62wbuG2j9JlTxeCKS
	VhsWmU/qmrIe19n1tYsx4TcMI3lTZ8/zR/6B2pTN8MLRz6xsEFORMwkpBkhXq6di
	2mWZnVXOmY3Bsv3SChlYCNVyr+8sY0DOjMZVM6rTxxPOMyrT4E7ZnvS+lb2UfjRf
	29HIjf2TZW+U+LsCrrfeeSwCBFFSsuMKH9Gc/os/bzrDQJy8T1A6d+YmRy7YVRgC
	dEjVKih/uHiQNMcFSjcyjsf2HpQzFjci6AmGtsgZ+7znqJTLSSe/T2FMLHqFQlJZ
	ACBHsg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jjfn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 21:48:28 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c7afa9e0so31498769a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771624108; x=1772228908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=;
        b=HvQo2oOks2Gw0YwVAW7xk485CuSivUnL/chvGLc/6ymmuHj3g4mTS6ggkZdruBVfGL
         XdXTwmw2M40oP+1fkbDOWKyrJJTy3OS2MbVlyXPn5IgDS9kstijXmzstBHwBiTNiAUsd
         ix+k5US0nX2sMLCFrTikMTa99nunRmNqrrDdUl+jazOsv/Ky42OCxuUg/0xCTm1d3cg5
         r9ZB4fpluCLYH9XoLOaSU6IxvpEC/zrLyR7p64tkgSe+HZQ5jmNBQyEvQdvVM/wSTxg9
         vQUnT+Fkn34fGillv2e8Zo8X/V/u6oKhRLsaItKaIx/6TKsgvpebvCV17mlParcFToSB
         rn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624108; x=1772228908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=;
        b=VcjrJw/udeayca6JD2Kk/nMeXtjB+vqcZygS4+dyCIR4y/e9Zhm762MkEBsYCjMbIG
         PU1eTwWFWiz/CE0fBAw6YmNRrdCuIlTMe90wnKm91tFWaP++UFoKiMRBI15jmQWIu6bV
         ABsmGPuvWI5ocHCNUDd7tEUwOtL85m+PJYAVQ68ekdr1l4l2c6sodocip5PYRRiXRlrI
         wXjKCVQPvT8ah3gAFbLLNDWBZlEpm7QyeqsLTx0uZNNg1yJiSPRIThwwJ9PCrWp6vu1m
         CQvn8VCon7gvRgeU8C0goXmXvT/DRus+9vSAeAnqk7g2GDdOcYzL3Xzm3MtaAKOqX2y0
         vtrw==
X-Forwarded-Encrypted: i=1; AJvYcCWZLFYCik/vLYp7tS0N9z5pn/WYF8sCFJDW/B1DwgklX3FUcNO+j/AsOb6YO0ce3I1dGR6QVysVNqIr4COo2cMx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6t9ub9N9G8cLwQYYq0GkcfT0eYBIBL79zi3TCS3sXa5nDszYg
	8HC8RwWyjqJLJKo5SKD2koyjOOpESAIvE3AHmSM0/qDR6AGhujDJDmkjkOrVjjNLldiFTeO+hdD
	InS7DxXzrCkOpwkLs4uGKsAWq0F8PN0bq8e2aubLoGY/DP0do9zT+Q/wxU45qijDMgydTRQ6t8c
	E3FA==
X-Gm-Gg: AZuq6aIF1Gib+hN7ZnZ/orJj18V1Vh7Lb6puk9EABf6nw5vYQiaHMiIKYX4s/YtZu+o
	ChV2aZK0sXQ3WzVF1FBXlT8czPu1dzqVZ8XW/Rc7ez5jjPtZFldxUobqMjYNSCgE9hgrEblAOlB
	AY/srwO+GuL15xj6kEYujLkS/DdEI9IM8CCRty969VVgJ0kIa+0CanfItrmD4oPUfhlP3r5T0Qy
	xNNfVx4Zev1Jhix81//ZqnnsJvCS9WU8Lx8A3ml1KXUy2cXX9izGf5UT3C1VJisWCX/fDkvWGkF
	p7HeavoxZ32iM/tVYzrnCj15S6IKuuxHo29lVsr5i/VZqTH9tBCd1iEcQDi3T/iqOOoJejFIzVT
	xaNw918NPQnAVEM3jfdl/BC+IeOK5uOQDGYrkVGC3COrlssRpjQAFJ9M=
X-Received: by 2002:a05:6830:3689:b0:7cf:d0f3:4610 with SMTP id 46e09a7af769-7d52bf36ea6mr1036712a34.28.1771624108132;
        Fri, 20 Feb 2026 13:48:28 -0800 (PST)
X-Received: by 2002:a05:6830:3689:b0:7cf:d0f3:4610 with SMTP id 46e09a7af769-7d52bf36ea6mr1036688a34.28.1771624107604;
        Fri, 20 Feb 2026 13:48:27 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf9f489sm608050a34.7.2026.02.20.13.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 13:48:27 -0800 (PST)
Message-ID: <2379d582-47a0-47c1-968a-04d5dc2a0d9d@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 13:48:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Andre Przywara <andre.przywara@arm.com>, Salman Nabi <salman.nabi@arm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
        vwadekar@nvidia.com, sdonthineni@nvidia.com, vsethi@nvidia.com,
        linux-coco@lists.linux.dev, sudeep.holla@arm.com, ardb@kernel.org,
        linux-arm-kernel@lists.infradead.org, chao.gao@intel.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <20260220173929.02bc2cf2@orionap.fritz.box>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260220173929.02bc2cf2@orionap.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=6998d6ac cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=7CQSdrXTAAAA:8 a=KiQHqBYQfqT5kMCPLFsA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE3OSBTYWx0ZWRfX5BHoRVuoiotb
 rbDC9K7w2o07JRRGQ2dyxrtCsKa+utehgbM6OHGeaQsCvPh3q7Rrr9iAV247M88yqcaF4IMTsoS
 XxNVt8e0c/c8pLqEGJaYpjcR1xTXjgEWl92hKFzYuSMjIRpEpOULShPs9167+2mn9ZgmZPvaPO4
 PZu+VS+4SYiRGscRXyBlnvE8GWyK0/hiKwcrl/vvp6tAwd67GvY9vwgh1/6AV9eXuSNv4leh7C5
 ZQA84rH8Ha2lvgzjysIUhqhycLDlXLgAZNgvmNGBakA5n1lcKDgVxR5LF6W0FB5vZucRYiYY5pB
 w9iG9DGuLwGEVhohQkiMOEvEiT0/rAGKVsVBgVC5taCy5IwoMHSDdmCVX1Y1hySgaI6VBXSbysl
 iMiwcJM/xcqsN4WQq08rgSOGd9nqFMh7GddKzewLPwu5hI035EqgG2fiCc7u/LUCl13fopOMpSs
 IvBZDk/BpgPNzgw1osw==
X-Proofpoint-GUID: 6a-CcK1jYc6CsvKZw44JEbodFSblfXqE
X-Proofpoint-ORIG-GUID: 6a-CcK1jYc6CsvKZw44JEbodFSblfXqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_03,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_134830_972582_EDC942DD 
X-CRM114-Status: GOOD (  25.50  )
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

On 2/20/2026 9:39 AM, Andre Przywara wrote:
> On Mon, 19 Jan 2026 12:27:29 +0000
> Salman Nabi <salman.nabi@arm.com> wrote:
> 
> Hey,
> 
> for the records: while working on improving the patch and during internal
> review, we found some bugs and issues in there. I will mark them below for
> the benefit of others. I will send a v2 after -rc1, with those things
> fixed and some improvements, and will include Vedashree's patches, so
> that we have everything in one series.
> 
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.
>>
>> Add a new directory under /sys/firmware to present firmware components
>> capable of live activation. Each of them is a directory under lfa/,
>> and is identified via its GUID. The activation will be triggered by echoing
>> "1" into the "activate" file:
>> ==========================================
>> /sys/firmware/lfa # ls -l . 6c*
>> .:
>> total 0
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>>
>> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
>> total 0
>> --w-------    1 0        0             4096 Jan 19 11:33 activate
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
>> --w-------    1 0        0             4096 Jan 19 11:33 cancel
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
>> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
>> grep: activate: Permission denied
>> activation_capable:1
>> activation_pending:1
>> grep: cancel: Permission denied
>> cpu_rendezvous:1
>> current_version:0.0
>> force_cpu_rendezvous:1
>> may_reset_cpu:0
>> name:TF-RMM
>> pending_version:0.0
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
>> [ 2825.797871] Arm LFA: firmware activation succeeded.
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
>> ==========================================
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
>> ---
>>  drivers/firmware/smccc/Kconfig  |   8 +
>>  drivers/firmware/smccc/Makefile |   1 +
>>  drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>>  3 files changed, 677 insertions(+)
>>  create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>
>> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
>> index 15e7466179a6..ff7ca49486b0 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
>>  	help
>>  	  Include support for the SoC bus on the ARM SMCCC firmware based
>>  	  platforms providing some sysfs information about the SoC variant.
>> +
>> +config ARM_LFA
>> +	tristate "Arm Live Firmware activation support"
>> +	depends on HAVE_ARM_SMCCC_DISCOVERY
> 
> As the kernel test robot correctly pointed out, this only works on ARM64.
> SMCCC v1.2 is only defined for AArch64, and the LFA spec documents
> actually explicitly mentions AArch64-only at the beginning.


Thank you for the update. How to test these patches outside of NVIDIA devices?
Is it possible to test them on the QEMU or FVP? Any instructions on doing
these tests will be helpful w/ the virtual platforms. 

---Trilok Soni

