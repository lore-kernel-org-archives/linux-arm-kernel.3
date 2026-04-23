Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C6DFDEE51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=; b=i22v4uxNH/DYEiVkVtPtvQwkSO
	J1041WrObv8ZpiZ05Auq/RUU63BqDevsHD/SodwdQZ43+awfQ0Es4u6E6gO+/9DFaywFuEwA7Zfk3
	rsuWuJ3GFBI9dohXoOxexT4iE2UxgEcLDbqqYIXtYKjsYq2QktClG8sJkYSyM6HR23GDdsVbLOxkF
	uhnFPYrsJ/mogEqq2nsUMZg28lDM2fi5sO4n+hdm7VhPF6FDSXbgWaxYl19m5W1yS2xFwG6RIivmQ
	62bahv95UaeJ1zeA2+D9xMzTsDijSEkvSIjz/Poe7KjQ7rfpllA0PHLBqGlXdiRzpF+bvnpC0/tas
	AjnY9gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG221-0000000CMTd-2NkH;
	Thu, 23 Apr 2026 21:56:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG21z-0000000CMTJ-3HLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:56:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b9c745e18a0so1212701566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776981377; x=1777586177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=iiGMVD72wYMYCyWWa41jp/WwfaqpKwKc3Gaja/iDk+KmffiiqNZ+5INMevCweCdmkY
         oWNZG5cqnlR4k8VB2ewSJ1EaHDNWtVY/La/0kI7f5ekMjFH+v49v/WF/+RuekOnHkiyw
         GkQtQaSN28owFLuv6QPrp0Z7ipuTEU2O/GyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776981377; x=1777586177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=VgZdHAfg9pt0Po3ZGEPUNDHSF18ALovi+x6n//QfgsUgYY3IAhafulc599tuqESfEG
         j2RUdYNTpBx9AZqEnOZLrT2H2A36v17up/IHNQp6dML7NOoaUJ9FwYyQTx0QFZQmVoO+
         d0s/2+BYPq6TPFczNd5ubdoI7qZf65w2DwJTxXwp7ea3SWIZrzpN3KlNzO/BA9uowuuo
         v/Q4aT5iAKWKkqBZ6zlhTzXGLIEdwSQXqrL0d7OuvjaAtiF82nDDyLaBev4OwopmRTtE
         Pjx3kwP6g7nQTmEhEQX7fzMCk6DR+ThBYIvSuVpG4lUECAWzVgBzHu90B1zyAWiEHvcD
         5HCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Xp4HXBbCCVCnB6z5SFmnvmjejIFR3vh2z8X309dXuQfqnru53owI6Nr6/FAIks/vvo/kyXtqdheucXmYaGkjx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1us1OOelilUlz8w+58R21BZumW73+YkHgGn2xacOQSWd/qFMr
	stzH3aeD+OBSRZzzhBGuhWTSHHM1lludMzkSz5KP+T8lhrz+rKcMbKwSBJSSZp1+J8GWi781hlL
	yEFJIs4zh
X-Gm-Gg: AeBDiesYw5ACmFHRh4wV2efMTKf3VvkHSRBK2JWUBtfP4LG/ZKEp3IAcmOs22v1GN2p
	qOznBsIOTZPF2+E+8xeTtUijE/TS5BNLJUJkaMtZEsSTj+mLPCDmGYK0zWsipm2unqLpkQmHd/J
	XD+jRXQOp8lms2HB35yMKUz77LwNSyA7uYSBMlhzz2mKPOZmCDOAQhTfIIQBoc+Fml8JV8VI2Jn
	jDawsnzcUJhmkeyvdSw0ctzvd/ZcIHx6rOOqYA2YHAYYXGdoc7WiRtcKav9YgqCtB5EquZGkoQ8
	Do+GCTDbreGTS+5pjgo7+Aa3FGfP5pktKAk84aumLD5rbltynH0g62ePMTnmXGzl3adSpeqlXbP
	Fuf7Q6PufRIEFDY9G4DnALGOXf1SdZJqoWq7tEafPgMPky5Bfxq+tltF89w0VUjKWGEQKBIx572
	QhIp5OO7+lffDnpeFxSnmcD5qQV/4lixeUIt7t78kpamJWNg9YgN0qYEp03i9IzPevyHjjd1OM
X-Received: by 2002:a17:907:94c9:b0:b9b:171e:bae9 with SMTP id a640c23a62f3a-ba4236b069fmr1467785166b.24.1776981376679;
        Thu, 23 Apr 2026 14:56:16 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm692029966b.33.2026.04.23.14.56.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:56:16 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6764e36dc88so6824260a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 14:56:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OtPHsJ+f5AVX/M2A1Xnjk+slfVFGSV8/sozijS/2rg489VHCxlT9oNz3MjGd1OcqQV4j6rhhP0yakgDgP7mP9@lists.infradead.org
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr43673395f8f.11.1776981004287; Thu, 23 Apr 2026
 14:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space> <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Apr 2026 14:49:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Gm-Features: AQROBzBZ12eQ8JPtoHklunZA7baGhpheKR11CnReOtZ62TdnznxZp2PUusIRrN4
Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002 panel
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_145619_894250_B8FC0F6D 
X-CRM114-Status: GOOD (  15.14  )
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

Hi,

On Thu, Apr 23, 2026 at 2:15=E2=80=AFPM Lukas Timmermann <linux@timmermann.=
space> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> Samsung Manta (Google Nexus 10).
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Adding new panels like this is discouraged these days. Is there a
reason you can't use the generic "edp-panel" compatible? I know that
the exynos5 driver is pretty old, but a quick glance shows that it's
based on the same analogix-dp core that "rockchip,analogix-dp" is, and
that seems to have support for aux-bus...

-Doug

