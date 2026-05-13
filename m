Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA7ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oY/vS2daxSQ4cPcucEnR8WY5HPYVG/uWJIbqHtbQwE0=; b=lZk1oWsdBi5XD2zk6JeAJUdqy+
	s6UJBacO/whjDmwU/n57mXCoDOiYUcF73vT/Vk/7Cf39kjegWVH/rSXpZbLjfmfgkDJiCpyVEWcEE
	RzTDOzm7AK6+R/rkGVnuYWhfIM1HZ56yVSjLZry3TjqdPjr7NYNLI3sxSdTJL78GNeAKPQHEXIAHv
	zpib+IaVWWEEvqybe/RuDUkETYLuoqNAuiEC+2kk5BXC1QCA+Nhb5lPtFiADU9Azb45P5VPpown/E
	yjIEHgE+OTGeg4M6EMeNAX86kwbPmlaccmqYyxi32OsXNhnaXAZplPdw1+BvVvPLzk7B3TESRNfcV
	kT592Zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNH1W-00000003oTY-302B;
	Wed, 13 May 2026 21:21:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNH1T-00000003oSg-2PXG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:21:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso77615555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707302; x=1779312102; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oY/vS2daxSQ4cPcucEnR8WY5HPYVG/uWJIbqHtbQwE0=;
        b=ZlLwfes7U63Ki7FU/WdtGMs9jWzHcklkI2LX5aPfdl4GxJ9bFlXG6Y5YSwEIb7O5On
         fdQ3TOkZevMu9SfzrRjEmj0BH8WYDGTIweMApoFiehXYkZrPKIGPq26lkM0BF1MXkOke
         xFpWZdPVKBEzsRmtjjtbt0LlQBNyWEhF0+NayFSETVPzZVdiKriti4YqtSgX/5x14/q8
         aAWfVZupWT9WFSCWyGkH5goJ9iItA61JUAfpQO9BJZ3bUksIGMIPkPy1vw09WQ7qndRP
         hy8NnE1eDVBXFXNXIYPYTSmt0sxzrylr/d8uQg9tShvKOR4XJIb73OIFES28vSUW2R85
         d3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707302; x=1779312102;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY/vS2daxSQ4cPcucEnR8WY5HPYVG/uWJIbqHtbQwE0=;
        b=EQ2WW6i8RjD3iQ7ObvEz/2RtfGt92saBoXHSq7qWjOn/zVbhqzSvjiTV0hBf/wVe7d
         V4ienaWqRo51ljcouT+IO7an2cj/21ICY7U0jE1x55cngE5pLx7X7+reh6Ly4KlCIekE
         r5gq94/CjGjgiIZ0yQB5x5zZV6bXs/rokrFgH4oaqoGj6gR/XnB47oTBr3N0/sssqd9j
         oKg0i4FCqAg3akLS4eYjijt80+Wj9NB41hXQFLxSIFzF9YaxfGWTITK1sYP7TFKKbS/0
         NmSaRwuzaV+aSeXb7tnwFF9JtW42LbiLIqM9Y1Z3tkYCBxB0TvBcTNVdSolIMIldRNHh
         y5hA==
X-Gm-Message-State: AOJu0YxsGFY/8QNoZhjvptRhbim1gLesQTsGLGrgd1qp4DD0xcnGVwka
	bpRed4pasUJcPb//sPYQOyiiWGzL1dnsmp4BVLQOH+bX8hUz8MkuhUfh9I5zLiKp
X-Gm-Gg: Acq92OFyaJRxBe18i3JUQq/Hl7Us5HX7VL9IryZHVhF3+Tpz4MuiDrCdzFBereOdjeb
	LP+nj2x91s2fxVBx1gn6qh6GU7nXOCbeUH8KVhK+TBHiLuNWSCW4ZhDgKT9FYOLRAeNpNHRBMB+
	abjndUhanKnLmVbiInefbNYVIchi8t8imVZIydjwLsz2YIWR+cIMNuWHUilyWGs9zdwyAUIH/sR
	ZluYgbP/Ks0M7MM8OenxjXMJsqLtVbCpxx8hoO2y4ggGcTZpQNaEaSmD4aSgmkykLaJLSm3k74Z
	Yk3YnH926YpRb6NCiXAbN8in0X6gT9jw2kIdsYqrwlDg+zwnqTohfgI24XTX9mDTkLaIZneFNUU
	uCbjNVPi5LeuHVGDMeZD2MKkCQmi4uP86REURPPiBLnBlwR+jeJzu/LGuDFRo4KD5mpvIHM4NPy
	JtUpkSGujDKRTmJflIUE47NaOFmNdv9Nechw==
X-Received: by 2002:a05:600c:674a:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-48fd63382e6mr14712735e9.4.1778707301674;
        Wed, 13 May 2026 14:21:41 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb2c7f93sm397205e9.10.2026.05.13.14.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:21:40 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: zte: defconfig: zx297520v3 defconfig for 7.2
Date: Thu, 14 May 2026 00:21:38 +0300
Message-ID: <4560997.ejJDZkT8p0@strix>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2326700.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_142143_629340_46F7BC49 
X-CRM114-Status: GOOD (  10.85  )
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

--nextPart2326700.Mh6RI2rZIc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: zte: defconfig: zx297520v3 defconfig for 7.2
Date: Thu, 14 May 2026 00:21:38 +0300
Message-ID: <4560997.ejJDZkT8p0@strix>
MIME-Version: 1.0

Hi,

This final pull request adds a defconfig file for zx297520v3 boards. The ra=
tionale behind the defconfig is that this board is too underpowered for mul=
ti_v7_defconfig and quite odd - it is a Cortex A53 without an FPU running i=
n 32 bit mode.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-defconfi=
g-for-7.2

for you to fetch changes up to 9afbe04564c59a217c7d1142ce685c4bd951a8d9:

  ARM: zte: defconfig: Add a zx29 defconfig file (2026-05-14 00:04:05 +0300)

=2D---------------------------------------------------------------
ARM: zte: defconfig: zx29 defconfig file for 7.2

The rationale behind the defconfig is that this board is too
underpowered for multi_v7_defconfig and quite odd - it is a Cortex A53
without an FPU running in 32 bit mode.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (1):
      ARM: zte: defconfig: Add a zx29 defconfig file

 arch/arm/configs/zx29_defconfig | 53 +++++++++++++++++++++++++++++++++++++=
++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/arm/configs/zx29_defconfig

--nextPart2326700.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE62IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiUZYP/RKXKXjbgpwOWDArhVWi
//t4GeM8XeJHbToNdPs0zddnNDKrUc9m6qRUXS9YrfGKjfEg7w+vUDI96b3rTO9J
T7vCqFgicHppfdwwLZKaL9E8tSh4U0Vna5CJV77+dgo2+Ai2X1+wxuN/TNLvciqQ
ZCQo839bDPf86DzbwZlHQwZgmjdLHQYr6VgBhX5tDRh2CJcF8Qd8CNKY//bWLwbl
brw6G5cd+EThYutYI5qhWY+18I8wEjuZ9kASBL4u2BKSGVbws4kHfF742GnVo7q4
4BM45A3vGKiHXaf8rTjUoOCZkTiHgCdTx6wxBDBjDWPuk08B6E0T0aDIrzxU72JS
vvgI7lV/Co2tghBDehKTTQh+2zOd2pm//F99FPtr6uLXQUPqncssVXYWeFc6gmiY
6X8G3RkqIuzKbSTsOaGpQjQ1dvCj83x/OhOdwfv9dKNxqS192PsCNZLw/0XSENMb
vk0LMmB4g/ZbetafsQi0nOG45snB5OQVhgWlHC7SQACrVT2LsySgKykis2S9o8n2
SSyjmX+poC6edxjzo1mLQYIlE3nj/5vN+xc4qCaJX0pwkCeOZClaSFUTLdqIzn5e
g5lb2PXHa1rY5A4NcEeS2JCXQgEdVflMeJunuDZkCiQJUijqzUlZ92PycU/tWgIe
QQaezFYYHW6sWXf72RUdaXwO
=l8wl
-----END PGP SIGNATURE-----

--nextPart2326700.Mh6RI2rZIc--




