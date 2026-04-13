Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF82EBFD37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=; b=bTB6EIgo58x2nVcaaU5961nIe+
	p89aNlRaf77+qNoZvNzi5xRuBAIDF5WThEWm86e4kwI84xH81fmy66ldwdjQkmgwaBXTEDvOfDDLq
	tfy55Zg1ZP6tOAMuubrYEkr/90f1kUq2bOvqxLV/ChtB6oxJ7b2R+OrK7qmPKf5J4fyXZH3iZgpv0
	0tC3dzDykqAaSBWEsEq8HT8+hCRwhOquWyOps65mTFoD1pyx0r7AjJGu+ozHOv8xrA45Swzizbk8j
	TKKuwBhgB1ELwHHE5oO08MJRj6UOEIbaZBTTBfE8cMLSn1U2xHFkevLKFmoEC2mRDxurROjr4EhwV
	NPtJG1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFDI-0000000FYIy-4Bf3;
	Mon, 13 Apr 2026 11:12:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFDH-0000000FYIP-1ICO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:12:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAUroC2229980
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=; b=FFiUm1o+fEzL4QEl
	JwwZTE5+MVZjFPn9+vJwWnKoCb2dyUKjp9x6soTdaYvmNKJ59deI2A+Y1KulYgbM
	P7n/ufXltYQT0VTfYmtOy7ZxMyq0btP1bG8S05drPskVF3V1C3a2L3gcQFx8yk0Q
	HUZT8PEMsdb6fkHlllgZ9bGd+wt5NDmc9jZxrCoWoHFgkT4TC3kBrJB/amzVHvlf
	xJ2FOBDN2/cMSM67xRwJ8nG90SFBTzvR1aN/7nmHIB5H9b9oieKwb/H3t087Qe2u
	6WlCpjAvSPZ/K2ib8vHJBi9nW0tQWHIWKHBshd/qaqPhkUgzADDM2GzT4lUwkRfA
	CB37rw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt60489-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:12:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so61109571cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776078737; x=1776683537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=AxHQaaDJ/QiJbVkKhaABPTCIhHRv0g9oqiDFKjA/XZd245WOMW/Gezf1gjacladoGk
         UPWahFswKA/i/HzFq5kXNyvHbJACJfFD/3HQ80gwAGm0PoXgfgXS5BhFAcZln+6UZv2/
         P3VjkJToYjKbplG/g3nuS5pMpeW59JmRN7ooos0Mm9LvJhdqcdS3bKn3QmYljNBejJpn
         BwnEj0KwhD2kw9HWuPWff7D88agyl4FhFdeAT4YuVqrlsJP/EyZ11UGFboBWxMiq0cGD
         gflzgbEaavCTWJqDEQ1GnFPQbG8zlgWE6CWPJJ0yW4CfEaMNb+cedQIvb291VtpfDu8r
         F5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776078737; x=1776683537;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=Alr+QiKbFN7qMBR3GhPKHbXgez589bow56T39+GVPNfgNWJeTmFk/bj22T06ZoguYt
         TPLGLpCIcyX1THDP8OpFWedXw9pNQ4/iPJxWBg2API/yTwJ0Csn8lOHF2d54Lk3PiWHR
         qVMAiuOqhUsQiVzq6KG4z+p3Y4KRVM0sNddLKcpx5Eio3lDcxfNwzoN8OgWT9bgcsLcU
         sYI7NXON+jD/9uZlL1P5YGPTOTGbTEqGIouNoU7kKUKLEEyW4SI26H1kwiEoUaLcwjY8
         EfxmTWqRGksuQy1V/iAlC0bCHgooV9hdx1XEcJFfSgqOKoAr4IZubr7mYEOmJLU87D7i
         Bwow==
X-Forwarded-Encrypted: i=1; AFNElJ8C+YtRMJqKEH8sQsZobnzzvezySgORvizXu/AzZm66CvMEfolajNzq7d+uQPMCx91BmcHMGuB0btcjDq5hZzoS@lists.infradead.org
X-Gm-Message-State: AOJu0YxNMrSkhaJHMhprpKc7vbMCPoJTuR++Rhq8MAyCwnnfIkkufQu0
	Rgno6AsdHzUbYCov6iQSqzsyXIyKJhZne7rkILfh+XP4p1DqVHNYD3DdFrxu9eDld8U7W7wtj8w
	FwXFZ2vlT+PwZs9y5STmb+5QoCzNYPlTcaFUk3Cyp6fTbAFQbe8GokFnoRH8HUhKDoDKPCFdjT3
	NBnA==
X-Gm-Gg: AeBDieuBVTWi+w+83fARROFLAYUWrS8qS5cPXp046Nq7HCKwYCEDLfSZ5n7m9pyaVBU
	n2CHUlQLu14OFfHFGoSeF0KGdaG/JBeLl2syD+jKClLXtbIRm1S+UNYmTm+PH5A419On3sScsTt
	nlfKb2GmpSiNAnQNy/e5lxHokFHsIZ9+NoQ+Nxu2uplGPoiIYDsqvNDGGdznnC03UqlRjkZiPcp
	S4gjf9gAcMuZqB/95Sy/FGxwQSsggwTyKsniACJTsFc0FIZuj1l8mDVN/c6ZlFzhHIVDrQ4Lp+5
	PUk5OggTmCGOq0A/K4VxR4JiqtT5RjC2S5ZM1rpv2yXkl2Vk3T6ghXHStX15zo7KL3Vf1AhZD13
	ly37E2raG1i9EomrNBZEu6zc3bBwXUl5GtqSv222sqLqmQ0ck
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198617111cf.54.1776078737553;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198616561cf.54.1776078737121;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm277853595e9.15.2026.04.13.04.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:12:16 -0700 (PDT)
Message-ID: <dec1aa54-5bfd-4372-8c5b-983618d48291@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
To: Sander Vanheule <sander@svanheule.net>, Linus Walleij
 <linusw@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
 <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX/z09FJzCkNkp
 wows0LCuQO5U8NpDrSMkC8ZJtKh0N8zTi4L0Em1/wKopDNc8qgpwgiobrqFXMAwKUvaTlY4xaQt
 XLQgixusYwJ7uTxhhDuimZN9ebnbeLvN+fl0RHQh78r7aV58slPsRA6b+l3QQS3nEqc0+6FQT8i
 VT8VhVD1bNtpeFR376/H7jHJ0L5tNe8x7VrQRwixpHpnw743x588Joc4V9ocOPRpyR7489skSnQ
 VKSIab6KXFEx85UTKbWF6c0o421S/UcmekPkktoZvaNZurCoEw675Pjr8fnEPVVsOSCKPckO+b8
 vxaHZvx2GD75NIhYx+oib2oZypsqNQ9lq2OCJn5pHQOCrwDQ+3R9B7RicklsnNF4iBz831pS+mD
 Mm4Zv40xVTzU0TnCB5bKRd/d3KJ3jtAegUI4JllsXVYjOYc1tQ0ljP/MtQRX2V4Hw6u9aXAT9ui
 RBOkj2TmM5jZQROJ9xQ==
X-Proofpoint-ORIG-GUID: SRCJ5oHqulsk47NlxPhwSdFUBY1ESVy6
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dccf92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kD-Xf_iB5HnCcHWKTSQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SRCJ5oHqulsk47NlxPhwSdFUBY1ESVy6
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
X-CRM114-CacheID: sfid-20260413_041219_471459_3FE20111 
X-CRM114-Status: GOOD (  11.53  )
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

On 10/04/2026 23:22, Sander Vanheule wrote:
> Hi Krzysztof,
> 
> On Fri, 2026-04-10 at 15:04 +0200, Krzysztof Kozlowski wrote:
>> Enable compile testing for Realtek pin controller drivers for increased
> 
> Small nit, but this looks like a copy-paste error from the other patch.
> 
> 	Realtek -> VIA/Wondermedia (or vt8500, whatever you prefer)
> 

Yes.

Best regards,
Krzysztof

