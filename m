Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=; b=du5zj+lcFPDb7ywuS6wPasM0L4
	DZFvrlmtTYngBoq+fPRT7L//GhcsupK4CNe9C+kqS80sp7gLYK6+FpJrxiFqO9UdOnxmWIPQ0uGTJ
	axSLDOlxWPZnXmN4CtnZeGdeXUG5LDrvSrXIc3KiaWe7BgFccG/ajK0Err+J4ihzA54yPfFq7164A
	4YMkF6FBwwSz7yNllMIWTIqL3/JcrmC8254JxKfjRBwcAUY3OhHHjVEYbQN9KJXkjby1GzSZjm9vx
	8CfCfBjedf2J7ZXhUDeGiZpWFGRuCuwVI+5+YF8tOBvXyE7oL5n6W689NpiBEroavnGMhjeEfVXcO
	7hhQ8LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy0x-00000006zPp-2nlz;
	Thu, 21 May 2026 07:40:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy0u-00000006zPL-1z01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:40:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6LwXw1798400
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=; b=EdgJ7aKe0dbx0o9S
	oswDIcris1MmJIdTlkWGyqwXmEyMm/3+tcV0c8RVBba2keOATX6VY1IK7+RhInKX
	68T0EmvjiVGxca3xv3eZLnruWsOkpD8IaTEebkgqbmb2gJI/DRPlOxka8RpPltRx
	kn8eJOm2v7YhxVfCX/7nVahcBv8XmSQASVDC8Jdk7bun1eBRHu6UII+Q/SfmIIJm
	8tuT2Hf/2AdyVCxdYCK2dUIiLdAFLLUI7zI7M/IyZCV/KH68mC0Z5T9NjJgCdK/m
	g0dbgmfs1x/0/vVsQxUAqDxXjW0K/cZ8PgWFUtvkpejH2LFhWivsL+vAMPCwqp7z
	gqQU3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu3ssf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:40:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8354503d9acso7692061b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779349214; x=1779954014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=;
        b=DwUpoeINmvPWUzhOXEC7Dn3WSyd7ha5pypK20aTMMved8I6kOqiLtqwFijKtLXDju6
         qU3xOwom6DyJWiBi5xX1Ac3+Ic8DEGkzEcgvczyVtHq855urZcmtYsY9DcgwKQSrkRAS
         TVCRtsWzra8fnPR8KH4yfoyjNrgLV/NddgMQXRmW7A0rW/92Vdlb4FlgI+n566Jv8oVx
         sWWhLGGMPUK/2ujzsJ9OppY0ASsU+nF7LckxWxfSaoiLb7jSbkG1uKja6DE/tAb5msea
         Jrx+G6qZVyNS5b6YvdIbsPdLyJ5WZTBlOqrDITRpXZcM9FwfBOZY9fJCqUstzBBsipWE
         ioPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349214; x=1779954014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=;
        b=FBo8MCvw4CkO+sHk4xVNlD7moznLIWNFa+xaEbeQovmgnz6JCZJMoUgY4VWmAGVM5a
         2inVi2nR3sqMP3xRAJnpseg3uop6el5cTouNEkiHs4npaxQsw+IhJmKwYkbGIt2oiAN3
         g/fdBwnKCpmb0VJLcym5TdYDH9a3I1Hv1LmfHjpo7hEvhWFrRCZgAXlzT4EQf59f9jPz
         YQuK3/YK4N+PMF7mMdckmuH7GisqLdLcy3Ncn5XRz4PcSybeMlBGkPC1IBK5/e2gyqCr
         zbuEYhH7fXfplLo81k/Unikd0Ste89P702EFOSKmaf/zukuog3Ok2WnFqLvjhcbEP6cP
         kf3g==
X-Forwarded-Encrypted: i=1; AFNElJ/9DgAns18ezqKsjSrmt5pE1c+ucYuigSrm+rr2JHVhALb4fARpzDsotFrKTtNqBF4sPik8Jgd5teRgm922Qeeq@lists.infradead.org
X-Gm-Message-State: AOJu0YzGApqo1Cf1gxP/lc/6XBeIaNYXeQjOqhwNqVuPKHuU+Qv0ArXk
	oc4thuKdjq2WV08dskcK2Cvbo60hsRmJJ7+JK70wxwcuDVr01suDcy3q77MImCwGzOKFabduCnR
	rdUBnoGoFDlUgpGagLHPaYRVL0Xm8jsJZIHaDJkIVSG0hLfAoEik5/omsFxg2UNBIWZAglM5+RT
	HCwA==
X-Gm-Gg: Acq92OGf7UUHikHbMFG+nqmuYeE1QpK9tO8crAz7ZC+B9f7X+8gppYtAzo3oN2f8y5K
	7QpBVllMezWUkN6prurYsFgO4xu6iiTFNZEvweay7/My1eabyi6mt0mNVO1RF0Xi2VtYdyWCLm1
	v3FdDbsy24sPKpLcK11A1GiPACSiOOSpwaBhkiF0T+UJlJHE0hoD5U+eB8Q5eBjGqIY3kM4ge/I
	q/AM3fL1vNysoytYXtt6SHvFeAVz41b4+wBWhdyI46xUJBXpPx6U3T3Boyo78qECtbZ9Hn5RAun
	uwOCo2Wf58KQGFSyzMKk/jbHtks1g7bzPbX31S5cnSyroi5ZEoORStvp4Pale6PbEsiB/uawUER
	6Z9FEN92E9FbXM0gVRVkHBjYL4e4StLbwNm2no7dAswoH6E0Ywj6b6jHqGSc63RbTLyc=
X-Received: by 2002:a05:6a00:4006:b0:827:2a07:231d with SMTP id d2e1a72fcca58-8414acdeba9mr2010671b3a.17.1779349214173;
        Thu, 21 May 2026 00:40:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4006:b0:827:2a07:231d with SMTP id d2e1a72fcca58-8414acdeba9mr2010643b3a.17.1779349213557;
        Thu, 21 May 2026 00:40:13 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm477039b3a.47.2026.05.21.00.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:40:13 -0700 (PDT)
Message-ID: <4979e748-ce4e-4244-8906-e22a1e6472e7@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:10:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>, o.rempel@pengutronix.de,
        kernel@pengutronix.de, andi.shyti@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com,
        haibo.chen@nxp.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3MyBTYWx0ZWRfX1+SWqPJVLk0p
 X13SRcUFIPfpUOdYHcjDbO5xcrE748+z1n/RbvzA98KWaTVXt2+oXP3qOQqQxL0V+Y8x4jKXggq
 N/8LJ01KcqChxjxkyrBBdTeG72V9CqUn6YoyztJgTUyT2GDptiZEvfKpKrfSqLuzs1sEdnaQOqZ
 RuTGDnIt3EgF7oWL9xmbvR5n7Nr2Gv5V2w9OHCgoGrmDm9ExjCT9BMI8P9knk0G9f8nLSrI21uG
 vuy5VE0vLFCj2u7nAqIZIXbs+NNvSsVkhBj1/4A7QLTa1d/J4V8dYEN8N1tKFIJdIENcaNdzXuw
 xRCm33n4ijpvguv7IrWWnXyUWqGnNwFkTmGnvtjx1jVciwFos/EaokraFE/DolleOpbgwFMMxyX
 LL8ECcKfjx0xM9gdlkjWUrsE1lJW7tE7hfu9mUkVa1wnDoOlS1xrmu06suSvtR3IaTDcdEy1ujh
 jTleFPIhSke9oz9gbZQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0eb6de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=KOk9-1IoVFRPxriqIuUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: YcL1t1QwZnPm1MWPbcMezAqWhH1pEIEb
X-Proofpoint-ORIG-GUID: YcL1t1QwZnPm1MWPbcMezAqWhH1pEIEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_004016_533307_044C7A65 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Carlos,

On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Mark the I2C adapter as suspended during system suspend to block further
> transfers, and resume it on system resume. This prevents potential hangs
> when the hardware is powered down but clients still attempt I2C transfers.
> 
Code changes looks fine to me but have comment on commit log.

It seems, you are adding support of _noirq() callbacks to allow 
transfers during suspend/resume noirq phase of PM.

Would it make sense if you can write "Replace system PM callbacks with 
noirq PM callbacks" OR "Allow transfers during _noirq phase of the PM 
ops" instead of "mark I2C adapter when hardware is powered down" ?

> Fixes: 358025ac091e ("i2c: imx: make controller available until system suspend_noirq() and from resume_noirq()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for v3:
>    - Add hrtimer_cancel in i2c_imx_suspend_noirq to cancel slave_timer for
>      safe suspend in i2c slave mode.
> Change for v2:
>    - Call i2c_mark_adapter_suspended() before pm_runtime_force_suspend()
>      to prevent potential deadlock if a transfer is active during suspend.
>    - Roll back with i2c_mark_adapter_resumed() if pm_runtime_force_suspend()
>      fails.
> ---

[...]


