Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D56C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=; b=OrSoK704+UwFXR/FY6usMdbJOm
	TV0wt3IuqqniPLOHGKIrzPB5B0xhzc/kwTaZpkdfrc98sYdbbJz9hrHfH/K9+RkCOR4ZklJL6rKQe
	TcS9XYahbv4w89U8tQ+YU6zM1TxuHNCWW0j39sxyIvmoeRhha4jFdxTe9ByxctMz3rEb5n05EnCbp
	wRPyQbxiTBtHo4LvN42XWywnoRzD5Mokstbb90VS56nziMobBS0vlAJisMXxz/k3CqEt4G80ZUawu
	jrUNWMZ0wNPFs8kfJpRzKRIgI1f0tI2X4+olYY7hKZj7/oXY2CjoOy1oXoFKOCj+y6kDmrdQDZU0M
	8WXTRRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvv3P-00000005zE6-0Yxi;
	Mon, 17 Aug 2026 10:58:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvv3M-00000005zDg-32Eu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:58:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso34711625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786964332; cv=none;
        d=google.com; s=arc-20260327;
        b=oS9cTYutHqeYRRPfO/slPvd3SrEAF8Ldj2Bj7FGjAingMz6Z0fpcXgGi505MM4tTPL
         6WBEd80vVkCAd+d8LB5PJGNwaJKT1StPR2+ypF62vp3D43zYXg4LDeE21iqmgw8XsFoO
         fP9N+LRa1wGSJgQgbiCpWQpbutEaiZtl3kPBe56YVhqzP7Rg3QApuVOZZ+Jaiy77GK6B
         fEaDzQ+TcQwe5aI+huFrhpL0LdrxRFix3xmCiJcKPeolZ2QFXxC7Di4y2M87vY1rTyeG
         wU9dNq1iiXz7BOo6IGyA6QImIby2LBsfe5lyZm/BdmT+MrFf+DxguL4BuaV7M6LeEnDV
         DnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        fh=U14QS+ciZo9jNS7DprLSnvQD1uEqpbHDNYXtsKtYPsw=;
        b=O1vZ7N6egUO4P4OP/GmArUhQgZhYTVBehrkVtHorti90LrwDd+LuvLyDYbqIBqF/OC
         o4WIo6ufBaKXu2wx0GFxzs6W0cZGEuB2RBeZvaYBtpzKwPPcVMm606sOiPb6u4DaN9sJ
         aAzEWVRXiAPnek8C7je4tT4wyFjpVXqVZ8tKKxuLSPuV6rKMMg+KT8klf+e8Us2kp2B8
         6xp9vBiwtGX16CTxvauu6sh+aKUnFayrma2UhWg3TksVGQ6G+CRHMMKw1x1HLUxHvLWC
         ZP9c8D7egUpiO7p3lxCMMRMAHY/+cPnDQusvt3CXGfq1lhah982JDdKqOBVj8qGFhw1x
         N9pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786964332; x=1787569132; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        b=Z3OY623x9Ikhe+S6Zq6YDWlN0cl024zPKqTZmXcmaNC6vD1BHZI6+FtEbJXNkWx7DK
         WGeyhT8dlGSauLjlp/3BW5ai7zuxBwNgACleC0z0awGh0oW73ulgHcnfJBCT0Ba3u7Bu
         5jMBtnxWIPSTpoKZ7MZBt/9Ne3jIJx9/+b+wkFio0IvGJZQYLcW+H8AyuK+b4SbcsuEa
         WHWQIly2X0qHUncUfUcYUS6EL3NfTIJdOALaS3XwD3fg13Aw/TZqMhmOGwXrO33JQVk3
         mtim0XpWY6RMuRqPvKuObJ2hECsvrJ6ytCyGkbHtbO2d3T2AWC9+6ygsddM0mG8iIE63
         Dnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964332; x=1787569132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        b=jgzFxtx6cay4RJYA+wj3fEBlu6YNrGLBkdmzNvKKlNML3F4fkZ+6eEK45DClkH6R42
         uzZDVUUK1NhVyUi6Ty2rKXIgkyV7hekW0dS7HYJ5w2I24s7M1JNf9Wqe8yASYzXEk6Ap
         LKN1NGqse1qEadOSb3Ej/1auY4TAyAGHA3d7vBaU/il/ZaOgkxy+fIvUE1c4QyhLB85Q
         L9wuXS9POXtIVPwbyKrEwYZoFJ+S0dKU896rkcRVKWJ3pG1aQljHDef6btd4ehCJHlKb
         8AvPvMlBEMbO4U8lX9O9sRhb0HWN/XTrov4VhRSsg0iVvYszk6KjXQt5YlnKshn7Tcts
         b8Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6DcgDKX1gqRoB37jl/78EpoJIurED+FI4raCH9G9ISiiFe+zqjQtNx8mY9gmT4FeEo239V59nKs7I1cf7BRrG@lists.infradead.org
X-Gm-Message-State: AOJu0YyvqvoFUhRbET+OeAF3h1OlP3KVBjw6CdHOUtaw9UUuBRx5SSmB
	A6slbqfkWuvG8vrIg0+urzopTV9t4skza1VvORZKu0qdtzHRvEFwjcayqXnlgtOWtARhI/Pa8ZM
	YlOq4ELjuyytQpEzRB0RL/RhcaQpEogk=
X-Gm-Gg: AR+sD12h1n4GbmN/4NKhOY5p37ltnRufr08ePBnAvzTk4URDD43ChdDSvzhg/YRdCKP
	SIb/NWjraZi4BIHeSZ78VXGUKv5mizOPGShKs2Zix4D27dj/ybXN9iRK7qjFQ6UVHneQm0acvNR
	U2mV5uU0P+bna+etKFbLkHMw+qpm29gIxWQ1oio1NBtEQWtJmH1GQFpIG/V56yMi5Gat21VDc5w
	wcJCYt2UoY8Tlo6bEcVG2yPJTE6wl60OOmgnMUH0rFInl9gAwbQglnRpLJToENl33LEWrr7u/YK
	ryRRVOu1sPo/PYZ3p3HAhqGq8tk2QpvbCANWCHh+/NPxc/HpoCvnF7VWvZem4tFVj0zf2dxgGpe
	1Yyoj+1qAqdK/+NewzZr947l/hwV/w6hbRJ7gR8D2mJc0RIEAqv6LslcB
X-Received: by 2002:a17:902:d4cf:b0:2ca:660:b1d with SMTP id
 d9443c01a7336-2d3b0d5eccfmr247797795ad.11.1786964331843; Mon, 17 Aug 2026
 03:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260813042012.17631-1-phucduc.bui@gmail.com> <20260814170001.GQ265046@horms.kernel.org>
 <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com> <20260817082119.GU265046@horms.kernel.org>
In-Reply-To: <20260817082119.GU265046@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 17 Aug 2026 17:58:40 +0700
X-Gm-Features: AcwNN1XKH4dVb_0RJE6LwSHqmPfYDPdjDqVmlca3ZOszbhsVaf-YGJmUq6V8L8g
Message-ID: <CAABR9nEX8Sc3dSO+XfA5tQNjGeaRKikS3ijJ0Eaf0pAKq87LQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
To: Simon Horman <horms@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_035852_763075_E7FE0022 
X-CRM114-Status: GOOD (  10.28  )
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

Hi Simon,

Thanks for the suggestion.

>
> For future reference, I would suggest including something
> like this in the patch description.
>
>   Found by manual code inspection.
>
> Others may differ, but I would find that helpful.
>

I'll include this information in future patch descriptions.

Best regards,
Phuc

