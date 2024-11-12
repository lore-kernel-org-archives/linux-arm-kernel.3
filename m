Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51984D597A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvfLiy46zAAc4YpHFE3RBOLl5fq2FOHK1NiPPVPoB5Q=; b=Ttu+YoUpPDSyrtzSmcLFFmW/7W
	sWJC0ZRt/RSjbfL4v8gQgtLRMOiTKqxyLAvUJiO97QT4suPJd+QKN9sUN1SXsNGzx+fobNNfsyYmm
	TvwIWONhXx3792BPGAbQmk4imX7m3p3YUyqqBpmeyebcOuKGkF3PVsbZHfsiWyiNdcnYNYlKg01vP
	icYlcVi6jwLyM5OKZvubN8XCRkreJsofYLeKUuFpmcFZlhqP2fu+6S+cFWK19zlme0icGO9dpzL2y
	zIOQL+MRroerSV/UNGjCy/g46RHmlSf69OmNXXulrzY99Kja2PMadGF224d8YUDzJUbDpWGDFEqgK
	+foXz0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAy7q-00000004xc5-2hCL;
	Tue, 12 Nov 2024 21:08:38 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAy4Y-00000004xDc-3vC9;
	Tue, 12 Nov 2024 21:05:16 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c7edf2872so574675ad.1;
        Tue, 12 Nov 2024 13:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731445514; x=1732050314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvfLiy46zAAc4YpHFE3RBOLl5fq2FOHK1NiPPVPoB5Q=;
        b=nLvJqcM5q2Sogvb6RgB94eekCqiqusGl6HNARD1KmEW/XkN6/ozLDhKxNImmqu4u9g
         jCoPcce+XK+rqmCZ8DQSq8/9DXzIQePYzIX/UX8hoG2nDdRd4wvdNEEyIKBsUpABp1Tg
         ZhT1HsKO+L22gieUj7taXSQtiqeAu+yr1pimYH+keGPds3/ILVzW+8mt+XK+8WgqViPE
         B3FEAQgXwSTr9razQJYTiswqm8o2SPasy10+OuhTor8fqNAriv2ubt6dnKU80XSENYUB
         Gk/dn+yKCRMiFJ9cvlP/TYq5l0Aqc1pNBbsqFSKPIeFw8u2HOmFq/M9prOdCRg7keWec
         GMPA==
X-Forwarded-Encrypted: i=1; AJvYcCVcTwBvAL7jSg0tuLykwO8czRd7HBwxvnCeNNaT/LfxmZfzL1YfeEwjDv0Dg4fhj/jCInxq7sLQsH3/q9B7EH8=@lists.infradead.org, AJvYcCWlcNxnwC96CMwmk7zidFdhl7JcZ32FzzYGte0TnA/nCFd6ijbmwxgGMbHanVr4yy7gIL/T6rCi5dPyuQIwO6w4@lists.infradead.org
X-Gm-Message-State: AOJu0YytZSb8kogN/Q0gKgzkj5y1iSAKCehp9RSLBQ5jZJ9mN7ILnc7q
	A8s/DxPJnn/bzycDt+LQgEvD6cylLOgCPB4ae6qlmlL8v89ws3JLcXhRfXMw
X-Google-Smtp-Source: AGHT+IGqdsB/KQZuLyb7XZJP0hqL+7wojjEHAqrXmV0hxO4W/7841LVSQcAeJC0PECmrSthPwlBKpQ==
X-Received: by 2002:a17:90b:4d01:b0:2e2:8ee3:b936 with SMTP id 98e67ed59e1d1-2e9b0a2fda4mr26848704a91.6.1731445513456;
        Tue, 12 Nov 2024 13:05:13 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f396f501sm30190a91.40.2024.11.12.13.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 13:05:13 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso42173a12.1;
        Tue, 12 Nov 2024 13:05:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk1Hv4NclAfyohmlEYDEQ5c5Jedx8yqFyBIrZjLDJ+T+Pg0T7mu9t25mbvJD2AalomWxn94JNfyXi2NH675gM=@lists.infradead.org, AJvYcCWTMoTDg3EKGHHyvoZRyn56cEfqu1wsS5BLJhGOVtQ6cCDY0d1mW28phQh5z6Rv3VRwT8rnyxXy3ECkO2zAgzeP@lists.infradead.org
X-Received: by 2002:a17:90b:1e45:b0:2c9:6abd:ca64 with SMTP id
 98e67ed59e1d1-2e9b1f074b1mr28605933a91.9.1731445512591; Tue, 12 Nov 2024
 13:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-3-tszucs@linux.com>
 <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se> <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
 <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com> <303ad3910668e852d6670d1c79dc22e0@manjaro.org>
In-Reply-To: <303ad3910668e852d6670d1c79dc22e0@manjaro.org>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Tue, 12 Nov 2024 22:05:00 +0100
X-Gmail-Original-Message-ID: <CA+GksrLLbfyHdvu1VYB4S+W78C0T1DEWu5W6pP2-g3KdBeT-LQ@mail.gmail.com>
Message-ID: <CA+GksrLLbfyHdvu1VYB4S+W78C0T1DEWu5W6pP2-g3KdBeT-LQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
To: Dragan Simic <dsimic@manjaro.org>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_130515_004139_E49C2D0A 
X-CRM114-Status: GOOD (  43.81  )
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

Hi Dragan,

On Tue, Nov 12, 2024 at 4:16=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Tamas,
>
> On 2024-11-12 15:35, Tam=C3=A1s Sz=C5=B1cs wrote:
> > I think it was totally fine to disable sdmmc2 at first, especially if
> > it couldn=E2=80=99t be tested or wasn=E2=80=99t needed right away. From=
 what I=E2=80=99ve
> > seen, this board works great even at higher clock speeds than what
> > rk356x-base.dtsi suggests. I don=E2=80=99t have access to the RK3568 er=
rata,
> > and there don=E2=80=99t seem to be any limits mentioned in the TRM eith=
er.
> > Overall, this board is doing just fine as it is.
>
> Sorry, I'm missing the point of mentioning some clock speeds?  Any
> chances, please, to clarify that a bit?

It's all about stress scenarios, right. Sustained transfer at maximum
clock, multiple SD/MMC blocks used concurrently. That kind of thing.
Different data rates forced. I hope that answers your question.

>
> > Regarding device tree overlays, they would be ideal for implementing
> > secondary functions, such as PCIe endpoint mode for users with
> > specific requirements. However, the primary functions for PCIe on the
> > M2E will be root complex mode, along with SDIO host, etc. In my view,
> > the hardware is well-designed and interconnected. Users have a
> > reasonable expectation that these primary functions should work
> > seamlessly without additional configuration, right out of the box.
>
> That's basically what I referred to in my earlier response, and in my
> previous response regarding the UART.  Users would expect the Bluetooth
> part to work as well, but the error messages I mentioned look nasty, so
> perhaps something should be done about that first.

I'm not aware of any nasty error messages especially related to UART.
Well, MMC core will acknowledge when the platform part fails to
enumerate a device on sdmmc2, but there's nothing wrong with this.
It's not even an error -- certainly not a nasty one.

[    1.799703] mmc_host mmc2: card is non-removable.
[    1.935011] mmc_host mmc2: Bus speed (slot 0) =3D 375000Hz (slot req
400000Hz, actual 375000HZ div =3D 0)
[    7.195009] mmc_host mmc2: Bus speed (slot 0) =3D 375000Hz (slot req
375000Hz, actual 375000HZ div =3D 0)
[   13.029540] mmc2: Failed to initialize a non-removable card

>
> > Dragan, what did you mean by SDIO related power timing requirements?
>
> Whenever there's an SDIO module, there's usually some required timing
> of the power rails.  Though, I don't know what's that like with the
> non-standard M.2 SDIO modules that Radxa sells, which are intended to
> be used on Radxa boards with "hybrid" M.2 slots.

Ok, I see. Not always. I can't comment on Radxa's SDIO module but I'm
sure it's reasonably standard. And so is the M.2 Key E on this board.
Actually, part of the appeal is that all standard buses are very
nicely wired up. I want everybody to be able to use them.


>
> Once again, please use inline replying. [*]
>
> [*] https://en.wikipedia.org/wiki/Posting_style
>
> > On Tue, Nov 12, 2024 at 5:41=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >>
> >> Hello Jonas and Tamas,
> >>
> >> On 2024-11-11 20:06, Jonas Karlman wrote:
> >> > On 2024-11-11 19:17, Tam=C3=A1s Sz=C5=B1cs wrote:
> >> >> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UH=
S-I
> >> >> rates and
> >> >> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
> >> >>
> >> >> Signed-off-by: Tam=C3=A1s Sz=C5=B1cs <tszucs@linux.com>
> >> >> ---
> >> >>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
> >> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> >> b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> >> index 242af5337cdf..b7527ba418f7 100644
> >> >> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> >> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >> >> @@ -688,14 +688,20 @@ &sdmmc2 {
> >> >>      cap-sd-highspeed;
> >> >>      cap-sdio-irq;
> >> >>      keep-power-in-suspend;
> >> >> +    max-frequency =3D <200000000>;
> >> >>      mmc-pwrseq =3D <&sdio_pwrseq>;
> >> >>      non-removable;
> >> >>      pinctrl-names =3D "default";
> >> >>      pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
> >> >> +    sd-uhs-sdr12;
> >> >> +    sd-uhs-sdr25;
> >> >> +    sd-uhs-sdr50;
> >> >
> >> > I thought that lower speeds was implied by uhs-sdr104?
> >>
> >> Last time I went through the MMC drivers, they were implied.  IIRC,
> >> such backward mode compatibility is actually a requirement made by
> >> the MMC specification.
> >>
> >> >>      sd-uhs-sdr104;
> >> >> +    sd-uhs-ddr50;
> >> >>      vmmc-supply =3D <&vcc3v3_sys2>;
> >> >>      vqmmc-supply =3D <&vcc_1v8>;
> >> >> -    status =3D "disabled";
> >> >> +    wakeup-source;
> >> >> +    status =3D "okay";
> >> >
> >> > This should probably be enabled using an dt-overlay, there is no
> >> > SDIO device embedded on the board and the reason I left it disabled
> >> > in original board DT submission.
> >>
> >> Just went through the ROCK 3B schematic, version 1.51, and I think
> >> there should be no need for a separate overlay, because sdmmc2 goes
> >> to the M.2 slot on the board, which any user can plug an M.2 module
> >> into, and the SDIO interface is kind-of self-discoverable.
> >>
> >> Of course, all that unless there are some horribly looking :) error
> >> messages emitted to the kernel log when nothing is actually found,
> >> in which case the SDIO/MMC driers should be fixed first.  Also, I'm
> >> not sure what do we do with the possible SDIO-related power timing
> >> requirements?

