Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE930D25042
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=; b=0ceaclIKGxn2VMxnbS2NIZC9uO
	D1zBc1a0k9A06ZuNKhxBquaRtcFcg3xU9tKc2FJJTw3nuasONzviH260ey45etG0UbJHOhiWPmWAl
	wQWn/fKtzrBZu+2/dBJJqhU/bbYRDs9rI18UlSGlOpi83eX0mHu58jAKkckCdDQYpJI6jBqARY3Hi
	JeYQJxMLcJgBCenAuQa6qnw3+q9mY7xtTvioEr/17RYNlcDoQQjMLaP/V0VSC7hah1+sfEyGkX5ZG
	DFkm2XQOH8TBABTF6+5Lpn2unf9xhlheJKQXsQYiBhWReo3lwafRF+3axd6bDi6AWl5ckVmHxO/tg
	/E2lmohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXT-00000004ucr-35Va;
	Mon, 12 Jan 2026 07:40:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXR-00000004ubk-3UCL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:40:34 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-598f8136a24so6538006e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203632; x=1768808432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=;
        b=STLUmzsS+LieYt3GJzijK2whMSIgNHTVQSXOyaDlXc+HUka6IFeWRu/gWFf0xhmLBL
         5R9qawgqzIW8gTbG2aRtYJFFAYJB2GgSJ97IBQTft6tx2VljkR4luOpAlLFeD1G86I3U
         jQI+8nOfw3i31SvDMiP+mWorIYVg4avEGZdT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203632; x=1768808432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=;
        b=PIWdAGoJGRfyKHakILAfMyNFjF90F2RkNC0SL60d/TruUoJsxngjX+VYS/+hIIrPgD
         tbJ52Im2NHkmLGfYviAe3s5+IDhl7k0BtFsprcjdwaY6ZtpQCTPSTbXZXnCBQ88WzGSu
         yRJQO6SUbaM3OWdDde7NAwnSaAxa8PnGrzy5FWLHfi3RgEb3c70OCJf7edcbUDTTHmuD
         f76MqvltZeH0LIj231KfXEGn+Rdbc+3FDV7SxcuZOSU1DTGLswBomBKkOPD2+VjQFFjP
         8zUCE6eMpv1XWwL5/8EfvaPW+x7wXTAtRJ0aOpSxYmZ89NJ78tFiawsmLVwZ4aAXHLpP
         QQVg==
X-Forwarded-Encrypted: i=1; AJvYcCXzPbccRhEBe2fV0Fxi7qLLN2XYoU5fIFzguG4tbwwZcgrCuvUrkpm2718EujwSFjn3MDHwQ8jLKeCHSP34zzEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhes/zBBTSDD9bPkwlbHykjn1gd9y9yX0r0p+CuJiIGx7w2xmC
	fH28fgFge+E0swDUJU5OO/A2Iy3QF7Tmiv+h2+FeAfC0wgevDiF5L3Zwc+FLd995hAWHIDQqqMo
	EuMSeDkJd+iGTawG7f02Gk/jn273/COh+eQcQO8Lm
X-Gm-Gg: AY/fxX7d3/d1Oji5EusaGhH1wcMQEh5vrl2JI74az4OP4nEONUcd3pyDQAY84rGRa+v
	y6py0KfEQZxMNSTsGX8Oz1X4h0BzkdXVBV4Zrn03Eo1vKsEqnsyrwYmxmg1cQ83YblJVZvRN0tK
	lTuo5diQ11C05mUVfUZRnYgMWCF2FTq9lUpb5swVgG1aXOzlEiUOKXcQSdCLUiX/9wxk6jdyLhn
	GMHwgusVgUsnRm+5U0NXDUIcQ2QRmubeZDbCuglBkVhbykg5UFRpkXmEiv7iQpW3OxngXSuDO9i
	zXUBj+eLdYC5UB0ed2dM/qXN
X-Google-Smtp-Source: AGHT+IFlCspDZCPT9FMQStGT61bv+dAucJwKR5nac26W67Y6fKeZtDHqcvUx1A1+f7pEcKY9oNXx2pViJv8f4miGw+8=
X-Received: by 2002:ac2:4e01:0:b0:595:91dc:72a5 with SMTP id
 2adb3069b0e04-59b6f03b941mr5675948e87.40.1768203631712; Sun, 11 Jan 2026
 23:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:40:20 +0800
X-Gm-Features: AZwV_Qh7fVNNMWj4l5kX9MHDq3r_XLplwxlkLkGSZaHxXqk6sxgyDlZM2EC7dDU
Message-ID: <CAGXv+5HEFEYhKFuxx+tozMxyJsey-0GHgHR2zMZOfNWYj25U0Q@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: mediatek: mt8173-elm: Remove regulators
 from thermal node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234033_878708_E7BEFB0D 
X-CRM114-Status: GOOD (  13.34  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only reason to have a regulator in the thermal node is to keep
> the CPU cores up while reading temperatures, but this is incorrect
> because the AUXADC Thermal IP doesn't need any regulators to work,
> at all.
>
> Since the thermal node was inherited only for adding vregs, remove
> it entirely.
> This change is safe also because, among other things, the actual
> driver never used those regulators anyway.
>
> This also fixes a dtbs_check warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

