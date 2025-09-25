Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF8BCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNWENP4TW6FfVNRa3Q4FonUZvk/5CHP1DhoTM0WHlGU=; b=bAgDBZTLGxnJkR/qLgRZU1OUon
	m4TYx6vJVsWyVBeywc1QYQRFogg539FibLDjRoXt7ZBhyP+tTUa0DzvAA55RIRuyZmf+XWaUY6YCE
	vi69XB+r4v6hn6/OyjtueXRllwzgXgY2uEUPfej8kugPY1zOZXaB2S1/KO0kiJ8wS7QUdQMIHpFHE
	gfDHfROAPpLPF/+Wp/t431IhoyPmlGYNvM6SC9JS54LsCBCDPcA45fazKOmiZs2bdnawl0US5UPg4
	HZaUkd/OmObU6YHMSykLyUsoLgkvVWOt1XXsDw+Sf2T69WZeAfxObKPWPwnKrnaKuBh7Su5VZPzsd
	lvQkK4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tOU-0000000D7Tn-3601;
	Thu, 25 Sep 2025 21:20:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tOS-0000000D7SQ-1je8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:20:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQIpv012446
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 21:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MNWENP4TW6FfVNRa3Q4FonUZ
	vk/5CHP1DhoTM0WHlGU=; b=ncHx4GVXQYg6MMTCJ7RYXegpCgTcsQFO1PK2sWkd
	mdL+P05vzuo37QgxtWCzzjikvqfRIbzHDBPK0ez5c46VeFHhwz7tzQ00lD0zRCDM
	6DWYi0TmadbPFFIfDdo0O6Z7RL7udFzvm+hF+04cD1yL4uY5ez4uY2kW475XsnPF
	VSDF673dU2WEOcAl+v5CXgx523H6ACDBNMghyE+5idEDNK0MmUPSrrIrXewH3s7h
	VRxwnx6B61lB4j/f03MpkZCK2HL3bKA1fX7lN4hoDrufJ/SzHv9Qe3g94hySXbIR
	9jkzrczffUacIFjInqYrqkaby4P9/hURvoHJSDHISC8cvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0e3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 21:20:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8b8c3591fso40559731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835246; x=1759440046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNWENP4TW6FfVNRa3Q4FonUZvk/5CHP1DhoTM0WHlGU=;
        b=BENFhsNUDSELKp3aCTWzzabHjsD3TcFgxOdFRIV9CQifHBzuHYEbyMaSToaNEg8N7d
         GlPxerjTb0LKv7AIn8UNSg1rW7FG7d9YagJcwjgxNI044EEA5oFc390HBg7mBNODz3qQ
         Lea764gtsbVewoi7eOfyfspjC7PO4zlL62ZzLfQJ2lFe7bw7Jzbu5DAbm/MUJ3/RYCQ7
         xO6sZC+/4O+mWIjKfhV+uJXwOPVZv/ypSirHnSSA37TsE0qoPTmyje62+gQivCFRO9HT
         4DxdKu/UVQe6R5thGi73v2D1TNa79sTBojACl1QJaWjC3rW1Gi65ijVEizIscvV8RRE6
         GLPw==
X-Forwarded-Encrypted: i=1; AJvYcCVs17FSXksVcwcu6nJhU9TAuf6ge92ADt1hb4Zm5+BhZWijfU4uq9OhDL6Il5CdpoLNIxd8sY8127LDT946rbNI@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIa1ShN18Px66wCWXkhxZ8Q5FpOanParn0/xzs7ktdUMXnX+h
	mVZMA1UYWtXN1u57lkWJnK2PuoevqKUv7SV9astM9bVc182yyREQg2kfQYX4B+x+5k3dJ31/xQB
	+cjLBHAVUnyQrSBDxZ8EEdph8GewVmJsg+ra6hsb2cPiM97fXPSh9LIa6/gFDZPdWtmvqslpW6O
	5NIw==
X-Gm-Gg: ASbGncvbeUF0IV0oNccuiK6zznmyGNeZw2/8P20VjXFwjPJjAxN2t7/64RAwaBAyCD+
	IdG5nnXkwrz6YZ9PUbyyA/ZQ6S1SO/2J8C9T3/Ox5J/gkra1IRcNlD1Da2NloEhCVjP5kCew6Fz
	B69sWYJiWZEgjNxD/3WqG42YAcY95ZfGyX40KpGM7VYcYTMOaxe3ANV8pwsXREt4IKY1KEkZSAh
	BHxvjNEiZu3O/jwCHFxMANAGQessUb9wCKlkb0fBflYPIVhLa+xomGj5whd2T4HEsTkAOR/WwPq
	HpL3pMVjZ+vdBv3QPFtg/epc4tWg4aRC1vo/pG9Jseg3HiRoVZec7jvDFEYHyocwbzuU0wnM8o3
	DQd8nHUid2cALK14NUeNK7RwseaeLZVIuWxrxg2fjtOfNdV0Yl4n5
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id d75a77b69052e-4da4cd4705emr60742291cf.62.1758835246258;
        Thu, 25 Sep 2025 14:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zqTH59YzrLbgWLCbgeEbMpGPbOhNPJ4n+cnP8cXc6+u2Aei7sqWMXJ8qxBaawt/sIexYRQ==
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id d75a77b69052e-4da4cd4705emr60742011cf.62.1758835245791;
        Thu, 25 Sep 2025 14:20:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3102asm1122425e87.97.2025.09.25.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:20:44 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:20:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Message-ID: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 40VDXVD9HfiQSWt-4Fz4Wb5V19Q2zRK4
X-Proofpoint-GUID: 40VDXVD9HfiQSWt-4Fz4Wb5V19Q2zRK4
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5b22f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=awjpS8ss-hU3v18DcjkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXw6ZNRWZXZD1E
 GZD/EVAK+MkpBCcrsShQ9sV7cPdnJmZi5nufYDhUh514zBox3RffIbn62OAXkSwSBfkkCZTG4Xl
 JakXJiNPeCRwr4PBqMOJF8MwnihHswNt3a7keQeR0t7IxDuelVWemQlt9u5pcNjP/0DGvD0YjfR
 gaFCRBnOkHuAM0qtJ8V/K1g8Zqqf79NJhjgriDCibQJsfzP1ZvLAN0xYTEEJtUYeW5xcd4rQIPg
 VYVt9wiuMjRUrcFHp9e+ERMUXXxQvjmfkZOo4JD4ohtNQDwID5pZ99gbmkz72lbYldkft2epMV2
 C4H2r4XkR5/Jwq9bVTzC9ghjADBeDLSdgup3cJTA4Aiu8H4V1GK49SRHc+IKwaZmzPntturErh/
 gCt945g1TAMovYC4kMKRHO30zFdEng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_142048_454579_E2CD3BE0 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.

The commit message needs to be change to describe this change instead of
the generic facts about SC8280XP and SM8450.

> 
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e..dbfcc399f10b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -63,7 +63,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sc8280xp-camcc
>                - qcom,sm8450-camcc
>                - qcom,sm8550-camcc
>      then:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

