Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F62FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=; b=Fh9JreHxRy/zcrONoFJg+xodmp
	rS4rhEdopfLLxIwcb9IPe37ui2HqlXIl7zAPDdoAuNycLwik39NJz5AjdV+v0PGBTg+FF5+zz4+rx
	9tqfNeEbGp+X97x9tjuA6IaQe1OcdjqcFQaTc+5TtaMSYLVfh9uEq1UWW4d0QZcfI2Kwt9bbd5aNS
	Bwi7lo0dbeZSoWq9vz4oorADhP4yII4KsI5LWkcg7l46jTdFpo/BWc/el3M1bgTpzp24SL+5D/W5n
	qKlC4N7Lgh7xvCb1HboUiQfbnoc5EHM62g1tQ5ULhrA2LR+YQEzlEqG4B5B92SjDI+l11c+6yXlxI
	lA1NiEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKINS-0000000GpRT-485J;
	Tue, 05 May 2026 16:12:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKINQ-0000000GpQh-1yPa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:12:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso46323885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997522; x=1778602322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=dxhApCbjmj86dVA7d+8UKFFJtG1B1Y1sMFl1kHZntPpueFukklDx4ns1tfDYrFJ7tW
         v984ocqKZxivoemcRJHOSRFC/403gkos0uzpHXef85xB6SBSbJumuBFjzTpLRG3rOVrL
         hx05QNFfuAE1MmEcu2UyWjoewUe7Y1C0ZRDpxvifdCKYC6E/C3At9pbYqWar1iZ+Fl0Q
         yRVbkGyFD6sqG1ZUOxCdmE7ClIvb9JhE+b2KhS/ZufhcNqhPyz3olH6hgDhyoYv7ZI0u
         SK45rrwzfW9lvoJjUBzFJkS5nWTKoy4MdZuA32H1E970S3zZ7zJekzSGmmPFO1VL/SHL
         JhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997522; x=1778602322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=X8MYhoRNIwxQegyu9L2edgsenjkYaluAvnZLW7P3cAtELgGwYAxtQwlW6pTXybiehn
         3GdHSM75fzXq8KPMcWjPA+0fvMlvkSv7wDxg5P8xS9548z/zyBBC+rbkhZa3MPpSTld/
         GEV9oACPc5sXjLtbnd+Cj8YW92QKLgczPOHYG78oZ5ugalINFF/gJLx4pfOgB8fh0bx3
         NOOdCIaa0WbxjkpQ04CP/LxilfeZGVfrXoPixmIIzJi8tPNA2b0HfJamPs0rcFhxSZhC
         fpJd4AiFHWYDReIHn4Dah2e71cwBJKzTQ/Ihl1U7kN8dmjZ4ALZSrHGVrH5qZ9jsU+wz
         P2lQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rwswZOeC8QdN4XNJxhOifuRpCHRM5eWPibctk6UkbbrJY4iFM/E/k+QWhOv/oy4+lIrH3BtCEjCMoVB55hSEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyru4uxkrK07o9nStDFsh5JYek1UNX9Sv3xHg5rbPrS4N4V2yMT
	HjQmY/EdRpZivHSWGsFAN2IxxAO1YriU8tBcajO9auWti48QHThzEImW
X-Gm-Gg: AeBDiev10SyOjr7MA0a4Hj+pivl7EZSdHAj6HTV5RK+isifgOoHtIxcnzXgPZaWRmpd
	M2DGx2BwfFcIuzDB9i4dxuyz7dSIqqDATtcGInQ23XMcpT/epYd0fXWrEdVY13D6+c9NgpHn7VQ
	gTL5eclGeg3tSnTHqoIaEtFSVFr3eNmA9iix69kDRn9tBHwK7MyLtvSOK1zwP7McBkF6MkpdMC0
	pQhLkRiB5TWeg5buC6IWPhLkMEOqQjRoFoVxb9ewVkPkS15Wx8Sdn63KKI+ikpFPPopXuhMI5SV
	EhM60s9dZIraj/UIkRjqBslKFX2l/ddodOj6GrtgMocbKpsJ8gfMdhtkkvxXnwrXQ4oZF2hvQV/
	aazFmskn7wWYrOq7ptfaIvaQZ4HlI2WIxMawE1RaDTBf+xytIcgbKjlkAOqJtUQLBTlLZX9Fzr0
	wzcDZfa8sFlfhyQqZ9Le3luyLQmo08tlwcslDod4gdFRX8ylCQsXZilHkux29xuP45FmxX751XY
	4gNbKJXrU3jx/sf8c8=
X-Received: by 2002:a05:600c:4506:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48d187daac6mr60424265e9.10.1777997522093;
        Tue, 05 May 2026 09:12:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17710bfbsm26884555e9.7.2026.05.05.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:12:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count
 for H6
Date: Tue, 05 May 2026 18:11:59 +0200
Message-ID: <VwMu5tg2Q9-HLmYXaV-qwQ@gmail.com>
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091204_512968_30863659 
X-CRM114-Status: GOOD (  10.64  )
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

Dne torek, 5. maj 2026 ob 15:48:05 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
>=20
> Add the missing IOMMU connection for the Video Engine.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



