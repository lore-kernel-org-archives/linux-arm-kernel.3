Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779E5EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXRf7ZlIE67Mq9vvA+FZdAN/BVyuhN+/8xAIWrMcwSM=; b=mm2L5wEL+NQH4ypR9P0cfo9feO
	k4Ortx8Vl4J7baRdGh6Rr4csldtdRQHNCaFBwUudBgEaIjlImZsqanZficpniFNgY/5cPfAuVhZf7
	t5vMVW3kjJKhSCToWn+prWpfA96V80Fiu+OX8AFnbA3tMUOwHd7oKmLWfMhrFSZuy0rG8xSKr2iSt
	d9GgfErLMumDkOCZVmyPFHzNV0kYMSFwrgkL+z5T0bdPZRdzAXIsPrApZTbGLJU29fQ2nBvrvKWG6
	RWZ9fgd8VA9hOBvKjChLGo0LCTBc01K/UZLZCDPJPmoV2d2SVGXXKX6UmerrFTE/tQHoT/h1DOvpZ
	Zsc7pkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0qV-000000064Jg-3KMm;
	Tue, 07 Apr 2026 07:27:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0qS-000000064Ie-3iRL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 07:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ADAC4419B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 07:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D67BC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546852;
	bh=xXRf7ZlIE67Mq9vvA+FZdAN/BVyuhN+/8xAIWrMcwSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oS6QxhYNQ21JeuqakAB3IUKPuahJDqes1AYLqkOWKWsMAymK10UDgdMDXUNnQuLu+
	 cLCugYDaSK9DrHdBi2oIeLNZzx5h9nSNS4Ed9gFhmfxyb/l/0YZVJWiNVPL2L6XAZe
	 CK70WsMN8Xv47/72t47sIAswB4HSwMGU5AOe3oiWp33s2i6V+YAt0ATAdl0DzSNy+r
	 DdfD7M8IGk8/AkMfA5StV1/yWgw+FsEtpzYpIlQs4YKr2alagUJKo0dcHH3J1t61Jz
	 g6hbYF3fkzVvaNhz+h1/XCEf4qsQ7YTff+SZzZ0b+coEhygQZK4madQmKHidDAFHQN
	 ydMbgIPn2tgrA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e538decso47775817b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 00:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0GNFCl/A9NExaxumShmntjkJlHHEsLL+K7BgBqVNMzb1sM8p0ICPIV/Xbi3jyjR1AfIsY6l3BHNNsMKhj/oBr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0hZgxSKPUoj8/8wzZqlMzklPLXA3tLsnbF5HiFwe9HT7/+Pj5
	6a2NAbp+cogKxmhroZVG8YVct5q9bdGaDVY21eTnLQ+3Yhk0ht9CYNba4pvOLVYOIq57KrmcIf/
	Dl2SbpSQFhPZFffcCJHoOPml8Hnwecrc=
X-Received: by 2002:a05:690c:6891:b0:79b:82a1:645d with SMTP id
 00721157ae682-7a4d84c2b0cmr153542237b3.29.1775546851789; Tue, 07 Apr 2026
 00:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260331113835.3510341-1-eleanor.lin@realtek.com> <20260331113835.3510341-4-eleanor.lin@realtek.com>
In-Reply-To: <20260331113835.3510341-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:27:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Gr5szR9bNeLHGJh_Hku6FrW7f=sBtWi9nzui=VS3Y-Q@mail.gmail.com>
X-Gm-Features: AQROBzBwC96A2d44hZWfYRwmq8cn7_WR5JY1hKsgDt4xM1OBYyZOdqZz2qQC398
Message-ID: <CAD++jL=Gr5szR9bNeLHGJh_Hku6FrW7f=sBtWi9nzui=VS3Y-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	cy.huang@realtek.com, stanley_chang@realtek.com, james.tai@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_002733_029115_1541A3A8 
X-CRM114-Status: GOOD (  11.17  )
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

On Tue, Mar 31, 2026 at 1:38=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

With Bartosz comment addressed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

