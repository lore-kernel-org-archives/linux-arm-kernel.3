Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F0EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=pHM1yMTTCU0fuSaqJNNcKiUGyq
	UTK5X8J9NnDY5xz5yIvqoB97LMKb6P+QtQpihz5VUoVbXJ2VGRdhDveDtsQ+/Wqib5WgzaOMxBFQK
	Yyugopjs0tKqYiAJf+yfr4H2sSa1PCkiWjyqpwygGJt8uX6ZgaZAXzu5mqvbCrsfUL7NytQljjUGt
	TWEywxcjbtdWoHIyBxNZ+iz7/LPxjZW5zBpowCItOv81s0NCfWNb3qN77IiVzGcbI37dbgapPvMAg
	UK7He2XuA+qUrsxx3t+0W4d5llV3Je6sa34h76YPnloCq2mtWw8oXsOx9/wG4qYJdXZX+e9xtWw/W
	nim+0slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ9c-0000000HFqb-3VTn;
	Tue, 30 Jun 2026 14:09:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ9Z-0000000HFq0-46M6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:09:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4aG1508630
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=l+ZGPTR/vmlcOdho
	OUfrMpbjEUKfVs9bvMHEcwv6H4b39fhh1wPo8Dm7jgzukwZl/PSbgsaLZaMbzy1q
	ITBLEm5XdUUIN0mCuUOTCB7l7Ud8iuA4d19qSvbcDdTySF0RHqxCfRI7LlxFCclY
	0EffM3nelQKouYnkvfVvUDP4xJQKR8H7bSwkj6FYluvSQny+v5SzX21ZTjUMPMR+
	v5XhSEA6kQ35BepHizcN307Txcn12IBPKnU7+7xsX603GaJ8XSpOCZGZSyqd5Xhh
	2RTf4hC8Emv9RIawxllPdEslvboyos5lszxELdnMOugQX3nfKgPQomvfgZ4sXLPa
	iNlckA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j3wyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:09:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso141920137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828553; x=1783433353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=Jp67AoCdGpzEdbvy91LY4wnHuF1sQZQKdMTcWFKvmkURVtO6izXwcSI/EEPuaqWUJU
         bvDgO6oDOmvmYox5Mhq33xoxFUVMorw7oGUA5IdTh4Kl4FmRSDraCzr66cf77IdtlLX4
         TWqKS5LY+ZU3uv9cUeGUj3uAt2Pv/ivBHWw9iq/0n8OoHVK5Lqow8oa8mxdm4lkq8Wwu
         Ud0htnd5UoYp4JtMzlGp+/uGr8POouFsHKJjX4GvDdr10xjSpzjSljH0eXPRxTPdlrct
         QjfJ++GZuQSQ/Ctpg2P1vLDHFvugeGhA4OZNIEUvkMGfKPmrW6UNkSoOD7PH+bchS42y
         NRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828553; x=1783433353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=Vdo79XnQj+KXyP44LT1Hl4uCdUm70+XlPRoBS0dd7aDblkKTYuK3kJ9q0GI9oblIvk
         lc2RnR/88qua8jncwYYa7c1k0g4kTpFTGjZ1z4ibXeCZkyXYmBdWxIJzozVvqjeQxZiv
         SLS9b+YECmhfQjznY/VP3BrVR3MWLb3c4M0elWsqEXq+v/W0TkcDM3PumMmQCMLGrxvo
         Koe07TITaJZ/CJVktHCclZ/Aqi+A8ULSOMdAeHUE1lYDIsAZOPF9nntyDfqG4cpgPPTg
         Wk4F3YxBoudw8F4XTeXgU9XjvOQyc3BoANwoziQFfRqFVHk1uzbznjNzmlx05W329IS0
         J5LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpaj+lWighoTaB6lr4dNuFYET7BapEEWUBKwn7+M2i4jxCxtujBCIz15CczpUoQGuIprPfmejw4EyPFHAMaFiWV@lists.infradead.org
X-Gm-Message-State: AOJu0YxmgSR6obEoH3+dLyh8/uYUCwJf7Y5q+3Us7oQE1TalS4+dDip0
	YLWLuYv+IsV7hcu9zXhBbM2piat5XSeQTqYZyi/JxavM162Jnn4ovakAjIGA5bikpEPl/I6ia3J
	rIu2eIyLs8Ug1dEO1s04uLiIb53s41RJiDIDJV59FEgMex/ur8d4m4/LjkO52sOZFwUjCgtRA4k
	47wQ==
X-Gm-Gg: AfdE7cmAHM4uyfTjBMPT41nHd4zR5qz5ikh4nf29LP/4Bg06lw3QW91Z9nAaXtK3vJf
	WTIkntq+PjxPyWAYvda4/aUGX02anGr4JXMkVKCYNI1I4wXk0fXi/NEEh4Lw4CFdv66wQO6MzG/
	47xj1GUPe5FrjJaAx+h1cXyXfWFl5MuFISs66cGBTFXlCygINYQYbaCQYnOOaJ6izrksAyPcYL4
	bqdngnJgYMpHSqCmz3jBYweznz/+QS4gSJ5WupB7g9Zbzr7oJuNBBv7p5btggv+lYJJz6pzw8ua
	gtzU2wQYr33l/QNVJHDLlPyispQJ9r4PqUJAVzEKMfuEw2AfP+QlRn5vX3i4N4RAIMUDpbS0XqU
	UGJVvM8OpjNSDf37skElqRE+JiXpexsDafyI=
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674952137.2.1782828553191;
        Tue, 30 Jun 2026 07:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674926137.2.1782828552777;
        Tue, 30 Jun 2026 07:09:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm135860766b.41.2026.06.30.07.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:09:11 -0700 (PDT)
Message-ID: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WLe2XKJ_27aq44QdqFGtXqPYw4RXi0R4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX/j2V2EPVrgbG
 002tpsZpXUQ7E6Dt07yACJlDoYOIFh9ukZx+Rr23xDF3uvextb6SXBqE+A0WL6jan4A21ND9Jja
 exGt99wlDqyXVLALCjsF35oDeKde/3mrgoaTtuLbnLeEbJaj2gl901cAJmBqdaChDXZ2JuVEP6p
 r7VkmTHrfALhJT4p0nMd+9i+qzkSaRMZK7JC+yaW7yPXW4QOAth6ODUJiuxbC9kY2iFyNGUDrRm
 GWhH6egVcx2bZoaInZgtw2VHAL+wpZM9kIwTqFQAq3pI1Re4ss/4kRKebMlGwHfFxoCBJKABle+
 QYAQN9EW0HJMdOyp7kC/V8MZtRVXVoqeApZvQnVGQ+Lx9QJnHPIQKk4xM1ys90A67KOl/N2ShtX
 aEcQy2O1d7YSh9rYzOQVRnSfsgZszIxDe0G9/grRavs3owgSF9gHLdLdnVLsVMlOQD5Mls+hr4g
 sPmySDSZ+bR07tPUKsw==
X-Proofpoint-GUID: WLe2XKJ_27aq44QdqFGtXqPYw4RXi0R4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX2Hihc1zHU8Hh
 ASdXO1QWV9L3Rw7EMaGKcqU8Yrau2ZEKBQWG7JrkkKdo0+zje6CCRpsBm0nE37VKTJOjsRVeXV/
 sUomOeu5ToiQ38h5REiQ+bwJAQQPX20=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43ce1b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6vCOFkJVGQXElGg4amEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070934_027342_EC7A0833 
X-CRM114-Status: GOOD (  11.47  )
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

On 6/9/26 5:02 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Almost all of these nodes lack power-domains, meaning the
aggregated performance state requests will not be translated
into RPMH requests

Konrad

