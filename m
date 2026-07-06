Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99302C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ9CchBYgkba1ighCLzdrX5XHMqvhwflUCwUXgnlH/8=; b=z5Yo0yU29p5zoWVcJ1CiKgGFQl
	iqtJ0JZCC0ACFlB3p8/LjehGc+BlQyipoBrNCjnTagSod6IrXr5QoorTYZMofyrIacPnwd2iFykvN
	fPud6BIdqq+OUY0X0nnuKpeqWXTC4ON/UAbGrhiZbANmk8zTt8sgqkUYBqEpoYeQoWuiX8lx8gBqr
	597C0xe9DUdF3BGtpj/DhJhwZOH3cP1Adyg+oEAX5W5UPLfaCHFozjw0BnhPFU0Uq4/s5YtoIALPn
	sGmAeEIlqEhMD4CqKplZsKKEHDVGz2TI15/9SQGftiOyNxr5ou6Nl4GasWBAju9PBppfv76nWbeYD
	ZWL/ZX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrMg-0000000DgsX-0L7R;
	Mon, 06 Jul 2026 22:00:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrMd-0000000Dgs5-0fuN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:00:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEPAJ1613971
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 22:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJ9CchBYgkba1ighCLzdrX5XHMqvhwflUCwUXgnlH/8=; b=nXloEUAus6N2V2gO
	A1DO4owpicH2FzAcrxJEyykSEBlIYqyCSXQsYFhlOY3ekVtKlmFjCwGDAHl+EtHq
	98SRm2L5V43Ueuu/GmeTDoJd2lQJ/0sjTRpiz+3bYYs5JeZ12/FNmy/jsPMXAU4e
	5PRAEAi+2m/qIJHwvyXpy8ZSI+XeRWvH8HTqvvM4q/WWGD4zqZMtX0K0iQ0ZsUP4
	pfP8AJHTtruE0TAYsG/HSVdadfx0nKINjL++ym6AkwUdSjxH3DKrF7SkqA6tuzs+
	MOo2jrIpOfdwVmlFBHPn0FtH3N+YRp/zYhGUd7828HyJIeeM78i2FOrdk9RdJnt3
	vyGHqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h53f9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 22:00:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so3972527a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783375229; x=1783980029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJ9CchBYgkba1ighCLzdrX5XHMqvhwflUCwUXgnlH/8=;
        b=fP5Q1gSfTM4JPeP6SnK8nGhK5OTxrzJT/KaqDGukqOg5ynHu9ENBpGst8XADC4fsdV
         CM5/g48EH1GCyny5gdrrupz6vIIMSvvGciDSehz6A8RJSZA+LBSx/sTBWN2wgvWJYq3D
         DDHLzBxXongQyksfd3t3kjc5m4VqKG9mbV8QVU4+p4YefSN1Xs5+WHs5EOawbF/veRrp
         j4XXd+FAcaEvuZBcet1O5E9uiRebl6iCvEadbUjfkQBoH9FKf4FkZlfCHh58d9eqbrE5
         82FNtOC2rtRJeXfYeDYgGQK7oZgTtB+f4EIYd+UBkxVoURJmJCtiNIrJTGNDry/A+xhS
         mKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375229; x=1783980029;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJ9CchBYgkba1ighCLzdrX5XHMqvhwflUCwUXgnlH/8=;
        b=evBs8Rop4v/mMlkVqLlhrx6x3tqKFnyNPZAMzh+UFebU9PuhdEdf/14SnZaw6uHpic
         bLvP2n/sjGhhD84/W3BUOeRtOtAI3g+KRP+LYeZE2SEvRawfLyo1b9+wxePWRelf2mkA
         dn4jyQ+dNORM/weFtWRjKbk3WoEV3HnIIi73j3ucSOE336POmAXVp29X85EYNe4HZ1A3
         y2MgJtIZBesqhljzJmeMBWd1ZkVntf5aStas5tflg7k1gUF+z4aJkShaY7NjWC1dKsUO
         aHTV91FGdZ6oZi5midOwTRIQ5m5xov/WUGlHr2/WEOopD6TNgiuWCR3mnNC/zB6lQR4u
         +cdg==
X-Forwarded-Encrypted: i=1; AHgh+RrS0oUnIMDEG9+isHSChDv7H/aS6idG2LYfu8CTMdfk8H1jngDjB/3Q/wavSY1gCGSbGpx2aCP1JEatjbbal7dn@lists.infradead.org
X-Gm-Message-State: AOJu0YyKpcGMLs47X8w/MKOnys4DRX1OiggrjSDe+kmdog9EH0kD+Hla
	8LVX8ZhuWBAjrpEXd1MojKfmcplkBOXvMzxkZfkt+SCGmeiqzeevDgPq60SKdIxP36b36i6VYgw
	XZMIYHM91gN1xaA0eNJLDh4cyqFyEghARVdVo+WudwmZsUZ91vR15ykZ740ln5OU7dYst2FUIO8
	050A==
X-Gm-Gg: AfdE7clX73BSy2BKHVEjY2fB7JhvWdJfuMzKD7p1cYsSNDRei0hrovX1aaJNTcq8t23
	UznmC6Xbj2qoqKng3Pq1OPQ/YhfTSqz+PLpIrY01OjhA/f2voK+nXUDQaXqoAvJcufd5MlauZvM
	NNhlACiFxI9UGGEZU2IXBqhhRida2hJp23Aocg0vyIL0axVWQr+nXzQprWPpd9S160xlhCM9dAh
	IOW/KO7WKrjlGrbxlHrxQEY/qDbduiTXmuD9kYWINMTw6Aqepv4XJWjDJie12pEaHJG0dRUjd71
	FZSMXYAI2G/n3HQTd1h3o+ZPc04zv4qzfaX98ULTvoywC5l6HxsGxa9gGLmtsef9PKfiS+P8FCr
	xH5qhS4zIkD3Gnt6ehegfG/LJmah6KIod1ag=
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c08ef84c1amr2736386637.47.1783375228966;
        Mon, 06 Jul 2026 15:00:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c08ef84c1amr2736318637.47.1783375228354;
        Mon, 06 Jul 2026 15:00:28 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm693268c88.10.2026.07.06.15.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 15:00:27 -0700 (PDT)
Message-ID: <10e4f102-3dc9-4fb9-a6ba-2dfc23a16df3@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 03:30:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <mn7dmfbyt2hnvlb7u2vnxurqef3w45rrjanhkd5ei65sgasfnl@l73s4c6yqxbe>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <mn7dmfbyt2hnvlb7u2vnxurqef3w45rrjanhkd5ei65sgasfnl@l73s4c6yqxbe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OwmCCNByt-qDWX-G9LR3Vz-CXJV0PbiX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyMiBTYWx0ZWRfX1ZQwamRdVehx
 DtuYnRR0ih1gWdYrhwamkmu2FdnuIPTaFJkWiWRXHi9a/+QRuNuqgsa9ycjnMSxhf2CJVVaAC1Y
 AjMgcHCRczY0tvAR/syGdei+TWmfrFI=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c257e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=TH67rrwzn_JHXtltAFAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyMiBTYWx0ZWRfX+s+gVFmttFN7
 M70imWTkJuRM9waFj5dp/0XC3g24pJ0I/YFAvEufZB/eenE8SXV7RqZWBKZyVBNYrdHT6ibQCuo
 L7quNevB2rCvJNLC6RyRtrMMds2qCjPKtgfQSJ5sseMz/MZOS3scs79kDk64cZ/WePI5RgvCkxZ
 IVJwUgSYtfXvPhnagAepgHQZxgUfwK6M/um9TDyeX33pYylruwRmBZxhUAXBHTnYSQR3HbQLdMi
 hFOkacPmR6Hh57BnJYWSuKZaFF72aIkc4fSD0aMPS6Q4Qukz2PDMC1SOf07b5tbXnOyifh1nqme
 bpIFWWPLRRi5KY5vHBRlTQo0JFu9BBnttLlV/hboQ652SSqzdPwfo8qhBd1FKtu/Gq5UO4QEs1K
 dxbJrSJ3w94JH7bsTHNn1nuJq8AzwFCgcJ9vqGQZD427JZZJctKQY6yuoelbWzDv/VTuunThBrz
 S8/w6GoCwX8y7aoSZ4g==
X-Proofpoint-ORIG-GUID: OwmCCNByt-qDWX-G9LR3Vz-CXJV0PbiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_150031_348631_E385C6ED 
X-CRM114-Status: GOOD (  13.99  )
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

On 7/6/2026 8:27 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:34PM +0200, Anna Maniscalco wrote:
>> This series enables LPAC on a7xx GPUs
> 
> What is LPAC? Please explain (or at least expand it once) it here and in
> the first commit goes to each subsystem

Low Priority Async Compute.

-Akhil.

> 
>>
>> Currently hangcheck and recovery are broken as the patches to make them
>> work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/
>>
>> The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
>> to work correctly.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> 


