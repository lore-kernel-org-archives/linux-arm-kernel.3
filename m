Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E19BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=; b=0ALhzaQA/RuDzfrSouFdcbHIWB
	kkqArIA/ZOv3oCA7gY2D77oYwM9C5Sp/gN8ZcOMz7d3RKZDBOmjp7scDCDvbDpkNNwdginmXNllvH
	3VfqIHcsALPoSAC6dypoFGsQe/2+SqFTTYdmQWZQOfpqdpeh+VsEwTy75GdipJUvfrPT91JO2aJaa
	03bkhkLJEi6bRSfWtcxeuAD0+DbY1WfH1SUyHm1kPu233vFRBYJNY2oHT0gPpZRQpgU3hDGyunBFD
	PK6B2VN5PbcUj76L/Q6N/GR73RLflycP1VJqJ9I0+BGLychA+9JWJDX6/yg7KUrM63BDJW2POmH+t
	UCGaf2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI6P-00000009h0m-3BP4;
	Mon, 13 Jul 2026 14:57:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI6N-00000009gzy-1b1t
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=; b=iiKcAYc5K7AQJpYAHtleWRKuv0
	V2AOGjGlz2h2C27HEq9bW5QkUUxunmhwAi1iLyI9dJHd2EZLnoPeTIolVr/vJAgrbPvolkwCT8y/Y
	m8eRaAbZx6roiuzsHLUWYSAM7aSvRUtFuPh5Axiq3c/hCNxGb7AXFAbHFU8TTNDwVOPoKDjlL33dz
	xPG3BtZlZdEf+63VTndziN1szpBX7L6ebMV3JDZOr0b2UrOJty1tEL1XKxibuMO2D34hYJ9u7CmRQ
	JvZyXl6zaqlzgFZeWuqx7bvD0kclp1MwrUDacamdjFLRZCSACVW/IU0CMVsh3rEU0lZl9xuW/VD5W
	ZB+KYYwQ==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI6K-0000000BkEd-1KDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:57:46 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c160420289bso397036566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783954661; x=1784559461; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=0qnMFoOAfiFvfAjBu0UtRkQmECBYIWnUuKROuODYJYbXHsf2pV1SK2XXalhJcijrfa
         r0R+OvQENWhxq0Nd0CFOB+xy64RmgpRJNwCI6+8qEdojvB4pJXFNb+1aPZ2apxF0Jrgc
         qqkCwg9jmly/ew6UVUG+nNxoO05Pi635eONpgjR9Q4RVxmrlnjCJZLHZrGgz0sSYZsl3
         vKx4cLyndiR6Z1LP3LbPorm1MNYnSCavpuJ/ex/pqmXCu+eScbwF1J/3qtYXRgGeXfBt
         9+FsXxHC8/IfnRcLTeBdxJNwG1PUgEsG59yYOIK6k9Jia5ERHhSsnfmeWdL6Ksj31S1Q
         j0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954661; x=1784559461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=oIXjn/PoM8hIUp0hUdfBzrc66q7IVlUubBXJlK2U0josWmT1JzmBXrAumtvin4pWL9
         s4nnYPXMi0dWm99Kc5gfCfSS8pm8XYtNIsFEL5mjXclB7rWoVt3EbH5xUQktuelmqzKx
         1nuAfbPHDy4JQYrsJSsbsyvKPhFaBw5IRP6mmyNzOBUnwovzPvIuubdrg2cSJtfWKYHw
         kse8SxtubqaDN2xg6go8hpifPlgqpgd2RKF0VR8EF1xqKyYBdArYXPaVcHjS/3gO80Wi
         bAeCTKejmnuh3p+P1PRr1/UGzC3M5UB0Sy+oHzF/N4+Rr5HBf8Rc7XGA0aU3ajK9GO35
         r5fg==
X-Forwarded-Encrypted: i=1; AFNElJ/wJFtCHJJVHNrIn7nC7TQV/7GbFaVBAkOz3HyuQ4R0DJ1lgr+jJRrfsH6lZm6g99K2OznuWyXh0I9oCkIyZVV8@lists.infradead.org
X-Gm-Message-State: AOJu0YxjQe438VU0gGoPsZjrLI9/a6/Vk8c/dXxNuHzYNFbclUPOekEq
	40+bo/Q9w+gYxQ/YHa00NHktf/IubQjSVpOsIuqhPWfZiYgjtdnMe0s/Or+rMKphM1k=
X-Gm-Gg: AfdE7clFMnEKBAyIkLElHrfmS5ddLUAMW3tXJLmD/i8W7OINFEVJ5MH+IKP25d59mq6
	Ov8REj5yWP5RhXCToTmu3qoooQjYZSTHfSMzdZ/2gpMYeoG3WKJi6oxIB6tTtRKiYlEkoi77faN
	GsTrTL1ZxQW6nJpFWkdqmBz7uRJS820t+o+0C2nJFm41UjXcmhzKHouF0J3RDDqnbbP3LCNvOTZ
	SacAyZtPh+yjIOtQq9K/C4qn3Fg+jhuwsO8MPziqZ4qHWGIBCfDjkSHitzGU3m343SAJt2d1hnP
	G0ltqaNGIrLzkI6icuIvEU3+A/ch6x03oChYtpl7Cp02hZ2FtSaPAZbnh9k4YeZ/1f/JEDflpm/
	WBDkltN0lvZTDzUxosIV0BQje0fCDqTx7Btq4Jfp0YYFxXNhyV0avK4h8pZfUZAZU55E66PHg5a
	pGh1w87nCfQRbVnBpmaeiEyKYNLcCd+6asTrpxBOr6sA0hPpiZ7PUDx6uLKA==
X-Received: by 2002:a17:907:1b1d:b0:c15:db89:f0a0 with SMTP id a640c23a62f3a-c161f3935d3mr373847566b.50.1783954661073;
        Mon, 13 Jul 2026 07:57:41 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm1005757166b.4.2026.07.13.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:57:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 16:57:40 +0200
Message-Id: <DJXJ5D2PSY3J.1Y5XS6SXYFRBH@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155744_578025_13C044E7 
X-CRM114-Status: GOOD (  15.19  )
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

Hi Taniya,

On Mon Jul 13, 2026 at 4:53 PM CEST, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
>
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade640=
18623e49623462c 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;
> +
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> @@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_CAMERA_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;

At least looking at downstream drivers (camcc-volcano.c and
videocc-volcano.c), both have

  static DEFINE_VDD_REGULATORS(vdd_cx, VDD_HIGH + 1, 1, vdd_corner);
  static DEFINE_VDD_REGULATORS(vdd_mx, VDD_HIGH + 1, 1, vdd_corner);

so from what I can tell based on that, your change seems correct.

I'm sure you have better documentation than that at hand though!

Regards
Luca

