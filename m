Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC7AD0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=; b=tpQLpOV2IRcI+sMUzLHzHUwn+A
	7o/tFT4porDBqOccL5qlTGohUnKx+GZDc9DgoUFSAm0NRXsIpMdJjQIZlfgOMfoA3ncQuQjYBuBYT
	/tG0ZlQj+Srn9aOUQsrH2mhoi6x4re4Clj90Kjg/JXsXq5LjOPHx3B/Y1N/Pia5xI5h9Kw6xG7KIy
	HEPKr8DsPVwOyKhd0BxGCI12/sM7MuR01tl1t8Yh5MdFUGF+aDGtzs9dSNO9taRLtQ5wBXhLAm3pj
	Re5s/cH9plUu15o0EU/4FQaF3MCpf/PFoN/8V54h1vdOh6DAx5L8NGqx2InZ+n/sSAJs8fULh2clv
	tvYLs9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Iaw-00000003Wjc-12S6;
	Fri, 25 Oct 2024 11:35:06 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IMh-00000003UUM-08Xk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:20:24 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4a470d330a5so739969137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729855220; x=1730460020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=;
        b=QI7ufuiYXYn6l9L1qslSUxaN5m9Cunm5umz1pzInRZBlwBbW20HGMhENKmVY6yldfk
         jOLKEcLwkCWN9uV6iIqiLm/UQQvj4UzQN/t9lo2r/g+/AvD/qkp/64BmsKihTMFr6lKh
         vfTIFlyTnRAJCuSqjZbnjVynrHwHERVvm87dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855220; x=1730460020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=;
        b=HQXQlmOQ0ywdsxBqan51Tt4pDjA9Gi3xgpm9xdME9vXExEcezj+IFNsv5qlBUvA0gc
         V1JTjXKTLJjZox8s1JTsqBMJeNDkvevyYn3pCvMYlsEjKjhSu+WF86F5Il4TEQVXZHNl
         lXJ0j38GY+Em2CbEZZ62YWU3uNRaApmV/Kg0VjVzbY9IiDiqIPkaMWp7BUX7WAbeOWxk
         c6kY6KtD/5BD8XUIAvBuHteNx3DtX0i+nYPj0sGe74ICbewCmgRbVrxiYuCr8NvDf0/e
         T6i/xxRK+/31h0o6mAGFSW9uBd6IkTfTlTit55CfGTsJCccEBGNaAwgV1YyCkBjF66dZ
         XTJA==
X-Forwarded-Encrypted: i=1; AJvYcCULm1JtVGJ9WG8KmUvx+0908n4w5ZpbSu/ZypUI72wbKL4gNuLrYmWwP3JrvFnOh73fWjm6JG++2804IPexGTw4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+zUmD4BTcP8CZ9KZTEvYqx11bSoTDSrncLL48NBzwCAYw0LE
	AW4ZLspbAzaT07mkSpdcrKUiukc8E/qL5OztEZFkrlHMpvgwoobbRnO2A/GnrL+wZvj3nrtjnjT
	oMA==
X-Google-Smtp-Source: AGHT+IFXsVO6AqWp/jfqbUFQ6kaUV7Amf65ZEGQx9c3M06bisxOOAaBMxhLwRet5MzHxBw1whyKYOw==
X-Received: by 2002:a05:6102:a47:b0:4a4:8346:186d with SMTP id ada2fe7eead31-4a751cbd6ffmr12039453137.26.1729855220568;
        Fri, 25 Oct 2024 04:20:20 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c5398c95sm159562137.29.2024.10.25.04.20.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 04:20:19 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4a47f8a9168so668999137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:20:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpb/6XSui7Ko6Q2AWGffW4/jfvG8O5+rDFAo3a7xfP/IIuBHeXn4MyZlQALmE6aQoc7m/OgSZVV+Ch4caqB2qy@lists.infradead.org
X-Received: by 2002:a05:6102:954:b0:4a5:b712:2c94 with SMTP id
 ada2fe7eead31-4a751bff426mr11555515137.14.1729855218618; Fri, 25 Oct 2024
 04:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org>
In-Reply-To: <20241025075630.3917458-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Oct 2024 19:19:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhPsPRYk_w0n9or7KrEhF_UzLjN8MFCL6xw_FLR1b1++A@mail.gmail.com>
Message-ID: <CAC=S1nhPsPRYk_w0n9or7KrEhF_UzLjN8MFCL6xw_FLR1b1++A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display
 output by default
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042023_143530_910FE1CD 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Oct 25, 2024 at 3:56=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.
>
> Most SoC dtsi files have the display output interfaces disabled by
> default, and only enabled on boards that utilize them. The MT8183
> has it backwards: the display outputs are left enabled by default,
> and only disabled at the board level.
>
> Reverse the situation for the DPI output so that it follows the
> normal scheme. For ease of backporting the DSI output is handled
> in a separate patch.
>
> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Fixes: 377548f05bd0 ("arm64: dts: mediatek: mt8183-kukui: Disable DPI dis=
play interface")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

