Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208FE6C617
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WSM6TGpmmItz1uM+DrPz33P+iBBhPav9/6+0hNpzfY=; b=W4e0fdOvmpNUoU+P3xg1B53fTv
	S0BMH0rz2ID6t6v6UYtDkuurqw/aCtD2sdposVHAiUJo32S7rb4mBwYO0Q3AYvhTUnpF8xwl7uDx+
	t4rsOH1lOJ+H9XpFztcbv+ISjoQ4j9BIjEHDjEeVcxzO1hzPt0xrYlwxhQvQbX59CBMyT1dYsooWp
	vd7aNZ/wU+eVc4fppqCTpKmcTIUivB/avp+ZHMSoj8JINUpw76ZXHUSjwTuK5kG3FpX7mL9EfbxH/
	Ph4T6gFmFLKxBzxOAZcF5O6fhk+t+spS3WUY9fP+UQR2ACZ6uu9G6Y/Dmi/7IDJhXSwLGQDCSpEtO
	m2nWZ6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINnP-00000008bA8-16aH;
	Tue, 03 Dec 2024 07:58:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINmO-00000008awe-3E4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:57:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53de852a287so5844731e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 23:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733212626; x=1733817426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WSM6TGpmmItz1uM+DrPz33P+iBBhPav9/6+0hNpzfY=;
        b=ltfdSJZ36Uxx/dFmOIsJwAnzeSjyHjqTgRlpemDReLld579XgkhO3kaSStD/IP9a4T
         ec1YSdklcYNy5cL+8n8CnJpg3umD6SF9K4lyN1kiHB5Jx1lsG/8UJad/xHIQ8zCeK98q
         6RWNApY22MCq1IapJzxisnNoMcd+zDTN5PmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733212626; x=1733817426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WSM6TGpmmItz1uM+DrPz33P+iBBhPav9/6+0hNpzfY=;
        b=sCXAGvYhsXstASMzVH9KJ7wqVdoBAFvaI3v5MT1uZCy4HjsJ2xaSSMp1c3Rra28kOh
         P8CipWQxehmDA3/BbVDaqtr+vWzpH2YA8Lm/S/23pQoABgoQb8Enu2ufquqBxv+hcBj7
         EFCKVs7oi1TwuHRVnqCJOClvonq9zZGa0/Me+dyNunf6QCkfh82YB5fWjA8mPn4mj3NE
         9l65lsOG10SMOwDrcLV/bSdAXku4D0K/WNQY96JtpJFqWIh/9hHDfCn+lr/EoKzzxX9M
         xyHuq4bmvOKmlt+tKkPHbSYif/XwK2vI3zKIzdsguvzpXYeHptEdiU5+RUgNADahcnur
         Zjhg==
X-Forwarded-Encrypted: i=1; AJvYcCVW8k8pJ0e0/OcsBG0ozF7ihpmKeFQuJlBsFII11zIVFtk82ul8iTyS2VDpqSWi7dD8H8AiksQeIt4yn2foXB8X@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/OteAh2x/hrYKxROb/chVHRkum6Bw35GQYX46ajwpbZT4RyD8
	Dq7R6PEz8knlreWHC0Q+ZJqT6hDmda5y1cHgNt6Ydyy3c8mcIJLwAtDH7ieo2N56SF42WN7DjRt
	fKe4CzvXwOVN4oz958PjyLrG4JMIhgojEsHRk
X-Gm-Gg: ASbGnctNTOfD5KmWT++cE8zTHSOYdS0KxyDPHGSiPhEINK8D8ejxysk7brsN2xEX2vx
	uQuN8NEMla1d3yNxlrLPkChvG+BndXAvS++rDmDeEFGREoTzNNLpRr+cmUvc=
X-Google-Smtp-Source: AGHT+IGpQFfklgML0v0C4LtaU2v74NIo4jtxn8wZdpHFLuloc5xneMzv1C9DI4bftKit5brhjQgwO+p7wVaG2CY8JIk=
X-Received: by 2002:a05:6512:138c:b0:53d:e5f0:32bb with SMTP id
 2adb3069b0e04-53e12a3929bmr524178e87.51.1733212626459; Mon, 02 Dec 2024
 23:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Dec 2024 15:56:55 +0800
Message-ID: <CAGXv+5Hp030iiCXDYHYX6F1mD5WnsL=EziHPfM7Hm4kMxnhgXw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hsinyi@chromium.org, sean.wang@mediatek.com, dianders@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_235708_823178_8676B536 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, Dec 2, 2024 at 11:21=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index e324e3fd347e..cebb134331fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -1276,7 +1276,7 @@
>                 interrupts-extended =3D <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
>                 #interrupt-cells =3D <2>;
>
> -               mt6366codec: codec {
> +               mt6366codec: audio-codec {
>                         compatible =3D "mediatek,mt6366-sound", "mediatek=
,mt6358-sound";
>                         Avdd-supply =3D <&mt6366_vaud28_reg>;
>                         mediatek,dmic-mode =3D <1>; /* one-wire */
> --
> 2.17.1
>

