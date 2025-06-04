Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyVjPzyLcJPTQJH1h6UfkUu9+f/KgbX90KrYVoyGLHY=; b=Qv6hGb1E6BVtURJn2bN811mC0z
	fk2hVhdPCVboPu1uc7ltX7CxqWkbVl2vaMTaRp8U150xVKBvdvwpnQ2/AOm3w8/Bbx/Xw9265CjeF
	dWyT/khcUP29lF5u1+PWAPtcIaK5IGR7MW2wqu9ZKSvEKpCIiAzHH6YLZ3PaZ95/94IJvgbjDodY9
	beJn1ujM/MHgfkMYGo32IRLjlg15F3RIbiCMmI+GnbTX8Zw1L6mWCoNkzVNF6Nqfm6KD7Lqt7pPAe
	cLUizZHbSLBqQTcJPJqHHk8Vezs8e6//N+NAgOGOKzzAeZzdAT7zAPude7pl7O39tRAdKmQv5WFik
	eYT5/lWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMi39-0000000CiaD-1uiV;
	Wed, 04 Jun 2025 06:56:35 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMhzk-0000000Chu4-0jtJ;
	Wed, 04 Jun 2025 06:53:05 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a5851764e1so5971471cf.2;
        Tue, 03 Jun 2025 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749019983; x=1749624783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyVjPzyLcJPTQJH1h6UfkUu9+f/KgbX90KrYVoyGLHY=;
        b=QRT5QZeP42O4Ndgy9iOKL6dET0iv39HLUyuIUAzTHvjukhOaxYzRiLhEeZlE2/L77M
         4kK5CHlQsmK6mqi9Glx0qfK3zzsi4RK1waqcXJzhc9k6JiEzqhAjqB4Q0nMX6/a58TXK
         IlRM3eegSrBhbyChzEGfo8kW4CmKuCBDkcKVjywwE2txfvB1bGkN0zAV/+7a13McYOne
         h2zW4iUSYbpZrAgHOgZecOU1LeSfRGMHXXd+CjD8a9ROedjplz0jt0eSluXlVNFrvR2X
         AGgJaanpF0AATh1lMy7jy686HsJ1tzSQyPDurggs/Kwa+TichIvrSPPOlielrqT8uNfU
         md7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019983; x=1749624783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyVjPzyLcJPTQJH1h6UfkUu9+f/KgbX90KrYVoyGLHY=;
        b=cOVjjfvfILSt8lPbDse70hGMBD9BeAHoDeSPoDA2fqHfvkSRVJyfQL41Y2JAMyaSUE
         nDl0Ii859v5nml9J6uTEL+/DIZwUmE6iS4sty/gXOKLfyey+Bty4GywT19fJvI/lGBct
         NMJ/y0TcxE1b1/yZ/7zLMrD8BsVxAIS9W4ejHDrG6DQvhEgN6uGJRTMtKu/1NsQTMJEa
         xQIE8kow/gH9ouM4hKwHVxhdVEKSqAJaCsQn5YafHp2HVOio6/HlbLc6hAlkrILGI9BJ
         qrEFL90qKOle8J9kADPHQ9qOtEQsHaBfqciSl2RF+LzWIZp9QwV3uXpDd7S+WPcDpU1E
         FTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd6dAHh+dROHiVSmz1Kkz2tnD74mHGj+nN6cILbWQIIX76g98Z0V5byNqQG/Agkc5tsNXVF2VyBQzro8/OmC4=@lists.infradead.org, AJvYcCVE3+jebpjoCZ/7ihxvKAUZTF2K+YDNJSGe1+TdUPxL3UWn+eDUXvSnu9ROfxMqeRNIpTwftD6cxFcQoCXxqCGq@lists.infradead.org
X-Gm-Message-State: AOJu0YyWmlEYjKDh5/VP29hic5NBRIRjzz7OI1/jmVBRUxr7+cYfq1YP
	QDizP6fjjBe1shhHf/i7hdwN9cdIpsiccDNv2dc808vnCzpnMXD+ETCXF8jH077yC1+xyD9n0PR
	WaDqGdfI8GHna2GO0zp6o4r2+1WMVXcY=
X-Gm-Gg: ASbGncuwFEkL897tepTbLt+R3IzEUODbF1iaS/2IXCru4yskMfZPeC6fkaq7t+S66jX
	UZfB0OHFZ+6BO4TiVJgaxauDfE6KpMVq+ipeNVm5XGaIFEJUFrWaQEDpSlCihknM9OcCIvO0KqK
	x2TMoqZk8IUNQ1Pz2eiG/qpSfXUAsV2vg=
X-Google-Smtp-Source: AGHT+IF7dEVyEdH+C/HunhhJcZxvr/1H6/oLSYayWQ8oFVL13uluh9+PHp86HTOwmJ9nRQzKHedGjPMItad1gxDjveE=
X-Received: by 2002:a05:622a:4d94:b0:4a5:8b39:626b with SMTP id
 d75a77b69052e-4a5a57bbda3mr28729721cf.27.1749019982787; Tue, 03 Jun 2025
 23:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com> <5590100.Sb9uPGUboI@workhorse>
In-Reply-To: <5590100.Sb9uPGUboI@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 10:52:51 +0400
X-Gm-Features: AX0GCFvSCwxOtW_Sjp_6g6sDf5cAGfQNHG5Np4jna6_VvTZF7K2r6CnfR_dIWK0
Message-ID: <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_235304_212645_22A40D9E 
X-CRM114-Status: GOOD (  16.32  )
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

On Tue, Jun 3, 2025 at 9:51=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:14 Central European Summer Time Alexey Char=
kov wrote:
> > Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
> > Sige5 board.
> >
> > Both ports use just one xHCI controller, with the USB 2.0 signals fed
> > off the same USB OTG PHY through an onboard hub. VBUS of both ports is
> > controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
> > toggled by GPIO4 RK_PA6).
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
>
> This is already done here:
>
> https://lore.kernel.org/linux-rockchip/20250507-rk3576-sige5-usb-v3-4-89b=
f5a614ccf@collabora.com/

Oh cool! Sorry I missed that one. Your series is much more
comprehensive, so this patch of mine can be dropped. Thanks for your
work!

Would you mind chiming in on the other patches here, given your
knowledge of the hardware?

By the way, you guys don't seem to carry those patches of yours in the
Collabora tree [1]? Nor the TSADC updates as far as I can tell.

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/=
blob/rockchip-release/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts?=
ref_type=3Dheads

Best regards,
Alexey

