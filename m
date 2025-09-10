Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48599CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=; b=Y5fvHCup0WGCXWjoiKetBLy+SE
	peLrMH6sy4gRsXqygJD3PMIFxM1SDuqOWn2qBN4hes5aYWwQ+7bPuFnb6eZNfBOzXPp5s735bXCyN
	n7fBn+2sB0cHCFkPMuyOFlda7J8GEurzeW1DPBusA3h6ID7RxGpS9txaZU/TqarhAHmwReccgN/qv
	+D0j8Ck0vXMcpIcOuLQV9ePrMW8MUwls5y4lQ4zmp/1HI/4KQ4/UJIeKcu/fnWzZOQuyXEr14PNLM
	tz/CLB3fh0c4wNgi5QaY+sReqSl36xcfjt9zdNjJdQUYAFw7TDTZxIJe3YCHOACHQqtoBnIWtvcu/
	4kN1CY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL75-0000000ES5m-372B;
	Wed, 10 Sep 2025 13:43:55 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL73-0000000ES4H-1Z4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:43:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso51397751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757511831; x=1758116631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
        b=Q5+CBPyF0Ckr+76ZT0EjBCZabUb1mWD7n4o9WPw/YcBJ31GauVJ1rFkM4HDWfzyMis
         Lns3JU4nBOU4aSFqvz+vigbYaQmVZSvB23lSCWrSrWc0fAksmn2vAQKF4fbvsJWLdu7n
         NbDNhQzM82hOZrYiXRiad2q0O/EOyqXzFV+3OHO03vJlTtmF4dNPrCR9XZ0TppTvPJtE
         5e2znMQQXygUn3x7R2b6HZ3+iyz7wq8DUenDGdZ4b07zmMBWMeIjtmoyj1wtTylZGdID
         uIgO9gFMiKl0CsKF/WDPge43ZW3Y6ssijrhgLLEhzg++wegTg0DMVz7UpssO9s5jEUh8
         VjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511831; x=1758116631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
        b=ADxOBpfwZ31MyW4MJj6oD/+u/HWzMsqgqZKZ0YiTz9m6ANafw/8sfd3r5+zxKdQyzV
         +Tfpivs3x9CRCW1FnJloNOdp0dUKHlQ3alls41vYdAODQAFDLr+x/65ft2EEGEeD9UJi
         xH6lMPTuwSmghSzhZJXBdHgLkJiiJ9s5Ov3Qs9N4KMddBNb7Ie+KXVgMd8sx1ClJp/OE
         xAvomdEvqrAA/zwiJeiR9siIk7bHOqZ/7C52drlXybvMKAPxlM8Q/4In8jLhBM78oK8A
         luU54LAvg1plQcj2C1oZn/PVdBrp4CsFCmJh2Dk8prTmIhyxEskAq+ui1ixY75F4+EPX
         OkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwOEelC7KGy0U2pSmUJyNAn/WlZZP7R4uomKAahTEjs8fMb9SUMutGJfjPV45/1q57fVa/dQoNMgj1JP64KkR+@lists.infradead.org
X-Gm-Message-State: AOJu0YyjuJrlih4l/IeERhzjHjYvdCa/HGy0X67jjCOsqd4nZvDvKbXN
	8OR5l+f12IkaMBRSU9Yzy5QSiHl4qQSGtD3GZ+F34CTK0eJ48q7vRY9QkTvMzw98/BsH2Riz9Es
	C5O6tKQWx0DSVNqKsEous0PSxkZvXJy914QcPgONj+A==
X-Gm-Gg: ASbGnctSBt6TyvnzeE1pv0fdKx7uHrzz8okVLW9BecaYLuj5x0dp/JAesbM7e09/1qZ
	DhhQ30fIACbJ9bRdNzdIQTQfab0bWpKpABDzzfZykBXo/EWUG8kDHa28t7F0LaB6EL4OMU0VgUN
	2W4zx6f0sNEi6Jqkh3zmAjqNCL7o7+0qQmv2VMTCQmERURE4eSZdZ/wZ7rWG1JhVCYmhVGjI0X/
	F9/PREIYmIQfTH1YV1aAPnFOwr9agtTqSpKYpY=
X-Google-Smtp-Source: AGHT+IFm09bgx/eETS+zxh47Y2IF1gRYf9rbRYIHHMrehDx0L8qn2Ht4Uw5vNEiZ6L2mWS3ck3SpU2dCp6qBpa01PJo=
X-Received: by 2002:a2e:be0e:0:b0:337:f57a:6844 with SMTP id
 38308e7fff4ca-33b5a3fdaa8mr43894421fa.43.1757511830680; Wed, 10 Sep 2025
 06:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
In-Reply-To: <175751081352.3667912.274641295097354228.robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:43:38 +0200
X-Gm-Features: Ac12FXyZX2mI5u5h6corBWI5JwEw3xwlMcAzjYN5jnXKYMZIVsaIzZH2ILMwq1U
Message-ID: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_064353_446344_85A16CB1 
X-CRM114-Status: GOOD (  20.83  )
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

On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Describe the firmware-managed variant of the QCom DesignWare MAC. As th=
e
> > properties here differ a lot from the HLOS-managed variant, lets put it
> > in a separate file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++=
++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> >  MAINTAINERS                                        |   1 +
> >  3 files changed, 105 insertions(+), 1 deletion(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): power-domains: [[4294967295]] is too short
>         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-g=
mac.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interr=
upt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-dept=
h', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-d=
epth' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-g=
mac.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): power-domains: [[4294967295]] is too short
>         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yam=
l#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): po=
wer-domains: [[4294967295, 4]] is too short
>         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac=
.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Un=
evaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'sn=
ps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were une=
xpected)
>         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac=
.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): po=
wer-domains: [[4294967295, 4]] is too short
>         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yam=
l#
>

These seem to be a false-positives triggered by modifying the
high-level snps.dwmac.yaml file?

Bart

> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
10-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

