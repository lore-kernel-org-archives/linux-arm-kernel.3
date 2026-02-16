Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE80E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=; b=kuzeDfYdgt792hTYAHC9tYWUJA
	b8Wmg0cSeM/dew6vFXU6H+LAtMKYrYhKwwp55xtwOHo/09AXF0CMICX6MhZgkU+bXPy+RLVN3P+N/
	8z4pKOXac0SVEoEuJ4gg2/ngYbWtTDWZTNgW4xYvm3G2gMjqcAMjvsID7wFTUl5+fmTVSwcwGwFUa
	UlQ6LD7qK9jvutyzOBTqwu0Ovhw3ZXil+HckdceOh/jaB1BYT7H8wxUoIkl4pLJ8+TK5iUsBsJZtM
	PkwcBNfiH/hIgRXSHpgU6xB7BIzEdZZitcoYQmcWyarYqmQJaPkQhklsCsBwDRFHlSekAi3Ni2CZe
	kdtj0SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwSD-00000006Pnt-2QFK;
	Mon, 16 Feb 2026 11:07:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwSB-00000006PnZ-11Mz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:07:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAjkSe2254521
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=; b=Vfc7ZzBNLVRCgkcW
	nRVFDaeXCjRdSBSVu9jn4ZGR4po3g2Vq6aF3aoSCFXHI9wTspANQH8u+w1kN9xGW
	fMgfd0aOEW/Q5Qel6qxsDkn/e7Xm7lrUiz8/9yV3dSKZKoSyylXPzCDYYlrnezhR
	P4d+bINGrot1QRtbGK6MjSAoeT/9/vUK+dShdLnhfI4krqn5lRUAbA0qY26G+265
	NpghSbqgPzZ6q0HzavBlj+n+GNCQvLigvQVRIdOhjnsx9SNyCnTU6kKTODv+Mdac
	d0/JzaibLPmaqhg+BPa0eLyBY8RtIk0Buv9bRQDqbSVwp5Lord7DYQlQoEx7lPmR
	XQOsLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe6490r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:07:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so1823104585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240066; x=1771844866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=;
        b=Nc9639NvJpu1e7qd/WgoltVzhdBET5DwVcspOuYESWv1Q5T1pD4+LvKUOOs8ff7EXu
         M1vtnp60mjW1KK9GY0G2gRuNwmJU4UBht2eNI20Ft5pdlM0M26vXsGJLj7XR9qSEz+Ub
         ivxxxCQMhBaUtAKUfNWGI6UypU7mlBpdXUvkjmbG9AQZFLuJtCWkX3A3NwiDxkDhDeWH
         2/NaUTlDm7812oSlXbjdTYUrOJfjRbjXgztXfZO/+qdl1gwKXnsbjBIvRJT5wmNPQzoO
         o8unmF79Kc75fJfdvwHDBRonmNhu36qD6gDpA6jOY6dMoalSNhE5ADUJZXJXEVC8jDLy
         lTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240066; x=1771844866;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=;
        b=KlG6GjyMPbO28RWNL3ncUVRkRqHhReMvgye4WlQiLyr2bBnPFMITHWAz2IrG7GBEEE
         iGFoHtdAGoaDU2xOW2l0VuPKX3BN7Wss7WcVo/bcgFvvL71RWm5TMbPwRvX07Q89aKfB
         Hffnk2bLspMWY8PUhT9a86s19tfBDMpcK7SdrrdWNARZkWSs0ILcQxYY7sIxKWFPCqGE
         6nLvkEpNqkZdpkT0KCWTOBMgRf/eSqGF/rotBymN0DDW7C7IPtVxKUY6XZN0TrEm/4hs
         Vc//p9PXVrJ3PaRhbtUK1egtU8xmUek2CdevjcZylJIOi2FVfrs2TYnW9S/Pgmk11ipV
         EeFw==
X-Forwarded-Encrypted: i=1; AJvYcCVztCFIBtvgjRJ8LgCtxkCInwKhjlsU0P9YmiTK1vwhN4P4Eox0tVgaPp1uKVqvvI5AB8ypRgsojfUj2KO9fPLV@lists.infradead.org
X-Gm-Message-State: AOJu0YybWlU1sul9fh48gmsWM/UyfVHOdaNgfSrImHOJoU546vwp45DF
	rC3OuwnC4oEB63jrFuqT6JktCxns8iSFpauYPqH+jSAF9Luii9zCeovcmO9HSZFzfW69iolBydn
	9V+tUfE0nuIzLvv6dmKMf+XNZU05T4zIen4ioy7xaOILtp+FaCqixTsthQ766PMdIoJDQFE4uSJ
	nD7w==
X-Gm-Gg: AZuq6aL7gs7cano7jDEg3EdItZC7h2pMFO31J/Z9wVRJBmUMmLWsntADG2A21NCukuo
	qRuqwg+O+zDuSu2wgYA27Vc9mB0AvJit5umo19I6CeFyX8tf1pYwfN7d3fQthi8Ma/ebiTPRcuB
	nTjAp5Jsol7JoyGtuMX83kuHHSoSAo9heQfc4+CzBKtRv/Jym+Wkqs0f7QIY4R7/8Xm/D12hhs6
	wxAVgd4NGPgiyUQAfiMqS6YOFa2tZmCdRrwZ873ibmO+VpjKPD8tAe4d0Yix6QNQSVb4+FztxSy
	8RAgPC3nRCsjQuXXDds++f50osA52u7+dQfyhUcc1Y5uM+d3yaGqYtSTSS7bwtQVtOi6vosIc3w
	yJqsu+oi/M0QRXLUHiW7Fxw2bKg97GMQWmoJKXuLxVXKp+ejgCw==
X-Received: by 2002:a05:620a:1910:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cb4c00d093mr1016119085a.52.1771240065460;
        Mon, 16 Feb 2026 03:07:45 -0800 (PST)
X-Received: by 2002:a05:620a:1910:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cb4c00d093mr1016115785a.52.1771240065020;
        Mon, 16 Feb 2026 03:07:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371998777sm294071675e9.1.2026.02.16.03.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:07:44 -0800 (PST)
Message-ID: <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=6992fa82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=057-S8aYvNixUhiuP08A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CU2OMmJI9XmkOIsydKcz1Swxxdefr7Ew
X-Proofpoint-ORIG-GUID: CU2OMmJI9XmkOIsydKcz1Swxxdefr7Ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfX86TTo5O2ICfo
 7wk//MnBW7jV31zTEcTThDJwuA4PL8OVesRNDXpNyoYi0B/zy0pT8j7TO/o5jOdCKhtXENBOk0e
 uuDQQ4AkWDcyC9bMD0/zaOr5b4wuawYRsHM1cTlZfwr1K9vb4NcM2sjY5l7NcGj3nAP0eChw5lR
 BJVIt5h1NaJwXZUmNZVZBhb8iUAR6gfsNHxqgzIbKTDOMqjYLEAuDrar7AsrCNp8dZFsitz7Ahy
 UlINd13ROHv/+O9vEI+o212kUHyMG3Y+9CwXDLlmJYb3QtHSo3cq0THKfptPhLVSPZlydXfoV5w
 3NdpQCa+1yH32vIKtLlzumU1bXIBqjb3eZZicUUAeFYLrai/jb/FXwbkGiRlaVvbLxR/BgnQe1Y
 u/q8QNL0b48KcZ7XVt8QXVps8LRZcX8KMs4KGi1Otw3jG8KLBpWFb18SGnE+R5TABka08Lqzs5J
 wYERrRBzW3cCN/RHKzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030747_409620_0FA0F1BB 
X-CRM114-Status: GOOD (  16.22  )
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

On 16/02/2026 11:43, Ilias Apalodimas wrote:
> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>> Hi Krzysztof,
>>>
>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>
>>>> The 'struct efivar_operations' is not modified by the driver after
>>>> initialization, so it should follow typical practice of being static
>>>> const for increased code safety and readability.
>>>
>>> get_maintainers doesn't include me in the cc list?
>>
>> I use only get_maintainers and as you can see no. You might want to add
>> yourself as maintainer of this driver if that's your part. Or have
>> korgalore/lei filters.
> 
> Hrrm, that's weird. Running it locally returns a more extended list
> which includes me and Sumit Garg.

You might be using git fallback, but this is not a maintainer. It shows
random people either involved or not involved (like cc-ing me on half of
kernel drivers), thus it is not recommended for daily use and all tools
(e.g b4 or personal scripts) do not use fallbacks.

> I'll have a look on what's going on.


Best regards,
Krzysztof

