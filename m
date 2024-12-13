Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A49E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=; b=T1zjRDdoVVtf5Og8SvQ1izA91U
	wZpQ5MSx1P2TIPmHldur2EGYAt8QnD3iX9cRCGcmWGxx1qk8rUA4AL7VG09WmQbwvmmP/izMr9sxN
	YmyUt60rDDlDNcUrYkhVkUgFV+q5MsHZi1ugG3hxeTJBb52VmUs+pcAUOXbAAH/zCt4ef7hOnPUuy
	70r10WcjAmxYHYfnSC5jwojO6lOZDuNlFPw9X0eiPnmkb+OTJyDOGcW9JPzNqZ0/gkHnT1xkXsGI6
	ajkwx6heQhGrMbyDPKjy04OPpZwGnOCMkaMIN7i2N8oT2gR8xWWAPBBgnO6GGOD2t9cgaF9vvdhes
	+sojDf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3sZ-00000003Z8R-3IWP;
	Fri, 13 Dec 2024 11:30:43 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2sW-00000003Pno-2Cjx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:26:37 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71e16519031so802590a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734085594; x=1734690394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
        b=b0llVnNe0uHfcVtLsZkeAC0mFR3IPxwHO0JFTvPyFnE+W9xnUpYDE9YGaBe9stL2XW
         HW0GPdX3vk+O52dgP2sd3wJemH0asmKF9LLqRK+smG6jXT/7At/h93nQM/vQoDCYVPXf
         /oz5ZGwZSX40+7Y4ldWetS2JlfpxyAgSzSklI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085594; x=1734690394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
        b=HOPSoUoYRogyr1d70jnV4il+lsAKaxtQf+m5rxtxdLFCtdW9xyJ0K9zyrP0rBUcC5C
         hVyMpNY2Hj7LbDp7m2hesfuGlbXpwfj0tzWqCX1/9uUY3tVfSCiC02VBllTZpVgZsGhh
         hku+MlERuSTG3bAi3DIYyAMPb/MEH7RJZXO5woTKNnh5zczwirx1MZu8j8KL/6RvjZVa
         Ft09vebR81WKakNNMypWwAMfagUslJsvPvEdOUSjZop5h8EJzVzsWE+H7Cx+meS5X1lP
         Ica88huQinD6oAVPCl6i4tUm0IBVhlEzWQWX4FZFH5Q4x4j2hVQ9gnQFRsWSWoFhDRZw
         hePQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZSLDg+5j80z8eZrGaSeATIDVWb9tcwYNOZ5Phe09RZHSDnH/PgcpzloUb3qxWUqwx2ZdEaI511/+Xw/0B1sVV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg6fmvey2V1GGMeCSTTxieLbitnk2v011xFmMqoI01S3c4LBEN
	qfoFQW38gtmVeh11LaubSPni2JNAOlWrEq38KzveYr+KzESO0ddrBH/qg7d0G/OEBHQf+WTm2wb
	TEZPaZGx1FmyoDK/VONAGwi04rqLKnVu/hUeH
X-Gm-Gg: ASbGnctzOr1yea5smxcg5xalVmDuHecgoiXU7fawy3h0Djrt6Ap52lk4VcXu+qEwes+
	dD2AoZQFcMzoyD90ZgQJvLHcBe65qp6ag52Bss1IOKv8nzS3JxIFSIXl+ZNl/ATi9
X-Google-Smtp-Source: AGHT+IENCMH98mpXyF3VrVAuDfFFYvkYege6xGr7xJlAm+RCTMb9aQXAq9gG3Wn85+C8PlkKAH60Qe9TT1gWu6utMaQ=
X-Received: by 2002:a05:6830:448a:b0:71e:30e:e022 with SMTP id
 46e09a7af769-71e3be44e5bmr1104651a34.10.1734085594573; Fri, 13 Dec 2024
 02:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com> <20241213095044.23757-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-3-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:26:23 +0800
Message-ID: <CAEXTbpcp31oWOCh2c41QbWOc5F_gpD1Bia0NiZeVyDbqKo98Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dts: arm64: mediatek: mt8188: Update OVL
 compatible from MT8183 to MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022636_556885_0156319F 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Jason,

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.

This probably doesn't need an (immediate) respin, but this patch needs:

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes
for vdosys0")
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         clocks =3D <&vdosys0 CLK_VDO0_DISP_OVL0>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
> --
> 2.43.0
>

Regards,
Pin-yen

