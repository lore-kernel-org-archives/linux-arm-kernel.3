Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=; b=hlWDXt4J+72XpX2gL2pGYwvcC9
	hsxJoaqHNG2fjHlOm2UUuzJqspc47gb2+X5IOgkOMnZY05Itsdbn/+0WiQAKIPX/vnhgCFPCqL6r3
	xxv1aRenUpEcy0cSTXBh0Iv5vYZmN0XN+9WlIeKIq//k6SbPPUA9F0+zmpyITJBaQxhEKKsw44KWh
	dRCZg9wVmV2GZMUsrS0xmc39KYyjESBOgPKOW3VvdTHw3a2fxfCeoxC/NlBzShx07vOXvAwNbornb
	tyN2zeKZ5yLTqFUJZs9ui60y9UOQ/VKXblGuuswhvxMLCECi2V2Orv9qWe1Bo0/oR+SoE6pq7CW31
	v3riIZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxHp-00000006CnX-3tul;
	Mon, 17 Aug 2026 13:21:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxHn-00000006Cmq-1jXS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:21:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6FKW1193821
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=; b=ilduPxHA0sBskZxW
	F72jyL5bIcSb5+4/z+0L7B/VrXJicmILlzbC6JdOK0E7qHK5yAPBSau8eYsJA4DI
	rpFbzunOHevAcun0cqaS1ZqfL6yeDkz/MoM/J4feC3TQEBmdA9BxXcCRmcg68JU8
	mpIh5pr5/AnbvwClxq7h+OA76TpRFXe7AesWUliQEIwLb5feV8eIQNNigEVZ8ivZ
	uexvATzARclHEnZPExaRrmhZubBBR34AWW26tG/p8WxEsRN5ai28/1j2nLa8Zy5g
	H+5HC+SmJg2N33E53LcDZB1WoRMFHTxFNtwqjrTgGYf2UbvwQnl7xQaL0i3Ndu5J
	B2YXHA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1ejv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:21:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c3e5b0d5abso45795e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972914; x=1787577714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=fqmTdchQ2JkH/HloCbJYwTB1tyxvisDUKJPRbGVHdNu+X8W+rnsBjC/Ct14I3eVZxk
         k92mOTw2lfZB++NqHxpwij1aSSfQ8H/53QFyGCUKgcbBCS4+nOyy0tPOWuhwa02zdcky
         F8PVXal4jOjePGLUYcgiHRxFuBMAMRBl3bcpjzjVLu0coKGZIraH5pIA+QiRjZJx+SYJ
         St/3ecrEZNbc6ZCPKgva19CwVHL3n+OZ0EY1qmDq4JtjdZ+Z54sheLKsfmOEi3lS/Qsc
         KDHdG7oRJ7Z43MAyYfelKkcGSowrghD0cZnaa3JFcKqi7NLykuUaBR78m/j+Iv00uwHY
         D1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972914; x=1787577714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=qu/IDWdkh0Lxl1/84k9t3zTAPONwfG0fR7rzQFQkO4uGAnx5YOUW8F73RQaV6MFLfF
         NZaZ8hTYxLvwBhWbqARwnSUili/N3R/JCjJIHKL9CqgVlko/3mJvXDYUVKeoH79E7FMr
         cwGcsnoLhaxtGgHVll0dRWEV9EbacrqjoLboss+n5WI2D8inViUK1PrCYtRY4LEtGQ4f
         Aqd2fVMD4JywHK/MWRQqFwYjlVUiPiD/R6sqyPdQpxxKoSTlqDgfPVbXrbwBOvyzvFwd
         Mid89kjbtRLKsMn7mumC2Fj2NWYSPrs1CXPvopuDMydGePejGpdb08TRONVorI+pj9vp
         mYRw==
X-Forwarded-Encrypted: i=1; AHgh+RqU7GEQj/xb3c9TDCjNm4n6frU0nMjvAH2hTvB+zsv3rnGyk04Y4ud4ioVOWS+dUead82Y0kUbEbP0YizeONW8z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Mp32/rIOPcTgwjD3ndnFl25m0VUYzHUo8MY+GjM5jbcmD+PA
	DgX/FmARznqp2MVkhvaXOx7usuyS9hUz6cX1S+529HYWaTDkEXsvne1EaA2j7XGblXYWnRL8hFs
	YA53XLoaaQbMC8zGroq92cKz9iEC4A/QmqImYRw6UiYsVIUCNNKpjJOr7pLOXS6pXgnFaHR6itG
	UcFg==
X-Gm-Gg: AR+sD11RAb//BbyBrnm40ircRnp8ohD/fKpcrHiTyAyXLmv0mwxF919r9ixiVIwp7lf
	eA5AxV6Ev+y4XH3xxIMD7Bhgk6eHUvYrx5lu8RwAwQYfkVB0rw460GNgJxVhKllwrWkHzHXg7Qj
	LHAqyYuBNEQPUpuiY7wqUAGa3TSj4jiLwpkWr2X+azjkmPrkZdziBVI+Ht9fKFg0s6qgK74LosG
	Aq8RutR5vzgsxQLZ1C4lPB8FR7v1iscMunwrigYGDRSfX8V9AXiNmuHa/2fSi+LDdUbYeqjbHY2
	or2YL+wBQsdBFJjt+wfk/YklPDnwwfqtBdy2P83IRBVzf0+umlMwR4rtc6wD2rVK3CIHKDj9ae7
	+432sF5WeVueGNSnZ9fvmHsU6
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610860137.1.1786972913704;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610848137.1.1786972913305;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm28129966b.50.2026.08.17.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:21:52 -0700 (PDT)
Message-ID: <97d391b2-4d8e-4141-a139-a41eeed7c6bc@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
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
 <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX/XEB9dQ5Q8Sq
 LL6gcO0YaE4Xo9bz1o9CvgiAOewaqqLx9tLiy6YVXJ5F/EnEN/Ax78L08bDRjbpvjhj7AMfPPw4
 XCq7J1XwlCigyVtBahRsldlnFNyDp31hnuAMwhbBy2fd9vc0EgAYB320mc9uywwbSuCuypAGeeY
 ZRhIwyaH3I5SHZqm7bC8XGH+JoQEM+jc+KWmrY23TuDS61gfAraA7VlNFeoV0bdOCT40aI3TmLk
 pUjaj6u2Gh2SBguZyxBkW2//2qCVIWW2MpOto9zyczaByybCAnIMM5J41DO88i9Uyhk7nGo++0i
 Ymf91i7NUGx8VXlz6+ILp4EwUqEQ6dGkYRRRp5HYxcfFetzWpfTbJVEu7LaTbgmNf/OOVte4uiq
 cTwFUA2u+RnltNWFk21rtm49N01h2ngK8/5ktlZ7vRtUPJLFu/TAaYZpAWixeQZ5sLCdxPIKAMn
 oqobOLEZEbzkeRsj9HA==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830af2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: BlAUk9u63gHKzhPdJ8TR99v0-bnzoRQB
X-Proofpoint-GUID: BlAUk9u63gHKzhPdJ8TR99v0-bnzoRQB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX7JZqW8v9EhWJ
 ezKVcXceEpU7EuQims2+l76EezF6UzdyxUkbMSn03Sy/nWsJ278+H3ZVnWZrvaQ1NhAzOvEo6Tj
 JKVS4w4Yw2upk3EGIpPy/KDwFKdhXz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_062155_576712_915D587A 
X-CRM114-Status: GOOD (  11.24  )
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

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

