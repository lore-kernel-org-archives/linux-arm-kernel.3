Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A4D42B88
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McjUok6KfDUiGy+BXB2JFJst16pFs7oxIw6Lr01GESI=; b=GFTWgCkQq3l25HsKcAg/EJcF6n
	lYiQ7Cp57jJuHAUPuyd/s/euURdU40UCrwmhxUrSxMUj3iA4Ge1rK7+Rl+HWCB7zvw60wMFeb5dZ4
	L4cy+WrjZAfPF+hIr956V8Uyadkm7tOU318ZOdrPeLobLTADJBWuKre9NADReWticvgjj+H01+arW
	sdOll08iV+aDTgxFa4p7fLJiQVD/qTUU+OFGHfIlk23XWn24tGu0FfVR7Qjn1B75U0eo1InN/DoFx
	i8Q0myM5gyqy2OfOrW80JJhH7xKlYVcQhrMf9R+AWCPfkXIrQHK2xTtX2s4h0SO6gOy5COWDZiWHI
	Fa1MOR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs1c-00000003mPX-1z0B;
	Tue, 12 Nov 2024 14:37:48 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArzp-00000003m5C-2Gv3;
	Tue, 12 Nov 2024 14:35:58 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2884e7fadb8so2864629fac.2;
        Tue, 12 Nov 2024 06:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731422156; x=1732026956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McjUok6KfDUiGy+BXB2JFJst16pFs7oxIw6Lr01GESI=;
        b=ZEyffz9qaSNq/LLdrjrchjIREv1Izu57aCjT3PfSz6wu5w1nCrJJlDhvRRi4hugrw1
         pqkaLi7TQMYck/s6xrUwPAwX8/OHpgbyivE96MsHX54VbVHoVz9dg/qCXWy8LuzRowBF
         sPTWZ+kXKwkcC2R0EQeUJb6pLF5d6MXik73OoNqwHtbLBRcmTFd6ZaiUr05Q97zqKT7s
         NR/nTGqmG6AUVQtxs6UZLuF0i7vcUbxQz1zjjy0mhGpX5FW53uLSYqLPxQ5gJc7JJB6Z
         MAFZI9bvp9yYxjFEq0sJtkb4gPoH0N9pC85/0AHt8wfjC1mSsASzD8AKkvP5TDg7patK
         BOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs0NUDlUIOgQ8iItlXQeUJpwLz/Qa0ixTub3YNQx65mAh+7XeXFMwNROGCsfqtpuimWWiocohFS176KKBELG2t@lists.infradead.org, AJvYcCXA7OYix7vBRJ0LDKv5PBhK/E7ywyNmnrJpFqAIkWzTTjKurkgTmvC9ezhv8EhO1UNHq0tIxUMA02rbjU4pASw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzroc+P36huct/q+FrslX5rU3UB+TfgOwuNsdw7+cQEy0CL/tyM
	PVsSzAGyNVc8it4a249HM9b0t7NAw6JISexiCV/9XIOddeVGSA4n/Q2c3jCC4hgKUQ==
X-Google-Smtp-Source: AGHT+IETF8IOcGSaG1bftC/L13y+TcrSKPCN1pAAdkurgcbsNEybTsDh8IWPY/rFijt/AiHrtpA7Hw==
X-Received: by 2002:a05:6870:d95:b0:25e:1cdf:c604 with SMTP id 586e51a60fabf-2956026e862mr13705562fac.31.1731422155983;
        Tue, 12 Nov 2024 06:35:55 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f43b4dd027sm6543711a12.21.2024.11.12.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 06:35:55 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so4572991a91.0;
        Tue, 12 Nov 2024 06:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNFGFXnfJ7/VA6dbtufvBtZQaQTCewJmZYPCxv2y45Fz1u1iRt9jEGMTzmXKX946rMt0XfT8h8RR5wIRC3Sj4m@lists.infradead.org, AJvYcCXh1KR/f1Ld1YCoFuN/I7btoeLy0ZGiedLEzQUPSXrLNrVjL8VBJUShvvl469nuOdR0dY5Vr5IhHOGSqqQHwaI=@lists.infradead.org
X-Received: by 2002:a17:90b:3146:b0:2e2:cf63:224c with SMTP id
 98e67ed59e1d1-2e9b17838ddmr19179314a91.35.1731422155186; Tue, 12 Nov 2024
 06:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-3-tszucs@linux.com>
 <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se> <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
In-Reply-To: <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Tue, 12 Nov 2024 15:35:44 +0100
X-Gmail-Original-Message-ID: <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com>
Message-ID: <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
To: Dragan Simic <dsimic@manjaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063557_607730_E8A34697 
X-CRM114-Status: GOOD (  27.99  )
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

Hi Jonas, Dragan,

I think it was totally fine to disable sdmmc2 at first, especially if
it couldn=E2=80=99t be tested or wasn=E2=80=99t needed right away. From wha=
t I=E2=80=99ve
seen, this board works great even at higher clock speeds than what
rk356x-base.dtsi suggests. I don=E2=80=99t have access to the RK3568 errata=
,
and there don=E2=80=99t seem to be any limits mentioned in the TRM either.
Overall, this board is doing just fine as it is.

Regarding device tree overlays, they would be ideal for implementing
secondary functions, such as PCIe endpoint mode for users with
specific requirements. However, the primary functions for PCIe on the
M2E will be root complex mode, along with SDIO host, etc. In my view,
the hardware is well-designed and interconnected. Users have a
reasonable expectation that these primary functions should work
seamlessly without additional configuration, right out of the box.

Dragan, what did you mean by SDIO related power timing requirements?

Kind regards,
Tamas



Tam=C3=A1s Sz=C5=B1cs
tszucs@linux.com

On Tue, Nov 12, 2024 at 5:41=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Jonas and Tamas,
>
> On 2024-11-11 20:06, Jonas Karlman wrote:
> > On 2024-11-11 19:17, Tam=C3=A1s Sz=C5=B1cs wrote:
> >> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I
> >> rates and
> >> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
> >>
> >> Signed-off-by: Tam=C3=A1s Sz=C5=B1cs <tszucs@linux.com>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> index 242af5337cdf..b7527ba418f7 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> @@ -688,14 +688,20 @@ &sdmmc2 {
> >>      cap-sd-highspeed;
> >>      cap-sdio-irq;
> >>      keep-power-in-suspend;
> >> +    max-frequency =3D <200000000>;
> >>      mmc-pwrseq =3D <&sdio_pwrseq>;
> >>      non-removable;
> >>      pinctrl-names =3D "default";
> >>      pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
> >> +    sd-uhs-sdr12;
> >> +    sd-uhs-sdr25;
> >> +    sd-uhs-sdr50;
> >
> > I thought that lower speeds was implied by uhs-sdr104?
>
> Last time I went through the MMC drivers, they were implied.  IIRC,
> such backward mode compatibility is actually a requirement made by
> the MMC specification.
>
> >>      sd-uhs-sdr104;
> >> +    sd-uhs-ddr50;
> >>      vmmc-supply =3D <&vcc3v3_sys2>;
> >>      vqmmc-supply =3D <&vcc_1v8>;
> >> -    status =3D "disabled";
> >> +    wakeup-source;
> >> +    status =3D "okay";
> >
> > This should probably be enabled using an dt-overlay, there is no
> > SDIO device embedded on the board and the reason I left it disabled
> > in original board DT submission.
>
> Just went through the ROCK 3B schematic, version 1.51, and I think
> there should be no need for a separate overlay, because sdmmc2 goes
> to the M.2 slot on the board, which any user can plug an M.2 module
> into, and the SDIO interface is kind-of self-discoverable.
>
> Of course, all that unless there are some horribly looking :) error
> messages emitted to the kernel log when nothing is actually found,
> in which case the SDIO/MMC driers should be fixed first.  Also, I'm
> not sure what do we do with the possible SDIO-related power timing
> requirements?

