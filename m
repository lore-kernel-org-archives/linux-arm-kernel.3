Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C45AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCVZeoJMGdWS91Oa5SVGqTYiVZNd6MLWRAbPbQnxhDs=; b=DGop85lDxzUn6yHocX4aIWNv/5
	RjgG+0SqYOsG4pQVAnYtnDqQH9tF+kvMgIs7m5g3JKk3f11ixIxylxD9k84CMd0JnenZWjB6UmEki
	g7T5YVLWCO6XJdfHi/OLoLg9yc+QtoD2/L8XnkL6gFPg613hpTbeyFH7Yb19T+vjIvNb8Ydknv59N
	l23qrNV/0FLclt2Iku1Hq34nm0RwVcdtDaS9HS71fwOS36pI83thM5fwTjLjX3ZUxfZEBrymAbyWD
	9xOm5+jJP3/h/TR2J0FvOLffvE3BZr7IlRriLqAtgj/6La7F33AANff5+xgcb4g0Y/WFZ7QHcmXcu
	zKog+rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QV-0000000DQez-2l0a;
	Fri, 11 Jul 2025 01:19:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzqT-0000000DAON-0Ltv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC2FFA548E6;
	Thu, 10 Jul 2025 22:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2FEC4CEE3;
	Thu, 10 Jul 2025 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752186863;
	bh=fiQ+r1dEdNFy0rz1u3DLw+SW3/t8Uhox09RRVZ6VsF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fc/tWv5ExM9kQzZfwreUNrAEzZaXHMZngvuipNISTG215QQvF5cy8amNoKq0FGXMh
	 u26vFaKFi9bvv3hmodKnY/j/jLvkNuR4W9PHtJEwMIiO4ME7mXDiQdipdv/QPnN5d/
	 NiWGZBxjbeXiP+ZjL3Ipjb9aZB48eoDZUt6tX+pCd+m4q64no95Ih/OWJKHk3BUuqM
	 IEdC/0Khd5yw3AA/UAkzcxucHmll5F5uB+WUBMn8O/FsPmbiLo982/HcZKY9GyI7L5
	 ERVknyUfDDyJCAbMlBDIOI9zs69c9o2CQbxENO97Pn617swxj+wLQrNm4Wb+wg1tSJ
	 BOLdeBAMZb7NQ==
Date: Thu, 10 Jul 2025 15:34:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: thunderx: Fix format-truncation
 warning in bgx_acpi_match_id()
Message-ID: <20250710153422.6adae255@kernel.org>
In-Reply-To: <20250708175250.2090112-1-alok.a.tiwari@oracle.com>
References: <20250708175250.2090112-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_153425_186054_BB1A4FDA 
X-CRM114-Status: UNSURE (   8.40  )
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

On Tue,  8 Jul 2025 10:52:43 -0700 Alok Tiwari wrote:
> Increase the buffer size from 5 to 8 and use sizeof(bgx_sel) in
> snprintf() to ensure safety and suppress the warning.
>=20
> Build warning:
>   CC      drivers/net/ethernet/cavium/thunder/thunder_bgx.o
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c: In function
> =E2=80=98bgx_acpi_match_id=E2=80=99:
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:27: error: =E2=
=80=98%d=E2=80=99
> directive output may be truncated writing between 1 and 3 bytes into a
> region of size 2 [-Werror=3Dformat-truncation=3D]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                              ^~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:23: note:
> directive argument in the range [0, 255]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                          ^~~~~~~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:2: note:
> =E2=80=98snprintf=E2=80=99 output between 5 and 7 bytes into a destinatio=
n of size 5
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);

Hm, why are you making it 8 when the max length is 7 ? =F0=9F=A4=94=EF=B8=8F
--=20
pw-bot: cr

