Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0403C7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8p2OpGo8CDaPQfPclMnd2uTE+ODzAt+oveKwlFe1wI=; b=AXSgFOgcXKvq+DzbUBkLjeCapc
	Ar9ryyPdIP4PSKk+0/DbCjf4BZRk9lvybSjUMEqxZrHIwaBwJDQ0zMs21pCXJxUUyHmjmxOkIWau/
	Dm+T6fhZLOXyYmCAGw4KWiLgtu/De7+WBwp4q5eUaf2+nL6UyMMGVkHf+p7KNIB50dblP0IOlTHv/
	wn0jZT3N2pHh8V2kHH+JkKH+MJejhxLSO7oYTzW4F1anP/aAekKM+xtVrQSTKLekC3aImsbJCXlB0
	IMfSRbhi78L/WVZnbyg2qIMTlOxbDMFoOyQRQ8F1BjjL9ys6HEGVf4Vww0Ynv7ymOAC1tEXQfEnsR
	8pWLr7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2v-00000009Sxn-1ggN;
	Wed, 25 Jun 2025 17:36:29 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPIa-00000008dWf-3xBH;
	Wed, 25 Jun 2025 12:32:22 +0000
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafaa60889so41360106d6.3;
        Wed, 25 Jun 2025 05:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854738; x=1751459538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8p2OpGo8CDaPQfPclMnd2uTE+ODzAt+oveKwlFe1wI=;
        b=rzgi4Ab7j2xxto+ZQ7KKBxcqtBwjVIyKj4n2xsfw6JZShxJc0Ch7Mn8U+BGANWhfpe
         qzmaGA6jn0U1kMJOmWofLIKpUXqUxWG9pmcCF1HjiODzVXzFcYSPh/EVgbSz9X3DxT7c
         UncfmdBD8f3mbzvb/0AMspBGck+5Ne0xiUPltwupa4ghv4z0nNeNM/Du2g9+G+Ui30Ib
         vmliM7pE5tMd0unk1FcIj1MzDEbRp+oXmiBZaU2DraFnunki33RV/uNl3Jry1HUZMBZf
         9bnf+cHz8zdS22efcAjfZMynGVjjtLFMvkhFBtbKdyk2BJoMCuAWv6wA/PqSkoGR6TY6
         02PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJd+H5BFkT5BlSEHSaurGKjqwcQrS0/OFIajPVD907ro5nsTcJlM05RducEEqVPa4vLjSGX9Sf6lpUIAY=@lists.infradead.org, AJvYcCXaDWN12WFz4RBrKPMyG/L5FiVqwqRr6n2bVKopqW6AtaYtihRHs2UrBZxdcnxeyBkRnhmdzfZFvcCEmd0N0pQY@lists.infradead.org
X-Gm-Message-State: AOJu0YysOS37QM06/TdSLPVOyklWc2xSRaz5Z8rXeoBsnlqYVdGcbswk
	Jss/s1S00MW+IhX/SCTXzy080KaawYhAy/WEDHXZOgkRKAAlzvhHTSJzx04C4mop
X-Gm-Gg: ASbGncuNigq8PAcVpbBoWGQgzYVdDQMJU1vmVsMzZwKMu053urnCEv4p9xA6w9S3DYU
	RrKujd9hoWHrHQ3ojvdlFIjf6lK3mjJJNSu9YebjCMmuH7IAzVlTJvlX8q6EMdG78xGcr0pblOe
	B3LVNDKOVk6NgUESh/veKZYcQkNtlZQ+Tcj//e82kbG5/vBnRTSSaSadJ7gwYsifjlkC8oqpVbJ
	WW+RZBA45z+IT7a7/aZlXfc2hUpiH+WxcvVbjgk+TgbKcDT7F4xBsaqZqKgwkYqfbFPutSEhWk1
	KpxOcC6s/wkuSWYyPljLWNic4b+JXAOsKvMD1G/U0jtmHGQ4oxWVcbBLSD4s4gePQiyL/GRu5p6
	l0pyFh6ReKoe+DCByXJpiKQKCLQep
X-Google-Smtp-Source: AGHT+IGc7edEM06kxAuntVk3HMCEak3IsC7YMg8we7l4itoKMn/7ETJbD8ej6XLIM2gq0DCKb1AbjA==
X-Received: by 2002:a05:6214:2522:b0:6fa:fbb4:6404 with SMTP id 6a1803df08f44-6fd5ef29741mr46569016d6.5.1750854738321;
        Wed, 25 Jun 2025 05:32:18 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093de890sm67578036d6.12.2025.06.25.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:32:17 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3e7641b76so389558185a.3;
        Wed, 25 Jun 2025 05:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTzOrxWXmNPlHt/9S+q74XrqYElTQrRa+qHP5zHtyU8/pj7CsG9QC6Z2FAiJu8dodcBT1KeHa3oqVdx6i9Yzxi@lists.infradead.org, AJvYcCXPOgVEhs4qpbWTwbYzRN3gIGa2SerUDs0JNu2BjLmhHLI41+lyW+bOXDzOtTVVqL2WmigvwX4ju+WgeoQ=@lists.infradead.org
X-Received: by 2002:a05:620a:198b:b0:7d0:9ed4:d269 with SMTP id
 af79cd13be357-7d429710333mr334230485a.2.1750854737237; Wed, 25 Jun 2025
 05:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250625111806.4153773-1-maz@kernel.org> <20250625111806.4153773-3-maz@kernel.org>
In-Reply-To: <20250625111806.4153773-3-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 14:32:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQLEQziPueu64ueCrkhh9PtZeGWGVR-yHkbKBUTPfFyw@mail.gmail.com>
X-Gm-Features: Ac12FXyYeQYex53YhZaoUKJ8ttY42d8BJ7oEfG35VrnSztAFwUMET7EHu4gB7r8
Message-ID: <CAMuHMdVQLEQziPueu64ueCrkhh9PtZeGWGVR-yHkbKBUTPfFyw@mail.gmail.com>
Subject: Re: [PATCH 2/3] PCI: apple: Add tracking of probed root ports
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Janne Grunau <j@jannau.net>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053220_986129_EF29D569 
X-CRM114-Status: GOOD (  18.12  )
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

On Wed, 25 Jun 2025 at 13:18, Marc Zyngier <maz@kernel.org> wrote:
> The apple driver relies on being able to directly find the matching
> root port structure from the platform device that represents this
> port.
>
> A previous hack stashed a pointer to the root port structure in
> the config window private pointer, but that ended up relying on
> assumptions that break other drivers.
>
> Instead, bite the bullet and track the association as part of the
> driver itself as a list of probed root ports.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

