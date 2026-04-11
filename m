Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB89F45A15
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bDVBAejqWe0kV9GB2+d2A1NsYQoo7EwftQT72y1HGo=; b=HvU7IJUt5ucu4/ZZbu06OUrPRq
	ulDwOKv+WUY6ZJIESVpA+tSegAWtyS95NuWal4KyxFjPRlTRYmEifsOyaR4kPWyfKc4rknWRzGViw
	QvaHKgLxCheT9VLEkXnCGioslUTfK4bS6hOPUVluxJ118XqWkRPD5syy3cta+jOJCUIMpsGTBIksv
	rhhV4T4l0xPuYI/bVTk7rRGX9M2EkBb3JY57np5NHJHocIr2qTv7JTjX9LRvPpH2uBbrroxHdRaG7
	1j1yBjhXyMaTcmfIwjLtiuJfxxtBzuRk1P5RNtVb8X8gxhV9yQsJFizOMBhjEv3Rt1WjYDnLLQfDF
	/ocrXkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBMpq-0000000CzaB-3KAT;
	Sat, 11 Apr 2026 01:08:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBMpo-0000000CzZp-0hsA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 01:08:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AL3Sik3962192
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 01:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bDVBAejqWe0kV9GB2+d2A1NsYQoo7EwftQT72y1HGo=; b=OP2U7+48Ji/6zZ+4
	8xdPsryT+m45d9nGPJOyxVw5oo683kd730eRv/Imu4xeulIlEJLL9R1gnFwKsRQ2
	XZq/aiJmIQ7NYp4pY8ILpj6j22uDxjelTDJkj0QYNjl/D22G63fUuj/yaCvQxzVq
	YU4o7/meA7TIO7LFR3FKBCfTIodm0Q5iONIAKRqanGwHhYwi8pcMFi/uLaYA7ylR
	iElJLwA+ek7qPOmcE2Gr7SB2IHcO4Pojfvy7lFxzLAFbw0H/9KhLYIS58t8hu9uB
	SXnqtO2sDDR5Zad+E4hb4jHfdrpzNe1zNLuyCCREve53QLmGKuORRWsaQfrrArkr
	KKrFHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey77ab2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 01:08:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso55749695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775869706; x=1776474506; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bDVBAejqWe0kV9GB2+d2A1NsYQoo7EwftQT72y1HGo=;
        b=ZFgR/lCDANOXVY5pitkMKPeenr2N+c0Q5FmSUsWCRRdoIjjEuBiad7HJEiO3DwB7dN
         hkEeR7jiFOL3QiyXp2A0g7laISiwrRzlgdzFcShLPOqdz5VJzVIuhk10DBqzeQtfneNF
         Ixf0GMDRe9+d0Daxt5QmdggTpKpfCJdFlQ87fIbHRYW+ckPfF69GfAdWMw6ALfWPpzij
         7JraVxv9UDj8muhU9EMSIF9WMeG13hO562Vk2aTE1FlPAjILyT3wtt242B63cH6mx7hE
         PcVIqmu6kVa0mVzC/LWt+eNLkmQw/IkcDGuMPKBqzZZE+KzIkQ6EINHQZ/hNiUCf6brs
         Qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775869706; x=1776474506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bDVBAejqWe0kV9GB2+d2A1NsYQoo7EwftQT72y1HGo=;
        b=SgtdZF4GbL2aMam2xuFrrBt2zPeOUAb10n5URsmeJ0zy1FFSMZbnqzoWU42ex5ypUA
         b+hYDddsqkBWlup9FfQjqjHr1JA7b+nVHmVIRNDVmF/cuxiLjmvbzHYZWrp3iRwjRE76
         tXBLEVMB3veyqC+TEB0X0myVC2RyOI2dj0OLEQkvQCU1vh3fzYOcM8eIjxWtab6Sas5d
         NU8DVACu868tmRzSJRNxsROTpSTbpNN/ieIdO48vTZnmGhiyaFGiY77TqJ9C7eRt6FoR
         MtFuNjBvpTz9PkRt7/Dg6BrtRmnO2ifiAQQ7tlC3i7SahTZo54+Ak48t44kptnUj5GJi
         hOCg==
X-Gm-Message-State: AOJu0YxyQs+qZJRxKNG7+DqpT1pBE/emlL0qApMwA7VcW4ZRgOoyEMQQ
	+fblHN0qOtPPM6ESnABycUr47QgBt2uCUN0M9UtvJI0v/dqjwp/X+Y3tonkaEujaqjtog4pVJ60
	IXW2l/NGUNtPU2uCfsewTwk7tbSbwLidf4p05kBmU2AMYAUMkGJDV2B8WByuCZTGTkixCdpcVwE
	1exg==
X-Gm-Gg: AeBDieu3HcMFrcDBei63y1QiKwCR5YKoN6IRxtItjRzYCgiGXGzPbd4yVF2Per3dbks
	QR+0rWNpcl/Ev1pDNJZvlRr2HkTL5vnWpgMyqZ3D3S3vO21OV8pNbLJXx7JBdu3cwMVaRe5rThN
	Gmpo19t5HNdiCZ5A5lfvRVqF15y3TbtBg/3YPyQyHx+TNTWgLuyVYNvcQlHkngRZOxOpQ4uxMt/
	R36VB5rA5Sj9R95Pu28oJ7orvZYow+G3VHs4g8irRyGzkYHCqYMFBKsSZUf2iib08ktEwL9xwLw
	zFQ11TZDaTjpaRX+5xhrdVP+xQbNoDoGljRxQaDus7dt/9EJFxYPA+dGredYohZx0K1z++kj9kU
	uyaFcwE48CeB4eMXND01QFQKtAZftheqJUx7usgyfXGFH/s3VWDa1ELxX+f61CMDkaxCP5QtVUL
	NTnsLthYzDyQ==
X-Received: by 2002:a17:902:6bc3:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2b2d599adedmr38660635ad.17.1775869705910;
        Fri, 10 Apr 2026 18:08:25 -0700 (PDT)
X-Received: by 2002:a17:902:6bc3:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2b2d599adedmr38660375ad.17.1775869705411;
        Fri, 10 Apr 2026 18:08:25 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f431c3sm39322235ad.79.2026.04.10.18.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 18:08:24 -0700 (PDT)
Message-ID: <3e7645cf-28cb-4021-89e6-e467e9555ff4@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 09:08:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] perf arm_spe: Print remaining IMPDEF event numbers
To: James Clark <james.clark@linaro.org>,
        John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rA_5wCjFjLOmy3wahcOGmi38HiL8IVpH
X-Proofpoint-GUID: rA_5wCjFjLOmy3wahcOGmi38HiL8IVpH
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d99f0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=-8vgJeR-9WfCzkiTBPAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDAwNyBTYWx0ZWRfX6WCtsKK7Fmd3
 wijZpSZhpO1Ujz2rGccBlVMSKGutE43e9etDMEjt7pXIKvip4EOq4OFMkDpyQlvZSIIK+8tktnj
 q6OOXaZfUDjuiRxwRrtEL79JDXPvXE1jXZubDtDZNbHEo343ZV/spqSPsnrgoiB6VnWdKnNPbcU
 FBtp8l1uwNaIVru2JszOKWFlQqDTihkwXfUAI5V3KVIhnvLWyudaGWkw0D32uoAKriJVqyInXbJ
 eMadIsEXFV2HGB2tRj3Xj1x8p2rtK766D33k/7r83+1lrgZcl5pT6egbjwb23gUrSr/4eWk6DOx
 BAJyhaM/Nl1T6nE/FK6K6pEOdZ++ivnl7gFhyhRqK1p9DNz4MMumi6rg24mb2SYSrufu4v44bwb
 uk5idbBvm93mcRnUix0QZ8ig69mlM7InFMC3q3c3ebixk6/+QQSozVeWw9I6ac6zou5+8dR1D5o
 TWDQEz76aCF6jN+TB9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_180828_336413_08520DE5 
X-CRM114-Status: GOOD (  21.73  )
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

Hi James,

On 4/7/2026 10:05 PM, James Clark wrote:
> Any IMPDEF events not printed out from a known core's IMPDEF list or for
> a completely unknown core will still not be shown to the user. Fix this
> by printing the remaining bits as comma separated raw numbers, e.g.
> "IMPDEF:1,2,3,4".
> 
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index b74f887a48f2..c65b22a2179c 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -8,6 +8,7 @@
>   #include <string.h>
>   #include <endian.h>
>   #include <byteswap.h>
> +#include <linux/bitmap.h>
>   #include <linux/bitops.h>
>   #include <stdarg.h>
>   #include <linux/kernel.h>
> @@ -365,6 +366,23 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>   						   payload);
>   	}
>   
> +	/*
> +	 * Print remaining IMPDEF bits that weren't printed above as raw
> +	 * "IMPDEF:1,2,3,4" etc.
> +	 */
> +	if (payload) {
> +		int i;
> +
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:");
> +		for_each_set_bit(i, &payload, 64) {

for_each_set_bit(i, &payload, 64) passes &payload where payload is u64. 
The macro expands to find_next_bit(const unsigned long *addr, ...). On a 
32-bit host unsigned long is 32 bits wide, so only the low 32 bits of 
payload would be scanned; bits 32–63 would be silently ignored. While 
perf is almost always built on a 64-bit host today, the tools/ tree is 
explicitly portable and the compiler will emit a -Wpointer-arith / 
-Wincompatible-pointer-types warning on a 32-bit build.

Thanks,
Jie

> +			const char *sep = payload & (payload - 1) ? "," : "";
> +
> +			arm_spe_pkt_out_string(&err, &buf, &buf_len, "%d%s", i,
> +					       sep);
> +			payload &= ~BIT_ULL(i);
> +		}
> +	}
> +
>   	return err;
>   }
>   
> 


