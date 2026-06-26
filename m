Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E57CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=; b=sffz/CVe/Dcbmcle5l0d8x9iVs
	TqM8lONoGuZb9Evk+54/ZklpfskQotBQXRw8eKTrZBk7i4ILaGPX9oYfMRWXfUbgClRONPlhbHapk
	cyd6GI4FoTx/eKUoRiitSbWJ8ybJaFHBZLTdfqGjJtLMoTv1cpJAHdj117GfXQtROEa/4qy6Ty4M7
	piTdJ9RcK7mivl95VIQ0JMNRbooJt8SwBOL5QI3P/taONvC7ZYHSlCKU6NH/EphMuFVXCpyrRXo/f
	MD0bqcqB2Gdjs6DeHQVzDuLwIa4m07nuEUm0EG8lJnsi2XgpLPewn5Uh1x/vSHuR8DUG0F7BzloM7
	/5Fahqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5nX-0000000BJat-08XX;
	Fri, 26 Jun 2026 12:36:43 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5nV-0000000BJaX-07uS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:36:42 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-486852c7b68so572265b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 05:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477399; x=1783082199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=dH8Sw6ZEX1HUBw9l2kQ2XEwzig1TNjL7Lk5kg2dXxHdh5UAodkp9PdF5V3o5Fq0kBR
         ZpXh4cEH4IdT9ALs8UoAsVqL5VoH8jHg5mCzN0Fo/cjd0QNSRP1HVq0BDsSPxkg7XyaI
         Tt0XlG9dsVoaoJFbwo/VzmapSkz5T8NUK/lbsgeeSChw9OcDu2DrWB/xV3Ca0abZ/pIF
         AGQTxy60hblnkg56QzFR8KtCzymoHihODuFownqpwcNW79wDBEo82r++Ddsj9Xo8v7p9
         XVaXfISoabebwEFtj+bDKLquNWB10iRqAG3f5ipnC2/b3d5Ca3JEeqQRJS5xjr+y97H0
         rKFA==
X-Forwarded-Encrypted: i=1; AFNElJ+Lcds5w0RSH/LE7qRqTLHA+rI293C/24O+W0RnjJfEmWSXuGYxAUJ/eOspjCh5GG8snKzc+nPDj/qEGNv+EJgK@lists.infradead.org
X-Gm-Message-State: AOJu0YwQk86c7r15bier3+qpYzdN/pKVZX4RH9f0XV7tTRBKorIz3Yq2
	yI6P/US28fUf3fYldR8M/mUIVMDsDLEXqKlECzaWkymmfLn0ov1Qxz/BVx63qzBY
X-Gm-Gg: AfdE7clfik69NgQaX9OpMPd62l8g7KfNabzROPlJ8YyPcZejcyNva2zxRWdKksMwDxP
	ZWZM1trOlo5IrGE/CkeHXctPTl1U7J8H4jk3TpRSgeXWmXS1uVj+ikqhHhJF9+cClGRxGAyizEF
	wVNxOoxACQN7Qp/5PTEge7ntriqCpp2RP9rUa+q/3lTX475ewF0dy6A5kd9Il6A5eO3yPR5AhkB
	PgHtxtqtu8CKqvsV3g9FhQk8ZhT2mUSfMnYUc3m1MFtnJfwFkHea0J1PIgfvHgBFzjJA7pVC0Li
	g9bxCUfVt7loSsPucQRg/PPJq4x+/tjdwc0506SpEBzXrIZTb/tM7Qqeliuv/tvbK8vOJiCsRUk
	EpH7J50qjR3uhXDk2b92vPt84dbs9OIzucovTnEK9bMZ/xPDRbIPR4xv3EWrmxaPTS2/rtdOo8p
	bOAcLDDOfV0eYbCPS2fMBKFsARC6q1PpagQtjDu+bJeF6zpnNgjw==
X-Received: by 2002:a05:6808:1806:b0:493:3b1b:f121 with SMTP id 5614622812f47-4933b1bf279mr2652335b6e.7.1782477399631;
        Fri, 26 Jun 2026 05:36:39 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49352505004sm1299738b6e.2.2026.06.26.05.36.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:36:39 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6d991991dso679420a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 05:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ig+V2WI23qvWzurFySXDx6cmSFAPkTjTBIwN1HxQQcTsBHuL53FKbCQ+JZTaYbQ3uyHo3+OxxhU4nd8hLEfok@lists.infradead.org
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_053641_091433_BFB2BC29 
X-CRM114-Status: GOOD (  19.10  )
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

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

