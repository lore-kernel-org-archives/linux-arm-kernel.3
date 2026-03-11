Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F32FD0622
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=; b=r3iInajrDP8vXIOhGRJzULqM98
	zCkuWObwU2iKMUvu2fFlW+lg5ZeyXzdiaBpRGCjxioh6dXv2Z05EgDCFsorLBt3JlCz1pgLSq06Ch
	GFEg6zhG7CHFIKYr+PoKd9wde0YjSX09d74RxYkGTBIqWOJyDuhyE505EWIrw/RS6ORe6IH4JZWOs
	aKkXDkscmN04QV7+e1+Z3IjvPwAyPnEvwBaE4LBQaRaCWFQSNY5vNW72mneb+I8eucLxd8KOidfix
	t8zJJfdkeYAQ2Kt0NVhS6GzxwRtNr/7R3070XP8xBW8vXKy2ejtxSwgfJsBDtaD7e38pf+24uUO37
	XqaMuQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0D6x-0000000Aw5W-2lXf;
	Wed, 11 Mar 2026 06:32:03 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0D6u-0000000Aw4w-40MZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:32:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso165733386d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 23:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773210719; cv=none;
        d=google.com; s=arc-20240605;
        b=lPquMQ3tVfBWG63iA4M8ik6H5gF/gFlyu06wLqzP8w9lXsBTr1YwcMi4dvSNRu11L3
         XgJuljFHZCyRpfUAE7RLd+oMf5wJAZNh/BH6PLbBM+R/CCIJUwsH9y6G2Rtv3IThP1/7
         8F3G/H6xx9nR7yXJqMRLnYuqj96OM2qzGKYhIZltGN7i/FGoEGKuz3gkPWutatY7lfzR
         EmdtyMST49zYef7L5+qgWozV5C6qV0R971SdMJxXvBFNXcC3pRIz7Jcnr7cFtzb0GkhL
         CdyHDfTNCJEH9j4SgGrUrWKY9hOraJU3oAWhEIzEbrLFr3P1FUWHr4MKMf5DJbEs5Kmp
         rAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        fh=yDqADfyVpk7zJLezezAZevGZEiIZJMaH9sjFL1SrPRg=;
        b=Vv1umHb1xnZXBmc//Yn/iY0Xh9Si5MD6gAkIpuDrRE5LLOxS5hLWu4YITlPRTqNcfW
         1482XZINvR5OIcPYpAEiLiqZ3nIbl4v95a09B7kyH2lKrCVlj+ZKnLZy7e+tXpS56z+W
         alTPOQj/EWJX4SBpG2xvnE5SxGqXhrcRAk+rwNDLWyjMxoz4ZAHIrpHzOjhtkDuPaZeX
         puFih4UF99lIw2Z7p1bycj09RXPjeTHg7u0qiWVNIQ8IE7PLs15MJXLqlwuVGWJ7zOIl
         ae7gCfAcescgwNo4EVWAU+FbsJZhfDY5kiprJcfQns8Pwt5mytdnNaH//zxpwCezb3+c
         KpQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210719; x=1773815519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        b=EJWxEV+ajzkTSF2vC10cqLQdEqe1RuL/6/gALIOOA5hEO0/yQglSMSLZw8oVpeOR3e
         RanQtz62bHFmoE0R1y+C+DISf9LQZmQlcrm0WmmWJ9bm9P/8LqMcAhORO1vWFy3s9ejS
         vSnmNJ/Jl1ROBZjU+hQamQet+u1AVmcq6FL8vJbjF4fU0bNYJLgBGq+o0U1VPiW0rAPw
         j/n3Yql16L6t2cy40irOYH2vASEV5qrI+LvbE1HyP02IZRGPVIWsXZD4yzz5q6Se4MYd
         eQfFFEaY5DhSSxFdurszJEoGPPIYG1gXKM5DEGyv3P16+xk0e8bQRn8pIvB2JvXLSs7g
         bq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210719; x=1773815519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        b=YViTRy8QRm+tSlnOVEQsd5PXDWkUzWZzCdXGGul2A/Z9O1iwMsLFuZQQNq+5LVQxSR
         Ft9Ml2007w0rVoIOYInkvfZX0RN4VDE7wjXovJIGO+3L4YiOp06pKSEcHoTLWg3eDAoz
         TnIA0+48rpExVl5zeJsR79r2c41EX6QSg0fnsSXi13SKEc9VRzvkGwKtElJgWWJaXCrx
         JLKlaU5VmswWbt6yDl9SIfdgpqjc3YME/MRKcdPxOZviqTAuVA+C7Zm3p7VYExt2ONkS
         hnHjYWHKwufchAvI5JrGlD2YTu+SJc3kly55UbED0oQqCrXvyU8gaEpGbjEAzzKyd/i8
         viyw==
X-Forwarded-Encrypted: i=1; AJvYcCXBdwqDsv18VmHPqbm13DqLEIv1aEXmKm4YK8esEardPAvvPeQCar3x7dK/S4/AvElahaHKs79XTQqWLGxr/Qk1@lists.infradead.org
X-Gm-Message-State: AOJu0YzREgqVMLgFBEMcu6r5vJ3Otoq3t+Or9uhhWo3iyuROdcHbTTxT
	YkIH90mCEZrmtDQtrF2YKqiW7w+bIsX1wLJjo3S0fgalA93JxZekk9CY3Hz2b150j/HqlIO6JYO
	/HhE1O0zy5Rpg3kFcelB1W8lYHGjo9y8=
X-Gm-Gg: ATEYQzzGof8o+Uir7pSm+7FyI6Y/hWmMPZBnAfjGANXTARhONcW8OweCrSSQEGd0e4H
	SG8lFRuaZVL8Av47KP1mAVyrOK32Hu85VmL63J8Q26S1tLbqx5W4fJH+Lobpeqdyzx8ZrVqPGj0
	bh0ou/V6dSTZYPCq9DqgvQbmk+0/X0p/9mpqBC0G4JfCxbtFnIvDHi/VPk/lQd/XYkN7nLFx7GW
	FYPmwJTc9bIejnfjHlIBdy1dzJbEHBq0z26vFrm30I4NtAKL00m92T4nfS09EGSF8Ly83KaKZ/4
	rkfwy7Dk
X-Received: by 2002:a05:6214:62d:b0:899:e919:2a7f with SMTP id
 6a1803df08f44-89a669996b4mr18786536d6.8.1773210719514; Tue, 10 Mar 2026
 23:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com> <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
In-Reply-To: <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Mar 2026 14:31:48 +0800
X-Gm-Features: AaiRm51ABuOL_zc6873VlOuNdm3hfQIVCU11Ut2lHruAF0li-NkozYrOk4XKKnY
Message-ID: <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Patrick Williams <patrick@stwcx.xyz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_233201_022523_A956FE4A 
X-CRM114-Status: GOOD (  13.62  )
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

On Tue, Feb 3, 2026 at 9:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Feb 03, 2026 at 05:48:13PM +0800, Potin Lai wrote:
> > Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> > devices connected to the AST2620 BMC SoC.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> > Changes in v2:
> > - change mac0 phy-mode to rgmii-id
>
> No other change? Was the previous version broken, and never tested? Is
> this version broken and not tested? Is the phy-mode ignored, which
> suggests something else is broken?
>
>      Andrew

Hi Andrew,

Sorry for the late reply.
Both "rgmii-id" and "rgmii-rxid" modes work fine without connection issues.
However, based on the scan testing we performed in U-Boot, "rgmii-id"
shows better coverage than "rgmii-rxid". Therefore, we decided to
switch to "rgmii-id".

Potin

