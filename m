Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E9EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oMGav3xJdmmSRTKaIqplO9a5WTwQJq0xRLfaVlj7k/k=; b=ZqDi+1V54zJjjFdjcBQY4sxA2J
	HTdyOa+wYetIa69DSkA3snO2AydazeMZzW2R8vw0t2XrWGLa19bBnBSXkgOzWkp2DuwsPMOmECwbn
	FFdq45r1qCPj9d6DmvPbhH5cTKlIf16vyGsnzRY7jD6+vHC1VtqEzGFnfVtsBL6jPpuam//OBk41F
	ndfQ25WAx4E5a+ST8Lft6K8+p0fElx1BZwo22IbYP8ZiinSdXoxY5UAryGm/FS6eq63VX5SnaEhTN
	wWu0Zncwif6/CnY9+1LziQHHG/1vS4lOBrxReDJ8LwrP2OA7wnozb4eNyyvzB9sQboa/b67pAtYjH
	XFMWRRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxt-0000000HaOw-3dCO;
	Mon, 03 Aug 2026 15:52:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxq-0000000HaNn-3iAf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:52:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so41039a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772350; x=1786377150; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMGav3xJdmmSRTKaIqplO9a5WTwQJq0xRLfaVlj7k/k=;
        b=Ej2swBbMi1SVx6ZOd1UbhNfzJYSbbxZQOBOhpDvVjpVGmkgLgbiieooHrGSCdzEjRJ
         MqBtKJr8BCPZ70hK+s7//5srkfI+hSIy/DrAwzyXcV/O7kHjVz9pBCAbk9oFQfIRQIGV
         GQBHQtsiRzj5ZAgPUuJyI0x45yKXlt2GlcE6ek01g7JrbQTy1DfnZSkUlqkSk6wfVaUE
         xtYLUr/j+rOODUfYoWXi2AqVRLjeUYgaA9HSRMM8veLEawj1hKIf9qTf1xvejJVaOmSK
         BF9DlUsSu3Fn6f3z/fM8rjjV9/xUT7aYbzy2P9lcoSUpWxaybbNkQqUSUwGGTu/5RjuT
         AZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772350; x=1786377150;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oMGav3xJdmmSRTKaIqplO9a5WTwQJq0xRLfaVlj7k/k=;
        b=RtkDKiT+8KlZoY9M9cKv9Ff3a/YzrINgRGf/ec85e2M+CmDTUxr7asZi9X/m2/sLkT
         8p+uWMzUHjvt1uWk84wdjBJ1+3l55Q5Yx3zxGwaMgWV4kCwc4wTlXHxoz8NilOu2JznP
         ACJ46iNVYtCWaORWQ7BgpqCdHKF6GxgPSQcFRiB3f+wHQ15W3Xd+qa7ssDhvMh/nL+EW
         K4w6XJpUof4i2yhMw8M/RIPs0+SNn1yBuT2lHj/SJabO/w2HNsf0Zjk0VrSKwjbnMP6v
         cTWZRIFc9wgz/I2vMdKQk9HGhi/dPX9SmUPKmBnqm+c524b5fRHT2Mf2wMBfhJm8qN/p
         iusA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr3XTKPyqg7bYPjLgVG4LMbetuHna2UWaZhAfEPLTtXRWFi97CrgL5tmBvLEI//d/ozYiTv37/l+7ggtcsJI9F@lists.infradead.org
X-Gm-Message-State: AOJu0YzRv5QI9CaOPmSwmSrLfSt+L5vhrCZXVPQAf2jl9qWoPJ9zcFmX
	jF7FSu/l/PMtsTkFs0aUEkf81uUjK3xDbawdj7vgA3Huq4XwamAgTQimIioZPYp89FQ=
X-Gm-Gg: AR+sD133dUi6M2mo6wKb5csb4mfjoCnkjPfqNIkENop5RDGbgXV41ciEYfAc5/iTdhV
	MSkcXKhM+ne0mg/cVHO7OYiIweCYoH4Sijv9MK7JdnKMoUoD/ZuwpCu2moTFwYxruPLFM2Pcd4g
	GPHgYCb5kLCfv1UCn0Jtl/E/97F/Yb30J8gKtxyYz40sVCXdJyqcjujEPzl6bA1RoMJYZZTC7Ky
	TeJA8Ur5ZTe74dbVqZbRvzryLTfV9uIttk8XfSOhT5xk4dalF4uBfd5bEUD7SwpLZdDwbsU9ycW
	fefK4GobAYXLnvHOBq5BsSklP/A18XmJlVXbcJmRs3mgMHXR7gds2XS0A74mCms0o9LSFW8HK38
	S9ktLIILa+q2UW6Cj2YgQwXQBG8Y0lxfFEZik3fVuNnXbKjMxKCx3x3V6J0TmMKduoyvFaWRWZo
	hbkXyJ4e9mUl5b7CbEcC/2gBR5tztr6dBCdOhY69NSKNN5M8SfhGyfMzvd3w==
X-Received: by 2002:a17:90b:4cd1:b0:387:d5bd:622e with SMTP id 98e67ed59e1d1-38fece84676mr12015a91.17.1785772350215;
        Mon, 03 Aug 2026 08:52:30 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-38fb2b8c5c5sm3038440a91.4.2026.08.03.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:52:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: drivers: omap updates for v7.3
Date: Mon, 03 Aug 2026 08:52:29 -0700
Message-ID: <7hzez3i4le.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085230_921971_849A10A3 
X-CRM114-Status: UNSURE (   7.06  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/drivers-signed

for you to fetch changes up to 6342de0aed216b6df460b492ddb532b3e0ed16f1:

  bus: ti-sysc: Fix /chosen node reference leak (2026-07-06 11:42:48 -0700)

----------------------------------------------------------------
drivers: omap updates for v7.3
- bus: ti-sysc: Fix /chosen node reference leak

----------------------------------------------------------------
Yuho Choi (1):
      bus: ti-sysc: Fix /chosen node reference leak

 drivers/bus/ti-sysc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

