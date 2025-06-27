Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DDBC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlrE0erJ+soHw5jj+VujnDEwpvOXS6zY03LMDq5ZPE4=; b=nj0JFTnwiGxfvbS3PQrJBpAxKY
	kVyHF0dJOcnij8PS0FABoC2wKaVx5JQbhZeHncEjxof5zeVRir4U0yq3UtTl/srOdcVdEch1oOHlj
	USYTyCM2/zlIgJRbzqzCMKGvpxqqJ2AE1+1yU3ZUs63T7J+Pw1/CM05qFjKEng52Wwh+yJs7XO45c
	ODGWwG/+Wf2glO3nh/oDpqq92MXtsmlAhWjTlpRW0/wc0wQNqKqswclgzAfMnMMnQjVtWsyNgBqUu
	QYr3ifjRpSJ/W6YuQJYP8M7WLAh0TIkjcaxxAgpNQ46J2jkLSI6IikWJepI7kxQuJLphOgJN3nOfx
	HAyKDKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAmK-0000000F2m5-1CFB;
	Fri, 27 Jun 2025 15:14:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAK1-0000000EwiF-18c6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:44:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0e0271d82so307670666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751035496; x=1751640296; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlrE0erJ+soHw5jj+VujnDEwpvOXS6zY03LMDq5ZPE4=;
        b=ljUSrs/VNRejc7mRMitn0cqGtnmEvXwnkXH1Kto7Rl3FCvU8fhNd/zRCgDR23zFH1G
         dOli4VdwHqzQEZ1YLPn6tsa8WVKpGoUPUpujhUa1oHI38lhXTnNTJrJo8tFHbHkp27tZ
         ++OA+EmPry3XoW81wdFBdETHgINIEKGoJ8aAbmC3Ni6Oy3DBCy6ij/744tYMtlAhkvWk
         tP3mBsz4gWOvu7176dATPTAebAamIo3RDeI8phOo2hkCKtwQPkBL2tLlovQQr3dfR9P2
         g3/VZMITsPkdnCd2Ql0RxUSnF2V7YMXNbrm5iA0keLLkn8mGcPUnyGbJhzma9sIGRR0N
         1zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035496; x=1751640296;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlrE0erJ+soHw5jj+VujnDEwpvOXS6zY03LMDq5ZPE4=;
        b=ej+XwJRqkCQ0ECJkgr66PQVSFto7srM1c0DlwpV3Ac67BoudW7r9xE0uGMPnI/IY6n
         x5n+MRnyqDFzvGVD4u5G4VSRQfZmDDRpBUjHY56EfSRwKaudDUkreILuqe+gAoH000h9
         aApuNY98WOv1B+3dO6HNlsO7oL9CaQl7NLBT5CwCZYtFPvAGDqmnn1Ew8iMCaJyt/TJW
         vRTvbGBaknVs6kCgCA4mKjjs9BhNnaJQvcOuvVrq3Amro3W//5gqBiD8Wd/MpBg5BNts
         4eeDtIXNh/Owi6HSaeb/nmw2CuDhWXpjwwXNU2RcypSF0UQhlsz3IaWP3h1uPxcLkdqs
         TYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA/Z998lbUGIIraLIsoBuU3PG2TzGDVnsqQrglZ8t/wE5O4kDONGkRygCaMsomMEVSesefK3slIf0lx3SdfzVo@lists.infradead.org
X-Gm-Message-State: AOJu0YwbfdzIH3K01ZkztW2A0yBZF7Vf/s0UlJH6WKxYW2sLw9d5hgTM
	SxvKjCZ89sS70P5HJO+ENs2fnOoni7tSAHs0dUWL+4o4GWyyGrety09aixZe7vs9/PU=
X-Gm-Gg: ASbGnctv3sjrLjrDHgRbiSMnrrFqowWlVkV4TdQgLys1yyDlHQ5fFw6MZHgjV+NM3OX
	Iuf3lLbNsZ2Ar7nOdBM+8838S7nWMsXU/WHJXYLJrulVjeBemPTqtzpFpa44syZBHBPDNdu7cJh
	pscYzpoaYKts8gNHiib8s1/U6DbpnsRVqHRbW9DAmzY2AYDurHRatfkV7h5HUACISmjdwU/KXsO
	vHhl5fCCz6j1XHDbHqpQtN8xIonTEImBOMcxsvjmIfYjCMJeRko+106b6GJUBCzSfMNL8qqw9/W
	BpaTmWdS77U8tYi+XbUiP5sJMQBHdyDDVUoZca15gI7D6nF1+77FejULro+NxjgCy2htK47ioqv
	HaMd/znx6wz6KBfamURZKsXctXI6HhaI=
X-Google-Smtp-Source: AGHT+IGA2mn71bXWbYFILa0TCGmj9njdVsOBKtFNFMdVa00gcI2whAz4/eBu0LzWjRNNEejwRdZugA==
X-Received: by 2002:a17:907:8691:b0:ad8:9b5d:2c1c with SMTP id a640c23a62f3a-ae34fd8cb6cmr354056566b.19.1751035495488;
        Fri, 27 Jun 2025 07:44:55 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b35dsm137152566b.13.2025.06.27.07.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:44:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 16:44:54 +0200
Message-Id: <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
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
 <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
 <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
In-Reply-To: <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_074457_335327_F2CAC2DD 
X-CRM114-Status: GOOD (  26.35  )
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

On Fri Jun 27, 2025 at 4:34 PM CEST, Konrad Dybcio wrote:
> On 6/27/25 1:33 PM, Luca Weiss wrote:
>> On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
>>> On 6/25/25 11:23 AM, Luca Weiss wrote:
>>>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>>>> on the SM7635 SoC.
>>>
>>> [...]
>>>
>>>> +	/* Dummy panel for simple-framebuffer dimension info */
>>>> +	panel: panel {
>>>> +		compatible =3D "boe,bj631jhm-t71-d900";
>>>> +		width-mm =3D <65>;
>>>> +		height-mm =3D <146>;
>>>> +	};
>>>
>>> I haven't ran through all the prerequisite-xx-id, but have
>>> you submitted a binding for this?
>>=20
>> Actually not, kind of forgot about this. I believe I can create a
>> (mostly?) complete binding for the panel, but this simple description
>> for only width-mm & height-mm will differ from the final one, which will
>> have the DSI port, pinctrl, reset-gpios and various supplies.
>>=20
>> I think I'll just drop it from v2 and keep it locally only, to get the
>> simpledrm scaling right.
>
> Yeah I think that'd be best in general

Ack

>
>>=20
>>>
>>> [...]
>>>
>>>> +	reserved-memory {
>>>> +		/*
>>>> +		 * ABL is powering down display and controller if this node is
>>>> +		 * not named exactly "splash_region".
>>>> +		 */
>>>> +		splash_region@e3940000 {
>>>> +			reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
>>>> +			no-map;
>>>> +		};
>>>> +	};
>>>
>>> :/ maybe we can convince ABL not to do it..
>>=20
>> Yes, we talked about that. I will look into getting "splash-region" and
>> "splash" also into the ABL (edk2) build for the phone. Still won't
>> resolve that for any other brand of devices.
>
> Gotta start small! Maybe framebuffer@ would be more """idiomatic"""
> but potayto/potahto

I'll try and work on the edk2 patch early next week, so if you tell me
soon, I can add some other name. I don't want to include 500 different
names though. :)

>
>>=20
>>>
>>> [...]
>>>
>>>> +		vreg_l12b: ldo12 {
>>>> +			regulator-name =3D "vreg_l12b";
>>>> +			/*
>>>> +			 * Skip voltage voting for UFS VCC.
>>>> +			 */
>>>
>>> Why so?
>>=20
>> From downstream:
>>=20
>> 		/*
>> 		 * This is for UFS Peripheral,which supports 2 variants
>> 		 * UFS 3.1 ,and UFS 2.2 both require different voltages.
>> 		 * Hence preventing voltage voting as per previous targets.
>> 		 */
>>=20
>> I haven't (successfully) brought up UFS yet, so I haven't looked more
>> into that.
>>=20
>> The storage on FP6 is UFS 3.1 though fwiw.
>
> Hm.. can you check what debugfs says about the voltage at runtime
> (on downstream)? I'd assume you won't be shipping two kinds anyway

This is very likely just from Qualcomm's baseline.

>
> [...]
>
>>>> +&pm8550vs_d {
>>>> +	status =3D "disabled";
>>>> +};
>>>> +
>>>> +&pm8550vs_e {
>>>> +	status =3D "disabled";
>>>> +};
>>>> +
>>>> +&pm8550vs_g {
>>>> +	status =3D "disabled";
>>>> +};
>>>
>>> Hm... perhaps we should disable these by deafult
>>=20
>> Do you want me to do this in this patchset, or we clean this up later at
>> some point? I'd prefer not adding even more dependencies to my patch
>> collection right now.
>
> I can totally hear that..
>
> Let's include it in this patchset, right before SoC addition
> I don't think there's any pm8550vs users trying to get merged in
> parallel so it should be OK

Okay, can do. Disable all of them (_c, _d, _e, _g), and re-enable them
in current users? I assume there might also be boards that only have
e.g. _d and no _c.

>
> [...]
>
>>>> +&usb_1 {
>>>> +	dr_mode =3D "otg";
>>>> +
>>>> +	/* USB 2.0 only */
>>>
>>> Because there's no usb3phy description yet, or due to hw design?
>>=20
>> HW design. Funnily enough with clk_ignore_unused this property is not
>> needed, and USB(2.0) works fine then. Just when (I assume) the USB3
>> clock is turned off which the bootloader has enabled, USB stops working.
>
> The USB controller has two possible clock sources: the PIPE_CLK that
> the QMPPHY outputs, or the UTMI clock (qcom,select-utmi-as-pipe-clk).

So okay like this for you, for a USB2.0-only HW?

>
> Because you said there's no USB3, I'm assuming DP-over-Type-C won't
> be a thing either? :(

Yep. I'd have preferred USB3+DP as well since it's actually quite cool
to have with proper Linux. On Android, at least on older versions it's
barely usable imo. Can't even properly watch videos on the big screen
with that SW stack.

Regards
Luca

>
> Konrad


