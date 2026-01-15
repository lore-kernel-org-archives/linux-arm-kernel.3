Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B8ED3CCBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AOiaplXhNL8vpo8n8ICtpaReboP0Dzmj9EtIw0GdOQ=; b=PzOym4cnfZzp/AnYQ/RKlznN0V
	jKtr2RbI6t3AyEpJmqa3iJJ0DWrdamOsvlrcPSvn31FoqA9MSjUzi7oI8Mki6BADCAZu797XqKKYR
	kyWjWkDpcsE1yJtQwZMfSihaH1vzI/XhO6XW+JFgx3jcEnqD0fc8mLzVbsgiwqt03rp8CEaXKKnDH
	eZdJ0jkhGY9Jv7C5Y6p/Dzla3g5ldnfQxOgBhj0azo4G1YEj4o1M9eWtADFPSp55seAqMEwuu6chz
	02XayjkmdF6a/Cqx8LyM9yc5jpSrkP57wOev9PfxSjHJBjJaxMJFjexouXGDqUypLwHpohVFGAoJR
	JE6mt3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgI51-0000000BwzZ-2xUK;
	Thu, 15 Jan 2026 07:47:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgI4z-0000000Bwyp-1SoP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:47:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fols3419549
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 07:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AOiaplXhNL8vpo8n8ICtpaReboP0Dzmj9EtIw0GdOQ=; b=d330+EP8eBFXm+2P
	0vUpUb5TRVQx7wGeVaP6wwXjrzK0XiWwOLZs1buO1NrZ6dDQZFvu8PNB1YehdUyX
	CJeusAsC0iIb/BDbHbRVXN+5x/sLU8yGTVLi8nLeKz76HwhOqblsLOdX4Yv7aNgF
	H1RX5QP+AhnkTHqO8GDDKzRN5ilTVzomPhOHOoG1mtdpgovEgtx4yYENMJHjM4VD
	xhqkBgMAr1VXYCrzhD4bHDDfopfNyXXV3Wu5vXqPtc6f9yr8yUl1/T97qami1l+M
	cnao+rr3Al1cBw/bHf0OwO1VjgKctq5txl+zzn5ZB2/TaX1wI7jBLSPmKzYDoHx6
	ryBUQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89mgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 07:47:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bc4493d315so183748385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768463210; x=1769068010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6AOiaplXhNL8vpo8n8ICtpaReboP0Dzmj9EtIw0GdOQ=;
        b=FIH6cNfDuXiD4sQXp+7YwhV/JKwitU5weuXe6iYNjsZyLQuXxlrcdLdf8ln6dTzMO+
         BmeAuKgvg0Jx33LS0hS1XCOUUeQpLfoYeQVtT07TsCqKLIyC4ZGeUvkFTD2iNepx+OqE
         qfwB7zGH336oFolQ9Hznip6srnWkNuDnwkwj6DgiAEyOprwaTw65ygVn4ySz4EAN220S
         RMxmpkFadstnl8R+wnHg9z2F3LfmZXasEzLT+4FtvaEXUyjP0tzkKQx819XGsGydhe9l
         skwXK6HKXO9PzQFD7EsYkNGJ43nPlecMxyDZLhYNQcNeNbQKtzQOhlFvthkGK9TX4NL2
         je/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768463210; x=1769068010;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AOiaplXhNL8vpo8n8ICtpaReboP0Dzmj9EtIw0GdOQ=;
        b=FWacf5u5TZGm8hdim1+cZx7Yhurv0uLDXszRa/bxsf41TXrb7yB50dLJUFbUIlkzKj
         oGjqGGjHFmbyRrzan/chFUNJ1RJKNjjcrJ8bmaB3PlXAZy3Z9jNFsnu/FdS3hWplmbKa
         4gj0hQ2voXPerBN7pY4l4vWX8+JQAQAtk36+dvY3YXOe/xmyoEXqesU1sjtvIagxxgVy
         r6ak2H1S1l7ngXg+e+wddg+cilVyjQW+DnBnxeZ/VoIwMBXLkQiA7f2CwdFCDE9P/AMN
         UjGFQFkVOCnHOf1R/5fWHxl9d3Y9J1nGe2JOPiOvXQwJg5mI5kLsNRChdp+Lv1hEzoMv
         LYYg==
X-Forwarded-Encrypted: i=1; AJvYcCWPv6VzqHZecQRH+7wqMVCZBTTFNO7kNp5Rm6lKgAQ4+26ZGWOB1TY6x9Pk77ecd0PSvkSf91NDH93ipjCfbCKr@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNo501Y3rvt7VPmiY2r8zd7zvctSNlhxtx2RZCL5I+ixH5otK
	Ln8rGbDA9yw30gtCv3dPD0sPm4RcH/rCD/Sora/Bo+xSPRZ7u6h40dFWVolV0+kp3bZsRKgfmqI
	PCDUu9p0ZWUylRq+h/R7orM1watRZWAvZWJS/amjtQnGvQjqZbr8f2xi+6QxmXp4AusMbk1rLmC
	/ttA==
X-Gm-Gg: AY/fxX5H+d98f3H6iCwvNK/GO7m9MUlZOnPjzwF0x5QoQ22d02h45ZKJ8dbpr3A+W+w
	L613zfBYKhJVLweKGCLYeRDkuCezIY8KnnxSHj9KgGbS3U+f64awyOztrlgCGxfDYWrZqK8SvZH
	tQ8sMgvYJuRw8om+P1kpjqBh9ruZFdFtpxX8SqB2KzzrEd/GC3Lw4X2Bzh7qABxo+yQlm5w9bVu
	PznkmJec1YGKYCeFE5brpOCZw0ZEFkrEU1shXRCe8qhSBwr7qOpxFnH6JFuVuTnagO1aGZKHq8V
	2pEz4sUxcX9TMIBr1Sr53OM25hWSnCp5IjsCT8l3fYQT7fIDPo9VohcaBVXAqYZEM72dhL2xeIK
	eHtg4JxSbZpbf2+Pye6ioRisHR2+OtflSY2AhXA==
X-Received: by 2002:a05:620a:25cb:b0:89a:2f9b:10d3 with SMTP id af79cd13be357-8c52fb1d076mr770879785a.30.1768463209663;
        Wed, 14 Jan 2026 23:46:49 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:89a:2f9b:10d3 with SMTP id af79cd13be357-8c52fb1d076mr770877385a.30.1768463209216;
        Wed, 14 Jan 2026 23:46:49 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm2708008066b.43.2026.01.14.23.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 23:46:48 -0800 (PST)
Message-ID: <05896dc4-a9e3-40e3-9bc7-e2a5ee37be0a@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 08:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: axiado: Use lowercase hex
To: Tzu-Hao Wei <twei@axiado.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251223152432.155299-2-krzysztof.kozlowski@oss.qualcomm.com>
 <5cc6b959-4424-4d34-a8b4-eeff237266e2@kernel.org>
 <aWiF39xuH6n9LVRV@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aWiF39xuH6n9LVRV@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qRYYG2XB-dlMFN9LtYLIFiXtlePnARA_
X-Proofpoint-ORIG-GUID: qRYYG2XB-dlMFN9LtYLIFiXtlePnARA_
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=69689b9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=440cDlBIAAAA:8
 a=bnvtvey6Md5y6pS5PTAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1MSBTYWx0ZWRfX0Nsp6JXUuIxI
 IXgR2xFwcRdSurQN28zozSGr3P5DjacaORQZgyLv2hL9Y3gtYss5GgB8PVCn/D1rOTprTDUfxxu
 4CHHF5ZM79ynp+T/GrUd5nihjrN7YdHSysrxFmgItExXw9ez7VGE7eX98qT5SljS7X+sN+k7rD/
 4qD1SmKpW0ZZiZr6xDLv1PNbRjyA1SMGLQizDBC8jhbJhiPftmVwPtC1M0b16JceiEOSn61RAlQ
 Kg5h0qHebFmm8SuASalhASsjs3sFbOnavT/p70qWhRF29O/9hY0/VY7LchDpzJ0pVXlnRSB84j7
 tgoJn27LzQGlz9BSPzHr0M7fCAwu8PMkhjBRskwo/Jbd7nFgTM6SRIVkmHR1IQ7crCvcYvVRAQy
 e5ITO1lHhLT6L7Hg37vcgisXWlcRvvVkO1+HuMPIkNtkiEQIGXV9io/XdS4aHQSoDaSRnqu0QHe
 JHawAu8VuuAEgOznFJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_234741_403582_D1638292 
X-CRM114-Status: GOOD (  12.40  )
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

On 15/01/2026 07:14, Tzu-Hao Wei wrote:
> On Mon, Jan 12, 2026 at 09:35:24AM +0100, Krzysztof Kozlowski wrote:
>> On 23/12/2025 16:24, Krzysztof Kozlowski wrote:
>>> The DTS code coding style expects lowercase hex for values and unit
>>> addresses.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> Patches done with sed, verified with comparing unflattened DTB and
>>> dtx_diff.
>>> ---
>>>  arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
>>
>> Ping! Anyone in Axiado is handling patches?
>>
>> Best regards,
>> Krzysztof
> Sorry for late reply
> 
> Reviewed-by: Tzu-Hao Wei <twei@axiado.com>

Thank you for review, but who is going to handle the patch?

Best regards,
Krzysztof

