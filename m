Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DEDD1681C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=; b=QqUKR4/FHPISl0UxX0NfGCND4t
	D2iaiDpCGp+vv3CvIUWS9GrIz5i8mn/ZzUPYX/A0W7+vNseapHue0xVOWaccQd1hypyx7O+sYZIkZ
	ZneJKwngyfKBh8fcaBo/8RRNfrDXl3fp+TEoYNZt7ts//55civsUmVZI22djH8erqUN5Cfnqd5sf0
	QyfAj/AZTqGDjPHWJR/MW5V14mYDyLdOxf40bC5EvgtHUrA4U5bTdjn742DcGJZedWo+5dQZt/Yv3
	OpDdEY/MC/lyhcmTPZWzb40OZE4gbKOINVXIJvn8tRjRGill2y+UMUUl6ra3b8WSpNQMMm5AK6Jhx
	fBT6r+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB5w-00000002GZn-49Ib;
	Fri, 09 Jan 2026 11:55:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB5u-00000002GZQ-2F3R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:55:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096SE0W3141618
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=; b=pgOMANCprkJwasRk
	eEd4MYHFC4D/oEu/AVhwCa1dujnPr5drXX2/kVVpOf62KZf213Gin9ckOPTP/50F
	OzNZIjM82mv8Jp4GHuzFDMlQtkVxcl+j17ouuouKvIST5Jat2kCq2LTZnn1/DUY+
	BE8o3ED2NOm2GuSSMVzIG7r2mZ652l814XxNwP04dkYNKQpJmGcQMBiN7xjkMlkw
	6gNhS3nMG1bojXL8zDJVIrGNFfaghK/891hcFHXq81ciAPNdle/PRrSybzTcawDp
	t7f6cOII/7gsKMn8CeOTF1vPvUurMvinVoDXt4ekafGLIUTJf7ZUPy8coM6TrKIc
	82E4tA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j2hnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 11:55:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2bcf21a58so1120491785a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767959753; x=1768564553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
        b=NxgR9IlJJw/A6xW9Twl2+mI83AzNRo5mHmpjO8+wYpe40GMKa62rjR1A6UW7A59+v8
         sfluCVbce3TTWNUDSrr44hBLRLgaDJwguHTUEwxN3DDE48l9fTvFSDih8jqvJ8DY08dA
         ELA/7tHm1cG8ndVf6MuL15EgShNkGCl9zTPy3gpDyJ6XxIG6Pc/ZMk6o35H39V6ZnIsf
         Kq6o74xXjEb1D0U+bslL/wQ8PKasT02JuuMHjYxl7uqVDM5WsNyFg2xroacP6q7WS5MP
         2O14u9+tSvIO4i22pGutqKRgJePLkfRMn3okSCOIxvfMFn/CwMk/jA/Eu7lQxLMavaVt
         1VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767959753; x=1768564553;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
        b=KFTAEG5Mgmvi3AZJ6RgXjCj1Y/ziIw78tlgvK2Z++DN2RxlzkRmtJb92u+f7T1rby7
         kcj9bqtmSuQ7ETsl+jo+qLwfB0MP9HnSEWghQKYvPbT4pdPOdsMIdFxOEdqHpZKPMmxu
         cFWp4vb4jj3IaxsohNh+fvsZhHN2woiSvRdWNRmMuXvtM3hTpGiaMnvkgTA4RExTpBGm
         Jr3eQdvpKOHlTDh6Jvut9G8p6eBZSKMWY4B5Gcub5nBKPMzPswiMOAbb1mOfZoYlaWpa
         J0KVV018HAM61ImkPiHs6OpS24ExHfm/pCGYBTvnsWalmZcxmR2eam1msxFw6AMeIway
         QUbg==
X-Forwarded-Encrypted: i=1; AJvYcCXPI+zuq6LpCO7yX1JHyAcsSzcoeCjHcVWlvPdEjp9N+afi7ZxetPuj5dDJkQ5nexVvoEpzEzRlK+eOH3MwEWP7@lists.infradead.org
X-Gm-Message-State: AOJu0YzsT3Bu4YTOsAM4WEAflBJxJIVwnhewLEuAwKYk3xuadanhsUyf
	sGE07vXRg6THJ++y62etduT7X6fFtGCYtflEtbjIFccOlHsNMZPo+wipQyGGhxSdwsgORTQhssK
	eYArvjoWF2J2KuLhwmLQUaIAk+2VmHRrdzsMrB9j0o4R2WX63VU+ro6gd//5/XkVJChMJaq6loe
	LNMw==
X-Gm-Gg: AY/fxX5uhXTq2HY9OtjmbR6alBS+607HmnR8slQHINEgfmk9eXWOQVw9E+igRQOZrAt
	19e2gHq4osT8nvqrcxoNanCzs789E0ZRx3XtIq5L5vWo2oHkA+Ie7K7rA8EeTEoYVBq6ByNQ15Y
	VSkjc2nrtv3dHHUVqFuqRb8xxmgxfbze6XmghFbIRoWMbPAybh7YGmNT/YBDBHi6NQEFr6jipCi
	w3LgzG4Ih58wTuwHp1sN3kSEJUdRkLg2WCZ0xZruOQG7/JgbH+B76fxbZEw5zukrIUSZqmkErZD
	4rgfLmc7lE/dm28uBEm8jVneNzB48EjNpCDfF7+hSC2XF64byEfCQHqBQYNKMDGcJ2yGff5OVXU
	n7pOpSFdF3sVYU7VdNaeSFX6sj9pTw6nh/lGb2w==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id af79cd13be357-8c389409ddcmr1207345185a.41.1767959752710;
        Fri, 09 Jan 2026 03:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+067aZV0hc94pvEUtBhDJm9uD0GOXh7JwLSZyYZ8jclFPY800/XQwNVtwW9PmsF3O1oGaOw==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id af79cd13be357-8c389409ddcmr1207342385a.41.1767959752208;
        Fri, 09 Jan 2026 03:55:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c6csm1074238366b.39.2026.01.09.03.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:55:51 -0800 (PST)
Message-ID: <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4OCBTYWx0ZWRfX8yaB1aqMVqXA
 PwDLLvD9PR073ZjAdMYNAU3EbPjz0NsoU5xjFm2eiKPFsWYQHvyRCXnXZyZYMCGuo+634fn1n8D
 DT1JSPS15txAnyL4nC6ltLsiWbIuCAgIRnN59visajwYn2iSWczKqFmK+XR11Ue7qYBfgDisTxG
 mhdV02aFmgslMctnXtzKA7dZ9BeuSnlrRLuyo4mpE8TuEbtAmuSNH9weSXeKAVwEHRAJwJDTF/X
 htjoEPaq+JyHMvVczEhI13h4rzeSQnbEYACOdsKAbUZ1YN9tUugpa7Nt7gEgshzVszD0UmilwEJ
 BdDLh+SEUBGoqLPlIqR6V2vPQ6WupY8B9cQsdATneklsImO1G00/TziJBZKSA9Su6zmZiapUo7R
 UVGYP2ZlV2+eH5TN+s5Dai1alc4Mce0gF3e7949yynHKFgaDisx7UDp3kvTNpRc6FBfyiZP60m+
 9iDbemiOmsuXLip0uZA==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960ecc9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=8b9GpE9nAAAA:8
 a=81cV5ACUyFlniFfumqcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 42yngXHfSjsIK7rDtZEQfW61aah42fM4
X-Proofpoint-ORIG-GUID: 42yngXHfSjsIK7rDtZEQfW61aah42fM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_035554_731864_CCF2D483 
X-CRM114-Status: GOOD (  14.97  )
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

On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> index fae881cea9a0..92414a4c7bb1 100644
>> --- a/drivers/bus/stm32_firewall.c
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>   
>>   int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>   {
>> -	struct stm32_firewall *firewalls;
>>   	struct device *parent;
>>   	unsigned int i;
>>   	int len;
>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>   		if (len <= 0)
>>   			return -EINVAL;
>>   
>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>> +		struct stm32_firewall *firewalls __free(kfree) =
>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> 
> Hello,
> 
> I'd prefer to keep declarations separated.

Separated how? This is the coding style of cleanup (which is quite
explicit around other styles)? Or you meant one line without wrapping?

> 
> Otherwise:
> 
> Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 



Best regards,
Krzysztof

