Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NJ/3l/9PI4oWXepQOlqsgt9YAjfDzU4Qje7tYA2ecQ=; b=j7KQUfravEvqceRwuZX0oI9wFF
	yNc82/vXXgZn8kIsrJw+Ny/d9gZ+MJ/L9ucBwBlDurVCHWTVVMcE9eseMaGMqEusGgQCbFvwGCep9
	ep23yZd/NA+4t//uXDvIFtaFS0kviktwK/57TtUlC5zmBBtyl0dVUZnKG8oq6Hql7+dFVIo7pih3/
	/WRazW0GrIk8E+3NVYHrqjcZ8mKHLhWylDmGBIhCEskYZqMi80wAVtyPdMwznSFyDot4zPMwYAMY5
	DLsCq9yh+P2bcJ4OKTKxtrYPs+0suZZjM9xPxgY8nZWuYiBS1UjSkt4MYx3sZfQW3K8H1o5o5SUsE
	4+5GoIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFrF-0000000FcQP-38UI;
	Fri, 10 Jan 2025 14:19:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFox-0000000Fc3o-47Dy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 14:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/NJ/3l/9PI4oWXepQOlqsgt9YAjfDzU4Qje7tYA2ecQ=; b=Jkpb0D0USGGtMOypccNXIs9h0h
	840JrJeO75WxRDHhOzpekohmOusMVEvYivYwDsFuo3b2z99xwinGBvB0HG0J3Z3O5XEzMTTFnv7Dr
	Ih4XvWdLUJ/Z6AZrlu3RsLRJxYJ6Mu8mNfLp9QK/39+d6fU8zK0UZy69iJnUzof5je9CRpxG7XoOF
	nRXcoVnHq+w/0FRzjl538ijgNzNC6nBS++4J+1WVvO470DUWukWLurTWQ3QF9bWEu7lQNTZD5l1kT
	g9zpo70FfKTuga2sTs0Kfs3FhpoP39KuWhcMWF+WBd9gs1h64rNjETqp4o8x8sZ7QqlYOIPDHMdaS
	Aqq5FIDg==;
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFov-00000009nZG-0NiN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:17:06 +0000
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso17409346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 06:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518621; x=1737123421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NJ/3l/9PI4oWXepQOlqsgt9YAjfDzU4Qje7tYA2ecQ=;
        b=S6zt6dWzfyDDGQdu6Ht+v/5jpsPOFQHEJXOEMWyX5YxhVxpfb0bb6YaHw6ZdLYFVC5
         Dh6b+aPWAtFCNuZLQEFGhM+hNTi0WeDjVnNnaKLTBYtYnWGvoPXRaa+UgLnZBYZ5LdIH
         xZohOfEVYZvHa3a1/TRaMvqE4peZitGLUXvq4YDm4SUQLn1XeWCJ33Nyk8qFT0j7ZNyX
         E8CWjz+TuPJvDSvndLxtos1+AZiiU1eAOkqLHS+1sVZDXlDYBYugc4oHRXp67+ElzE8I
         1DQhATtJ0eP++6XttmoACSOjsjzy1THf7SnPn57+GXadk6B6o1BaKCdaVGamA4oy0FrN
         vmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7R06ICcisk3ZI88/4zAlfXHsLwAcHHOKZJrGwLv7NyGVSeDuPpl9G0ydxZ/PaTutwIW+xcuOrmbJlykmxYEMk@lists.infradead.org
X-Gm-Message-State: AOJu0YwaP15JwSeW60kql0fJejMtDvrDACYJxrCAHlixOLRNLa5Sdtbd
	tLUld35ZMRHUCZTfTCgO7hvCYpt/041l+Nvl7hIHdA5wxOe3izXOGT0mzq2Z
X-Gm-Gg: ASbGncuV1wZvdt7uaq8lV326H1QVkXhNC/bANrzsAu3rbNr3TvFxP0OpeFtvvoT3T7n
	H3shTttFY6C1kmpJbsoblvqSdXYMJuJiSvpEeSgyheEZvzCRBnoFvo94ZNxqpCkd2IM69Bgx0Pe
	8aj/8poBwea+8UDfzaKzH7nBMP2I65l7fWc5Dzyu1Rnjhk/oup7ZHckwaRt+0m8dwyBHAlbXHwK
	XwGYqRPtwmYb4SAKzGasOyt1gsb5OI5wlDx9sperrpSIduuNEu87Oo/6LgyVhMmLI4o0qP5vQ0+
	0lwZ5TqNeYwR2AJOnsSYSP4=
X-Google-Smtp-Source: AGHT+IGYLy3wZWuKNeldB22E5/84RepKQRIA0KuT14irpMduYt80SD9iPuNFCZehp96P/TEGSa/C0g==
X-Received: by 2002:a05:6214:48d:b0:6dd:5f90:16bd with SMTP id 6a1803df08f44-6df9b2ea6ddmr156915286d6.41.1736518620701;
        Fri, 10 Jan 2025 06:17:00 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873de559sm9528801cf.78.2025.01.10.06.16.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 06:16:59 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6e8fe401eso173273585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 06:16:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa28PBBBgT71fAhMi2dcOm2ze9cc45uzoto9tz0xeVojCVUCDMDcHo6ggbJD/v9yCwiWpqU5P3nsuEzh9dWZIT@lists.infradead.org
X-Received: by 2002:a05:620a:2a08:b0:7b7:5d6:3976 with SMTP id
 af79cd13be357-7bcd97d6489mr1484170685a.58.1736518619196; Fri, 10 Jan 2025
 06:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com> <20250103163805.1775705-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103163805.1775705-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 15:16:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1y7szsqRqE3iCGOV2gWX2Vq37KheZZbk+cEkwXgV6+Q@mail.gmail.com>
X-Gm-Features: AbW1kvbRaFn4g_AO_oKMfA_tFxNUhSMjIGVqHRYJogvxNkj5hs0eIT7UrCBBWSw
Message-ID: <CAMuHMdX1y7szsqRqE3iCGOV2gWX2Vq37KheZZbk+cEkwXgV6+Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r9a08g045: Add clocks, resets and power
 domain support for the TSU IP
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_141705_272842_FC0E07E3 
X-CRM114-Status: GOOD (  14.85  )
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

On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add clocks, resets and power domains for the TSU IP available on the
> Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

