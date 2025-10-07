Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A6CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyvVzqRAZ+jJPuuow0tWhdGCSI6e0A8fiu8e4y33sz4=; b=ooK/iQGSZLFIksxC7BxFzFQsKe
	dlCcXOwzFvwkpyXt35+9WQ/n4F4iJ2R//KdMQEpnO3O83zi9I8tRgMGgCM0VgJNSwpJQ8DesuBH8l
	UQwBEJbA7p8QDH/w+oQ3MqbpAXQAuNlB639PKVPbTYqfdeNqSvp3Udi4EMkkSG58ggyvbhvSbRm+U
	Vwse4bq3fONnOnv3uSIR+FAAajRT+E3nWBfr/3JyvcgQF1wwL/RPryJD1Y1fsT3CDqnudxkS5xJi1
	IKjPdAwUKs27ZhbemT9GGMNYbA8EIMYvdo7Fb2Nn9J9XC5oJbRLUkyvjb+lAqDGS/xofBhej9x7XG
	l0Ous4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DEQ-00000002fTD-3zA1;
	Tue, 07 Oct 2025 19:20:18 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DEO-00000002fSO-35ud
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 19:20:18 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71d603b674aso72092097b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864815; x=1760469615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyvVzqRAZ+jJPuuow0tWhdGCSI6e0A8fiu8e4y33sz4=;
        b=V8Et1FXiEHgUaiqXOgyTQfGhw/Qi/MbJvolAetFDOZZrCmJWUxQN25a5ypX8Kotpfg
         qrLXgBoIPCPwarjMi4CbzJ5f8Y7H/bVMgjL8r/5Pt4ZZVk1FHC6XcEuuFiEzHxJyqfvY
         t/fneKniSVJAU1P34WZprj7JHeZPG8wojozQI6KWk62g+FF78q4euqh4tSNatJTxQ8SO
         0qbsuUZl5K8vTLBCKZD+1biE0jrYrHUUhECqq8EMhDADYna3UpCMIYW4Rbx7EtQafOvi
         iUvRMItlzA8FeTeN3Q8kEerRO+O7L/O4uYilI2JjP7i0UoqXWgTdwLYKTWYj2mU1dhST
         HkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864815; x=1760469615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyvVzqRAZ+jJPuuow0tWhdGCSI6e0A8fiu8e4y33sz4=;
        b=N4kQ/iK0US9c1875ZzvAv/DmhOAoiDO+OS6239FUhCzielwiW2eNj0SU79Qo5DGvku
         T/JsTtJm/0ptVV0jCV0bU5sVJVENsEGtoh4iy/Fd5WoZEE9+wI79Z0Z9IeEFy2OpZlJf
         PcFZ3ROF4NeoqbIzoTxeUAYovHP02PMo+Wi/vkXw7undTR1CzMO5XJHlDWAxKpl42mvQ
         Nrdn6mGnZosVn3lJ7b9QJpdrtWZi6vspZlFK/vB6+B+MnyejUPIwTs6HvDn6J5KobR5z
         zQcU77YSxo8o2Gnvdlc+JtS1e5dwy2BGNwr8as3f0UUxVFwKWYtBv5wkiy1316voh6zq
         lheQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/mw5T6hcfCYRn7uUHnHfocG9QrH74evp6V/AxxOGDHDTBYuEjuHUdt77rz0Hznd0VlKC7ETOIii6tIEFlFTE7@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZd9jhLpyohWBJ7I1oh9lh7Eo7xr3h0nsU+rFyJ4mwrtqfy+J
	s6gAK0OvIHY23KhXCKbfBRQsVnAs9MKzPLi5IXF1p+bvaEDNv+0wH0ASmwCRITP3hC8My4oXLC4
	eVSSiw/62fH7Yx6JB+xbAEPhYSh8vzneK+0IYCAUgkA==
X-Gm-Gg: ASbGncullqGEL5fAJsRRaNqD3k5WPM30FZVEXm2dAJCFLCd8HpDnIvPnCPZbgc6b3Pl
	CELiUJTgDhW3ZGubwmFq9xJGKuhPBnCNQaNinjo7Z67nvU4kXaGx79nHCs0Hfm+nOnWMeVrz97/
	gPPPZX9WY9STJxVRSEq9FBUqyLF1lMSVz/X8n673afnpOnwORWwj+kJyCMmTJFFXamR7+gyFrNn
	zzhWEF7FaP+kSc5hMT4EXOSKfMNB4QaA1UZXn3pI2rW
X-Google-Smtp-Source: AGHT+IEcS4H3ART7XbkyRLcIVlRN9ttSIKXOMErrDhYI7itdbz36cK6980ngyigAxI0SbIW7DumJI/JYvN83SQijQyM=
X-Received: by 2002:a05:690e:c8:b0:622:7517:af78 with SMTP id
 956f58d0204a3-63ccb85338fmr715381d50.13.1759864815549; Tue, 07 Oct 2025
 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:20:03 -0500
X-Gm-Features: AS18NWCtEcLGJeO6dNMCbDSRSbiDXW6f_hsYoSbqLJrQg-Tj2Vl72UtnnpoTtMI
Message-ID: <CAPLW+4mT+BcK+sLTenaNP7T3iFF1yXj4kziSYiJx2gOYV2NSWg@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_122016_792922_153A5058 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Oct 6, 2025 at 3:07=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>
> Update the code accordingly.
>
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index a88ba95bdc8f539dd8d908960ee2079905688622..1c8bf80119f11e2cd2f07c829=
986908c150688ac 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1823,7 +1823,7 @@ static int exynos5_usbdrd_orien_sw_set(struct typec=
_switch_dev *sw,
>                 phy_drd->orientation =3D orientation;
>         }
>
> -       clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +       clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->cl=
ks);
>
>         return 0;
>  }
>
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
>

