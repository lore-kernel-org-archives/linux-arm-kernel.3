Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE9CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYveBhCTFny0+2MHsYvbpE2kTFRGKHGAD7ns0IvW+Hk=; b=3YIwVCOOt2HiA64aSdg49ihwe2
	xaKBItz2wE2xjVjoXFsQQPY++evlK1sXcd/4xfcnQqpkXvMtrutx51+AjdoWYg59HlemXnxl9BB5w
	JMHBZnK1snWRmt9fdWDsqDk50de4ipDlhb7BUzgl4KUcxMyiRicc8on2tSekSWNT+PHwiwexN0/HR
	6B0Z/l3sbauBHKBnTDW6liyfnrIES/KU++bLue1vw0URdLuhgdKg3HeU5Ny52AmngTKUMWX0I7lrE
	Wxd6pE/5m392tjAyagezZPo4vLgfja7J+lleB9EamGcu9o3vtbDFv8EXCwmMpNfZiW4YWeBrGeCby
	+7pPcEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKflk-00000001bvL-1hBA;
	Wed, 06 May 2026 17:10:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfli-00000001buy-2kz9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22E4C6015B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 17:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43D0C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087441;
	bh=tYveBhCTFny0+2MHsYvbpE2kTFRGKHGAD7ns0IvW+Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RJue9dSp0JnbL7R4BxcEbZyo858PE0RciGFReZFBWoN6nRnJhkhCyFgs1mj2qsHUz
	 bpEOTww4L2JtoNi4R12mZKjt+qv5r148YQVafFPBC/ujcu26qnRZY0pHNZyUOKGN3r
	 aAWiVBg8KBcZTc3W6aCVwhB+9M9TYfl7d+v346n0bz3PFRvqY1xHXHq908clRxZunK
	 JPuXuNB+mlYrqvwJTFvZ5eW8gcNkiwo0AR+2dEoWeSrHxoz9m3v+CD8JSsCEpNwPAb
	 r9dZYdbGKBbshgMo0uKH0GiJgSPpB2YMjNMYvDSFE48Uqqr05sGwtUOSrY7JBUYCTa
	 kBhGY3Rjj9YbQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8721851e2so3546382e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 10:10:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fnTnn6BGZ8CVQ+53BTCzLYbZScYWxesmmpnMasaO4K8ADf5W1JB8bFk6GZdagXZBwUH4OS5pEA3zLeZCGwKn6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqle3kP6ehvIN7JAndtTTkzORo/cfLq6t1clLVkwV4loI0kzQV
	6zG9HorxPvmyrikdgMLAbI0WXQHN22s0gp3v7TZye4v5awe3eXjPnkyDPtTReLao84GO56ZgOXI
	5ckU4vQ68dqpixUlgzv7m501ukb27ufI=
X-Received: by 2002:a05:6512:681:b0:5a8:704d:c20b with SMTP id
 2adb3069b0e04-5a887ce98c6mr1667876e87.27.1778087440537; Wed, 06 May 2026
 10:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 6 May 2026 19:10:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLk8Aw9f8ahfkpdvdaZyC5H0_wKzvB-2UQs94COdOBUVVQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ir8WGzkyfsIZ4qNbaD-5okd0En2H_avAERWXswILzSBgy0xP5x9P5Z5rs
Message-ID: <CAD++jLk8Aw9f8ahfkpdvdaZyC5H0_wKzvB-2UQs94COdOBUVVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, May 6, 2026 at 7:03=E2=80=AFPM Andrew Rembrandt <kernel@rembrandt.d=
ev> wrote:

> Convert the ST Nomadik boards binding from free-form text to DT schema.
>
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
>
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>

Sweet, I love it!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

