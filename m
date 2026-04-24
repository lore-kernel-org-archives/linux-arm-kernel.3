Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DE4FE520D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=Mi+FKNqIfr+wyF2b6MYXis8DTv
	IrKnUo/nRcbUJlBE2n5OEYK2Aaq5SDU/foz88Bjrty2svNYkOw5LUfagkVn3sHPERK3jPzIFQsctq
	ZewkoB0bwkyoOmyb8Q3Y1gnoArpsrsObhrRQfPEXvd2/+xvwC0tT6KUDRPrVLS14L49BeYuJ4A97C
	RDGDN4XilG5PEpgUHLDAqMkoxGr4nEwMdnA5Fvlb536lfdinX/ibcuF3bL+Z16Mj92w2Eb/ZcE0Gl
	M2GX5d7PU4NOOmxvpVmS29BlyNEfMFYJqntVG+TK/N+IUMbK7Ts3OPQsCYTaTMN8y402wxvPyCmfo
	svKZDESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEtW-0000000D8xb-1fJ3;
	Fri, 24 Apr 2026 11:40:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEtV-0000000D8xG-2vOF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 11:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=IKyPl9UNL5L1o4fHU9uX4nY/fj
	k4OXvftf38icsKz9LS9igVb0rkxIBCa1mUI5pDsRMhNKqHI1i200oz5Zo+38JFvC3pan3idP6Fvmw
	W3uHvKYJ9rh51wQk4tvG8ov4RU72U+fSKXFH7mFv3qYkAkaa+VP18xWi+IedhyivRZVZF4m4ulcSn
	2j6VMA7/9N5uydChIpPGmgYMNkDTTUouDOY9yyQeJn7OdlKJJG2Nw2xjJZs9QIEztdmea7gtDaO1y
	WyQrqM4MzA9ofZDhcf5G9uMfiUoWaxKJQG0I0CrxhfgT4KEL039xT/ZP0xSf6emdoJPUAID24dHq/
	4J3FBcYw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEtS-0000000Ei1O-2Wke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:40:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAEsYT2447121
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 11:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=kMcXYtU2JntMEEVO
	vzxBHYitkpG0WikSf8OZ/TXJl6KZ9jjhaRbOODsSjyJlXFlG48/rS7Fck1x647fv
	fwsblb0RLUjoQCY8RhGr0osUsuf/pLR99qOYB4djWLOcNP0nvtWjbrqy7CRL2deZ
	F+BD0eLyge+FHFd2zkaH9rWqbHTslKQCSjtBYxPumXsqXZfrgrgyqJPai1pQW/y1
	3OpzEDSGU4LAVNIih+bGsmC/L4zF46teE5m/SdYZYoOgwzTROGYXJf3Do9VDHLLh
	hw8vzazFn576CfZd7gbGM995J1swZI4kHpSc61GSMZn0jjHZYcEGpzfnJ/7yRiM8
	W4352w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6kprbke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 11:40:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b026c4497fso15810896d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030817; x=1777635617; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=FR/rFhh3TItXQWHdHlR+hLDkEBVPe2/SdN/YY/IeKaH8XQMyao8H0VlIkYXLVo4j7s
         PrXbCBuBaZRdUjjWJ7oDDCLpuPlO3CPallL8c/co5KEV6UI6MMzc3PomGan7cEUiw5Pu
         VP+8s8AFq93BLuiECR+B2xWyPCW3uxlx00lSOayIclGbKlxDvykhu4SN1Crb7cWg0Qvc
         ZPBIN3IK4hVbk0kXv41w3U7Hg6VhzJtAh5D0D5c9z6JcSu3PZQnvxzd0h3quJFEXKs/V
         sXJ3u9kA7ZVRETrpJJkp3GCU7xjLkBW2gobWeFcoNwkcAk4xsDSlpwC/IX7f6YZrkdJF
         VQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030817; x=1777635617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=A/JL4t8QKLM4waijQHw0BBrXkn09qw9Ke4dowNOSojWm1+o508GTrlMo75OPCUR+XS
         mZBpQQFS587caxB+EL4Ft4IzfEDJBVgTOx9FtLg/LEJ2v9ID3Pt/w+IaqZX7FOfssNFF
         zklEv1Iy+XKVa1rr2KzrSxp2CsP6tp7yYZUq6HrJrr7bt022pKFS8sr/hdo1Gn/akCGi
         0zbYbRLc6bffux4tTKsHNovnv4ZXGrWRywXX7UYS8UAh6fTzQKvOHQKlKIM0o8oaGGHq
         4PT6L4VFwI99loVvtqYtTS2R6XLGlN3vc4QYolWpYwGRCH21XuEQ2zMd0WW1w9CSQobH
         leOw==
X-Forwarded-Encrypted: i=1; AFNElJ+oe2swZpYoE/jpLvpxoQbK2lEFQNa2zlHv8A8lpHflQDDNGPu8Ed8JmRj6n3+8U20d1n8o6EmgDCp35m1ZtiAe@lists.infradead.org
X-Gm-Message-State: AOJu0YzQMn7DOu/qd+6SNEv8pmRRpNPkPaRep5tn70YwtYpmfVC7TbpM
	SqZhg/KLnkAdobjppkNhXuwOnXuF4g2XxV/Mtck5/JiGT1So9dIpCJm9XcU/IuEKZ5yaQ/EDzgv
	x23jtd6Q3n2q+ek1teED6CmDKNVsqv67aSwTyZpkzKZRWb1Wvipwr4CmnFw0SvUcRVcH4PIsf55
	bOaQ==
X-Gm-Gg: AeBDieuLajltBpI395YWjQitRQGhfmt5C99/mPWZhxCdOj62qR9MezS3B8QrOGGUE6o
	f/b+AQ345Oi4I0LvCAEUXCr9mzQnVDaBQsGjdeKsX1hVXezEOuyU0YUXXWd4YWcyChEjHYXzyqU
	Lp+a0IdIMYy7P4ZJNRJVQF3KFiP9h7TeQTj5cpU3rP+GXvLYDpTPi0C7m0N1rBwoF4Kxsmgwtb8
	ubme/d69f4hpJF20u8AjAm0o8ieWJccqkBfl1DJ6h7FvXHQpXNkOAxCNSrU8G2z6yNRCJh8nVwn
	0ChyNeIsuMK+hddhautC7IxXp/gucgTGCtcjGslMnxKPpnNUBaQWG5sKb3MzIN6Q6yBaY2++ZO9
	P7OEdC52JzOiIMqIRPhydDebR573OzQsYrKqQ5bhsqTZAw32o9oRnlY5uuOXqbvsnt1y6gLm0yV
	73p3YieqFtXmfFDQ==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342499496d6.7.1777030817390;
        Fri, 24 Apr 2026 04:40:17 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342498976d6.7.1777030816944;
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm5896580e87.71.2026.04.24.04.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Message-ID: <b0690213-da71-4b8c-bab8-8581fc3d0211@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cdDiaHDM c=1 sm=1 tr=0 ts=69eb56a2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: TH5RoBvtyYhRHZwjF9vStgbrcDy_YcZR
X-Proofpoint-ORIG-GUID: TH5RoBvtyYhRHZwjF9vStgbrcDy_YcZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfXxR1A+utPmSgH
 iTMBNk0Lds5SFczbpU0fRxTFEEbs2JTiOmVKQGo/EGJx4OCyXcOeWox7+lC0GmHjZeAE4p2t3QA
 99yl7ziC/9P4B8cwHoAvljh9bpnroQsWDrtArRtJYJmfSyf9ej3ICOfsJAqOJqXj+oWm9P3kK8y
 gRw7+mR0/ole1NvTl8ZjbxXl+BCD/9ds17AKvSdbCkDKg76pbb3U2oVnre9RMyWkWHT9kwFlC5w
 DgtTNwexCdJK4HaYj6A+zHM7M2iZT6OZKP2jqqjGY+3XePfgWcCKc9Xcd01z+bPU5kUZ8Etd3zX
 A7q1xY8yrKSjOrrVUKh2F+M4lyiRr5qBi2//4gTzETXzv2PGMa9sfG9tmEHXJ37L5yabsnWyzmY
 tF5LL05om92iSHgQr+TICUbZfhfyXKKugfJHX7PyZI4R0EjUN6hTiIlHqncUrFdr8ybt12pj39Q
 jUMlIi2x09Oe0eJPC6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_124022_992293_3CC76FB7 
X-CRM114-Status: UNSURE (   8.26  )
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

On 4/9/26 8:10 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

