Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=; b=CvWUlPW59/qLtDtSt0ZUU3wFqn
	huEa34D2/4RfAz0wZZQMx/9RXCbRl0YO8R9GwpmWwWAc57/J6cnZ+ehf/xSEVaTIeJARn0VJ8oEax
	AxKvIQVisKb5OpdnSyQ1v1IshqsjIj0rcHkC+73Z6QwowGmUcuEe56we4NLvpaQ0wf6gpB+EgiecQ
	uyrnu8rK3H1ciuXnJnjmBId4ZT+jDEUyXBF7jV62T7utZ8KSVFD7Q5tVKw/vqQmiMB2eVpxcl6LZa
	rZVA44oY0iDY3IXvGMVgEBFAyMhW+Nsbg0D1Mxtl/x5M6cNAiiy2f04G+hxchz5q88bYMVibMC79M
	SoTwXa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7ru-00000004dJS-0hn8;
	Fri, 10 Jul 2026 09:50:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7rq-00000004dIZ-3che
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:50:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dqrY183375
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=; b=EzljRyu9CKZgoWSZ
	9zKxxekBkvBCOONa3+P1NI0uyR8++doKqAeNC5kNco7k9ru0twSsNkhxUf2bjcKx
	zkJrdfwnuzvJEUxjnqRg+40VsEOMTJ5fbkGcba6Hxmv/4z8k9/iGxV18bZhuvh8X
	AfAiFcxzZZxG/QroPJPIgERYD4Pp2WR2fAIlr0iyEbu7SQaYdma3RxJWyV6CASfj
	9SH50yrTlETaFgnrz8fKsWbhO72bdBclhUWk4nijCHdMyMj1pagwu+42CsfO4hWl
	VXK/oBhAthqIRb8bjKO1it9KBfxtawLUD9ImCEjIbvWV1ywseMqi+YSicvvx3+FB
	/ihVUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2gka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:49:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2321566d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783676997; x=1784281797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=e4GVy5gAi/O82lLqE8c/4k81yTsKfOyPJIzgKkqXD5C3UCqA7rmBAE9CFCMWoWMLRD
         KBbjXeHi/YhXtHVq+/dK2nCdBFb/WrHVTxIu1uml27np9BBLqBGlgxnp3hjTWLEZN0Fo
         1wOz+S4q69vQORg76r4UlIIznTjnWmPzFvgxPgd7g8a8fq5KkdEwQvUSj/L65EvYtB9X
         xRi8r34ZJ31s4olFaDq+RncN8ebrVGpasLMPPXG5wBtix8NxH8cqkxp5IM2bH5KYYD8H
         fiYo9s/PDPNEIc9dzNexesuXiJlK7drZkn7CAQbm2WQfxTZi/DpNUPUShKqjDXExyT0O
         B7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676997; x=1784281797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=EcaMJc47/8We/wtKrkXwxwMtKN/45onlLsAfSetxMJ0F8kMcF9H7Q0/gbAkHNW+Oub
         /t6c9qt0Z9+v5sjfdb5LU5oVQT8dpRU5w1ZRCabjYpr27V5v9AjzDHce12Zg19sb0v8e
         p7Gwx6nOmQrkkWKXn4mzWOhSOPLRIjc+hjjLbx1WR8BLAlolyOC/PiUv8n7rUk78HxpD
         d2s/cti2hd16Lr7XJbsDEOjUbynxA4P5BFbKX4I+XNQhpksnM5Ux8iAh+LGOPRopNYu7
         8wm7kPsTX4yXwwCS317ddTOIbe6tdr3p3Yt2v8bCOq8ii5DdsKFLFvSuedNdzAGmQtAk
         9UlA==
X-Forwarded-Encrypted: i=1; AHgh+RoC3CAl8kgBoatYwCFhOTI/v4zD239WhaHnAbhz4HZoVSibOdnRkvfhNfzY40lzJcQ1Bh3CGDTcC4WWxp2PSnO/@lists.infradead.org
X-Gm-Message-State: AOJu0YzbtE4Tf+2iS3yym7Ww18il3xY7hO+hAHiy8a7TqNsbv93sbQ2H
	isfr4CcAEmEnG2D3+9pKZGIR/fu1hFV92kvjYni5CI0NBikikVc6bVfLKy8kraQ/piHdpNQCS0m
	1/VHUnRnF8QeyOnnt9riY0bMKj9cpIWFB/WjnYDQ2xtyZ40VlsjqxyOchm5OBGyOIElfaJeI0z6
	1Rtg==
X-Gm-Gg: AfdE7ckekuqvFItHghZfEmnbXishi3c/FqxiZx2MZ5bS8bEZ04x4FxttTT4+SYZTfQm
	e5K/1yHaZyUuh7K6xw+Q/PTB01yev0PsehOMykBOMoLmuX/O2K93Tdpj/wIOh7+blIbS1030iBf
	mnZ2jcsxgeGpUAHNIMVWNl9UVp4ygU7gKhUm2NiC17mnJKhS6efU2EfIYNQu2g/5sm1h9wSJ5xt
	3wGViW5HQJLM/fJbkjPHmrXFwKuVH9gqKLnlPPYn2Jt+tzhq77X877007jYY/f/FptGneRYW272
	+tudjMD3MU2UYEXZYww+zGmd+FlsBQArTrawTo1eFlG6g2ZMgxP2gIEs86rb6ecmXRj1mtoTxOd
	euAqEoa7psRce+8CfiilgFS5HG1bI6HJ9/GE=
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167776d6.10.1783676997308;
        Fri, 10 Jul 2026 02:49:57 -0700 (PDT)
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167556d6.10.1783676996924;
        Fri, 10 Jul 2026 02:49:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:49:55 -0700 (PDT)
Message-ID: <298bd947-6957-4a04-afb3-a6394f05a506@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EtNFOnubi81J6G2mPRAf7rGrnuYf09mW
X-Proofpoint-ORIG-GUID: EtNFOnubi81J6G2mPRAf7rGrnuYf09mW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfXyFqSXwnynTZw
 Oy8hJVAxmW0qWdzf8mL/2EJ0wu7sTAeGWB0umXJZxQ4HaqAsSpMh61X/43TVFZb9LMg4T2LZmsg
 dC+ai20K6+VFh4WJ3FY59UGwsj4PxYmPlk6koQDYeUPFZYTPmIP69DcWbKwxGBj0DOM5t7bEHOS
 3hIW37tk/PagGMewwvr8EZ46Qz73XtN2bxsHVYmPYiBu26rVFMRjLrNsRBIn/iUzw5Nb/5lFLgN
 J9OZIo22CFwfzd0y7x3X2NDMiSplofe8/5a3htLjP7t71iQPvTu86npNUrv5m3AL/rEEJeT/jbW
 aOQMKe4btKDR8gyeDEW1xqAcRTtsdy/2qsPRjYCQZGmk7kPjc01nN7LkuJ9dYfQ0T0mcXRgqRlm
 uwXhTPVA7m4KD/YE3eqQwgj0zmQAvGsef7SLp5jH+u85+EhMNOIN3hlEyYz0FOyseDs4Vv64Z5E
 z6DRyjZ5+Sol84cEujQ==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50c046 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfXxOZJ1N1RhA5f
 iAhELNSkPp0fCMfj6bt3NaKHefgzEsAfgK4TiehCuG7I4ucFZpo5WmccFdDNu/ENCvYX2i3CwU4
 Q8c+UWIU+1heLmIu6fcpxVkEOoFSnUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_024958_939996_F6DD5418 
X-CRM114-Status: GOOD (  16.57  )
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

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The traceNoC exposes the CID registers, but the Component ID
> value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID, so the match never succeeds, the AMBA probe fails, and the
> device is left stuck in deferred probe indefinitely.
> 
> Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
> compatible, which binds via the platform driver by compatible string and
> does not rely on the component ID register at all. This lets the device
> probe on hardware that does not return a valid CID, while remaining an
> Aggregator TNOC that retains ATID functionality.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

