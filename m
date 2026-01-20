Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55633D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=; b=XCqr4ndkDIE1ezdjhtjeaCNSn/
	gUkMY3X1eLUkXhPJGhTBe2jAcxNmL5VvB/V1iOjo3J4jOZqL1nGTN5dZFaMIaWs0+ObanZom/vr6a
	R1n9SJpOYRC9NfLTHfVe5PHnxFyjBILV991zjNhaxvuRGmCnza4/SleNFPKtT6oq6x3UyXO9rCbX6
	ejNgjGDI0Db/0Cr4IKQVWZeTVH1y9rBTD1mLeMoQ0rS0QfXjQYodtW9W6l+M8C+zWHVQerVQ6lCIv
	YUGjq9aUeyyLSRZobrC58CnrgnFFeaSKuLan9FUkpGxvUDrCY3muUWZaBmm8H2fM4LeS4yTY2i7L1
	mLm80M4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9af-00000003fu1-0doU;
	Tue, 20 Jan 2026 11:08:05 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9ac-00000003ftf-0kb6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:08:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so3026097b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907280; cv=none;
        d=google.com; s=arc-20240605;
        b=D6EjMrUfnkL+gZ/PS+lMMR93pRHXZxM5wSA1glhsdSvettJp0SJT7sUicWsWM0PEAW
         4IrpYQs0xSaxszPgBV3Zd1jTUBEam49gcWqLOZPFBl5gCl1X4q6KL9ZBW09stjzcbF3U
         SXkP+w3vy1yyQL21nsVyUGf5Lh+jqrfnNHrz84du0UEmmeTIJ622ZaJilOWm9zNKP21p
         +LN29a36fCFjGexxrOZkcRyK6SyjlFEQShMxstumlftlyLroWj/EubNTuhQrbfnaOAc0
         ikERxlkGVImG8mVq90IxcWxxx5Rr9t8IThwANehNWIhl7LkuzrUXGm0rAmD5sYtjvhDG
         8P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        fh=48m5rmMEv2ZuWeq6D+MxpVTYFEtT82Bywwd2ZLe0gjI=;
        b=a9V18uTE3hTVQnfnwDyzY6YpRcGplboWf/hwm1N6bykpT7W+feJjo8ryc9atgNbKyj
         VxsJb309J/QzBcLsMxD/iKS8kbWxi+QVwPIDNPR4HK+sMGIqVT/hohXFf3IDDqZf3Q0j
         SKuAKRVzFgA18fPqqLwORxlW0lHMzE7LpGdFBr62b58R7wojnLV0UVtQlcVLFS9mB0Fs
         nlWPAvJPkTUM5+h+D8YNyYCM8tpadmG7rybrkTmILP+36tCYEeemMhBR8tBXNhb+peWi
         UtB2rQ/83XXkmDw+q5II95kCuFuHfkKCh2CrH8MP4OdnMRob3ZMIuxtV/oC1A7Qs5Zz4
         7egg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768907280; x=1769512080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=FM2mlivziDaPeBLK0MkG9p6Jbqtey93hEHg8ECSnqae6sxaIzlua4HI1C4Dn7yb5Jl
         /mFUjs8D99hc1D6/2f0DnupvSkCv2z4knuXYwhNQOxkVNpNy6unWw4m7+YZtFmUrK2cs
         /idmqYd/f6bkFtk2kD0h2jQoDXwZhbmmKODUyKcpnNRtI5X3FHUdQoQisHTK4sR5g0Fu
         otPAWmUjsVpbYuG4xjrq1jI/uEWzZMPVA9RvvqkUKHXUt4oAmdeML3h+xpbf0WKYLL7o
         sIDu9+lMm8fVoF2vHQlC8r0tjFibABOh+6luk/4vfysOVQt0AUTFQVnJkY4rujH9kBQ2
         L9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907280; x=1769512080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=gWGNcWq0ES4lyGbpE/srx9LSPw2KigMNkH6zCbGricpUKkqAO7BuCs6uMZHxn2ZIhs
         HzCxuTphFVrKYxN2bQqRCIQUPlBG16S8yyrIy1pwmlKzTjZOlfhX5SVwpn6qVKdVKNqB
         DsmTEGi8yj15DFDNs33LiAstn/6zp0HvBQo00otZuH/3ZYQ+WUIewxg9U3oNYaDoztP/
         YHN3pOfr3BXc3usMVSFuxD/45khB4Gf/jQSqCd+3jWb+re+PMF6W6K4FtPCndSTXk4v8
         mAPud2910so3Rt64Cm5M15/E2YnA/AGjMaLQvEKSZcKsT+F1ZOMooCc3LNdbKdAJVEGU
         075Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwYqTd5fJkgDa3jFc69Lx7nRYtt974FbRDIwxc/YZ8P6eQ8jxSc95eW1IM5LhHu+qQg0N35PrfsC43LP6xO8iC@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQ59CqZLhRPsyeqKtd2ubc3BWmYKJCucD6qaGC1D9Rg5HFP8I
	anMHx8+6Y6T+XdZqyz4m3FJ76cFoCDWMxZEiPt96aAzXnDye1wx/wGkIp5a22s9/BQhj5bzYYW8
	A/nFlEvbJaTq/OHOIol/zq5VjndIVIt4=
X-Gm-Gg: AY/fxX4zLabM47OgV9FUuXKNfXTuqPuhOlM2B0oMbi7690koSLMiZHyvsvAPv15YHI+
	yHl6UwikV+UAkxLLv9ZgGDjPUZJFYQhnll7fmGH4p2k/+P14b3ogAVFWRaBzgIq/5NNNSG+98Qt
	ciwMu73VA2mlGzrkKF8bCgLUDPIUqnQH6iQUaTlUx5471saGqpO0TGPg25LLW335nB6dUDGR4Xr
	9G05gXxiYc3TRgtaGEsmf9uhwOcam0KnSizXvf5cs6uh0qZPdlU8bb9OS6sZR4EITm6cfonOoRH
	ofVf4w==
X-Received: by 2002:a05:6a21:3a42:b0:38b:e70c:6406 with SMTP id
 adf61e73a8af0-38dff36821cmr13408140637.22.1768907280519; Tue, 20 Jan 2026
 03:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com> <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
In-Reply-To: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 19:07:48 +0800
X-Gm-Features: AZwV_QjlRWGRppxCrBr9lEF7AFifqLu4-_l_Wvfec_Mh4jj0zdL8Z4fH3sbuZEk
Message-ID: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_030802_227735_0E3E778F 
X-CRM114-Status: GOOD (  15.24  )
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

On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > There is no power domain defined on i.MX952, so make power-domains to b=
e
>
> There is no defined or there is no power domain? If the first, then this
> patch is incomplete. Please read writing bindings part about complete
> bindings. If the latter, then you miss constraints ":false" and commit
> msg phrasing is incorrect (and remember that in such case you won't be
> able to add power domains later because now you add complete binding).

Thanks for pointing this out.

There is a power domain on i.MX952 for the mix system of AUDMIX.
But it is enabled by default,  AUDMIX device don't need to enable it.
So can we make the power-domains to be optional for this case?

Best regards
Shengjiu Wang

>
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> Best regards,
> Krzysztof
>

