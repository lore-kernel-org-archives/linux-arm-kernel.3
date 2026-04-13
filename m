Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F195EBFD38
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=; b=DjBBP9O1nTVQpdmvVMuOhRHcWO
	Htw8JdROXHN84JdBuswIHjeojebY7LWTF5MeYJAIuT9iUEPgA+I1TlOO9y5/YSuh9s/EbhVVvOHTn
	+rPPm1FnL25WEtrli2WyuofSzcDjoXUfaPNbEmPh6HRxOIYT7x2ImI4Bj/VFDYO08OdV8ZnPbNriO
	gviiycsDqhDCk0GpZZyk6XSTG6QSk3iNTK4MjI8YUnTHCxgc0Wo649/Whpyja7yK/58A2ls+DnbrZ
	qYPqkzmNTvP/X4xeTxceJ0wZYZICod3Rh7Qxx5ZCDWX6I5M0odKP2YqDi0YE03IA73PnUCsLD+YfV
	NnnksSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFEq-0000000FYUb-1Xb0;
	Mon, 13 Apr 2026 11:13:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFEn-0000000FYTo-2e0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:13:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAUrpI2229980
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=; b=FttCNoqPV+itb35Z
	mfcL5AAIq/LCY7Xw+bBnFRY4EnbcWYDp8Q3RhW4YV35rOVVtqW0Reis3uGp20w2w
	VH/Z6/KxxNknEH7Yv3q61qZJja5PQSVhTWF9zwa7cuxiEwUXRJD1DiwJwUEGFVot
	XnmlNoFWRybWWzetHoaNGYa3NJnIfrXii/itUj3Nn+LAGiSwSqXD3NEYjb/rNFPr
	/nyGYjII2m0fGyz72hjl8bSUfyDvd8zZUkdJEAgEKMPOLx/sdUA7yDVAxQAup+nD
	+lhX5I5IlDrXwhpkleRuI736mAje9K4ri/nKPX9DGI4bCpf2YsBfeKtd2rLD16bN
	mQdzEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt604ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9d52ad9aso28616581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776078832; x=1776683632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=;
        b=NlsLperPUrqacZRogVLMBxeKCnP1eNfR8tIyG5sBaiMgw6ilqv7+XinlE9mHDgZZw1
         Cs5+UTxaW9blB+oltMpGey1H8HvJQG9nw+xJRVef8jJ787TyDRGHMq9pANFaJHPR+2La
         7kxaaAHs/3RHhOaQqvYr+Jujq0NglRGMIPdppRMXpJHaaqVTclaFusJut8hkOokO8a0v
         ZSKs8+JDSGkYZJNOKZG7TXVXAwTpWr6MAYaasK85gVyTY32oXe0vSq0hq9rHvFocgL+X
         TmjbjrX6l8VdyLqbZ/BnMd6RNIQZ0h97R1ZuF0SONPN7LyDo6KVdzhmRISPjAQ3NT6Ez
         c5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776078832; x=1776683632;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=;
        b=n5+mhgyLvk3WTK722Ck2D8NQlCinGJ2NCPTggqF0WIycv4O8gTzqxUDK7hAtP5bc7W
         vgdPZioZWnSksL9hSpxNOPQPA1bsG+AgQ4KT9rKQMlMD9l9Rc2cYgADppFLnA2/gu9B5
         6rk5qqADGARHp+DCU+f5wdqiiI8Ry84oXY59j65VvOZpwe6XSygn2oyBDQEyXUekmsoa
         3Mfz07E7OOfWLSdUrbCzRuccn4p4/I5BWK79jmtP6u57TOIhQxMff0iS5U+L9bA54IWW
         r2GDhq2w8OIjoa2QmSdUMsfWbt63gSpGoEjw/OSiRwUdNue9ihE0nmFR7omQpiBsHpSZ
         H9cg==
X-Forwarded-Encrypted: i=1; AFNElJ/G02qlFZ8fRKgmMvFhtxr8+Ett4uyWtkEHTk+SvROAil/MydA4lPu/uEpCgeeK/XbhOANBKhPu6suUKjLHjYji@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjj6pj6CqY129k58sRsPXoV8cRky4WrzVkvWnxq/5IGeDAfXsK
	KaU6nsDWjhriRVOqsbid8RT3wwLjfXt47HPSSSROMz+Fu2fKB/2RGk1F1/z9tuujMzf8VVN/OrT
	cSY/nTAFi65JmzfHGkcf4izBCI6JMWPAkYAqmc6gqvqqMpfkfEqnHJ7/ChAADEGOo4qLIQ0Q9Xn
	mfEA==
X-Gm-Gg: AeBDiesVRMAaAjHBbiWjNhX0m1an7Zg+wGIUIXGAM22MKDJqMhvDSQ8cfCt38eXUU/A
	5DTzqCN8MftCTZmw5OEM9d6HiD/MlFUxWoJUV3t6R1a0MkELirO0gpzW+wF0pCW9JfPyEq7XAnO
	l2Yl7f2okAwkxmoQ5XZvpjtWOqh+z6WNDN4lbtpOIXCIv9yU4Tw0NruCvtTPmHljJwI+AastZOp
	hh+6DTa1IxzyyY86EXQcuclTszexGfGgqq8kLBrxs0TdLpfxeR5o1olH7amU3vtEfEUg/nudsvJ
	crmLgvvt50DxSfyj1M4PFP/5v2LEMFed8oSx/GiIZYyHlLLHjCDmOcKDsJzu9RlsU/eUYsQ5UtK
	xFTkS69BWBtdKZzxzWrDv+CDD+EVw9cK5+fyMrIH+K5m1Gl7z
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr157673041cf.33.1776078831906;
        Mon, 13 Apr 2026 04:13:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr157672681cf.33.1776078831464;
        Mon, 13 Apr 2026 04:13:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6ffd3880sm16502298f8f.7.2026.04.13.04.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:13:50 -0700 (PDT)
Message-ID: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        Linus Walleij <linusw@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
 <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX+WRoY1pfyhiW
 fjhc2GSVGgG51S9StQiXnW92YZ39bF/JaNUm3oAHHwG473AMbHumNmRyqaGPAnuy/pncFjbuhPq
 0LC8M8Gsnod0HZiV3kfPrBwjJgEWdKIvY0TmJ7CKlHQ8CcmBBJSBJEKaHwp4f0mzi1ZiHRbQ4cO
 3x3+fM6brq6i2C4D4KEEMwTbZECdrY5gwMMXrdz9p2n6Qgfw3QknwykEaqQ+CSDqBEP61xmWsvs
 4TZEzYw7Nn/NIMvnbgvJGXNVGBpI2Xv4KO1PZQCfnKv3IaTRBc4eLQcXfAGkC1gadt3QmC4pPay
 2b2OMFvaBWkvTF6Fs54LUM0KarzaDdF74rJ5JAAGf9ne0LqOx0h/XHbfkjRGN9jsnQCvEkt6SjB
 N3tLVuxIA7aGbRzGshLSnoyF+aI032W06nH662h4GQqBaDHpSyN+diqWwtSzrvXqw8t/lPY+nO7
 ZIqdLF8EWewFqMeDxtw==
X-Proofpoint-ORIG-GUID: 2vC7wNYBca55l6SJK3qwebvuLvUbb5bx
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dccff0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=c4pGgGm1PQYjHLslJMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: 2vC7wNYBca55l6SJK3qwebvuLvUbb5bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_041353_872953_CCC75858 
X-CRM114-Status: GOOD (  13.59  )
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

On 13/04/2026 11:23, Yu-Chun Lin [林祐君] wrote:
>> No dedicated maintainers are shown for Realtek SoC pin controllers, except
>> pinctrl subsystem maintainer, which means reduced review and impression of
>> abandoned drivers.  Pin controller drivers are essential part of an SoC, so in
>> case of lack of dedicated entry at least cover it by the SoC platform
>> maintainers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> This patch should go via Realtek SoC maintainers, not pinctrl.
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10d12b51b1f6..374ce55e4fb6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3373,6 +3373,7 @@ F:
>> Documentation/devicetree/bindings/arm/realtek.yaml
>>  F:     arch/arm/boot/dts/realtek/
>>  F:     arch/arm/mach-realtek/
>>  F:     arch/arm64/boot/dts/realtek/
>> +F:     drivers/pinctrl/realtek/
>>
>>  ARM/RISC-V/RENESAS ARCHITECTURE
>>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> --
>> 2.51.0
> 
> Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>

So James will pick it up?

Best regards,
Krzysztof

