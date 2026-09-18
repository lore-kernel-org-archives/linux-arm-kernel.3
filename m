Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532EFC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=mGdW+39qtC7TatuYkAYTk8BGTx
	pYByuEQRiMKNZPlXs+ePxnnmUEh5POkLJOstzWVvnZwtx+rufhWAtsm4Ki7BhalfDZYdHy9ek55tM
	z1aeS0PlcM7NvBjE8U/nzmFqjUj+Qotm/VNW3yZMXRRE+6dPxm+B87N7tqqaoB5Cv1yXuLC7mBC/A
	wRyMX5gZ58UizYcazC101B21yGecOAqvU/Bmt/Gr9k8WeZKhLQ36Gg/tld4grHDZtPo8MLWSpQAiL
	jrX3cDFl0FN6GvTRSz+Ovi7JC5epsGPpw/9pqGWYs21QYn3xSJX7+AApGZtdiBqSXQFugDq/VNwPY
	Jo/0895w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ue4-0000000Du71-48FW;
	Fri, 18 Sep 2026 09:12:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ue3-0000000Du67-06Wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:12:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xwD93254919
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=UCVq0oo8hh3zpuNN
	YkqNqbz3333d1T73kirv80Sdf81VJxW51udbIcADdlqdimOPwFrBroXRMNZmCa76
	kAeBZfibEQL0ApMCmDR5Yli8Eb+1FTGBUYooe/kIfRqwteQSs/Q9Kkw/lOQPmJcC
	P3C8IMJkP61fVh4FHZ2v/Dm7Wj+kidskCGgUH9uRCWb5JOlb7RmHS3xb+JwgGWeI
	Gp1UtYJuSXW/GoRn0ybRNCpk0pyvklL31mHpqb48WnvgoievVWUZysFa0eqKW9nD
	JzzYetzT3VYrkLgMM2DHhuCBz2nVo11zppWkJAlEXh3mCCNygH+p1RyoFvOwI4V3
	gMIuqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kdgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:12:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso74603285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722753; x=1790327553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=Jvau5ehBwudwAJcdxWeGM6ZOWF7abXZrtmItJ1XVg4WQapLqrs7K+aAVfxqqd1OaH/
         6/di/j7geEYihlqIqiPV+iwD0EkcAB4/wYz7Mw1Q414ZWxStbZ6d2+bICUkCHfrkRwDp
         C7z+fxcudKCc4KTWLcGpEsYyAIebv+epkb03tkDca3I9AiOK6g8XSmypygPI+GjD3eNb
         FmnFUFKsBAcrrS0GL3UhDJUWgGUTufzwBGPDc2pHffF+CVvG1pgPjZR7BRJx+K7UuHhb
         uvnWQVl0b+od2Ls1P8Fg6K3DhNiJe813n/t668ZTOPiHUjjjJ75AgdHt46DVYhCCDSuw
         GPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722753; x=1790327553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=VJEyPZds3ZbADM1Qi1Bsut7VG6hAOrQL9VOY8EgQvvdcNjm0MEp4Yu1pVOVda0WjQI
         z95aG3f/ojTM1bgCah1oee+XLzj4p4KwQ4FR63R6jyMfNcjevtV+jAFmuPYiIHrikMsw
         0t3OMhr9ykwzS07SNJJ7IyZoYwBgJPwNDe90BaEBNA6915qgWkFh+RszeGtyEUMokQOE
         67P7bFFdi+9foR/llSRYCJlcAsgwK8QvPbUlBJnu1XZPMiTU1WcO/JX++UyDyM2BqeVk
         TCOsJ2lLw/yj+4Eb7R82aKpvE65CPX+rBN9q8LqcUh8hRFRGZ93Ryd3AHAKFxK5P6aaJ
         pB2g==
X-Forwarded-Encrypted: i=1; AKwUvBxn0UbR1Xzs/y0JysOiXpxEa90lUfLPh15+CWxgqoQ8WZbMil8ddZViw2Ndt3dA9+X6e7x3Be1/Eip4nv/vtHj+@lists.infradead.org
X-Gm-Message-State: AFuF++my9qR5JWbqQAGP76hBnW5IaR41skb7U9dnRQ0QilzGA0Nt00jY
	7aZG4gJgMP4hN0GTivFF75Fhe1Z/0HccBgB0tys7Lx32JbhpfMfJ+1YmuCSLhlYGrttAXTJvfeM
	XZhKfQf5d7G9xgpjoTjsUDkd3yAsMDh2VW0BbUBoQVCl8hlmNAwylHHhrEVp5Jrw+SV+on7WmHS
	xDMA==
X-Gm-Gg: AYBFou3P6JgRdmJ6uMTIOICu4gML2UY7wVj3CD+nz1mRDyrYOJ7VqbmXMDSM7iBF1jJ
	oKD/wNpvgfqSG3UnMC4gGZWI3Dn3FMcuK8NSzIaBBE0A75am5CnFJ/Z4jlDSF2h1EHH4BD7miUy
	jpyDAojWvJ0ryZOYCq3EMz8r9bqwFnnrm7wH7Yd0d+TLWmUstwx9aFxFhMdn98BuF9m7QUGaG70
	gWdHTdYUsgiEK6D9kYX2d9fayZQ5KWssPcRjQoUdty9JK20draywuRqow2WthMOLYuVtv/nSx40
	PcS4nTYlxR1DK+gFURvOLgeZta0/XPstUerN0xlG1K0unPTJPnSdStDm5bUu6bPbHtl+zc1QYT9
	LW0HvBHerJDPPzb/kJoDzMnwzqMldj3u9GrOyCKB0ZUR2THQoeYi1eYjWWv2t9Ds=
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216694185a.42.1789722752689;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216692185a.42.1789722752340;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm31018885e9.2.2026.09.18.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:12:31 -0700 (PDT)
Message-ID: <45768828-d0a7-40c1-8eec-3a1fb2d66a71@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
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
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX9+VAiOJySAh1
 POx6Spf7w7ujdChD8zhyzrUOYgwJLVuhlGq+iLDCB2jqZemd9mlxOaU3ZubTwTxqgknEOg4yAX4
 SKo+TCCZXt55Gp19x+4hxua4jHl1xFvVWY3vDG4dCCSmxXoxqHkngKdOCCQSRLFKTi8tZ4v9Tm9
 WfljSw7ao7dbjx2FdIdxWXh0hgAnDEG5v2RTPQuK+ADc6b0eW7fRLqRIKUP8rCg5SMnIxOx+zhL
 Qw1rOT/kFVR8vebR8YqF1piijJrtK2GK2nZx6Y9c5WDXHlZs9ryC97dTZ/pDQO6jG0QwTjAzHb8
 OMz7q45hRFee5cYyrZCAJ2+R8ad9SowvdSA9DtynWbwSIpIkwNBcuNIY/IrqGGkqGlq2Q7Qh2tF
 73BC1lVWphT/Kodiuew8zPOHzI9TckaAby977Z2NFSbSlty4UtQ7nRA227EnyT8w/5UbKBWvW02
 J9x2gO/Cvi4pfKX/npw==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad0081 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pD_saRv5vMX-V-iaV0YYcVJVvwpgP0Yo
X-Proofpoint-GUID: pD_saRv5vMX-V-iaV0YYcVJVvwpgP0Yo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX2yPJnsZHBaN9
 ICYpRaa2FU8tDHYPWr9cPp4NaQiH/YKSGAXD/iy5gMR0l/F97ZJ3vY+7FtczOrZg/Te8KFecboE
 3CiVNE1DELXokQBTRXcxROUzu2aP6jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021235_067353_6506AF82 
X-CRM114-Status: GOOD (  15.39  )
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

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce platform name, control register and duty-cycle
> levels per variant.
> VIM4 uses a different register and level set (0-100)
>   declared as a list (0, 30, 40, 55, 75, 100) compared
>   to previous boards (0-3).
> 
> MAX_LEVEL is kept and bumped from 3 to 5 to make
> the speed change more gradual with the newer MCUs.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

