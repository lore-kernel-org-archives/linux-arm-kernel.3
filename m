Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3105AFCD0A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 03:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JviHpxyLpcgl/qvpTFoHcGCNmAqz4TMcbMO6zivSxTk=; b=ToXeJGluQQ9iT/SiP/lN09Bl7h
	PlVCcbL7s4hVoNczldbVtjPS+J7+XPw13u4TeeM2Wx3tpBtQoETEVuAquJgcLjMSWyBN3O4vlDfgh
	ADj39el0jIBrhWiCl8UHRBKGSqq9G7Td0Cya0zyQK+4a3MbkOXgswirQspkOfLWuAUS0n2L0BAx1P
	Qsp1xfUqkt5jiNkRUe7tJS89Zj0tS2HvVKDTX5Uoa7gE+9may815yphQsIXbtavobr/qTR92CBrbs
	bakgVz/DdToi70miFFrXMau/9E01dcmMb8LvjxewE+c8XB3FzdYZHRtLeQmX9teMXnju6mu77rCGi
	1pVOMWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hrO-00000007j8L-0pHI;
	Wed, 18 Mar 2026 03:46:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hrL-00000007j82-0Up5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 03:46:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43b49819938so1054417f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 20:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773805572; cv=none;
        d=google.com; s=arc-20240605;
        b=Htcg0L3N2YnMmnTaMyXvR6bR1GGryUfU25JvNvl2hpdCBa1KZaAkJLjb8QW5s3ubL/
         kUJVN8/nG51QiDSMTE88l5JjbnLgMscUPiiN3yT1EbGQsqGuQ85R0vvSJYh+V9+Xn/Su
         EM4/QdvABCmIk0KoJC6vPLIrJvd6gkd/vIDLwD7Bdq/qDzKKvIaUOmtAc1EojPpM43S3
         +rw4GpVqeNKJIT8OG6tg7gtKxLWIRplRNUUlyT4PKiZu+SJb7sUkIVjefIWSgjUh2lSX
         Evd9IxLczeWT3GKQ4uMfPjnjr3dG4h6G+/RKF1W5Zx3/7H6Ya4NTvvOnyhrrcY6b3wai
         iNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JviHpxyLpcgl/qvpTFoHcGCNmAqz4TMcbMO6zivSxTk=;
        fh=81pGK0aEFeCDLEUBUIa+/wodDeqPFgaByIzgessRPVo=;
        b=i4GyIvcXdhYCS0A5jmBFHgTFDYo18e8fOrOCZWyp9mLdUJlgsYmQxlUzudCSw7skZb
         81vBgLCRWpUdEEYUELCwQ66qmYL2m0lidE414DVM32k3Al5N73zDVjnqHCd9jw/Wp53M
         ERAPGNia0ssiQm9PctFMMPCvE3EDs2UqlKc0DxbXsW+cK9qwV0eds5z8bZ3HCH6vY6B1
         URYBkXTdPciMrDsGdHuD/bledmcdiLbEr1APkLGygF3PwvjbqPyUnZoR1jQkvLyxWVrd
         kTaIxW9j59ZEHlzH59KhQSzuIXzryH8lQG2JgOEmlNnji5pZiOQA+rg2PhCllS3NciS8
         u5iQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773805572; x=1774410372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JviHpxyLpcgl/qvpTFoHcGCNmAqz4TMcbMO6zivSxTk=;
        b=O9bq6vopli7Bzkzr8IYb/GHUHBfQk40+npM5WxMHFfQljKOI2DtWt/TGzQL1uNc3vV
         sIeVStYKYmlqr7RPcq72T4/UQx21rCUqegnwBWpA2Ivo+rne2BEozY/E3BzjT0tsE/Mm
         fLBXUzIy3U7jQ+DIurWTdGVq7wu1j3W/wtByFw1CFFNJk26FfTSw57AXNBBxUiXwRWDS
         6KkTsLP8TqKNQdl3RCPDyOIpHIBABv1cCJxC5f8GAYpFMV1FY10bOVdONIBw9vHc/D1U
         aK5cEfIDt+BwN3GGIwXgSgllHB93Pk3h2DWD8juq3+sLTZ66GYRsB4XvXgyP6TLqxn8I
         R1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773805572; x=1774410372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JviHpxyLpcgl/qvpTFoHcGCNmAqz4TMcbMO6zivSxTk=;
        b=qdlPSKsBr4kP1Gl+ibOnAgAXck7hY4UsSdFefltKTDPGlvcIuBrtLWhy4h2dOhcD3X
         tVf7rJa6s7X3lpFZ9t1pwwOy+5GrBZRV/72qcmy5Bo6avfSDCTCJe7+X7N45vzMmZ0ks
         nIy74NLFYyPXsBft7ScqGsq0YFibmI3sCQJYoOmLkIE8ngTKp1MrrlxuhNDBT8sSgPFn
         P/WnQB6dh5GgQl3OAxKTb9g9DrI2NpbkwLypnj4DxYXAIkzb5kHkAW+Y5+/fxBcYU6Rc
         8I1qQu44Yks6S49Im+DVClPqzFeZ2vB4fnuYziuaZgdgVy7G3ZYZGhD76M6NMECMJv2g
         JZaw==
X-Forwarded-Encrypted: i=1; AJvYcCVNJWu9B66TZlS2ySMhpIaXdrWk5aSMQQG74QNXgkfnvEI6gczMR4/pwttdUN5OCFLmVM7WTOV6T7JIPgDCFCcS@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLkYcQcs2zIr3ZDxhdCfqIREIN/2mBCMZYlFNpSucLVDs9h90
	R0EG86dFmCmCqmuWIk1JHraqIXFHak0NqkIA6je+lWafb58vkRfqwjDqpj8ZoUO7wcSmj6PEFK7
	Wwmq2q7+MaP3ntkQOd7428X3TS5iKqX2DQAht
X-Gm-Gg: ATEYQzwwwGNvkKf92CUCayiSEQBQFgDvUzVCacA0duKOu/VopPoXYFRWmZPpAvMj+dR
	mdBAwYgqKl8ds1SE556tOA3LZc6S1ITZgQZ7WfxCe7vMElLSLYv9RGqpit/YLo5om6qXiEBI2aq
	4QRqh7GG8oe0v1uH1RupPGqpWFAFCjjPIekoJ1za6MOUD91VC8/zYff6JfMd2RA+WzzSEaRmJP5
	SSOeN+2mRYPNmEoHGEHArm85OAAJb9M65Fz0jOdnuiR90f7XsfqYZ5u/MvBX5InowcGz5VRXSiZ
	mI/bHBRefg7w4vFupbMB
X-Received: by 2002:a05:6000:2089:b0:43b:44e1:f661 with SMTP id
 ffacd0b85a97d-43b527ccd8fmr2614153f8f.36.1773805572271; Tue, 17 Mar 2026
 20:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260316021009.262358-1-CFSworks@gmail.com> <20260317202718.3a5433c4@kernel.org>
In-Reply-To: <20260317202718.3a5433c4@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Tue, 17 Mar 2026 20:46:00 -0700
X-Gm-Features: AaiRm50hSU97Xuq3EYTdeGqILyqHz9U06_MuFfNUARKHSSz5j_ncstmlSOR-uZ0
Message-ID: <CAH5Ym4iaBkFsAH6e9UgHbxOEs8D6-Tcq9so0HJ24GFfmnQiUiA@mail.gmail.com>
Subject: Re: [PATCH 0/3] stmmac crash/stall fixes when under memory pressure
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_204615_175708_A9B16C6E 
X-CRM114-Status: UNSURE (   9.28  )
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

On Tue, Mar 17, 2026 at 8:27=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> ...

Hi Jakub,

> Please (ask your LLM to) read
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html

Thanks, I wasn't aware that this subsystem-specific documentation
existed. The reverse-xmas-tree rule also means I need to move the `int
budget` variable lower in the declarations.

> You can't submit fixes and next changes in one go.

ACK, I'll drop patch 3 for now and designate a v2 for `net`.

> Please have a critical look at the commit messages.
> They are very bloviated and not slop looking.

Thank you for saying my messages aren't slop. :) I'll try to dial back
the verbosity, though. What kind of bloviation do I have? Should I be
leaving off more context, or should I focus more on preserving the
same detail but using fewer words?

Cheers,
Sam

