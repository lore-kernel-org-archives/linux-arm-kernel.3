Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE1C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=; b=YjY+IvTz1pam3gMSxsn+vzCmVk
	1lQiLMN7P96YqBolC4QfgiMT2TSHiQJiom4MdQ84SVFTHbTJ8/3HdCvzvmYpAs69AedbdXuzo3XCw
	OoKMoyW69IH67AyNz45mdg5vTzXVztpasVAliZyhDjjRNQAObtjYrhWZR4CiDvHef/k85+6MdnORL
	LXkAokuxejXd3XHw8xaovFjWJx/v9r70vBeACgtVikoHu2uUBVc3c00VCgBpUYl9BO38Igr6q1BLU
	UXPulUDmL5ETLKJxw/T+ZeoSA7nFyB9FFuahNHOKvl728QTrxntXH/1MHvTsoQo6SmHuR5l4FsehM
	0jnJ/N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxbE-0000000708n-2cOc;
	Wed, 29 Jul 2026 06:17:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxb9-00000007080-285R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:17:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5hmP6677004
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=; b=YtCQKYJKWcBf0EDD
	oUBMOY2zBQW95QjDHeLJW4TgIst97oo7Iggs2DLRkeXxpsQk25CkeMojtOagDCad
	8KbSu/5o3VUqvHNepbTc2f+tmv3qtIPAwVMrSBVSSNYZgei2mJeY8k5nJIN1+AYp
	c3t/ZwX9B2s9PkDK8WyzWQ1o0pZzFP/g/vNFFflKWlcU+8e15L7xdNh6PH5rSKew
	BdVx31bBDJl8rN4VcKK4cI9jDz2MF1ztSvHNY6MBiVw7id5uFqaHz2+aMrYLBFZy
	feceyXl1+3anshl/u/leQeBbqsvwTlRvONo35T64KNf0e6ctXXrdz+vw9rUVMooz
	GSjV3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm03mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:16:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so7150006d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785305816; x=1785910616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=DqgQIzGY2X0Uq14GBpHbndHIBcGdT42u7bNU0DbRG9BqoZJI1Arrit+ciegIuh3GfY
         zNITfBDPTsqVJf81+/0uO1/1m3FETg9dHX/obaeOLn2vrk/GrY41vKbQvZiIHs/mHPCk
         GbavLUGUXBTXSNcgCv5OZlbryI0ZLxhlgbs7v3DffDxFOrTmABzDDuFODPSl/m1nBmMj
         MKa9JWSJICs5UirlveyeW59SwBjwlAZatnd/z+WW+TfjXnR9j3KKR6CSJKg53h0j5YVl
         tlS+DzwsNkClFFKXOc0UR7GvvpIJMUILET2cs9OwDK5SINWWITobJNk7/8JejQpU/jKO
         4YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305816; x=1785910616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=gxjMUX0FavQl7MBG2LOAAu2jGj8kmcJZNdqkMxNKHAB+FYbvuGIW4vHJoNNJ+fkGmm
         VdhvBSfO6RQg+ZE3HwRFTW+67xqSNZR6OJbrGHfvoi/ROHZW8XtHVFTFzpBtqbl8GVss
         JPJliAMFJ8cMt/yElwqDUL0+INSwyeft40zbAfJOUzdnHauennTTIJs9Vwf5TZs83BIK
         Eqk8Vz6MYRPHOFW+GHHyp2objfXAqvOKL2CZfdLlFQcfe6UCJ1ZWNDz3+bY8oQQGWAfe
         CcwVZgwvHzosTD1+mVqIhEq6pzs1aQA9Md6wK/QBKAff6/29Usv7+gk0BgNmCQHC43rg
         IaRg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Btk0elFZrcrA0NiTn4Ietqw8+KB4YHNj8KONQMD57tweyCUikWQ+uckOMV/SlA7R3s3bg6wdBiSIbPK696h6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4hi7FbZ8dtgAjA1HSQRZKFqY8TsQmVrsHwWGQNt8bh17gkY75
	jraF58lid8o/qUxwPQzlDkGZpXgGAL/jkdWOprde+mPtFaBfIYqfhk2ndAyxNTr9xcwttxXkpN+
	NF3zo5a5orHAXCnh0BtzGBtW/K7R0WiqGI++evtfABxP80m3GQr5AHMWGCxY/c/qQIYtOYhG8bf
	f0rg==
X-Gm-Gg: AR+sD10TxT7ipgWDEfJ2TWFVcc1OHuoYjxPGEZDx3BWU2AoPABwlbHRo74ynv+0I3Y3
	v05EB0Koyt7o+yCgiHqtlJDmMA+jbrhqvIfun0LyiR2PhYZSEucrMJudQdtbYth9Y2+OHv1S0hJ
	j1o8AY53lVqDfHmTZ6mzWXxmlyiFn+TD3EneWR8WOj43DEcKu4CpV/J4WqL3jKllwhvrOAVZ3cP
	23QKQh6sSbAEbgS9M3rD7RgxvsmuBQtIm6aKcov80GCT8lllnOuIB17Qbj2rzIdb8uw/5TDwGZj
	Yy4YU3+pFzUeGkDLYRi9GBfLF0ehpW7m7OVBvF4aN1RVyVXURXmJhUaWfeSpPWpgrUiVbdb6HzM
	sJHJUd1QrIvNFvp3ZP43OWI3+HFM7rA==
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47632831cf.39.1785305816091;
        Tue, 28 Jul 2026 23:16:56 -0700 (PDT)
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47632701cf.39.1785305815597;
        Tue, 28 Jul 2026 23:16:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3940sm5367800f8f.7.2026.07.28.23.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 23:16:54 -0700 (PDT)
Message-ID: <d8927b08-f743-4b1c-85ad-f64b9e5b326f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au,
        Rob Herring
 <robh@kernel.org>, conor+dt@kernel.org, andrew@lunn.ch,
        devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com>
 <20260728143952.GA2121505-robh@kernel.org>
 <20260729060612.1085870-1-jackyhuang@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729060612.1085870-1-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z4IHOLrvryjgFi-vf4OoHEFHC2fbNKUu
X-Proofpoint-ORIG-GUID: z4IHOLrvryjgFi-vf4OoHEFHC2fbNKUu
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a699ad9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=LSH1fm4cC_m-g0oQB94A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfX75R/XKdq1+Dm
 +eGBqdv4JBpWFWqfKr/WVUjQ0p59vk0h0rMbw9K3LeIzL5llUKj/plVttqnkqur7vm0xi5yfvvP
 fzl4c2Q+u+WpYYiEWtjneR9hWB3EmhflN02OWfhEDrooQdei1XL+7Q6RiUYuNFoslJRhfZkwSFW
 46mmAC4qxDq+fwnWVpORcMoiP9vueJuEazpBMKSch0EtDXg7h+uqRss3Kwt/I0kd2+sYIsOSDV0
 +uPOqAbDUt6D+kf3txHWOaAo3co5Qj0HIVhwtB0WUaLThUTjX2bW3kavALo0+V0mNQ5aiUltcXZ
 0arTola+q3z7DoT0yys6+A3TXX9YYEMJ8ixOdwJc6YoXKHdY9VH4bSuaZT+cwTqR2hqUuqK+GBy
 tIR27FR3C2vy49XC02qOlv0807EenVEedMIeZolZjkndRRwnf/Y+w2+WLJEx24rjCOEZxhYwD6B
 To69l/AlFruhIX9llzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfX702JFyK4w4xY
 qPABPKZ40dj3yXbaYO2tQdD480tEWcV/QbBmyuTEE1e6bwM11gN4Xi4c/Lb8sQkUfS6znwC8EbJ
 tW4b4Otz/n2Z+z7NeG/1uVKkOSggPpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_231659_578989_2735E686 
X-CRM114-Status: GOOD (  19.49  )
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

On 29/07/2026 08:06, Jacky Huang wrote:
> Hi Rob,
> 
> Thank you very much for the review.
> 
> On Tue, Jul 28, 2026 at 09:39:52AM -0500, Rob Herring wrote:
>>> +				cp2112g: device@2 {
>>
>> This and other devices should have a compatible string and associated
>> schema. The hub probably should too.
> 
> Will fix in v5.
> 
>>> +	flash@0 {
>>
>> Needs a compatible.
> 
> The flash@0 node augments the corresponding node defined in
> aspeed-g6.dtsi, which already carries compatible = "jedec,spi-nor",
> so the compatible is inherited. The same applies to the flash@0
> under &spi2.
> 
>>> +		status = "okay";
>>
>> okay is the default, so not needed.
> 
> The flash@0 node in aspeed-g6.dtsi is status = "disabled", so the
> board file needs status = "okay" to enable it.
> 

Why are you extending existing nodes that way instead of phandle/label?
You write confusing code, so that's why you have such comments.

Best regards,
Krzysztof

