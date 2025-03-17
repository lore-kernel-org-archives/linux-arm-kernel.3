Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F69C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO+8ygNTKCIQIyKWLVf7vwwm+ioBOh0zCOnmpBG5osY=; b=bJAk3o5XLtWn9EvdPLQTDfRUFa
	O7sfbSzED/skaDkT8SmjLZ4miJDvtD8IDA5ay7zNPQCOxYi2VqHea5XSSqa1rxO6R5zW1PNLI2mZw
	//ldZMoM2B2G9thsOd+GEr+KlTwiBCa0eafd27I+fIYP8+78MgjF1t90Si2kD9LUplCG1fIEviC24
	HVIaRhLP40khAjXF9kGORLjEGGAx4OeW1qZQyWRkqrXSGu+piE4kqX0dx8VPKJ/6PKlWX7wjPBTjx
	tOY4/1muZa+939Cb3PHtAmuLdCH0AWLjhSfBaAM6cGjm2VMVrvhVfJ0rz7lSiW448v6+Wa54mQyhL
	2ci5GGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6tQ-00000001xE2-229H;
	Mon, 17 Mar 2025 09:36:20 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6nz-00000001vwf-2dsr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:30:44 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523dc190f95so1962496e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 02:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203841; x=1742808641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+8ygNTKCIQIyKWLVf7vwwm+ioBOh0zCOnmpBG5osY=;
        b=FPNtdngERqrQBGsT6L7Pztl72apD3qdRv4GIjm64NuUSVzauMWI0ejHUsNkq0zAj+V
         Edj3r8bgy3vDnA3DIFFa3Y6dTewLdeL4XER8cq8UOslN+8Fz42fcNn8psdjxMpSKy+S0
         DPq2LdIjEXMjEtAETj5pyitBvWlG958/O4a3DVXYKz5qmLEm4hufBM9YwcU3/V7nfj95
         qnXrllgp7XUFsW02mixj1hRu1OI/o+Tn9R8fOHUPZWlY/7/oJlTXRLDcE8fy/QqRUegc
         CjmhN8d/l3Bo1SlFhadzy8i7yIwICalC+pPoI246KnK2HVN9pqZefd/rcriqTdGVbRSM
         ts4A==
X-Forwarded-Encrypted: i=1; AJvYcCUf4IsO/NpcAbVhFDK46Uq1SwS+9o0RqxBsqjztegXQVY6Xpq+5Om1VbP19ftUYADEHkXeGm9vrbS+r26u6Wr0n@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7NsblzYMeA1dnv155Bw4XjTABF9dwWwTDHD8J1js4lT3V0pL
	k85Io9h4BG09VBdgcR2H9OvvSdF6IwLTYa8205AxPOeVeFqZC/x3yJXXnDF0
X-Gm-Gg: ASbGncvU+douPE3uQgulh/g20LUIYKq3t64/AA88s4DX8oAWPJZ339pw7Pw1ljvmyPf
	8qr4+s2ljZtlWGvYL0/1TVUKE5WKd2QQb60y+J/RVPWRVFgmhz+5NWc0HVgzG3X3eRUWtj6iTZi
	T8tJ+qLO2MtCbdzJloEOjk9nxb6H+nG6ony7bXr7vTEaUvr5dD6GF6tfmMEr6cJwSSEeoIMznuv
	r4j3BDcEb64dVsdMJw6rZAgzrFKxpmpJ+r9gDdlB0PNm3lNv6JFPuOn5v5G612GktNGqp55bWs/
	8Lo+e2IDVWRiTRK5kAz/hgWnXigSpPeYD5p7y5LtMuxY2XBliBm7ZgeNbzMQrcy4LWp+3AidTcD
	fjBNcSoX7IWMDjLS9mL2ZWQ==
X-Google-Smtp-Source: AGHT+IEBa4BLXV2S9+BibrU+zp6u6y9ljXsbFOCWg7GJcZpd7fxAy5QI/GakxdkcZHAbtu8mgDo9zA==
X-Received: by 2002:a05:6102:50a4:b0:4bb:9b46:3f87 with SMTP id ada2fe7eead31-4c38313e5b1mr4930555137.6.1742203841697;
        Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90d68a38sm1599040241.2.2025.03.17.02.30.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523dc190f95so1962482e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVZSxMQ3mt6359wzIMxlTwVvv714k8C1CKk50E3Cq9CF9pZ/orOZn2r8UUc84nRuJATGCpe6H0SFDIZX/tEAUC@lists.infradead.org
X-Received: by 2002:a05:6102:3054:b0:4c1:a395:c57b with SMTP id
 ada2fe7eead31-4c38322a2b6mr7410200137.24.1742203840941; Mon, 17 Mar 2025
 02:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
In-Reply-To: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 10:30:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPcDZsMsjc8WdVC7vnt_BPVNwiXyB+AEzO04f2eq5cmg@mail.gmail.com>
X-Gm-Features: AQ5f1JrYGHnVLahgA4qk6HO6NQ4eGzBN5PdOXMYhEYNuD-wyDKiqL3N1q7ViLb0
Message-ID: <CAMuHMdVPcDZsMsjc8WdVC7vnt_BPVNwiXyB+AEzO04f2eq5cmg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters
 in E-FUSE
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_023043_664069_C9CAE9B5 
X-CRM114-Status: GOOD (  16.98  )
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

On Wed, 5 Mar 2025 at 14:35, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Describe the location in the E-FUSE block of the PLL and AFE tuning
> parameters for the Universal Flash Storage controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

