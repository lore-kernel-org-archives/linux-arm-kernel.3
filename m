Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A522CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhjhLn4p+fVTddeDOV5N535Sl5j76d//X2bYh+lMLPs=; b=nrhHd5XV8Sa0X1GmEltB4xtZOM
	/D7v+SwtyW1qq9/TkijulUlFqeIVETRGdU202SOHHLufw9ZHWo+xGMUbdokgwHTUmawhbnzfSVvf4
	a+AcmdlQ0h2PV8rJF0Hj6sv29BZBQu07YiOufA8fn5rvQriZsaBN6C98GKElJogDebvlyBpQpWnIG
	o1+2K9cPvChZv9bXOTJRpdRn+jOOYZgkWR5Hlh0Pozc2nkKEqmQWduFDqi/5jffv1eKGsQyu/j+OQ
	yKFuLZV2mZJFAH0GUo7kgPH/T+0GeFbB+mKClTMqaVei7sXIi1TACfy5WNSzvfSxeZp145OpWOILS
	o6o2UzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2q-0000000G1K2-1IJ7;
	Fri, 05 Sep 2025 02:19:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGUZ-0000000EEIY-3FLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:23:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IguNh032214
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 20:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BhjhLn4p+fVTddeDOV5N535S
	l5j76d//X2bYh+lMLPs=; b=gIx24vXpFsSdYeFUk+FTmMF+B4fWHQdBzPmDn1LF
	SRJUli3nCxV50BpDCX1zqobOq32MoATgytI0qIMpMYtk2fVfWbJt86zys1vlIheb
	cViV+E2xviNdFDXLMdfK5WCGZvLlid0xsRG7K5iXiF5UFcVUm24gEW95xzMjDGRW
	4Dm/0Gh8RYXspRMoJL1mMXKXSc3otG7CWOmIjLz35eYjeNYSprPo1S2ybgR1Glcu
	xXNh275dxJHD5kI8+rxFACAbl1Mu6aV2Vw9A/WEm16IK2D6DI+HehFjC6Ki6etoS
	rPBFtMlReVhhyvGq1l9pAYY3qknNvEyGFz3E4pUS/uTblg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgye1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 20:23:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-718cb6230afso25646086d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 13:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017413; x=1757622213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhjhLn4p+fVTddeDOV5N535Sl5j76d//X2bYh+lMLPs=;
        b=PzeGe2aRnTNttUgOo+vVoeDQxQ6qxMf/5b8kwlEq7u4Ym8F9EhTQM8rg23gSRc1mZd
         +DTCWwxLj67J28V2TfNe6B/lO6wNyFmdcpoAyH+mAL18JZZhXOlxD0D+sN3hZVYsUZ2V
         I6iGLbfL6hJEwO8ofhork2uRqElsjRaYpwY18zjZNH8WF3SSsx4QxvuXacxBdyVOwPr5
         wM0fdcE+eKkK0Ytx35PAKYpp9pv1qEPG6v529OhFfcHOnEUIwAFkH5Ci38rJAN1iXc0v
         eN2jDq1lMvJxDq6hKbCUypdo1nqnz6l7KpWDY7Hp8LuH9fBoAAvjh48TdMjJCAonrycY
         I3rQ==
X-Gm-Message-State: AOJu0YwiXJ14jrMVbANF+sWOPAE/3rTOkekjF5WsUV861jn1cpzOVCsy
	frAt9NiYpVWtR+ucQ+B4SjarKuVrF+W4Ki2TpAn90csS1eT26cLsDN5eOs0+iEW8NnMUdnWNYVQ
	4a8SBvdiZX2UyvNxv97ruSsw79RLspXAuVtCmwVAPVcSD1sw/9dAWpVx7cxqX7bwOTNnN8727xB
	ClOA==
X-Gm-Gg: ASbGncsbjjn6Bx4phBlOK7DeMlrjQACRo54SDNqFHc9A+STAJJbAZNe1yLNKfG4hNTo
	ImyzxX6wpnQl3ToJ9UrqZ0c1F9u6rwru/JTgge3RTnEUbTYXbE/pq6q2nq9UwHx5CQOM7hkfFa2
	RG/f9kX68Ralrl3DuWCTdxa/iVoMlec/auVPqZC+d/qvxFPD+DZ4h9xHhhIkJ4kWYF9YURRUCOj
	YFqgb0ezMqWboY/uLPdYGGgMD/7iuLaG/q5CyjvC3JSiDPXRufSfNcmnVSIEb7ys4xmAoeH8E3g
	os7EZXWMM8fOn1ZgsYQc1TGQv4jRgwPT7DoeZ9rKt2YVocu7U7sY/yb9VWY3neOebb0x+IxR/tH
	omKQ4JQgetX7JlkAteakJ4OaqFhZfTi0dl3AJDgrLKpYSdY83hHS2
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id 6a1803df08f44-70fac789c6amr237886026d6.21.1757017412551;
        Thu, 04 Sep 2025 13:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7DTtrjAmMG4+SbOuJLgcfs9oxMwNnEiEQAc0Pfy9/m+t6Z1n1hx4a3Nf6n68AGum0eX+41w==
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id 6a1803df08f44-70fac789c6amr237885516d6.21.1757017411833;
        Thu, 04 Sep 2025 13:23:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c0acsm1437638e87.16.2025.09.04.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:23:30 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:23:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
Message-ID: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
X-Proofpoint-GUID: QqDTg5Vnyt_peRVzA28bsd5W-GcLzM4Z
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9f545 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=HSFmO_Wm-5cOy6Hx3LcA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: QqDTg5Vnyt_peRVzA28bsd5W-GcLzM4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX136ji0DOnCaL
 ofYbWylMiS8rTKqTtwqfmw2n9kZzy0x86PTJCqd21asf9aqX0EB/Dhmc01rtbFrgy1Xj8hn5ij5
 usCRqCI6Y8IWYFSdKJosVhV+cgKypMi74n7gXTJh+r4YljCHoDVRAcff4MZYmzoJDcFKgVrlZym
 S9k/e/Ztppk88WBrH19pL/IjDUwWVQIogkmqn8AHjyU4DFP3hs3VZWBVFA3xl75qxDZPmuc9e/9
 atgeAzIENiRrqcYrrZR4+5JW/ThGlPUF0QAFzwikjAZ55UxonPX/faTHYPO0/9nUiqHZYGaE6SQ
 jB0pUo/GsGJ/5wltEwTsKf4KFgw2Ly2oOCv1q0Cd8UrFcVupfcb6qAzY2ngNFD2yUu8rNuHfhhK
 jq2dbtO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_132335_938526_743FA263 
X-CRM114-Status: GOOD (  24.38  )
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

On Thu, Sep 04, 2025 at 10:03:08PM +0200, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index c167795c63f64..f663bc6a6f831 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -14,6 +14,9 @@ description: |
>    R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>    to four data lanes.
>  
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -80,14 +83,14 @@ required:
>    - resets
>    - ports
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>      #include <dt-bindings/power/r8a779a0-sysc.h>
>  
> -    dsi0: dsi-encoder@fed80000 {
> +    dsi0: dsi@fed80000 {

As you are touching this, you can drop the label too.

>          compatible = "renesas,r8a779a0-dsi-csi2-tx";
>          reg = <0xfed80000 0x10000>;
>          power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> @@ -117,4 +120,50 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsi1: dsi@fed80000 {

No need for the label (dsi1:)

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "renesas,r8a779g0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +        clock-names = "fck", "dsi", "pll";
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 415>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dsi0port1_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "raspberrypi,dsi-7inch";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0port1_out>;
> +                };
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

