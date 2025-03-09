Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A101C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BClW3AD5pwAP7HlEQggy/3PgguRjaaiqTnG6w3UH/Q=; b=mM39pTcYh1mH6sK3TErRKApgGq
	bXtRnlERSrKDuGCM9MWWF2cE1eFF4nA8RceIJf6Y3EBAsfvripPZb4Rru4SjxRW1OEWcpy7F4DA9t
	Z6PgjAPycEyQy03rhATmlWpV5TAxEVCbOBA7vCjGk+dEd8Ln9/MKEcRkDVclrfo3qeoMdexOteZ6J
	5tRheb2E83wPEqSxnNuTEdsn32n+nO3n5+s9YwtXI2HETTkiiQGbqvPKg1knkMaXiSbyRMyEqBXW9
	9Ox6dCSKhxLr5lAQ8idrKfyw1ycljExqIlFDKHO1MG4tIXjyPuRoD9bIsDJAcBk3nONt2peXoEebJ
	gpMgW8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDf1-00000000KtA-3J0w;
	Sun, 09 Mar 2025 10:13:31 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDcV-00000000KYA-2KuX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:10:57 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so2562965276.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741515054; x=1742119854; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4BClW3AD5pwAP7HlEQggy/3PgguRjaaiqTnG6w3UH/Q=;
        b=r5kVOj5nS1WtVD30efoWSherxLG3Lgtt6QZQWAE5On9dNFSycyVA94TJYFUG97FETm
         pp0BnQb9L/P270kG8s+LkYSaS2eotC8ffiVeAHR2uSVZH7GxxBndIH2S5nsEAwXUp71W
         b474CEQbfIo8Vecml19gKDX/LlADFgv8Q2Q1CApHGUoECiQLEPVYjih/08K3r5LJFm9M
         4tErYCV6AmlP7z9WVdg7NVS7PB9i0w2QnRVPcKwLwEc7Dv5kXhPvG7YIny2nuj19p5hG
         ZlX7bN7RYY8ESVZmjdp+wmt2Be7aMMrSceif06OTd4xEA2W57zeY+C/tTxYH3QoVcVXF
         f0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741515054; x=1742119854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BClW3AD5pwAP7HlEQggy/3PgguRjaaiqTnG6w3UH/Q=;
        b=umo9p0B8Fvocb3yWf8VeMXpRU+ofkiVXf8+rpysF5UuZF4FkuDDii6/5d5gF8P1yUZ
         k3Wry1qFy3uO1bOshfOsaPcaBK4mxYZuZ1qwvm/z4mN9mvA10+3OXmE7VvVDhSu2cIru
         A42O3eTXkAKgfOAvL1tf35o8cVS/WxqL7FueaUtikjB0dkge9o6tzTTAf01mCs4g41IF
         kYrvca9yLaK8WXUt+caIuaA2aRysbdPM9xxnPJasG//YbSjgkpHArJaKfn7LuSAaE6VU
         MnzJqi4PahPzlY/K2iPVrf32W9ZPlYUafiNnic7LkuQ+0ClEoga9h1wDlusHRYxxNPJ4
         4mEg==
X-Forwarded-Encrypted: i=1; AJvYcCVbk/sTjzlnnttGtep53c5IZWzkpdD8Udae+JRFbJk3COapAPSOu4Z5W1DKXDrXJLEe+ubs42B5KoDK/icaKwjC@lists.infradead.org
X-Gm-Message-State: AOJu0YwD4rwBb2S82+oYWor1025MIPTdzJLgOwg/nia6YwuXF4B7GcYp
	0LatmGyG5dC7hUw/Cddyou23exj4EojncQQLZ5NEPi2hTMz0Ms6ayNwdN1QMmpjhuSR1izrfFbC
	PFED9q7cLpwSOeT27SDP8pdI3L3Dq5G7zGeunHg==
X-Gm-Gg: ASbGnctO2aWrYlVbNMpkq/lf+8+LJopzcdPFy/SVNiQrJqyQhKy1+hCC/xzXzpXPUSO
	0o+WQO4ItkQIrkREhIMnFOyt9FSEdnU2nV0FCpz7opxALu/Kuz6hWfGTLIAvfiOxHcNDzMTnidc
	KwxbUebyIp6OVaq2yAO7vlgJ1o9VpdXKvmD13Pgku8e4suPunCEMY=
X-Google-Smtp-Source: AGHT+IELHQ0fTEF6TQsCVADH9+2FjqIz2dd2lZgnP8p9HlYkvFgSHseJRTK4oPdwl0BlLmUYZqUu+3ES+J82wsobBT0=
X-Received: by 2002:a05:6902:1081:b0:e63:5be5:81a3 with SMTP id
 3f1490d57ef6-e635c121fe2mr12595424276.1.1741515054548; Sun, 09 Mar 2025
 03:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-2-35087287f9d1@collabora.com>
 <CAA8EJpqYE1drM6=C0AwPZ-e5RkWqjMTpWQiwhA64qby1mmVL1Q@mail.gmail.com> <22142c86-c8b5-4427-9764-a7daa4a005b1@collabora.com>
In-Reply-To: <22142c86-c8b5-4427-9764-a7daa4a005b1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 12:10:43 +0200
X-Gm-Features: AQ5f1JraoRZHEAAKtM_6fInxqSPprmQzLJINm38dwVXdhnnYMeLTS5kKKnY-1Ok
Message-ID: <CAA8EJpqCUWH95Ew57K_HKmPGhf40G_2n09SWKTonvyUn2vE4oQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] phy: hdmi: Add color depth configuration
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031055_608359_2B5391D5 
X-CRM114-Status: GOOD (  16.94  )
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

On Sun, 9 Mar 2025 at 12:10, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Dmitry,
>
> On 3/9/25 11:16 AM, Dmitry Baryshkov wrote:
> > On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> >>
> >> Extend the HDMI configuration options to allow managing bits per color
> >> channel.  This is required by some PHY drivers such as
> >> rockchip-samsung-hdptx.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  include/linux/phy/phy-hdmi.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Just to confirm, are you passing TMDS char rate or pixel clock for
> > DeepColor (bpc > 8) modes?
>
> It's the TMDS char rate, but we still need the bpc info to program
> CMN_REG(0086) in PATCH 12.

Thanks for the confirmation.

-- 
With best wishes
Dmitry

