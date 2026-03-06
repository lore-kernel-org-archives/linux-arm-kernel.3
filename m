Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2EFF0183A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=; b=N+ZTmeVZVADo/cozNX6BJkygqh
	vkUPFw+qt+pI9Y8G9tTnv9CXB47mqLV8RxTjwCwOX21yYrkzqJZOYF9quMLyBZb7BwfJEfF99/sfC
	A67BW0l6q6EiiQHBDC+9pXWQzhHoF3+MW0jNoEgnDbfBERFjMwpHkIQyErmPr1reUTYqa3tRImir3
	n5P4eXT0Oj7w/ffjKdlxG1cgRbHYqwqVhxAeWyuflQMNupNHs5Vfpv/qXMsLBsz0BzB08qEOLVJUE
	EJRjHofCYKpDMDFfYIGRSWDxqJJrplLOk2nk0vukqyzf7twLaid0C2AvwcpHh70ITHQqkWx+xhQ0N
	domMfElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVwa-00000003sfW-2nMF;
	Fri, 06 Mar 2026 14:14:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVwX-00000003seq-3hk7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:14:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbFeE4150967
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 14:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=; b=NcbHDJJQW/xr23HL
	K80Rd9I2mBgtFGG6KsJXj0GBODHAV0rflxvT7L8C5nCUBWJiXlc0zoaDinnMsUBY
	yAqd2+Tkq549Gv4CiHs9puYpOc9ouNp+H5R4Gup76+t4YUPEFA/Mcjrtt0mUp3H9
	/SfDOezBDmkAPM9Y6hcsKrNmFZQM8z83CQn+49TS4f8XoyvuPNe5qQ77X/tO/0AR
	fZgtdF17cN/B+qU5TEQtlDKXt5Xx5C8tEW0Cs39zIoBeLRkvEjxPeG78vG+nnBwe
	Bcd1QfDBBk845dUA2NWujogKmLFZMkjWBRbiK5Cpocsizo5YbA56GIVpFTGrFxYB
	yC2npw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25ue0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 14:14:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4f27033cso57938915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772806456; x=1773411256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=;
        b=MRnjdJym1rbCFGpgkgHiIhOBaFKY4grv2IKmnuiyMICBhMp2DYmCYqtshSGS0c1Xh9
         5xw9Ln3AolkZq/CQI8WJm28vMXzpFFR2TbnywnhSu2MhNR6xSQzs+wbKNlFdwUHAZ+Wf
         35mt3mhzvW73hWhXx1gyOKjlUYd3j0Y6pLesUyhiXpOokmjNP27jXZuuvjhe6p5lY3H2
         lX7XDS36qT2KwklTDl6la2h5CmRuqODKlwNN3WGAypGqdPyXX1EA0vB3JpbL0YqaTBl3
         q9WIb1bauygBG0qImCf7GEfnVI1zauDrwOX487u4hFamdKEGlO+VKyAWi4hZsje98dts
         4nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806456; x=1773411256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=;
        b=MC71pXioBVNJSvje2UL/JVbZPPw5xq+DTXDIKz7PTrtOkTiytAoiByV4FzhsK8eJ9l
         NBWYVQaK67P+G1lnTAWKPN5YY1imMKlkymE2aw0BrnKrJvVssvqv1csFp+1cTd48eIWG
         CcT8PSo1BYxsM92EJGW3ELgq1vVcvx2OOZFY9M855bVlyf5Sv6ogxyYDajqDWeR41wim
         ycMkk5HD+cFbazMe7ENsh5O1Gue8eb+M5+cv/ojnuDbitiWDrra1OH5jw7feP/EJpxIm
         Xa60g13X3rI+RhwbJMijue5VRv+Qc5MIdbdMmoiZ9ofzG18JoXO6gyUAooIMdGyCZuc9
         r3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW3IGOfKhMzzSzdWBHvG1DO/CGZ1cipZV++4lkwDpmkDXPRtG2J5pefrOzTP8eANHlyipeIMfyv+Hs+lqPALfPW@lists.infradead.org
X-Gm-Message-State: AOJu0YwLH/7xgrVWm1+zsVHiwk59a1jkKHRpIplorp9DSrd1H0Ms/pPs
	cxtkZdPcVu4R1DPlUVw7pQaNs0kWV0kziLeURMrDmD/UcGzn+FjRDfWbr+ZeSY0BYztyrZ5aZJB
	HPyvj/l/iA0N3I7TW/2Qt5kE/pB9kadc9I2G/e64oWHcZyL7CloA0o+MuIA9sI+vQWVEHwV76KL
	n7fw==
X-Gm-Gg: ATEYQzxTuRh53/rHoApQtAfMMxGXXqlduElyNeQiJ3vhzj8dxlzNFWiJhk8YOF0KgZP
	pw+SWDWdf7JoHsGB0iPh8viqHJ3xlrJQQGXxBz9ibeshFfm08wQO5cr/KtQ6RIrGXGrqST/VFj/
	1/XMRBUtW0PAr33O8Ie4AVrIFNpKHczgYUPir2Rjr5CIY2f5smXw8hQA43FzeRSsEn8A4aaTXa9
	3iQ0g2MZ4vrqEOX8pjHzMwba2qD/bB3s+KSClcusZ0eZBihxo9i4tFN/YlkGZmEVuDBwCnWrEgI
	bp3K53kY7y4Usy+WLuU/dHeF4wv4+4pRb3XM8qW2xfrvpFsn4UuFOo7sZhWlZIruoEWceu7RhR1
	gR6vruCn+IQvQ+1AnpabmuuTzn/iACcmYqoIPC1ZPElTY8M9/bRN28mcacyFffB4X9+RJKXwKeE
	Fk5fXOufC/NYM=
X-Received: by 2002:a17:903:1108:b0:2ae:5426:da46 with SMTP id d9443c01a7336-2ae82432d71mr25502795ad.29.1772806456440;
        Fri, 06 Mar 2026 06:14:16 -0800 (PST)
X-Received: by 2002:a17:903:1108:b0:2ae:5426:da46 with SMTP id d9443c01a7336-2ae82432d71mr25502415ad.29.1772806455714;
        Fri, 06 Mar 2026 06:14:15 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585b3sm24906255ad.10.2026.03.06.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:14:15 -0800 (PST)
Message-ID: <072aa8b3-151f-4b6b-85c4-eb9c9f50b859@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 22:14:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <e116e78ad9590f5845aaaf7d4e26833a7a0194d0.camel@iokpp.de>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <e116e78ad9590f5845aaaf7d4e26833a7a0194d0.camel@iokpp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cbR80RdyKOUJNy39i2Uk9uCki4s6CFTJ
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aae139 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=i1lnRYMTL1kKw9KRX74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNiBTYWx0ZWRfX8s95CjIlO1PL
 3jSdA7oRm37ogWTPe4xAdiGyw4MT4Wn9F4ZHBdK1uCtl8hjCtEvsvqOE70xqgfMTTYhbbfL1z4P
 tOD4MLJQjY2tvD+NAnLHsGw0vn4bAddDRNrbBa5y6QdOJqtpr3rYaqPg8AAe/PeRfXxIoznsY9h
 VkH5w1tuxJGX7d11fWJSZNrTj6yudrTtukV9op+LTjKspOANgzluGVMajIVJe3xNBVn03PWRayU
 RvsVciysLngEJWMtFXqVp0eUNWbGFCREcmQGBlkfRGS6L7MvHBSwfUUCVsY9E4WhrwDxbZPWwqj
 hwx0lNeaOYQHXoZfL9lMJ2wLqaXS0/W9nwK7JwNZMCW+YVtypAev/tVkyNMWI9ET/P7zQIJJorT
 O50crALYRHWMs0esoN+LpgItv8dyjxndp9zor328kY89510Gce7GmiOZSgb9E9l64qjWcaCMHFZ
 Ic8ddBxaPdCxg/W3PGA==
X-Proofpoint-GUID: cbR80RdyKOUJNy39i2Uk9uCki4s6CFTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_061417_929593_B73E4B57 
X-CRM114-Status: GOOD (  17.20  )
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



On 3/5/2026 11:04 PM, Bean Huo wrote:
> Can,
>
> On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
>> Hi,
>>
>> The UFS 5.0 standard was published today,
> Myabe replace time sensitive wording “published today” with stable wording?
That is also my plan for next version, thanks!
>
>
>> introducing support for HS-G6
>> (23.2 Gbps per lane) through the new UniPro V3.0 interconnect layer and
>> M-PHY V6.0 physical layer specifications. To achieve reliable operation
>> at these higher speeds, UniPro V3.0 introduces TX Equalization and
>> Pre-Coding mechanisms that are essential for signal integrity.
>>
>> This patch series implements TX Equalization support in the UFS core
>> driver as specified in UFSHCI v5.0, along with the necessary vendor
>> operations and a reference implementation for Qualcomm UFS host
>> controllers.
>>
>> Background
>> ==========
>>
>> TX Equalization is a signal conditioning technique that compensates for
>> channel impairments at high data rates (HS-G4 through HS-G6). It works
>> by adjusting two key parameters:
>>
>> - PreShoot: Pre-emphasis applied before the main signal transition
>> - DeEmphasis: De-emphasis applied after the main signal transition
>>
>> UniPro V3.0 defines TX Equalization Training (EQTR) procedure to
>> automatically discover optimal TX Equalization settings. The EQTR
>> procedure:
>>
>> 1. Starts from the most reliable link state (HS-G1)
>> 2. Iterates through all possible PreShoot and DeEmphasis combinations
>> 3. Evaluates signal quality using Figure of Merit (FOM) measurements
>> 4. Selects the best settings for both host and device TX lanes
>>
> what happens when EQTR fails, mabye you have this comments in the patch.
This is a good question. In this version, once TX EQTR fails, 
ufshcd_config_pwr_mode()
would bail with error before calling ufshcd_change_power_mode(). But I 
am planning
to loosen it in next version, that is, if TX EQTR fails the TX 
Equalization settings will remain
unchanged and ufshcd_config_pwr_mode() would anyways go ahead change 
power mode.

Thanks,
Can Guo.
>
> Kind regards,
> Bean
>
>


