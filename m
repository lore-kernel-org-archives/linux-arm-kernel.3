Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F3C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=; b=Y0v4znS2HyVxcGgonEOG/HDXwn
	IuU1aIKdSiTLviCXecW+GaIW9Yuz1TOlzTiSwR5d4DnrBcFEEtd4Ca7zjSwwX+hRYEEJ/3b8GvFHM
	VV5xsKR9jeYsNataJyZsXajQ2A18uXi1Rypb2eOA4IxFe29QLGcKnFYrRMval2j0VSPOHCaR0bTQD
	lYxtfmd/NgPt6rlKUPyGlRpS6kGdeIOBBlkjph2u+oxOjjiWRx4OvRxFGtlcYYdic8/hSuI43yp22
	0ZCCxos05JHLqgp85HBVJDtMyr9llRrGorAIWWp/6raFw93BWWDnhYbSe1LdUmeSOPGLoGapKcpds
	7XoqE7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkeV-00000002dMt-1Ruw;
	Fri, 17 Jul 2026 15:39:03 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkeR-00000002dLd-0BBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:39:02 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51c2b2c9eccso60601741cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784302738; cv=none;
        d=google.com; s=arc-20260327;
        b=VEZyvCVS/vsRqmeXqZOsXEyRCTvwIRsP2lNZ2+ipPeyxpoRYm6O37+cyggbY5Htq6z
         n0q3W+5wqCcs8RLBo+xmwcjnVKSNmR7R9PWZxZxu39Z08a8Rt+hAoxG/BcXfSyyG5W5+
         dL2/Mx6RQZZ4fOPeOT/y32EaHl4NerTlUfa+BT9/yDLXu7jBWZDhOL4l7DXitL8txLQG
         AUnV/kbsg3EN9T+VW6luUMhjbD9Q8zrKJT/OiT7tVrtDDmeLOLdT8QlYcaVnZjSIqXxJ
         uoT/F7JBrGQROak74fnuZOQ3axlLlpsy4e2rwYo3JtNjjyhjLXEwHNvvDz9TQGxWI6rM
         6Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        fh=cF06KnqmTK+3ich908w7FrFKhb0/aHS0gstvH/2FXSA=;
        b=nfXXYkh0CR4kbrZZrITaRIxmoD39pCrf3Cglr2bTpDH3BunDDFxQeq9mjiuAFXtxNK
         aXIg7GxlGxrKg5IXapb4XKIb5b1XbDzJEfAXKzKgEmwzHlOOJvuCNrhUkPkniGAMR1Z7
         ZN9O+M/BdJOjxU06q3JXjouhs7Y+9iRw2972clquyKLHmqegh4uv8Ie/x+PgPCn9RrEe
         AVPRG/KmUUNjLhZ8H4bXCd2zsN4uf6JTEzv7/t5LQCJS8ga00qcoR5xHWRRK98JU02Sk
         I/6Staxj2MRzYvgAgr9QSsLu3yJYs/UG3FKAIUtA28sewwnuvO7Tio3b+lMagwvjkVi8
         uVRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784302738; x=1784907538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=PXfrhIZcDwH7pnQmrPtxkirX9hwDK5g15BLHv42c1iGJbPWACVlr47q7oAS5ipGwMA
         5UA6+gJJCV7AaSEik44ATc4Ia3aBzHYkxe8Zpw9VK2DkzxUOBBPSOKIj9hERN6znWwU4
         mhmLnjYCPMAMG5y2qSdEtHbPH7mMFpYcWsGnwZIH8Xtv0Q+wja9OTchLkGU9El8TxON/
         aHgTc0cx+HwzdRLagBt7uHR2s9PNrsG+pO7Mq62ntD0GrMr1cy6ctyHlVE2OLwmFOSdO
         u7dV9DhBTvs0sug9H2O7fIFUhzyD+4/9Lsg5j8PRm72KYiobyRVqqFDI01CjoTiqyvi3
         jP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302738; x=1784907538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=buYbg2u0Othe6amwkfBMkAaGRAPX8hbyjdFV4qiAIBbUcBosqXN5CKPHWFlLKxVeDB
         3T5bGguPM5j3nOWl4oYHOI0HVvI6w1D+3pkd8G6f02NIFUCfe/IyyF0YQXGWPQq8tr9B
         3oxsLwlJ0Kk2IC1qdKA+UAiVAukt2QEjFZQF+jIXyRso9EdTBS+zfy8naDX7oIQri5H7
         jIqBkZ52UAuOKRQR3ZyC0bIsiLGbESU67S+z51FA69LjkAGhrAxedicHqoojJaU9ohnR
         bkoPxkS6fnX7H+K/0sYEIZCRjF3+UhDBKvqQ6eMTK2aE/PHcCeGnPUkMoO5j8nhlSA4j
         3nvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBJATOqp/8o+2hSPAmntch8LiyHqt5vn2zUZnhNdphy5fWLF8ilJ8R2XL57TNohZ3rV5Nh8YBurd5x6NBtoENV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm9sS/hk9ZQyqTSjSWD1dj2c8UC4Gk0ueAdzWIVGVgw+P3zGp4
	4F7vnlnS1ZYb6BADoIhXYd3naWpBWF0Oje/VuqE960tzyTn3BvMRyuIyKJqnF94uRJzx1EtdZoM
	PKgsOlVADdudcX3N8BXj2u+wDWndPOA0=
X-Gm-Gg: AfdE7cn9gtbIWmKgdZ45ef3+ySeSuvkPKvl7QKRROOyn5du5gmmZPQkG9nRRNfBtlZR
	fH7vAYr2SzaadLLM/1MuT9+F+QD3DAWw91qkO30LXbkoJK3wrTMw1Pp4k4JyOiRwoA1rCrYktUM
	eUrZ0LIrtP3J9IWwI6QDWWd1RFuToHD7H179unE2fRdvRBQ5+idETuKQe2BZAMQ2j6RcTPfOVwR
	3w0exoXK9xp6VvUajAi8aUtuGUD4JnSJg7mapsiJMGyo/GnjpxGuycJKNPeGfI0RL6Vaypq6DUT
	8Frp
X-Received: by 2002:a05:622a:5d1:b0:51c:bfd:772b with SMTP id
 d75a77b69052e-5213ea80af2mr28037441cf.65.1784302737601; Fri, 17 Jul 2026
 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sat, 18 Jul 2026 00:38:46 +0900
X-Gm-Features: AUfX_mwBl3dquzxsUOjYfNF9eon0dxcQ4kYle5GNTVWYorRVVQ4G71Eq6B_eMk4
Message-ID: <CAKr_iV76upuWauE-ad7ds5W+jA_aSCkCGsG4oKqC8KNQBG=JGg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_083859_108711_8FC8C87C 
X-CRM114-Status: GOOD (  11.29  )
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

On Fri, Jul 17, 2026 at 1:19=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> This series adds TOPRGU reset controller support to the MT6589 watchdog
> and removes the use of "mediatek,mt6589-wdt" as the fallback compatible
> from many other MediaTek SoCs.
>
> Many SoCs have been using "mediatek,mt6589-wdt" as the fallback.
> However, they are not compatible with the MT6589's reset register.
>
> To add reset support to MT6589 wdt and resolve this problem safely,
> the series proceeds step by step:

Better patch series is available
Link: https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scor=
cia@gmail.com/T/#t

I'm withdrawing this series.

Best regards,
Akari

