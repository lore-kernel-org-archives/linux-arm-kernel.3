Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D032CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=; b=X8eusPiK9mDVBOPmFgk/pkgZH1
	O2+jM7vGUSyfuZmRQcKdmnRuuOoS7QvSAjN/QXqYIyc/fP44rjjvYld8LJxAqIYXWYTDOYFhmF/Dq
	Fz6JvlNAFkaH9+3FssnA0pTpjxDoZOn9H84ZsO+R5VNQLFf8fmv9URlyk9njibsCdNoxreBYdEjqN
	ebKVItuCA3xZrQLoj/2+ro8tgwPgJkf58TjShhTypQcbi+t4o/1KqrF58+IHXi7meeIzj3+2eJ1hP
	OxUTxgemqsNAyKA3KaWlY1aoQh6PeBtTgOWxJs+aVuzoDh3+xwlvhGECPAhF/64ykiqtPpgiq2k4x
	ZuU7NZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNuD-0000000Ggd5-2KIA;
	Fri, 05 Sep 2025 04:18:33 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNpl-0000000GfTt-3W5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:13:58 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-336e16f4729so12794371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 21:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045636; x=1757650436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=eJCz4krF8stjNCtsi22j69ASVVMg2qkCNxeBohdPMdJgznwxFb+7950NhMDph6MRK3
         TQIq7CsCKvPc/y/QAKWe1N9HWQkCHrR2uDnbgpAW/EoTa4jodpycHrO+Hpiubmk0DcT+
         2GeCgV7RkYQ+qLkvXXL9EeQwnjUDQPbun9q60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045636; x=1757650436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=wTcW5A8niRJFBg018tMINSIZZYVWBDrnPHvCLwc2wAdnyxEV7AuKoToCfk6mssqp0T
         54EFSb3TWmQ2Xo8o+4AMo2V7p2+X79jxwxFuV3G6PF3NASq71yCvs8+bcdXCnvHtfUJo
         NrImMcYcx625OSZhdrCKBGmcY21b+tjdJ+qa7ug3ccFI572iSbsfduo6wlfPLUQQK+ol
         cZwVqQVn9W8G3ANmub8iAlEL1W7SD3Jct5OIj7EeZ27T2U2XEMVvjcxgaafcC6+eqSQW
         UTPT7nbaIvJAhnbzBsHKN+3D7+IolR7MxrufJNpjQ1JUm50fkJxPm3i3W8PYhnhtteYt
         sXqg==
X-Forwarded-Encrypted: i=1; AJvYcCVo9W9Tf4837B8An/x80JEkRY9rt+Y6H8dNM4PZrFn1CrO4AQdcTVqEfL99PAFDwsc8Rv0a9ZY5koMSiXwq5lpA@lists.infradead.org
X-Gm-Message-State: AOJu0YzgKFFzY2JYrwcyWscQDZhiXwPVXYnhIHQ89wfPuXusel1JVBSb
	tKkhviQXdsNoJKoXfDCUNEyXPVN4Xz8pW/HqPaUf5cXosKK4DW64tg9fTn5SI3hOy8cHWyVlcbu
	5PMfF+xv8N9CxemrRufrM/1YrUAE4a7FhZEcpj/5v
X-Gm-Gg: ASbGncsA/vCqGk17IblEZ+wH5GCpJh67zyzoQQEGPrvRYSeqW2YpCXGE/ikRNi6qUWZ
	INlKlKuErvuP2Ez6lDv9sgJ/GgnR6YbJld8rKGEic1nt/oAFWEd8tkkv7rsJLry/hwayBh/I/J6
	NKv8VwrzXF08R6LbYdjluRvJ6325dj6cq69tO3jcN4wETItzfsJkaCgjLVaZb028z9yJKpJNtc8
	WvuOCnh2ra71D5ANY3+pmN2Se1nUVhCufhnwhya6oedoX02
X-Google-Smtp-Source: AGHT+IEa0TMIVMFiRNiOTeyQqmllYD/2S0wrm6EQ9v6TWvwu76YIEfNVYAC1dteqcnsTmIHsn61yA6m1gNmuAQeVk3M=
X-Received: by 2002:a05:651c:2129:b0:336:51d4:16b3 with SMTP id
 38308e7fff4ca-336caa4a818mr59122681fa.10.1757045636072; Thu, 04 Sep 2025
 21:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-7-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:13:44 +0800
X-Gm-Features: Ac12FXztQWtNoog-vK5ygrU2ksjNm_shuXo3XvVwDmyxsQtnU3LNJR6VMH81zew
Message-ID: <CAGXv+5HjikmVaK_++METYBvTciQt1OTm77TU_e4Zh52MpCZ8bw@mail.gmail.com>
Subject: Re: [PATCH v5 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_211357_874979_35EB14BB 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
> it in struct mtk_clk_gate. This allows reuse of the static gate data
> (including HW voter register offsets) without adding extra function
> arguments, and removes redundant duplication in the runtime data struct.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

