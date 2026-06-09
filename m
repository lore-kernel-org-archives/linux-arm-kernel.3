Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F248CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=; b=1b2UEZCqUBQmhwXoKMP1bIofhY
	1Ty9kXjkDWVr76bRAKALCFuz3MvJ3b7fLVTOwH/rUl70eUlbnT9xMe6ukWPdV5SYppxtqsPEC7D7d
	Rs75Hv7URIUHFtiCjusnh0UCUmWxB7C12RJOmeF14LojR1r3BUMxdNdhy8+ocTcZvszjHyKrgSayW
	V2GjvMdPkITW+TIV/WLZ601HhTQs0CNa4JlPuyyDOxOyeZHu0l7I/W2NIyV43ZUCW+KhfEzvGMjPb
	80hy4Q1juoWKYIE2JZ8ygZp461ZuGXqF4BoEbGiYOLvE2YFGsvCgTcY9Zys91OzBXnztgynO9z2di
	ErBAXeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsGx-000000057br-0box;
	Tue, 09 Jun 2026 08:57:23 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsGt-000000057bF-18CM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:57:22 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so9607948a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995437; x=1781600237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=P901jaR1qtV0HJxDq8qwkQIowRJ+1bXuKoAXvnqkNRhJpY6g1QkmiIZLnk+lVPr6qe
         IDETZKzP4/7xI6VYR6H5BWZQqdtVc9U2l0PBoz+rExTuxZdCmLTvzkBW2OmQKVebMFR+
         7gNQisB3RENL4ydImjW+Wz9OAd1vegAY+WIlHfVxKIwP5/hIei8D++BML4Gb/CiMQtlI
         raFxlhGzxpTDvtzypJ/54+HMAVTsmtZNBdz2qdPIPdJTrkqj2g4D1IEu62Ek1efJAdwJ
         L8JjvPPekX6g4It+MfIN/tmFCb0xZ/9T568YXMkOo4S6ArDiqZ7T3aSVbsGOwS0UBizm
         DtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995437; x=1781600237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=VxZtVOEh7kQJ3dzqRuENYHYi1Rz7JmZIE8ZG9YHhBMS+4Yh14fVbm+Y4L+KqQDjVJ9
         ezqxyu09wZ1dEVyBnFezlMtd+9ICseT90wbK1ef0wtjJbtM14AS8m0cny/m0vCKsqdwA
         ycwD8VbRzIIvzuQNFnakCf2skAjJbwfxfmS4FjUEg8AFlpHOfjk1UxNG1i95c9eEYYMv
         7i5AxCHXPeAKjjBdbOqXmn1qgJ16BwurtDYVgDf9CC9oD7ipYCLfsEfGCLouFluS9hY/
         YMGXqIZTw76lIoYmID6FfdnftoKFt3qLTV8d4OT7FJ9n7qZfYhQRbG6tbssGL9h4siaw
         ehXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DFg26lGMCd6IrMOiCX0lU/DopizGGaCUbs9ao1fFh8NMH9cABnbCEXOar+HGUGZD8KsVjvxU96xbSUwcbOsWT@lists.infradead.org
X-Gm-Message-State: AOJu0YzVrYjBt/qa/T/qJhU9G39S7MNqA5zwP/VhTY6jsGiQTxh3BaB2
	07H0b/bPLFfdmywZUt4dm0bpMbnJSJHonuBDn7mhqeqigfpDF1K8FSeif+1P0Ob81bA=
X-Gm-Gg: Acq92OGfP/Y7Rm5oXWv+jIjPlRiVSVekGnNzdbhlyouLEaV1t3YVDSht2MmyqYv6wcH
	72h6naz/Tx2OYjlmKy7s/T/KWa774ltd9cm6+D2U9nGF0lHsNEj3Kk/gjChxgVeRFRfhXqTRIpF
	5xo5rYYsIq+ImQ8QkT62lm/cygC973Zva6oufsVX7HlHQgV00QkvlfroudmsqUOSHb1x6Wpn8pW
	vgbgYUmkzWwSmJ2LvEpy0d1JBHu/QG5l/sZMOFTxORb5mwPlxMPnUeMJrZjKnfsQcq1unSl4RK4
	Ye4AoDqqdgtrU3JNTjRd5nTLGFVj8xF8hGWk/DXWrc4lj8hTtM1rDpAi5GMQTZO2sZzLlC1h02s
	j6p9pFFEFlbxxoETKme9WEMdND1g9rSsK/72WjeGh0l5I6MVrlubNTOs9fGIJdD2jU1NBPGH/jQ
	jrRDb62wy1yzcaUwhVsgKkCZaMsWweTTBtzRTs34YhMCMC
X-Received: by 2002:a05:6402:4303:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-692381fb3c7mr835032a12.2.1780995437379;
        Tue, 09 Jun 2026 01:57:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8343493a12.27.2026.06.09.01.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:57:16 -0700 (PDT)
Message-ID: <c3b9dca7-7297-424c-9ab7-3ea29e9cf914@linaro.org>
Date: Tue, 9 Jun 2026 09:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_015719_355553_4511B9CE 
X-CRM114-Status: GOOD (  20.08  )
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

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra EVK is based on the Qualcomm Shikra SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CAMSS driver support, CCI definitions and enables
> the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Used following tools for the sanity check of these changes.
> - make -j32 W=1
> - checkpatch.pl
> - make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
> - make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
> - make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=y W=1 dtbs
> 
> This patch series depends on patch series:
> https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
>    as fallback compatible string since Shikra CAMSS is register-compatible
>    with QCM2290 (Loic, Bryan)
> - Use oneOf in iommus to describe all valid SID combinations: VFE-only
>    (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
>    per-entry descriptions naming each SID (Krzysztof, Bryan)
> - Rename shikra-cqm-evk-imx577-camera overlay to
>    shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
>    boards which use the same PM4125 PMIC and camera supply rails (Bryan)
> - Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
> - Add comment in overlay DTS explaining absent regulators are powered
>    by the daughter board (Bryan)
> - Collect Reviewed-by tags
> - Add reset-gpios pinctrl state for IMX577 sensor.
> - Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com
> 
> ---
> Nihal Kumar Gupta (7):
>        dt-bindings: media: qcom: Add Shikra CAMSS compatible
>        dt-bindings: i2c: qcom-cci: Document Shikra compatible
>        arm64: dts: qcom: shikra: Add CAMSS node
>        arm64: dts: qcom: shikra: Add CCI definitions
>        arm64: dts: qcom: shikra: Add pin configuration for mclks
>        arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
>        arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   .../bindings/media/qcom,qcm2290-camss.yaml         |  16 +-
>   arch/arm64/boot/dts/qcom/Makefile                  |   8 +
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   9 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
>   9 files changed, 387 insertions(+), 3 deletions(-)
> ---
> base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
> change-id: 20260526-shikra-camss-review-cf6f66ac566b
> prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
> 
> Best regards,

I really think you did a good job taking v1 feedback BTW, good work.


For the series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

