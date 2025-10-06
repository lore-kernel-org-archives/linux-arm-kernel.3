Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdDqFKfxdRsbEFQxS413xAtJqLi/JD9yGrBIZt2nS7s=; b=vFUapK5nTD/mxolSKOxGxL2tdl
	/hceDI164sGXx6LliFoqjj2qFeHuPAe4nMrPeu8NMsU8jC+C0tPA9G6ZfFzfFzuGuQ8iOBcJMwuDp
	q8xT2GEayDiEzroCMO4DWlmAA30leqp4aW0nz/YUtDFqh66tjPw2k9oEH+x74RUu5NoTCEwwMlpMY
	iiZ1s8G7/Qeg8Z7DbMK/+tZ1FBBchEQR8vE6tYKzOhi0uaG+zFiHhyu2Yvb+8vhiH8iGsu9YdlY5G
	rhmv2ShDx8OopI6nnUQvHlTq9hGseRXWw86wO/E/EVWTpZntym81+l6CF7CEYe25231bAia1SqHq5
	oEcu9c6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jFd-0000000HTJA-1eih;
	Mon, 06 Oct 2025 11:19:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jFZ-0000000HTHm-2xre
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:19:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961DHmE014386
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Oct 2025 11:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VdDqFKfxdRsbEFQxS413xAtJ
	qLi/JD9yGrBIZt2nS7s=; b=eYySjoklVWJC6duqx1BCPWech6zXZkJGteyG1R0R
	F1SyG0UaSPXs2G4MxtfhWuwQNlRhV8/L4jS6259QnvLqYwJ5RrbQVRE+1J2xs4l9
	fo2uIYEY7w4x5f1G6iw/Jsy1Nf82Dyc6fnNvBaRsMXGuF1fLDlOm9kwNmBTpDKnu
	+ddhfD4Ago+27S4gmjqrkqIzR5ONiaSkmRM8sNpUNw8dyF14Q+ddfa9/mkFsKJDd
	JtR71cUpaEnTqCwb6rLZ9MOPQybt6a6hcGkVCGxAFdQxukCJ18CTzpxbK48DDj9R
	Z50k+TLpBNxJBWSoe363k+fwNvcfWRsku0jTOgWDIOxNRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3wf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 11:19:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d602229d20so89976811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 04:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749567; x=1760354367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdDqFKfxdRsbEFQxS413xAtJqLi/JD9yGrBIZt2nS7s=;
        b=dCpHaVPlYpKowU1dZRcJ5nUNEGmpoGLXVkLTgePExtTu45wOySLbkeUSgxUyo0cJC6
         AN95bb1GZb1kfTSSrhfrX+GlptK0A2z1mOEhywZWNuryO4j4n0GSAIJxSXlLaUFYQoqJ
         RWGrdf6L3XlHG8GGFOB1tlYKpLb/03xGchLOsNrzlGuic4bap8PHW9JF3eSbERsfkqsM
         mBDxhjJ0oqu8pBmhwnGGElg5qQfyZrDFi1nxr9LCUP+SXRwC9dbi+/rK3ItXOtUQ5S9e
         7gO/Z+0y0x9qhqR9xqcXyRuMa0yejjKaAvVLLn3T1ZSF7QH4TculvCIO3ZiuK+P+vxdp
         BeAA==
X-Forwarded-Encrypted: i=1; AJvYcCWLTx+kufaYM0zQpqgHP6QyRNUBZP5x4EAdyT4Z+Pensrk5T+5A6sGJ2OiaqrB+9Zjr6xI2fUUY4gbHUNYynaaF@lists.infradead.org
X-Gm-Message-State: AOJu0YzcrfcOQzxdQdtWOwAeqDGbvP1cZ0BN82JirxCRKseK3f0+0Uj/
	2bIm6pVYTZrBte1CAyB8TkPUj3wjq/wZCFU7hsDQanZI916O0MXgT7gap7E0CNbOacUOY/995Ra
	z8Xnui1nmwM1WoUeimt4PEpufD2NRI/TboQsgctJSxTcS1r8H6PId5la1h7BffutCxvbAi+oPoe
	Ihaw==
X-Gm-Gg: ASbGnctnCF9meG+fUtCdkidzuNDtmc8mFK4U+R3E/ELaL1Wu1lvh1ep+pEFErgYcxxr
	RSF5YbQUUqjRZCUwaABuoWh0SyKIsHlfrbGPqlGcSYUSN52IygYXmI6KBx+wAe3grnyn+C5Q77b
	TrXadjkkkU5ZdBFzJg0ZAi1bVb7CQQQlQoP7ty+9rd1kmtAJCdQAx5SEXCFrHRRe/gr330eggQz
	rRW9lCjIFYtl3S8vnq4jksGSBNBs7FFVdTyqWLWX8TWisJU28Q+mIEWuVHWnY1ovqDT+KW7p2o/
	tuwPgMfG//K13K2Hw5TeO1f/FIaSTVtxop27e/9OgqYyq9t8//ZLBF1idV3+6CZD18ohPw7HfhI
	2V8PERCto7zar/k3DdoEKbn29tZnhramSh1aDBLxB5lbUNjpTc1qBlO1V7g==
X-Received: by 2002:a05:622a:4085:b0:4d9:3bc1:1404 with SMTP id d75a77b69052e-4e576a297damr192482771cf.2.1759749567387;
        Mon, 06 Oct 2025 04:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6z3fr6lPNiM8lZwEQJjps6GoE5mipREKT0DxSIXFLLzmU3vusYTO80+hqG4PsU2cGm+LQqw==
X-Received: by 2002:a05:622a:4085:b0:4d9:3bc1:1404 with SMTP id d75a77b69052e-4e576a297damr192482121cf.2.1759749566744;
        Mon, 06 Oct 2025 04:19:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ee99sm4958551e87.106.2025.10.06.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:19:25 -0700 (PDT)
Date: Mon, 6 Oct 2025 14:19:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
        Algea Cao <algea.cao@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Cenk Uluisik <cenk.uluisik@googlemail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
        Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 tmds-enable-gpios property
Message-ID: <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX67zIINgcBhok
 X8BqdIH/uRnknunOyLE/WxaQ0vaJv/wF065lW79TOoRrPw0g0y5TP3MsBLfuSerPZZoZGPrNayP
 E1TRE9vHrC5Z7oi/j8usCdVFPh0E0OxjULAXDQoOzRcPSIWsvRJ01O5BONmrxLTcsuYYhfqPRJr
 VdZ6mBbkca17/jZ4nymturnJrVaXSbV/er5Vx0YE6lTb1IHnBzegG+PWf/CAFQ40y/Do8y57xyO
 P1pvkLFyAbhH9Ow/x1IorUAYUCeeYpC1tdw4l25x8i6R4kU2hOG9AcCHL762g8yWpKsA/uSrzdT
 gC8FJ9r67m68lnDKcjHVAlFLCUIY0+cFwgdxQCq2fiXx08tuk4F7u5093hKtMuyznRp0TgtzuBo
 n0EjKRPK80qFU8BjZhCxZ4MuNVnF8g==
X-Proofpoint-GUID: UKUtsjQ-NdpChOd1ya-676c1mCnQAJcE
X-Proofpoint-ORIG-GUID: UKUtsjQ-NdpChOd1ya-676c1mCnQAJcE
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e3a5c0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=QX4gbG5DAAAA:8 a=P1BnusSwAAAA:8 a=V0X8aylG3EXbbglEqaoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_041929_864977_4A14174D 
X-CRM114-Status: GOOD (  21.35  )
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

On Mon, Oct 06, 2025 at 02:55:37AM +0300, Laurent Pinchart wrote:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Add an optional property to RK3588 HDMI TX Controller binding describing
> a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
> deasserted for HDMI 2.1 FRL.
> 
> This is used to control an external level shifter for HDMI data lines.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> index 96b4b088eebe..eec0d40c91ea 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> @@ -113,6 +113,13 @@ properties:
>      description:
>        Additional HDMI QP related data is accessed through VO GRF regs.
>  
> +  tmds-enable-gpios:
> +    description:
> +      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
> +      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
> +      an external level shifter for HDMI data lines.
> +    maxItems: 1

Just my 2c: since TMDS is assumed to be a default mode, shouldn't this
be a frl-enable-gpios instead?

> +
>  required:
>    - compatible
>    - reg

-- 
With best wishes
Dmitry

