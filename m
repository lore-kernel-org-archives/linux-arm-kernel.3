Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E121BCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XT8NMgj5vRzLdW9q9oYiImrawQNd8w2bYyEW9YcOx4=; b=xbLJPlPDH0ORY1x4no/e8VBmLN
	0YHfwV40zN5tR7Y8fpJd9py7OoW9g7nwh/n4gcQCEvV7QeaAFgbvWyAecI/S6XKugPFwDDLl7IcLI
	T/vj6KRVTocugoRx1I8CraNVynJtn2MgZUFByT1ZFhgyp1sCrexgGk2xQ1+UKpBsvqBtvaSDQrDWW
	7+l5Jn3ck+997wX/qbtyQQnFLc2+aqC0khsDY9bP/dipZDOmNiXzv63Itx6I45tWuVkBNQeYDnVTb
	LDZ3O6disEF5E54kX4o8BbcUgzdT4rer7G4EqRrnwkbi0I0d1op7sBAUldskt3QUMrUe1vOC0mEh1
	GO0aZ6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcCK-00000001fDN-3X9d;
	Thu, 11 Sep 2025 07:58:28 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcCI-00000001fAx-3DTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:58:28 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5369bb49213so750495137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577505; x=1758182305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XT8NMgj5vRzLdW9q9oYiImrawQNd8w2bYyEW9YcOx4=;
        b=r9aIRCIrJDs5dNw7GSqqk85IbvMN74q43JM7flAOCc9qJWKaVjRIIUwoin0g+6PnyA
         ys4rQ69/Vs/SEPsqhop82Ftar4v4za0fuqIX4sqcoIrqkkX4IkQ6mEVsQol7lbAwcMJB
         74zalWoSgANZBQBZCiAI9gY3tiwXuwa5zKzPJaJkdvMFVgJ+4m7ZVDaqntkr6oWN34ku
         fCZ3qR8uji/h6Em3j2Pg3YNG5cgovM8R1Xdll6PZFTST/3klTG7/ErFzG6OEzegQgVMW
         l12CK3pdCcxJXtd3H8gImhO72FTzS06GJrgYhytrXHFaRfAAIuDENyvG6EZOayyoP131
         7q+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWm4lOMYVq06TCoG2LS5AfnF+jXsxTKTG6G7eCcy57XsILbntZuRC/0heLOARb7wr1rKycXs6ztE7Sa/GYE/M/D@lists.infradead.org
X-Gm-Message-State: AOJu0YyQbm8BDHRxuO7F25RtXUzrcjhS3bXHk6x/MMePYSyf8EPoVvPw
	E6OiSULsj94Nz4LU6UMY5ou6QGiiS+XdV7KQ+PJbIFhVzR+C5ELihi45/hU3XEgU
X-Gm-Gg: ASbGncuGLg/wA6ht85Rse2Nns8eP8V4cZGmmsKLQOSKSkRmOBb7FbS0tZm1wEpd3m1j
	A0/g7tMRU2bwIjKp0b2/7VRU6gXJTXke25g/7N4Vm9AJC8dB1aY0tXVlilUR6l3PLJwn3McwehP
	d0Nx8A0sqtekdcOATFbwTbwmzM5SBY+pTdQCa5j1Se7byGmDrEOxumDsHxvftD0GNIsjfAFHyxF
	TdST2529seOSd7gC2EqsuTcpkfrzk0nW6lOw6xfw9deWzmn4CchrWm5unviTNjz1OFBU6msacM3
	AT7xkh1FR9bU8dDXa8TxGup/bbjWcoWm7HGjd1l02UiikieSpIjgpAdqk1TbSiXqRoaisS2zwSL
	lA4Rw/BrhxhMTKIWxD7kg9HcY6YphKHPCMA1eIZpZn3PFSm9+daCFYjUnl9aJ
X-Google-Smtp-Source: AGHT+IE4TajWrPn7UgYNeZPNU9og+yAX7O0N7wUfDvLa60ebnhBhN8on9IWJqJ6JK/FdvBJyU0N6OA==
X-Received: by 2002:a05:6102:511e:b0:4e7:866c:5cd9 with SMTP id ada2fe7eead31-55208a61891mr838265137.11.1757577505494;
        Thu, 11 Sep 2025 00:58:25 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55376bcda7asm202592137.18.2025.09.11.00.58.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:58:24 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8900fcc0330so1030321241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ9LCUha8A3byppG27TKrkp+ZTexWrZTmE7xhz3+W3EHQYVhtrs1MnCq+3mxznCkKxV0AsEUzD6eZnDpneK3DU@lists.infradead.org
X-Received: by 2002:a05:6102:292c:b0:528:9956:6a3d with SMTP id
 ada2fe7eead31-5520c29c86amr932343137.12.1757577504247; Thu, 11 Sep 2025
 00:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <20250909111130.132976-6-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-6-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:58:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ3D4DC4ukir-mon7_2unNpE_h9uw84yAdoZ6YmeFxWw@mail.gmail.com>
X-Gm-Features: AS18NWD_t2plr89Vw2try1XwdiXtIzwJE15Ly8pSYFY5EGZZA-yJFymvbXisIAY
Message-ID: <CAMuHMdXJ3D4DC4ukir-mon7_2unNpE_h9uw84yAdoZ6YmeFxWw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pmdomain: renesas: rmobile-sysc: Don't keep unused PM
 domains powered-on
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005826_825498_518E5A26 
X-CRM114-Status: GOOD (  22.68  )
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

On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> The recent changes to genpd makes a genpd OF provider that is powered-on at
> initialization to stay powered-on, until the ->sync_state() callback is
> invoked for it.
>
> This may not happen at all, if we wait for a consumer device to be probed,
> leading to wasting energy. There are ways to enforce the ->sync_state()
> callback to be invoked, through sysfs or via the probe-defer-timeout, but
> none of them in its current form are a good fit for rmobile-sysc PM
> domains.
>
> Let's therefore opt-out from this behaviour of genpd for now, by using the
> GENPD_FLAG_NO_STAY_ON.
>
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
On SH-Mobile AG5 (kzm9g) and R-Mobile A1 (armadillo).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

