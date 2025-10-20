Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560A6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIG694y6bAFJewqTAATkKo0qZg41tPW6hp12LV4gekY=; b=qvwq2SzX8x1dThBhmm4aMmyhIS
	Mt9pBcBlr8ho2L7a5iis23RY93a76CZpmyG92ACrJ5YomUpGlVx1HsL0wqTE9SYnf9EiwD3WXbwMw
	86qZ5Z3PYVaQ1ACv+eW46anAnkQZLPYiBbXfg7TkDZAe/rRphoO7KRiJg/LDJsD2VlFqtYBzrbJoL
	ZHFwRDKWVq4Lft7Ral5HHF7qXdSzdSACgRCIu/Nqptf2m8deDD89JahxABpowVBY+azmyJDXI/5rS
	sX4Ob87EmkxdMI2H/OeoBoco3mF1g9xv9kUDiK00ZcZhAUdCY35RJjH7Qu090IBlLLC63Mlat4laM
	0eKBrSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAodF-0000000DIZw-3qa8;
	Mon, 20 Oct 2025 12:04:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoaz-0000000DG8N-2QMo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:02:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59K0ZK4q006127
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIG694y6bAFJewqTAATkKo0qZg41tPW6hp12LV4gekY=; b=k1lm7zi8ubgptaZY
	JLhGvPqwvs/nB1B4ubs+IFCzETjhma39eF1OCc2WY/KcVz6r3GvJ2pxxjAbjm4mk
	OQhmVq+YAjWp4/u1P5ACrVZKjEyfRzHMdtu1WuA9Y92FHgT1Th1UOikmKCZD455P
	URQ0G2SN+nGvuCZVFR1PPzPoQR5W9lVLiLGzkdCOKcaQJxK2uBbzwkUgXjC+jxxX
	vlz7dtOdNRjkYDrNhN2Qdz5Ww1oQePNQLl1MMDz/Sqz3njU64D/OQfmyXYp7OkC3
	K3rxaxGBtSpzXyr1obmn2sALFFWEdiUMapm/OS1jB57Q5jYt6zLlkPwTQlLSdHuO
	mbDXkA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcw3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:02:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a8aaeab5fso215672e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 05:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961753; x=1761566553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIG694y6bAFJewqTAATkKo0qZg41tPW6hp12LV4gekY=;
        b=LNIrnH+dap/Kaf26wHlQY4SCRC0N4n7r414HhSYbj7sniXzdKCh6e0MbvEzvqLr4Jv
         XnQ1TqlXNfCZSm2z/He5IZuRU2xkt1nwHIzMis6aQcE6z66fTQGb8TUWG3FWmb7E+ICa
         fcPMGkW1ZzwSaWR4luRDWrBlDbrAKAw2b/Gnjxt2vZMzm9ROZcwhv4QqCdtcr52NMm1X
         c8Nrklyl4eJjJ6XIxLD9bcE0/EZ+JIn4S0dKsWOmRJIJXzAne3YbHVFMgLAEqczKg5GD
         Hy0FgDvvq8JVewiQfZK4HETN+vh0gcB3/r3M8CSkDPn2iArfuv2gQy0kc2Cz4hteY0ek
         vr5A==
X-Forwarded-Encrypted: i=1; AJvYcCW8h7Q0sgoaGDhbkf61LX3Uou30pdrqWKPY+2lDpmAWza+x5igKhe5esy3riNeO7UiSxFD+JF0Kp2UdDcT8+KUN@lists.infradead.org
X-Gm-Message-State: AOJu0YxUhmzizuwtnpZxwI3p+nvhPexF+KBOH6GoOyfmnWm53mm93rK1
	FcEcfxu6fR/xVXUGp2Huh8f6Ws4TsmEmn8to2xHICbC2mXXOsr+7mvBwE5NSRLrp248q0IluZp8
	srwXLZKdMGXdTZZB+Mn+/FYp3X/PmxSFqx+5flaC+lScVqBObJ5y1s5gsRDdGGqM8asuv7ygLRt
	m0eg==
X-Gm-Gg: ASbGncvtkNule23azGzmGd9qrPyiGvA+yhjF5KqgOBZ8oPW+GbB+gVblMnGErhULg/E
	221UGW84U3xdJE6ZSCiVSnD2sPzwFQEOMdM2bEqR9cSnZaIO6WsSlzglIr66pYSY2RZi96HYMsg
	YWZFvQhH4b4UUgkIKwJ75VIi0l/60pKLCy6Q5nfks+dqD15+hLUfeN7ea8ukyjUZm60Jvff5w3a
	tbL8R1Kwb143JRr9wZgYVJrlDfuvuiPAjOivvYDkTNHNOlJqRgkjwwOr+zr+39Z5SbLTNOqjdm3
	6CDsP9oxK+CX6dH46/MpvwJ6bSA7TyveyoFQoWlMabtJDbedXuRxwm8Fe28LBqB7Z46L4/IODU+
	EToLiWvVUOZUvCvaxRn+qV4+NGANfRgBu4MwzZhG2SYdCD5xMqwU4DmLv
X-Received: by 2002:a05:6122:3293:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-5564ee8267amr1600194e0c.2.1760961752962;
        Mon, 20 Oct 2025 05:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExb3d7wrCskvILwjadrYZ35oU1mcZoo+ieMX1KAj9vst3Hy1cKTiA0tq+qNgeFvEo1O8fu3Q==
X-Received: by 2002:a05:6122:3293:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-5564ee8267amr1600161e0c.2.1760961752579;
        Mon, 20 Oct 2025 05:02:32 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036b2bsm790493166b.49.2025.10.20.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:02:31 -0700 (PDT)
Message-ID: <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Alexandre Messier <alex@me.ssier.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2Z/SBE/lCCZF
 7MN5i/gP1Ka/JSEhdq+b0gox1RSe70E/khd2kdvJ2txqbl66acClIOGXmtyS/hD784jvt4y8ib3
 1JWjOgM2GEPm/U1ElTMghoGRXuJ+b6eIqgF8BzupZg6o4mdYXT/yVPWx7X9faGczf8K0LPDzJZO
 rrTunff5DJaHQUSpR5eFykPCMs5onaGb48Bwi/UTkWriyRgPSlHcS4ApJu7VkPQXcw8uzifQ42j
 NPkmxEUp42HWmief0flk0nEiJ73LLY8KqDMRzdxHz+SGyIUfgUKbluPosCtAaEFohxzwXncYb5q
 7u06H6VRRb1grxOpe/d/zPnU2Ukh3KItSD+bjZtNapNlovyR4gOTk4KhGACG8X/mYS4lohzfFSV
 SznS7TC2qViKQi0q3xfXxlRfUZtT2A==
X-Proofpoint-GUID: a_UDAAdeIvCs9Il9ghw0m9CNWe7yxPaO
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f624d9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8poMKPHdAAAA:8 a=glctJ2XmOvm0yIQHyQsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-ORIG-GUID: a_UDAAdeIvCs9Il9ghw0m9CNWe7yxPaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_050244_063133_ED456F29 
X-CRM114-Status: GOOD (  18.96  )
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

On 10/12/25 8:03 AM, Alexandre Messier wrote:
> On 2025-10-07 06:03, Konrad Dybcio wrote:
>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>> From: Alexandre Messier <alex@me.ssier.org>
>>>
>>> Add support for the notification LEDs on the HTC One M8.
>>>
>>> Two LEDs are available, one amber and one green.
>>
>> Do they form a single notification led, or are they supposed
>> to act separately?
> 
> Good point, I had to check the phone user manual to confirm. Indeed, it is
> referred to as a one logical notification LED. It also mentions the color can
> be either green or orange, it does not mention using the combined color of
> the two LEDs.
> 
> So I would say they are supposed to act separately.
> 
> Hope this answers your question, and let me know if more details are needed.
> 
> BTW: I will be sending a V2 to update the color name, since the user
> manual says the color is orange, not amber.

Let's describe it as a single LED then:

multi-led {
        color = <LED_COLOR_ID_MULTI>; // notice it's not RGB
        function = LED_FUNCTION_STATUS;

        #address-cells = <1>;
        #size-cells = <0>;

        led@6 {
                reg = <6>;
                color = <LED_COLOR_ID_GREEN>;
        };

        led@7 {
                reg = <7>;
                color = <LED_COLOR_ID_ORANGE>;
        };
};

+ Pavel the LED maintainer, please take a look if you think it makes sense

Konrad

