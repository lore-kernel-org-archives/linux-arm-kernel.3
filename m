Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196FEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjOF9AP1kWt7dtM4qZ2BnQTZbb0vLZh3HtXtIU2plOE=; b=XOX8KPtPFkP9IqWa9bz4F4/opZ
	AFJZs7YwrYUX9MRRiSo5DV+M+iCUX8jHmW/gsdes4AFRjjLJYv8ERwt6BbCF3GZtGst8BudTgzlXA
	YWpkFAHZCPi96Jm2AtA3nAy4ZDSjqslO2sSYvYawOCxHhlhM5Jtx+9NphEHM5lCjwNjBvW20TMwJC
	7VqEXulpffPsOayxhHnu9VCUyq1vqM6sTLLNececvBAMWP6tiU5V6kwGbE/E7ATQ2lYXN2DLOkdGF
	RXaAPQh5becQ7K27+racSRpM1X677MsRU4ELA3+Q3gj20MJbabh2XAwDAPNJ/69+jBBxiFHyF8MtX
	Tu1WpzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamQ9-00000005c3C-30K9;
	Wed, 31 Dec 2025 02:58:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamQ5-00000005c0a-1y0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:58:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42fbc544b09so8076381f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767149919; x=1767754719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjOF9AP1kWt7dtM4qZ2BnQTZbb0vLZh3HtXtIU2plOE=;
        b=b20N1tS9OphmoJ/Ovc0EIOJKwhEQ2l0EDBzrJjRsZqyrVY+tAyl3OpKxtMXLdkN87l
         ohrQY+B0/G6h6+qKJ9RCCGp8tcR+Co+6dn8a6KDkf7UAEDvAIe0laI48/q8J3CKBK8ZL
         l5TpB031SfJDEb1XHsnrv91gxjW4JgzXQSndUnfkhfKntl8ekgTtO3eH2QRmfnOwNdr+
         BiFgocGdh+eqinZtgxK9JTfOM7yLhkH7Mo7tCC69PB6IIbN/uOTNtJ0N799EcYp1YQLG
         Dl6NGGZC2UBi4ZNfVv4NRCzRv36HPxf/pgfJaqkr6+RpgKCKmSn3rAMYq7MjPuOX9y42
         G1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149919; x=1767754719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjOF9AP1kWt7dtM4qZ2BnQTZbb0vLZh3HtXtIU2plOE=;
        b=Yj9umqmoS8OHOuBRdNGmPyRgCK7ek3Nl0Tes/bSsQRFBAYYm5xyXxiu+iTQaq+F+Qe
         MvBuCdiNAdahSHVfBBOI9lakPfTOBM0aW5vEKHKUaA3UI1pJftqsH3liKseyURr+yxWd
         /a/ptj5Pz6xo0fAp3kefJhCXXjaJa2WKsdhvD601R6/SvK8KCdEriSkwtMg77ESWng58
         YP/goK3m08O3oQLO/HChUxBknsgaDayruMGZ1i5Kv59wWmJVOIkQ4moprktWJy9PXZN2
         JsBH66zyDcx0z8CrHjktNErRb7GU9FqXAhQQZXC2heCRFUXjf/5dwCOZsWgQUoCBiO6f
         eObw==
X-Forwarded-Encrypted: i=1; AJvYcCXvZqdQgwstsogItnEJf+pgV2EGAoyc0NH23vJgC4v4yG04Egw3iSsKklWZL+xIMCo+7PqDIrS031DdcTowj9rf@lists.infradead.org
X-Gm-Message-State: AOJu0YxM6DPD12mQzA/CfYpy/bBhA3rhJh00qYWFU2RB55WxjUCtaNQl
	4cIHLNTZk2Xj7KqhnwPmzYJxiswjI4CUKVHlc26Jo50QM2lOWY1wKjuBl+mFSazjr4HnyJ9yb6P
	+GOg0CEOxm4B6ohWIPUBTufasPL9egsQ=
X-Gm-Gg: AY/fxX7AJ7QbMjA/dP9aPF5UDUzcJk3uREZsOYXwZhVj4DFf/R4xkejIXU288l0yPuH
	p85UjwJikY2hkaNV+edzlkk2ES3OMXt/6wgN6Ikp4mYjlKG01X+LgGvKW1ZyIcZtGzzBDTzqCgi
	tQrl50iCz+snZpDvFP0gzoFjWma6Uqm9T4hq8BiehcYA/THgLGkwCghuyxF1XUW9dJJqQy+gut0
	tkiJyRsZXDYCbTdV/1cGegjraHDhKMacNSx1FRo4E9lbId9o4PJMSoliGeIJzfHlYWchZWrDksA
	e4kE6AZ38ELvuBYHRnjoqrBmQrw=
X-Google-Smtp-Source: AGHT+IED0/tBR9xef6QSyYr/ksg8LXHa3v+MUTMcvi0rmIK6StQUKqxOWmDb2kvsqCq0GK7718Mu28JTd3JN67IAXiA=
X-Received: by 2002:a05:6000:40dc:b0:432:8667:51c7 with SMTP id
 ffacd0b85a97d-43286675205mr16586415f8f.44.1767149918957; Tue, 30 Dec 2025
 18:58:38 -0800 (PST)
MIME-Version: 1.0
References: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
In-Reply-To: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 30 Dec 2025 20:58:28 -0600
X-Gm-Features: AQt7F2pDJ_ScaKl1BWdf-T290QF_8Ch1DTovPrz3SxZy6maCo-TigDI5eUGwzL4
Message-ID: <CALWfF7KHyKmDcEL9=mYzfCRWc_cymNscoFdeXr8P2frJeww5vA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Enable the NPU on some rk3588 boards
To: ricardo@pardini.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nicolas.frattaroli@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185841_550902_7A58D26B 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Dec 30, 2025 at 2:20=E2=80=AFPM Ricardo Pardini via B4 Relay
<devnull+ricardo.pardini.net@kernel.org> wrote:
>
> This series enables the NPU on a few Rockchip rk3588 boards.
> In every case here, the required regulator was already described.
Now that the pd_npu has defined the dependency to the vdd_npu_s0,
shouldn't the regulator-always-on be removed from the regulator? When
the Rock5B enabled the NPU, it didn't define the regulator with always
on. [1]

More specifically, the commit message for the introduction of the
pd_npu label mentions how the regulator no longer needs to be always
on. [2]

[1] https://lore.kernel.org/linux-rockchip/20250721-6-10-rocket-v9-10-77ebd=
484941e@tomeuvizoso.net/
[2] https://lore.kernel.org/linux-rockchip/20250721-6-10-rocket-v9-7-77ebd4=
84941e@tomeuvizoso.net/

Jimmy

>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
> Ricardo Pardini (3):
>       arm64: dts: rockchip: Enable the NPU on NanoPC T6/T6-LTS
>       arm64: dts: rockchip: Enable the NPU on FriendlyElec CM3588
>       arm64: dts: rockchip: Enable the NPU on Turing RK1
>
>  .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   | 34 ++++++++++++++++=
+++++
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 35 ++++++++++++++++=
++++++
>  .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 34 ++++++++++++++++=
+++++
>  3 files changed, 103 insertions(+)
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251230-arm64-dts-rockchip-rk3588-npu-enablements-1e2830d2e7b=
0
>
> Best regards,
> --
> Ricardo Pardini <ricardo@pardini.net>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

