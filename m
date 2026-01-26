Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D838BD19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=; b=PXWH5xe+RkP4IOQaQngiHLtazt
	a+Vcbwauj+o1kSwmajlKYn1DvEzNjA/68gN/RY+SxPRfP6ET5KOdHdKqenxEK2fzidjClAE+8PGD8
	ZYXjQKrfGyWT1Rv1C3+IfAeTrNiqQB4HnPGIt1Y8kLyhuvAv2F3hj/cy8V5IKCkDvEC3HLSPJeqdt
	5X+5Pt7vTFKQPsfF1Ciaya0T8DkVs0p2yuyzRRgKl7vC5P0wYOF4b9R1//qUbwO+mJcT86gZ/yXwa
	bl2g6mcbOBvtEEIlE+bswJzTsOQ2UdynrsIoVOBReldQedo7b1iWRJQry0V7+prjEyXxvaXPHx4MI
	+OxCPxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSZ8-0000000D9oK-3bAe;
	Mon, 26 Jan 2026 19:48:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSZ6-0000000D9nw-29gJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:48:01 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b6c89d302so4787024e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 11:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769456877; cv=none;
        d=google.com; s=arc-20240605;
        b=HpFuOiUK4RmaCsXSPoi3mGYLBtSpbQcRBmawkugaQ8kTHmpXr40NQkjxtcuwlzKOYr
         Y/nLVTZRsa7daxSeXaBVGGwT53t44RBu5eUlCjh8HsS1+lXrDUm5+QRkBcdSURH4oRM/
         8xPaZSU0oRdtIRFNe5zT32mJoncHhENkZJ/HfiL6eTTUI6ZqbkWzs2lERYbJ1o7GA7i/
         BJAbMR2L8Z+iVtszdtenD2yjNt/NKkmrBCL0UaDp4cfk+bScEQJ62O/mKS7Ms9yBSO4N
         iMewJramCqej9TzgKnwV6GQlfUmWCWyf/DgrxxBRjFWJwgXbPoqYm4f54HLtYliYpsIV
         rSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        fh=W/DYtfwHq/cJi4VIiymXdo0Um8aXQ5BDIhcnjFuLP70=;
        b=YXnfCHJGVCTmVEEtyeJgskz2k2TKXhjjiVt5ZaxrENxUupbQAJp9iQ+uRcBTYXbucQ
         jItZ12VonYmi4iFSIatanpP34MUQuZ27gsRtGJgBQtibP+owy2dMrLTmJkngaCGsYp95
         yVsh7MlyiALUW6KNcu/BLOF2iVGi/8aM3FWxLfVFvA8ANO8qpMguA14SmW/tJGuNx+jB
         1a6EEA1/H4EmhA2NWoHmCOnBn+jKdl+gjBJQNMm8wkNklHg6y1YuZ1MW/k2Yk4apXdp0
         Jx2eFhLqz3SOb5thpMiMrfnVIkPtFjpQWJwMGGGSHdxOMfl611BepJ7Yqtcq1+uewGxn
         IqLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769456877; x=1770061677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=IBTa7wDTRQgtXCVCw+a/LPW8VJIj5Oc44Pxfdamp1hHSRwIdXnrYQ6TyJdgIkflNF2
         yODWTzTo3H8uy8arKB3PzAMbAmZooDR2RYaEo7jyU2mwe/YEPR2moBGDmS/dY+3Y13+k
         93OwSvYbuaCvq3kJiATwWdlcrcWuWjKxcvzoyk1VtxARjrWCZXlRs7XZ8ICJ99P9/ThT
         P+LFsJ+TQgfiEe2Pa7P07XXVr1McacnX/P4c7EQiSB7PshcSQtA+aNaZwq26BZkxofE6
         4zWaTssAHr1+zS3YkIx6vXVGgZRy90TgbirZzI2Cx+qLz/Cl0JU0SSIiPzewanFXJgN+
         FWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769456877; x=1770061677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=p2j+g0bTRndO2hjaF/cpaFbX9ZLSkYEOrWKdlNRSW7PuAZIWk1NS7t/io7uo4YEpj/
         nh7kjpbRzRfSFbfSfsS12C+nv4ydxW3VTOJ9uNAO2qS1FRAEtvfVXMt89ba6gJdOLC4J
         eBWV4tOfU9G+rz1okkNYcVF4G2QolRmf3by1N7iWbHhMrOn1ptomRHKTkGTEgc6Rz9BO
         hqpI7IUodojKdP+SFApvT0P2U7suc7DdwDaDNsfhLC1txvbPAlrr8f48watT2XDtwpSe
         IVbjMVOKN1s5/1tdmV4zJ5tleX6ecs8JSes2+sMbTLKNROC+qcD1/lJ/vIHAjQ3oZsZK
         KCog==
X-Forwarded-Encrypted: i=1; AJvYcCVS66FXUtNPYygqE1gmOP+/rGveVCiZxvwaJNNn1S/hZ3lP6BVDczEprfYMRB3Aa1jEtRWtxLBsanDZ9tS+XEXC@lists.infradead.org
X-Gm-Message-State: AOJu0YxUMWOeDx0qllh5ZLtGb8b1zRC0bwRDlqBgiDMZTum0W1NPfQ6d
	0sYaSMt4yaaek03WZQ7omcvITo9aLsyyfENByYX6RIQZMEA5f+oqKI4Gx+Vg1Y/p6CUJYr8PQD5
	h40wSnj2IcORTtPEHikffg8J+YNx4XdI=
X-Gm-Gg: AZuq6aKmMAfk+QlowLdGbWnROvMZSUXcxYOxanFPEOu744G/3dsWOL38hvJDO34BxqE
	yZPubtWWetXlW2cNHF/xG4lXmygHG65YP6cduOEEw/pYuqbEdAT8eyilw1gKYmjAXDl8eTLrbdi
	E1q8GgCAdpxoFVtxiTmPkjmwRW1qWqQOEolnMAMCCAp4/fNTkJhSN7SC1BeWAbQf1hlj8CIf3Zi
	cBADS81YQr1C+FCd49ZWI7eWrSsy5AZiAXgWecSVD/03y8sFZf1h8q12rGhSoyvGiu1JpEr3AHr
	cnTtQ5ZgjY6hU5ulvmh8ZUSYFUU=
X-Received: by 2002:a05:6512:1087:b0:59d:e9f6:1391 with SMTP id
 2adb3069b0e04-59df3a1408amr2177134e87.34.1769456877066; Mon, 26 Jan 2026
 11:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20260126115349.1750578-1-lukma@nabladev.com> <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
 <20260126203307.6076ba9c@wsk>
In-Reply-To: <20260126203307.6076ba9c@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 26 Jan 2026 16:47:45 -0300
X-Gm-Features: AZwV_QizXfEBcPuoLKyFUr1dg6OQ-LmaBQRERKbYiAht9E5yQHfaWrYosy_qY4E
Message-ID: <CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch clocks
To: =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_114800_599984_5BD8A0FB 
X-CRM114-Status: GOOD (  12.41  )
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

Hi =C5=81ukasz,

On Mon, Jan 26, 2026 at 4:33=E2=80=AFPM =C5=81ukasz Majewski <lukma@nablade=
v.com> wrote:

> Conor (on CC) explicitly asked to remove VF610_CLK_END:
> "[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch"
>
> ------>8------------
> > -#define VF610_CLK_END                        191
>
> If end is modifiable, it is removable. If you need the define for the
> driver, please move it there.
> ------8<------------
>
> I just follow what he asked.

You should still use VF610_CLK_END. Just define it inside the clk
driver instead of in the dt-bindings.

Please check these two i.MX93 patches that explain the rationale:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3Dc0813ce2e5b0d1174782aff30d366509377abc7b

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3D0af18ba60752e8a4ba34404c1d9a4a799da690f5

