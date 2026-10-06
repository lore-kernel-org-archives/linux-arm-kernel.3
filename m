Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A3CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=; b=cdcpudOZbn/i1QRdVE9LU1CbP2
	zPjClNQQvJbyRwLOEQgMv/XxHLrzQO7pK+ISKxHCsolu6Jfyi+eaI0/WUO6Uvr8WuZ+xeXfrsDpzg
	VHl74OFMZp5r/Sa4yr2qjKL6KcBYlnd/vHNi1Nf3AY3wjFECp+QZnM10eDWX01QYcQrIKyLNoFc+V
	13KBzp8BVEo69QjpnTJC9cJmfBME/8+OOzYJc4f/JimLdwU94zjG9DOpJeJITABdJvGFfqeSKmRvY
	ng7zM8FcLlSRjyiE3IBlgnqL2+PnZt2chHnD9eJ0vgTmap7n9f0pKH73Wc7Hoqf6k4ZZxi3RB2JhB
	I7/vOYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwu0-000000001e1-1k0u;
	Tue, 06 Oct 2026 04:35:44 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwty-000000001dd-0m1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:35:43 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1237338137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 21:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261340; cv=none;
        d=google.com; s=arc-20260327;
        b=SUhbMHZfpXVj6J7D8dDGKBibBbAUIsfPQigOu+15OOFt9t1jxEXTQi9EqzjM0eIp4q
         AD5ca+w4RLTiZ/S6G+0OaIRMJ/zNA7QqXVGYsB/GozguqxZKuhvZUOtU2nOD94epRYcE
         0J6pyaC9BMJych6fcnc4h2yZetK9DOzJv7nykARIpauTBb6sY8Z1UadCHEGH1TpBzoQG
         FtcFE5K2vYj3gLAfS9cLsHuoXndSj4mC9hs11esZwyDclAatVM6s5DE9gIvznYWAVTS4
         Ef0kZ0t0dortAVOKDpH4S9NDWi25Y1gd2c05aYJWKLeHVgCIwdFDgG/skV41bKtSTtY0
         AdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        fh=d+B1LJEYjT5+MOQQ/319iFVxCo9hOR0qD0+z8X/DmDI=;
        b=YYh/Sh050lKOnufSmYNlGT6WG0+T3bYg1VoW/UdqcJRWAO3cYpRZejFui4um5a5F8V
         iQdQNZIYdsZ6ZivcYW+7DSNBol2fsqWB2pOcRklHPWEbUyOU1ngeeGHIXEeAsWd5K4w1
         rI/oWuV48o0E8Xxzr/vZN1trubFmBDN6stgwcHHuCg68VbjX9zpsLkaxypwWuqIUWbxH
         BmEUuYa+7/6gJTu7aIb4vQeaIm14zmY8HRzsnj8Mbha0UcjVqd1uU4vEZ1QuS8hYKQ1q
         xLNELmYdP/uCmWhNekaU2M7Hmhh9irxnXF5bGtFu10rgZfyFeEcAtX9oAbm3H5VvW2bf
         VpVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261340; x=1791866140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        b=TKBJaFZpjJE54uN5w2ukfVgUgUYgtREcjBZRjZt5GRQ+LH6tEkaKTvfo6e0JMuqm00
         0Sw5p+1NPLEoIen8HBv4jCXn5aZ91rWCMVoHCTIAHFGokOlW9nuSoBNznxjhwwwejrdW
         unoXag9vdfxOo/+uNpN35C27pjJBGdZHGZPWmQlXq4Tr3CRlEUmdKgP4P/FDbfQct6jm
         NjnsiB1E9PijJBuO+rQf3xSxIjfjzq7vpxFIL9RTas+dx8RCEKATian2IbG7CplWQ1Nw
         TMtsd3kFg0nkOhIFpr2JbkNFlcJfv/VjMt9NJsdjEmPgApvPSOVC0lk2TdPOrGQ8yKDS
         eLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261340; x=1791866140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        b=0AVS4gTUGDbLJGLk+EPrN2O58Sas7Wk0PQ9HO9L4oWnLRyUACs5BzVB/7zjau8Pamf
         MEUe6AzQbdnSvdE6YfSPF3lDsqbRVWrRsXpiCUtjOuzT8b2ix44mrDnfdEKpaPebAQr7
         D23qv3iMtavyP+aY8DycZgADTwkKHE8t1sm2keJUGvKXc4iUTU++7tJe429AVxVkAfhN
         ad3w6tRwELlkJ5o/Hofyd0i0plzGTdKoGiaUUavotdlT9/a0nsY+mJ10g04IC4VZ2yQE
         gDuJIrpKpVuPkbSRXELve9h+JgcHyG93yoM+QpO20Y52vCmF/WEFrY2zv5ZN/8hy8+ox
         +B3A==
X-Forwarded-Encrypted: i=1; AKwUvBzmctOVHXbudIVxDHGu0F2dTIWCbWxdkBjXw+2/ICXw2bXvRybNJo57zhL1xx6XcKCfC/ryx/BvCoe9cFl5BjIu@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0odAs9f0HRhjj5Oq9GbxdG8e9qn5SMU9//AEo1UxQK8Lx/9Ch
	v/qelIZJNPR67k4NUx2ZlB37JxKBX54e0/aDYgU84yqvH0jC9/YnFpyZd8naGfT555IR8FSdlNm
	G1zdmi7Wq9F5Iq+enOiVmcgW7h+0X0Uw=
X-Gm-Gg: AYBFou1ua+pW6NQEqixhQemKEF8hTeo9E34YPSn5gYbaNqCfrrxiYPRseS+w05Nbnes
	TL7/pXY1K+qAbcP9xMDg/DmvF2XRyekjOtLJo7hh+EaJXenoRWz/NRqtzTinmvj9i4OKr+YaiSu
	bFaqbwnevuNC+uDDysAvrTBrMHbcza6nYD3Wea/4stxmlSMuQpXWZOxtpfx7+yh6N6QKNE6Qf/c
	52ZnHyvUQr71xY+BXy9gh/9hY7vm5mNVAitwyi2tcHY8ceYoGdS1tuwC50pAD/OAL/AE4qtNEi2
	ybGCusPbZ7R5qqgmgruBiZN/ak1BW+Ce+EB5FVA5UpX56ZiIaDcLKZjGWAozEk+YmaNH59nkpk0
	P3f/GUYhExHUnCuCQYtla8IVOxfsqKIS59w9DBebyEzqLzyhoKgmm4Qfh5bKmrBHTfgdNd4ZkU9
	nrm1WLgBWVRfdpPON6y2fabIqLKPFcM7pOJcpGqIzMeo5TdQ==
X-Received: by 2002:a67:c797:0:b0:7c3:b15:a982 with SMTP id
 ada2fe7eead31-7c30b15f25cmr1646552137.31.1791261340552; Mon, 05 Oct 2026
 21:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com> <179083074323.31693.13810000342248985832@kernel.org>
In-Reply-To: <179083074323.31693.13810000342248985832@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:35:29 -0600
X-Gm-Features: AclHuK_5yosJZXY-86dv_CDJAmAQ89oJW45GT0FAUDHPxv4gaBrZRXrpU3JuWvM
Message-ID: <CADvTj4r7KEO9KbGiMJTOKXRR4J_A0QMHUcpMeYaxnftzSbLtsA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: take ownership of saved RX state at poll entry
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_213542_234810_B531CB99 
X-CRM114-Status: GOOD (  22.19  )
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

On Wed, Sep 30, 2026 at 10:59=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found by source review of RX ownership and teardown while working on
the larger stmmac MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The stale ownership was reproduced in host tests of the RX code, not
as a physical-hardware use-after-free.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The changes were included in earlier integration testing on Allwinner
H616 hardware with sun8i EMAC1 and an AC300 PHY.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

