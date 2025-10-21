Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A313CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=; b=dJOumG0D8cRT1PNnqijd1/6Vv5
	c84zfD1kI2Gs9etOsH2s2XU08aGeMgAuWpbwgTCZ4+fgpjZCbLrqsbajaieLTtslme+5wV/KOkKmH
	lp6JZD7h6/f9HXaberT5f7EZo6XxZqCf9DV7eufcodOcfP97TV0hjjtg7wl6WAUkOtqSq9/i91VMC
	HuCkmKrSDR2zBAXudSnPMEbrV0/XMTcnwpJ+elUv8sZUeQowT65u/WmAYl5oqwcSXRIPa0t+TAQ5b
	RDnXM0ZRXtFv+2dCs05uRbmagptFtFgrv9r6swutJ+0FpqMnAM1RdAtCwbfbupyH8fLwy+7DtYUJi
	yPo6QFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBh5-0000000H0je-3Um7;
	Tue, 21 Oct 2025 12:42:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBh1-0000000H0gV-1RrX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:42:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59070c9111eso6103876e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761050541; x=1761655341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
        b=n9PpaH2nGYcVDB8OAP+1J1kS0V7L7j3dkmgSdHEtc7/twOhjnLYAzrLz9LeLzXXiTh
         fOwwXfDR+FEHLayctlF9rWenUiHyruMpAvRWtisJVJljZOiPDoEQa2Hro75ydOQn6Wk2
         by8D8tjweT6zuT3KKc2dUuFNqiT8kpK7nnQUme0es+zRPNgcNaxZE+L9nb7hCKza7Z6O
         5AhvdQ4okz9kqNnUrJTsWjWvmE73qRTV7+5ozLAmQnjbA9VE6Vsc7N3zZohEoUfUGSrs
         rg4BdCJgoqUO7ehNPb8hdVuPaTlvAFQ3B591QGTyNemqZjXyHLW5NzoFxUIdzwGEt0ov
         3+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050541; x=1761655341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
        b=ZBfkKy6A17mtg3l8Pl2TnT37uO2kbIhGZAG1Mz7Wq8GjBuR4m6RoFLzF7dVlXuwkYc
         rTXn3hB8v0hR+4vur51jEp6xClZW1Qkn4Ry4OfH5X7QCXiR65wgGqQW0p30Rb+GUQ997
         nJs5itVZRNc2t4BGulbBl0gAW+aBqmYn19SYU3sXAOeIZWtHMh1Tc5FoDK1y06X/XUEi
         K/EXjruAhJnk6byQsEprAtjZkVLHJB7fGIzpIR97CpcWCbpnbLzWv1wiZ4AtpvYKjjiB
         JXyvttT+W1uqvOYMMk7vlaUuj57zzwtOv65rdLNLtQMwxwjtPVPQ15JU6Y4FBV2GP7e0
         SuFw==
X-Forwarded-Encrypted: i=1; AJvYcCU9nr8Hn+Bf9HLFbgHEZFAnXIEl+mk5jxYnwuiQTZJdRaVWtzBfXo95mHhPV1Hnk1a8oa9Gk0zzVNJgx2UT1Wmd@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ11tYvQYp6dQGFM80nPcCs9C2LoxifFEbvcvRxVzwZghpXCvK
	yDcThIPzyovda679mDSjKDwb/OdKs1iCXm4PPiuNqcUSBqT7+4oYgjaZy+TJRfjIwfHMcAaAwyd
	yUGMQ4TzUj6+8T5OWLiDXI5kJggDOZb7IKqH8tXHrfg==
X-Gm-Gg: ASbGncstAWCqEEdx8KEu5GUoXgSlIXd7u0yUXjqo02o0ql7glFxsvLmnPeelu9T7KIi
	9tocCO8xGwM9HBbh6hUk6wK1IofpOvypSEoXWmnML9Bjnl0oC/Kn0rcHoqDLBRIgt9+FlMYBCZy
	7s+LgjmbJuBqamNC+43Y50qGIk2G023wlVv8NSx8hjX/9gV3juIm4V4gyayaxeTutIRz/9lfjPy
	Ky8OF0mUszrLK4Lm5Vctfez9C7G7Majy7F7RWDrnHFuT4qc1LSqmk1rokGaF7x1j5r9tdE2d54z
	8FBOf53c3hjEU27I
X-Google-Smtp-Source: AGHT+IFGDPpBTeZONomFBAX1YzaiEBTSDtfpfJUCvTHtBOgU4ya2tYe3GNuR1bPQdzr+C4NaB2OPAwZEOmn27L5nTu8=
X-Received: by 2002:a05:6512:b1e:b0:58a:92cc:5819 with SMTP id
 2adb3069b0e04-591d853543dmr5476524e87.36.1761050541329; Tue, 21 Oct 2025
 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:42:09 +0200
X-Gm-Features: AS18NWCRXicscJ1flw2qh-h28tM6CuC6Xw1MuRCeg5_mvREPDMfXTaEvmtfWRbw
Message-ID: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_054223_437526_51063641 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, Oct 16, 2025 at 9:41=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> After the five patch cleanup has been merged, I will want to submit
> this for merging.
>
> The problem:
> - Any new stmmac glue code is likely to conflict with this.
> - Bartosz Golaszewski's qcom-ethqos patches posted on 8th October
>   will conflict with this if resubmitted (we're changing lines that
>   overlap in diff context.)
> - Maxime Chevallier's tiemstamping changes will conflict with this.
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

