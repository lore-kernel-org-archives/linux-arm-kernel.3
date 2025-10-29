Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F061CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq7cfrs8fVaBcc2FW3QUnIn+7UcMac5CdGnA5tYXOqc=; b=qFCk3H8neTWgqZTSMBsEwyGtDz
	lB9ek670vIb95QhfioKBl3D8rnyz4zJ7crWPzz2WHCAX1feY9DAYfXWmvrMnoFA0a7SQdcSeC6kLQ
	LN+shF12cWFLK+cDSAhcw6K6DEA+B3zLzko2SQjLh5oIVFAenokujFLnKLE6GElWfRYhxERqzmscb
	1N6DVIs6jJtjjJGwnpB5BnxUYuODwgXSJ+RV+b7dsteXiD7x0+9+1LSLamLJ9PE/gkR+x9wLhqHsB
	Q4QR3Scw2YmRvlU+sDqrXxvoo9dQX8UNoIZHmlqgg5vQcBtKSMZgD6hMHNTGKnKVKzsziWQapFrX6
	JpFaCzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7YE-00000001fkd-1NWk;
	Wed, 29 Oct 2025 14:53:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Y7-00000001fgH-2xnN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 14:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fq7cfrs8fVaBcc2FW3QUnIn+7UcMac5CdGnA5tYXOqc=; b=mZE0GiqMcInfaR8grTsjve2Gwj
	a2pZxc1eluHMsIhQO+/Omg2KipAb2i5lWN1uF24aNmM6KDcOALjumkiGI8iaUyhdorhE28Qkpegvz
	bqShV4oepAE4V0vdZvuXc2e2o5BKR5joqQvlO7z3zEx3AALiFsSFdFBkoqUf2CN4hFjCAlfQHdee2
	zeGli0eeT+2ZUsQLnXoJ7b4OyBMyyBLQoLI3J9YWEkAXBb2YmyWblgzvvl2qNP10J6GR4T3zvC9QU
	VRteeJtaMNr/5Epn7yrnET3V3Y9J83aAqPrYTyeqg29FIHWhib3lKpykv0WUuGv6AE4n+xT9xHPps
	kXmeFEzg==;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6gL-000000073G8-2BL6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:57:47 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018e9f902so6439128241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749595; x=1762354395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq7cfrs8fVaBcc2FW3QUnIn+7UcMac5CdGnA5tYXOqc=;
        b=fikeyRyNz8mHoSTANBlcIh66lU4vWipPXi2C8D4zMN78KaDi156tFfHwU0KRTchjPF
         HlUZdiHjpU63M2hQu2UOfNnD8tKvqGPfVs0nFaz4i2nm74WxCyXrY7d5RBmbuBCwqFtF
         9Kn89725H+HkroKvz6nOLiqSNP7RE/T3RceGoTI61fYuxkQSm2Lz8Cr0sBGjlSzkZnXB
         wXGT7xi7AWYJBuwk9aR9VZtLel6t8rsw/pWYpwbopa18IAs+X9J+1EoiiLEUCnHU+/3X
         Hi6YW/5r7aTWukCggcKobrBzqwfZPOhrvvU/z8X5MW/NFueNsZd5EYjm0g7FcDxFRsxq
         xmQA==
X-Gm-Message-State: AOJu0YxBXY1qCxc6AkGoIQfjFkxCunp2NsjOq4NfSZE9xrmGVFS5d5eI
	XntKlQj9o1g0Uynco3WETYpuN6akp6ZRxWqMoECqlGwGQL+baA6oIxgcVQ6YdkTS
X-Gm-Gg: ASbGnctSVsYnNlswuindlWIyuHRilliTLICJl0JZOLzxWuPJ5qjNYnotH8XX2BFi8M6
	i7j2y+2ZzCk1c3G9MFkmTDMkS/zwOoD5OSHo6uH3NUq/iZZ1d6djbsnEcFNmOD4c1t5tvg5Ygh5
	aF+7r1bkUgO3ETpqcG4mVqwHuE3bNvX54NfqVqoU0VEggk9o/HlFD+49OGRCY8u6QzKJv9qMimN
	aefi7nksJom3igMTaVA98wtsSlUaC6HYukk4cj/uYLa4J1iKPrj+bqaoyAEmiFJ4N1dbiOX9trA
	coVlkyIlDHjidDED5P3Q1uUFfGQvUW4MAxbkELfV9JjKCQREGfU/5LDBrj+up9nPrd1mJRznjph
	WqnX7LoBRRjh/AIDv/dcPkZC9C2uiGMglI3EGnZNazFNth0NvHYv/3fI0A6atGhMuln6pxdNQdG
	hh6ZQTHheLXGAXsFJ8h4GQTCKVCRPK+mv9irSp64xanZkjzckNXtZA
X-Google-Smtp-Source: AGHT+IGZYbEl0chodW4DZKObgNP7k6t/1QN6z5LgwY3wQf+h+cnoI0wcwQ12ipIF40aTc5Z/XUrieQ==
X-Received: by 2002:a05:6122:d98:b0:554:e4ba:4408 with SMTP id 71dfb90a1353d-55813f6d1afmr1035824e0c.0.1761749594583;
        Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb08fcfsm5446078e0c.9.2025.10.29.07.53.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d967b67003so8243302137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:5d6:221c:3dab with SMTP id
 ada2fe7eead31-5db9068d4abmr1045322137.39.1761749594055; Wed, 29 Oct 2025
 07:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:53:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+vkj4KEyxmvSSi=Zw5KSXqJK=-7ZEYm4q_odn0sYv3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkbcCJ5bca1fjv3psAbJaIosav5q9yqJotFzCTEHDUGlkGiEkRijKAzyWQ
Message-ID: <CAMuHMdU+vkj4KEyxmvSSi=Zw5KSXqJK=-7ZEYm4q_odn0sYv3Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_135745_841541_96CB7EA1 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3ULCB with R-Car M3-W+.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

