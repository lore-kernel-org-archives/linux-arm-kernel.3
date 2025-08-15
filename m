Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E31ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=; b=lLoF8nx5LmZ/JwsgwbMVV7sStK
	Xsv2bQU/rTdTyxKl/fhd18rbOIEpQ8K7aFD7PDjII4rx0QLgD6pH6qROO5h9ElaNEBvxuC+wlHq7T
	jVpF52ogkErQeB9gRSl/IL/5yVoZfl7kphviFA2AvUjJ24r688zyp6nf7aSe2LwUMNxBr2NntoRSd
	iTkkFDFV62fc1IjvI1oDzj5WtVhYcujS3zSpWRClF+eYbPa3HujNY4NvMbPm5mVjxi+Qe8emWw6ce
	r3Yqpz+9jaL4CJ37qj7M8U+rFp+043pxi4ZkaxR4+XnKWwGsYCxFKh9CiZ0BJfKn4Ro5lFZMtt6ei
	NXAK3RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlJc-00000001Jbx-3ee8;
	Fri, 15 Aug 2025 03:41:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml4h-00000001I5t-0jAD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:25:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so1246206e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228349; x=1755833149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=Yfqhm7/NTQ8f74RK/2/cmbalMPyPFKlag65hYBLIXLVHt3opj2I9ss3wTgJkf1GIc6
         s3i43uhhV6JJtjalLlWkn699zHNCLn/dnq8CaFDhz6PB6Pvui5xFCPiGo37q0avSMUTe
         3GOD/PNQRVVtG6XkJ7uuetsjg7JVvXbIOgY38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228349; x=1755833149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=J/BWv7VSMY2A9ri13+zIFtiAO0YWTtPiywfxlXvGFz+4pZvcBTjbZH/i1ziWjGFhqN
         NRks2q1AD1SMy4NJ0Ijf0Yuuj/Tor1F0Ta16tjDbqOxEl7Z04jv9Gpk+sxpsVQE5Ngob
         77BeP6pVoIrZ/D44/5IR6bsvnHlXY8cRKaGCgGJjZ2yIJkR+5Cf5oIZlj3N4reoIZwy0
         pQYH6xUqpcrFgG5ct7X7O9JvomUeSqAyzkH0LFVsBaKJo+23VVKMmBPB030fdAD+lxpq
         082xFRvhDBP6JT9XQGzu6bSmf5wF5OEoC/hEnwWOnO5RpIZgNE7nAqxvefRYRSyUK5ti
         8iXg==
X-Forwarded-Encrypted: i=1; AJvYcCXxp/laFxbfo5xn865rFte6eLhWPej3w14ftAH1nPKumfvlYOPXfJzRHm2AAbVgebe77EHBvxxCo915lHPQW6fg@lists.infradead.org
X-Gm-Message-State: AOJu0YyOB9p3/HT0fspjuLKxXFA8S1ls7RX9aMoK6CN/ITVddlqFxU9n
	4Xx3d+hPwnotlpd8J/bFokqJeppdyl/iKYZQQmJHeX1W8WASS/l7zdiKcRp+vX3DCuH5TL5/4I5
	k9IERfIDU4o9eyWB+bei0egxxf+HPk50W/oBLfr7w
X-Gm-Gg: ASbGncunhYfyYEP0Bq8fLP8B9wEZWf/eqz2pvuWEUxqzvY5t8Bkfpq5wtgQY0DWjpfU
	3+Zu9+KFTIcjhxRjWl1iaYODUknqXNHVdRyzqUsF2OifvJAQHrzGkZqAalmwMs2Bz9XL9wt+rE7
	tL55FoAzUBxBFcwmsdcF35mOvLVKMb20AJeMguWnqF62X/iVynOK3IdUzZhMoXLvNdcTndryhwj
	DAl6AVzsfr0vi/oAqaNyOm7ChzzO5MqpA3f30XZ3+LiLdDH
X-Google-Smtp-Source: AGHT+IHML+FnX/LTF4Glnv3hTMjadeJlzca/Pry92PrR9MSNtfqTK7+3shW4DsnQEIw8uD+VwPOVAyVIaNye6SvIV90=
X-Received: by 2002:a05:6512:250d:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55ceea26136mr167317e87.15.1755228349428; Thu, 14 Aug 2025
 20:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-5-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-5-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:25:38 +0900
X-Gm-Features: Ac12FXyNFrgNnv9v_gZ4B-DIdoLeQQJfDCsM2y3l0UccKVx-_zcaQDAz8pYASzA
Message-ID: <CAGXv+5F4r+tN4vFVFcL5U=o2WrNZHUQN_VNTy=qLo4MKTrjmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_202551_216588_5A3E5783 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, some clock controllers use a separate regmap for hardware
> voting via set/clear/status registers. Add=E2=80=AFmtk_clk_get_hwv_regmap=
() to
> retrieve this optional regmap, avoiding duplicated lookup code in
> mtk_clk_register_muxes() and=E2=80=AFmtk_clk_register_gate().
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

