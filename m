Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58091CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jZgFdo56U5Rjwn/0fXd6egZkLqMBUY9dg2lSu0VhJvc=; b=LjjGsFVhZMuTC025nkLVo+Lv40
	RZXAXbfsZPnKFVYlffX0TmpbIQWcDw4pofZnXOmJYQdPanZQu6+knI7c/ex6X09O0CBQKds/YallF
	vVFuoIPiHsZ8zdnpfxd8BiQkzCYb6d7ZJfWxAL7rlC6d9Z1DIIINifWKSgxJaoSv7Aw6Oe6X0mj1D
	LTt8SKTbqkFye1gdxUJPVc/RTwggxmemqO0FbVrsGqgBAnUW4tPZrgMpYFjgzZAHbG7iBIoIPszzL
	NUF9lhy9uj4B7CgL3E9ZRHl6QfDHBE1+0aVHKaIU8KYo7lxB9HTnDLVLYKuxTVoQAxo43YC+l3a/m
	OBcWLjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFD-0000000AwuV-2rmQ;
	Wed, 17 Sep 2025 10:18:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFB-0000000Awtn-12GN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:18:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-26799bf6a2eso28409985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104312; x=1758709112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZgFdo56U5Rjwn/0fXd6egZkLqMBUY9dg2lSu0VhJvc=;
        b=Lp0Xwf6Dvt4a1C5scXer/iJl3SHn+4/43rFtn+KYtw3hKNyTvVX9CcoZGGWIENve71
         tpY+NYodK2d1ZPMgK+NCbVcoWCaTk8nr39jBI+szr4VjtsIMC8g1RQOJf4VVMu92zUeG
         /0oHYSIE4kFHd5KzqSjIwZe5LSrnZQ4RorBa65HgPsuD8oHx9JtvvINXvnkYUJB3G/j9
         We8l4racdZa55PFfGQAGVAwZpmeCwEcb5I+Ylw2ppHe6mi3kiOsef78FIcDp0FvbhCzm
         EJrm62g1BAwqaNeSesAT6VCR6SZahT3eS+IkOuwffux9t8ws0F5V0yRAN0KS7WcyGGui
         5e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104312; x=1758709112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZgFdo56U5Rjwn/0fXd6egZkLqMBUY9dg2lSu0VhJvc=;
        b=tGqY8nfbwNA6EUKwXssEN6ajWEnx6h1U69QBFqVmXHU4lwU6nWdrPgCyyDOLQmFyYj
         7+MUQgLFURxo18xkDipA73e4o7FTSEN5V4xyhBC4b7A0X+wzKW8puOA/f1ZJdiM8AZCc
         3JRQq5IS1SIgI6CAJQ7klBK6NSGrhdOurN+dVLgnzqlHr7kpjtZU1w0DAGXj0ycWDd1d
         7aL2zf51LHAdWJS0L0J61VVllNr/9Y87Rk48VTyLhLNM0XT7CfQt/m0ikagHAQEDSMWi
         jpO8CXLtLQGiGGTsroSb1ZRsjUcvgG/7xNMg0EQ2/qxQWqBLAyVZhCrCCnj5hXKL8m6g
         2ziw==
X-Forwarded-Encrypted: i=1; AJvYcCVxh1Hov8WLbTIyPYdtg4bZgSzsHd4oYq5AcXpSY3n7XzGK+645tov+9Ko5FJu/zRQXQKKQDX1TpjlAmjSCXHMg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4qmbZxwE6vZSVM6yfJsozqb5orHcLUtEyKwFlMDCStIWwGqk3
	R8Vt+iqKmfwNzvaRU8D4Zm86nreHPkB3TztG4Pi+WRmEuthrVt6Czjdf
X-Gm-Gg: ASbGncu+sndisvFBi1yAJpMOIKmrVxfnrihHWZZHoWdSeyER6A4/oZlZ9aLgc7aMVgZ
	Fti1B4x0X+Pm7gdNV5HfD3kgmbVJoD0eDgZWcSim07ZaGw7IUmLnw4958x6ExxGeKM8bfs2lATR
	TJtW7DGso8MElDd/dx3/LGXjLrSWrLEVpnmfkUDsuKpJljTeXIugzFan+p+PuEK5WFEXfK/04Ft
	uCjNEFPKhJbTClQ4uhOO8HEESMiUnrmHrdER4FsTXi16ujyYyNp2g+9IyG+k4oBcT3ErvLR9JXZ
	8PZYn7z4uZBML6wTyObS45AZOMAlXtXbiIZE6w0kCOvK+DV+pwfeCxEJrZ227dQT9k+CJSZVXyJ
	ozMylPuScimMO467YLD6sagePFcAAuWfz4Lmt0PFfMpGYbUuFe7+rDUuInNUAEhguhhXtYa2lTO
	MdcQt83zgxuU0CxiRx9sVBJIMMsHEg4t4oGQpB
X-Google-Smtp-Source: AGHT+IF3QgCkXxslVB6+8cU4cYQ7hXjdu0fR318XHFqwWXVd5FRKAeNtm0+mTEJzK5nwiVQMB620Aw==
X-Received: by 2002:a17:903:3585:b0:264:1afd:82e6 with SMTP id d9443c01a7336-26813cfb4fbmr18125285ad.53.1758104312186;
        Wed, 17 Sep 2025 03:18:32 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267f4d286aesm28588755ad.63.2025.09.17.03.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:18:31 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v1 0/4] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Wed, 17 Sep 2025 18:18:21 +0800
Message-ID: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031833_283839_391E46E3 
X-CRM114-Status: UNSURE (   8.19  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

follow-up: https://lore.kernel.org/all/3a65d568540e9ca43d3bfc24cfe5f72d2bb12b3b.camel@codeconstruct.com.au/

v1
  - Patch 0001 - add new line between the child nodes
  - Patch 0002 - use power-monitor instead of power-sensor
  - Patch 0003 - dd sq52206 power monitor device
  - Patch 0004 - dd retimer sgpio

Base: tags/v6.17-rc3-39-g07d9df80082b

Peter Yin (4):
  ARM: dts: aspeed: harma: add new line between the child nodes
  ARM: dts: aspeed: harma: use power-monitor instead of power-sensor
  ARM: dts: aspeed: harma: add sq52206 power monitor device
  ARM: dts: aspeed: harma: add retimer sgpio

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 59 +++++++++++--------
 1 file changed, 36 insertions(+), 23 deletions(-)

-- 
2.43.0


