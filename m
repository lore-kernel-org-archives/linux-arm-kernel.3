Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7782C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=; b=3fW2HdUGlCJEAVCujhG0z7Cnm3
	sIs8K6660TP3VpN+KdOHgiR9UHcAT3M2nEDPJLsesRIPaVKzcXybFpvGYolGdnhqZKPWbaNzRPkxt
	7ridqcksQZ81L53n10qYZ/vVD+X7M3ti9JV3hItL5EWtaDORIekPQl+hCPzX9ZqyhKYsU97qAqs0z
	awkH9FzsyoV3xdLrK0n8WVf/fw8e3QlEAT4qBU8kpBT9rE6IepGd2ETLwd9Um0L6SBIeaHwqMwubD
	9Msn0Jls+OdrExpoxhmFCx26bHuJlAFRqcPo02doDfsoG36Il/vqmMKV3EJzjjE6EUD0iRsAzUHSa
	J3wUn6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7s0-00000004dLd-1G8q;
	Fri, 10 Jul 2026 09:50:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7ry-00000004dKj-23b1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:50:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWwV4194177
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=; b=JHrwiu57lKFsthki
	zJsUoa4pfGAq060Xsu7cyupua7vkdqYsyEDZeAMi2JxfUillZIqDvrg35sYqzR1m
	1+eg7gKKaI/mhpgfZ1+ve0M9sSowsViWDYtopvD9Pmw6yYvqRO0zap2eEt/mVbB+
	LTqGHDrcuT71adZduGExIL6++LhcpQ3jN00R891x/ROiCowZtAbEyz9zK+IZd9bf
	WDVpOO3R3gsq3iAfVfG1mU3bbGAdvnW4+LXMkxuYkgqzoG4rGnUhbbn8ABj3YWbp
	2Qz9le3nxTAhoFMEVd02EojzhuVkk1tRa4DUzbRxfSFBPOlIbfmW+XjwqkMqAQ5n
	gPOC0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24upgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:50:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so2118191cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677005; x=1784281805; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=VKbhw0EEKE7pAbrI36ValaSkmZH1sLl6qfrEkz0IwA1wAvJrAqP+AliTNSJ2tbDKC6
         Q5wW2RsAqWZ9lk9cI8/3zRun66Qhg56xvNAXPwWng3n5fY4v1btnuZAy0H8Nqqw5OFCC
         6mffXN0kKFJbzHpqOwj4IKy2UTzOhuSJf8Qk80Nv6baYBNOvekggsrbNk5xZh7tOc99B
         Jgw7yPfWLSYweeJrsog0Psx9PUbiYk6P/2XQ7GR8PbbS0McTU2q4DPE/n8/yJfliFomJ
         5xlzVYghGPcMwsxhRilrVenCi9e0jzrNxUvJS4wE8LjF5iEvY/32DKrQtaOJITKm4rbU
         rSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677005; x=1784281805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=fuGzXxnqbWctU+QYZdX/2dLlEv+d9WpyH08lwNOLug0klXwibQ5FOUYTIffsgvXYdy
         qgkj9VQDmxbXlww64KCvx111tfEDykREw9LhF0ARHJLIKp99ZkoLXeMKXQnudlj+5SjY
         VI42fXc6nPtZFvo4j7WLaYIoIyUR70BtcfHFe/ZxOqbmeuouwN6BKU87TXw9cZLllshH
         X9pZ1mj1w7q1RGFfW5LgAt7bjElcDGd06j0l1jNPntJsRHUmS27zdlf1BlnVVuzQM1tU
         qXEo80BRgJPsdbfDQABEyEqXNbr0LTUZP1WwlsC2Y3Zry4Ck0hqmy0iuClfoZDFk5GSg
         mhLA==
X-Forwarded-Encrypted: i=1; AHgh+RrfFf7zr77urwkL0Oyiip6UmBfWGDGylbu+UbPdgUnWsoy5vWNZ8SsfceXjOmpz8t5aZLC9r49X6MFd/EniI21/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0cye2cyeY+8k3eZP3Q6Ba+Gu4QoKDrZFS48tK5SbMt+yKpFsA
	EfzgfP7g9Ag7pJvLXPOCW3cWRJkvtvmamE+I0VuT4fLSINpPgiamB5lO5cs1sMKYB2SkdasUar0
	De+qkkV6W30FoJbBHxdVKfDdujZUSLN2hVbIob+SBoWwAsSA7XAKDWfre/dxSfztgbe/+2da5sO
	q4zA==
X-Gm-Gg: AfdE7clAEOEklGVPHueX1fEaQXLYdMf3SFbue/5ldiAQ7IlSZdGsSznaTsF8JCvEdm2
	UOco38r/BZaqCInVJq/B3FR8XgYP7KAs0zfR9ETdk1CglxpMpx4lpITc1dmjd5XiI2S6IeS6oud
	uP52nRBGuM6ThcEK0geuw5iwhcFKIlIOl0bRWKZ/mw8rIupEe6GjlA3zyVpldQQ+LiuEvfgtibJ
	skcAgkzwwRrcXmhkqE7HiASL/DidKyXpFGKunc4zaQEQT3YSfZnl3UvR8WiP0S+6zepjZOBOxlD
	mrmuwH0TaykXHYcg4VDX/UpbOSg1AuxLFKY8mZ/VBzTmchyVnpTpxCd1k7dVcJOTtZMuwYzCh+2
	ngw8P8hHKOhurrg2YOhfrx/NMeTpoAChwp5I=
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466801cf.6.1783677004708;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466581cf.6.1783677004229;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:02 -0700 (PDT)
Message-ID: <8870479a-7ff9-40cf-8298-1cfb98d1b896@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
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
 <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CDjetwxOyJYCBtvUOWmA40TehmQnJjJu
X-Proofpoint-ORIG-GUID: CDjetwxOyJYCBtvUOWmA40TehmQnJjJu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX1ZHMD1ftTY3+
 xPTLMzec06SKxO4I8MoskLOfa7xr2vHNKkUzNiSnU1K/0IF6EXb1i236FFIM0R3mGNuOLySeqrW
 vF2Pv0lugEKMioIb5KdiGPjFymPwZaA=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c04d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX9nvPfdKnb7bt
 VHupXcw9n2l+ZH0ZMlephrY4PJHcs1yKbOshQzLMNj8o3smizAlpXaLTDLFb+KEhsTeTHKYADhp
 wO65vjlJNFfFeJK4hwwGNQVfdAnhOqxNRZk5oXefAdTEZ/UUtT3EetbV4W/vQHwY6mIIa6VI6my
 1ytuQ2EOHPbRMardxYag09twKxPn+UYgukFsr3HtQ23xX90Sg84Eh/PttL052YbeAK894amBv26
 yMXrsMGA3JYtUwdJ3kjWop6jifLmibbNBy5z9pM5VGtMACrnnyneeCkZzhw6UsjgmCcyoNgzk6m
 wYfneSYDkawbIjR844brj82vlp03uJ5hux676BVVVawD/dq11V10mQlFbHSyXnfpAYo6synBWUA
 r9A2ZT46W5PSZ2A7JW7le6YhoiR5aiKPzyzBIWDIl+Lh+dOinS10RQncXF2ulg5cfHgVkfFrmsh
 5hiERNce2Sn2hPm6Tog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_025006_683395_83DD7ABA 
X-CRM114-Status: GOOD (  17.14  )
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
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

