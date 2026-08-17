Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ED1C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=; b=HApUyyV1TFwQcNKeeyaIy5Se/d
	iMKzY9umnSYtAdny3jG8xbpWiGDH/lCWM6idXI0QpytIzVuS7fHSDsg4ePc3eWEsJDI/+h9xaiPv7
	Jpxv3N7ELKJQUtHR42UUwWoTIBNbsifCj4RQZSthzX5nPrO1UkNp3we1eHAzY1gvBdMTnKe3zKgCn
	T8JS3pmKXK8Fjkxh2b0H2L6cxEFdpTES9u3EdxFO30nZxXXRh/jgWVGHvy80o1u3cYtbiLAkvRTIE
	u0+5fKL2sOiswcpEusPaQ1q1GcKu07vLda8eUl3onPdVaivdLPNghHGPlQQkn8wSlS/zlceO3RecH
	fE9+Feaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxcN-00000006Ear-3rEg;
	Mon, 17 Aug 2026 13:43:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxcL-00000006EaS-3jSG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:43:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5o6l2238632
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=; b=aXp1MmBtty1BQMei
	PbRVOkhD3g8tb2bRrp9KrkuIaxeEg2qxHuZA66DnRlM8cyrEdyJHVsyVfdXbLk4l
	WE9kTc53n5tuUZkEuqie25QBeLkxIPPpeCl3aVrrEKYeA+X2rSbWFELSci5VH/ce
	14sKa565PKv3DUN1EsWC881P+fHM6nFXvGxcNm/Od/sHksRHOX6T7jZwVaqC0kfe
	j63F0xvREL/e6u/PCxnY6EnNvWkF+Wpl3JW6/72r2f0tktHg2PBt8c0tMpFdNydA
	Efq4tTtNfOUVG7E7iPXihypiwKKqZjg/Gxdg5rz501LpRNDJPHEAceugz2P1u+F0
	8xJrKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk95qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:43:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904c1d588bbso13752376d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786974187; x=1787578987; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=;
        b=STyaMaW+ZnkFI9Jsqn1aMX/f9jDT3XZKKA+J06IAcPJR2kmLC5DtGrB7rPV5qj0rWt
         YGTrD6q8aNwM9adq9fe0eHzDEvxWB6VCSU9UMiKINJi+kYufrAYHNUbbpRUJUs9MTvtc
         HZ+sMAeCA4xcZSDH1uhp83KwUZxw+QwjoqetBaEbCOHwCY7NO7z9csQQlffzG3JjfP1S
         lX6/svATB6ly/KUYOWJRZ/IGAz+82b8RgvGmMDNVP/yAe+H0R8h4TcaYjgpv9szu9+xl
         HBQa/8oYxALumi/Mxs4suEp8FBgrTpV/ib5hNncSuJ9BWhTezP8THEQGoz3un0sdePDt
         jwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974187; x=1787578987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=;
        b=HtVUISWdLsj0pO+x+01ZhMnYB4zis9kFkXGkbopnsuYukTjUnesqfB8pA4CYwGzRuW
         mYmlYU/x/lDXbQlNfdOKXlTT80TA7cE9fZPSaiv7W1MgpKq9P0qT1VdD8WmIB4O6vsrv
         8Jmt08Os8XfIdOl7uYddJYzA4f8m3QVyK8aWFDzLtcgnMgbh22z3ku9GgzNgC7j8kxT2
         NkjTFA49P0mLfPUgGe15WMDCFj1pCKu219Wm5PhV5NWcPzCuTYXvNj02JypBY+mcQFnV
         sR/V9OC+PXJMmmU5yuBgm8VoX/usBEKMHmurdPywgMsdwxEqB2AuLaTCcULBERjiEnbq
         /yEw==
X-Forwarded-Encrypted: i=1; AHgh+RodjVI5sCGyTEiZQz8d+nNfMY+Tt2pxxkSEN3OTaULrXhp0ek0mtqf7WxLcX0k+GR3HVcDgCGWJ6OTrQpCTxDq/@lists.infradead.org
X-Gm-Message-State: AOJu0YyGbuB5J9vKUAbBFN5M4m9JsiVUXFgtZasAHx4Iq+/GxWYKtEJl
	NFbIwSIoH369BCgWZ1AkDodSI1BXzGQdEjwrV7UV9gfivPwPrgsGno7UJuEty0iGmZMord9XO8S
	K61fFZbxeEsb6Zp6eE7gvSLfQdmQo+/C5zp6r2ALQMX1sMfae/jEsLHa+LvR6IBawy8a+mEitqv
	TSnA==
X-Gm-Gg: AR+sD13v8DSMWOMdYXiZbkaMittoL1/53UaT1NtuM2PFMBdxDWnaStnFu4tcdD/Hv07
	oFSy5zKPZ7JjUUD9Wa8pYOyLKWVXHnLXtd5dZB6cds5EfmwSMbv1EKDkxcdRwIH99fMuXjGJWoM
	16v2UusIiPd6uDnLWLuhQoRQOCib37siw51SxtTJf3Lky57JuAXSVHqlOQyOh3xT5g2bEN8gI6p
	O8ClvI6U2ymTLAHp69TSCokbx9YJpLc1iorwYgoEr8AGtc65XJsDLTds6xTE1zjPi4d+uK00KFq
	voFm3kGxfUYtR70Q1XjYxk1jF4IlCyxKQ/4fbzQoGdCNbk2v7zJ6Vb34rg5Caw2lGIKoumWgvcz
	atqktRARWrVMePskZ87+BZY3MhJdbvvWI
X-Received: by 2002:a05:6214:da5:b0:908:488b:14f with SMTP id 6a1803df08f44-90a809cfdb6mr331432866d6.5.1786974187209;
        Mon, 17 Aug 2026 06:43:07 -0700 (PDT)
X-Received: by 2002:a05:6214:da5:b0:908:488b:14f with SMTP id 6a1803df08f44-90a809cfdb6mr331432306d6.5.1786974186747;
        Mon, 17 Aug 2026 06:43:06 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.16.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45976942sm9108656d6.42.2026.08.17.06.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:43:06 -0700 (PDT)
Message-ID: <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 19:12:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hmyCGvntW_fmkqKfRrn7Urf432QUKrz2
X-Proofpoint-ORIG-GUID: hmyCGvntW_fmkqKfRrn7Urf432QUKrz2
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a830fec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=deEPgmDcWg2uv8mOPSE3jA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xskrFx3CC3nc2tfbzagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX1tfj2Rv60Bh5
 qzfcgO7JutAKqWsmYMDFJd33P2IgKBb8YLr/Uq+BzbzgKnECr86S7fmY8468lX7mHgBnRPftUxT
 zYY7ubZNxJgsy4QqyLDRn9o4oKaCvhmr6O//gJznD1xtThneSd8gEDngwLdXinpe1dF97IgJd5w
 Bcw49z4It9qjgINMR3R7D6KofpxqB3DBCQjnr7h0bndXol2oNdd7TYbZLW+TY5jsEngz3D9FufI
 NnJ5vgFKlasbURIs7aA/rwj1UsCOUPOp7wqQCdGLQXMGgPyucmL3bcIHsatvGrI+9nqF27WxKG1
 OD0UcKJK93sWaQ63PEpR6mYuWXrlbC0J3VhdY8J+Q4mnkti9Zmc2f7AfYSLuR7npm8k3HieFsuc
 cPvKBB65vV/keftdgm/X+9u7fLRjGxGVJUDqYIhkpnGGoLRG4YFa7xtEMylVZGsxuINd7yDKiks
 O6GZbXJ1X6mTLRKHfUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX6yDC7GnIRoAg
 ms8dWKCqeWlbDVm//o0OrWK6qbWb0gho2rKditJGfatLsVHoC9lLnSMn9vMqMgFCQuj9HXks1kP
 Cu5X09oz31sHKlHPK4DzhdBadtxc2ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_064310_049503_2BEF1B46 
X-CRM114-Status: GOOD (  17.03  )
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


On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> Function3 can't be selected because of repeating names
>
> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
> Perhaps there was a longer name that got truncated?
>
> Konrad

Thanks Konrad for review.

It's a real qdss_cti_trig1 line - the in/out
mirror partner of funcsel 2:

    GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
    GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire

Both map to the same name because the driver uses one coarse
"qdss_cti_trig1" for the in/out mirror variants.

Listing the function on both funcsels is the normal sdx convention for
these mirror pairs - the in-tree drivers do it, including the same pins
on sdx65:

    - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
    - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
    - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
do it.

Only funcsel 2
is selectable from DT (first-match), which is expected and matches those
drivers.

Best Wishes

Hardeep Sharma


