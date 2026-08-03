Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA60C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dkd3Vdy/c11kzXWk975o6VbE77tcIPNyghUoE1Wo9PI=; b=a+veS8ErTpbrkvl/2hY79k6KmP
	Ai1XLSKVbSJrStiKzx+CFS2OL2vMLg4+qLn9w863g6vpHl3OR4/T0o1IQLb2Fi7uPT9uaNQwjsROV
	kJ6ZonMnA3WUYkboVT0sXP4BdIjmUlI2pnkn50m7nhQQtoCt16nESFH2b/9NaNssa0pbUS4Q+78/E
	2nFn0z8PBJ/sMYGvZaAQU1rZDnKzWzot0KCdKd60HB/snzOAmdy63vyOx5hW0bcL66tr+Jz7Csug9
	+w60PIrTV0XOhm/qo2A798ILZJetU6St4EGbZ2yWTYGLENLwWeBQEL6KmRX2xfDN5OyFPpzJ0N8ml
	21WskjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNG-0000000HIhO-32Ss;
	Mon, 03 Aug 2026 14:10:38 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNE-0000000HIgY-0KdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:10:37 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6ae4aff94c2so1207838eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766234; x=1786371034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dkd3Vdy/c11kzXWk975o6VbE77tcIPNyghUoE1Wo9PI=;
        b=Rxookr7ixo4DALpuHjpc2vRcn6LMFkz18g/y1egC/S6VMjBKS/4tR895G0ISpo1T3x
         MZ1d2PxESnM5ZehWYm+SeriF3ZoB1veQ3CoTOFtt1uZxYPjrBY3oCwiajfgKKvvd94Q5
         nYiwwMvW4lANHURwNlUyu3iF00xDIEcxUkQfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766234; x=1786371034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dkd3Vdy/c11kzXWk975o6VbE77tcIPNyghUoE1Wo9PI=;
        b=S0PKn4PxUhPe2P9tbBO/FeAoj04c1WLMb/wuOf1/6dkPCupWPaxvr2lDJHeuJ30TEP
         CBEIZuLEG+7hqZVWrs1UTIra7GaxAodeBQ5FvxLRCFuN8WXb01nAI3W45mQQg5PoJcU/
         XG8q3n6t0UsUfsK5fhzhrllnzrniIOCpoBWj+8bXhXNTuJJu43sgbrenAjoqY3ja8q5B
         y1lJyJ49DCOFNFRspWrmtVQks5a+L7eoqOAoxgDGczO/UzxX17UffStPESzDoAWnepnY
         vuhkqk5ExshH/dR43ujBfW4XJN0QQBDhttksjE001zPFJo27WnMCh6y7kKkDY2/SRPEG
         yl5w==
X-Forwarded-Encrypted: i=1; AHgh+RpIYejyIQrlrpi4OFxoAT5Qx0PjJloiXv/MhGck9K9+tPyy3AAkHND1HFM+0i81p/TFeo6gP1tbpoN7STFOQpRv@lists.infradead.org
X-Gm-Message-State: AOJu0YzS4TgcPsWF5vrYfoE/UE2TZNfI0Pm4taLjFdWvntAv8+K9PICw
	p6PZmiGvvjnITWtqQodkDs7IlAmKsVxJt1BCwDMtP2eOT41mqd7qtfSrg0wkEyz1kA==
X-Gm-Gg: AR+sD11SU8XjLbrN/IcPGQAwLy2gPFum+K0wsIyKAi2h8TSB2YaqwBsQshCimDoMbfx
	o0ltWem8yv59tfkczTvD2fprsZA2iClRLevP+abrbvSGWE053uErH5n6Bk/QZRlD1CUR9DXU4oy
	X7W9+ITKVno5v0GJp1QKyp+LZkOemsQ+OCpdQUS0uHlrBDdjswd2OOgGZwkgXWncD4KDfK3+uvw
	ydeyEosvp3XSMdYdRjLiy9PwmDi+Q1bjEkwyi6q1G075CyYg3fvTSMB2cnuZqjNr5ozrulkK9gq
	HfvKgUp51sfocY66Re/ceuapAuWod2n9YfLLo9mZaRGsBkORnLmaFmrfwEpkC+zXZRqESlm2E7z
	8woHB3BlzOl4vJnCHNIiYhxlke8Nrzyri9SSQDL3bkXRcHU/Z626PS4MCVtvHX/OmhcFSTI0nhq
	UoR7KvOeKc6AP+0EwmQniO25bubbPDZOuqR3uNihsGfrZR1GytbAUfTJI=
X-Received: by 2002:a05:6820:c3d5:b0:6a3:7895:7f30 with SMTP id 006d021491bc7-6ae4358f82cmr10811016eaf.29.1785766234232;
        Mon, 03 Aug 2026 07:10:34 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Fabio Estevam <festevam@nabladev.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
Date: Mon,  3 Aug 2026 08:10:22 -0600
Message-ID: <20260803141028.710706-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071036_149025_997D0ED5 
X-CRM114-Status: GOOD (  11.55  )
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

This series contains two small fixes for pre-existing issues in the
Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
series.

The first makes the SoC-data calculation safe when the probe runs
more than once due to a probe deferral: the pin count currently
accumulates across runs, shifting every bank's pin base. The second
aligns the RV1103B drive-type override in the get path with the set
path, which restricts it to bank 2.

The first fix is tested on a Luckfox Pico Mini B by forcing the
probe to defer once: without the fix the second probe doubles the
pin count and no GPIO bank comes up, while with it the values are
recalculated identically and all banks work. The second is a
behavioural no-op until drive-strength decoding is added to the get
path, so it is verified by inspection against the set path.


Simon Glass (2):
  pinctrl: rockchip: Reset the pin count when recalculating SoC data
  pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2

 drivers/pinctrl/pinctrl-rockchip.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rkpinfix

-- 
2.43.0


