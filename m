Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C2CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BE3p8f/tb4AmnzEBEYSIcdIiv74xFJHBlZnCilZ3pE=; b=lUP/u3K0/ibJWbD8nPCLYH2htu
	qN219QoO32AAbGvDm6lcnOx1TkxawXQhhcYQqSoRwL6n6MHZN52p+LTtO8xNCsOjDkCiMgajBWUCS
	yKlGQBybkkjHnYNX22VadpbTyiCe2wke0esmpHYzKbJ+tPm+w7xQT8ik9gY27OnzxvBv8Ip0rxel1
	OvWG/Vzca4tvHxMKvfQ+lNwPVd7WLJ0HXBSc3dqb5QRcwEB9s1D+4RTGfQzme9z9r3Dx9husKxRHe
	EOFD/2fHUl7NPC8fKK0mvDe8njNOENFF2mpGjC/NXP4F+KZcKcDdFaGzM/V6g9JeRYKib7a2DksAk
	k0TUslSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVYT-00000002Kb1-0qIL;
	Wed, 22 Oct 2025 09:54:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVYL-00000002KY2-1JkB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:54:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso9552062a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761126883; x=1761731683; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/BE3p8f/tb4AmnzEBEYSIcdIiv74xFJHBlZnCilZ3pE=;
        b=V/XgdkPAnvgYnaRd+q/BnulTftZdgT6vr6dhBk4scmcvppP3ct5XABhjxde0wlJBTj
         0BDKeCbSMKg3cJe09k/Vs9J75uGM5Y3A1Sbb3cKqswF+s4kBs2SPiL8Xc3Lrji+QYS5g
         OPB+gRgr8ex9wkoCODcSEeqMWxxmf99JE1WBifr1d7idv2DbIbkPeLJ5Mw4jUYF18mqU
         wYKS4f7UqwQcaoM3uS4gu3x6ntsoIoUxXHtDUQg0OC8lbVuhYbBoHg0z9jKKi7ySgtXm
         5feEUvOGTziVcJe7EGJNJOR0qZ2iIE2GocZHH4uR9ZOYxTTAynffoqhCzRiTrM1rYoIq
         Jb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126883; x=1761731683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BE3p8f/tb4AmnzEBEYSIcdIiv74xFJHBlZnCilZ3pE=;
        b=lF4+0jC3yNiaxmLVW+tpCIjTNrGqFOCGtFNNQeHRaognX2Z15D38S99x4oN7tNigwg
         dzLCK+5OxvtxLG19BOCmJtTQA+skrilR1298Y3TtfzLyl490Es0n2Afkd1QvIiwTkIdT
         hv2EVPeEXvppq6YlnpJKWk1nXG3pLrKOe/Pxkhq4B2Qyl0L+Wd40k5D8QoUPz3Y/o/Ia
         hE4d+gR/Hmhm8VGL8QALcQJ8YiVcoRWJC+k/G6pMqnnE5DDmDg1FTi7H6SkhhBKLMoWX
         hYL3v4iXiTpHdvh67Xyqp7DcZ3bo6hh8YfFVdzus+OCo2ALp1fIabN4FPUCaPyHCgUyx
         MGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4fX2/yM4bm/lR3o7dhdTZPwpeKAX6l7fWZHFoaxC6QIn3FOi4PI2QcpDfFZUqG1qSDpTyIHrOlljfXDANNQBs@lists.infradead.org
X-Gm-Message-State: AOJu0YyGUTgeVofxZOmFKdyh70WG2eVLoYSvQsDwZvJiNXqHBRGcSluR
	FGTlJLTTeB/rOxU/ZJ+PfZsiA1mg/0RLlLp1IV3lxforSUgMMUSR+RxgdV/mCEsigmh7A8aFdTh
	RTP1mfpKIvquqCeyYEHNGsgQuIf2ioY6F2wfBSFXIAQ==
X-Gm-Gg: ASbGncsy3fswt7fHtqbnSr1yv4YWg2OdUxf2L/Mhb5so0AlqGaWdy9Xe3ZSFSrjPISF
	s/X+ijigz/8pp3Uh3Gr+hkMzhD4mlJNQCPSl6yGk+Vvqwq6KkWh74W12a8qO0FKUN8ySmJLmLEl
	50imKsSKoQFf+J2c1sVe8f6i8g8FKHHYMGWedtZgLlEcHm+bFtm2RuigGL4d3TqkuLXhlYYJBEo
	ZL0snREH2i7M0u29BHOyAz5IF5WpT66oTdpSewviZSJ02pT4oB3Z1p8A2NlupetCuiajlBi
X-Google-Smtp-Source: AGHT+IGxvyYJRi71ypaY/f+2tvs/h/Gx3CtsJRVjqydJdRQpedqCN+n+dBFxLmYoHUas/Vv3sBj08NYXtnVui6clXA8=
X-Received: by 2002:a05:6402:5212:b0:639:dbe7:37b6 with SMTP id
 4fb4d7f45d1cf-63c1f63081dmr20417683a12.3.1761126883450; Wed, 22 Oct 2025
 02:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251021222955.193323-1-heiko@sntech.de>
In-Reply-To: <20251021222955.193323-1-heiko@sntech.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 11:54:05 +0200
X-Gm-Features: AS18NWAUdMZHC3UmuDzl3MkQoA2Eup4bT1W9-ZX5g9xcPcRU8J3IcH9rg1TAlQY
Message-ID: <CAPDyKFpGC292uOpWh542_=yS2XP5tAUWiJhj6tp_CPVrZ5VKkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string
 for RK3506
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025445_508519_DAA264E6 
X-CRM114-Status: GOOD (  15.34  )
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

On Wed, 22 Oct 2025 at 00:30, Heiko Stuebner <heiko@sntech.de> wrote:
>
> The dw-mshc controller in the RK3506 is compatible to the one first found
> in the RK3288 SoC, so add the RK3506 to the variant list.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index bf273115235b..acb9fb9a92cd 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3328-dw-mshc
>                - rockchip,rk3368-dw-mshc
>                - rockchip,rk3399-dw-mshc
> +              - rockchip,rk3506-dw-mshc
>                - rockchip,rk3528-dw-mshc
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
> --
> 2.47.2
>

