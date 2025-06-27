Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F22C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=; b=Bu6LP0O/R68dQcL10iAwYOp2EM
	r/+56OQMU1Hd8HckbzHCGSOfcJDAZO+a5quWjyWuQNM+9tE16PG1pcE5tulA9lJM/GWU582xI7IUZ
	OTGkSOQVYhZ25gQYJNBWJfiGLN8pYinJulC//UvRCHI1BexJvsJ3wSRp0vm7WUYGuyNwENhAQ80y5
	H6sdNnqz74KwKAl4FO5zO09xBXJeyscyaKK1iIIrfrC7diCGQXzxwNMe2RjYvRwMo7+RYCShiQXew
	Oc4yDvp0c6PmE8IcVXhXVYtTHlsmHNMtLiqjOiuvQ0+XJJRWNYigXxDLgEkMPxc316zjgnzKxS1mB
	/JqzTvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9WW-0000000Epr7-01rF;
	Fri, 27 Jun 2025 13:53:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8z2-0000000Ekpl-11Kt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:19:13 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b34a71d9208so1569703a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030351; x=1751635151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=MAfauzG+oR0Bk0IUFvWNjf2cFS3kqBymkptdgJE4LaP+BxcfhSClyYe30PmqSSUr8F
         Ff4DPh94TUY1hZlWv2qsh3gEthhBYwXmmH7VbcQvQrHZcnw1/LRlNdLAtZG2bVfYNapr
         3GIodDrd08+tW8ROhnBsY8MZ9gi9/+MFFT9bSEGAmjiNQC7lBDeTdAOEf9QZGvwWtMCg
         K17pRA3S2G1k3TANnwXagrr8AX3u0vy4DAOoUNAnQWkvlSGgle/hS1nowpfXRwlYs+ek
         30K/2uIZALk6Xl826qJ54paXsYu9uU7YmRV4rgbJaF7RJC2nlEq8rD6TtDtEZHPsPeua
         Qkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030351; x=1751635151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=FEhDD0TCgZEtZ+LXQA4rQ+fGjWSVcV0lBc3i+8tbM+oW7dC1eY+XMWv25Tx0BbMp/f
         X5C16tSZX/ilpQNTSMD0x/x1Q/cb179rehgYrJd9k53T4sAXKfUhY4ZgnQieYcIaVss8
         x2x6Bq1vWRB3vZ5wcJ10KXWMRN3xqLVU/T1f4xx55LqIWlcF6lycFqyPmcwi2eLDehhx
         VSFIxVl4K5GFu5UGxc7QPV7ynO5LupbOFa4W/L41K+Qi5+Ri4Vkq1qXjTUz37lWAo3AD
         ikZlvwYvq0pqzbScFzqivuhh0+f+zeEOzOmm9wgT8Rq1If6ZYSdjFF1dmZHlj0y2YeG8
         WKhQ==
X-Gm-Message-State: AOJu0Ywdt/vsfzVgEXplpVaM+jTPNG0Gr6wpek5mV97vgxjJ5quk3IQs
	UF8jZcOh1WSu+2IuXpWW+iWEj+l/kQ0Dmc1uDHzjtHL/ZochxvYMBfYENqkFMU3j7WgIA509uJT
	TcLSunI5L+Yzix/odR6AsMppllwUtG5U=
X-Gm-Gg: ASbGncsyufSWQifxpgUIWr8+mly2GK0LNaiiEsaIH6f6roFX6WdscKXGo69LC4pz3z4
	c2s5iuHx4o6ehUbCZEq64WZ87TwSo8SpDj9mPbnuvrRiru7eYdAhsp4UekAvhpMHLdtT/BNUAq8
	RYya2Jr4eTiHuWRP688MGM2LEfXYlIvppW55kuivfhcOQcazwq8Qqhww==
X-Google-Smtp-Source: AGHT+IGuDUwfIqzzDEvXavoJTZSrH/5OLn85eSiig5eyOQ5l/CyM5CDTHx0eNi8xE3Ifw6y62UefXmBp5cIFyf+XDbE=
X-Received: by 2002:a17:90b:530c:b0:313:28f1:fc1b with SMTP id
 98e67ed59e1d1-318c9225e3cmr4981774a91.9.1751030350976; Fri, 27 Jun 2025
 06:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-2-aford173@gmail.com>
 <20250605013023.GB29462@nxa18884-linux>
In-Reply-To: <20250605013023.GB29462@nxa18884-linux>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Jun 2025 08:18:59 -0500
X-Gm-Features: Ac12FXxtQU4Km0iG8bo0b1N6dVq9hbbMuCpXJFyZ-RZRycrANe1s_6GUKni-xpQ
Message-ID: <CAHCN7xJFm5qcnVkiOt2+vQG=oeys=_4gonc7BkMWbXM-p0iURQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_061912_279452_075C1F0D 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Jun 4, 2025 at 7:20=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> On Fri, May 30, 2025 at 05:17:08PM -0500, Adam Ford wrote:
> >From: Marco Felsch <m.felsch@pengutronix.de>
> >
> >The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> >VPUMIX power-domain nor their module clocks since the power and reset
> >handling is done by the VPUMIX blkctrl driver.
> >
> >Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> LGTM: Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> Just curious is there any issues without this change?

The vpumix_blk_ctrl driver handles the timing between the vpumix and
the g1, g2 and vc8000 devices.  From what I can tell, this is required
to make it not hang on an 8MPQDL where the VPU is not present.

adam
>
> Regards,
> Peng

