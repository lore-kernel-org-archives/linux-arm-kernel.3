Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72263CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 04:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=; b=dKLIEa+4PGRn/S
	pB2TDK5Du75/AspPeYcDqTGUYx3S+2nPTwLExLSdHYUPmjXN24ewL4ghdc8p8GFqpcff7LgEpoIu1
	FiaFYnODWv7T0w82P4m8lJtpvIRAsDFZ8n+QHdgQyAYM5Y/4mp1XB2dxANhxCDKJkDhPbgA8Jk0af
	z66So0p0ObMshrEaESqx+Z95kQ69YoJ1eWMhSF3jWPfk4WoBWdcVX7ACUjtBFnakrq5qxu3rfdeIW
	EO80Ml6ftPpQkpm5XjJHpRiLrqGb4a1JFPN3EdGUUdsdotq0+HTTXeKpvwl12YZf/CMm4eZ21DXSG
	kf0gF74annc0ZPJsc9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukqb-00000006fjt-48eB;
	Sat, 06 Sep 2025 04:48:21 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukLV-00000006Wzl-3psi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 04:16:15 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso3590660e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 21:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757132171; x=1757736971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=;
        b=GZ0XQxp1MM8niUQ4L4j638BVs0UlHRhdqxX3zYSJbOCIvRiMz86WnFmRQ61uTf28On
         Dj6SovQIOD3NbeoxdmmnrdJBzMBde5MMwWL+CWvNgtM7ziQ0GeM0tnoYcI2jmzMXUagf
         HvUexNsXitBlj3Vw5C2GQM/Ex07yMksIDVAFY46kbmFJwrv1Nj8dQ51VYvWEOTtU7XwQ
         wYuIiPFPXBfQdiG+24voTkfob8KBiyKK1XL+45DHzuhx0/Xd9DvIHL8ViYK8cFoaSuew
         I8zMtMcYaO4BBzbDITyFtf2BBI2Mma/ZJ51uCHsRHmc1PW+RSX02EeBRh17dzTPgR/bF
         v9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Zhr13l5oGoli9aswzXMKRzMcZGA8vIU70H0OZHStzrtFhBIXiJT+QhfGiucmpdg37RZlWv0vslk6umwYYn/g@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc8845qAJF3fxn5/1X7pt/LyGKXyhQGzI/IoiiLqiC8j29ABGq
	YwaNuAyOBF1Xg/5/I5q2Jqp33wEkTAweEpTgBOVIl8hjv2s3n5lJUMdwBEeOVZn1lLE=
X-Gm-Gg: ASbGncs8x7emT/RDeSmZITcpFq8eZKyuz/4hl+tUGQetAJLp1oIfLhRKYDgf6CaKY2u
	FLhM5ULOvPq51bzefo/CTOVSI9+nLMHquTaq5gtZ/utAmYyPWPHSWPvnPHs00gA8vsoWwYFB1kE
	5jx2JtHvZ8bA60ED2CkrtDGXiijHH6w0LwV1wpH7ofyrnPgG+n9IZlWm+1hLteBsAYmB15cQC7E
	w0AnUgoUFYz7SXgTQzURGLftzKaQnKBxCfJcGJHdvvl7nXCoPY/REiDX6dp6BN3tV8E9+7ScDn1
	6p+BLmkJm+3BczPhMdKVQTn6ocQttfbW2oteS9Zt8lRZJnyQSz/nAqz1RTnOuc8y0KIq90680UQ
	bakoPoKqBjtRrFkoGvkq2JPGyoix4rT7Ql6VnaHFVCO7t5OOi3vF14hc=
X-Google-Smtp-Source: AGHT+IFY9/33+PnQHq8RI1gY4IRRzW8mc2U6UQKekPtDZiqFYnGxE37q5rY9tWj1Au4gIjPAb4TYPA==
X-Received: by 2002:a05:6512:691:b0:55f:56db:7648 with SMTP id 2adb3069b0e04-5625f535aafmr355681e87.19.1757132171092;
        Fri, 05 Sep 2025 21:16:11 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e46fsm2141488e87.3.2025.09.05.21.16.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-33ca74c62acso368811fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXqHWdNkLtnSzKBCHV3W7/K227UGBIe60HXzWrL7w2pyRrAAfMY1E/QRdKRE+dj14fY8f2p1hodRwJnKuZ/fml@lists.infradead.org
X-Received: by 2002:a2e:a547:0:b0:337:f786:2f4a with SMTP id
 38308e7fff4ca-33b4d8cb2bbmr3431571fa.18.1757132169950; Fri, 05 Sep 2025
 21:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Sep 2025 12:15:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
X-Gm-Features: Ac12FXxA73ZfGI4H5Rgtw7dq1dOBGNO-B8ktFeY3H3nm-PBpHd0UB2GulbKMsHM
Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_211613_952601_EAB3643B 
X-CRM114-Status: GOOD (  17.63  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> A few of the Allwinner A523 CCU clock registers introduced an "update" bi=
t,
> which must be set for changes to the other bits to take effect.
> Of the three clocks where this was used, it was always bit 27, so we just
> encoded this as a single bit feature flag.
>
> Now the CPU PLL also features the update bit, but puts it at bit 26, so
> this flag trick won't work anymore.
>
> Add an "update_bit" field to the common sunxi clock struct, which takes a
> bitmask, so we can encode any bit to use, even potentially multiple of
> them. As uninitialised fields are set to 0, we can use this as a default
> bitmask to set, so can OR this in unconditionally.
>
> Change the existing update bit users to use this new encoding, and add
> support for the ccu_nm clock on the way, since we will need it there
> shortly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

