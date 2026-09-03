Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F4C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=; b=lK5RYV9Zho47RqN9pNkP0dcFr9
	Lot0R0MO/oSnqVj+prGnqkAEIj7yvWeKNu3X3Kb6jToGNbODscO8djwih9sZ7Rd7GEz7ym+tshiRP
	YIecMY8z3yygGZGqPheFkSMKfxcAhEXOp5Ig/ZSeDzirnDUXZ0pVAvsjYsWZBNtTR4ZMzL+IZ1XHk
	1bKuuBEOFJqDV3kq/jj9nboYwj3YRMzXmQexjzdU9BsKt7pNsU+ag7MDAi2Qc5uquqNcHDyidSVHF
	WeBhl7tbNIV73j1/w6m8+6yxsy8IqJuQI2gOylJBCcAr/ha80eWshKTffgShPXmNE6FRToxDk9Hae
	fl+y5z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x258X-0000000H9Qz-3jaJ;
	Thu, 03 Sep 2026 10:57:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x258V-0000000H9QO-1JZv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:57:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAgi3782252
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 10:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=; b=SRdpJMIiq9NDmrdv
	UAWcFDzUt9xsWYnKUJBQih4QlR5E/gTEnhcGm3caq99WQZrQfjKC8gIORrj/7c2w
	ef9TqPTSXkvHfFVvSoOValzb/SEQbSiuSWMLO9nwCHOh+mmoooW8F6fO93Ut13JP
	HlA2nXYEACjWPT8HSIzcJu93IHMuDpz+/Vdf5fgnzzOgU/ayi0NinCCNLWYF1ZS+
	5RYtUlNt1eeGFBDEaMLvyCICVJul0NEQb6wz+I+fYqpuNRrUn1dyPuvbV0Gy8FFQ
	w9HXAjqH4pS8y+xB5HlapeQoKl2h+DVezAApTWD/60X2z5vjNv9r6eP4nrYj4FCj
	ppkyZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdrhqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:57:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7ef17031so2249701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433057; x=1789037857; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=VscjeKL0rGtjtJlJHzeSrtuWQYbeMdBp8LvVexanBSB6jWTACauNMeSLnPWudmxgRt
         dqkJc6Y7dzoIMTvhJQRmmGpNV3KBCMytgCD+StmOXYyPNmtsca3cVo9+xzzFlDM8ti+8
         44gOTmhMMbhsW20ugamqlpGvudr5NmpvdErg0qei1Idfc9WkSTtbuX68N4Rs2o0lybRa
         R+7st7fAyHOIbuNW+v3OV+F/JOm5ZqiI8isDzqupPRe9oTutqqDSjQt47ZGmsbidZ53Q
         lg+sX5suMf4nkpvM5hNFS5TTcLmoXlwHyEsqCCtwnB2Ubyxo/umgYp3tHQnwioM5SxYz
         Y/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433057; x=1789037857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=Rq9PoyLoqFt/HeCcd9u3xUaHO9t9kT6xtQMAWB7aPUiQD9EBPYaFxJ4L3D5w+EUgwv
         JpFjJRpyTsG0hsMWCWzhQfrS+mzvGAsG//VvAVCn7mydO4FiE95wO0FbP1DElX+TOqk/
         UpbG3mViv860b9TmflH+Ivch3q1n3hcMgyp9mABn315MiSElGCOiC2ORn7oPftcI5WYO
         g2UiWOkZnQHk/7gb5ByesnRxPHmn0Ad3cnV1j+eu82RTFR02gs7m80p7QuLn1Ft0acHS
         qptLRWoTwfcX7H052tx9WWAlQOvgbkvgSEYsHCnVmoinufTJBHu+kT2tWdLJzfTwdaok
         gEgA==
X-Forwarded-Encrypted: i=1; AKwUvBwYestPg4OUl0h9Y41vED5Phcc9TKF6VlFajcaLQwX400YhkmC0aTWfSta5F6NuUOB0nqDGpPqSlaLNq7JDs1C8@lists.infradead.org
X-Gm-Message-State: AFuF++nxfxDGbIrjVdj6O4vxpL9/F7bN63ynVGvwrguuMsL7fDj3KkGo
	/VcdAhduxXBzK3R89ML2O9dKB5O8KoxoeiW7xH4YwvUZw8GsDkfnelG3WSryzZWv8854J818MQZ
	CrhAkzRtGkeqRRfIiM3arNaxVrrPrUF4QAtJN5vR5FGD8Lo5Kuy/x6CV/OplWGb2E0ENYNwFkNE
	ssHQ==
X-Gm-Gg: AYBFou0KYg6oScOCIoMpnX9P9hWFdYTkFmPRXK3Ez3ALKWtosTke4KsZG7QcDmW5xOW
	4pbwz/rOgIraLxS2c5rZXMIz08zIuw6QipShcA6pTMe4up5BYY8YHnDBqhpGAGY8YUM7yLVhoVm
	gWq6Lrcmyxl2aG01tQi/R8+gmhEMVxbWhQtVDBBkso8H+qjyyAOCnVD0MalaX/CGugUS6gOnqmB
	dt8TIxWpzevpZLB9RndZOkq10V8J8LUBIclg9pXWzRM0grGJY1dCK7YANhkvA8gW15LLK5xmLPF
	hBpZLhLSbyj7d+3pt+r2fNN+kEq0xgx4MG7aLVmz6UhgRZtrv5iRkxmnkIMWgQ5CRz4JewDpV6A
	vGXUVtf13AH2CwRQjrS7jWA==
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86032391cf.1.1788433056711;
        Thu, 03 Sep 2026 03:57:36 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86031871cf.1.1788433056291;
        Thu, 03 Sep 2026 03:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8bc496sm2173512a12.11.2026.09.03.03.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:57:35 -0700 (PDT)
Message-ID: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
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
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfX6TnSnGLkqyql
 IFBmqwup4lgCEXDkR4Rh1gSOLjo4vsIdlQ98ISw9P+mwF2nRVWgjbrm6Jp+QdfZxq1EfTYie2jb
 k/I1kH8/+X9dbzpeZuJpt8LiTI4guyQ=
X-Proofpoint-ORIG-GUID: QzNAyZgWKFdpinReH6ntqyXSn4nODTsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfX9ogteo9Q9ion
 a+QT32IURQ9iwCQ11DPMtS2Vb57JDZ4Q+M4KhJNpJgDgBbf/5d9ta9L+I/nEN3KGaPxPRQ5P5ye
 UNgYBmaOL7jTTyO824rfQ28AlmIz+mdRcg5cNuj+eMf3Yr8XWjMdlZOJ/sJz9upB90RgwLrv90y
 YJ2/rT1xSfELG3juhnl1QEBijQRXGTEywr4jQsUeKkqrI9VfEBmPns8ru0kAJRC/lZLAP9a9Uv7
 lH8PUcKziBSixSr2byIoZUSZ7cx8ME021jzsxQVXogocJzMHm+gURNwsVEutnW0k/cXwkzaSNuo
 OJSaobHbsXGqLGMBIHS8WGX6tpIlN16pcfJVhuIsF6zTNc0v+mn3mLTH9S4wFWzqB4lOwwQVKVQ
 B3t+wHzscZ7pk3JkCntx9/sZkJDSzmc/p6U1Bm8PBMelVIn+Ku8limzU3R9cy8F4GhynoFMk/Pf
 3gwIMzOUQrNeYQw1J/w==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9952a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QzNAyZgWKFdpinReH6ntqyXSn4nODTsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_035739_468835_5123C938 
X-CRM114-Status: GOOD (  14.42  )
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

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xffffffff>;

that's just "ranges;"

[...]

> +		qup0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x009c0000 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;

likewise here, you don't need to precisely limit this.

Konrad

