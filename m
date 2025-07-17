Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F10C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ru/mu5vOTULTD4H+wkh3KmAvhPvotp/lHqkpBJrbBE=; b=nVCuAU912prB96HXFHagg4ky8n
	Ay+mF5OTVvyWiHnw9H8lWiE4pVMKHkQyup9PzNp4KwFTrjsGtvlWFvD34uKxG8n7zMg9Xmr8N3KpA
	cApt7U0VDJk1XIHuzmNreEhPQkROBqtoP9z89A/2qJImdwZLui91UOy05eDJxOxKOf/cJZHeviayN
	GjNdh6C/DYWmsO6i3jcu4BBjbKgPAuZ+Agfo7PupBKYS+CAxHC1y1fJxP7uT0KoX6poEYYQ/ELlBn
	hbQXjj1oGDxT19ghcLytxH25fTQA7tmRiei4mO9Pu6glwYvkMD7SXtLpvF7PGHnpXdIRkODVdQF5Z
	+VFhlOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLTj-00000009oJu-2lqN;
	Thu, 17 Jul 2025 10:04:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLBx-00000009m5S-3nyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:46:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0d7b32322so128824766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752745576; x=1753350376; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ru/mu5vOTULTD4H+wkh3KmAvhPvotp/lHqkpBJrbBE=;
        b=M7xxuESLamAsMbJrTCBKaarqbbhKftChsaqsGuzDKsIYY14/QIzwNugPN70lmIPaDJ
         pmH03M1cs4lf2SQwzqhGkhL1j8juybP+XY0Ipj53C0OajS6Yy6hgWPuNQaFjDcTXsHB/
         WGPnPCqIWDkZ+iEvgte/J7j9VU5SHAd7MP8cdbNyE8ztBZ/XDIoTn5Qdv+QbnvTxwj1v
         IJT55YeoNOCVEVbGDBppkuBxqcrNLqurUE7vGhGkIpFuX0rLOQAohnC7rcuhI/MarcfA
         GLv8YeQ07AMSJz7bWYRYPV499N8qJDjdA4LQRnqLkouxoh75Rcr/SkZs0oBKaF8Ywl91
         vBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745576; x=1753350376;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ru/mu5vOTULTD4H+wkh3KmAvhPvotp/lHqkpBJrbBE=;
        b=fTUOy2ICAcOAZYrAdKtv4dz3CpdT6Zx8TTNXQMU4NZZlw+enc+xO/SZqs/Gduf/QCU
         svqXD/L/vTRXY86eCBj29Urg5puH83o4Udglazoq26kMdF/abF9FH5iz4znFKMFQHHgw
         CZnvByWmb7HTx7pCkpV6rId9+J9jVCHkAZDkotGYhdLt5kCR89/zPn1XPXFA8KPIKQ/G
         DYc/+orfuKfULtR0s5gEtOj/Z4KPvQr9DknZfq1EHTP293G06pytCTqkh7rWUC+4SAY3
         Al/SgcNdSNkmVAtozrVSGPCYhEZ/rXymGGbFf7heDzH8WSGiX3iYGyArMrkGOjhPv4vg
         dUVg==
X-Forwarded-Encrypted: i=1; AJvYcCWrNv4O9nFpE280MipZ6S0CGyLLmX2Lx6arsFRLd8ykT0Bhatgixf39W4xY05cFqbwXytIe5KMFwMkeOGfjUga1@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXoGK4xjGcYo5kI96pBSiWFbrxnc+sRydpGHXz7SwO+J8q9KT
	gHhkz4Mu5xtW7DqRUrE7IZyfDtJ5NZ4nk319q0pnrStTY5Qa0DrfO96X6Mw80/M37DM=
X-Gm-Gg: ASbGnctmMtTVH+orBTC3NM1sFAPtUe3b56+e/YuL3RfB3lv1fdYhrjgEDZ7b28gkcJz
	qqhkuqmU4OpKZDmB9XWz+7bYXcURhMZ7ilKDJYFp/PXfLJw7x+Tr1pchG5hRI6ihuFW6K/TQS46
	cLBwCyt0RGjOEIV6WTl5mGO/5ejqBjHX2f4z1oEUzTLEzSdKSILWZInMsd8q1ehzI+Sr2J6kHUS
	0khlrGYGRScAkMd2DsElCiOHUvfAQesj1eo7E1tyhdTStwYvi6htvtvVfygKJOLS5ys9U2ypp4U
	CurSdsoj1KBxMS7OQkQK+ZIFqQsIqxf9590qflyWfCSFSvYR+LiadXSYEuGwlfNYK8KWsg2FzX1
	zucriZILPZ1A9Tbq0/XW8qFb21oKVWG+uLToPjafdzucA4otV53vIfgJ5
X-Google-Smtp-Source: AGHT+IFFJ+Gwq77Z/PIy0XMlE+NNaiR8R9S0OSFVxrU0iuecWvqgNe/XZ2Nw4b7IKr3qQanK/C4caw==
X-Received: by 2002:a17:906:af16:b0:ad8:87ae:3f66 with SMTP id a640c23a62f3a-ae9ce1d8ba4mr400610566b.60.1752745576031;
        Thu, 17 Jul 2025 02:46:16 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bb2sm1333325866b.114.2025.07.17.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:46:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 11:46:12 +0200
Message-Id: <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Will Deacon" <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Robert Marko" <robimarko@gmail.com>, "Das
 Srinagesh" <quic_gurus@quicinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>, "Amit
 Kucheria" <amitk@kernel.org>, "Thara Gopinath" <thara.gopinath@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
In-Reply-To: <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_024617_957451_551D4BEF 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Konrad,

On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>> Add a devicetree description for the Milos SoC, which is for example
>>> Snapdragon 7s Gen 3 (SM7635).
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>> +
>>> +		spmi_bus: spmi@c400000 {
>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>
>> There's two bus instances on this platform, check out the x1e binding
>
> Will do

One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can't
reuse the existing PMIC dtsi files since they all reference &spmi_bus.

On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
connected to anything so just adding the label spmi_bus on spmi_bus0
would be fine.

Can I add this to the device dts? Not going to be pretty though...

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index d12eaa585b31..69605c9ed344 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -11,6 +11,9 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "milos.dtsi"
+
+spmi_bus: &spmi_bus0 {};
+
 #include "pm7550.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmiv0104.dtsi" /* PMIV0108 */

Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
other designs than SM7635 recommend using spmi_bus1 for some stuff.

But I guess longer term we'd need to figure out a solution to this, how
to place a PMIC on a given SPMI bus, if reference designs start to
recommend putting different PMIC on the separate busses.

Regards
Luca

