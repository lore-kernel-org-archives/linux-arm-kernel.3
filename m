Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2128FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=; b=Qm9nql+lyLySiy/4HpSm5SAJlI
	9+vcoxuhYu7dVgioaQGRHoJMzXNTQdtrey6C0SEcPyTMNLZY5oMCIl7DjtQTuzVeQ1Ap2W3QxDYj2
	gRkwRv1OA0l3TShtUaK08+urTQfi5qx/O2WCsgy5PWhhffJSB1mQiihyN67yyz0GSvnIqkku/RgQA
	lLPEUkGVJQRRO2cEO14qcHqRSE0ahfgYjTLnFj/4wi4T7r4NHGcJ8QsCR7O4bci9hx2nIAVzkwJ4Y
	uxyvVIQ+7c9DWLf/NWIx3eMxWg+XR8oxEH765GWqYWbxklJIj4oCGA1DDJdHqBgOR6olWd6+8HYkZ
	BtwLoQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKwR-0000000GsNf-29IQ;
	Mon, 27 Apr 2026 12:19:59 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKwO-0000000GsMu-1swT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:19:57 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50e5b55062fso71406621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 05:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777292395; cv=none;
        d=google.com; s=arc-20240605;
        b=jj7TeJ7MVYKYIodjI3ziPFHcELLWRKfeAupuAcNporqgPZZGImdR+2KDCyk0ZbwZAb
         wwVEGa0UIOTn/xGAUGsbAZmo5fTdb1lYexWsKAy+IVAQS8N8eQNHiI+m9xtTMyz50eVb
         WUvFdwfuWUvGHJuRMh1A6WGZpgPVc0Yr0hQJWwAFG+7ZU/YGGz9RscMTcvQYGyTXYM1g
         0U4BpqxxgCceoNoITUJY/zajl3/w5kQ1r5WgMsuuvCmIqKSqJi1sulynxHFl/zcoOdex
         AsjVHu5RCAgTrpxWePRP7IIh5u7Kt2v6BUSiypO0sdzYHGMllnTydSTD+3miukg/mM6e
         ZSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        fh=+xF0yBWExz5S9GqXN1/AJ1Hsno9DdR+wxBhixpJZXME=;
        b=XgjqeMZCMsbLHq3yAIKLeRVH0ypt2r+NI4LqSbFitsRQFJdMQr7kr3P5QZTcHGeS8U
         uA/LUD7t0F86TDq5ACXnzETaoi/FEYPDsPOjvBFcug82K/A89M8fHSTyrSE4FbaSCXGP
         jBxjcCKRHEux1PHi7hqEbZwGCP9L9EiPEmJlOiLHTKeKmL0sSQh8dRyI6kF2fRpH5tmW
         w67BHmnse46ZA1h52SzySfSzcmUTOVNSeIby2oKI0sh/O144gZu84dCxofB2oqKiH0tL
         URxaP9zolIASxJ0BJtrKJ6owMbsMWP0KTiV/6uRcFlEYz4S0jfeyRJ9qtbSxYtX0ZDtU
         mLrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777292395; x=1777897195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        b=fzANUqYgUGAup1Vz6dzAezQpTMD7xtt2xQ0fEgsPNKwUpUbibukam4g3FXq3nlA84S
         6jWvDOuWAFM99/KbzsRRcXdQ+uPnTybf8DbJUHXChfKY/NEiWYwYNmcGaw58Jtw8r9oC
         feMSj8o0W7cDxOlAEt9U88088DcwtA4TaBOlc2dVcUGMYDjsorOTKHI++TW4hH5tgqu0
         8LFOjn1m4wn+qCXEQcLK5EZ2llnoQ+YPK2SXMNcVTD2fBJuXbTeFLOKyTp7QrxRLENI6
         ABKWNdD7p4HhbS/BOb3kTEB5GisRzqAs3tjeEJo1ROyE+/zeXAon547w5tpgkVV2oNxO
         p/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292395; x=1777897195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        b=sP0xaGZCH/ba3xK/nBsgK2jqO5SpHuG5t01ImI/L9YQK4hqUBUL7vKNG72WGvuzgMG
         TrdXhjwScWjNV79B47zG2OY7R/TsriYeyckS9wzTvkkKGZURDFREcFJsMdPBMi6a0LEU
         FAxXOfJgPVQSD2DVOJG4i+dIRz+iqvil7l/Y9lkcykLvLpyMcoYa5lRSFE/ezHeu1Z4I
         2Fhxp9z6ytMttIjSoPB4vxtcw8zBFLSej8EdBbA5wwKeYjSVe8X/nPU1C/8CLS9oAUEt
         S7CUxMgRKSFpw9oKq3R4YVS+RNljetFkCL5rpza3EXY1YNpPY2HCe4QA0XOmfDUzrHx8
         wLMA==
X-Forwarded-Encrypted: i=1; AFNElJ/IV/BANUnR5GbrOo/aghmGOy5qlVNspVTGUd/n6DjkFtZeQTvOW8a8ocDP6S2F9pmeDnvtDqB64UbSuHkCk6rO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj4vrMRDfNKcVwZK9r4UlPXSqg/qlSlBGlNa490RUHegx6sokf
	P5gYfcDclDlRgwfILDDKmabkvgVAsuDKQKQy1UCbie2D3ZMsOc4GE8SbxkSCIhyVnYo7UvGhboO
	UoySl7PzF/zBXD3UBgMq5x8Uzi/IsqMg=
X-Gm-Gg: AeBDiet8PuPzR3jAX08HXhNwi+bTSQPSK/JxDPf8hmYWcwIKfJtHaEcmACmyYZqwtc4
	FQwv0/XfV9DTgjghqDLpS7u5QsS91BuG/2lfSmGxtrvXw9ReEwVMB6MzbrhH6J1VXiP44aLuHLh
	AD2L/CBniUWzjNDTKV5pDB4CR7IkXgdteduistXt/dTy/W8wTiWL79sT0veWwi7IQ6xYIb0irIb
	xnnqemssjn/CcZlvGk/bHFiUN4PDDzJu2lqjC47CjOHB/2rFdzUkzmcvMcfj/gy6ICvsJN32TU5
	X0biC94qX4gzg6phRw==
X-Received: by 2002:ac8:7e8f:0:b0:50f:817c:5d45 with SMTP id
 d75a77b69052e-50f817c676cmr442478311cf.23.1777292391770; Mon, 27 Apr 2026
 05:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260425031011.2529364-1-dennis@ausil.us> <20260425031011.2529364-7-dennis@ausil.us>
In-Reply-To: <20260425031011.2529364-7-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Apr 2026 16:19:37 +0400
X-Gm-Features: AVHnY4JMQA7P3RUKZV7Q2ZiP4ijZr_0utVOWXuWYUEbZIgaWmckkoQwwj3mXN60
Message-ID: <CABjd4Yw_bqi-Lj5MX--y34X_4GZPwa+ajwRGim7=nLGdqEOjEA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_051956_523828_D2E022D9 
X-CRM114-Status: GOOD (  14.40  )
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

On Sat, Apr 25, 2026 at 7:10=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l2)
> - PCIe NVMe slot (pcie2x1l1)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven through a Lontium LT8711UXD bridge.
>
> Vendors schematics are available at:
> https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 440 ++++++++++++++++++
>  2 files changed, 441 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts

Reviewed-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

