Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAF5FF4959
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=; b=v846JSGQ40COPUD5lAkuk6iOtv
	QoP5qx9X0KAL/In51qDp0Xi3ezFqIgoGA7/FRzrTwolbq/IMywkKAHQKlaYoBImXxhFQ9RRwxSKUB
	5FVvP9XjxZm06y7Q30meFxDJdDVAPuTIhV4XY/66IGck6EOWut98yl/ZJ8YZI20nvL6Dpox6zR6to
	LemgNj6obunwNiAKMxYQdUB7tyL6W3U1x/KRhbj7S2XSWIgTXssiDvj8DR4NqWIX07mO9t7hhTgXP
	rH7ZWgVx0SRHe7IYhCC7vpmBOq2KgYdw5A7ZmRLr5/zJHT3bUIFqccL6qg5KAuigEHQEahJGvZhHL
	vryNqXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Zn-0000000Ao11-16rD;
	Mon, 30 Mar 2026 08:02:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Zi-0000000Ao0g-2fcg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:02:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7X3rJ1375183
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=; b=lZV/YVhjVeXylJ8p
	rmaXgDctrQdalH984eJNIp9N2rSOWVaN5XXh5Bnr3XHhyJIsCqDUuTm2j67iC806
	Hf1yUoSbruXVRDbSG6WYX6fT6GmIDy7F4InwPMBnBbhofUOojjR+7Qy5YSHIR83s
	gD+q1bzb3yjQC7cp/oroFPjDC+TnQBkFPOOyl5lQyy5fooDErRVOMCvrczS5RWcx
	bZLOqjHqQ0aYP8TSW8Dvh+WTrYU6z5bjv9KaSHpOu94Q37DguVbQSVYi7KUdKMR2
	kU/f5QmKl4vj8LzhTugLvpl1RT4jFKLoKxfYQ3y616z9aeTkZnwkgKGoFuZZsanS
	9ATiow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677153k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:02:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b878a8c07so84631671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857737; x=1775462537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=G0uzmPdV4YcVAuiZoMJ4e5vh8lwL1kSciOa9zkRvCS/if/yoLR9J7vLNOyBRfB1SOp
         cFNj1AfIh34LdEjT0R5ykj0jzduOiJm0d6d+0WkVUosu3wXEWaWN1v1W2134SIYvXRIn
         hB6CtsU9YZxEd2aEO4ayPfc1siRQi5aPAxsKWTk5vmLXbtk8GUL8U9EQKi1w33C+5ApH
         XorEXRnyydBGAJAyqlBVeqm4atjVZPEunmbzhDcb05pe0IbqfdFAeI44FyvZlizmFRiT
         SlG0yi40jV2HS2KRmQPSmBddiaibKPKl3ac8UCnJJDKemk1XGuSmaT838GM6q4JAWJJp
         sx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857737; x=1775462537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=KI/aJtu9HZX8d8UrHw4ozuYxzMWLaa4t0gXYIrYq5P6VkQCr+B2OR0ESV6qPV7AeVn
         M8GpoSF8SKoxzdK6wW1EXGbP0eU/sWUiCRXLiH6ePBeMsLl3URAGvwIFtiJIc8kbo0b1
         QbSdMuWlJTZM/ejuYbUjyUGdp6LPIai80exApGOLKB+W4n900y5otduuXE0RnLcZWs2r
         pxTnbjXnkIy6hiGmTht+t6IHHPgC1Iy4u3N9l6ktryMnGNE5utX6UuXo93oCXImy8I8D
         m1SBUhKdiZt9IO3jfV3oFSZGtJK9Me/nydkCXBu/YVORWiu0r5/6XmlPLnmWHNOR/NVI
         Q2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRyAIEgiNi87M0EalHVnqJHPDwO8bgMYFva+pmpj35xQKHDupwS4Qc9CyqYq+0lU2NqI8Bnvble9ecraiotp5H@lists.infradead.org
X-Gm-Message-State: AOJu0YzAujGNcjugTEvxfNcAJs+aIIQC708uxOm2UFBEDW6xpHrg6wQ7
	atlJCIHNphiy7fpOe875xiFB44jT1nY6qMMxAWA8Gb1qWetvq4UqpQVuiB8M3zXurcLUklT9FrU
	XeXkHnRPVzE57dHUCYs73fwhBKJxv1IS3sILqPhNTFDvq6HoTrkfgS3dklZSSYNlQo+zHafy0Q4
	dB6w==
X-Gm-Gg: ATEYQzxX2djecboVYPWxB73sTzc0cuThBrO6BF7YLpI6yjpwx5N8hB24SCX2yaia4Fc
	S1ul7rKUkrWWfXdkFPVjgNNxmlSIIEgudZEyV7AaV46PLqbQa5zIzsBJl7+gS1jKMpgXTIRNydn
	3D5nxugq/Em93e1XyqgF4CrQ+fQnaG8BAl784h6FgucE77oc/Ryy2RU6vo7md5kB/0445ifn83J
	1HcQpXQYTJsthbsH5OMv6voBkmbTfgPbf1jwqBbUQZUg6g1hJbUsdapfG5S92y3B7fL4uYrkl7o
	Idw+EqClQAU5y9Ib+skk1CHZeyI7eIhhxMZZG/ZUaPmY3hpnDUnFxZEWaLKcQgT0WeS4gC6qwjg
	BezKdkefHmrWMPq6hDDiBUH/GvZIlkyUx7PLnvxdgjvJQfacO0I4us+EEq7Dqzf4njhES+jAYhH
	CZJk7mJMfj
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131421cf.30.1774857736830;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131051cf.30.1774857736352;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1675:c176:3ec0:ea8b? ([2a05:6e02:1041:c10:1675:c176:3ec0:ea8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873068858bsm153678045e9.9.2026.03.30.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:02:15 -0700 (PDT)
Message-ID: <6391971a-46bd-4ca2-b629-be0b02e48481@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org,
        conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        soc@lists.linux.dev, daniel.baluta@nxp.com, simona.toaca@nxp.com,
        d-gole@ti.com, m-chawdhry@ti.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
 <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 29mLOQQGSokkm3zr4N9wIE7iKgdjiWCG
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca2e09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=a0Vft8LJKfaWkH7qTSoA:9 a=QEXdDO2ut3YA:10 a=nnjH-3LFHp4A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 29mLOQQGSokkm3zr4N9wIE7iKgdjiWCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MiBTYWx0ZWRfX5ml1y/uJjDwQ
 YviTyMz6dfC+ujDJhfZc5Wrop88hkYfAiik8i2owuAmrC1HNhot8Yn6PrKUEdAU+nXSHcCxojFY
 IlK2yw+9HJFO9HE4y0kvsm7YxrTdViQzU3xM5uYKr8GsO3LHRMOhFxfCIu45SknFIpg83cp89bl
 p/3TUMuuInrR2ngwcy86pUntW9BLV1U1IX+mKQ4UxCJ2xmL19QWl6lAEOnya22+1XwW8R9p4tqG
 K3q6ADFSC7xl5WhL1l3x73RHrSFs4xXNuNhDWPVcA6wG+9Z8kyLPNgm4U5ho6fDGyfFKb5G/AUf
 enTuzPSTRCRbUPpCWVv75QDTn0ZO53bi8pNDChiRWxJA54DS29vO7r2CQGdOVBBTH5U08WJSxrT
 2zjDOXiXGkn2sf3k4YcD78Vp8PUHdlleT92gnzatPwA5AKjru/OxPZXMKIusi05i6/+3gU1ISor
 5R2tZwueIgdRTSyyXrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_010218_708286_5ED6A4CA 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On 3/29/26 14:34, Gopi Krishna Menon wrote:
> Convert the SPEAr Thermal Sensor bindings to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Applied patch 1/2,

Thanks

