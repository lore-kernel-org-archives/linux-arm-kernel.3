Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F7FC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=; b=ab6jpqhKFQumXZnFNoYTUwwUgy
	+prvyxgW5KptIkBFa0dg+RkWeJvjPV7fleVDEfBe7Fu/2l1Qtwf5TO9AG3yZLxtvOwEZIDKaEBsjP
	BY6QdMRdfUZbtLAb0MvmU+N+SddEmFQcCwN+m75Cu/NUpsTyUSi+D+g7Hz6LwrSOkcFct8OS9NK97
	zOODYXytXPa2tn+sl+fQCHSky42jjowwS5njgiM94voJT8+Ns914eKQKHOD/AJDoig7GrjnqvX1A5
	bu+0AHJqjqcH49xdt7Km5bzXrmuD5PRiJLqJyxRHugHi29ZuGgsw2Sd0Ps5/Dl4+42yD0LNCpJVTq
	tpcyIMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVRo-0000000CisH-32Qo;
	Mon, 10 Aug 2026 19:14:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVRk-0000000CirQ-3BqN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:14:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-39266382df6so2439988a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 12:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786389243; cv=none;
        d=google.com; s=arc-20260327;
        b=Epb86kua+1BYQJk0IKrDYJdkVTQwoCQ1sn2u+5rNwOB6woZCuiPcf+MPxso0gIeK0n
         fN8DyiFIw1ppL3PHzW94BWqfxptMsISLpaWFGTEfZsvOM4cejaU8gOOfQux4UlKHoxiW
         yWZ3/mjTl85JKZJGTOtzsW8winc4PxwfeCWm8bsmA/wkMHnQ6WzL/aV1/EJmrP+l0QTB
         i7obby7LsX7scUW5F+qbBoJYBYI2RnAb7Ut478BQ1hkTLMFr2bDCPh8MmNmQwyr6tKN/
         aj+cvKQD7EJKj/OHfHzlnXhd/ysyAOfsKcP1hs4iv4b6JECK7h7icaRgjuiQJOimLNTr
         gsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        fh=eDrTrxrd005/ovVBNymhJRG8iWYlFMuzy8Zqv17GVAw=;
        b=AoQsNwW9suAdl0n1wJKnogNpRY37peWFWsTgwbpCsgL1eGiqKRFl1xFTGA8dNkZlZo
         u+q8CTTBBWlFwxiy5WjXidU0g9DAekknVpxgMjOpaLYctP3lj9UeE18O8EBfYMoHQqQn
         EbjcCqIUf8+FTlKBCVpKULqnIDnPrenmg3uYbL2VjEfxaa4SZXyAIYuRphU8+3kKeHXH
         jkIL3V6iy+dBuqookYCLNHORY5uxCr1Ui8DwtwlJ3o8V6hNipI+t6Txnj2bADTEO+P48
         til3lnR23L6XAF/DqbR5VDwu3B+cXuNAfKmYtXwDCfmnx1TohrvHY6dWOupXVKU7atNy
         4P4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389243; x=1786994043; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        b=ZnMhm80+83svGh4Q3dGf2s7BBDG19xGgIiay97+xxStiiMmZURCOu9XvdYH4+WjJNt
         iTGr8SJgxr5fdeKLD+J+NTgrW1Zbk6z1ijdR5GbuLeY58BWX+cEKQtbDonolTCU3STbH
         H6d0sBGV/7VNNEvFdioqCmsPcQJ5mTWvsX65bNwUq+pTKpSYpZMgO+5Mo28A5abI0E3i
         BN3Q80dT4hTQZKnuYEO8F+dxj0yC0tK8M3oWZwebzdWv2sf4jaVAQUWia27P7QlSrNgB
         /UNINFakgnCeTrB7Ppt1aELxW6StTAiNqeiT/YG4ICbdqtoi6DoxfiiBw47arcYGuWxV
         6sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389243; x=1786994043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        b=PkX6MX1pM+lgMLerlLwyUO02Fakza1WG3JDs3GnZ9hk9JTslUrs3BMub+/9e072yba
         0AD27/ZRFM+Ux2GJu/EAKYyBedQFMvTMoJOPh+urKoD5Z6Nr4S5/jZFZ5GVNBp+Zxg4r
         wGxcOvFScrvftqY8xU3pkMRtqoe9ThNZZYt8Z8pxvtrZP8aDAmtM7scV1J9yw1086LbJ
         FJ/MmmEig3EQ+TKzzGRySXx1gu3AHwwWbJWmoB5Q0XLQZScBaDsW1Jo0HMXEAA4ZDoEp
         IRFle44GAvJWeQ0KLNBaTCzeHM1EeYFUj5B4Grr6tMRuqqHN4s+MtGQ8BhdpGJIc3afn
         h4cA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9h8fUz7kHHCR9DeMQ9l3Uzg6n04O71Di57+TQ0Z6JDaXIsOsB/RmYnpg2cvUfnou9Aun0rLuC4z/y6YX+iVe4@lists.infradead.org
X-Gm-Message-State: AOJu0YyeO6AP682N3bjZ9AudPefecYh/LBmM4HqdfU9Og6PsKgHHjuZd
	Jy0yhYknH00dTdR5g2QTXaLd/ulC0Uf5qmfjzunJKYPJY4doXtjPYoAsMtzhvTkp1S14lvxOtEu
	MHcMcEQK1PtHRj2K3bLMmCKy/aFOqhNI=
X-Gm-Gg: AR+sD12wrmVHdsLSPsUNGTclDnu78gYEF4AkCbZbibpcygX+Z72kZNAW/5ebx1D9Vj9
	7McdW4H/mkcfhbua7sCuKM49plJOfu5lRggBpNf+fZcw7l81nxSjxf8MTN4dkjdxF9FBR4wb6DH
	NkyWVp+uXOBiQaab/eYczk5S/8nulMcA9ovYKi5boixJ0P+acNXS5cNMY34gch+Src6CMQMc9Xf
	UwIxydx+M+6MdI/eJEU86I3uDfMFRriYHAbbxPYnMCQxlF0MBmEhOks8+1e0iOlY8qb3JsNwYpc
	I3CErQd0EwhROrTgpXC6FCDoB80IyOg7nABNEtep29H/i1icKwB0Pho9d+eeK2jhyrmiQpibAky
	wQfDZ475nwMmMbqmU7XqsWCYUfdBSiFTrNECM625muGekG7LHvMP4FswyxEeUzs6V+8sq
X-Received: by 2002:a17:90b:4d84:b0:38e:6bd7:fbbf with SMTP id
 98e67ed59e1d1-3903c697453mr40345740a91.20.1786389243366; Mon, 10 Aug 2026
 12:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 10 Aug 2026 21:13:51 +0200
X-Gm-Features: AUfX_mxzTrvRm81zDcfC1V6GLy0ckjTy6s3zsVjpnKMTBTT21-X5wzX34Jts7oc
Message-ID: <CAPSPb=s9ZxjrHPn3Xfe24kS=_29G0mX8xkxdWGj2Rkd83zwnpw@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com, jonas@kwiboo.se, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_121404_827164_E9C8E458 
X-CRM114-Status: GOOD (  30.78  )
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

Hi Heiko,

I guess this missed the merge window for 7.3.
Do you want me to send a new version once 7.3-rc1 is out or will you
pick up this version?

There is one very simple conflict in
arch/arm64/boot/dts/rockchip/Makefile with the LubanCat4 support
commit.


best regards,
Joachim Eastwood

On Tue, 28 Jul 2026 at 14:02, Joachim Eastwood via B4 Relay
<devnull+joachim.eastwood.gmail.com@kernel.org> wrote:
>
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
>
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
>
> Patch 1 documents the NanoPi M6 board compatibility string
> Patch 2 to 10 are fixes and additions to the nanopi-r6 base DT
> Patch 11 extracts the common NanoPi 6 series bits from nanopi-r6 into
> nanopi.dtsi
> The final patch adds support for NanoPi M6. Support for M6 has been
> split into two files; one dtsi and one dts file. This makes it easier
> to add support to the new M6V2 board at a later stage.
>
> All changes have been verified using the schematics for M6, R6C and R6S.
> Only M6 have been boot and runtime tested. Testers for R6x are welcome.
>
> Note that Sashiko may complain that u2phy0_otg is a dangling phandle in
> patch 11. This will never happen in practice so it's safe to ignore.
>
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v5:
> - Switch from simple-audio-card to audio-graph-card as Sashiko
>   complains, rightfully, that the bindings are a mismash of both.
> - Add pull-up on sd cd pin. Noticed by Diederik.
> - Link to v4: https://patch.msgid.link/20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com
>
> Changes in v4:
> - Remove boot-on reintroduction on vdd_npu_s0 in nanopi.dtsi during
>   refactor screw-up. Thanks to Sashiko for catching that.
> - Fix minor typo in "add gmac1 add phy-supply" commit message
> - Use schematic net names on PCIe reset lines. As suggested by Diederik.
> - Link to v3: https://patch.msgid.link/20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com
>
> Changes in v3:
> - Reorder patches so the DT fixes/additions are applied to
>   nanopi-r6.dtsi as suggested by Jonas Karlman
> - Add comment to gmac to rgmii-rxid phy-mode to explain usage
> - Addition of pinctrl to sd and pcie are now marked as fixes
> - Remove both always-on and boot-on from NPU regulator
> - Link to v2: https://patch.msgid.link/20260711-nanopi-m6-v2-0-422675a65402@gmail.com
>
> Changes in v2:
> - Organize DT such that adding support to NanoPi M6V2 later is easier
> - Use correct clk id for I2C mclk out as suggested by Diederik.
> - Add a couple of acks from Krzysztof Kozlowski.
> - Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com
>
> ---
> Joachim Eastwood (12):
>       dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
>       arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing sdmmc cd pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing pcie rst pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove pull up on rtc int pin
>       arm64: dts: rockchip: rk3588s-nanopi-r6: pcie2x1l2: add clkreq
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove always-on and boot-on from vdd_npu_s0 reg
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove useless vcc_3v3_pcie20
>       arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 phy-supply
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove bogus vcc5v0_usb regulator
>       arm64: dts: rockchip: rk3588s-nanopi-r6: add comment about gmac phy-mode
>       arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
>       arm64: dts: rockchip: add support for NanoPi M6 board
>
>  .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
>  .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  57 ++
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 +-------------------
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 797 +++++++++++++++++++++
>  6 files changed, 1000 insertions(+), 792 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-nanopi-m6-ffeef7252fd7
>
> Best regards,
> --
> Joachim Eastwood <joachim.eastwood@gmail.com>
>
>

