Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=; b=aJr6HpoNFmXLedP3ob4RNki5q0
	tmq6CEQZjzN2/dUt6CePYDLicolryU4nk9TSdaPu7r1/07/ILxUnWBM4puIQe6ZM3AmrOnpxgB2dJ
	3gbMMYuZEiLCL1AWL9FmEMoop5NP0D50Xkpj60mvE129UwJuIMOvNfX4FZ+BNPGg6R3fh3rqpo6Xw
	x2b2xXDYSjC7XHb9TlPqQLOmnGdaiJ2zaKRQfSNvY1EVC6XTIVtcQ43toXuA9x3PVqC4LKt2uEu+y
	t1zVnj0XcvqydovvVLG9nfOXggPJy06XWxFXj0SSYMUWY10+5S8TlWE1mUnuJCyYuh9rUFCKx0as/
	rwf4n/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI0vU-00000003sZg-27Pa;
	Sun, 09 Nov 2025 08:37:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI0vR-00000003sZH-2Zpn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 08:37:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cxiH3893794
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 08:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=; b=o/TDAH3jzThCXnWz
	87pGSgmdHvTAPV3D8dscde5Fj1IwSzl4k1up6wpQrS1kKLfTFBNiWd5ZNzp14TH8
	4qcWFTJBq3/oiKiYUu8JlaVltx1ulhNHXYu4lbVZb31HYLP9Ks245f/eaOfsMHTN
	adTSAgunnRtpIs6fovun404uMcEQRx45c3yxBedIwCJoVVcXx3d1K1uBwD6iO+oP
	/qpxl9XjAyO2lXrFX7PqGHo/lwS6N337FGjG4hcX5o+2cciq+/EBr2tTP+z67KoM
	rF1CQvZ10B3glURySEAo2OuyWxMW9FAZM70/7IpR1jj2EfWnO5LIusL4hmrZN/3w
	4txLzA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw6huxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 08:37:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1816762a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762677447; x=1763282247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=;
        b=cq9GEvnL1xV4nLIujyX6Gyzc9Mme3kij1/cO0ePV8b01iGlz2D20AhDuu9ibJrg0Tu
         WUuqkgT2EbDQyWlnDUdrPNUD67CVEXQtNEZZ0bZP3H1mjXgBiUclVFKyPSim7/jPE9+y
         pRe7ndEU4v3NcEfMJyaZWFujOqMGAOPp0DsQLmWaKsFyv409xLUjCM1jTI6si1jY+Y+n
         3L7dA2TCu/QSFSKJpYXdItSntSHe8DtWEwg722k/oTtaY9JjfdUrQMB1BLJnL/DpqDos
         GAQrAHOLasWkgV06btJMjXkNhze6ZKi5Nqp8/Vl6tLSOrVG8yjsm66/TmahxxYOeMSOT
         5VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762677447; x=1763282247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=;
        b=krAK0Ng1gs+L6uGF7BADDh1QUxbr8NjRkT0PZEMYIdOd9xNUHz3/1x3o/z8tnjNs+I
         8JXchanGmfdV7UHf1Ppp6PqdCWbzo4KQMkxOD79q7IlcnzvmucIN98JVsMegkEh2LM19
         Ev9jQImWGvfeQ5cy1bOEEeItkwyXifFDK/TIIkz++qBW4qz0KuBYgL1/J1mX2/X6oKqy
         1ze5CDWHam1cvfMi/d4FqFy3tJ01/K0+9QQHf2cAAc9SfvdxEf1CHq6M/D8FaYF/tPDd
         Bne9hmlcbYMVGv/A1Aievhm1GSzK0sUadlZlNMdk377qCAY4VQitwoPVSEpHXSUPC1S2
         s3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXTOq94wDszU/1zJmy9TIyqsWGPDvHAhvfXjzBVFXsJsOJFpIKb13tD/10JOg5sUVca2Dv1U7gUMs+9UjHOjoE7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Nm19fdZm7ifniyzVxKQKARyYCr+24FbC2phlvoAn1BLFohHr
	hAFG48Q1Qjre8BR787FNuKoMyVrYhWFIstRQSazKSIMDtkfexvGSK1t5dORKUb48+toXhAzSv4D
	Cgb+Mtkd4payp0/emaay6oDmswu6kh9ULdNJ6XSRUNHqLWfynT42mw+Yw2YcNyKKQcS+uFJG8lD
	Glkw==
X-Gm-Gg: ASbGncu3g+NBMWBggdvnDbDbe1pifPrIPNp8U9ZJYvp+YbevwMaVfasVWa1P3gCc2kQ
	WCOe1HlPSuvedEKEeP8HGmqHl1wq9+PRjajquHYUfTka0zXeUyZ4dZLro4dH0FHCGK8Ku1PKXd5
	ngB1kjPL3Tqocke+j7eeTa+M+sbpz77Br1yB8Pjc2u9VwIrglGl+kfpKzqYEyxEIN7e+Tl3OWp1
	gPVsh3vPQ2vFkhLTIJNsvZc/m3qsRZzX3dPwjKojjUL70njNYd53EuT+SAR8bNppIqYcgqIQjjV
	KlOzgOPW1IzWszGQ8mSiM+Jx87+vt74pje79ca+v3ig5bZxvKDm5u5ydIRvt5VJ2DDFXHPzjtHq
	UM8M7Zc45hAhrRgAs6ENc2eBTYvA834gDnt+mTk/KJGPdbUgMPMyR1BAm/A+qGd8o
X-Received: by 2002:a17:902:f681:b0:295:5da6:6014 with SMTP id d9443c01a7336-297e5659932mr61934705ad.22.1762677446923;
        Sun, 09 Nov 2025 00:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq71za6tPtpBRE50nvuoVMRlPWw1zs7VbanBMtzoP5o5KupYbs1O/4Jsv4fFrfY2toq9BdcA==
X-Received: by 2002:a17:902:f681:b0:295:5da6:6014 with SMTP id d9443c01a7336-297e5659932mr61934375ad.22.1762677446407;
        Sun, 09 Nov 2025 00:37:26 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b801sm111076075ad.7.2025.11.09.00.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 00:37:25 -0800 (PST)
Message-ID: <2ff919e3-8bce-4519-abb3-3ef8df06e6f1@oss.qualcomm.com>
Date: Sun, 9 Nov 2025 16:37:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <20251106-imaginary-speedy-agama-c8f437@kuoka>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251106-imaginary-speedy-agama-c8f437@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDA3NSBTYWx0ZWRfX/Uk0YaceyEoa
 lcHFZf4VwPBd1aqrSNynx4+OzqhtobUIwoDqzxvI7St8OY7t48XkEJQxUi0vF1QxCfdGiqORMEl
 Cj9PSvLno5YxQWiVrEHCpO+RC5pashloOt1kCBYfrDHRnTFFCIHzilzQqZfIjA0bVfcwASPNBbS
 nPvmjWdXdlE+LHKx2+++5822nscKseEd/Yxg/nKHfui7suvop06kaG6NqH+xms0ktvmIaabs4ds
 4mg/caLA9Jvlldtcx4BuxVupeeJXlVEWQrbkC8/xs1jW8Fpcpv6QIgRwpYbk0Wtk/hpktMjMAWe
 PJMXAIDQqLVsRCoU9o7Skx4fg12ioxAKykZQNZSZv1Lj7QLUwWxPU4ZVwG5Elo87l1WXhr/ctaN
 a+fR+Qa/0u7bl+QkofTbVew1Z6sVPQ==
X-Proofpoint-ORIG-GUID: R0M9yOk_eElpPtiSglyOtbPzewItumwT
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=691052c7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5OoSBQWy4bDub-yfWMYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: R0M9yOk_eElpPtiSglyOtbPzewItumwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_003729_678759_1E46CD8A 
X-CRM114-Status: GOOD (  15.85  )
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



On 11/6/2025 4:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 09:57:25AM +0800, Jie Gan wrote:
>> Document the CTCU compatible for Hamoa, enabling support for the
>> CTCU device on the Hamoa platform.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Nothing changes, so same comment.

Got your comment. I had add the dependency in cover-letter. Seems it 
would be better add it within the patch itself. Will address the comment 
in next version.

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 


