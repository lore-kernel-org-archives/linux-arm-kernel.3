Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE9BFD0078
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 22:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=; b=EOAW4mwLsGdqVJdiRsik3stV8+
	YiAEIeKq6/ltjhQrv5UwFmFZSkTr8e+LtSQTe2UEDdbEHPxo6wMhkhOzzmBH9GcMhWPn5PQnS3z+q
	DW3Xww/l95dh5WfHfxOOSJBx2CCDa52NiqjGF3dQkDN1ph67l97q63kDcozEWXL4E3MNeAQ7yCNYe
	I18HME2Nz5mQE8IjQNjfW4LnBx+1Nl9SyOlHqr717MjAq845eZlXzSkGxUZojmed7NbFqxko8t/tG
	bCTx5cQ3c8dQfELceyD8IGi41crTbBWDdb1wuCbFNOaArhDXLvVnUeLe/PU/yizMGn+xIFd2bp9Bx
	4DEGaUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwpSg-0000000BxRp-1c2N;
	Sun, 01 Mar 2026 22:40:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwpSb-0000000BxRQ-0TPj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 22:40:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621JHfKE1878551
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 22:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=liHMhkUZwLObZQKcaR0dCOsp
	FbGoGsXIqL6LcZpPJfA=; b=FmVl9CSH3WuzakbWRWrtDYLnsJ1shhPHQUPlDcIe
	+9lv7bblF8fP0J2Pw0MmfcBT7vGoLQmrPCXiIyWaJu0Jpx38Gh8RfROnel/TuF4+
	FK8jVR4/TdHq9zqhye2kFv4nJoZqwxlJcfl5J8qRo40FtvI5l9KnemiwpioGxqWy
	2BKC+M5JSMqOQ8tsfh8ybY2Ho+JnCHu63zxiQh4uw/2OG1SYzfPgHMYDB2q3qeWx
	gGAk5611x3LjEVhtnZ1p8DG90CP30UrenFVjdemKCH2eU1rbTYOYVyRxM42JCdM5
	pOKXaUr+dFIY4po0vGSiOZXqlE3IeQ0GEjUxAoNgI3xOhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg739q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 22:40:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so2777775985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772404823; x=1773009623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=G1vA75ovaU3IyF5lDVWRdpIcPr3Od6tsFi6oxjMARvGX2n0Qx3QmRsTD9E1sHBPtam
         tnedcYRlxJRZehhw6wQuMbTjYBEdiJv6MetkHe06lG8hhFqoB1a6jNpYXjSaXHT3ktie
         qQYx7q2xSGC8wd6cCsp0QsR+duKEFXBh2/gkhYSkTgJGnizKYRjSfyt+k1gcuVFqhICO
         Xm5mthkT374LgNYQz+sa6On5RcaFolLGJzQMetKrzdrKRESpPU5w7W+HjsqPKOFK3z2h
         BmZJDQu4womGZDBT6ImSaSQWKYIy4NKnjNy3v5u+WagkaZ9aeGu8ZZjIqJ9vlEEZ1mM1
         kbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772404823; x=1773009623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=WjtAF4nN78A8/I8jD+CEwKx2Azy5n2xEY00zeBrSPbbV0SulJqGaXZCcO1ZFZNknhu
         +osixNBTWWMZHhoZFVCNV13zIq8DVGYEGmgJsAKNaJrpAkbuXTbDpMjqwIpQ5MyoohhJ
         LiIOOWLrAmnBpJn3DrBPrTflzSIFX7innBpSiLqcL3EejPV+RzYcQp+rDZmEZDTDuXPg
         IZjc+WAOu1PYT2aJcJW0FRpC7aeNCLPqAbPRdcC6acctBotqyhXRwS4TIonYTa2crj8n
         q8dU2sSvcDkoe0kOIJR7U2sokXnPyUdB0gHN3lfFkZG+NZHgJ+NRMwGLIq+/FtrYty01
         4iCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgXUrsjPPDyUQ6HIzy05nmbAgEG3Zsz0t8ZUMwyDIPHyWJ/9rxuKxW7FoCBhbv1vZf2BYHr3zoC0/NTwG7bWW7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FqCRpsGI/cQiTqVU6oXnSVrrUR7/PAcGxxDsqZe26f94NBxS
	RvSe+h2MNDJbCXIrC54UboEr3wTus20BxZTxyAe2dBjSlWpS1WH+jGUgYaOmtUP4lWCgVYX3jFW
	bHeadb0a22SGUbTTU78FgyoZ9PbMFb8NdKolpbPolY35K3tMtrtvpMZo1ptHhOyRuiqfSk+QryC
	UuSw==
X-Gm-Gg: ATEYQzwIFY4XmJspDfoZFwtvtQwtFQd+0hnKxMbkTwrpwiyqSbpgfQajNrFmSXJxeVM
	JSAm93aEIe4ANg1uSniONyouargFdGon6Q4f+8DdpsAyU192mk6WcRXzRFmIYi1dmw3lGJ2D/kO
	nv5aDpBKIBH2oQV7UwcP0zvm3s0XlitALbM2Reqdyq5t12SyaPJ522jlb8sm65g7TQBIDZctViO
	Zn3pEGD8TbrxlkshacEGg+SktjxX9V2gzln2U75SSd5TGP+s9YcWdWLYHKK+9/gqY0tj0sc450O
	9nvjCWqfqyhSCD/MFMr4wflwdoWr6+X83TO+M/uTE80bZh+HIGlW33Vg3TAy6+NEu6ijMWemv6k
	H7eSLx043/rp/910ytFvi3VXNiLqo04MNfJZQpib7cu1UWO5sh6ltEDkGy6jkNY/csqA1yWLwrs
	nypoMl+JJmuJr3JOw+ayOpvr0RSMBlzmcCQjQ=
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468463085a.18.1772404823117;
        Sun, 01 Mar 2026 14:40:23 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468460285a.18.1772404822548;
        Sun, 01 Mar 2026 14:40:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016bf6sm24553701fa.32.2026.03.01.14.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:40:21 -0800 (PST)
Date: Mon, 2 Mar 2026 00:40:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <qibmsgfttxo6kiaqyjljj6otamqp7okfr4abwpmuo7daanl6qu@ka33zvoz7lte>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
X-Proofpoint-ORIG-GUID: kzVE2LeuDxfP04WilHisShibgRlPGi-3
X-Proofpoint-GUID: kzVE2LeuDxfP04WilHisShibgRlPGi-3
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a4c057 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=tZRLSl_A3aL-_mRAmj8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwOCBTYWx0ZWRfX4jGvAFFW4tYP
 hbyy+NoC1coYrcw3wbk1H7PMcSi2xLCj2A+dLSyBZy5cGSK0pw7K+N3wyzjhxXPX5/1j+dz2ZWg
 zsD9Z/GiRLYCxi/RyI6z92E6kdmWq0K7BDfHqIzx+HF4n+EWrVyBl5T9CkkEg3iSQl50+I/mFN+
 ipfoIDwEFrvCzFBecP8Zfj2FHHIReoXAPfW1lax5Qmp1L8rGJtCRSCTfxA2xc0v2j7hbdzQOkv9
 Iy3RYP+qDhzr+s3PMv4mlCubNTPgZicUgZoaRoRt3s2d0LQZ3EHR7uoZk+SF9IZuThbepbtum92
 g21qdroCSm3TKBF/nePtw5a/VXNcTyBigSn6EFfSzMOwcrUq/x7/P+SMNTEmJdswfp0KZMVZmHK
 C7yzxfb7oScFgOCzYBnoqWFV2t4gXdgeymioIRNlLmzyDGB2xoSb6oA42W2soIi0X2B6Mhwgf1X
 +4skhDL39UqjPLSz/UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_144026_192977_A055158C 
X-CRM114-Status: GOOD (  21.03  )
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

On Sun, Mar 01, 2026 at 06:51:22PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> index 64c4f24ea3dd0..329d89977bdbc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: st,stmfts
> +    enum:
> +      - st,stmfts
> +      - st,stmfts5
>  
>    reg:
>      maxItems: 1
> @@ -53,6 +55,19 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stmfts5
> +    then:
> +      properties:
> +        switch-gpio:
> +          description: Switch between SLPI and AP mode.

This doesn't sounds like the GPIO on the touchscreen, more like the
external schematic component. If it need sto be turned to one position,
it might be better to use GPIO hog for that.

> +
> +      required:
> +        - switch-gpio
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

