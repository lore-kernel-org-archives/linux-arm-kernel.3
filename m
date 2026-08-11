Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B2EC5B574
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=; b=zlljBlyOAkcQyxXGAnMfUpAF0a
	4B4oTU8/drn+BEYY8omKYjM6nwDFqlZ3ktHiA9nQ0rUuWIDeUktEbQ04pkYC2KalNyF+604gzgMj/
	MvSkoqax2upI2HtE2edSN2hhcOLapyWGfFKBr3Y5gr9lt8v1ezhZg/5ylbH/XnRbPobuYxrdw1snL
	xLh+W0MVNERfbKV4Zh6/JkRCDR0CNbYNW+ICegP7Ok152H9fg56tr3nwxwDZ6NfEEgoKF+5P1YzFi
	DHK7A0yQB0sOy36JqL1vVAvnEHn5b/6qM1Msd8A4SqHRI56llcBJkOFH8p2kA1vmyiVwqR7QcoU2I
	NpqoqMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthfr-0000000DaaH-0Le4;
	Tue, 11 Aug 2026 08:17:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthfp-0000000DaZR-0MRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 08:17:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caced6038eso8752345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786436244; cv=none;
        d=google.com; s=arc-20260327;
        b=nErh3s2kJyEYomsfan4F7pV2Zp53Xzil7wJR9vm9a5NdHM23azodbKxZPMbak0tTAe
         UPSyKgaLf8y4CFBxDzTv0pnc5xjvkm32zuZ2daktZH79W3CJUz+yUjik/BICe3iSkACp
         MlEvNItFuiXP/ry+jbJh4kQlDeHKDYJOJKi+gZxP9BxXx0qyG9s6SOgYSFNHItqKbzAd
         A4QgaQPn7tbgYFxKZA2bps3RAtqxVP+GPcvRzc6iG08jHn9OiPEsI7m6I1QHgp6O9Vov
         pqUu/oUrIVa760Ma8bc6QQLkq62tWHaMfPiRZaGL6JhmDmfvoitwLjS2Cz7FA4q2cYls
         p51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        fh=LbCKrYkmw55qGBA7RG0Xt9H/+0c8mSEwRbzZ5678Ju4=;
        b=X5qTy/izZdRztVoYW6Z1ORgtWuCkno0s8ZUHOdum1cmeJ1Dozu3Y/azN7TA9wK9Pkp
         h4Z499Cz0KITGvgi/04HIm096pzkttsdUZjq5GpXrb45VbltJes24JIty8IfdS7+NP6A
         EMi3Se8We9PC8SBOjQjm+9zB7RuidZ5UMsUiqfoT9wJcneyDWVyKH+QGhwlpk0EbSQfS
         WRPdiiQ+bQbJ2kC5M5NGcy1BFs9LMdfA+8KUZToIEXoAtBxfnoi2pi97Yp/stHxbNGb8
         BQKEK3BNqGtJxiuu888vheRJT1lFCKw10jQre9bZYmlxXC1AlXdM/pWVVhrGNeri8K5d
         r1nQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436244; x=1787041044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=odXlPsVETGgiX09WLrsFo8LCeig2wRAUs6p0QmRRoc8mKZljAv4wUr1Zrsc9RAVVT5
         NEYUTmtsyzgbNN7EwAZesAsGTh7dW1m37TGPTBfYbRXYDNRpTLs+R4Vnrvau1JzSskBx
         jD4BVLdzNv7zSUe0fQvqWn7fzrmGesk43LJTl9QPj8JscWNzOqDoNVvTiG9o6Roh58Lu
         7clPu9CQDe/qRLv5Kwg5ZElFNHqPql1sdp73fA7vNVGxlrecS9/4dSd1y5bYwyEpqnhp
         tLnvlQ++AEVE0dr5mPuoN9jWSd6n5L1QS1g9hoGNrbkWQBvyUo8h9ExCtHrzGgESCgjV
         4vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436244; x=1787041044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=RUs5eXAfqqiZYAeMCU4i8IV2oiM9SsNtqi5Wci18wCKY4kvKHqxZBeb3aB9mSB+e6y
         RgWWkfQDrxwEEqLtQEpCVyNT84CnXCffQfMnwrH1eOyvJbcTd2Y1nl1P/2CtQC7pFnW8
         KwTL9B7MtKQf4ckJPr/X4KIGP1yw+hUkLtn6KmP3Q/zMcwQyqvlKcGyXR5rQThIbV54D
         ETLzi5dlcULbhyUBsPRTwaJwDlzhrfvv3wMij6zJkyuA/+cbSBFqE6dRN8kDU9vWBKOD
         cuUUhX2T/LDCyWhvmRGD6vYaEGlMUdsWfWFzlxC3dPhGy+GNgoJcU4DfLPJmH+ADtKLA
         Cdmw==
X-Forwarded-Encrypted: i=1; AHgh+RqbccIp3nfZC4kif6CAmnIZoGOX8t2ckrHUTlVA+0k0EvJl0J1OfpkEy7dBk9gTImgJIqEYF2/K+vt/u6sx2Ve8@lists.infradead.org
X-Gm-Message-State: AOJu0YxDcRYt/4vRc2fRTI3yKyTKwKeu5tFZeL8K/fHp/GwB7dAwS/dd
	479KYrHGNSAjpurUAjx//blaE2LywLCvMn1GFmhAc02LEqSoGhxMODugPvhY3kjb/1KWV/caeNW
	4BrnBoZ1tuSxb2HK33LW5nprLLBROt5zTELGsJN0=
X-Gm-Gg: AR+sD11Fj4AWfNL7Y/pzNwTZWnUCROqw8WHLhwUWPf+qL/DzyCI8BltGTe3AbZOT588
	lC4A+YvJVD+PuxXPiGFy1Lc0OX4XRtQzaiV2z2jm/EzlXevLosv/TCelhg8eqaaK5JzLDU70Cbl
	os355YnQvRZx8k5pVFvfCPCb+2OwS456PJ45ryCbmU0yFoX97t3nmQiN5iSd5ZgWRc95Gx/0PZj
	qkjuO75F75VMRlnzuiW/aE4MPmpL6xd7OY5OIQhvv1WlztQgAh6cACBeYmv8++4772pKlNnohyQ
	hJ+WSzazpQJgMajsCQVRasWZUiJ5GvSKdHEYsRxt6nZtGLc5H4+HLF8=
X-Received: by 2002:a17:902:ffcf:b0:2cf:7ea3:7cf1 with SMTP id
 d9443c01a7336-2d31877be01mr17789185ad.5.1786436244086; Tue, 11 Aug 2026
 01:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
 <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org> <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
 <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
In-Reply-To: <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 16:17:02 +0800
X-Gm-Features: AUfX_mx1LX0wZY0j5iDajd7W5oe3f6Rmcs5OiNPXvXt3EbMHLfrVtGbE60ayIAU
Message-ID: <CAA+D8AO1q-n2S3X2d1ZZ_yXxNrHPjCPvrJrPZmTMOYZM9uEGeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_011725_127128_53F795E8 
X-CRM114-Status: GOOD (  13.29  )
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

On Tue, Aug 11, 2026 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 09:33, Shengjiu Wang wrote:
> >>>>
> >>>> Why mentioning upstream in the first place? Either this change break=
s
> >>>> ABI or not, explain that.
> >>>
> >>> The deprecated 'port' property is retained, so this change is fully b=
ackwards
> >>> compatible and does not break ABI.
> >>
> >> So why? Drop redundant parts.
> >
> > Ok, I will remove the sentence below in the commit message.
> >
> >     No existing upstream DTS file for fsl,imx-asrc uses the previously
> >     documented single 'port' node, so this change does not break any
> >     in-tree device tree.
> >
>
> Honestly, it's redundant, because you are not dropping it. So even if
> DTS was using the port, what would change?
>

Understood. Even if a DTS was using 'port', nothing would change since
'port' is retained.  I will drop the sentence in v4.

Thanks.

Best regards
Shengjiu Wang

