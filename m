Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE2BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaiuPSwScN1So+PWSJmzhuhak5hJv4sAaqtK90ZKdho=; b=YIfXgWMYRieRuYGKmg1YbHPxU/
	arcKM+YzwfvNb+4fMFKySNAfJcaRUKPkgfBYt7bOg+WlJKlYZkVNHH8f6h64qQlMmWf2AG4m/qC82
	g98CaIVEaB8JT7akJpNacY8qn2u0y3xA4TvpmskCcWVGT8I0nZQvTlBbp6QUWh6SVjcoW5nSQN/w/
	LVCy0vpv1QNM1K760A/bl72+3r8fXAcWgA17OvhnC57I/e2LZVoWmc0fEA90A3OrJ6IWgt175kIwX
	IgBiUEqY11Xat/SL9O3rDfsE8oqskPHfFPwAlUa2WjjxXSLB7r1J0KlQaTKF2OqxAEtCQPyYwOsUT
	leh+AWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw212-00000008w5n-1MjP;
	Tue, 09 Sep 2025 17:20:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvytJ-00000007ZsZ-0Z9H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:00:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LifW020685
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RaiuPSwScN1So+PWSJmzhuha
	k5hJv4sAaqtK90ZKdho=; b=Ozu9A2xCN38svH8qQO4SH/IbWO1Epuis5xzMXswO
	7+b4Wp9gy/wGuogKEFs87voIPlwJVd0wXF8+bnwLOW/I3Ks9Prh22YEbJIVUIAHL
	N8QTVvITH4REGAKtK35pU2W2ZoxekQj9I+jaJgMePRWmduvBnOMU+wocHN/C8Yj1
	MLgwrGIVV6d6dL055W0O5xQl8yeF9fMRf6hiDIy7825PHCt/6w/QCbBVvLPLeB9b
	+jnlsT14oC3tLtqMo2i2rQYASzN/Sdo+VuU+EzyFwvzZt8x612zYU79rIot1vNV7
	L+RyeDK7Yflrvkz9S90eUKUZ/EmjxngYyeVDN3XfRnwNYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a8b30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:00:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7296c012ec9so58283876d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426406; x=1758031206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaiuPSwScN1So+PWSJmzhuhak5hJv4sAaqtK90ZKdho=;
        b=FC6ILKXUM35e6ZEHe17y9IwHubOj9rtaTM6kYeiIyn3cs+ZTcKn+cvMriQXv7sP/9y
         n95nz0FmwaLVqlHo54nCrQxjpsCr16iiQE56NQ/2pnqAkEwdQrL+iAU6pXb8ic3FUuaJ
         QOHFkE9s5I7V9YBIRWXMPl55sEGSa+FTYB3rsrqJSVrOmjmTTn1i6tNIyJnalgI8amdj
         jNJLwc5tfGNGKRC+7bqhOGyJDAmBc9ty4jEWaSDaNhOC0mqpT3Rs9tB3IIXAsrkMJzOg
         s5M5hDbfAqmbNcMI6OW85XZ6h0mODc9+xWFdhR+0iapQTdnGB5jE10tQL2vzBQa3wpPa
         1ZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUScjMXN3wlh9yzhRJevTAnYv3GmLkNy6BWmYOhxiPGHmhWYngQBfMobLY5cR9aIjwXQvBkVMvs7LRkjI8C2hI9@lists.infradead.org
X-Gm-Message-State: AOJu0YzEho8en7RnFVvtXYbnpnqaFQJu8bGTUu5Yr9vnUpY+laMme0xD
	g4Tge6mmnbUqwxyVNTZuW8dEBjNy2plWfH7e7EYu/30dSe1E6hUy5JTAN1MzDyUvmviNSNqQL0j
	+Esn7wdQ89j+afnhwghyBQAeLSWKKUGG9SB3mD/d0JBMFB3DwHnI3h6bZWsOugn4qr69TdkgMNS
	P9Vw==
X-Gm-Gg: ASbGncu4CF/BXJkGMxDS45GWxWQoepvNGpJ5palRHUtc5+BjNtU6mbpC1vhFvKOmxpZ
	yCn5FnfggtgHhUphcyiBiXQpLGVt/4KUiKMU5sSqzmaA/4fCb9cPXDH8d+wngd2nTjbyP2s7wNK
	cn/SfZ/7u4nQCRAbvk8dKa+DB+vreCz9OEwrzpsr4xefZN88TqO8UNcr/D2o+vMDvZlARyO2a7R
	5CYaTI/F0zCJaoP5AX7Yfi3A6xiiOUCkPcxWKVu1q0Fg1amatMRVgwALPPNxxz2STGUuIFuxKij
	nPMg7uNoof79sMVKoJ8pwIwZ4/q734qAuQ+BDv96OG7PjBkJaAaTXLg0ZbdgVC6O0yin3j2948P
	yc/Zo8+lZZd0q6E6iXtuke2hRcTrLrw4bjRN9sK+afKZ1J9fvo6FR
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16533406d6.58.1757426405050;
        Tue, 09 Sep 2025 07:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj1Ux9j67rzf37hWL5A8Jozn7wOidkUvzvPy9tqT1pZirgwULyxpmO/uSUwFeT3zwLe1DRvg==
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16532636d6.58.1757426404347;
        Tue, 09 Sep 2025 07:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246b7sm546172e87.13.2025.09.09.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:00:03 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
Message-ID: <ez5d76piv6srwceueajokplx73xj6xtgvyqgtbpjkdtoo7ijgt@7xn3uxzdcgvy>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-5-quic_vikramsa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c032ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=vE47tFul03BpYyIIO6YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PhsUtREkyzPMDzbzLFpAPFh-3QEGAAk9
X-Proofpoint-ORIG-GUID: PhsUtREkyzPMDzbzLFpAPFh-3QEGAAk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX4PuIFYIpu/bx
 s37HymGMrb/VSG8ivpf76T/Irn5B7mt2L4tDHasb/zZBmOdUrkFtAEB322Uh51KgQsAKIvTADZr
 Z9RC14/An9RrrmsqidW+ymfwNyD5BlHibCAJSrrsPNz16FtnEmL9pJsyGiQpat9MBWWWWW1eH9J
 emRleyO81HbXm1ZLBzR5YQ8XdIMLdypey5NA7ZoUdpnjZDYexn3jJkD6XzpJrZzw2ix7HITbvmW
 w1x9k8NxI8IlzpR+V81aLpvdpHzZIex3vBGhL2MQy2bM9aCwyR8D/+/ITr5DEqBO+f8fRktvCpT
 NZKoAcfrEsDwY18QsJRKSAy90LaRgj7vyPCy2jciiNW6D8fXthH6WSclvUnBOJR6b9Rzw8SozXo
 4OeqOpId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070013_206029_919431C9 
X-CRM114-Status: GOOD (  19.96  )
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

On Tue, Sep 09, 2025 at 05:12:41PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.

Don't describe patch contents.

> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..559db6d67f06 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>      items:
>        - const: top
>  
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -158,6 +166,8 @@ required:
>    - interconnect-names
>    - iommus
>    - power-domains
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>    - power-domain-names
>    - ports
>  
> @@ -328,6 +338,9 @@ examples:
>              power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>              power-domain-names = "top";
>  
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

