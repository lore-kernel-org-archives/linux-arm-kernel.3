Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8979DC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGUtbaoC0vpuFL55AG2VRarJ9dc5j39vjlLJQCOeDKA=; b=wAbt1S7m46HLbT71DQyq/9Vk4N
	JfO8RwT24Mo28Dr6QguRbxUMcnGUucD4jb4PCQHLi3j6CL85iZ7CEZneVOUDwXgVYrXGLEA53Kk6t
	fVLJiLSBCLsn1HQ3I2p8oTwnwNgKSWuj+sB9MOgr5lIodXk9cd66+iYghSTk1Nbds7wV/VKco5N4m
	SPih1euSgtWVBJQHCHN2bQO+ebS8MQG1WK6hfTxGdE+12naMF5g64xX6tiMMJNB5ydteKlmJzt42b
	G/STN7+cheEtOgI20q+F1/jqEuKh2wGIm8wodlZvROq/KwX3yqj5xsxgGwN+tXtjgOZIOhFD18VfO
	0PmwrQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4A3-00000006bB8-34Br;
	Tue, 11 Mar 2025 18:17:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3um-00000006Xpf-077l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:01:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BF66Q0028290
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 18:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGUtbaoC0vpuFL55AG2VRarJ9dc5j39vjlLJQCOeDKA=; b=f7mlYYFt7jkvBncL
	ycrW6gqllkYuuuP3eTk0nPUOru3/oztfu4M12Rsz0adLFr5RPvGIcBuN8ygDnBmu
	/pZof8XL1WNBqVfjFWFebjQsJwKSYA/mhNQBJ53Fno+SvN9PH5R7kxj7/1naiuDM
	oKRz8gEx/HBvBDWeoO00EaDM8YgLJm2OmidoWAvqsCRy5ZMbzzwnjY1jsrIVwGPp
	o/9GxJe7/wVT3DfWhZNrMExav2YbW4Ft2kB/xLtC44/ARLdQL0wqQ692IQ8iwMnk
	GI3X+9EPx+rPEusBSj6czHHjjZmdw+FFSiQwBbo8X6mI+9vXEmCFPZjukOmu5YoZ
	DNS4pA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0w9fn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 18:01:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a7aceeaso102919195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716074; x=1742320874;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGUtbaoC0vpuFL55AG2VRarJ9dc5j39vjlLJQCOeDKA=;
        b=ioCWuVoMgMi8mpp0d5B+FADXEJgVqA4SoeRczaTvotk9DEKev+5Lkj5ENfEdmz7RHZ
         DllZAvprMJ9ZjZlQO+JSgakzjKlj5mKNgfboEGrem0XrBRPFaZYwdx6ROpyByGYe2rD2
         qcT49bVDZ2RMuqrHj8s1KrssKGPwhzcfhaLdFcFa8O6irBWE30vpBLt6QI+gqyD/0+Sk
         D72IUmCagTnTi1CDs3PfEjVm+TQi35oTUR3J2v8StZ1oo86mWIQsZa9rpiWh6hIc9Ka1
         fp0yze81jGaxZcRKkqRHwxPJ7nhb/s5pNwrsiYLFZwKZ+9l9ZzK/BbkqlmYkMH083FMb
         J6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWpt/ts0FY2TDtDN2hZIxfMjHCiOS8EI8ESRyNJMWzFbhgD9LojdQ9/H/qiHII72GToMQG9E4oxeNYUGgMRDic7@lists.infradead.org
X-Gm-Message-State: AOJu0YxySOPPepMr4/ZGatARAnNtozHA1yelFeVDovS30rs+zEBhyuyR
	QOYxnPgP9ZYGBCvb73cA6LfmndQ4HmFnV2M8qAYWag/3n+gB/UO9d2L9NhAhva32hWcahGDiAOR
	VpWThlXOrIhuA/Ac74RJJertVMOpAlC6gW6iPV1U5r+7VAv8EPowxQ32sT4Aadh3w/1jA4gyG/g
	==
X-Gm-Gg: ASbGncsDkxvGO+OSAcaQT5aewp4eckAaMg4MWydsrJQccsJbtCkAZPajohKlXLl4IOQ
	ai42vB3S1/7D7cdiqBE5uRwzyV/THThplr6iCjvBs6CGbjQm+4lds3Z1q9v7s4EIFEw/VoJIHmX
	BrNyW3NYjbzZYbI/yc+OarXmcK7p3gghfcAMlN2Rd2m39nBB2oYx7vxjybHG/5zlvouInYIVsgz
	STZjJLK10JIatINLA2olInjDn90vALIzAe1gvIY+2cZUNZQBlt8VTMATn17A0AN7EQozTeejbEN
	wcc//JgIv7WQaht69mpGU1EEoLfDflYv5LK0EvMRFMJoChFTiA6r
X-Received: by 2002:a17:902:ceca:b0:224:2175:b0cd with SMTP id d9443c01a7336-22428aa1c02mr211881715ad.26.1741716074125;
        Tue, 11 Mar 2025 11:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV1XMOUAaf3mrw2N9csl6TPk+/0MVQ+tofdzFboBXtSDMFtl99aFN84M5tc6CNvpuZXGk9IQ==
X-Received: by 2002:a17:902:ceca:b0:224:2175:b0cd with SMTP id d9443c01a7336-22428aa1c02mr211881145ad.26.1741716073692;
        Tue, 11 Mar 2025 11:01:13 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a92016sm100936345ad.190.2025.03.11.11.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 11:01:13 -0700 (PDT)
Message-ID: <fcd132af-03e4-496d-ba70-0097e90a83cf@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 11:01:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
        linux-hyperv@vger.kernel.org, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
        mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
        will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
        joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
        jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
        skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
        ssengar@linux.microsoft.com, apais@linux.microsoft.com,
        Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
        gregkh@linuxfoundation.org, vkuznets@redhat.com,
        prapal@linux.microsoft.com, muislam@microsoft.com,
        anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
        corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aP2JIfAyNLLDUF28j-mPrD2a6sWcLUfo
X-Proofpoint-GUID: aP2JIfAyNLLDUF28j-mPrD2a6sWcLUfo
X-Authority-Analysis: v=2.4 cv=MICamNZl c=1 sm=1 tr=0 ts=67d07a6b cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=aMAvcm_y2WmIjkiga5kA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=693 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110116_088269_5F2F0EA1 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On 2/26/25 15:08, Nuno Das Neves wrote:
...
> +
> +MODULE_AUTHOR("Microsoft");
> +MODULE_LICENSE("GPL");
> +

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
to avoid this warning.

This is a canned review based upon finding a MODULE_LICENSE without a
MODULE_DESCRIPTION.

/jeff

