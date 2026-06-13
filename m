Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC2CCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 04:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=Gh/EbykTwPl5PUh++oDFd1RXZr
	7OLVl6jYh4IgPQ7FO4Km5B46DGht9DnsGljcyRn82XuxFczaDjUYcMUKTBm34hxayjtu3Bg/z52IT
	FKerthTWb/aY0Z7/cogb50ctO412rWrRDzzFv6yToQpkp3yxsnXe9wpeJU3MIMncXFyloHr9GL7ic
	AP5McdWyzudvvE4Yi5nGpiRouK28Ne8DuZ24CDA7fdOPPeoW41Vi44KbsiGwrZ9FwhiXGfCE7nhYo
	fEHpXLiIv6DT8DenZBK+HU40kmaCS5+uhuzRd2S+hH7rhCu9bujSQ6zHDg5OCIby7wXqTgzepaP92
	ae1ygOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYFhJ-0000000BwNI-2Bzd;
	Sat, 13 Jun 2026 04:10:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYFhF-0000000BwMy-1tW2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 04:10:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3OBvX1263519
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=EjX4XkRZpygOmsXy
	GVaiA5BwdOv/Yb3hrVzwo6/qftVVOstDIcAxtEZgO+E6ImFeQ+bzCsFcfTccR6AV
	kHimL7q90XgU6hSIS5504E9F96Z8mGjWkvrsDI+3BgZdXNC38eNugMbNzH+BSRSw
	e/Xt5yLFD16MFYPFBWIBifvMhxWx6VuMBVe1jvY8SIV3WI33lCE8RwF2ER0/lFhX
	2s4krj6Sno4qlFdEvF+nUNz0wpzBdaY0KrhVSCAT7m5J3YoyYU5sgQkU30lACJWS
	tjLeDzFbaV3WB9e/tV8PvwndhzNmm1ARSDRGQfsBFBPa1kONhe2RwHWAK+UZoqi+
	e90dQA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9502fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:10:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8425a9979e1so1097137b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781323810; x=1781928610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=AamSKM7VWg9+GRkkxwlc+PVGLg2YWBTFPRyzmo6DCSMMJ06zHo4aX2cJZFHF1asqER
         1OL2PBYTpllXqMgLLD/chz0kN3swglO1wi//GObgGGZEOGbCLD4/vyNQLOBUez7KOUQ5
         4Ru6luf/ulO27M+3teMRKIMmJ463XpHBtxhBHX5v4IhmXec6FJ8Z/35i9RNtOffJ4vDB
         I1dFIypFIplRv9h3xD6Vz7jjN9rgA26phTYFZfVNGRyWeXs5+reccqt2ePKt+85Xuh7b
         O7Y1TAPdZ/6KelI0y+MyudEdzaVBozYgYaO7ifOZANF4il1McsxkDEm8BmZUwiihPHOk
         PAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781323810; x=1781928610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=PMwVa8NA1IRVuKkS+ueWlH+uzFAmgzuJgAKunLB+TZ7IV8k4ufaILTFp3xYXDAtDJq
         ZPzdPIwBqTq7KEaXXaOD7+onrDlqlsGxcUbanNfCr0KDujRwxpmVPhNZbVeFui6TezeC
         sCjduYAlwa0ZCtqL6HtcYOITWXLwReWoYQzkXwHtvb+udcv1tIF/UwoALttbDDO4TDgP
         GXNjXUhCW7J8Mc59jGudl2UFv76Lootle6J2lfwdUoQKTryx+Qs0UDTjZzAYwHnqevID
         tTKkOcplKn6gbxlRpZEB8qFrQlV1wiUTimztWxW7W6VsmF2vXOKZ5SPse94Y2KDiuSt9
         q5tA==
X-Forwarded-Encrypted: i=1; AFNElJ+qjklpyzyT2l7fONpmVaA754sxUaqh29xf+MOMkdlaqH5nLbHUxHAMGDW2Oe5Wmy3MUvewr0G9s4xtWK3EkZeT@lists.infradead.org
X-Gm-Message-State: AOJu0YysJ6LQJonnu1FZKwO6huF+Tt0frzjtbtjcndlKOAnMs8tbGAQ1
	aJgzVSVc9iijbavhq0bJnz4IZofniyymBifWGtcvCUs1H0b2qhpfFLsVdwDmRsQTQ2wSGlxMXBn
	AUDvuth3a8dw4EObwiTfOr+O0lQAEOd2keAxQlTKVOhWdAA3bJkhqb3xTTVFzHiySeehM+bLpPD
	a5UQ==
X-Gm-Gg: Acq92OFFgdgqPZ1FHoAiD2ldoCxOpYiZgmLKx+dAi0HvR9eMaJH1NaGBjICAQEgkN34
	GfxVPdFYJZzUryLlbGktMa7lUvQsFCGTQ1C7O+entoOG/2ILXpfrhayeZx1+QTSqHKApZY6bPMn
	ez0gCpmReDy+6JxRhLwsvbke2YJIgQJ1f3LxJBmAGtpQ0at5HUFfxQD/v5XH1Fe4wvtcWgWl5wP
	ZOLlsUDqgnjVs5nl8JKLTZy+hUKLgku55ELpQ0NZusw8f5LdGkY/3nEg4+R22MDek7MfEt4kQk/
	xsueuEvP3XPxkML3oneo5ET4kQtLjVXt1BGMtzz7TQXQH7jJDIu0b8NM2xp5dI8+CaTMlbG1ynI
	Ao7Ou4+mZ/C9b8s6r7sxpDHNxPLbV4Fvhh1Ks9rI/faf3tHDaulg=
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902240b3a.10.1781323809810;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902220b3a.10.1781323809366;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm4480992b3a.34.2026.06.12.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Message-ID: <fbb00150-e3bd-45b8-a87a-100ecd235a46@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 09:40:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
 <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bHKtDS2tSfyBtAdg-iSB0mx6E7JhXiDg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX6e+vX6et7h18
 dbUavClF/DLEjl1AMfdl1NQK9QaEm1+GllgDifJ/QGxQ8SY9LXLVSsyArM6ZI4DBvuUBXQfVd6Q
 Km2e9FXO5PB6HXXZzvfQTJwjwas2Y1U=
X-Proofpoint-GUID: bHKtDS2tSfyBtAdg-iSB0mx6E7JhXiDg
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2cd822 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HRvYZQSnNB20PN4mEw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX1pnptQwwo1mJ
 0hzoDQbTvq2WxPX1DQcqAvEpuZYtAKIyiCY2Hgt2uSJOKB3frkKKYbxIkFu8KUMxCo1+kS8R1DB
 GPWoD/YELtEAdapzV87G5RTB055nmYjJojK3RgunvutrZGCFHZm1xr5eC1wstAfdoxQkyiChiDY
 uAjm/2ktxZ5WE3OghzvM13+8l4lW7KHyTACkbNGW6BMmTeNATjTJRcuyda7mcVwp6qQYkkz939F
 9gmf4DHBcggRaSS1JT/8hyM1PjypbVYMGLNPFn42M+eZgQ0Y+HbSrVftsYGG5boMEdupF5VPJgl
 4HR2s8IS6TPpUj9u4FhVxBjTFOOmUoTxFhDU4P+6kF5C68pv/F/SJ5F+C2hMJvbA0tABUslTJnY
 BFRCjBd9X3VB4PVnO7t5Ts0E/Ru2jKolMtophsJDAlIjZk3LrCLNSIleNVH+cU86c1TMYQ8Pvdp
 zQbLkWnJCNBbvl397uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_211013_651696_F4B6C75B 
X-CRM114-Status: UNSURE (   9.85  )
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



On 12-06-2026 13:26, Vladimir Zapolskiy wrote:
>> +            iommus = <&apps_smmu 0x400 0x0>;
>> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> 
> Please add an empty line between the properties above.
> 
>> + 
ACK

--
Regards,
Nihal Kumar Gupta

