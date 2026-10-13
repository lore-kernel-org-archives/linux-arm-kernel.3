Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F6CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=; b=2CrtTxQO/7vjHTFk7hu5CRvzDG
	1GULeo5SX58YAI5v2LR/I5ZfPxlze0w4kA6KzEfZPUe2GqpL1xCi6pvNYRAMwgZIxYkHsrkJkL7ck
	biEaN0KnUqk3dyW45DDognrfTqAhhtvz1h37o/UmlcgSHySV3IVeaetJf9vQ/+rIgAPuNGEFVY88B
	iURhdWwAx9a4QW9W1QfiIslnGHoPhM/YUmGb2k37gpcvoawto3NpcNQ9rv+MRVBIFEYZfzC9fYg/R
	3cmBV7mNlufq2oCVqaWyoXLEwkFDCGERcVEs/UttlIX0GnIa2EYAaNUQuST1n7zcL66jWcgbT20Vr
	quzjI5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdXl-0000000D6oq-0Le6;
	Tue, 13 Oct 2026 14:31:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdXh-0000000D6np-1j1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:31:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4UPI1298843
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=; b=WLZIH1D4gmyHOg/k
	cBYXf1jWGHJIcH9nlqKa/CSOjlWL6EDg0uiE6jPkwbcE2szL5VWIFy73EM8UDLdI
	Jkz8PVhdPQY2daA5dW2FHefgwewHjmh8PpVKN2aKgRQ/v/ObUCJSY8jwoN75aA08
	yw6tBPiJYpflQn+kXKugwDIjlU7OyrYDVWDG3ck7P0b0Cqs4uPkCORrC4iVlN/pm
	jqDoDj7eExStvPkiVWY2oE23F+oxOMIpK/PbYamPnvsNrvb3jk40vlq6b4ZXGkXw
	aOXpUnFV6JTuVgmg4OdpMM1TabUilDCXQthS/Y/68nALCHrizB1lF/WLEzIWpfWY
	07BOPg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqv1np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:31:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so3713814e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901907; x=1792506707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=ffPj2FqoN8+1x3nSRMtKoEao6DBg2Lk8CJuyLEXmwmGi0Upl81liv627JGcpZ/hc1c
         TFB0/VZNJi4MwOTizGsN7LWEOHqIuFq5hDPfkNVD9aRPIjiPBoMwHi8ZJT6X49PCaC6e
         oUlo0fYdKVeeMh7evaz6uEuxv7TjlMuQD/pGdGgFe5E+W9jjKDLZQgDYu2jMTXNez/ZD
         RKb4f1WLR9F1g6msAiJe00NT++Th/YlBFa9ZHLhof//tUE7PYwQc8tr+enxn25IsReHp
         Ve1I+uy3DYbQYg1Fb7gMVHksEkkXywlP4bdqmeQjA0RXwtAfRTwyynePq/PqxKcIebVb
         bVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901907; x=1792506707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=Je70QtsExU325rHH9QLSq0apWupBT9tfZPSGPL83SYpKR+H2OKCqG6f81iJUDi+uTb
         LYB4NAgcroIw8+s/HLPxLxw+2Nyg7HyPD0Q05tO6zvFghaDyxNr9YD300dC7kdgelSGa
         iXzatgan9Zb6cC53yq8qclza8Wto0bi0NG22qnP8MzHH3sgIhnFZNbPh8ZH4uMIQwE12
         XKXMzmh9coi6JY+eNbWnV5U5EZZYb5Aos+V3HwqD+4OeYdOjER4YZR/ue7OKgjrrMvEL
         rIucfDh+KXZZkVtO8tTMJECmd0bp0IEAU/Fg0EI6YmNYPrzmOUjtye47yVLwmerYgH/1
         srDw==
X-Forwarded-Encrypted: i=1; AKwUvByR3LAdgDEEeOd95hKeL1nxUn7U7jyIofI208iVRb9CJjOi/WTDXVorfF03yj7GvM6FpyxVyBDnnL8/A1GBKdLC@lists.infradead.org
X-Gm-Message-State: AFq9FYI1/Yl0aJKG3cgaRTs+pvt8hyqDqANHPQ2aoK1PtD4ZF8yGpibg
	H/I15GCmXhR0suSP6mka3Iv3lGh6GlAniOk3fve3Vve5YtNVmUpRycl1vouezDtFehn0K1NCbRt
	qALP/f24Nl1z8H9qwiz8sPY628vf7VlotjJgw6DN1ottKaNDpDwxz7qe9kCPdXgEO2CsXIPlAEK
	AotQ==
X-Gm-Gg: AYBFou2HxJ631kVBXRxZcdGYkFF0tA6cIMBdfL8MxW9MhBeiHYdRb+wvGUbtRjAQkRG
	qtOYlXJ1r4in9nbfrwhWB1rylfpCiDD5s5DDuDiHK/+ys3c4CDh7XPlsWtXVpauw1Ck90pvC3Xd
	K5WBmDfabrUJBzMRmQoAc0mRv/SgIKD5DYDYVW7qm4TipEtmqVXMd/oiI+/oRwJf76cX0O7F0rI
	9bYyRbfuF6d367UzfslcDRF1THM8fFjb4gEWc/T50za5EhWvib/aA8/fU6ecinjpPBRvEnMEJ7s
	nKLUGL597ahsxrAzoWbyydRb82f7e9v0Y3AVdqwiVIUTXBs/Ldj+0h/zoNlCGtOoAoXsABsFGnT
	TQQ9Z21LzhiEuWKpX
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248152e0c.10.1791901907064;
        Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248001e0c.10.1791901905853;
        Tue, 13 Oct 2026 07:31:45 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm401121635e9.14.2026.10.13.07.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX/0Z+jPKiOUpl
 428xtRweSM4HERDA3OEsY/bZ4CuV5Fp6aJjU0RHSkLn4jS2EJ92CWvV0DRIf7c0zOUIF6ZyEfRd
 o1PE1Uv2VnJPEz65MIas5Sy51AgquQ0j7UbuBs2DGtrHfaj4LNLxJ92DTB94Rb2+7J/Wf20yt3T
 yQM6ydetL3MCak4Nf+VaZJ/fdHrJij7dIgpTMfEwUUPO3ICXic85G2lRJU8yfmxa6xe1KLcHzDA
 eBSO5p2qo0UhBcDamM/g2OfGXPWYbMAJlRYXMWm/M+m1HPt8eKgrPlp6RDHMmSfdtV5mGIuYQc5
 YGNo673wgvZUdnSmvN4N4ZZdKz+Ue3AS00ej/FSr2PxP3EppW7ljy47wSQygv6OvVV+ztFIJjle
 AV7i4dNoHj0FUWqpkqgkOOzgK/pg/AwjJX77IK7J+t+aEyLua08uENie2FDepj4YXB/jQWss2/u
 vC0vVgZ1iQnubhZLtdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX8hpmKpRnCWOk
 hj7BPzLLuVvMgZjRHKjmUaAJP4c44riksqjUCVW1t4dIZNxRcUeWQeuwzfWu4vYjmDoMVzw/cOi
 +FBeliOdCjxTqllzaLMUKp18UPkiy4A=
X-Proofpoint-ORIG-GUID: cOeNGDWjzcu56rjutFUBmcEcIdpicpMS
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace40d3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GpSJM9idUVmPmik-TdoA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: cOeNGDWjzcu56rjutFUBmcEcIdpicpMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_073150_930786_F821DC23 
X-CRM114-Status: GOOD (  17.85  )
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

On 10/13/26 16:26, Tudor Ambarus wrote:
> 
> 
> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>> Hi Tudor,
> 
> Hi!
> 
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>
> 
> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
> 
> About the driver itself, I was about to send a v9, where I addressed
> some issues sashiko spotted. Do you prefer to drop everything and wait
> for my v9? Otherwise I can do incremental patches.
Well the v8 is in my tree since a while now and I'm about to send a PR. 
The patches can be dropped but the v9 will have to wait for the next 
release. If you want this v8 in, it depends on the sashiko report. Is it 
minor or major ?

