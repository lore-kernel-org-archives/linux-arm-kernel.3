Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eKZoD8N6l+DXHSfFGjdiYdJ2cgnD21M3gDPmDpdt0rQ=; b=DdOAdlKJGJMUcoSAnjFfO6UIL8
	//8Zt1FWZdB9SZ0p/sncnFBIwJ9GxGowZf6EcfcBsablrKuWd6B4hJMZSWvEAesBHTzHj3mygcd7r
	WAZDPtMi0KgMNj0awp3lyXHsAR3g5g50tUUIj5jbH0iu5bRsdat9neBvRjWCNlP4XjYvw/R06jwzz
	ax7+NQgJDGqVpelVecZ2T3KkyYWqN2Nu1i3Qvb9wPad9xXpXDX5CjWNqPORfilIlOEpCp2D6nP0kh
	HVjBz8c9UahXE9yF/9QQoNdF9ShvbCpg9e/LO46nl6vknYdTvwRoBZnui44EKJmBMo7kBsEZLAxKy
	d7cB+Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOX-00000008wdq-30ok;
	Mon, 13 Jul 2026 11:00:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOU-00000008wc3-44uj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2474913b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940412; x=1784545212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKZoD8N6l+DXHSfFGjdiYdJ2cgnD21M3gDPmDpdt0rQ=;
        b=Hqmruh+jLzSLZfnjCBt9MUbSs7PDHbof8YHHvmhn1l34ZDB7PHaj+jtGdQkFBWoYZP
         ZSpNRA0tgb3Ab1Eq9SYsLhdpIxfzBSMk9+iaKmUHrP5jJ3AwHHbPqd4UBseWt0hFU5D3
         UApKwbLsSV0JO2piwKJuvfZUY72d4Wu7hAaUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940412; x=1784545212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKZoD8N6l+DXHSfFGjdiYdJ2cgnD21M3gDPmDpdt0rQ=;
        b=CMcYopylAQ0wwi+GX581foaPgW/H/46CvdAMnKxrkstmbiBLix5AZbZyl2I3HKTEMC
         Qh/vuyGo5kg0SotVhF0tijnpT1i0tqTEuu9b8OQh4nyY/zXf1po0aowvjpS3Aj7f89Yy
         u7PCwwD46OgtOHCQKsM1eCmZYkt4NKk7OSePzaalHEPTOHW6yJr+VCjEBeJpesbKAP5w
         9VXZeAIMuFyxIuKHQRLkbWkOTCqnHez1HzPwM6VQLIxWeVz8TFvJ+9xcneP0fZQ0UNx5
         LrxsjWZ+KqONKUp3e0PJ+d1iDVure4bta7vUkoZb4/+9pjYruYTm5hqQNsvXA+Pyikug
         mRFQ==
X-Gm-Message-State: AOJu0Yz+8G6F+LoL9Id1orPUOX6VTCN3XHr6kdHSe1E3ee8c6MZ7GP4b
	u5eaekd6hYLYtaAXIb+b1urG2Llp1KVU32vHle8/D+z7Ub8+e9U6desOJWKEmYgyTR/dbLc10yC
	VNGbF
X-Gm-Gg: AfdE7ckUNE/344WInHr1Vopojb9NvbR377ZT/wGqcVDqwMIe+4pmr8VLbQ7irValvJU
	8Kj2VlgCg+yE4RIKSimev7DAIUyyBI5cuDHwvnlE8qmMdAxYL1sghfN4FoO2Bc81uDJ2tDEeq+K
	z1RtXMlRaUtCw9nx1mOSVqNnbkpa/JL0tEASWq5dJhGZcjc8l0XX9gNUjL7gYGyRoFqgYSEBVsK
	N4IQaGdH0cobFJPiffzc/SsObQDaeQAH3X+m+3oGepk2ggtkVhHVjCeX7xPd5Kv58HGGBI2pDsB
	AJ6uqn7cUfYRmAzYS+uuLxVBHYd5E6h2gEGK7z4e8v7jKDJPhtKQrHHU/8rkZ90P2KTByRtk3fv
	/sJDwPfVfN7YzKc4AiirsO+IgOAu/VjcILbe8LRe36/cfmpSRvHepj8929XWH6PDN8JNIwdTfbB
	0rUPrcVSFBYZY8wfP2RD4hw+Ijog==
X-Received: by 2002:a05:6a00:a29:b0:838:127d:a167 with SMTP id d2e1a72fcca58-848895dc8e9mr8210673b3a.16.1783940412023;
        Mon, 13 Jul 2026 04:00:12 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:11 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 0/8] ARM: mstar: Board filling out pt. 1
Date: Mon, 13 Jul 2026 19:59:42 +0900
Message-ID: <20260713105950.1346962-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040015_238469_E4962AC8 
X-CRM114-Status: GOOD (  10.13  )
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

I have had ~700 commits in my own tree for these boards
for a long time now. Display, audio etc work but this stuff
hasn't been mainlined as spliting everything out was a
nightmare and I didn't have the time.

I have an intern called Claude now and we've cleaned up
my tree so I can start pushing parts of it again.

The following are devicetree commits that do not depend
on drivers etc that are not already in mainline so can
be applied now.

Daniel Palmer (8):
  ARM: dts: mstar: unitv2: Wire up LEDs
  ARM: dts: mstar: unitv2: Add regulators
  ARM: dts: mstar: unitv2: Add button
  ARM: dts: mstar: unitv2: Link cpu to core regulator
  ARM: dts: mstar: miyoo-mini: Add vibrator
  ARM: dts: mstar: miyoo-mini: Add vbat switch
  ARM: dts: mstar: sbc2d06: Add regulators
  ARM: dts: mstar: ssd201htv2: Add SD card supply regulator

 .../mstar-infinity2m-ssd202d-miyoo-mini.dts   | 17 +++++
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 10 +++
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 69 +++++++++++++++++++
 ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 17 +++++
 4 files changed, 113 insertions(+)

-- 
2.53.0


