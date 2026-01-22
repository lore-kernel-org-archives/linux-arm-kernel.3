Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3736BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=; b=WbranzhTAK6TnTdMyXYVwmCNUl
	edlZjSIwxf7P8ce689iWxsVyb3C2rxAtLCEB0ZOdThL7rLX3t3hOvEEXVpKxxGrwubEWX6rlepGxF
	Tl+UW+cE9rXXCA+Uumqfq2IAdAEGf3tsXUpPqdWm7h0QyZ6Y71jI3fsPz+PxPCbQvjWLzE0qFJKLb
	S01a/MvevDyXbXjxsrVMQ5BME0a3GDGkcKFXQAHXsOMZzlUzZdopO5Mcxbyy3fM0QJKCYGt0RCayO
	FqLIiqs9Yy5xZhy0NblRFF5lHlbWgTGOiLWGJIHOfcSHVt/br/QTvka9TCTZvJhG8jPwwx1932yE/
	OSXAfxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitQ6-000000071gj-0Vze;
	Thu, 22 Jan 2026 12:04:14 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitQ2-000000071gE-1nLs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:04:12 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1233c155a42so1251523c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769083449; cv=none;
        d=google.com; s=arc-20240605;
        b=E67zztYG4EJ0NfU4Hbd3fTVX/4b/Ac1QiZ8XAEFf/MRhxZ5SXufeOOnKsuwjw9zF8m
         NaXtX+TJrbDZLPoRd7rBwzovgoogGR62EVXmBMeL+n0E5rDIab7Sy7na+cgtgXj4hPz9
         M8LPwqLZrEK5iMsVtQGMpMldG41WKijdry48dhp0T4jASjCuWK/UIt73kUC/9iB+YBjQ
         PJxIw3X6wdpRu5SG1dX33UEpqMtoCKv68OzQpbQjehNdIG6qoQWUrXeReHcLwZGVu610
         QZBFcd1i+nprBuRW3wcZXbffYvw7vja5Mt/j2iKJNL4RnAmPXdBu1hw0j0ch+r/iRhFz
         CoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        fh=ZILGpRDHqaqvWZy6c9DAa9sa3AxnczAdr//qNFY+KfY=;
        b=QNZu/9rktnbNmgSdrL5ZLBc6ruy3qaBWmUa3yaxlhfGkZsKNXhMNyq/AMmumV8wbpi
         lxvlGHx6lQee3ozF+x1g+dfIt1jrCfT6Fl87huOsMgrR+vXuoXfDh3ouBBl+ZXaLnLH2
         k9qhq6TyNeYFnu31Hbqsr49c1lfGASZZCYA34Iu+BXmeyXAQiq87ALeM8U/Ac27RgYqP
         xYGKqCTR8/NTrU+Fd9ityVCMdHg+oNgupAd+mdIhSmsMux4M8wfuQ6FCl0QU9Yr+hu9n
         ziqpXjEukT+2dIy2QVCxxJbHnL1CwgK7pjnXChG8qZzbDNGxw9h8TLfuvQzajKLihTgA
         f19g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083449; x=1769688249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=BpbrBGL0jVkivL0DUNMDWkifDWAHfYTwN/WFQvgk8z1Ct6dGRugN+2hpBFzaXgBbgt
         5m+JoBQ8k4okk/BJPZZnQuoeITVzRhtGUD36yswON1dyU2xQkNWuV7FRawXelSVy9yJL
         +PPHvTN5JdJtOKjY9sX754kkBD5rhI42qeFD3nTNSsdncnQBpNw1URGTCk9B4QqxOYWc
         fsxczsmhOLD/tS62qFvJMs2S8OedMAQd2bgRtsWQ5Nd6ViaaimzBjfU95zoI6G6Ja8O+
         jeEOD8z3S2ZaefE6GLSyKtzSDLO+Q+p+oTFoKmLDf2nPUq5GJckD5LYRJjBNRwJxIdfY
         E9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083449; x=1769688249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=q8JD9kQ3KQvimx15XHGcX8NVSn/U0SHiSJ4mSkOVTdgbvhII30AY8KwyYp0IVAO9dX
         sZxqzJAA1FArW9qHKIuAUzdgDdR+zFPp2hUtUrL7tV1qcUYLLtimDJV7McXGZIGMaVjt
         UJnpHpd/Alr7X6BiRnp+8vSWtihCx6DQ6+tq5XCjc7SDu0n9qs3k43bT2k8qLHD5KyGP
         ubGLrhcpoynUQ5Bt1KStc48FvQLkG1zIuPNSuP+kadEBMt12eDMNbj0jtOWLFjttcRpV
         uvL8yY9JlWtCgi3Nv1Ub30V7LbGvB09MBUp4PQx18Tkqr8a3YMJBvkKcExcGz7L3RqAQ
         WjdA==
X-Forwarded-Encrypted: i=1; AJvYcCXy/xuRdgOEWqyOq0xhD4IUSoJrVzkKYhqW9fImkI+KxK2QlBCJL3rTn1J6X/aJxZ5tV9UWG6M1502NPnr46mEe@lists.infradead.org
X-Gm-Message-State: AOJu0YwMABhLowx+qKjc3DWmh2LHUdLWJy7Q2UcjOX6ie0qTMEMjkX+f
	FrIKwmOU2u2vwx+SHIYSVpn6Stt+QwCY41ZL/j9Ve/kBCxah/pIdq9YBMFupdFt0IDz6RChojV1
	DixGYfFMkJaRiiAey2C4ZiczNoW7HgRE=
X-Gm-Gg: AZuq6aJePlhhdPCFZFOHdx3jCITooX1P8gJPb3ydGzw+9kSKzsiGN3MyXvYb+jnN6Lg
	g7mO4/XViaTorXQ9GBipyfIG2LiRycE/EiO9GX/nSd2NSFO/K7TV+8B3lVwx7uJEhVn8qQSx8mO
	1tBiFLgLF0yO2KF8AD9ZpagCzcbmjykNd5dUcaon6Zb4t8MKQyn7lUPicDCF7v+qmG/L45qMoYF
	JaGZh8VSzViZe8xpBis8b8l2nAl4fATfvZeMMJyVNgMt4YSDtcSm5zKntrI6zNDrTR+YPRNNiKU
	pfLog8VvwL/N52gvxbf6laXaaiYrR2iYeMOJOJVs4VXKc3rWCnGOM5EytupERGYCubp47RRg4F1
	YZHk6SZvlsyD88g==
X-Received: by 2002:a05:7022:6986:b0:11b:b3a1:713c with SMTP id
 a92af1059eb24-1246a958283mr5461620c88.9.1769083448808; Thu, 22 Jan 2026
 04:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com> <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 14:06:47 +0200
X-Gm-Features: AZwV_QjimaKd_p8jdtYQifLmLFybP2fWAwRE2czS_YKMQ7pErfdW-RzqTfHjkKk
Message-ID: <CAEnQRZCR3oNgfuknUnm88P2Cc4=CYc+MEd-hPtdceRhGhNR-ag@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: imx: add required clocks and clock-names
 for ccm
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_040410_473622_12BF626B 
X-CRM114-Status: UNSURE (   9.22  )
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

On Wed, Jan 21, 2026 at 8:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add required clocks and clock-names for ccm to fix below CHECK_DTBS
> warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dtb: clock-controller@20c4000 (=
fsl,imx6q-ccm): clock-names:0: 'osc' was expected
>         from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.=
yaml#
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

