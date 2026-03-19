Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E88108E1CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtI5DygtRvulSb7YE3u7LJdebCzSARmgo/E7HSytGFo=; b=lX0alKqfMoaZTQWTmlUBDGse5w
	CDtnSTt+46Y8BZxXAtMPaM4BRLPU6k2maobVRr49GVHiE/9mt8G/vnKye8Ge9p+oxPQ4kD04l+jp3
	c3xahYLlHVritk1ckF2unE2jOH71Sso8Ux358qduA59cZSmxDZpqolb/NQgsdLtX4sP6XVx8OCC9K
	UILlLkmxUlYSzMSL4FkykXmtECt8srMjELfNNPwXsvlnaV1yd559SF1mc9bqXyP0/3VWgwRzFRByU
	U5FFLr6/21EjPpmDlLbHPaFn2h5rTVz77CRsXuFBQmZLGVO4QbDpzU0bLxGSgNrMlwT5cX2clVUMC
	MSCGuraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AS8-0000000AOsc-05jG;
	Thu, 19 Mar 2026 10:18:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AS4-0000000AOpk-2bqr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:18:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so7451575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773915482; x=1774520282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtI5DygtRvulSb7YE3u7LJdebCzSARmgo/E7HSytGFo=;
        b=IL9PVgA2ffsOuol1+7hjal13Oxzwret1CZSMCH3/JtKKf7Wnxm3RSyWTNHG/ErFZ7C
         2FfrZ+T6WOlNQ8oOCXltN5fuTubDUUt3PIlSzPqZ6WcGxuCiMlGguPhi2cohA4jpo0ra
         WuQaZzRx0nqpBUm6RksNi2cBq811riQOSUwHe5Y4PybGQypqpNcBGV7MS5cPZ76YgfYP
         UTvF+mI+1TiuiG0Us2wtFt4yzan8ngBSei0nC3KVT6ZCC+eyHYIogWnNhbYxHq2EGi4V
         +DyIJyiDPrOQxX7/JFSvPeHQ3w0eYUNmsMTmrNMoXG0nWSIfI3QeRJn/SPRwdphY9H9d
         xYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915482; x=1774520282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtI5DygtRvulSb7YE3u7LJdebCzSARmgo/E7HSytGFo=;
        b=dbXr9oZUmTEF2SUUxGvDoYDcNyeRaL6WGF1uET63qIy83y4pGwmYJM24LxhqaU7Pvu
         oLHoieUs3JjM/4r5n+NwZUM6B89S9cDtii7w4gBPN4ekQbK9Ndmd31FjUv9cXYkqbTbZ
         xm3BVc77HKJ+ZOl/PmEf0jERH5w136paVP+K3vFgZXKHIaufpGZsZ5oQUgAOMgxr4hB4
         yUChQ1fLzI/xmPNW8YsC9hvfXyBmFEk3FIz5i6GjfWs1dlXNptD5E8pPhpr0TGaSKxUy
         V6fe+0WVcuFlwJLPgQyNR0MctJ7jb3Z7MFpY89FAWyk00hyHBq9Fi5fITqOdoWm3C9jD
         XLkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZFdWBvNhDTlucJEhHOt/O3UNn8xiOkJdg0aotrKVSGZjLJm0t+VC+OlTyqGBlA/TijoiT+PfqWYcBKMnt7FPb@lists.infradead.org
X-Gm-Message-State: AOJu0YxWQschezO3ht3UgLSzJzFwZ/fr4iGmUXiGUFf0KHwbRJIGveSj
	wtBO/c8EqwQpq3G0dnu9PNru3koOdE4ENbJPHDXydI5Y9yl7aWR9zLzv
X-Gm-Gg: ATEYQzzM4W0yzGOZFN9qzBJsCFqx4w1OngmFLTTX4TlmJl8bzqaqmVypRPQnPPQ72jF
	t2EYMM14i1pPS68CwaoCij7E/gJVYfJOnHq6tESjiWSWNupLjgzQAqQiLUB/59vurtdqnMgB3vJ
	zIDBt71I1L3jSgNhuaWAGNHqF0qo/kq0QeRxRBVem7cAtrpG2dtqtbgNbJQwWOL0PaPrXqLRUHR
	M/x6YJ0UaDEBpX3U2dMAlXJ4CLZd5mYvWVGnRVyREozqVAxiJYXHbNVI/E2XXV+MEF8dFZHNGOY
	kzQZKCqw4mNguxW28be0zyAkbZ8epX8l5JZbvWIasdASA7sJVxeozKU/sx5gg9A0y/0R0yE0Uot
	lZIpdUnePbOAcOCe8IyqnaJ+6CAkUJAWDccJFWNGLxk6YXvX500ZAsH9MPX5Syg0HnmnD6pnjCr
	zVSuvn4V6g08LoyM1q0PBIwHhQp3YMDLbeJHohpQ==
X-Received: by 2002:a05:600c:4e49:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-486f4441072mr98897205e9.22.1773915482135;
        Thu, 19 Mar 2026 03:18:02 -0700 (PDT)
Received: from debian.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bb1b38sm71969575e9.3.2026.03.19.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:18:01 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: shawn.lin@rock-chips.com
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se
Subject: Re: [PATCH v2] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
Date: Thu, 19 Mar 2026 11:19:11 +0100
Message-Id: <20260319101911.31348-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <shawn-reply-message-id>
References: <7008e941-e4b0-a060-1cd7-55070fd5831f@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_031804_756061_7535E423 
X-CRM114-Status: GOOD (  12.58  )
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

On 2026/03/04, Shawn Lin wrote:=0D
> IIUC, you are using Claude to help generate this patch, please=0D
> describe it properly, for example,=0D
>=0D
> Co-developed-by: Claude claude-opus-4-20250514 [1]=0D
> or=0D
> Assisted-by: Claude:claude-3-opus [2]=0D
>=0D
> [1] https://lwn.net/Articles/1031473/=0D
> [2] https://docs.kernel.org/process/coding-assistants.html=0D
=0D
Thank you for the guidance. I used Claude as a coding assistant and=0D
will use the proper tag in v3:=0D
=0D
  Assisted-by: Claude:claude-3-opus=0D
  Signed-off-by: MidG971 <midgy971@gmail.com>=0D
=0D
> There is a missing pipe clock which should be fixed. Please=0D
> refer to David's patch[3].=0D
>=0D
> [3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47=
177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1=0D
=0D
Since our board-level &pcie3x2 override replaces the clocks property=0D
entirely, v3 adds CLK_PCIE30X2_PIPE_DFT ("pipe") as well, consistent=0D
with David's base DTS patch.=0D
=0D
I tested v3 on the ROCK 3B (kernel 6.19.0-rc5): pcie3x2 probes=0D
successfully and the NVMe device is detected at 15.75 Gb/s. The=0D
pcie30_refclk clock appears in the clock tree at 100MHz with pcie3x2=0D
as its consumer.=0D
=0D
One note on the pipe clock test: CLK_PCIE30X2_PIPE_DFT is defined in=0D
rk3568-cru.h but was not yet registered in the CRU driver in the=0D
tested kernel build, so the pipe clock was excluded from the=0D
functional test (pcie3x2 probe fails with -ENOENT at clock index 5=0D
when it is included). The gated-fixed-clock node and ref clock were=0D
verified working. I expect the pipe clock will work once the CRU=0D
driver registers it alongside David's DTS patch.=0D
=0D
v3 is sent separately.=0D
=0D
Best regards,=0D
MidG971=0D

