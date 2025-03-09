Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8160BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=; b=ICRcGOUE4adscV+Bw5/bxrMrjd
	4WLiEAG96rx7vlMHnRK9Lg9anAuG54+h++JpvsNH5l/5fn0y0EARTGKq6bBSbsfewopUbOCrmbffZ
	bO1Qbi/5wKrvlmtKbHYMql6vz0MEeL/mbeJhn4xnyfS/c56h0G2hB1EWHMkHAZmLUIa6Zhmz9ifXM
	7utpppH2sG4BcQe7pRWXkrhYMxfWaSDUss98LBZ7f26gbCG+mz83OZTF5x0y8YvaM/71B2oENmEm4
	jMEMsH8jJoQ9H1/HSJOCjiAuJN9i21kUadp29TC62xwrfRneAPyhRzPjn1SL18yVDPksyzx9T9Tcy
	1GhT5HlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAbn-000000005Ek-0UTE;
	Sun, 09 Mar 2025 06:57:59 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAYi-000000004yJ-3A9P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:54:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2800772a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503287; x=1742108087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=;
        b=HWBfznbZ1CBFF8nj8wFvrarTM9yyN/fBeLdpqxGWmkn9I74Z7di+1SsVVlbnij1PC0
         wMw6sthbkEQcATLmOK4IGXz5a9Xpv+F73OuueBq2alL7bCxYgDz7GeYNXBK7ogg7SgjR
         IM5XFngRRd7i25itUUfMR74cmm2qOGRvEM4my3DILRrj2q5FS98B9eOIhWtVCUEoM/Xh
         nZFdkWiSKWntOtpAKFGUijKCWeJplbHPrScF8hZqkH5Et1OkeGHHzzmp/qLi2eZh7QzX
         n3fO+i3RlghSD4n3XxMhFYYmWQ3GzPn7C1Q13qeBnKznW6N+yiBXQ8liItGYrGG8LEd9
         fTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503287; x=1742108087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=;
        b=Wh/10g8Zg/2djZRxqIooLfLbVJp4ZwtLpGRDPTjz89SWdj8ywS7xilgj2fh3/Mh8Ba
         BI4+5Y7f+D2CTQ69kpws6Xw37QOGNN/jwQFdqoe4ZcCi4AhRjhdJnJOETRWM8uUtIseP
         qGbQNq2XrFlUCa1/f/zsX9k9hue+xCD/y6YxtgEyf2VU8yRZBV6i1VqsYEgCJ+5njRHt
         Ohz277NPAw9sLwru1pqtHJOIUcsNgQqV9nhnZJDyzB6I88Jiy5RDiN6NxatTDoGnmnAz
         QVhpyAL5H6j0WI/mD+GWYrxl4p19YqD2kzozReIqeCIM6u5OTlmrAahhaIxJAfVmRZvh
         kuCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq0Y9TTgKb4vTBfmP35aQ6EwYMyGj7fEe7EFvXlh0jAxG/E6R5AjXJYkp5Fy5Z8z1ow36M3YMNxVBScg783Z64@lists.infradead.org
X-Gm-Message-State: AOJu0YxCf2u/RZK1vmL37yesDhMw2nBgatw4G/k1yzbrjvxwq9tKjVao
	wd2nCKwN+OzCk2eLRhkL17oi7ee85PRhaiDappRGFl/4AeUmrVHt
X-Gm-Gg: ASbGncvxqrdvHFH3e95C+nEXmUizJVub7s7zja5qYro1nqIabsKkjFhRa4GeO3qhaJ/
	2IaJjTZU6yVCRIaHDT/C35tXhK3997xtJBpSPmmbY3Dt+/ILg2S0madCgtLa0Yy2XMraw7KxkYv
	opgpQhbTyFuB8lHD2sYrqiU+4m8rPVYlDzc6tO7NChZP2t7iieRA7W1IKZmoMz+f5s31I3aFIya
	w6AaXKEcqEa8MJCb5raBJvqR0XBU/N6B3l/jpNKlhjbnbHv3vHQ2X4MlTweMyNFqH6y5Mo4Sde+
	T0v4VjOZefF+28oJm9zms+P5RzHA6ZZUCIwpOz+f3hixZamWPXlErXow2oBl9glbxQ==
X-Google-Smtp-Source: AGHT+IHtiDp8gpMAsTaMMeg7HPNhPDz22dxUOSHPXpQ1ifUae7xqi3maop+iP8E/2ePHJtdc9InCnQ==
X-Received: by 2002:a05:6402:2353:b0:5e5:c0e7:f428 with SMTP id 4fb4d7f45d1cf-5e5e210296emr27185280a12.0.1741503287053;
        Sat, 08 Mar 2025 22:54:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9303sm5027358a12.42.2025.03.08.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:54:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/14] clk: sunxi-ng: a523: remaining mod clocks
Date: Sun, 09 Mar 2025 07:54:44 +0100
Message-ID: <3344204.44csPzL39Z@jernej-laptop>
In-Reply-To: <20250307002628.10684-12-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-12-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225448_793280_82C56064 
X-CRM114-Status: UNSURE (   7.61  )
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

Dne petek, 7. marec 2025 ob 01:26:25 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the remaining mod clocks, driving various parts of the SoC: the "LEDC"
> LED controller, the "CSI" camera interface, the "ISP" image processor,
> the DSP clock, and the "fanout" clocks, which allow to put clock signals
> on external pins.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



