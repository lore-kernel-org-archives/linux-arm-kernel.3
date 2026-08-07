Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6249EC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 02:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=; b=LdXZCaXHFcJGF2djCXXdVp7kWL
	lZ9Cx17yImcffuLt1gz6AWOUazG46T31sv4b25JapZeHBX2B5uGCfTCSD1VeQRXKndIexHCLUerGt
	wnmYEmOhy46TiMkz0bfcu6H8B8ZXZiXi7fFBj58L7mw/Pkw5qO3HGSiaBS1Z3mfLUbSv9q5CQSSJL
	asHKfdLs66sSq8/HBhp0PGIN6tZ2/rw+qHgWWLpdhu7ddY1Wc5w3mNhcUReGu8z2XbTLZj6SyEPse
	7JTQLsakfkDz0uH4Tpbf7e97r8J1jAMWXxfw2F8uUH5bxHD6hPMo+3IDQgPrrKOd2j1BLsvUEVMPg
	zbn4uYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAPk-00000006zSB-39tZ;
	Fri, 07 Aug 2026 02:34:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAPi-00000006zRK-1jux
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 02:34:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GwlM3829443
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 02:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=; b=AoVUPr/KMBCJWVge
	qjJSDEs1VQYikwckSmo7dfD9rW9exsurvTREmlIY/goqwA3EpvD6QjXkEEbNFLf+
	IVCkf62Zcl6gCQGgLwbivuGOQ6g+tUElaqeAt9H3ihgavJ8m1eu5eguyJTOyGBPC
	RIE7H2c8mDtuceV+a/Bqv26NgznSEsxSmsC5ngZwBZ92keCGplQfZwvXsL6k1ZBd
	gQ7KnvSjvFetFxuB7ulCTyFVfvFX8x/wyTgzT0J8zer/hWV3+VRxSmQM9RuuU1M9
	mSBWDF6Rjq9NsadiuAtO61EjskxftmFLDPBict7DeqZJb3OGRuwd2RTvPAXw2lkx
	hQILAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gsw8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:34:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso31390131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786070065; x=1786674865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=JOYU5hchrPYV/7UvUOniWiNv/fpKHzezuEgDYqIn0MNP0g41q8GMyOeTwqw0Cw35dy
         GkEJ/gQoyERR4N2ixWzNpD6xyTOoxh+deS1DfCpio+YN1exYdMP6SAAbLc17wzysdV9z
         4Vm7qbxmkehtDIs2uqCWTZzdwLLTrIfsgxYb19do+pev7ZxfRe8tK2pRaOafwMOm02IH
         vP89xjy9gDi/sLvKvGx6uIwBrYYHOKOWmHubTOPSSUvnWnTQZyld2S2zYFR5qt/eDwh1
         /tXviRzdXXvKeEC4yD2MND/hlhZQpsRT1sfrr8E+SUuqnsT6TEAtDh+8ejH9vvUYNXH9
         GvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786070065; x=1786674865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=YkTtX77cTGhv11N/F02xU48uxLmOqcI7cIqwAlmFCyACa/wPPM1bfZ/i/XxWlCfI7C
         h4e2q4qF34h0ZRilMSwCD30we0Vv7n9T+uayTToId/Gl66OZH8t+tPURExFi3LbStC/e
         NDNwN8dLiMJUGoJZSSiuC712/hd8zXbmlZ4no/heTja3ColYz99H608fi/Ux5TFwkEiy
         XaKVgdZCrGGAzKzXvtaXjfyTBmNElQno8W5/uwPSgP3LY/v2qNAZAC03UKLeYwd9iaSm
         +aTPZr0EDngimTPEhM8C0MYU7W0TD44xxmOeKu6xeQRCSz4wrxHgzGnpXCVUuFXdmcjS
         d2Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqQJUVsOKG/q2d136nibuwPdI+qzO9txTV9tBK0Ov2vOMkJVQ8A3BCjTaaapperTt+MI0JW5w6wYUyi9X1Hu1pd@lists.infradead.org
X-Gm-Message-State: AOJu0YzBsrxbM9KH6LDW3hnB4a+0+OABnt2y1wRGOY/01bjZE2y5jDZ5
	AQIYzde7is5w3wtVUcLvx77f540Agwuq5FzqrR8dz/7V0HM3bANIcfQsBRPG5JMHKapa78SKLCc
	vLJ1FJwUuJTnkOKds8IWWQ/GwoZLin15kItKpvblmyGVo3mpbfaQ7ytcWA8sobeI3iCssQ9hoLJ
	ellQ==
X-Gm-Gg: AR+sD10ZPXSlDrEa7FS3onFx26AC4wMN1qYaPr1dIPgrj1pFtwSl5AnkNzxpnuqauwU
	Pncag/JWdCKYE5ZUmnmoSDP7fGouOS02thG8eqo+t9hRxusHzD66ArsztxO6RqVyYrgmFaSDg9Z
	XaMSyhUYd7gArpLOR2KUbiECRphCGs/aqIA2xX+feiQuyC1h4aAGbVMwV/pJsXIDxtt+/g7Hol0
	Acue8RCjWWItdbgJcxSbKjykdGdEZgW8MmAybz1cx6qx5m4P1xSGAsNeABCWpOkki+X++5im0xJ
	heyyFrMas+nKPMC8JM5Fr2KwT850vkpn8fwYeI82c00RA9T019fjKbi+J8pBMDkduV6m0JXh0rv
	ts6O/tA+cdA3aJ1VN/4yyTwFBAdAGp0Yj3NphWOL5CBaOKQ==
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913651cf.3.1786070064616;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913241cf.3.1786070064134;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a4dcsm113421675e9.11.2026.08.06.19.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:34:21 -0700 (PDT)
Message-ID: <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 04:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a754431 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a7QxK27D7g-TA8La783Z30nAjg86imb9
X-Proofpoint-ORIG-GUID: a7QxK27D7g-TA8La783Z30nAjg86imb9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfX6SHYAurcb8o6
 bJXq+SI4gh4xjPUPyZigJRdW9sJ8BttvER7hN1EuMDRVsxFjLqAP4noYATQvx2GuzT6egJZM13w
 q9NCOJYvezP8XDzYxyLFSU7Rz1PQA5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfX9zoyIO9ii9L6
 M5S7vLvPY1IwKlxFemDmQhmk1ZtPHpWLKx+K1buFdkETboWyZS9r582/5GsmON8mD9pUAnazn45
 C+7SpUPg3qQIpQaj2pISGY6bPWKuEttNIWPbkF+1c773ssrIwvk0TmxgoilLDHQoJSmEGTm8Tax
 6OPiRwo3oLpQy0yoyNq3MuzrzPC4Jsg2Cl6Uh27sxwNaPcV10ULzNmTayD2ugolGY2Te5/ezCKd
 LmOCpWmPViFStQYKtPs0R1QELoV3KkHVe5sL/vIjyzXmUpOfxzZQC0CG4zbQcWkZLD/A2/DZUg+
 P2FgCorpRZIH3MqdLYj+a/3xO5HyMp+cQbrleschjv/S/iORPSW2oAdwCrRZUrkNpJ6MBuusRjw
 3J1dAVfVom+0+44j/dQSm3WDAse6moG/Q7Z+5L3ySoj5hdvRB3Iz/d5DC2zlP8NltD9dMLg9vdF
 4xorlszEoBug2dbp+Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_193426_560726_F13FF0C8 
X-CRM114-Status: GOOD (  12.66  )
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

On 8/5/26 10:06, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, levels[] and nlevels),
> as new MCUs need different values.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

  * Through which tree this patch should go ? (assuming there is a 
dependency on other patches)

  * How this will behave with 100 levels with the step wise governor ? 
For a 100ms passive delay and 100 states, it will take 10s before 
reaching the full speed

