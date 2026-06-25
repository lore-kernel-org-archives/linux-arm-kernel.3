Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C6CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=; b=T1CEaZ/z9VydZUtcsRRqwFu6Z5
	H8scl1tdsxof/EXOOJJ7GW+LpIUHJXm41CzXHDsXihwb2McqGkVG2Ln6KJdhOWNt7v8evAiRpDBGV
	5GvXcVfMUIzmbqb20jsXtda1Edv4OztK8sZFCDdVF0pZFBeKXif/PwGunwZjDun/SzD/fh6dTIP0n
	VyHU+yhfKBRcE/K+BnCoQ7WzLLxpyKvzgTSqlnGl4ZQOdOUR3BMpxJbUn8dPSo6kQMyr/TX7PurQl
	BgqyRDjKo/aQ5D4oGB52Kq0RDUKIfUn3MK2X7yyP8mC2G2rcseL9CKDeqWwdPXktvJwqS+LBnhDni
	RLxz94gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcm06-00000009Oku-19iD;
	Thu, 25 Jun 2026 15:28:22 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcm03-00000009OkU-34Lz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 15:28:21 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so24562876d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 08:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782401296; cv=none;
        d=google.com; s=arc-20260327;
        b=aX1LtlQGp/+8FoDEqPOczuGEMVa3/0dUma7j5BVNwKca4zOYGpy8G7QyirNpTOkMls
         KiE3kfMXmXd4sdIIj7l2e2iFBl9W6GZvWnxZGif3jHTy05RXtINrF/CKXMM62dIOx6S9
         YlRwfLXPQuX8w5/rp5hF6sZ/X7Sis9mEFBmvwTp/+eH8EnwYq7ubpNVUQUQFbTNnMcrv
         A8JUWNvW0ohUylpBdQfOABwxjCGwv7Bd2pIVWimKq5JDZsCTmLFYeODevUhhyopE/VNV
         pNWgGRplDp261sf6mAQ144seDtLidm6tGPzvDeD9VYZClrrzN7hfgB9iRVJv9bwa7xEr
         XUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        fh=3NTf8YQ3qH4XhVNIrlqn8Cd9hed/6e35bOqbY1OR0jI=;
        b=AujzbU5kzUdLRNx467Gr7Q20G8o3hjYwlJj0X+CbsMXiTg3Q12NPE5RYffGcyTyhZT
         EuyE/mC8B01jFAGgkpOkxJZ8l3Bwnd8nkxpkGydSMLo3Xc8MTAsLmVAPcw7LvOaQY/6I
         mnp5w7pYUVRWHrYNEOFLQWNZMzMqOcT/jXXuJoIW6m6I6QGq8/bTVKONygjr2GXrGJ/1
         b8SOJupRuA+coapGNqte92X9/JYwQL1abVNXNLhDNmlWU/la9gvicCZvcMHlYe77/H+n
         da2yGw1Ndr2Hp1lZfk/sqw4miFO03+xJyp87WvChqeCbpF5kk0vrZVwu2PJOBwh0NyTs
         r3pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782401296; x=1783006096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        b=MUUS2QQ0r9WRWP9oPs7XynXC+U6uskSs1d+FleJ4jeAMxvVi1OqthBLhggRaA5mvVc
         Qja6jiDP/tkyOw0+FeLTLuP1WM6tSbPqLGwHKcH/Z9FfgcIU4bPF2upGEv9sPBVZvwzS
         Me/EKTat/1d0MXLLO71KGzYBFxpq7nt04GSUTHxHB1ZIyppYGVIpeyo4Yu1Ha7gzhuTY
         BdFqAnqNYyNHeRjJ8JrymHzmgmgCRSwq1enVX87nLKptG/04PtTPWS2gJyzEaTGaLEuv
         t/FVZWPkqX8n+QMRIP5Rz4qjSf10yhZ51ixoPvoG62shyxE0GF76H4mtMPt+o5knDmfb
         cpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782401296; x=1783006096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKSsDzvzVVE4PcxvyKJP2tRRphIhdjCmn1leOHQnfH4=;
        b=buAl3iWn49CJ83BlX3q+45qoljhFQhuz6OhYOJLBt6w0UqgAEqdPfFOFv2gIfogR/G
         CHW8YuCvN15Jupz/VeOIVd2EmwVJMfSrS4zg0kIvkPjYa22g2xbK2GUkwf8tKPxwY1oc
         roKRDAw0w9uDRYVISVKD6vcwOtYn1jGKG+NuddBWP1X9kXxiiidLsc8Zi4Ek6bTmNPDQ
         uViPk8v5BFWUSbHFXqDTYIXmZum4yX53UGPI9jlJfNjS9fZxiSsKRmwO9inxCnV+rtrX
         UNbF/1idFrwGU67PQ6A7nKLSKjmudzOXz9XBTUnpX+tg8GdRBowdc8GoD6eyRp8dEDZN
         0wDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdPx3W5kdlwCet6hHxVRNQzDtAI9qbBGqGcBYkKeSkXNN7TmoWLBNEnJFYVIjmudlLKs4LYHsDjcQuNyy0VVzs@lists.infradead.org
X-Gm-Message-State: AOJu0YyWoDSEgOqi+FEI3Rc9ycj3tJQ4R1vzHRIQp0fs2PkXT08MOE/+
	7XxZm7HwesYzxPqRhgS/uEEtvlkCR/l4GezWBC0dWuF8UhZrApf7UHPhZhwgNcIC8DGD6d2figb
	rQNIc55mzW/RXzXtaIGVliNb3IxmYcRQ=
X-Gm-Gg: AfdE7clfzd2jVJ2r6RIHfKAxwdg0pk03JuPbNWMwCr8KjSrTTtQygT3pUBKJhvGARbV
	rGABg0JjBjeo8D23VAhAklzcmmVTSMYUjPtFVVzJ34kVxT6/GtCq3RDpXjceiVoJLrO9jdcuHqx
	O+GisGSmuoCqU2+Yvd6jgVNQxr5buihzbyA9OkHoOLiNbGxuqxT/qRR3MeiSrejG896PZr08ofK
	wKVJapD8bLymzz8l27LGSDmNrFdmK2Hp47bM8R/wgXs+fKPKmTbVPt529SxvVJpP/JHsENZhT2p
	3QM227YopWoPJp6xWiC94KOEFD9RJpp0IB4nBYi8FJva6T42u7e6eU0xITRYCRvrUNI=
X-Received: by 2002:a05:6214:5987:b0:8dd:7a07:3046 with SMTP id
 6a1803df08f44-8e6d968d428mr54431736d6.42.1782401296470; Thu, 25 Jun 2026
 08:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 25 Jun 2026 20:58:03 +0530
X-Gm-Features: AVVi8CfJ9i1hrsgaC899ejQ_T6dkqai50m7ftNq7tqvPMAUS9Ij33c1efD0NHEw
Message-ID: <CAJvdc_eYE6y-quKfeLocrF_PtWjmaFY5m=h3w9KdKktjxy+4sQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
To: perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_082819_801049_357C1711 
X-CRM114-Status: GOOD (  17.74  )
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

Hi all,
Just a quick follow-up on this series. I would appreciate any feedback
you might have on these patches.

Regards,
Manish Baing


On Fri, Jun 5, 2026 at 2:06=E2=80=AFAM Manish Baing <manishbaing2789@gmail.=
com> wrote:
>
> This series addresses two hardware initialization and teardown issues in
> the atmel_ac97c driver flagged by the Sashiko AI bot.
> The original report can be found here:
> https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gm=
ail.com?part=3D1
>
> - Patch 1 moves request_irq() to the end of probe to prevent a null point=
er
>   dereference if an interrupt fires early.
> - Patch 2 reorders the teardown sequence to free the IRQ before disabling
>   clocks and unmapping memory, preventing a use-after-free.
>
> I am submitting this as an RFC because I do not have the physical hardwar=
e
> to test these changes, However, my manual analysis indicates these are
> valid bugs, and the series compiles cleanly with W=3D1.
>
> Manish Baing (2):
>   ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
>   ASoC: atmel: ac97c: Fix use-after-free on driver teardown
>
>  sound/atmel/ac97c.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> --
> 2.43.0
>

