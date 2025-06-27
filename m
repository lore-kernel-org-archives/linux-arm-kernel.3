Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45DDC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TQIk1vNThf+KbhPSV308tydy65v8ZFP99g2fX+hJzE=; b=w4S6I8BPdYROk9Tq68QNp/UrV4
	Xi1XBq4PajQORJoni7ZZq0UsPnvQuI1uHqaYqfKQp8/vaqK2V5JhoNeqSlS/WXpHUYgc1uX21uC/2
	9dLPDu3DxL6DUeFuOOMOE9docKlFYsh0/h/9E6BCRbjvmznWS2u0rtvyhsN7bylxRo/QhkD4TgAgW
	WtEh2wcHXv3vjkbPazzqt4QYl1q0GkEHCyiFvdYPqt+s0hK7eBDABMjUyYrYY8KBqK2a1YbrO4HEE
	X6qzl9Txe/Dswgnra9Uv1ZJXsiBqh2+EgL0rtrNTIEp7mtE7G8GIEv8w9znOgnbfADsELwRgzTIO8
	xLfsXvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7OY-0000000EVsS-3PME;
	Fri, 27 Jun 2025 11:37:26 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7LE-0000000EV7f-2O2F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:34:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3296242a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751024038; x=1751628838; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TQIk1vNThf+KbhPSV308tydy65v8ZFP99g2fX+hJzE=;
        b=rrDTXuX1DNfneT83YREtQhOfsJH0p5EevzxQH1mnNDN69BKH+g4oz+Be1wqP9Xx2XK
         aiCzH4zE/AKTjtTQMeuxXzWztJIW5D+E9WZY0DbJHfIcdWM5FOpX0NpDQKTduFEPe0gR
         vUez+OllXJMFR7hfcDh4wNFOY2K2D5EkfO2Ze6cEPzejYA2Nqct/lAF358FHRuuF2sY1
         nk7LfpCkYdeNyFPXSSQ6wrtZXFVYwNbMxU4Qf8s9KmYrmzUgD7O5/Lv4SN+Y+8mZUM7T
         ZQnJZg7+9NQBve/v96NSg3vI49zmoWkZpVqb7zxbMZvFO8m0HRaskAWDn7a8kLhbKCI+
         r23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024038; x=1751628838;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TQIk1vNThf+KbhPSV308tydy65v8ZFP99g2fX+hJzE=;
        b=fz3H7J6sOv6R3cORp5BCZl/z4EV1pplda8gm7JYVBSvOVALIUoEZ8P4fRwM33GrN1B
         96okTbWsGWiqy0lebtwhuCHZyVs91x49Bz4ETJ92CuhLJjPbyGA9126BHsTTTiRJ4CNo
         YYLmcXNwSduST9faXJRczHMAGq33EBRhXDq/uMDh4/uqE/dgGJB64ZhAhDJjagNE5+NN
         8JIJTDGzi6oCpZdfpp+0SIl145IdGUzy5ih/nRn/ZKDQwMA36QuWKnodqyjAdFePmpuH
         M/IDGVZ7Jb6HMPdsdyiazII/3GW9CFNIMGESU7zLzdFy3tiLrUmU/vJkOcR8Z2J0oQL5
         eVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwSkETYwvtk14/QJjq8KEK5bu7qwYn1n25FvCNeUmyJzJLFIjeo7JAHAflts+bXxWYeEJ0SGyFd39BIYKcL5CA@lists.infradead.org
X-Gm-Message-State: AOJu0Yysy2W3Aypxu8adrdp4PoaAjBCmMB6j1SnsUyIRTtVl1myGaT/h
	FS74sQTGUrUgJ4bKMfqF+ITjdcMRbsYDAfzT3nrFsZh7Grra/sn+E4QAKJ3ipHfLkKQ=
X-Gm-Gg: ASbGnct1R6fYI7rgX22nNo88DbHE/Sv9dr5mNnv5fqdnDfCcwJgF1Gt9fp1BBgyXKoo
	ABv0XVPcVCQJenGAw747pbJMhrBhhNmZGYBQcsMz+NrCbdqDCVA/eW/HMcKQ2jT5lSAOr23bWi1
	EKAnw3QCCCQKKwn07U/qF3rau7kan9pMvnO3fT15rul4RWaMa3Fi5LauZh0tbA2KGm3M/pW3c28
	vrm6Ji2CnoRvQCBv8lcNT/pOBzGQ3JWciNJLs9/bY4agqJLjXE8mNNc61tLjYocfINkzRyx69rk
	qBLt8zZI5PTlm4icq1n49aVzQQYmgFaigoRSaX/LdOXhKgYTj+gfH9RzCJdy/avNK6FXiSmJ+GL
	x91eKxy66H8Mbmpzgjv9xfJexnXozxtY=
X-Google-Smtp-Source: AGHT+IFTB4ZISQsWRjBnTltqxZ+EzRDnHXDtrROSz2QQZgqYVC+7zZ8R4yhdcBmhaWSRI1bSl9PUhg==
X-Received: by 2002:a17:906:7951:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-ae34fddeae3mr245758066b.22.1751024037927;
        Fri, 27 Jun 2025 04:33:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bdafsm108070066b.143.2025.06.27.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:33:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 13:33:56 +0200
Message-Id: <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
 <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
In-Reply-To: <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_043400_623172_4AC039C6 
X-CRM114-Status: GOOD (  22.28  )
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

On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:23 AM, Luca Weiss wrote:
>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>> on the SM7635 SoC.
>
> [...]
>
>> +	/* Dummy panel for simple-framebuffer dimension info */
>> +	panel: panel {
>> +		compatible =3D "boe,bj631jhm-t71-d900";
>> +		width-mm =3D <65>;
>> +		height-mm =3D <146>;
>> +	};
>
> I haven't ran through all the prerequisite-xx-id, but have
> you submitted a binding for this?

Actually not, kind of forgot about this. I believe I can create a
(mostly?) complete binding for the panel, but this simple description
for only width-mm & height-mm will differ from the final one, which will
have the DSI port, pinctrl, reset-gpios and various supplies.

I think I'll just drop it from v2 and keep it locally only, to get the
simpledrm scaling right.

>
> [...]
>
>> +	reserved-memory {
>> +		/*
>> +		 * ABL is powering down display and controller if this node is
>> +		 * not named exactly "splash_region".
>> +		 */
>> +		splash_region@e3940000 {
>> +			reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
>> +			no-map;
>> +		};
>> +	};
>
> :/ maybe we can convince ABL not to do it..

Yes, we talked about that. I will look into getting "splash-region" and
"splash" also into the ABL (edk2) build for the phone. Still won't
resolve that for any other brand of devices.

>
> [...]
>
>> +		vreg_l12b: ldo12 {
>> +			regulator-name =3D "vreg_l12b";
>> +			/*
>> +			 * Skip voltage voting for UFS VCC.
>> +			 */
>
> Why so?

From downstream:

		/*
		 * This is for UFS Peripheral,which supports 2 variants
		 * UFS 3.1 ,and UFS 2.2 both require different voltages.
		 * Hence preventing voltage voting as per previous targets.
		 */

I haven't (successfully) brought up UFS yet, so I haven't looked more
into that.

The storage on FP6 is UFS 3.1 though fwiw.

>
> [...]
>
>> +&gpi_dma0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&gpi_dma1 {
>> +	status =3D "okay";
>> +};
>
> These can be enabled in SoC DTSI.. it's possible that the secure=20
> configuration forbids access to one, but these are generally made
> per-platform

Ack

>
> [...]
>
>> +&pm8550vs_d {
>> +	status =3D "disabled";
>> +};
>> +
>> +&pm8550vs_e {
>> +	status =3D "disabled";
>> +};
>> +
>> +&pm8550vs_g {
>> +	status =3D "disabled";
>> +};
>
> Hm... perhaps we should disable these by deafult

Do you want me to do this in this patchset, or we clean this up later at
some point? I'd prefer not adding even more dependencies to my patch
collection right now.

>
> [...]
>
>> +&pmr735b_gpios {
>> +	pm8008_reset_n_default: pm8008-reset-n-default-state {
>> +		pins =3D "gpio3";
>> +		function =3D PMIC_GPIO_FUNC_NORMAL;
>> +		bias-pull-down;
>> +	};
>> +
>> +	s1j_enable_default: s1j-enable-default-state {
>> +		pins =3D "gpio1";
>> +		function =3D PMIC_GPIO_FUNC_NORMAL;
>> +		power-source =3D <0>;
>> +		bias-disable;
>> +		output-low;
>> +	};
>
> ordering by pin ID makes more sense, here and in tlmm
>
> (and is actually written down)
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-nodes

Ah, that's news to me. Thanks!

>
> [...]
>
>> +&pon_resin {
>> +	linux,code =3D <KEY_VOLUMEDOWN>;
>> +	status =3D "okay";
>
> \n before status consistently, please

Ack

>
> [...]
>
>> +&tlmm {
>> +	/*
>> +	 * 8-11: Fingerprint SPI
>> +	 * 13: NC
>> +	 * 63-64: WLAN UART
>> +	 */
>> +	gpio-reserved-ranges =3D <8 4>, <13 1>, <63 2>;
>
> Please match the style in x1-crd.dtsi

Ack

>
> [...]
>
>> +&usb_1 {
>> +	dr_mode =3D "otg";
>> +
>> +	/* USB 2.0 only */
>
> Because there's no usb3phy description yet, or due to hw design?

HW design. Funnily enough with clk_ignore_unused this property is not
needed, and USB(2.0) works fine then. Just when (I assume) the USB3
clock is turned off which the bootloader has enabled, USB stops working.

Regards
Luca

>
> Konrad


