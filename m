Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0247C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=; b=jRCuyaG+vx5zproDvgqievIgzG
	AVh3SvuccDowLf/dKzqCm8STOHyqeR1GxeWP+2gFRPaBAZF8e5r50kVRhVY5pVnnOHLGEIXG6pYcn
	KgEQ4P1Gp2Vu8CRrrNpo9e30IrH6xpJ6NZd89DrLirFhnvaXhH+V4h9d76R5pePD55N0YStYW7ycC
	DBLuVSKPePaNgueM3auyYzBQJSg4cYWae3+n3DpxA9zfaEQrmr38ngTLuIe5oK9wXUE6Z9WNb8cJb
	qMxfTFj0tTvUfoeYIHfk750+7bwZo3CGInyRiCew9Fv2vkRff2Z1d1PTP6mUiJx4AFjrrQjVpb3AV
	0kedbs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZ6h-00000000swk-3tLK;
	Sun, 18 Jan 2026 20:10:44 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZ6e-00000000svi-2oOj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:10:42 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-45c78da5936so2524760b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768767038; x=1769371838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
        b=XfrnZK8rJg86GqTWrtSt+m5kwVlhGg2CFhUFtCbkz1N9QqFN2fHL7azpul5VNHMAw0
         tgpXhfOXeMhYjeddAX112haV/eEcpF+Pi9VN93De629mxYyhBh1dHzMxg94l2mGy4qIq
         N0S05df2DrZINj45VoIhekQbaUFZwskBPybTvECxmFkvyBqdsNTpnwKWMe01OMS2wEet
         Uvb2MeDIiKNRoplBdt7NJ+7wwyY5vIGdoRZb0lIE1243NBk/3xgcMpIJ5vZctIth2/9M
         r8goSWwD51+rB1PE9hzVbbVm8HRURLqi9oHflgss5Iu9K2v/2CLKjawH9+yZG+BQa75p
         Fq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768767038; x=1769371838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
        b=nKlVt02L1nGod01HIYC4vYzGZwYnD4zF7bttOzAxKC6kjIFTnnh2frrU5uY0sijhWe
         TrKUGq1170KEOi45j48nJcVeAdUuKEKKmjc6n0QHICyu6xoR5MUbxjC5W+H0D/4pNbBc
         Jsi3jtdJK0CCfJM5fWgc0oAfKokK2lSq9SJ+0+HI0hJ9VYuThd7zduF9RebqE5IAJKmX
         jXLT/RJwYOF7BdgOOvCtuPYK+yjYpPw3OfOvbqzkT4sL6ZEozzRhtini3Yzm/c9+z39f
         0y1raWZdQ7yewyfXFRUXK24XR0Fhn+IVloNFpCwZlOpK9LSuSTwc3OtF2rYnbhpDAJSf
         p7fA==
X-Forwarded-Encrypted: i=1; AJvYcCUwkSG8BxWRSKZQrmWN0Ynyl2WHzxq2MUVbyHPzwRrOfZkZH+vpNSt5hCTHksnvvNtn+ZHrKWUjkaKWyn9ShNSL@lists.infradead.org
X-Gm-Message-State: AOJu0YyUezJGWacZXYwt/qtkPApZUFczKRkWlhiZAxd3IMMP/nHCM+mU
	udLKo8xsRvxZsnX0Uu/3Hefyn+K0yJK2fYOeNonQG7evLgg7PwA3DxW3opyxdfF4TQfeqrJCnFL
	IHQvH5SbMu7lNuQdp7MZP3FV3dfFxi4U=
X-Gm-Gg: AY/fxX4TRVTO/dveZmVra2rtRGgGjMCtId0IC04UjAdPbl1+Nm90j/RhtdvaOzWEV3K
	ESl4XujSeYKCm99CJfApdXkXcPcEJwU+waxzb5kFMHCo469NfXFUvmZJRo75Njtb5O6JGuvE+Ln
	IYIJxcD4m7Cu/eZ27kwdwoOpm6v9DZMYwqwnkIHjtzoGCNpSo1lrxv0obm9A+lxeolA0rmZzmDP
	Ec3HQT6984pMo3IvrdjE9w5izH0g8Iy9sYT2qch2x8/z0kVdE1YDCCrutVAIPEpygqnHmfS
X-Received: by 2002:a05:6808:80b3:b0:450:89ee:922b with SMTP id
 5614622812f47-45c9c88dcd6mr5123911b6e.22.1768767038493; Sun, 18 Jan 2026
 12:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com> <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
In-Reply-To: <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:10:26 -0600
X-Gm-Features: AZwV_Qh1K-r-Z8NlKIiE7Ar8yunvRZXy4lr5rzaBilBfhNZa6yCxoqTzBHyaliM
Message-ID: <CABb+yY3ioZ4KCG0tp-r7Xj7hJZFf57xeA_mByUEZBXRaBQQ35w@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, 
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_121041_292781_657974C4 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Jan 8, 2026 at 3:37=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 31/10/25 16:56, Jason-JH Lin ha scritto:
> > From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> >
> > This series adds initial support for the MediaTek MT8196 GCE in the CMD=
Q
> > driver, including related API changes for new hardware requirements.
> >
> > Series application order:
> >    1. [Fixes] Refine DMA address handling for the command buffer
> >    - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@m=
ediatek.com/
> >    2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (thi=
s series)
> >    3. [Series 2/4] Migrate subsystems to new CMDQ APIs
> >    4. [Series 3/4] Remove shift_pa from CMDQ jump functions
> >    5. [Series 4/4] Remove deprecated CMDQ APIs
> >
> > Please apply this series after the DMA address handling Fixes patch[1],
> > and before the following series.
> >
>
> Jassi, since this is touching both mailbox and soc/mediatek, can we avoid=
 to create
> immutable branches to pick this entire thing?
>
> If you wish, I'm fine with you picking the soc/mediatek commits as well a=
s the
> mailbox ones, or I can pick the mailbox ones instead if you're okay with =
that.
>
Yes, I am fine with this going via mediatek tree.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

