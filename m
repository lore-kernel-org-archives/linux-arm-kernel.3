Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C9D49797
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=; b=ANIOkl/JNAHNZs5ktCrDvEHuDs
	jxFv7K7i/sk5GU77w5ywOT7GlG0tUYBuVwyqBIOQjfQQ8UhZHHTCBJa16AOw4GHOOBNiW/UNvL3Ja
	bIaqsML490/rrYlfKeJvFGPOwHwhyE1HvYys3OIYa4hmH9YfEX/ijY63kqyldw7sHjQlOabRsL4ub
	sA4d+0zl3RcTN/nyyznxaZaHoZ5zTnOhAamhgyKFat0Ym0zmni0JMAVCzsSmBX39S1aTS2QnpEb+b
	v6zUxI9i58hsrMG5RpEy5chp5uDbj4+9CcuaEoWMVS5H5Ub4Kfver81veoirZtiRct2ZzI8LHYuQb
	Cq3PfawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP1q-00000008qFb-3TTg;
	Tue, 03 Dec 2024 09:17:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP0q-00000008q47-1FeQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:16:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53e18b1baecso186158e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733217366; x=1733822166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=;
        b=gCOWPjaT+NikgrzIQBXbDZZa3nzyOncM0YBf3yUGherF6LU3aKUmbxERppzpG/UvBP
         NNN3YkiXPazihaeR7UzKSGBCNdQrm2sKW8gWSPwUQSpChgsbY6MkRCVLuwpF2tnuAWYS
         VPa2GYkarr734vl8O4RGUrPDOvsbo7UZJz4dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217366; x=1733822166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=;
        b=mfiYlyc8lrbncUSt7cqR69Yk0NzDDPn+Rircm0i4Uuc6rvWlU3UCFbyj8p7qvBRdni
         kJOmiikM67LDjbmp8+K7KPQnDPcLDEMl4id5uV4FCkW8ZDQqnoGcM1rSeCTSSM4W2pPm
         kJSOzt4qigXicsN6MBd7mD2Zc/EsShlENsZyQctudunk6S0GGQwnbyPw7esSHBNH0K2H
         SulZqWluNkQhfcF4lxwampPUKDoBoObW3w1mZhPlws4mZWTHTb9y3z6hvupj/E89AXu2
         cMPcuu1qCcYK1qGYRAEvUwTMsT6auIOL58epN/c80R9VxpzaeW7SoFml9oazhTtynb4w
         Mu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHl9g8m27ZBVq+tD7epyZV/gdq194qaZIT8uGOxYAHHe6KxC6wUTWoK8BC8zTdNEt6jxLZ8JgdNpEOdbohA24B@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4tbemVeXQ8drlLyCizqntF2pDMzqi1X24MjnwRhLM5gKZxZ9
	T8zuJ7SVc7aieqDM6PoE9Ek0XDWlH0RHW5axnV/VVA4AUP3GDyeCIQ+rF+QEW5TP5LXquJQUMV+
	4hN0QJ3J7YyfKxkvR8MB24J73jixPqm2Lu4mp
X-Gm-Gg: ASbGncssdysaEnoPqFWoyMJ8PToMbzFbiqLz84iCVskuakPvl43tHTeZ8b6QXpR4Baa
	C581yGbJ/58SBQFj3N3Uy2IQ+B+9lz6eV6QGeDlHbj0svX7FtDS2zxHnE0HM=
X-Google-Smtp-Source: AGHT+IHblgyX3h9C40czpfBFU4FlCVyQGCJtmnMsdRZhtqjaXaMQ/snRbicpRd77CCHWP8KcHzPutSl+2EBTyk0stG8=
X-Received: by 2002:a05:6512:474:b0:53e:166d:bdf with SMTP id
 2adb3069b0e04-53e166d0c7fmr436640e87.14.1733217366415; Tue, 03 Dec 2024
 01:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Dec 2024 17:15:55 +0800
Message-ID: <CAGXv+5HsOgRCpGOFxEJorVD+=-6GbW_=K3AChkBSxTs27fNJ3w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: Add exton node for DP bridge
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hsinyi@chromium.org, sean.wang@mediatek.com, dianders@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011608_407414_EAFD426D 
X-CRM114-Status: GOOD (  14.54  )
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
> Add exton node for DP bridge to make the display work properly.
      ^ extcon.

Same for the subject.

> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index cfcc7909dfe6..e324e3fd347e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -424,6 +424,7 @@
>                 ovdd-supply =3D <&mt6366_vsim2_reg>;
>                 pwr18-supply =3D <&pp1800_dpbrdg_dx>;
>                 reset-gpios =3D <&pio 177 GPIO_ACTIVE_LOW>;
> +               extcon =3D <&usbc_extcon>;
>
>                 ports {
>                         #address-cells =3D <1>;
> @@ -1656,6 +1657,11 @@
>                                 try-power-role =3D "source";
>                         };
>                 };
> +
> +               usbc_extcon: extcon0 {
> +                       compatible =3D "google,extcon-usbc-cros-ec";
> +                       google,usb-port-id =3D <0>;
> +               };
>         };
>  };
>
> --
> 2.17.1
>

