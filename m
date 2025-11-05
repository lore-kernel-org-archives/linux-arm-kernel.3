Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EEACCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=; b=TG+ancTUoQMCkvlh1t3xu5ERiP
	fURvlgKkyYCcb52Y1amI+p63L5IUT8eNFbEes5In1sAR0XSgDLMBCibnUw86llIJCN3oHNSlbmYOr
	lNIhQ8AdvJVyykGuRgn69WF3UEzBeAlwFVlYA8jG7Xxg5kxjAuapMQ+8B5sjUgMvLxGISN5XD+OEs
	dcUkUBmDxJK5ByVQVVi4XuqqHLe0/z+5k5jiouGri17QdMHd05OTEeNqdyXFORac5p3ooGR1PWJ6m
	893XHVumbSfXHFHPgNKc9jsJPBIu66ZBUjJn/9RrTyBADCUD9C0gZcfhla94pC48dPo+1rwKw6569
	4/sLfGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZtr-0000000DOLk-14vn;
	Wed, 05 Nov 2025 09:33:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZto-0000000DOLD-2c7O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:33:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3889143b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762335232; x=1762940032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=Wtn0mB/NYbtDz2G72d7Fv7RJoFBab+j9S6g8votSoMtxjXE1aQeAdPsnVTDzdnFFWV
         WB8ZBX6MmCy+6IDYlqgDhDtN3wTxJrLSbuqGn6ZO51FpbQHgn8NyTFO7QbcBuAGfqTEU
         iMtTWeIkBGsAnwN9/76DO0qlEfDaOEoAt0vQx9xLJnUrKDkUp5IGXHxa7KGSIFh2MoId
         Kh/UxIBINvOBAL3pXL+OqZvcfaoeFaP6iOUF04t+cb9zDwt9fHtdYg6U9Xr1TQrBPJcy
         TficvRyC7e9xyPJttsechQ1LoEmxagMXFTEeX5wLLTOs+uAYPzOnVpcZAhTS2to13P2G
         JQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762335232; x=1762940032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=fvuZ1+ELc/q9FwN1gifz8vtwxkRoQeAxMFd+5IjV4iHR7fVen+uJOiUAxCbMNmajmK
         WC4OsZzeHqDKRk/Pu0dEKmW4UJLZ0dshd9iIhyyE7SNizPD2qKHuo3HR3DBYIX62/0t7
         n7z8V8R9IN4Ydq2Sy3sunVGkDndgnTnnew2+6j9MD4H3ZbCezAbHhUqb4bkqcsYE7ki4
         OPKhm3K9oSEyh3kOx6lxXVGMXfvPbaYVawkWGInF0mdQdXMzsw90iMM4RHFXcc1HlVPH
         MwduWdL4wHA3TVyjD20BSRlFHKG+u8W6nLGvqtNLUmlVSSUJ0bHkPH+XqIMbMAQ2yT8D
         qcvA==
X-Forwarded-Encrypted: i=1; AJvYcCXfFbg3ksr338nADInU6WBpP5pbtq9A2iwYbWLfrXK3InWHoMrNgl96qAAGBj2Dbe/NHFI+cr86chxrMa221a0x@lists.infradead.org
X-Gm-Message-State: AOJu0YzWAibjvTGWKpKfDBMO86gckqFr5GFxXFrDiuj2T4ocevvvhGjb
	peBF5wQm0F5lTfmZYQbUyKOtYYr4uQcsh4W6ob5Y3ItMJXe1Mj86kvwmZm9zEYpWBecHOZum3sl
	Yrf8kdHiYONDVmD3qCAkxvCyAQ9MJvQE=
X-Gm-Gg: ASbGncusJzZkt7W+cZfYts692QZT2/qQ6QCmij7VOsvG9RQOm4Q2v68BDBPnUSWRNKv
	k4w+2AdJkdz+JPUBGHQjOAWn4j6WbMYOUBl+WEyZaEKpTSXCFPfGcE5dPBph6PM3aEbMnnLQP3a
	6gMHg6veUlUJoNvPkqSKWf6xMTAKpOf487APOmrKffmo2OxQOAcNsCWAoHFs7+HncVakn2PxASm
	952+4MKp/dTqJJi72jYkRmN2NaiGjB8cHYqH7/8aonKxJxlT00ttFpNzg==
X-Google-Smtp-Source: AGHT+IFGxIq2XgduSb+stuaocak2phBxCIezkzwd+AAubIHJ9Z+vhmNDyViyBoMY0DIaLUkKe02kAuU0EhMWtzwP5ig=
X-Received: by 2002:a05:6a20:6a04:b0:350:5b75:6959 with SMTP id
 adf61e73a8af0-3505b756d29mr452994637.32.1762335231830; Wed, 05 Nov 2025
 01:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com> <20251104120301.913-4-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251104120301.913-4-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:36:19 +0200
X-Gm-Features: AWmQ_bnL9LXcRTfkqLXg0rjUqS39MT0GLWaNx8agMRC1jfxbVmtMKne3NHlmeiE
Message-ID: <CAEnQRZBENqUOTbdubTsNsivGtfKOqFqqTadr-jKkMGEwBvvnAQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] clk: imx: add driver for imx8ulp's sim lpav
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013352_663217_FBCC688D 
X-CRM114-Status: GOOD (  11.95  )
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

On Tue, Nov 4, 2025 at 2:05=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The i.MX8ULP System Integration Module (SIM) LPAV module is a block
> control module found inside the LPAV subsystem, which offers some clock
> gating options and reset line assertion/de-assertion capabilities.
>
> Therefore, the clock gate management is supported by registering the
> module's driver as a clock provider, while the reset capabilities are
> managed via the auxiliary device API to allow the DT node to act as a
> reset and clock provider.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

