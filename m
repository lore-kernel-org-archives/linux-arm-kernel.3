Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BEEF364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=; b=wHdF1Q7drcP/sdObNp/ZmavC/a
	RdmiKvDw7md7p475A3X7wfGi9D0V3szKUDV0FRrlDOE3hMyct5mQN4cCrBCjf6bWfMZx/Kpmn9ueG
	W3WajztYCT0RQLT++TFs0+hdJLeceg3meXLRcgxxsYDiTboc8fp0pcpPj1+05A7gsvS3iVo9E/1r/
	611Q+95IzjV5lxXz5LG8vRNHare45JyJ6L3B32RLUAWneMY7mwVU6MIlA9Ys5UqdSk8wMjD7c0vrg
	s1UPzooLqIz8ES8kRUmedt5DYo/jNbqKBrmb9cA4J0nnIG+zNGVfZSAoHNcVmEYcvbrnc/syUaqpb
	oparTP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtRA-0000000B2PL-23e5;
	Thu, 09 Apr 2026 17:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtR8-0000000B2P0-0n6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 17:45:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdLPD2812087
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 17:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=; b=osiu1T1so6UWTxBQ
	LaeNqQnw46yuogd9E4IY+PxqdIU2I/S/1Mhaki/D1WjyoKpVNJsbKCNQZILLj0cn
	amw1h43ICKhDkuivV1jLCYuPp99BNR2T8h8VIyOOvu/Z0X2ONrNgFK6+KP3P7y+M
	8DDvaCfGeCvv5QR7tdmybH7G5CuOWgEFlvbEdPp6Z/27n79FjCTLRSFa+uyxyrm0
	I2QuwUvodW4Imnw1ZiAaF0Tx2f/1PMCtxG/KSKnls3hwv31yqv6jFbDzIOtOfAEt
	aiNgcIAZP3vOjjMNixupCT224BWqIAbMJOCCRlBhEHzxulI4Kpj0x+e2Uo20jBlj
	3J7LCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h8wrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 17:45:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a90510a6d1so9505675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775756700; x=1776361500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=kVJBXm9ywyd+GyeAKMLKiPrKu5UxqNKYWGux5xQipPLCMN/M3xXQFnNU6goo6C3JI2
         wWePFCGdixq0kczrwzA2oFg6jvNhpaYFuU7CtzlMtmwymR2kftdrTPT6lTZUQeJFY452
         wuXM/U6MZh9DgmPSI6A1ZXxnEj3xJ4cDSIcglatiAJTfZNUHQq7+T6FKHqyMLW8/ZgRU
         RuRD/5HzZj3X8fIAE+Vb5vmC1m5v0lImly5b5KXHjdZL6lymUecbHdCmwIsnaBGlY8KL
         8TtkOCm8/5nyhUWId63uP98wAJn4e4nKYpx7uK99OiNPo1sIsqYFqofvbSeobQQvMAnh
         +Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756701; x=1776361501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=ra1cb+LrFcnkJX/CFBXiacivNvfroHNGnoNAD4YJ1xspRkhbYJyy+DzSSe5b+U5+S4
         lE8UkkKtpqnjTm3FYiRfvEdp0bGeuqGy1tyCjrkoRPXHjfW7hYl+XRdyc86AFQjKyF1N
         6ZjTb2FvScDwMGlVTxyfFXVnvDDvFS/8y+BQemSdAMpzEMiJBTr7y4SPK7BzleLFNbSO
         3orYtri8aEcoqaP/UgTRdxNvkl3O39oQn9PIXVETOl4rXlNvQ+1SCfSHQjkFvQUO8Lrr
         0rJqO0V0q/uWz0IXhfhmAi4gV9kvTXBdtX7MaeIgtZAiqHzi/lrXi5A+yXWbQ4jBOHao
         nT5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBq5KiQIXslaKrdjQx6A5ni3QukjNjZ5o3/W/bVUr6dJ5ftWq4+C9aAmhnMrK5mTA0PN7WxzzlG9yezlZK6bdQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxsatOl3b6sSRSFu5Pil+zVmBC/0GYrfbiSnpt9EdtPqSXBp8a8
	WhRwdaHXuhLE6tUj/6sGMEvURo0MCBmTkVOl725x5p0jwFkF2BoVojVna67mCga4ui0De5uff4B
	8Pbxai6OEsSd08BGxqLo9ABF7NPRtkl3iCsfwZDyHscZ4exEBwHTolvMSmCKYrWAEg0Ko7MBFyg
	gS+g==
X-Gm-Gg: AeBDietwygXyGIyuMG7HxgULHGYm6GgZg+67pn6vVo5UT5plZo1xcn6Q4Sd2Yy6F/+N
	yHCRvyuOtI8hs/RuRSM2lA79lLnGRh/WvdqqBZW0ONUA57xEy0f3wu03MOJsGVHru0xNrPb8A3s
	gCC1BF1cI838zJW0npQnp8bsF89nPhGNxV/MRV1o8FQa7myFe8TJqXwBQtPp5egb0HNOfxslr/J
	sk+P1fa2T0QLw5iTU6bKH6pt+CGOi4Tkf+Q70D+CsEs29JjJuNBEIwrDC1mtRlGcbEaVavrZfQA
	auHG/AJdoDtoPm2ST4m7SWBIYBgpk5YhCjz6SN9fCG//2j5aMZpefLBYeuCRN3Sw1z0N1E7b7tC
	LWesmS3uoeAJ9Bcbhh8tBOY5RSSkl7GN8xgCjsZhuQUEzF5Mrxg==
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712665ad.16.1775756700534;
        Thu, 09 Apr 2026 10:45:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712455ad.16.1775756699932;
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm1392665ad.66.2026.04.09.10.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Message-ID: <1b17af8a-91c8-4ea4-ac8a-d8e24951a9b5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 23:14:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
 <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7e59d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oNSZD+MgFY+5WZUJqYhveg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CmEREM0NDXUXjFKD81IA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Z6L0O8d8O5SNzCMDHQ6DW3I4JPcUOitK
X-Proofpoint-ORIG-GUID: Z6L0O8d8O5SNzCMDHQ6DW3I4JPcUOitK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2MiBTYWx0ZWRfX+Nos0rGskfW8
 +nr78Waa37RXjYMmp0VkGg9nAn1wrAX/Wr3WjHKELA4DRrVwdm4yIbknt59gyZn7wIriUoCmcPP
 Zi0lg6JP6Oaj2NuFayJabTKD07dmHjCy72DsajQAaKAl+99GJxnhNQTFATXgmnEl7kpk7wlS1tj
 SXFmpnFOc3NNGgnp8rxkY+jwPQUKAzPxM9sFD+v+eB3uUfCmV727EdfzcLcwFDOOofJUgOZ4b14
 g5zhBiyDa5QVXDVunAG/MdZ1FycHnVCploYRl39kAPoRTGjGW0Dea2CCfVzuNI92RaNdNOj/5lI
 Nyj/a9Jd7QpW92Ow13bl59CB1ThdDyKwuWYoKGziTBqYtjaBuVgcDlR8XFxNP57TwpOYbkCZCUA
 GeeOM9v7m6xkJFKTksDA57ksHF49n+TfScBGEVqZgBNceG2H58oIVQAYeLIAvXf3ITaM8ZzD0EP
 T7RlR8T2KTPW5r6VXXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_104502_269252_E069F5B0 
X-CRM114-Status: GOOD (  13.52  )
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



On 3/19/2026 6:25 PM, Konrad Dybcio wrote:
>> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },
> dead code
> 
> +Akhil is that useful?
> 
> [...]

I will remove the code in the next patch. It is not required.

> 
>> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Enable frequency limiter irq */
>> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
>> +}
> ..sounds like it

I missed to clean it up.

-- 
Thanks,
Taniya Das


