Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6C2E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWoFu/An9IzjtLQR7C7u9redSV99hsuUMiFBkL1XLE8=; b=NTE+w7WJbXY8nj
	sc0vwUj7MomWPD65umkGpNHmdVIHbonk5iJLXG58C2aRG43+0eVU0FMGzhn0H1K3Qbb4fldy/XDxF
	QHSi9CLO5xEIhuBhkDW8paTVfQy7KgPuef2ceobkw2mfu3Ar2/tmAk6DJDadQY26edZS9/MOZ9j6G
	JcpoPG+I7mQYLMc/uPFTwNHcfgz87r75sMahYsA9v7qtQbYYgalCfYxcsjGpqSS3p9Yisg2Sw2r8k
	Yo9uMLYZJCIxuVXTnIJ1HG6L+itwrXopwv1oM/uiaw6ur8X2kb1raWmelOKQhVrvHeDSf/97uuHY1
	0NOvm2WxeN0nUvOeZw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vscLV-00000009QaJ-3YYD;
	Wed, 18 Feb 2026 07:51:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vscLT-00000009QZ8-2Lyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 07:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E599F444A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 07:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E26C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771401098;
	bh=4iOIMJwTfTlhk2X+SSFRPxdpOOMqvgJljSOYKrmpsX0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=poCnTeb0EiRLHjnZHKa3OTdzzF0Lor2Dktc8/g+0fzCK21yY785y2j78TDy0ydbAG
	 4atxiINHsZ/XtLw1bOnH9CMZ92SytlY9EwvvUIWnkbiGRDqynwvYGq7BDvluwnqZEY
	 W5PzOaVduDO6ZCZLchIfQdTTvAdh8zPxEcyhUkeOeTH7H6LRpXhEXQL+a3fmp2Y/eF
	 pu8uxTfsWrKLFEdaDn/WUEhtIELUzVd57DoXrbhkULNbQlk2+cysxvc4aQul5XxLDM
	 aVhAqENG+/zXyQoBomqTBZwhLMICyAmGGmsJjaZZph1pPuJdp2piYY+QA1epHg8WZL
	 /up+Yi62llWxA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38709888abeso39941721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 23:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhWY449vRITfHUDVLIi77FJ7oUPJ7ilDyf4OvhY9IGT/jhcWvNQsUQv+exI/j9n49ss7o7Sq/d5V0RCd1ANJwO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz43Ya1V6Gz228ddaVu5hbS+s5WVRY3SpUhSOd10srfk2kbyKYP
	gzyYILjNS0B75S8qpg8dAeWbVCgr8Ltib/0Cj0PXgJ5JxQei6nXl3XZjwTo8Z0AJDgI/DnoGzjX
	fJIFMCr2FdOYp0iTd6WhA0G6pVYeOIyA=
X-Received: by 2002:a2e:b896:0:b0:382:f78d:a0c with SMTP id
 38308e7fff4ca-38846df21a4mr3400331fa.21.1771401097098; Tue, 17 Feb 2026
 23:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 15:51:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v65F9OHNdLA2e3HXNiHEUQyW3-zjQGRZE_w5jU6+w5TbMw@mail.gmail.com>
X-Gm-Features: AaiRm51oWyNatKqHz1nRPBR6_xQMPfJe9Uf0NpOZA7cz-bzmXYkXqyvq3n9ru28
Message-ID: <CAGb2v65F9OHNdLA2e3HXNiHEUQyW3-zjQGRZE_w5jU6+w5TbMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rockchip: rkcif: various fixes
To: michael.riesch@collabora.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_235139_647916_08FD2E1F 
X-CRM114-Status: GOOD (  18.13  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 16, 2026 at 9:50=E2=80=AFPM Michael Riesch via B4 Relay
<devnull+michael.riesch.collabora.com@kernel.org> wrote:
>
> Habidere,
>
> This series contains
>
>  1) a re-spin of Dan's patch that fixes some more stupid off-by-one issue=
s.
>     This patch has been around on the list for some time, but apparently
>     has not been applied yet.
>  2) a fix that makes the DMA abstraction respect the minimum number of
>     buffers requirement
>
> Best regards,
> Michael
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

This series, along with the minor fixup for patch 2, makes video capture
on my Rock 3A w/ IMX219 from a Raspberry Pi v2 camera module run.
Previously it would fail to queue buffers.


Tested-by: Chen-Yu Tsai <wens@kernel.org>

> ---
> Dan Carpenter (1):
>       media: rockchip: rkcif: fix off by one bugs
>
> Michael Riesch (1):
>       media: rockchip: rkcif: comply with minimum number of buffers requi=
rement
>
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 10 +++---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----=
------
>  2 files changed, 26 insertions(+), 25 deletions(-)
> ---
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> change-id: 20260216-rkcif-fixes-bdd9d3c7e4b0
>
> Best regards,
> --
> Michael Riesch <michael.riesch@collabora.com>
>
>
>

