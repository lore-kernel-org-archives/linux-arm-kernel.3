Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B2AD37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hjPkkzMohS45ECF+5/vRW6fDsFf40jPRuoL50s4x7Q=; b=oEHxnAKgzMAYCHkOSH+Lq9PeZ5
	YH6WbG6nR4XUPSoVottEzDb3+ULYQM9BslcRvHCdDZuyZmPR1qvWwzMMdVuQopN9MDryyAGmgahKk
	FQjvGTEiU4ScHm42QXMjyu8/nCP4PqA+rUdLR9wmuNUW4q1WfttWK0VJNdAEdhU7xn98jmAY0Yhd2
	Ndsr+UIu0jXTyopO0rAAgmWd00Ncw3bO3yHTAwZFZ5Pk7ojHTawCzzO+BKgrJ27Y44PO+3Eun/GPD
	RDjcF4r1cSihOvz50/NOKZhOZEagfl29DliPy2B2z3bRKAYg3wChYAVlyY0Q59CBxmtteaU96MNGw
	50fF7nWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1f8-00000009TxR-0NHX;
	Wed, 14 Jan 2026 14:15:54 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1f6-00000009TwP-2QRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:15:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b7b27ebf2so5590820e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768400149; x=1769004949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hjPkkzMohS45ECF+5/vRW6fDsFf40jPRuoL50s4x7Q=;
        b=eZ6HiiXe+sUWNu3TMjCuGIDUqDBeDStxOKEdH7KEgyksisUfyVOsRU4NbRnR+N1izg
         /Jsq7dnlweOXzSc1PbKwcqyWQe0TNphN5t8lP6msOdfs0nxXU04MfgPrweqGH4Wnp2oS
         si3Q27PzlxW6FYZZdtR4612XT7Ttlui1JZiXoVJeB8bBJT0oDa1ScfwQnda6mxTF7S5D
         D/BTuKTE6R0i2Yow8/xhHBro0CfpzP3c0jSCaYpZVpBEMpO3VhaQdTNPuYyj9wyhenpZ
         1n8DzQCcHNgLXMi6UjTM5w9YFr55g/N4SdfRziM1QyB7kOioxvKCKd7wCNHpwUgc+BaL
         qC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400149; x=1769004949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hjPkkzMohS45ECF+5/vRW6fDsFf40jPRuoL50s4x7Q=;
        b=MniMk8cZK2oiLF6KL6RL7D3capDDk3w4U8GjU0n7zPXi/bFA6/cyZgnE4OcEoNtcJ9
         tTTFnVRgQAiL0zKFupxHcnSXQbpfV6INAGXGgAf1oovEBZ5U+4aWPW2OfUUP4tjk9NK0
         Me3Gl/01ccmuzvmbAOpL4PD1Unoe9LGppQOGggY0LNIiui5saA+etcuAZacK66HRFGnh
         ETCMNhB68E7njVxwiRH17OAN6/JAOv8xNKT2p4woGyO4r0TUvzMK5ElLW6RG9GMnbmkk
         lqtxZxK96tjAvTA1rVrqz5G2L9HFPaifGY83CdzIrZgAMgb8nIPsXk5vLk/zQbajFUNO
         Z20w==
X-Forwarded-Encrypted: i=1; AJvYcCXUiYTBCULFXH33JYgtWP1qz2XkfC3q18pz9F25t2Rb7Wemb0FhUhZ8wTXtOO7gGs+NddaFXOQcoWQAQ8opqtwh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/MYlNYvaKw2HX1WCuwxefcTXO2TlZ7Em8gGAMRbiSO2V0dwH2
	dr+76haFFSyxsyGBFvXVgt0gvdGnDGqdHwo3AVuapzKn/ZxETiWmL2Pe7F0RTFWaXuI4VupVpF5
	gqtSBQ0BdWD+Munwc+9iA5O5/ubyfdkADxq8ophfA2w==
X-Gm-Gg: AY/fxX7S1eNzdVGeX0509iP36Ku2lEPS/SIgo7LrtFRSAwHWXiz/HzsgcpQD1iGzQRz
	uN+NtGiZ6AYMhSU7HDScrNfkc+1FGT3iBrxLWKUu7GpGbdrhJS1QiEE1VXpPOqCTCrehXouGCHp
	gf6PXN0Z5+k+vCPf288kVEZ8BfqiD5E6iKanq6UbSK4KHfRtADZcWXUNlvMmy23gIVXQ0+kM03N
	IzcrAVjNikglkDDtsMKjUgZqIUfdauvscGeH0/MJOMH5ykTDDxPQJP0l2FNXVbVwgRrN3upPD6j
	7hXix2XiR61zhj0+ve8ez0AyGcYm
X-Received: by 2002:a05:6512:3401:b0:59b:794e:dfed with SMTP id
 2adb3069b0e04-59ba0f813d9mr955411e87.25.1768400149484; Wed, 14 Jan 2026
 06:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20251105152023.259813-1-marco.crivellari@suse.com> <176839928954.937923.15095865192573263958.b4-ty@kernel.org>
In-Reply-To: <176839928954.937923.15095865192573263958.b4-ty@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 14 Jan 2026 15:15:36 +0100
X-Gm-Features: AZwV_Qgj3UUsI_qnNsOnW1eSo8sD6BvrOvfDzZ-kVDXYnmGSUkrSa02nUWpKX50
Message-ID: <CAAofZF6n_BVQhoPGOc+BeKgBr8YncgKzkLrRQKDrZHO0EtUpug@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061552_623937_0802CD05 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 14, 2026 at 3:01=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> [...]
> Applied, thanks!
>
> [1/1] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
>       commit: 877686f9f42b58b04e4e25d07034bc95cadc20f3

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer

