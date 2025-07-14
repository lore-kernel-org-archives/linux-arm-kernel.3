Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=; b=oG5AqPUn8tL/dK8c8eXwtWtKkz
	LdLlYbIq80ae/S8GlDKpGkwjiGcalQ3Ncp9jlOb2/b3AtAt+Nawk72lJVwScxTiEsu8xn1eai/v00
	DlZtm7h8GRwRzRHWQ/RYjlQPsEM+0PE+97gUDTBFFD6q5UJ3Ebuo4q32q5K4wxxow/dEPYntWuk2Q
	tpfwogP47QvcpFy8kZimDglIrAQhlNt7bHonAzp4SaDRKO0M1R4uPSg5ZaMzVw0Dbz2jS7EpgpMTF
	2FDOcsbq0I56EC/Lc/6zLq3H0o8HIOKnuWdTb4HfTzUn472lbDLgy0UBG4UhkUFlr8RQlqCrWt3cg
	rroowA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8xk-00000000z0h-3TSN;
	Mon, 14 Jul 2025 02:30:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8vK-00000000yoM-2C9y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 02:28:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMBdUq029068
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=; b=Wz6YCxqkz1Ookwwo
	mwfv8M+KivyoXwwzHCHRR4PEuzJM4R/fuR1WjLum6Q7rwbARYOUeUHzA0x1wXleU
	JNESETe6FMEKAR3SoaAkf2lqHQ1FNQCUihgy2BaZ+zIsg1SoAnVqdcicUzbOZxiS
	zkCa5FP0Lrgz47fDh8KtRMuiu9AOHX1Go8/8QblPasIMYtcJob88q8z2sxlXyIyj
	BjTMhCaW+sD5E94aLdjRFdhuYh4Z+Gij4OLulq+Km+L/R8uy6PoDHdFBkRnAkBfQ
	DuwwyVrUxLriYtggCs1m1uk/lIru/aV26n0nIDIrSo+4M1SZiMTNF6smTYZ0q4G3
	QzjWNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmaytm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:28:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36951518so4292964a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 19:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752460087; x=1753064887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=;
        b=wEUS72jhn3B4r07OQdoqjm+XUVxJFEJJ9Qn4kyfkuz0APtKH/R33scBfcYT5pg9+74
         qhSlOv/7vDqPCq3aP5zOvU9rfgESMvxHpEuwrHO7srQbLj48SwoAw4F60RU6SRjtVhK6
         8bRR/h26ssmLsHUqcAN5NetSleKoUDNFYNlJRKSRxf0tcdrZSxidYndbZoTY2pKgyYtv
         KwMfwUvSMZZehfQzhS18zmh/cjE00rrEJ16MzKjRDXBJlR8Zb8I9TlBC1FoF8DldlEc9
         2zR27aZkXEdJuIKURhrrA+3JyQ63hoOqBO61Sl9Lv2Bt+S3j1Wgw6BdpPabxT4MUl9ea
         sOhw==
X-Forwarded-Encrypted: i=1; AJvYcCUsvL4AFL4j4sW6j/vVe1i84Iep4PjWs2B95KXrOWhxgM1+9id0BSuwTQpKklCjbZlf69R51NqYvQgWG4fpu0aG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YmvnwlMXGsNvbX4n/OIOpIihhon4XeecWdyzveqp4JyDfw8+
	6yr8XHlhSIgbDMBCpDktJbxhtBDC1GuFrKwW6cuF1MWEmKl6jZZPcSpCs6UyLPDDCBcAUvBOa+Q
	dvyFESGH/vc3dpOS0d6eF4tMq/faBHQwsFtX5RO10sogslFV/3lJqtkQn9Urs+r2qIxhvhtVS5j
	DVEw==
X-Gm-Gg: ASbGncu2Xu3CSUBe6+pWnZsi2B8aQioCC+TTdKZtI6pQ/t/GMGQ6dcQoCYArJ4Cd97f
	MngLMGNICTZp6pLcpso2uQwXd8PXxRFr5DFRdpo53IET0aztfbi45ir6HT8ye/3d33qzAWEYsL8
	gJm1IFl5KAqXBL3k9OytTCrqfuEONFEsMXCr3QzpsZ2JVYUTmoeS1slGzLOkY7i9IydcbSYrF3d
	NrKbSvcbJcEMqwWaxK/uxJG5IYoARD5cB5DaE+a3v+wZShuCZz5LP0YkwLDqlzAuIc/mbPa2OJc
	BjS2/prf1C9k6b5fth8as5XqvmRHL5Yr2+lKgM1l3vqJVCVJ1ZnBdjx6POYCCCKWfODLPScVBUH
	g+4KxwkhefDkDNt4No3rzZJhiVg7I
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id adf61e73a8af0-231201fa1f9mr17819874637.28.1752460087291;
        Sun, 13 Jul 2025 19:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlTzQAbGBtic0xw9HUW209GmM3H8UeFAoNwCUVrD0zAm95+xPpoXxs/SybzhJTxECUBR7vQ==
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id adf61e73a8af0-231201fa1f9mr17819826637.28.1752460086833;
        Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd598csm10053918b3a.17.2025.07.13.19.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Message-ID: <465b60e7-fe68-407c-add4-856178f4cb7c@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 10:28:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Enable ethernet on qcs615
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=68746b38 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=mTSKI_wBhsZyk7PTtHgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 65Pm11y4nALJukabS6B1gY1XNgAPgkxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAxMSBTYWx0ZWRfX9SN8MmzqYt2d
 +OmB2Rwu/n/4BVI2cddwVKsXgnN54e2cDPkVDkSFJJUjnKDQ0+mi1POjRLSHKEKu0G5PrQ/SB/k
 TT9iru666op79LdiuaX7BLeYj8ySnJJ5WGpcOXoqgkkiXcu9iOCfh4IkIkquKPSp2FXf/uiFEmt
 +CZVUJlTt0mE0FFFx1Xn3aWSttpJpiTHeEV6QZjm7BjEp/OcAZR5O0/4PSDNXwCTSFbE4qHYQ6Y
 YeuuttQceg+4o69WgwHEmlgh6TOLnpMaY5yefgS0kLzlo2m2o6/dNQzAsgXAERxYIDnVBsOVBW+
 dVY9dUsnpybRkjU43VHSNrR+kYW6ft9mVFMGGtmmRixouSdwpBRrQxA2HTdw1rNHUYIbiQn+IcX
 HK3gVPvIlNC+FgI2cOnxCiRiEouLqst67oQ0JsZlt+Cudi9JjgrwF1Edmg8yrgXonzF7In2O
X-Proofpoint-GUID: 65Pm11y4nALJukabS6B1gY1XNgAPgkxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_192810_690754_B5F17A53 
X-CRM114-Status: GOOD (  25.77  )
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



On 2025-01-21 15:54, Yijie Yang wrote:
> Correct the definition and usage of phy-mode in both the DT binding and
> driver code.
> Add dts nodes and EMAC driver data to enable ethernet interface on
> qcs615-ride platform.
> The EMAC version currently in use on this platform is the same as that in
> qcs404. The EPHY model is Micrel KSZ9031.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> Changes in v3:
> - Correct the definition of 'rgmii' in ethernet-controller.yaml.
> - Remove the redundant max-speed limit in the dts file.
> - Update the definition of 'rgmii' to prevent any further misunderstandings.
> - Update the phy-mode in the dts file from rgmii to rgmii-id.
> - Mask the PHY mode passed to the driver to allow the MAC to add the delay.
> - Update the low power mode exit interrupt from 662 to 661.
> - Update the compatible string to fallback to qcs404 since they share the same hardware.
> - Update base commit to next-20250120.
> - Link to v2: https://lore.kernel.org/r/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com
> 
> ---
> Yijie Yang (4):
>        dt-bindings: net: ethernet-controller: Correct the definition of phy-mode
>        net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if configured with rgmii-id
>        arm64: dts: qcom: qcs615: add ethernet node
>        arm64: dts: qcom: qcs615-ride: Enable ethernet node
> 
>   .../bindings/net/ethernet-controller.yaml          |   2 +-
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 104 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/qcs615.dtsi               |  34 +++++++
>   .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  18 +++-
>   4 files changed, 152 insertions(+), 6 deletions(-)
> ---
> base-commit: 9424d9acada6461344c71ac02f2f3fbcdd775498
> change-id: 20241224-dts_qcs615-9612efea02cb
> prerequisite-message-id: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
> prerequisite-patch-id: b97f36116c87036abe66e061db82588eb1bbaa9a
> 
> Best regards,


Since my last submission, I’ve been working on an updated version of the 
patch that incorporates the feedback received and improves the overall 
implementation. I plan to submit the revised version shortly.

Please let me know if there are any additional concerns or changes in 
direction I should be aware of. I’d really appreciate any guidance to 
ensure the patch aligns well with the current goals of the subsystem.


-- 
Best Regards,
Yijie


