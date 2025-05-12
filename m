Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADEC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqsPLv9uSuQweVXtQM7sHRJP63EkcIqTxw+FruTh/k8=; b=nMCekfkiVgVRUsSEyjaiu0AE5q
	tUKDInlR9OswK+kzVl+mhjoI+T7eKodiv5yrtrvPnB8tMXZG0Qzy72UDcBuEMAA/A/FMhjrVBLz0J
	AmIHBnoSByw4+nKJg5yogbKCfZD50x4R0/2s1mQKx7PLKbx1k24Ea8dQJrlLwoNLVm2/DQBfKqGtB
	/yWmkzVRCxg4R4FuhNss4SuTCk4eZbzrly0TTi72xONdz8LnVQbENWsIlR/Hli8G0AD5k/4oWqOnC
	zz5dgT0uzoTPG6d6/jLBx6gKHvwfPZ4B4SKLGWiafHsHJD1BW4yja8HVxuLELCZou4DELayz2uK8+
	/E8POaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQFO-000000094xE-36Fm;
	Mon, 12 May 2025 10:18:58 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPZ0-00000008xPK-3UzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 09:35:11 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1218823e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 02:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042508; x=1747647308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqsPLv9uSuQweVXtQM7sHRJP63EkcIqTxw+FruTh/k8=;
        b=WqqGASUiXSvPY7HH/yPx39BXBldmo73n10VaUR+SdG5IJl7j+UnFQv5LsYMU3UV3zH
         5RmrPcPUx5+6gnDPx/7J0Fow95qi7j4pHItVH2HCEtaYlst9UJI75WW6t/HXNuEOyKp5
         apdDG2m7IKXh+Lz1KUAsXJHYWesmPjc/XxKzcN/0AbipPLTDVQV7UlbIbhqS4Huf3zt9
         Jm6mWhDnSIhqDJR2OnR2JKMvtg50cwNpacWo1gwOrTl/s14cmN/CyjYNeNHS7eYpAeQA
         hZH9go/167l7Dsc1JHPeziDwkRMy2zkptWav2D76yRcAD34UwgdFHD7yU0LLPk8fN56A
         lB0A==
X-Forwarded-Encrypted: i=1; AJvYcCVfsnP8pD/VdzCKA0MGkz+cxE+8Vaxlk5eQAIh+LdDp4ek6LalvaFGBmggPcsXZvUMjamYze2z3pvzwg87Ol5nk@lists.infradead.org
X-Gm-Message-State: AOJu0YxTYgmqQJlEosHq/rEXZS1reO5NRF5zvmxUmSYFQS9CYEa9wD58
	kryNjIOkUvSj7iXkT4ZTdTSTZ3NM9TMOhVnaWqgXJ+rf3xSWhDUTIYiGKWMg
X-Gm-Gg: ASbGnctmpPRlJyuKbgiFtoQ2D3a0w9MfrcoYN54qD8E+b2SKxnAe4ubkVVLKQ0YKV0n
	OXdw/taK0w1Mi+XYAvCsQVTD4JirnbSm/8svjjaz6VqAdrXpZdJmXog86JTUdDIdK7VqePWbCGq
	dnBtqdwbvoXQzmbZ8xuhWN4Z0gfetq9LUAa7hu1u2BBukUabne/QIYqIj6I+9FAdNi2oiVF35WY
	hlXlAVkq1ctphS9qISQE0oR6yCnK7A366NTAeuTIEzaZJ7RQHFmSxjRtfZAMGRyvfZjb3Xo7oyv
	Fbs8RbBsSbTJBjC9QdbY6hydi82w1/w5fhS3KkayoAHt/UHYNOWePSHu237sjCxP6QBfDkg0oIj
	+Xkqh3SG0mS8k1VnIttZ9H+QW
X-Google-Smtp-Source: AGHT+IE7KqBE7/0gCN0xZof6cJgA5ezlrGutRMsa+WgGQ4hc9Z1HajcemkvNAqIu8nCTGBf0LhQ5CA==
X-Received: by 2002:a05:6102:5345:b0:4cb:5d6c:9946 with SMTP id ada2fe7eead31-4deed334190mr9430452137.10.1747042508025;
        Mon, 12 May 2025 02:35:08 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62964c4sm4761735241.29.2025.05.12.02.35.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:35:07 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ddb0fc22a8so1570896137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 02:35:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUERLx3gsLGXcaDuSBWHEbvriS2UUrRziV1kM58kzZeMhkRFbvVx1ayq73d+fhTy0VqOADwUXfiUSY/3N1DiKS9@lists.infradead.org
X-Received: by 2002:a05:6102:4b19:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4deed3d366fmr10212836137.19.1747042507550; Mon, 12 May 2025
 02:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1746798748.git.geert+renesas@glider.be>
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
X-Gm-Features: AX0GCFu6jsWjeoSVukB3E2LeU29ISfDMzfAZwuaDhJIL1puAnVS2NMOwOsemz7k
Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM defconfig updates for v6.16 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_023510_869978_A1FB2722 
X-CRM114-Status: GOOD (  17.48  )
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

On Fri, 9 May 2025 at 16:22, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.16.

Oops, subject should have been "[GIT PULL 0/3] Renesas SoC updates
for v6.16 (take two)".  Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

