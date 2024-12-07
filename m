Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CE7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 22:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GXM0+BHtSGWHXqNnKhtHtPN9SdqgsAE77m643km+40=; b=p9QAbKqSTviAj30SspKodI5Q+b
	vqNkxCSW7+KxS6TUGS9dT3zHDJRfzqhfxqJJ8tByAPdjjuHE3MNt9LDsVWWPdlePPWi5F68mAoa9Z
	bxy0RXX6hiBzKiG9DeBLJGUnO+MqTpMmYuv3mKD2p64iKVVkSnYh80Ket3jDWCAk0vqX85MviJicQ
	xplhmEzdxiE3oOgxqC/Q67oxDNs+vYGnzoXD/go5nB0ihYZM9qOhjTVDWe2cG7fG3m0l02bN9pbK1
	N1qm8fhkFzShReC7oIXlUmFV0yq5+x+fZC2hHV2V76t3ZI7PDxkcZmLUzExGlwC6q//DxS/C3KNFn
	PJhv+NsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2ue-00000004TtN-3si6;
	Sat, 07 Dec 2024 22:04:32 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2tb-00000004Tkd-3DQ1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 22:03:29 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-29e49376462so2044465fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733609006; x=1734213806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GXM0+BHtSGWHXqNnKhtHtPN9SdqgsAE77m643km+40=;
        b=NbGWc/h3ql4ZLogaasY0dHVdwbdNLDbfRAnuaJzSur96AOpo1wF/6sOAonFItGs2+y
         BxGiprYIhD85GwnvETpw8TVqPJkJTtW05tHbFc2GvSclT7I2jP2gk4AdlmND9/4NJbzy
         WRtdX/lK0xJkow3s9yR9C58CPAI7mWiHqTv0USbJuPyXzILtFuyZFSNwICn/sm5nWIur
         AdD7/+Fj0gyftFjxINLhTwYE3zXIjZwpmOYBJ3BjPrVqlg2t/AMCvkOPkELBS/Y6zOLP
         s3KdR46jsJ5i5O7aoOswm6E/j3HkgoC44Z27WZZwT1P/BAHGwv57TrHSQsasB7C4yv0v
         nxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733609006; x=1734213806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GXM0+BHtSGWHXqNnKhtHtPN9SdqgsAE77m643km+40=;
        b=IM8Ai+lOGD+hoNZRv+9oYPj522oMKK8Dy76d9FjREzKg5Bu0SZTVDkxJXJTm3kZRxk
         YeqQIg4ApBXcsLzjDMzTFargBIwFkwzAbIwfT/sxT0W3W8zvZP/hXY7d9irm8IFWGKxd
         Bo4MMI+QpZVo7jkmipTVCFo2NiW9Qs9W50NqUYWrWg40H9zZ/JDn8sJIMpXWr8t5aMtY
         fa+LF8+Z0VZ8/yhlbEtxCH0/XfyMoTJIrMQYCzVPDzcpwf/0nepMtc4jDHG2biyv+vBm
         tM1WuQeIMxajiePdMyf9dHWkxWoQ1WeV8wec9XR4MR3mbpICt8+0L6zrQRw/RhZTzpSW
         b8ww==
X-Forwarded-Encrypted: i=1; AJvYcCX2fRYtilf92sA6chSCy4ScTUqMK+Jd/+NYst7Bng0vJNnmyR+YRhDqCqgzuzTYeS8hNRmt4katezHF8bss9+42@lists.infradead.org
X-Gm-Message-State: AOJu0Yz52l7QqjllUN9wMTdhWNSC9riURSfbcfOwesIpq2wg9MPDqCyD
	jsjXBYPQL5e6nbR/+zT1Av3yONqGBi4N3j0xpjTasv/OyxvmSN6vTFnGvWGb4UsB0mxPDX1F51H
	+RCcbqD7ZDOpveSMvbSmBb3zICZZD2MpovVaYZA==
X-Gm-Gg: ASbGncsy5B3brxTO+36DcF/1NdghkbpV2lRkDhk4sRPTJr8crVuZ8l/jCOkS49hsOMu
	PNqEmgAUVlnuYV14Ay8diUu3k9Wmu6wQ=
X-Google-Smtp-Source: AGHT+IFySGjzoy5FCW6UW8sdkAac1K6u7Brr2FiRkrW+1TN5iMSt/PqT8OWXDemRttmZeKYZRyGTsy/kAkU/2DL3BXc=
X-Received: by 2002:a05:6871:c709:b0:29e:392d:afc8 with SMTP id
 586e51a60fabf-29f7329ae2dmr7184218fac.15.1733609006594; Sat, 07 Dec 2024
 14:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:03:15 +0000
Message-ID: <CADrjBPrz1qUxbEVFR8OT785xLPwWmu3_ZThSne+EtpS8_NHEEg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_140327_936908_CB3808C7 
X-CRM114-Status: GOOD (  18.31  )
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

Hi Andr=C3=A9,

On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> To make USB runtime suspend work when a UDC has been bound, the phy
> needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
> gone, so that it can in turn raise the respective gadget interrupt with
> event =3D=3D DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
> to clean up, allowing DWC3 to enter runtime suspend.
>
> On e850 and gs101 this isn't working, as the respective signals are not
> directly connected, and instead this driver uses override bits in the
> PHY IP to set those signals. It currently forcefully sets them to 'on',
> so the above mentioned interrupt will not be raised, preventing runtime
> suspend.
>
> To detect that state, update this driver to act on the TCPC's
> orientation signal - when orientation =3D=3D NONE, Vbus is gone and we ca=
n
> clear the respective bits. Similarly, for other orientation values we
> re-enable them.
>
> This makes runtime suspend work on platforms with a TCPC (like Pixel6),
> while keeping compatibility with platforms without (e850-96).
>
> With runtime suspend working, USB-C cable orientation detection now
> also fully works on such platforms, and the link comes up as Superspeed
> as expected irrespective of the cable orientation and whether UDC /
> gadget are configured and active.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

As mentioned on the last patch, in my testing cable orientation
detection is working, but Pixel is detected as a superspeed device in
one orientation, and high speed device in the other orientation. So
you should either change the wording of the last paragraph in the
commit message (assuming you get the same results as me) or make it
detect as superspeed in both orientations.

Thanks,

Peter.

