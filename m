Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1448AE7849A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39eKp0lre0iAcEwilAxe54iPna/jYDclKLk1A0GLHac=; b=ygmdq9NO3YrpcvzNiHUhPan2dE
	8mho6y7R21JtYLzprFk4Mag4AYGknSVVJWQURbJqpUaxhQa11F6TAgs4xKGSPzrwHKo1bLZQI1CbK
	lqEQ4sDoP3LVn0YUGvOoQG2+bxbsxfGaThW4BV2cuWenf9fkZCbGOUVM5A8pa8Y+76qcC1NuSC6R4
	/TmkfW90BPDPB6P+mv/6q5SVL/O0tXkYAUVhGGZnqbl97RZN/rcfg87XnXjTs9+dROBqQ5h+2O9Uz
	9jZESs6u/fsNPgM89y+FmX3VYewK3dA9qbP69d7r/sNbQGIpvGWanh+AZOsRseXbVSrF55bOCprkU
	9ie18gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY2m-0000000HTyo-1F2Z;
	Wed, 24 Dec 2025 23:13:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY2h-0000000HTy1-35PU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 23:13:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a12ebe4b74so109252405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 15:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766617998; x=1767222798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39eKp0lre0iAcEwilAxe54iPna/jYDclKLk1A0GLHac=;
        b=nK7wuIQf9bHvNRjFgEVw6cp7Eu6IZC707/LqCOFT40eH5xkgtT9lrHlP/i7Cvn91sC
         HPirItszvqaBg90FquqZh5o1rZUlB3xMvQJsY7SreYyMlezLwf/fuLqaXchAeLwoqMjF
         2p7h0Z/VoOZ45IfcWT56zUkbH2JGvTY4mk+zgcZzhThhxzk19VhFt/XJXmL29OgBzXF1
         clnGn7YvogRghhP8/B4uo4fbleKUozY5BTjfvYD147pB4U96BRzWXobG+Wu0nxB1g81+
         ZpnQwhiHXxvOwgN7Z+nsLMc1QjmtkaD0U+BWPXd80Yk3URJN0zM2HfF/fkW6kKhQ8ydf
         7kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766617998; x=1767222798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39eKp0lre0iAcEwilAxe54iPna/jYDclKLk1A0GLHac=;
        b=DIUORG+YUiry88Ga7cpnvA5Xe8sahoPnFTQUTApYBtSleSmTnqvMZgBRdYU2JPjCsv
         CyVC8Y2vstTYOFs1dyQ4PGiYSy6IQf9Yh1wVNXCPrARDoP8KGRaVBtAPQrj+J1NmM96r
         +Zda3APseCLRd5iPaWZef4u2PxDJA0x/O0GQ7HAuGD17RlnqFXjAdTGtgr0drrHu4nNG
         EXDr4+0vRNh6aekTRCwxtJmf8/zQ307sHD1iv+4aHv+ZLF79i2i4C9DMCs19beaDVmwq
         1p0CH2ML4ILyzP4OWu2/SjtCYpabdomd8xxRgij3OMuTvnvmdk7p6B072Neq7h9e0IcV
         LNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeZmTvl0Ez4MhH9rSb2nqD7ROCJXrHt7O7FOrHuUu7Fa2ox1NYzas7ba3AJpByJcb8Jp7OWUPnh3TgBcG1otj7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3iHZgAbCgMewOOkYE0PV94t57Du7Ezn5iHd2Q2ux7Sf4X/dVo
	1/dNX3JGxw6ho4LsYzZ4Bfcf3eKmvLmP/46OtPl+4U2plnp3IMj3QvBD2KcudEZMlRPLoordjoC
	cC/3TroR/LVMdWnL//2szz8JrWcouoJY=
X-Gm-Gg: AY/fxX6o0uv8zeJwMUy/3ZPgTw3kC8NZ3PpG86QnjRdxKCRoNn6eRF5Gt2w0yfhzadL
	5JUBoaQYc0KlCuS9O8EntwO2l0VDlSYjT6M15ZEd1M9ALbFaZWd6qV/bLFymPUAPvmVdP9xi2U0
	Fv0b36kgf6+Q59CtgQ5LpONqliTSBrQVyRg2UWd/JKwhzc23idP4ZIRr0fEo9MVHWs/tRvQ/eqy
	5Z2DzO2aDTrJCz1i5fvfkI26xoCqmI5L6W6NwO9LJGPgSFtb4/cVh2W9qxqHPBR+DAW/WjDrKfc
	hTZWTGN5R5ecsTgGoy602kmiOYEc
X-Google-Smtp-Source: AGHT+IHxaT5zaSwSg9D3PpaQ1GSF383GTh4mgURyIv7jV0U9GcfwlGrz4kymRBv4+EFCWY7j+PDxnjZVzSewttnmnpM=
X-Received: by 2002:a17:902:f542:b0:2a0:c20e:e4d6 with SMTP id
 d9443c01a7336-2a2f283de1amr175122085ad.39.1766617998054; Wed, 24 Dec 2025
 15:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-1-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-1-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:13:07 +0100
X-Gm-Features: AQt7F2oLSwp7qGXw0Xpn9L9LA9q7ocHmFoWAO1mWuTnDqJHxHA-5n9rc1zIgydo
Message-ID: <CAFBinCDXppQNyadCJ0dbD9JQW=pRFkcJCKt8=etN+JrNdW--Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add compatible for Amlogic S6/S7/S7D
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151319_797864_46A12C76 
X-CRM114-Status: UNSURE (   7.76  )
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

On Tue, Dec 23, 2025 at 6:37=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add compatibles for Amlogic S6/S7/S7D reset controllers,
> which fall back to 'amlogic,meson-s4-reset'.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

