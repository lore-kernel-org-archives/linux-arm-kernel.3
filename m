Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797CF10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c7otT6wtxhNYUY+WlAuLueW3DleG05AhTddlKQqHBA=; b=kZKZLyD+TKd15qxKgTDV3u051J
	16W4yO/EySWb/ZNQhgBzfIFwpRrJzTmJz/8R0iv1EqKCUyJ4N4N4EhftW5aSR4V8dF4Bwi2Ts3ZFa
	rfj0z2114Yc6N1XeREoJpKK1hAa3G8c84b8Qnfs3itdfWhq7FvF/vgkFiXJ5PoTPvhF5aEXCrGf8I
	GOHOisJT94blrewR9xn9sAn3VWSwWFA/X40Xi3Vi9V8jewXs05Q1nqj+79GaoluoAvcksVrnjK3Sq
	L0Mc/auWzNsmjCNLuKlXTtv+zzrgLg43ynjIuu3hAJd3d8a1HrinX4XpI4RKWnVHkmZ+1V9ekupvt
	rBXH/KzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65FW-00000007DDN-1NGC;
	Fri, 27 Mar 2026 11:21:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65FU-00000007DD1-1Tl5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:21:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wv6k2846418
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2c7otT6wtxhNYUY+WlAuLueW3DleG05AhTddlKQqHBA=; b=JnqCVgst47bmWGGu
	wG/xmNTTkrzUx1pXUtwK8JbVo5vmJJIqoolgtW6Rbj7JYyP1X/0rdV/FmuMhGWoy
	lT3YkIPyWuu+KO4hqx7oUQNKC9zm1AveP/BcAZl6fCxhBWIobgWrSZuSQmxUn2NC
	I5qtIv2ZKhyFposNcvSQn/H6RC2gH8/jxKc9t2fQ5QUfF55P5cPifxvDOT21z/5/
	9PlORE94ZYlW1NZtTeRd6ELVwReY963I9xOkY/KOFE6P0uCd1WGFfPvqtqIpFzHE
	yoeaVSzRsTzceFzOnmd3CtiB4GD0hqudUkeFWKDuTWWeXoruJKwUk07wEpBupQof
	959aqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmsm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:21:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso34291521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774610467; x=1775215267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2c7otT6wtxhNYUY+WlAuLueW3DleG05AhTddlKQqHBA=;
        b=UFO2ZiJlbe3qQFCwTlaA1Y/j7vBS2GZoeAhaRJ7CuTPLPL3726qJyBpm+jx+iZDG4y
         Hzgd8tNNoEk62X7r+Rpu6nJRrGxjv2p2L1BtIxpE8XoMsP8YiE+Y4v1kmNPDgX2H1ge3
         +0lVugcCm62YyRaJlEkfE+vEYt51iCb+U+R0uUF6tHvDjX3+2pS68i7DkUyeJD4VPHM1
         P0eP0qEPdD2b5aKx7hnf+P0bPlZjr3VqYv3ZxWoSaVAX79twlxIpZ2Csyr70zdDBifW4
         MLjkYv/FE7PRcS+yxo5TiCjgrHnPi6laATpR6ERSkRAs/plQ2iWCNCf/zGGBuGk8pqb9
         m+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610467; x=1775215267;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c7otT6wtxhNYUY+WlAuLueW3DleG05AhTddlKQqHBA=;
        b=lw6t9jrwEG7oCDMr9BpZYwTpaJjgsX345DMjlQBA+8B0hqzuHyejeRAooHiT/n/hfB
         e4q5I6R6BaWobdpOVNY+li7QVF0Y5S14XiIM8uChuV6RfwFrcz8J/iDZBUt/NmQzk6DI
         F6DhCWZUcVxmHenqkgL8rtB17ukqAkjiTLlV4pIwUfy1X7QIZD6MPrGVqdd7fmu6kJlg
         gyCEDmyXaLLhrV2Y88bChceyY5kvN0wGvKAjZU8m6MqgPuviq3NXaxjwspSjTbr9ScwD
         A0GZB7gfPRSrIAILHNBhaZLoHxaDXdzMUPzPIATmn3+oS5KHp9ciKNSU4mW+iYZ00o/U
         jBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWbKlM6waW1XUY3Dsj7oHgh8Aj9jCAPnz+XuKZdTeEPzPn16GM2cpAO06n3L+/W7JcV5KJe0DFCQKP0+AsuHo1@lists.infradead.org
X-Gm-Message-State: AOJu0YyzlyVoqb1LcyHI7MWrozR1O2VrzwQal9RGpvPe5m6h/hSOU8U8
	LjEBWT+m7dD7OAijBlbg5CFhZzt+g1ZJycZzChi/RC0Wxa0AQ74zCJzt7eU6vzN42XQgNIwPI4Y
	oOPm/YJVyfzAXGHoLlxeHyem8ppSl5jvgUfrYNJT/Qedbu8bUWfd8/+fb9YVG7qGTCm/cdZlMt2
	9kXQ==
X-Gm-Gg: ATEYQzxi7xDj4CzvbQfcmGrTPUJMlkoI81G16LzfmErYAtkXZI5mqggTOGaDrxuUQtk
	fz0N/djdtYwBRbsmL/YB/Uj+rhNcy6sCn/7HsSFO9c3PWbjzvp0toAGy2+trmRCwcpyXLbI20Fq
	jhbkxrcAIg17akZozW/BXkWOG/Y6aeTbY3ie7DzlGz2MWeJCTk4N7vfJZtfCnpd4QGfROSdnVS4
	iTbnZO/Qt7uYQgLeGGbziDALg2gtzbwPHv9E9cZAdMgsLiEY+Ea0twgSAu51VPtZzPNxfh6ZdyM
	DBs5CYKHd/D8lx32sxX6/OxrpTBKqndD/uPXa6OwTgVSszI9ESSkUkFI4/j4EN8kva8n6dHuKvY
	cP/OSzs6QS22ZC8c3CRUwJcpxB2JjoTttAbJZi/pOUru8Mx+C
X-Received: by 2002:a05:622a:1819:b0:50b:1932:c9e with SMTP id d75a77b69052e-50ba38fa096mr25579861cf.39.1774610466591;
        Fri, 27 Mar 2026 04:21:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:50b:1932:c9e with SMTP id d75a77b69052e-50ba38fa096mr25579461cf.39.1774610466068;
        Fri, 27 Mar 2026 04:21:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6c53d10sm2092514a12.29.2026.03.27.04.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:21:05 -0700 (PDT)
Message-ID: <08c8cd49-5fc2-4efb-9611-92d7d3c7c7dc@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable pinctrl/gpio/pcie for CIX
 Sky1 SoC
To: Peter Chen <peter.chen@cixtech.com>
Cc: arnd@arndb.de, geert+renesas@glider.be, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
        Yunseong Kim <ysk@kzalloc.com>
References: <20260327095652.3793688-1-peter.chen@cixtech.com>
 <55875ef5-7959-454e-b071-c9f5c6f87bc0@oss.qualcomm.com>
 <acZmPUIHwJhJNT4x@nchen-desktop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <acZmPUIHwJhJNT4x@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OSBTYWx0ZWRfX9395G8oMB3Kw
 9f/eajOHKpY3YYRRIFWEj6W09Q0zHNUUNYslHMJR1iJyZUzLYsAPwuNXqpKPxOeryrIICPtm6ZI
 fTGCBYCwLip/RiQOGHjyoe+KUrG1E/xtd6UTrwaQRIES1EKpdONp54V1OrpKtnF2U4KxF6L/kIo
 URelzgwtPLcPcxsQpkJmqfLD033x+vmka/mc5KSDRguF1seIlypwxn8c+wDLVHH5FsJmMeSLjaB
 SYsyWdNBoU2qQOi+YFxY5zax5ltguzjBBXjwVQxGc8YmffRy+VRQDb25474DNu5RSV0mvVecbGQ
 ctZ4PKSw4au7QEjghU2l9U3j4weWk60BYLP1shD++H2/v3ZYGFOx19lQKuBJkJFErS2h3Yi3T1b
 4fXpEOO4lSIM1m7PoPKyRDJIUQbTnEiIGSeLfkHecHEXLrBjrFc6DHM4xI9HSvaTKVkJQA/ev/o
 NDZQxqvO2jpgndCER5A==
X-Proofpoint-GUID: QiStOzDMCwKt8NpYevW_x29Cp_5Ealsj
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c66823 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GAbqRkGVDPwTw2e7v4kA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: QiStOzDMCwKt8NpYevW_x29Cp_5Ealsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_042108_403595_0BA0CAA1 
X-CRM114-Status: GOOD (  19.47  )
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

On 27/03/2026 12:13, Peter Chen wrote:
> On 26-03-27 11:22:33, Krzysztof Kozlowski wrote:
> 
> Krzysztof, thanks for reviewing.
> 
>>> Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board.
>>> - Pinctrl is the base for peripheral IP and peripheral device.
>>> - PCIe NVMe is needed for Debian boot.
>>
>> I don't see NVMe there, only PCI controller.
>>
>>> - GPIO is added due to Debian bug report[1].
>>
>> Rationale must be here, not in external references - this explicitly
>> requested in submitting patches.
>>
>> This entire Debian reference does not really matter. It is enough to
>> explain what hardware you are enabling it for, so the board, its
>> contents, and SoC.
>>
>> This is as simple as - does board use it or not? Does SoC with this
>> board has it or not?
> 
> 
> So, I just only keep the below summary, is it right?
> 
> Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board which Sky1
> SoC is on it.

Which pinctrl? Which PCIe? Which GPIO device? Read it again and follow
its meaning and tell me if following understanding is correct:
"Pinctrl is used on Radxa Orion O6 board which Sky1 therefore I enable
Pinctrl Samsung".

Did you look at existing history for this type of changes? This is
triviality so I don't understand why we keep bugging for that simple
answer to describe WHY you are doing something.

Best regards,
Krzysztof

