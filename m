Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100FAC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=; b=iwkIaQue1Oamr0piUMrC09FMXa
	j5xM1EsQzlW8Wm2Vlm+coeNgO9ut4jXpAh3nVsQqlD582EKMHgs6h034/fC+FVWiRKi693Y2/XBzY
	PN3ETRC9jDvf5RMlIVxI9D9Os06SgQ/Avb0eWFhsOEaHr7HVr8Y/lekIlDeZSDYt0fpWLzEmqfOmP
	LzOx4JMAEtjiL6R3YEE+eV3c4bcTK7cPhJgu5elwXkC/zGji/72CC7ni/BJvtgtMZV1IWBZEDLViU
	eAUpa1cFhLA3PKXnOUitek+bQmQsIg5Qado9FkcT5fw/0zHAZpsXwI3z+LrKlqEKdjnSAuB/NSI6o
	5nEn4UEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bEM-00000004ugV-3eMl;
	Tue, 15 Apr 2025 08:01:18 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b0i-00000004rRQ-0Oux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:47:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso51157101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703230; x=1745308030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=GBl0cpXwuJslVtKmBrnBZ5NDtxxoOJ0e2sf/EWkLFn5BKlQ+vfmpkQHbXmMb6UCZQb
         kZL5aRpgo3f7KoRkHJ9JoZoQ6rRSX1fppyJ4J28YtUI7kgoyReO9u8Dkqn/o9zHl7der
         Tl06/Mk2HfhtFu/rxuIE0mUO0Q7SEn0PxgW+sUc6t7cESoydXwjElmeDHPTR60Fa1Dlr
         QXmVOTn1W1NUk+e8U9C3UtsNgfA9AgkZs8TrFhc7kqUGxoIg4kz++c00fLYmyQ7VzI7U
         XDIvsG2FbfEtB1I6n/ocOMdRylXDqD9K460w+VPhEtSFTBcVvwD7XB+WDUZh2e+jVSTC
         ex8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703230; x=1745308030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=lkT7f0u0S0Dz4THqrskHBnq86LkzgmXDOAFnk8QPeuL6+5Q9fE/cgyNtOh085OAQnm
         +Yh2LdWRLZUwhCuf3HNvQjrZiGT/nmCh24EY70nKdJAPR4nz6GxkMh/I+EA6YBVls1NU
         Rcrq3nCWHgc6OU1hzOCE+K2qA7Y2qXP6f+Ql9w6osuWKnLHaJ7iuzulgRO1QQ80NBt2y
         noPpaRG59zl15tt625b11tffemPqKTJnTo71nZPCyVds5KoqmcbQLaGCQ6G8gJuL1DGA
         WnvGrNyoYRIIV3o+NMNuDeSeUUS6dvTzTRaXPAhFWY1GbA2EtIvqflrM52GBcZUXk0wy
         KYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhfyafwqL3b+4FgNHEoTy8c4pwkje1OY+l8FH662c4zOICMotmkb/KnpQ+Jp9pso61hsrj1w1zzroJ4WOaG32v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywik5FEfNb6bmSmkdeAk95ZMq2XXVbRu6r98elV/04o9y02alrO
	RJ0w1zbUx6cyxyWBzIsf1gMEeZRx8U10nItdZLhJuVG6YJpIxjsKNPSeUYwSGhRbFeeAo2yEcVq
	KHPV7wbaxTfsThcZTxvuW2XfgnsOiwhkFHqqKSQ==
X-Gm-Gg: ASbGncujhXXCn50p2NCL7vM/yk45hS79GeHlYeZGxtlKBJOlL4kk7ndEDG/8eMFGDXc
	5stv5uX5V7Qk4Ae4irViChwbM2ehg/J9akdtAxs3oMTUc7/xf6VzG31SCWofaO5QNdjKHqWfReA
	sYNR4VEnC8t7pla5kJ1iKP82jwK+ji9rj1
X-Google-Smtp-Source: AGHT+IFXq663dVyU8zMw2WCvomgufBQU39frF7BHP8IkhexHxE7q25QYQkfpa6jUI5F57/EgxHrlEfhdYTnxjnPcuUA=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr55920011fa.34.1744703230263; Tue, 15 Apr 2025
 00:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250329181506.890043-1-john.madieu@labcsmart.com>
In-Reply-To: <20250329181506.890043-1-john.madieu@labcsmart.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:46:58 +0200
X-Gm-Features: ATxdqUFkCKTY5402WfMD7L4Dn66nYTF8rexDIKyTSCReHIobCScCzKD7ElX6-PM
Message-ID: <CACRpkdY30jnwByCpsAR0Hvmq-WWMRcX5-2PtVtOy-_TD4GrHGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Make regmap_config static const and fix indentation
To: John Madieu <john.madieu@labcsmart.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004712_129848_0D71DB8D 
X-CRM114-Status: GOOD (  10.06  )
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

On Sat, Mar 29, 2025 at 7:15=E2=80=AFPM John Madieu <john.madieu@labcsmart.=
com> wrote:

> Mark the regmap_config as static const since it is only used in this file
> and never modified, allowing the compiler to optimize it and enforce
> const-correctness.
>
> Also fix minor indentation inconsistencies in function parameter alignmen=
t
> to conform with kernel coding style.
>
> Signed-off-by: John Madieu <john.madieu@labcsmart.com>

Patch applied!

Yours,
Linus Walleij

