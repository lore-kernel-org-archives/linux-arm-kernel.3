Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3612FFEFB72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 18:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=; b=epnMvD8QoPvPLpqck5u5LQRrv0
	kn5we5OEP6Fi1Tua0Lmzk/oE36Cs2wztbp1JXZj2u8y2N5QwDh3UNWHnUucpzT/Z9AoDwAwMu2JVS
	mp8A5eT+BmqXg0/6TzoHof+t+bsSx296cbXoZWEaa62aUQ3pFDvy1mEDckxOYjksQIrxHYlFEb9Jn
	sPyC2EdHOFv5o4CcGl0gFM+fP1111+5YMZDPJWPnDoh0n+J/ZlTWHaq+cKk8oeeQ9Z0cVecFtdY9U
	95cD8c2m79ykhKovE+G4Cdm16oSH6wcbTTxDhqW8hDfTIzPpZ/Dr6vni6pDPYxu8aVwAl7kedg/CK
	448UbAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw29Q-00000008tI1-1PGq;
	Fri, 27 Feb 2026 18:01:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw29N-00000008tH7-49Vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 18:01:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48371119eacso26795925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215275; x=1772820075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
        b=iZUXxSl9DvKJtEVsEkyKoHp1Zbu/ON4bsqDAxH4HqBsc7I9Sbt0kEcLqcIfYm7H33t
         ECERfLOKPhoFH9W3/Wf8x52hKAKqUw6mom6+bsFeOdt59G8X5of+9gmNeAC7T9m3ALp8
         /JDZdH+aT08815oOmctMPvqcNUytoBj8I5PH0N6wzeDIdJyPIs4gekSrzx42K1tTrpAp
         b7ZO04GzFsyje5Y2neui9X3JiDyIGvChqxJEZ4+G5E6i9omHdafkcpRzaDXyEN/bYkw2
         HuKMxEKsDOM6BTKVVGceW+2mfjknQRrWmcUXP0AlcsD2IhYEXXcXhOa+aW4TYKxSpJtW
         4EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215275; x=1772820075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
        b=vsPZU9gF6EZBV/kUagVQ5a8mAbI8Im9ILD+iG0N73OnpC47jDfTS4QNqODFxOm78pO
         HrtuwydIthWcPPrZ6bY+XMXzeAcW/neDWM36T+4Eb8XaQrPv2gkieMh4M5fLoT4noP3n
         VL7iCHYo2KXIOvhXQkkvqU4PP818Cm1JooFdVOxISclqVR5B1WOwhpIei0nVwWW0KE24
         FGec/fCSF7hZpOBs0ZsezZPnH4gvZ4VWWhUoMHCBO7JhQ2/SreaOjCMvAEICPSxb0HUm
         h+QaNsCDihC82aa+QLzNaSwd2Cub3u0M/oqfNyWVd8kDBptVDpPLx5Xi/t+egkTp3hPp
         6eyA==
X-Forwarded-Encrypted: i=1; AJvYcCWjwJTGbzcvehKxSm65bgiYmvCRxM2PTFeBr043ZWVdidFTA6rdDAPskTCVOIGm4d/fzjARCvwbQwuy1r1HOHsr@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ69KHiP11bUtz9JZOS2MKPVW3etjLC4j6qWfJ/yuOEwYSBBuk
	Mcoi3AsA/EAQug2nLY1jUHPLlgQHM0XblmKssXZljPDGQxB+T6fpbiuJYYeOKCl6
X-Gm-Gg: ATEYQzzaBQc0a9dJWlOil5tmbBnvZjQj3GblAYuCQGkQm/V7ckjJzdx8BDMyV3rV1QY
	1gFf2htQtHxnY0XEioz/cw7fP3K/FkUcuPwbhcKWfU/mlInpxB6T87gQtO9Hi85mrnDpz2kDjyA
	ZYvRy+O/Ap0uxqfd2JTCPvhCiLCyK20rmKkDqeK5Um0KvWStZGULonKnByls6NR+IOMUVTqQxg0
	2YgjuYe2MH5RxL4Y32WpXuejUG+uEpCBGbiAPy12rC2/f9LKgEWUvTNiN9VOL/0/C2d+4UxcOAc
	NU/M5fk3Udoza79HUs4Hh/o5KjKh0OOAF727hPUbMwrIU9gKlgU1+oJTH6BHgXIpSs5NvPrBkEF
	ux7UWOlwbGsqTljUP0RY9v0aHtnd4XtZx+hAIJ43ouFGxt5TDPOk8sboEMSSKcWGoruVwO0GYTA
	CQ9RiQkzW33OVKFwVTSGT+reBAMIk5KANt32FZ6H1Ysp5w
X-Received: by 2002:a05:6000:40c9:b0:439:8c1c:6b4 with SMTP id ffacd0b85a97d-4399de2cbafmr6732890f8f.53.1772215275081;
        Fri, 27 Feb 2026 10:01:15 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm13018886f8f.12.2026.02.27.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:01:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, mripard@kernel.org, samuel@sholland.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix resource leaks
Date: Fri, 27 Feb 2026 19:01:12 +0100
Message-ID: <2819144.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260226163836.10335-1-ethantidmore06@gmail.com>
References: <20260226163836.10335-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_100118_039928_6FC830B6 
X-CRM114-Status: UNSURE (   7.47  )
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

Dne =C4=8Detrtek, 26. februar 2026 ob 17:38:36 Srednjeevropski standardni =
=C4=8Das je Ethan Tidmore napisal(a):
> Three clocks are not being released in devm_regmap_init_mmio() error
> path.
>=20
> Add proper goto and set ret to the error code.
>=20
> Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is =
possible")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



