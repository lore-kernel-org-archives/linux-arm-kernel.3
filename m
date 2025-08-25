Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A0ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HqowhwKhilGiIPsPTFLVOfvfqilXqLVrLNuX0vYRl8=; b=ATE6UV+Fb3YEMx2STve4RbN0Ym
	qJEq+naf5YzWYatWbMYEXOS/faUbphbsPuTaCAbgVVIj5mIVgKRNG6BhMj6qsiFw+90nzRlHpg0D1
	fn8k14F4IKYirSZ98ppOQUkTetrUJT2j7uNRA49VK9IuhmFS0k5Zp9WYjxkOuflNSOVp/Qngrqo+q
	nfcFKkqZv+7uKlWBPnogCs9MVOP/xqlrfzLwKPvOBQSVrgtBs9lbvKjbl/FtzvghFwtB9v5r0ybu5
	/RiGA45tWZiYKav3lMAe8/rS25TZ9cS3EIYHXbeoCgnA74gBA7uYcAoMdjelvdS+OY+nW/x3S4wep
	e6em4gYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaHB-00000008iPL-31rH;
	Mon, 25 Aug 2025 16:42:33 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZW9-00000008ZYm-0mID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 15:53:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb732eee6so793164466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1756137235; x=1756742035; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HqowhwKhilGiIPsPTFLVOfvfqilXqLVrLNuX0vYRl8=;
        b=Cm8yObCZMrGOWwT6MubhdzO7UPpfBjNn2ZFABGc0GVYlMKKi+JJqh+Ro5SeRdGDJ/m
         iSmUGZPln/RPVGyiLY33kknYqOi271d5vOtx/AoCxj98+oT47j+FzI8Ib4arm2uih4Zk
         GDkqtdpYDCt3CddKzDPKjtbU6eTK7ATySPZbkRrDeywulzli6iYtgNvBDio2SZxoytjE
         lddn7Jed2vzccfLZYuqPbT1fz4eVFs4p26jEPqK6HdwEcsJAWQXfCQiqNGfjjrSDtO3v
         ufPAze2OFDpMpmOGTtEvGVtTrnecTnRmkcXk1FchR088Gl9KT0VHgSHFLpujROOxWifQ
         7JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756137235; x=1756742035;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HqowhwKhilGiIPsPTFLVOfvfqilXqLVrLNuX0vYRl8=;
        b=gjMD8aeDsyX30HV/vejjveyU6dHMlRGkE1Xx8gLkjK6iPeUIsoFBrxOT7xuAuVaPv3
         2k0xZW2ZOqGkRZ6osgpDSAekSpDJEyC8+PoHnLGSuyC70YbOuWt5ZWzuBPeusS7IDKbH
         V8nWuqviuX2UydZ/tZ5MiFfNMt/BdwNN64ROTaNZ6sMmaxvyAv7q1szgEzYJqGZF4o8k
         JZ1W2EOmYOAA0ijQAbyZMYduI7nCxCl2ln65VJ43Mv5MiNAsBdnIGvPZxA5KgiCyqbrV
         LbNH/Am8w/d1R0jbgxazXk5ufj+FbktQBkYj31J5B1ghY79F0ndkdZI6LtV2ls3lVY0z
         01sg==
X-Forwarded-Encrypted: i=1; AJvYcCVrtoiyrn0YR+vKrvoU1M1JqOZSyz/hRfhNaKwgAW4vVCc4Wxo1dBlF5+4jSzcbaYHO4v0U+5DVJjSN2LAqE93j@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+j4pS4BX9WfVAhh4Nc1dGZ3gEJX9WzBLKi2h1Bogn6trxm38J
	y8v2mJUggnTn5znc4GO+ftbpOTSN9nnt37ezNP5qdR5jLoDez3+TBksqgMi1yKxIpsA=
X-Gm-Gg: ASbGncuejfOA4Buk7au3MD95Gse28GBa2J7TDy5QytaqkjJTDGBzFgJdhhUs1DKNLJx
	gWXhd9n7kuoPUpKo4J+YFD3HYCpnLfxJiOrLzADLMITJBqJXOpwx0OPM6cXTeL0Jsi7mSM3DyUm
	1wJEOggFUwtRPScwyfBtygds1CT8GZ56phg5DK8mkb0TiHCUDl7RT0Ce2EgOOMydKtaZBa31O48
	wNDIbHyWqzNnt81CrImV+xMrgjfwKtPNL8HO+vR/GdaBErISyfqry8HKdFC/uA7LuqlBpleglw3
	U0i2xh7AuGtA1pEg28HEiNUAFFaVv/h8KFLMvw9hx3UjyAUi91dshbN/gIBP5Q5imU11S/dzpt3
	mxPYcjuQ72I7jW6aH8JjB4NwPnIkGAroEqM+9Kcw9PAkK6qXJ3ezEYVkazt1Vjm4d96x2GUX5i4
	K5mYk=
X-Google-Smtp-Source: AGHT+IEDOv6gprEj6Ksbmo7p57Z4tZTNEHhZ9DTRLeOqT0HCwoH6lmCXLeF8Wklr2ttI5zxfbuX7Eg==
X-Received: by 2002:a17:906:7943:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-afe296e74c2mr1283531066b.40.1756137234813;
        Mon, 25 Aug 2025 08:53:54 -0700 (PDT)
Received: from localhost (83-97-14-181.biz.kpn.net. [83.97.14.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8b5fbc8dsm139360466b.1.2025.08.25.08.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 08:53:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 17:53:53 +0200
Message-Id: <DCBMOZQ7BFI9.2B3A3PEZ0DTYD@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
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
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
 <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
 <55420d89-fcd4-4cb5-a918-d8bbe2a03d19@oss.qualcomm.com>
 <DC74DPI8WS81.17VCYVY34C2F9@fairphone.com>
 <2hv4yuc7rgtglihc2um2lr5ix4dfqxd4abb2bqb445zkhpjpsi@rozikfwrdtlk>
In-Reply-To: <2hv4yuc7rgtglihc2um2lr5ix4dfqxd4abb2bqb445zkhpjpsi@rozikfwrdtlk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_085357_243387_D4340FE5 
X-CRM114-Status: GOOD (  40.38  )
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

Hi Dmitry,

On Wed Aug 20, 2025 at 1:52 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 10:42:09AM +0200, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Sat Aug 2, 2025 at 2:04 PM CEST, Konrad Dybcio wrote:
>> > On 7/29/25 8:49 AM, Luca Weiss wrote:
>> >> Hi Konrad,
>> >>=20
>> >> On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
>> >>> Hi Konrad,
>> >>>
>> >>> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>> >>>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>> >>>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>> >>>>>> Add a devicetree description for the Milos SoC, which is for exam=
ple
>> >>>>>> Snapdragon 7s Gen 3 (SM7635).
>> >>>>>>
>> >>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >>>>>> ---
>> >>>>>
>> >>>>> [...]
>> >>>>>> +
>> >>>>>> +		spmi_bus: spmi@c400000 {
>> >>>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>> >>>>>
>> >>>>> There's two bus instances on this platform, check out the x1e bind=
ing
>> >>>>
>> >>>> Will do
>> >>>
>> >>> One problem: If we make the labels spmi_bus0 and spmi_bus1 then we c=
an't
>> >>> reuse the existing PMIC dtsi files since they all reference &spmi_bu=
s.
>> >>>
>> >>> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is n=
ot
>> >>> connected to anything so just adding the label spmi_bus on spmi_bus0
>> >>> would be fine.
>> >>>
>> >>> Can I add this to the device dts? Not going to be pretty though...
>> >>>
>> >>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch=
/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >>> index d12eaa585b31..69605c9ed344 100644
>> >>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >>> @@ -11,6 +11,9 @@
>> >>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> >>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> >>>  #include "milos.dtsi"
>> >>> +
>> >>> +spmi_bus: &spmi_bus0 {};
>> >>> +
>> >>>  #include "pm7550.dtsi"
>> >>>  #include "pm8550vs.dtsi"
>> >>>  #include "pmiv0104.dtsi" /* PMIV0108 */
>> >>>
>> >>> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sur=
e
>> >>> other designs than SM7635 recommend using spmi_bus1 for some stuff.
>> >>>
>> >>> But I guess longer term we'd need to figure out a solution to this, =
how
>> >>> to place a PMIC on a given SPMI bus, if reference designs start to
>> >>> recommend putting different PMIC on the separate busses.
>> >>=20
>> >> Any feedback on this regarding the spmi_bus label?
>> >
>> > I had an offline chat with Bjorn and we only came up with janky
>> > solutions :)
>> >
>> > What you propose works well if the PMICs are all on bus0, which is
>> > not the case for the newest platforms. If some instances are on bus0
>> > and others are on bus1, things get ugly really quick and we're going
>> > to drown in #ifdefs.
>> >
>> >
>> > An alternative that I've seen downstream is to define PMIC nodes in
>> > the root of a dtsi file (not in the root of DT, i.e. NOT under / { })
>> > and do the following:
>> >
>> > &spmi_busN {
>> > 	#include "pmABCDX.dtsi"
>> > };
>> >
>> > Which is "okay", but has the visible downside of having to define the
>> > temp alarm thermal zone in each board's DT separately (and doing
>> > mid-file includes which is.. fine I guess, but also something we avoid=
ed
>> > upstream for the longest time)
>> >
>> >
>> > Both are less than ideal when it comes to altering the SID under
>> > "interrupts", fixing that would help immensely. We were hoping to
>> > leverage something like Johan's work on drivers/mfd/qcom-pm8008.c,
>> > but that seems like a longer term project.
>> >
>> > Please voice your opinions
>>=20
>> Since nobody else jumped in, how can we continue?
>>=20
>> One janky solution in my mind is somewhat similar to the PMxxxx_SID
>> defines, doing something like "#define PM7550_SPMI spmi_bus0" and then
>> using "&PM7550_SPMI {}" in the dtsi. I didn't try it so not sure that
>> actually works but something like this should I imagine.
>>=20
>> But fortunately my Milos device doesn't have the problem that it
>> actually uses both SPMI busses for different PMICs, so similar to other
>> SoCs that already have two SPMI busses, I could somewhat ignore the
>> problem and let someone else figure out how to actually place PMICs on
>> spmi_bus0 and spmi_bus1 if they have such a hardware.
>
> I'd say, ignore it for now.

You mean ignoring that there's a second SPMI bus on this SoC, and just
modelling one with the label "spmi_bus"? Or something else?


I have also actually tried out the C define solution that I was writing
about in my previous email and this is actually working, see diff below.
In my opinion it just expands on what we have with the SID defines, so
shouldn't be tooo unacceptable :)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index 9fb174592e2d..96e1b5df4f65 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -7,6 +7,12 @@
=20
 #define PMIV0104_SID 7
=20
+#define PM7550_SPMI spmi_bus0
+#define PM8550VS_SPMI spmi_bus0
+#define PMIV0104_SPMI spmi_bus0
+#define PMK8550_SPMI spmi_bus0
+#define PMR735B_SPMI spmi_bus0
+
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qco=
m/pm7550.dtsi
index b886c2397fe7..08d7969128c2 100644
--- a/arch/arm64/boot/dts/qcom/pm7550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550.dtsi
@@ -34,7 +34,7 @@ trip1 {
 	};
 };
=20
-&spmi_bus {
+&PM7550_SPMI {
 	pm7550: pmic@1 {
 		compatible =3D "qcom,pm7550", "qcom,spmi-pmic";
 		reg =3D <0x1 SPMI_USID>;
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/q=
com/pm8550vs.dtsi
index 7b5898c263ad..3c8c5f3724a2 100644
--- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -91,7 +91,7 @@ trip1 {
 };
=20
=20
-&spmi_bus {
+&PM8550VS_SPMI {
 	pm8550vs_c: pmic@2 {
 		compatible =3D "qcom,pm8550", "qcom,spmi-pmic";
 		reg =3D <0x2 SPMI_USID>;
diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/q=
com/pmiv0104.dtsi
index 85ee8911d93e..bf0c02974e74 100644
--- a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -40,7 +40,7 @@ trip2 {
 	};
 };
=20
-&spmi_bus {
+&PMIV0104_SPMI {
 	pmic@PMIV0104_SID {
 		compatible =3D "qcom,pmiv0104", "qcom,spmi-pmic";
 		reg =3D <PMIV0104_SID SPMI_USID>;
diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qc=
om/pmk8550.dtsi
index 583f61fc16ad..f1c34f0a2522 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -18,7 +18,7 @@ reboot-mode {
 	};
 };
=20
-&spmi_bus {
+&PMK8550_SPMI {
 	pmk8550: pmic@0 {
 		compatible =3D "qcom,pm8550", "qcom,spmi-pmic";
 		reg =3D <0x0 SPMI_USID>;
diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qc=
om/pmr735b.dtsi
index 09affc05b397..91b53348a4ae 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -30,7 +30,7 @@ pmr735b_crit: pmr735a-crit {
 	};
 };
=20
-&spmi_bus {
+&PMR735B_SPMI {
 	pmr735b: pmic@5 {
 		compatible =3D "qcom,pmr735b", "qcom,spmi-pmic";
 		reg =3D <0x5 SPMI_USID>;

