Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFCAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6HBhwxgkCn5p5i8qcqY122PrKqu6SuX7ZN6cuXdGk0=; b=vkb6hj6OgqmI4vna6cS52H/vwU
	eAZ8yf8sqP9v18gvU+3KTtOJVhfKqR9aP+kMszJjfJtNMK1uhMXZKR4Wi4LcGv1qFlg4jS1yRy+Ks
	hmtro23hU2oEbTnlgKziprPtZogPXBkLh6BLaAllH2kDjNhHv7obYs1QEf18mDA0E4pODMYZICJRV
	FHbmh3QV7FiWc4IY00b9q9HpXC0sq6HssDL8T6prfMp9Mu7Tsikd9DaJr9/6/5/8QSzF1loE0FK9U
	nI3APnRjspGXyqUc3721qpe2KDTe4pJ4VoNAiWdtDsFJdJkW68cF1zhzVboH1NGZ2mvOF9x/N4IHX
	H3Cthouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRYw-00000005OGd-1gQo;
	Fri, 21 Feb 2025 11:51:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRX7-00000005Ntk-41t7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:49:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LApa8L002691
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6HBhwxgkCn5p5i8qcqY122PrKqu6SuX7ZN6cuXdGk0=; b=aq2liSbpPTLsAqeg
	rZDRWRrZG8IdHD67DphPHXh3iPe8o7A7m3P6Kcr+kHhT4CkQWuiOGDvLNdzSRrZa
	NZkGaaBJBLyY2JjryDkW3xxYj+XQ8+u7/zk+SccLDnexDVWtABcZa9UFDMlX5o7g
	8LdUwvE0PLm3Vzw+NUwhafbn51cSebRhTUx6Ig4cksrxjrw27KsSV/LvmXmsIbCo
	E7/8Afx7QEGpoxhq95M8aK7Kwmy/iDryF6o27u9TqjvAYee8BAfxYEwO/VruidQw
	2clsI99RzCGxZjZS1vjew1+KIyuFvEBY9IQx/x3ZgZRJimWUuqsHKvb9jmUYucd8
	WOkSsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2huaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:49:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471f32b8d45so4932871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 03:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138566; x=1740743366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6HBhwxgkCn5p5i8qcqY122PrKqu6SuX7ZN6cuXdGk0=;
        b=WcWHg99o8/PLjHvzIMIIpuEMe+8+8x8dlPKJw5puPFvLhhfeLeaIKXbIGy6AgL76AA
         lXw4nYFvv0ic2RThQMXEbzxHGs5km5wOBLFtKpbWma0NiKECk3YGcPBC3L9Bxcp39RpG
         27G5ug9pvOud8h9HJoAYtW/fYXIeOpfaSW63bbpDKnJJDJnuUxNxkgmuth7TAxXroTbA
         nCISHCqO6mAA7D5dd8Ztwl4mtPvbq81PIRUxj+znkm6AY/50CVC6Y/pRGIGRAUgaVdqs
         TjuMiFf+qVsRg8kffS2foYCqM7BFhN5sTun4EWv1us16ebia51DLNSH1WjrKY8xo637n
         xjEg==
X-Forwarded-Encrypted: i=1; AJvYcCU3+DVk9MZOSKM9BqSFnawaUeOpG26oeS3kqhFs8jlxvLXqSmrd+RcYsyZkx8inpV++Uk3TmTy9zhlr3FbE/s/x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx25AoVUzgBmVVf/F8qVktuuosqbeugkFBqeO4kk4cno6vnsMF+
	Y6sWRCtglYSCzJry9luxmva6zhXHksJypQCd7OoZ2e3AFP2F0RiOawrl3NE9MHurWsaTmYLCjnL
	c0a13YsoQICB6Bjzn9Ij6ofzyV+PvDlye2APZprTFHqokSYb5Wm6sHdF9mf8ejh5oM/Yke3A0pg
	==
X-Gm-Gg: ASbGncv27l2MmUAdOZTD+AvEaOFYBmCJcGW8Sz39PXhNElWdFbkpkGYeX4Oeip11MNh
	ekUvM3CWYuytkskCbPFpvBM9PMLQoOXNROtv9am5eATa9Mjxv0shEZk+1/aXyfqsXHOVBpLMtPk
	QluaO66Oem9Bwtdi1z87/Jc0kU7i56T+FxIeT5dBcksgvQaKZSu6kTJO0KW3zSsvwEm5lwlH4F5
	WrUSUU8zRw/H86eJGcophNvQKN/DJbCfvRg/gIygKuuOpu9J50Z66C8yg/xJcsy+4xwMWSfLZ3F
	g3bb5YyP/EiMqNiVg0zLZ5h0Fl5VrotDrG5vxR5dvIuNOpXZaoV6MojejsL42n7r/KAiRg==
X-Received: by 2002:a05:6214:40a:b0:6e6:9bd4:82a2 with SMTP id 6a1803df08f44-6e6ae7d99f2mr14708336d6.1.1740138566377;
        Fri, 21 Feb 2025 03:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7jnkWAirRkaZU6bLGlSoCQGj/vZMj9fV2Uwdu/vuSXjXCkYcGk7wUqFHMBlf4yfMNs1gWRQ==
X-Received: by 2002:a05:6214:40a:b0:6e6:9bd4:82a2 with SMTP id 6a1803df08f44-6e6ae7d99f2mr14708026d6.1.1740138566027;
        Fri, 21 Feb 2025 03:49:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm823562366b.60.2025.02.21.03.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:49:25 -0800 (PST)
Message-ID: <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 12:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com,
        elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com,
        javier.carrasco@wolfvision.net, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221101426.776377-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R0X8ypwXI4ThwI0OTMRe-vtfs_5vFvCo
X-Proofpoint-GUID: R0X8ypwXI4ThwI0OTMRe-vtfs_5vFvCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=887
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_034930_063225_A502D4D9 
X-CRM114-Status: GOOD (  13.08  )
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

On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> +    clock-controller@39b00000 {
> +      compatible = "qcom,ipq9574-nsscc";
> +      reg = <0x39b00000 0x80000>;
> +      clocks = <&xo_board_clk>,
> +               <&cmn_pll NSS_1200MHZ_CLK>,
> +               <&cmn_pll PPE_353MHZ_CLK>,
> +               <&gcc GPLL0_OUT_AUX>,
> +               <&uniphy 0>,
> +               <&uniphy 1>,
> +               <&uniphy 2>,
> +               <&uniphy 3>,
> +               <&uniphy 4>,
> +               <&uniphy 5>,
> +               <&gcc GCC_NSSCC_CLK>;
> +      clock-names = "xo",
> +                    "nss_1200",
> +                    "ppe_353",
> +                    "gpll0_out",
> +                    "uniphy0_rx",
> +                    "uniphy0_tx",
> +                    "uniphy1_rx",
> +                    "uniphy1_tx",
> +                    "uniphy2_rx",
> +                    "uniphy2_tx",
> +                    "nsscc";

I see that the input clock is named rather non-descriptively, but maybe
we should call it something like "bus" so that it has more meaning to
the reader

Konrad

