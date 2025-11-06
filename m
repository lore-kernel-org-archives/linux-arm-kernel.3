Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0384CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=; b=U3HvUkfKNHY97gzVcHf7qUz08/
	cCz926n+g+wjgttSXmeHQXLPirlavrrpTy6ubKUZUcFs43oTbRXZZ3xMHJ1Dy31QElrl5tRlt4FYk
	DogvKoCBwXvsl63zavdgI/aBfERBghf8QTVg1zixuqZ+asD8EmXrrtnZ4/5kIDgphffDmf0GhH7BT
	6giH00c5gWmRLz2SLrsloKwMoCfEEGB47RNdquWduaT4EEiFY1g0CqpHLMMhXXOONecs1LQPoj6UX
	pSHqvkQmpvnbnfLPnm3S2AfYAiCd4SB0/4AGWg99Z3JbRfAKcUI82cwrR8g7OA/hUgQxM2u6hA6V6
	5V/hy7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsQs-0000000EsbX-2WPQ;
	Thu, 06 Nov 2025 05:21:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsQq-0000000Esb8-0li8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 05:21:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFGYv1689591
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 05:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=; b=WRc3ahhti01mP/nS
	a0ZZsrLbtQVZqgGsDbJIRcegLE45S/8NII2PJ4J6egoXAk1eUpbMbArpEzJlVNEE
	yJrIixgUQ6TQhB1Os6qeGhK/SFL/u+TmtGKfjFah+v0jrHKg5cYOvZxq+FzGsqp0
	/GFQVq1swaEkRKJWVyr+iAm8QM61avcZjXdLoauOIKrMsaa0FSECT0Zu3HgwB+Nc
	EXte0pFxKeHbjEx3FlCYTiiQCKLoUXFVtjrpBYRmdpu/K5QBhaEZBgvKtbmrqoLT
	WGJdPfWj5+Q2diNGiPiJfWIDAJseEmjvNRHO82qEFgk8YE1RwRcp/mCbX41cs12F
	pn8+vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pjabkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:21:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso122518a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 21:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762406471; x=1763011271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=;
        b=DHNSqp1ofkyaiP9gTsaQ9KV+akQfBBN+Ayh9RgO5evTPGKNrhI3V3tgt/WJ61d/P4G
         ooJh9FVAgh3wyeJvT5N0ly9Rt6ZgwBv0gqB347TVVNafwS9TtUnFe3qliya8yj0/fRx1
         ZTKcrC/Z1GXufpYPJnXltkMymnZ5uKyHEsFqvj8xZaZfnNRxxfa9JWKpdIfFvpHpSfd8
         NpLKh7n2Pk/i3QKSuqKyCA98fQY0M76TGhF6+L7Mn+ySh8v9/bnRsqd+GGYqI+z3E/8o
         ruBlyB+8yhQ4VITAyNVE/HcerY2W+ZXo89WlnqWRgDvMKZVcIVLGxlUkuRdJMDx8yPVb
         Z5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762406471; x=1763011271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=;
        b=SF01P/SAfp8TfxUTjZ6nh+R7+n9sHw+xeNk0FIJtKj/y68ryvli/03tmDucRN824h7
         8QqbGGYy46gsoL181uJQCU5WlUucXNnxb8pbVsHoAq70DFmgjs6g/wSh77F+hPdDZ6Td
         ms4KqxJHyMsqdP/6noT8ZivfYcQsgonFhFXU2q3B+zKhO2rnSmvx35YajOXJy1DIDoc+
         /F+hTJ3erphYHAltUjZENFhi7x287uYJ7y+nxE+BsZKzXbC1BwtuiKLWYx6Ueqq4xBFP
         1CD5AAdjii6Or19Om1AA3Lb/GXmLLRLCl7O4aupR4FemY9sg9xS/XRU3NGda635l9Mnn
         NszQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8frxuCBn8pZXxrwB5KSccgSUtZ2osR2ojtnG4Mdg55ayPjOvJx1mccBo6Ukp85BXnRCEtdRJgd8mxy1w4Trlw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7HMpLyFo7Z8tQAtJMG17KFLAelfwNs0HAS1LFmt9PnoDqOs9/
	LXvCQK85+YqpgKAFwLVKTyGQLuaqOg+eL3/Q6vntcHUhs694CT7Z8oL7d7a7KsilHGvRBRiUqHn
	WAgSSgFI1ik5QetABZXy8/C0XMIsNm6xhHZhPNs1qRyu23JFxC1N6SeWBcFsYWPD+F7Lip4DDzy
	cFBQ==
X-Gm-Gg: ASbGncv/CBbXwb+Hb27dlmF7j+E/Rxa3r7Il+FuTo4oPEi1VKWl6Qt48a9YezvNHauJ
	CsH8BzVob8C4vGbfKC81cHu/8oegTx382z8hqkgKmB8AMgAhBkTBCptsSdaI2X7Gi/1um1WbstB
	FsRU/Ql0nbuIW0hp6pc2k8i4I5V/Ofg8LAHvv+fMgaYxweCfMTr0o9JNEIJdSZNEYsWF8xwmpFt
	Au1j2/TdxwbgFhsCJD2t9w0m9d8RjvjwSCAlw7HSsIsq1cq5v+iowgxlcnF26BugTZN8oFFTTQ1
	i7K7S6o2lC4F69iNvzm93kW3sGctyBDMMDKaEpO3oYNgNvJMFqdOqimy7CkmSAP70CtFFKpcTXI
	FdxTXIs90t0WVWN0CSoHdLRa1idauYTI9TYtqTXW33jCk5CPX80XNpn3RRVvCTOFQ
X-Received: by 2002:a17:90b:3bc3:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-341a6c38b41mr8663448a91.7.1762406470761;
        Wed, 05 Nov 2025 21:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7dLThSEW7j05wmchUfxTaYUv+Brm09rxPqitt04qLKdRwMZtVg1+BzIzZC/EM7YSPdrXh8A==
X-Received: by 2002:a17:90b:3bc3:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-341a6c38b41mr8663393a91.7.1762406470221;
        Wed, 05 Nov 2025 21:21:10 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21f6sm1151495a12.13.2025.11.05.21.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 21:21:09 -0800 (PST)
Message-ID: <427a8b79-075e-43d6-b580-510f99f547c9@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:21:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] add sysfs nodes to configure TPDA's registers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X4pYsAfJBLIu6mLFNGffwjWxuofTz6e3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0MCBTYWx0ZWRfXxtY48IgfL1TN
 cmUyA6aZguFhxbxU1pYfAzONLNHDcBSSyAPQgiZXjuW1pFpuROrWKP+bwDP5wnNGz+lMuXUw9j8
 t4N6r8gCA82l/S6Hbq7/OvYTtmmSD+HJdO4Sj0doNvBqqvOMZMj91IYkbxzsfKsm3M137M/bwwT
 ypeUC14H+1h0/42NeW8jeI13/KoFhu6ZoCYB9ZIPp+5uFH1cHHR8rjlOVNf7dBPqfil4Seayb8w
 nV2SDCR8Q+76A+qbt3tAlJtn1T1ajm7hVJsXrJrVG1u+infN92vebknKJXLeB9hPq0P4yGbTJii
 OpkCqxLm6NdWHIXLEMD1pM/I9EmD3c8V8lopye1dWc9CJQYsa7tSeFOg86+SOs1dZKySbMCXCnv
 gwCbDaWp1da3ke/JuwDyQMBfUjauFg==
X-Proofpoint-ORIG-GUID: X4pYsAfJBLIu6mLFNGffwjWxuofTz6e3
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c3047 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rf22lFbXz3lptHW25oMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_212112_400966_83AF7331 
X-CRM114-Status: GOOD (  17.81  )
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



On 10/28/2025 10:02 AM, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 

Gentle reminder.

> Changes in V4:
> 1. Document sysfs nodes with correct kernel version and date.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Tao Zhang (3):
>        coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>        coresight: tpda: add logic to configure TPDA_SYNCR register
>        coresight: tpda: add sysfs node to flush specific port
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 278 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
> ---
> base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> change-id: 20251028-configure_tpda_reg-f3396f97f9a1
> 
> Best regards,


