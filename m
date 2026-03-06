Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1D6FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=70n5+CscedgHuQY8j6Ny+fc74LTriuFCTgPmi/5/RQ0=; b=azG2fRgAeErIFXdChkQ97eEQYn
	EBk3mhjIijGGeKTz40K5Mznu34AD0nOlKdSa+594UreJWmdT5/jhBtca+aQkZMRxZIz/vak6kC4Ed
	GHKQwL/DQCGHxsAcA7cemTY6JzB8Uc/EmoaIIWj/AvbmSMKtqwwjRpzoPiUHhouugZyG6DwRyOBgS
	uFDIQuDb7cqE/4pU5Le0+e/iZSvSe4YeLWIYMzrjdyfczJMR4yzggSlRwwoiALV/g5OssuD9U0If7
	WlmMBKcnf1Ong+zv/qfITT1g4G9EBxJucKvggueqpS2Mx55yMhC78tdOsIwsEfifF8LZf0W8eRjuX
	jsZYNSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbi-00000004aPj-40Uq;
	Fri, 06 Mar 2026 22:25:18 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbf-00000004aOc-3zq0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:25:17 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-359832fc558so4985188a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 14:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772835915; x=1773440715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=70n5+CscedgHuQY8j6Ny+fc74LTriuFCTgPmi/5/RQ0=;
        b=Vj6/4q+4ZtUVsD5cp+0d0wYaU6Pkt53iK4DYUEQtiuTew7g+KegAzsabMh7bnIMflg
         8lRLIXtclzaXc3vXtUUKGyOrX+fSmcUJohKbgmlku2sf52kUw/HfRVFk9sWKQv/rSECr
         FB+DrUIRPXVGRD5uiAGvdeeUZtF3LJajv1Hi7nXxmf7aEWa1duGbuKgLJ7Hh/cJbsMuN
         WSm5m4YOja4DrqwdaqUlQdMUlveR0VWtxMZmH5JOMoijjaDQvzC6wUjEpkkvQzxt+UJT
         7JdIrGxRGDPdcU/krkYS+/xrirVbSXfLYyhDHR9wn/dlslV2dsMGU7Y3mg+eA/UEiM+e
         iVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835915; x=1773440715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70n5+CscedgHuQY8j6Ny+fc74LTriuFCTgPmi/5/RQ0=;
        b=qSz5IGGuYPOSk2/ZWgH+3IlhZV0qPKrIf1ixfZ33TKpu4zktU5NHK3BEU3n+kyFnYL
         Fzcy5gZCPjhvn5pDS6Ym/QN9OxLGRJdOFzqwABBFOOPh2elus8wfpEpuYHOOOPkHmocg
         sZCQmxu+P/t96zwnj+wSHePd4YSYus2l+UhuI5qpFu+u0nZP50vLvkOyM9r/5lFMdPzX
         gzAkJElokweD+t+KesETgYseb+LlT9/anKmiB/P4F0VmfbR9g3dz6J+DluRkjEJryUqv
         VyX3ihtJmtXBqr5W/ovaBJ/alPQxsKDr4XYQrFKJ1tLRgG/OmqB336N6Ds4WRlRP8U7j
         u5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXaaSZxRfIOTV0KJ6vrnfkvFWTzk1B55PNZfzS2V8lDpgmHGaU+1zpblTkovWLSmPTKe268RZw1uVwFz9aa9fb5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2i0ofK0maX7KbkUyq/vcEADMzPcsEvgjOYE5Vp7WXrWzvwZKc
	qvM9A/eJHz3f4l68thc2IIaPxGOE7Pa81PTo7gaKywrGb/Xs6Ax6H40sQl8VdeMSs7Y=
X-Gm-Gg: ATEYQzxQwq8Cg1ULAqI0kRhC2APBaveOVj45/eump63z9RPDyPdPPEiZ4AJAL9mcg17
	5I9o6g4WX/StokqEgel4XBIKnR2jRGrL1jPfIUp/0v+0BFmfvcM2lJC6zDCUjIKq5HKt9W8NOig
	1HvOfd2UZvGPoQZ0y7wZXaJaN4go7Xpc8tfTxObJ9+zPmutEfkAI5vVOnoWinSPufS4l5Z0t+XA
	5iP6DRIPmKOx2DiViSbLHiQqy4C866MYu425d6ODc03UGThACsybHL2GvvQ9LJES/ucxbR1Dqfu
	KOmdUu2wSGHr/cuBY/6N2FG/2X76G+HTqu7xwMnpb/dZ7/UE22rqzG79rafQM1XCtTp/nX+ylrd
	TYvaS9lSIpE64UY4bwS48mRIq2bIVKLLifmfzmfUlAhUDPkmi/sAmIlUksrFvB8kw2E0O7UyMR+
	fsfhkr5fbidRwzzdOsWi1i4UaXl7GbUwaNDgKEQVzkCA4I7lZvTmZw8vo=
X-Received: by 2002:a17:902:f541:b0:2aa:d65f:47a2 with SMTP id d9443c01a7336-2ae824671c6mr37988545ad.41.1772835914901;
        Fri, 06 Mar 2026 14:25:14 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm32516605ad.25.2026.03.06.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 14:25:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 0/2] phy: miphy28lp: build and simplify allocation
Date: Fri,  6 Mar 2026 14:24:55 -0800
Message-ID: <20260306222457.8400-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_142515_996578_F6F6490F 
X-CRM114-Status: UNSURE (   7.67  )
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

First patch allows compilation on at least x86.

Second uses a flexible array member to simplify allocation.

v2: add first patch and fix second.

Rosen Penev (2):
  phy: miphy28lp: add COMPILE_TEST
  phy: miphy28lp: kzalloc + kcalloc to single kzalloc

 drivers/phy/st/Kconfig         |  2 +-
 drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

--
2.53.0


