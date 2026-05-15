Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6893DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=; b=0In3y7O3Tl8fRASekKDevAMv3G
	ugTwq3q2kvm+7d8VHfY3ldKo9owkbZaKvzRb5OJJO87K2ffBk88Z6dHgM7JP1dfpG2Kysf0+t8MrM
	QG1KUrMAc0Qo58UgznDiZQMV527AhiZYnSGqx4ZLdm0+wdwS5urDj3fI08p84AWziQMo8COSlOfpR
	QbcaGnIgP3I9S6XDewiI5XgsgcwJ7TlUOS1cpxnorBdwx1ZV4CWoQ6tqheoQEsTrRDEDHa0Lnyd12
	DgbCwE+RuEjDKdTkl9ZFhmai7kbXPN+1i1+kuyKPH5+P7W9/f1fpgADWA/vnztffnb1NjVgEuoKSw
	GJfWivYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfN-00000008B1s-48bd;
	Fri, 15 May 2026 11:25:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfM-00000008B1L-01NA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:25:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso89756055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844314; x=1779449114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
        b=feYoiU7IVB1C9us4F5GrJBSzFamP1dLnDk7xgyHvEnS9PJiWvM8IAz4vaT/CjbLutY
         E37wNfAr4SSPYM9J2nZlO5NzcjpjZAj8AAi4psnQc0+CjqYXp1cEhXhRbQ6wEawbTLZK
         /wpsIeg9uHhvCRxvGQZjih3kC/2Y/LugZm+rYqNolRJIHel0j5VUv/yRz70gUxD5Xdiq
         9lSBdFopnqmltOpXxNi01ftuCRPZhQGfo5Yv1oUeanp5JFUmdsiTfznBZ+l6pWwA73EI
         yawH1vIh7yjFZE/jsD/ErpqM5gSyABN+UGmihwjT46Zw9C9XEdYFD+nHmmN9545frH46
         Cpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844314; x=1779449114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
        b=sHkTFlZYEcDjqtvDEBJshQR6LOQetHX5PGbnJlffmknLqxHAMQSzNR9XBnniuBNnNr
         KsFnVHnmjBqn/Gb9r1+PxU9pAu+Fdt48HnyxpHXPMawT05C8Tthn7mZywaHpu6hz+Jar
         cjeIrYXWFi19F0kWb0/FbC8gv+uTFBJDgOiaHorBS660urZcIYP57nf9weAQaSFZxlgs
         F27YgEphPEmoSACxc9gnOtV21zAXw18rnINQeX1hKnoBI80Ot6XQHinXToJFVGw12BFf
         OD5UbxuBsd+ca+QyGOqt4PY8RJ43ojuPTxIYL/xNTo2I6VZ+ANSpf+g+ssaZ/UxBzOXd
         8Qrg==
X-Forwarded-Encrypted: i=1; AFNElJ8a1hFBv1WLSOyZ2914iWdZrovvL4cu5r51pl9gPTxRyDmIEYqZ2rTmTthEvF5BR/bfyksBD27s0nqNCThifHt7@lists.infradead.org
X-Gm-Message-State: AOJu0YxpWoRIrHJgKSeupHkin0VhwOXr/0llOTvj2Ga0yGHt80H1wUVT
	HkRdFperIY6tbfkdUbzRdqaFbbtV0wNR1mGQFkIfhclmWRPrcbmJqQVvpfmeOg==
X-Gm-Gg: Acq92OEgMmVpmIhleIgLgeEuDVfEoY9peheIhNO+grMrLuJGloZ+b3g8N2PzbDiCOzL
	K7fcKtufxnoyUklESnbxruNBHoK2XF/+EzHNtAn8B3kwlE5ELT0/mkdSbcVNruzgw6H9+79TZAG
	tPyKwZWdQ4S4FHNs0TXzyMAObRY8SuWnQUa+rWQ64TSp6WORkgG148vPIoNNQyeoWCNxEIb/2IC
	c03FZmos89tM3drNjfC7eBUFek+FtBKdSsorLTl+sTOlOG3ZRAeCPVt8k5qNuQXln/Kf7tx0bMA
	f0hMQYfU1B/u3ThzOHUgHcssLfEK5L2EcKzpyn/Q4crwLWecjqSEdFE1na5vnczlhQNskuAXIet
	mrgG47LhJR1y82YeAKNxLxXGlzNLsza9wCFPu1llgMDOjyXiIIP5Lcb14jnV3WQq0zHYmWI38JU
	ldGkyECAywhoJYF+WoI9ILqOfLimWR5MxSeeWAgQt1Lc3y0+GD8s65+ibPHREMpjpmtUAVfLaC9
	5Fo2dE=
X-Received: by 2002:a17:902:f08d:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd7e87ef1amr28948915ad.23.1778844314099;
        Fri, 15 May 2026 04:25:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: stm: Use guard() for mutex & spin locks
Date: Fri, 15 May 2026 18:24:54 +0700
Message-ID: <20260515112458.34378-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042516_051394_57164EEA 
X-CRM114-Status: UNSURE (   7.54  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

Changes in v2:

 Replace break statements inside scoped_guard() blocks with return 0
 in stm32_i2s trigger handling, since break only exits the implicit
 scoped_guard loop rather than the function switch block.

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
  ASoC: stm: stm32_i2s: Use guard() for spin locks
  ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
  ASoC: stm: stm32_spdifrx: Use guard() for spin locks

 sound/soc/stm/stm32_adfsdm.c  | 10 ++----
 sound/soc/stm/stm32_i2s.c     | 67 ++++++++++++++++-------------------
 sound/soc/stm/stm32_sai_sub.c | 29 ++++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++--------------
 4 files changed, 60 insertions(+), 90 deletions(-)

-- 
2.43.0


