Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05A5D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlwN8j82SgoVOz7HHzh2bhzIqCg28sVCaQneoE9LKSM=; b=VhNX0B2fI8SgA6mGcbQU++iQ3E
	WJCZ5I3CPMd0VNgvNs+ZZ5pvdITFOhXJ4q4ffA5WYAU4TZ2WGxVN96/ZIOqaiJkzeMiTa89rCRrkl
	tttTNP3mYcv6BqZUzZ5TJ1WCcfAqw/422/pAGUUpvPa0cNkt1AbwC/BjVm00/92R68Vn/HR/Vs3zL
	VPmRQBSV0lv9RA0nUjmKH1ZZSzbPz5tuLMGg06YsAAk6CZkShKBOXxXk8mDTyo/Bl5uK8SXci8gV2
	hju/Ki+/j9jI679P/+ZuMZQNmogtXNz9YJwik63MUzRyj9pszKuAUJGKY89f/Wj0A9HHxykPznx4n
	AwLLlTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSkT-000000051Z7-1evm;
	Wed, 21 Jan 2026 07:35:29 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSkP-000000051YP-3xhg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:35:27 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8c5265d06c3so67216485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768980924; cv=none;
        d=google.com; s=arc-20240605;
        b=QxZlhoTTbuRKzkfd4YL+QePJx/71EDnE67AjiTMWVBfR0gdaWB1Do3uunashTFQp9V
         b0gPDTpUkK35JfCjWgGXQlEt3+MDeCJU7m5TJL+OT1+r5iFpe8ykX05SIG0R2KWPDUrE
         M5pUdaHnbfI+pf8VXZpuUdBkJH54UmFzMdStZzce1Lf8Gbu6OEfbEnZlwiIa3lcPe1SO
         UgyFAoit3BPXZwqLyllQxSB3jkHKsnwmUhdG6aOQ+e7kdhXR3lcEhOcDCg0mlYEnfU8D
         +2FmkcUcApmwRgf6Jc9nqz6oe358jI4jAZOre2aNeLDO1InAQ3I2f+q6r/B800Y6m/w7
         1xBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GlwN8j82SgoVOz7HHzh2bhzIqCg28sVCaQneoE9LKSM=;
        fh=WGzQk03/uPBhjUpEl+OlPtQcVUOQjmctg4ubhsV4UUE=;
        b=VRnVjqYkZSukgjSprFh7QcBc2S76UlBE6JK8/tS9XwcJ9ehobX5n2QBSXRh93k+pEb
         aQ3ZyBZmOXZiQnZw/XiEZpC2JJOPaxI82IF0RLvzQvZPekgDI5LQr6kbL2GTRqJFv35j
         chIHPicGAMvOgtIKjXlKwbYkqdP6TkNTjL5L4UgUCgpkLMnPQox4cqrc6njAZ+yGB1Ca
         zhWiKP3ElVOmsCIqudDb9QVCO7McNt/IgF/02XMet39TRuiQlxctBgtMxVT5po6WFqbl
         5MMAOnYGD4cOAuF+mY5jAe+1Ehcr4v87b/H6zdumkepsyOmCb3X/JNOWN6swLWP77YT8
         kWng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768980924; x=1769585724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlwN8j82SgoVOz7HHzh2bhzIqCg28sVCaQneoE9LKSM=;
        b=mYZASeUJOl1DJSpDQKVYZjNLqFXB6SIDvUOz4+9wMECwcvtIpT7SRYXwz4FUzhCZIh
         mMPAnGx3dvC9nXYprTCPLmxuJpD6eVg42Dufpw4x/uEzyg1qU9MKNJkdzHaMLk6hcPjG
         GEJorhJWFURSnVrk+una1evocuGKRTjiR+luW+BUrINC0ZAamztqwJ3HrH2M5de0EUjv
         Gp8ncxldKTnIY0VaflbZaQPQWtuFOl5pwIXz8VMMvIZZPppgH0sFKueDtqdsOPyfSUvI
         WTNfgWSYAPxfoGfItWbMxO18msfHqOx0edHA4FKFTYbLE0iwwoyRIhuY6+d/Q65Jfg7F
         ncUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768980924; x=1769585724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GlwN8j82SgoVOz7HHzh2bhzIqCg28sVCaQneoE9LKSM=;
        b=way33oPJCG96mTUOz/7J8W+86Dn01dBLSCmze4cMWiSOxtqQu86+pPtHoUjy1AhuXH
         znWwwTsJ4RPWXOAO55iQEkpGkaICxrP/RozJkBnAeEaP4AxE4diVuYLII/ZTXwlxKXj8
         tBLH8sct+99A8IuTCBaa035A7opWLGZqQbZ+ixmaIGCZtLrpPwutWFvFx+ccLHTxEgbR
         ymHaLlzkUsJZVC7bt8hOS5rYctxSdc/AwoMrUNjPAuu6rdsVoJc07qOSDChvqoonGwx4
         OORb1CseCx0EOqTLoYvTnUXnl9wO4ZsTiJI4vuQT0129xYauB/2sKL3t7HjxaBggbGDO
         2LRw==
X-Forwarded-Encrypted: i=1; AJvYcCWS9BK631h044VlrBq1Vs2icSczjwnUg1gnMPWuUbi1w2pKmUMawBnuikXzForle1i5Om8x+lXxzgValhTfmP1p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj3/WxX1n4mfKQjQ+0xzGJp4+gmaEcvZ3bCSyurUN/jNP7/QRF
	BZtXjiWBQ8XXv6g10cH1tjjviEqq1g98y3WMWDtJeQgFTmlFriIGAU6i84JWObQj2wak57kUPSd
	7vHJM9uuVfHYxcICXvVonUOeRojWDKAI=
X-Gm-Gg: AZuq6aI4nnyb1UB7wVPHAl/kL0GuUuqix6gfOQn/Upt8eKgduBr8TXedwikbFhRyNz0
	D94eydc+MgxBKyLRQHiA4aoefKSkz2wKuRrECKf/xJl4z/PT7cfoumNjmGSwqokvM/0QSSuvMGr
	UO3h9QRGyBAsi3swpem0b++6vs3fZnIYnLQmnNlyyhiS2nQXdusEw6DxJX74LeQInKq7K6BIIrZ
	F9yOF48aPrY2sx5bVlK6Lqzj3ADetKCMh6B0WxxP9P9BnevBQlpzQFlERQiGzmm7ColdSjm/KuV
	lY/S0MrBGPW332G7aYkKPVpN25c=
X-Received: by 2002:a05:620a:199e:b0:8c6:a5ae:e9cc with SMTP id
 af79cd13be357-8c6a5aeeb3dmr2503090885a.14.1768980924177; Tue, 20 Jan 2026
 23:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com> <176894531223.1201556.243460289333921566.robh@kernel.org>
In-Reply-To: <176894531223.1201556.243460289333921566.robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 Jan 2026 11:35:15 +0400
X-Gm-Features: AZwV_Qj7xD-HFnkapRoKPYsoUpofy6BjoS4guSoqEyGq3j-AZNfOskowc3KWMuM
Message-ID: <CABjd4YyPhHCL0TNzKG1_t4bTspfcC0bx41a8t=u+CJo6JvMC0g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Explicitly request UFS reset pin
 on RK3576
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Heiko Stuebner <heiko@sntech.de>, stable@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_233526_005721_DE4AA394 
X-CRM114-Status: GOOD (  33.56  )
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

On Wed, Jan 21, 2026 at 1:45=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
>
> On Tue, 20 Jan 2026 16:53:54 +0400, Alexey Charkov wrote:
> > Rockchip RK3576 UFS controller uses a dedicated pin to reset the connec=
ted
> > UFS device, which can operate either in a hardware controlled mode or a=
s a
> > GPIO pin.
> >
> > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > hardware controlled mode if it uses UFS to load the next boot stage.
> >
> > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> > device reset, request the required pin config explicitly.
> >
> > This doesn't appear to affect Linux, but it does affect U-boot:
> >
> > Before:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ... >
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> >
> > After:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ...>
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000010 00000000 00000000 00000000  ................
> >
> > (0x2604b398 is the respective pin mux register, with its BIT0 driving t=
he
> > mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RST)
> >
> > This helps ensure that GPIO-driven device reset actually fires when the
> > system requests it, not when whatever black box magic inside the UFSHC
> > decides to reset the flash chip.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for R=
K3576 SoC")
> > Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > This has originally surfaced during the review of UFS patches for U-boo=
t
> > at [1], where it was found that the UFS reset line is not requested to =
be
> > configured as GPIO but used as such. This leads in some cases to the UF=
S
> > driver appearing to control device resets, while in fact it is the
> > internal controller logic that drives the reset line (perhaps in
> > unexpected ways).
> >
> > Thanks Quentin Schulz for spotting this issue.
> >
> > [1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f2081335=
@cherry.de/
> > ---
> > Changes in v2:
> > - Change default pin pull to pull-down in line with the SoC power-on de=
fault
> > - Link to v1: https://lore.kernel.org/r/20260119-ufs-rst-v1-1-c8e964939=
48c@gmail.com
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b (use --merge-base to over=
ride)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ufs: ufs-rst-gp=
io: {'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 113} is not of type 'arr=
ay'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ufs: ufs-rst-g=
pio: {'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 130} is not of type 'ar=
ray'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: ufs: ufs-rst-gpio: {=
'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 116} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ufs: ufs-rst-gpio: {'rock=
chip,pins': [[4, 24, 0, 29]], 'phandle': 117} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ufs: ufs-rst-gpio: {'r=
ockchip,pins': [[4, 24, 0, 29]], 'phandle': 133} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ufs: ufs-rst-gpio: {'roc=
kchip,pins': [[4, 24, 0, 29]], 'phandle': 122} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ufs: ufs-rst-gpio: {'ro=
ckchip,pins': [[4, 24, 0, 29]], 'phandle': 134} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ufs: ufs-rst-gpio: =
{'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 130} is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ufs: ufs-rst-gpio=
: {'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 134} is not of type 'array=
'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ufs: uf=
s-rst-gpio: {'rockchip,pins': [[4, 24, 0, 29]], 'phandle': 130} is not of t=
ype 'array'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer=
.yaml

Thank you bot. This wildcard for *-gpio is driving me crazy. And yes,
looks like I forgot to test against the schema - sorry for that. Will
resend a slightly adjusted version shortly
(s/ufs-rst-gpio/ufs-rstgpio/ to avoid incorrectly matching against the
GPIO schema)

Best regards,
Alexey

