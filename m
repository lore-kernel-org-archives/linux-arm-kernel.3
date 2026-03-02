Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9473EE9B369
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=; b=phD31vVqqCtpuV9M41Z16HDs7m
	c5TpGcLVfMz1X095qjLApAZ/Aw+Yn4wto6Sh9IYAaYbu29ewEEsVvFOYUs896nYw7GAbTv9aq0O4Y
	FkfqRTnZB13yGFtFzts58No7qVi9eobX24vWxgSROdFUbDIi2VtOSl5rwhiZfm9WKOFmGi5lmNRbk
	VpnpGoLS/dTydvGzzeuvSJs3+QKc3+j6A0roQOwtB+nGbfbOUQzcuX75kPYMzM2BD6ocqX5c+QO/l
	sN1bUu/K+z536n+co/MEevcbFXeXcrjGNieIblHtPmCURRWRSEFsiE/XXOXHFMCM2n+xJydWb/EaV
	y7FgRMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx17B-0000000CmJJ-084r;
	Mon, 02 Mar 2026 11:07:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx179-0000000CmIy-0jMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:07:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3g503862874
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 11:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=; b=OfEe3/Q3k25ZMdzD
	M+qtpADaKdb1/139SeHxGM7YsjbNJd0aa7ZKuuMNt9JoowXlp2icMAKzde3NiXXG
	nqDg3bXfHo7Qzu2CHmKP5dhd0zqToN1aBK0o83dmGahBQ4uU05/QD7crkFmakKyb
	kvS0K+MvV268dzEr38QXpneaMGR7mcvaIkKPQwupy9K/YMK0wvtEmhqd8ITbI1ew
	3n1UmQz4jSNihqjgXTWUwiMsnIJPGVZnNQ79nlBFQv1fpWTFMEFJswH7SBy2UR0+
	YklhYy0BDeA4pPEGXoVZTwxja+Ggz7JOmI9RtMcNmtoVrvlbwyF9B2QxWXneOHrf
	T2vOIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjg0bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 11:07:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38a5dc3cso436777485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449621; x=1773054421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=MdOO0Ew3amB/fhiZX9t0w2/NV571p4DoJp8L3/t3zJJcbPRIOzUUuCmGoZpMyg+8sJ
         0H8kv3QHlA6xXPV4+MFMBXQ34gqGlxS/jSo1CPcvI17JMk3oOqJDXnNtQhFbspag7/KH
         leEdpYafFxwcAuBC7he3UQRyMN82zYPvCWLqIhTozEurzjyx0my6wEGZ0wnpxmWPgDfJ
         pB8go5N4EI9Vtk64Ap2h7nPsZXQ4RBFZ1Gei5A/EKAUp9GlaJ3+SM7ZzgjAmyyhMuqbM
         mofo3NuHKsZ6WbqutLUqJ8Es98Q7JsOI3C86czx0eHUFfxET2EsUr+iEWKw7KoBko/P4
         bhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449621; x=1773054421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=cFGnTOob0z/8X3CdaNBKzDkrESMaUtv0me510oCcoMIpumAzlyu2NJ1BDpj/e2HT8B
         WMaIxxbLmQf5pGzdxEo6BDn3SYYjABEcfCMh/yaXzkyEnEgQuVSYcNV6QnfamTGIQlT1
         4q4W6I48QhAQ/0O2a2QGN6OwOqjvHMfMLG+Cyslc6OjyW/105GoUuRAjLZ9gpGlN9iMq
         DKn6yNOmtH2VLFattxiTFlDDeea6fXs+97wDA6kAhIzk6dvTIwPKsXbPTb7k+/lzRGLe
         0gRW4qkpnk9Pyyed7k1e0fyuOMQsNkH0MHUPaqmZqdMpMn6NvpBnNifOkSMVEMEGknau
         sYCw==
X-Forwarded-Encrypted: i=1; AJvYcCU638pNxhfKAkZpXn86tVse1M2jZ2rIvubaQ8DiODmunPubXMGNA7QXfLtZBrRPhTZolU5jCPmco+nAMAEomIBj@lists.infradead.org
X-Gm-Message-State: AOJu0YwdnOK1tm4AhgkJK5x5bBCVBetE79us3lIVO2MIIHZwY0ccOxBo
	tYsLWncflTnwmoeXFmNsllHRUluZW9Diy/0/WcwR/W3jW5vTXtjZB3jWv0kKEzd5/u6NaFM3Z/q
	a2Pf7HvlTkcEQYU5BV/veYq9QVrg34LSvM7cVQVN0HSXRFW7gouGJfwqoXh1hz7wt5/I7nsztdG
	O7qg==
X-Gm-Gg: ATEYQzybJIuy++JJZ1XTFN2QD55C+duwkXvOFGK+1kMBvUBxNC3IChtpQY8cZx193Gf
	d9LyVz8JkWCCOE27wmY06sCexSOoskBC9EoWKrK2qEN3dGCxUTUV0G6UGDAAmgoaWsKQXTFI8j5
	H3GgSGBVOWSHRkVnWoRmvzh6/wkhTPqB7BN7CzbxwolI7v2JgW5fHkn0vaIIJObvbx5fNkNIw3E
	qROY8lX5TTygPS+r5A0Ea7L8ybnVWkJ8KVCvRgBlm69U/EoQb0O9mrgFgkCfFcsNknJb5UPeWKb
	vX5rdNYpxkzXnjlu0hCItsunUVuQ+jWcVlDngYhp1LwvutMZHNnkTRmv1ySIkBFlhaalmM+qWMk
	5oK7VN2bmwvKfbqoYITXhyrzjfNLge+G0BdbhLJJCUvlklSTE7VaAvayHd6BU9yvbOrbwDyFD2G
	DQ9pQ=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105601985a.9.1772449621106;
        Mon, 02 Mar 2026 03:07:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105599485a.9.1772449620636;
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm3331067a12.22.2026.03.02.03.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Message-ID: <b747b545-12c7-4e33-95ae-ffa114fa13ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a56f55 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: DPziR51UCjaf5tHE27SRLpUs3YlKFGMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfXxXuc7OjgAf0q
 xkNUYwfwHwW8S+wOhh2/+ntTpPct1BhhQ/h9nGisklQOwlZ/YQJfjcE8nKdDhSuX4cUkqlosjcT
 uQjUducSdffpnMgbjHE8ID8eOiKerxnRt7TARD5BEpHEnbjsT7w0bldDlwNcavcRFXKARFWGIzE
 FmgvYe4cS4ul8RJU0IPg6vZb24CICH27FpcMnPDcdr4DlSftxKBSVggXEXAMaRVb1XzvASBSPZY
 eNVJguOwNgXG7Tp72qYdRYvof2aT4Ue9zk3QhaokfEeJgk7QQMnX9r/cBmrzlnyb6tbit9yFl8J
 Kr03EVWm263WsI5bP0XAfHdZYnyfTt75LxC8yk448MsxJJew5cLO9IYYc6PEuPjnGvaWWg6EsiU
 hNq65uVmmxWjo44q5W3WO/3dk1N+syGEDQ23bNi4lDJGrUJcuALdT25AI9OP53IgQYOHLYbr33S
 wV8kIpkwzLsVZMWqXQA==
X-Proofpoint-GUID: DPziR51UCjaf5tHE27SRLpUs3YlKFGMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_030703_342513_61D6BE06 
X-CRM114-Status: GOOD (  18.66  )
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

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..2501104b06e1b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,26 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;

This is an anti-pattern - you can translate the GPIO handle to an
IRQ handle, but unless the hardware is spectacularly odd, an interrupt
reference is usually what you're after

> +		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l19a_3p3>;
> +
> +		touchscreen-size-x = <1079>;
> +		touchscreen-size-y = <2159>;

Are you sure about these off-by-ones?

FWIW

input/touchscreen.c:

touchscreen_get_prop_u32(dev, "touchscreen-size-x",
                         input_abs_get_max(input,
                                           axis_x) + 1,

				            notice ^

Konrad

