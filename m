Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51722CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=; b=dUl1sq/kIVIrtw1Sf/6rLG4FgV
	bCptPaFsKZnyQHuV8HBkEc8p8cgyHF6o4DkQFufpe58BKo9VhOad7h8n4NsSjexCWqyuC3gU/KKNL
	F8PoQ5Ol7fQsYPWOU1YhLxntmYiHWg03NIk4yj3fSRu+RHXpNtIcKaPRQW8BIJQ77v6hO8O6BKGQe
	IMs3m/Nn8eEc8Cd1ht/aki/3zOEWqbMU5sxqMuWFFN/NZdMfJPwYcu2unqmMvQHGMw2mvwHEY0in7
	LIIbGSu7MGCOI9d4bjOv4JVtqXUlxWjj+v6j199tPoxuksopQSgFju3cOPhLh7ZUPff9bO81y/P6e
	+eGtANgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtd8-000000005CU-3ZrM;
	Wed, 17 Jun 2026 17:00:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtd6-000000005C8-1MAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:00:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HG5qTr2634401
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 17:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=; b=k/hSwO2dWpiQ6gRx
	KItAsa9klKu6hK6Hf0kmTDcwpNTG4jqYcMYkKCOOuRkdZm9w8asNG8ZVeB4Cf6Eq
	ewgnlE1GqCP3LNRpCF+kPv84Gv1V9lGff0dFzPJouKS9cdNsBBd15oez9S45jSd+
	uS5GlFWdZEvx6X8zEqSHf9UKm1uZwR6U3UP8pfUStYitrB7P84DAT0B9+nACZKgO
	Xak/75URRoUR6pSV3XinRl/hdCuQ9vwSvcbfL2S5fjkrWfRmAiwZLADxyJiYVDu3
	xMYR2Jy5jpIBnDNfbeV/qJXzMsx5W7EL+bHwQhWcxxLftHPtzVW0ywsfhcSzxsNq
	3ipq7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt50b0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 17:00:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so5393581b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781715643; x=1782320443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=;
        b=cI967WPGKLInTiGAPEPTJ455If28HzW8LgbOd7K9w4nUvwldi1lz4D2GPqZrHc30k0
         3pw5ARATEyOAQEqgqm6gHG9bo0iBS9ADbkjzOY/3LiYGklaRN9J3rpS3KHaLAHnqZ2Ps
         NUEQCd29xSq3TS26YRsFjAtAT8xA2Cy9H80oXZVnUeOdG8+Bt10qGAr/8z3rzFOnXaRk
         0txcREssQQPhScS+vbnaR37IOSteS7dSesK8QnCB7rZcs2suAYSiFglKJBmrRUDw5p/9
         BGNx4XInd4BGyLMuT8xh9B/q5tfRE8jRPzGSj9RMf5qiocLWllQFeT8eMt1VqxUQ8jle
         5tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781715643; x=1782320443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=;
        b=mUci8ddUnlN0q2w9SPkTeVxf+ll880oBCjzjGzbvJlxMQlJOQEHjFLxGl+8V6qtqPc
         fLhhF+OVxer7/jfMFANphWTZzQgyCdLwYV2JpRDGc9JSS8J8ZVQguT4eihRI+SCfbNg/
         5jHWbUMciuMeflO2A1hQw5f+OeAJAC5mpqzpmjVBQ9k38HzEVBpO0D6Ye9TC7REs3L+V
         7NayvKLrf0VcptWnm1jU9c4CTD9KXFKWSlbtv0YdPZOapUKVPXN+ek03PsOOYmZavBOy
         vB0ovRSCb/JplKL7JfozLzlp8wQyAFubuAprfkki2yLoBP7JoH1MJraLlwzUIQeunv/V
         tUPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8MjGEfxvckExZvv6n0TBOYKNHcDKKjPzDb7EsNfSRw6wzmWuJTi3vdAd0yzGEW6Tbg6DajmREh38ZCtX6JRaF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gf7IaRCDJOayqlWvC4PlMRUFzFpYQdYXO+AiBTB2DAtYTOKV
	Gwu3ofPLRADRtKVSs6boYGp39D08/wETw/6MCUIfFZBDoxabdYJc/6jDuECB/ouQxwXWLVGkBQI
	BGgPrLlsYg0fswtagyhIb+SnVLPlKp2+GcvtK/6H8MFQR6vfQM5W8AtvNuNjzc5ZZbntrCTAV7Z
	U5TA==
X-Gm-Gg: Acq92OHxrujdnajJubL9C2naWXw1YI80xGC2J82E7uYbCrL4L/TVQH0rxn7SGaO4Cbo
	YccHgsF7bcHRESoe57SLg/zG57veUQDb0QNLD20VdCY3QDdxYf/AsKEMGZ4l4/QEMCrID6vz/0b
	i2qu/ufoJ+v1w65f8UysbTDvcJ4vO36a19jBFvtjKGqiTbnj2YyTWIJXMVkXYm7kIBKOBhBvhhc
	tN4Fr0R9NBPd7TVWZDDoTC98pTB/Fn7FnjXc/xsXLYlJXaq8mjoQ7wHIsxfKvDqEQJeyKh8SGev
	PLrSjeUwks77pqYjnFOCYI8XCdq09rtMy47GOIFtnOHrj0nKPb/rdKqzstOgoXJFtDZ2/+RpgzU
	8Q6+nqUGPcZMLf42jdhgS9AsZxIoslOv7/BZor6Q6nRANPB8=
X-Received: by 2002:a05:6a00:4acc:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-84524480c2cmr4840702b3a.14.1781715639545;
        Wed, 17 Jun 2026 10:00:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4acc:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-84524480c2cmr4840655b3a.14.1781715639106;
        Wed, 17 Jun 2026 10:00:39 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.224.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cfebsm15151639b3a.9.2026.06.17.10.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:00:38 -0700 (PDT)
Message-ID: <f0336ce8-e5e0-4629-ac51-f3c42bf3d9a9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 22:30:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U7gD1BmfGCuSXl0eEPb3VUcGR8val33e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2MiBTYWx0ZWRfX1Ds37RbaaRC9
 CEwIwTHokti4dyXcBhd4G65G/9H4oECunIkwxLMlzXqo0ZQMfn6oPglL1m+o9nZ0MHJhEvlxDX1
 mqxtyvOr0nsiUyEztNzZQr83J/hTOcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2MiBTYWx0ZWRfX4+2xITb0hN0O
 KjIOyP2gRbtVhbieKQFM1zLs2EkGgtO36f8XQOKcUj1+cLoYxVq+ZHeyhNU4ZQXT3znNNt9JruX
 JDR1mNieRtD9OGKOC3qZKjJLnbr6S2w6tJdEl5j1KImX2WX1pSNW8ItyTx+I2gPsYp+sp4aoI94
 EI0Dw3KZBP6D9jPy0MGb9fyacrlduv3wbGHe1CXhqoTt5wxCF97f5FgyaiQFkwegU3dlEwrE4jk
 EcP6YNR5nxEXc58IrwCgo60+4Lxbc+WsEtAgWMurd+NP/4OA/Dm41LTCIpos8f+4l/J47plUtV4
 8RETwDVLY6p5goRYTNUTW/D8iug0GIbGNMvtOfSnltp1wSShh4avezdGJoSzN4t5o4c05f53U7T
 k2CaDnoOsn3OgjW8oJ1BVk2o9mBY+9KHC4Zf38CYxAAQgYEC4nUge+u9jANweHKbtlkwoEsc81X
 j15Bh4cnLYeQdwWTj2Q==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a32d2bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=44Clojva6rUT6T7xBPZ1Pw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=yyym-DC1bhT9zQtRc4EA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: U7gD1BmfGCuSXl0eEPb3VUcGR8val33e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_100044_376615_E34DFA29 
X-CRM114-Status: GOOD (  14.80  )
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



On 29-05-2026 19:00, Shivendra Pratap wrote:
> 
> 
> On 14-05-2026 19:55, Shivendra Pratap wrote:
>> Userspace should be able to initiate device reboots using the various
>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>> patch series introduces psci-reboot-mode driver that will induce
>> command-based resets to psci driver for executing the device reset.
>>
>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>> It defines predefined reset types, such as warm and cold reset, and
>> vendor-specific reset types which are SoC vendor specific. To support
>> these requirements, the reboot-mode framework is enhanced in two key
>> ways:
> 
> Hi Lorenzo,
> 
> Can you please review the if its aligning towards the suggestion in v20?
> 

Hi Lorenzo,

Was planning to address the mfd, and other comments, for re-post. Any 
feedbacks, that we should take care in next post?

thanks,
Shivendra

