Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F366CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=; b=qwUzNx4W//DSaOSazY8iHtoX9a
	uY+dyg1aS9QG/83BPRSzJSt5sQX5SmJqs3Ph/M35IPFWK8jtMAk+4NMj6eyKblCXIK3h5GHRsdFru
	cyWoN0Xr4wBcYCJAhqfVOR+ewczI8GqxUuFBJs87jytm+yz/ZRzgc1DpbaXAKuRpBD+YRx6D8vSKh
	VXQLwbpr2IERYVnhmL8jyIB6xk0Vb3tZH/rUuxK1Cnh2YGqfnu8DHDEHCVISaMhXkIkxmENqENgie
	GsMrLlt9Pv3MQU3pHOMmYuOXhbqLHX9/YbgRBla5zOeRvN0lhOSkYfC2uwRdJ0wdEs/7HZVveaeQr
	s1bcT95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKy9-0000000BGbU-3p3f;
	Mon, 12 Oct 2026 18:41:53 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKy2-0000000BGaC-2v9J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:41:52 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-988d33f8fc1so1112688241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830505; x=1792435305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=J3ABJETw+3Eb/u1jxhqEU7SE53tnVE4JuauCfnOtQSrWtZPM1N/drB4tLBwREbPvqi
         6d5YGtPidXn4x+lU1lTJqbK1gKSUvdziiZP5RYJ2ZLjcXjemR01NHScyo6LSzUmitkhm
         kSNupOK/Uby8CJ4CDlu99OcSCkUHRQ4OdVNWB8z92Rz1cMiYXISa9QhrPneztumqRhgL
         Ot3A/nMchSSx6tLel/BLcPU9kjaSgQHgEmdbnxq5f76rFuFij0gaaUk1VpPKfM436JIL
         UBy6m7VSNh6TGuqf/VlYHZkfBQRCsZmslK2zMjVs3znzxDwkUI6dno/B0fWm9zwWjmv9
         6rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830505; x=1792435305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=PfqKwdVh/nLs4vGKzFLlBWE2dYMXPY/ck4eklHdwaC4HxhPenXtcH6cNRGTB3mEqMZ
         GhXPKplYwKkZLxXCEWDfBOSkv9kajQClr02xu/rH8N+unZ+fFsJzDoO4zxr3YBHeOKkA
         xX75FAFl21TgvcQxkZbPV6S6+X6b8sk5nTjd2TSlbPNQoarC54ZZsrK35dRXT77mia1v
         Zr5Gj89mNB5okAjIG7zv6U6UHWoy550Yt6KwL+IaJzVP6wPLQ5ZJld6IghKF0JIwjvqZ
         vZ1Q1B1Mk9EXocplcCg2gY7rNhHicVZhv5OQU82fxqvTZDzKKL32PqoaPM7r/j7/+yMG
         xbxQ==
X-Forwarded-Encrypted: i=1; AKwUvBydzrWmMZFv7kGuOR5MRpjvSj2yOpoBgyfmD207ZHUxJk4ohmswWJpUoN+BjcA+zAaebUe/XPXymJGmCOHMk6Ru@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5GWZK44ohhP7BEfvbWlf9o45VziXxvZwhEkgVjVfbzrEoJfa2
	5AeK2H5G58cXwtdYRmQbY4tknX7pYaqQ4VBHeMt5hwdq9DtvH6wTsqS3
X-Gm-Gg: AYBFou041t0aEsOOaLMWLWGklH6vyfLZnQY1nJe8pTPeQMBDZQzhu2yntCtqRmVRU1o
	Y+gpDeBvdavNHfs1ByjV0lLCaN7KwjDF21CZ+6ldLPAmJwnQet5FHs2UffceHG2dLSbMsevnED6
	oXzoG2C+NKuwX1flg5kPNBQdgwKzq/I7J/UQ46NlxObwn69PCjF547GWJcAafu6FiUdvRULRq/S
	oFmB/yiaAuYplSVlIwiRN6atuDbdmBwmzGiMdInMQOfzp5lP3zjaqDfeKIi80+srNMhS/yrDQgs
	g453vX6rXQAmIc/OItX3wE+31g2Kam1SECPGwt10vaIygUC6Vg0EcW7ZTUhcHoXjIiALo3sjUA0
	MgBPNMmzHQDJOSKoLnAOyDfbzBYnPvJl+Akt4FJwmOiUeWXa7v//f2JFKtWEMJ1TPcwla8zLinN
	IevX6MLGLqo7cHHXHR5Qbuxh3Jq5pm04vYTi5JYmbbtN6VZo8+BIXGMjcEvnzXZNvWZGcyLVwKh
	79c/Nx9iwZiKxtvsJbMGvqdbsC0ejPn49EGEgi4h/ahCmsPRanYnXP+ejlsCcfFnNEuV3UNmy75
	VQ86DZLopSp7J5jjbg==
X-Received: by 2002:a05:6102:80a3:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7cb37405c7amr3420126137.33.1791830505277;
        Mon, 12 Oct 2026 11:41:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:44 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:27 -0300
Message-ID: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114146_809202_54A23F67 
X-CRM114-Status: GOOD (  14.04  )
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

Hi,

this follows my question in [1]. Andre asked why not extend the A733 I/O
bias code to two bits instead of switching it off, so patch 1 does that
for the main PIO and patch 2 gives the A733-R its own descriptor, as it
cannot share the A523-R encoding.

I have not seen the board fail with the current code, and no A733 board
DT upstream uses these supplies yet. What I have is the old and the new
helper, copied from the driver, run on the host with register values
read (read-only) from a Cubie A7Z, silicon revision B:

  PIO SEL 0x01155550: a PJ request at 1.8 V gives 0x01155750 with the
  old code (PE goes from automatic to fixed 1.8 V), unchanged with the
  new one.

  R-PIO SEL 0x000aaaaa: a PL request at 3.3 V gives 0x000aaaab with the
  old code (fixed 1.8 V), plus a read-modify-write of +0x344 that the
  manual does not list. The new code leaves both alone.

With both patches the kernel boots on the A7Z (RAM boot of an rc6-based
kernel): UART0 and MMC0 work and the voltage selection registers are
unchanged.

PF and PI are not programmed, and neither is any silicon revision other
than B, as reported by SMCCC. The A523 variants behave as before.

I found nothing to change in the DT binding: the a733-r compatible has
no a523-r fallback and the schema checks pass for both controllers.
Andre, if you meant something else there, please tell me.

[1] https://lore.kernel.org/r/20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (2):
  pinctrl: sunxi: a733: program the two-bit I/O voltage fields
  pinctrl: sunxi: a733-r: use the A733 I/O voltage fields

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 ++++++++-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 15 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 57 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  6 ++
 4 files changed, 101 insertions(+), 3 deletions(-)


base-commit: bdacd2542f3c1b2b411fa86ee1f39de19cce6562
-- 
2.43.0


