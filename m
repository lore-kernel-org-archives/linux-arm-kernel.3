Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7EA1093181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=; b=RiTOJxaIU4u7y3Vu1lmJIW1P7h
	UrSAz8FxH5oeONS7B8MxJwaBKN6rZiJxwa4kUqQQHiuziD66h7UW8CltKifHStrOw4681CQzOjy9l
	6IxTpnsTNjvCN3r2UX+gARPogrDBa2R6tUWJSa45JsSh9DayQjfyUKfcMjweV/zTS63bpnVEI9FH/
	xZCw96TX4W50gYxAz9p6BqSM1vooYgQS9eCmrY/LPhILFmMoY7vdmAUkrIOOaUQnAP55lr108ZuH2
	1x0KuIAJz8Exf0ZxZeTAE8Kq9lrL9FzT7V3hunBcO2VHkOAtKOxzxeaclkNIzKusKiz9o7AZlIQzV
	XhRLdOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UHe-0000000CGW0-2Zs0;
	Fri, 20 Mar 2026 07:28:38 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UHb-0000000CGUn-29Eu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:28:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so2583604e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773991713; cv=none;
        d=google.com; s=arc-20240605;
        b=InToD1mDZlP9p12b1tRQhivKQlLoEh9tDAGzDTraugaQLUep0AkZwCggn4/WrDOj6I
         /qiwhtipSEDUV53fuvpScNvl2G5eM7BkzOO51NKrgWG3Li6SpmTrdaa25rXbk1MPxTCl
         dlPK+ILVKohy5MnsLqMmAo3nO6EBKjTu6GkTQ/rbde7BA0W2wNzK7Tkzg+NtwF/QwYgv
         ae44H1+n9fDX6iH7SUcaVtnpstbzrY1DKfGft+6m+Bjw/XMuw6T1HtttAWKtUX9pjri1
         gU8rYUFyCXXAsJxyV41KlIXWW7Co4PzXaitjE2ErFxLcBcm8fQ9Z2jU16c9uCcHTLGVl
         5Pgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        fh=KlXqLrTpea2BebQ5dKY4HDO2TSJfvtXyXrHCWYyyQ2U=;
        b=J2i5MZdJdbjCR/UVFd8Qs02BDzt1xXlc/seYgTB8teVDN4CGK7FPKQV/zyJF9RfXyp
         QPuXSfaBwVafXQdwk5tiIgZ2AmzdzGClcgI8qREKx+en+tkOAf5PEhdubGOtudhF/t29
         n9NjQeBf044+6zdOL56DwMz8vqwmubBgIzbELQVNyoYpqlobM9TdrePtYfX0bLfG0ucx
         sJVde6KYQW0UkZoBUhVo09nqMYKlROqQE5YDmKy8wTWVweq6DTteRrIetmbsjgAoskTV
         NRvFHkbiPak9FUgxG7H9+ZotHfi+iv/eVM6I5mDT6d+Oye2LyTkilYrPSC5v7897XgRc
         t0+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991713; x=1774596513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        b=Y5z37ug3ufkFx4a1iL/yutgQAzp4Vr5m8W3JWdAiR68PVfvBay1B4eBHBM3NyeWt5s
         bPB2Gi7PgXn8khozE/v/MphXxV54KWvA07+VQRPuPyTHC6w4CUw7dvkKoUg/8wXHG0nC
         gZLsmLh/rLqrgfJPPhHOGBaoQe6EC58StetkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991713; x=1774596513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        b=e3F/52fQXZ5Z+yF2X9M+9+XVeVev7kdGZM7teZIHbfo/L9hoOvtrDsLPwLEiKQoCeM
         TzMuvBj3lMUUZab/j15GnvIW382dWQ3Ch/nALgGmjtdmq6mULTZ/uWkXGFqA4kEns1k6
         FabuKZBSs9ncvI+BoVAAp26raEaKVATyIAeLCM9oIaT9fugoyqFfkOETLwPCL6j3TWy9
         YH4VGURNpSxe26ZkW1bDm4qMTmtxNNZ+UKLqeiqFrR1rqM0YcGHLyoggauYDmD6/fXc/
         kNdguHxc5HiPJfphfFT1gOL+FKDmsBV9k2VXByltCcperip9W7ctIeuht7p9Vj+XjXOU
         7Zzg==
X-Gm-Message-State: AOJu0YyGp6w1czu5kSOyh9t69nyojSkf7L7zSuMvSC5Gw3nN1jU5bNZX
	SS7bX76k/L81gTepXS4b+GDO4IHlrfBe0p0EG2S5FyywFufgISmUTvb0xjiDIUbCTlLu9asrkc1
	WgVbhC1ej9GHr0fcTa7ncj+zYnbdZGMhqbiIn8X38
X-Gm-Gg: ATEYQzy1gL45E+PraPaVe0UbGKowN3uLoFmZAzjzXEodz+Ms3dc1aDSCuO2klkzQGdq
	XYYmhFlFlJw/M+xtNnBNLaTiG9X+SCyPZlsthyDEkO9P8hPWIRPok8jQYVUDo5eZjWxnvBiHfI+
	Ot3oMgTqkm4BZfIcRCqVqjnWw7IOJC8mrxJ+lvNLHv/CEeIo3fwMeaZj+fepjyWVzUig4JdOqOP
	0u88D3za5LrX0Cd8Z+Wp0ehFKuc9YyqwiNESz7aCR+W0TSpazOu5l8gqldlY3sCFUPr0oxirDTt
	Js8NHAQtu4olzww9ELCpawXB+LXnS/2skZwKdA==
X-Received: by 2002:a05:6512:39d3:b0:5a2:7a48:f4a2 with SMTP id
 2adb3069b0e04-5a285ae4b05mr626516e87.2.1773991713064; Fri, 20 Mar 2026
 00:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072302.2402489-1-wenst@chromium.org>
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 Mar 2026 15:28:21 +0800
X-Gm-Features: AaiRm53muhcbEfiawzjnCME41hVR08oCHNfuwP3luCiL15l5M764Em_8Z9arEds
Message-ID: <CAGXv+5HwK9hvHeMWS+vjOtwd6TOk3upMmDx3bZWH+KQzi7oRww@mail.gmail.com>
Subject: Re: [PATCH 0/2] regulator: mt6359: cleanup and add supplies
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002835_604408_2E7DB699 
X-CRM114-Status: GOOD (  19.95  )
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

Oops.

The subject was supposed to say "regulator: mt6315: cleanup and add supplie=
s".

On Fri, Mar 20, 2026 at 3:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> This series is part of a broader collection of regulator related
> cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.
>
> Patch 1 adds the names of the power supply inputs to the binding.
>
> Patch 2 adds the supply names from the DT binding change in patch 1
> to the regulator descriptions in the driver. This patch has a
> checkpatch.pl warnings, but I wonder if it's because the context size
> for checking complex macros is not large enough.
>
> Device tree changes will be sent separately. The goal is to get the
> regulator tree as complete as possible. This includes adding supply
> names to other regulator DT bindings, and adding all the supply links
> to the existing DTs.
>
> Please have a look.
>
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (2):
>   regulator: dt-bindings: mt6315: Add regulator supplies
>   regulator: mt6315: Add regulator supplies
>
>  .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
>  drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> --
> 2.53.0.959.g497ff81fa9-goog
>

