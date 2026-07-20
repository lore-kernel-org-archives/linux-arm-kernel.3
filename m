Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D56C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgdS1xQfEoAxbMyvnXhxLVHwgSMFRoTNpVUAudjrVcU=; b=h2ncQxbZAyY0aM9qUku0wkFKo3
	U7pjGDyLOrWsFpKz5Gy7YbsqRSi5HCLGL6Osg9EWXwyWsP9ZDfshLKeLuZTJajebOvDksK8rzQLi7
	pwGHI2o1LNAMgsyN2trFesHZyfXadU8tHCWnWtaEdXrghmfxJmYmk0/FMDRv8gkfrOXFiiLfycaGS
	BUIvClCIqMSMdc4b+Flg0K0O+C3+MKiG+A2FA5TcsNxiZKUzIwWw39+9sZPCrGu/G+rEscm8bs74R
	X7XdJCBEcG+A6JWTnXT6G0KHfGCI2NRtNvujFd5DZ6JT5ftzNzdMu46UPKhm6dZpp+9y9E53IgVgH
	qcqZ0Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicg-000000067L4-0aSW;
	Mon, 20 Jul 2026 07:41:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicd-000000067KS-3l2P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so5683631a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533266; x=1785138066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgdS1xQfEoAxbMyvnXhxLVHwgSMFRoTNpVUAudjrVcU=;
        b=RfrCfMWmqUyQEgaqsWiN9oh4Eia0qlAHGfjodcctNl9oTH5N7RqunB97yzAtGAW1av
         Bhad5iZjgdVkxrdnLOfFlpZ59Od8WAx81XnfPawnqUgQcmxtj1eGmWtDlRW3Yn++Z278
         tdBlzkprah6omo7YiiMSz9qaOrfzUPB2A96zrbvx/UEaokJBrCNLyqDr4O89+tK1z3lE
         l50LkTFDNg4+YfNwIQyAn+bbCeXqjaaCzQpY+p4ZafzpT0olvO0t7Ir5o4/uiRkzsHD1
         ZW/hW20eRTVt/7vGkpoEkQVvrk4y2fr7rJxhudODN4HPhKCL4OWaZkgdRTsgKqL5vsJD
         nq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533266; x=1785138066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgdS1xQfEoAxbMyvnXhxLVHwgSMFRoTNpVUAudjrVcU=;
        b=aZwmWkB9QQJMVyAOWvHV65Hx30QENBJGLw2iP0kEuiK1GGDqdgVz0bBHVBblxOJUju
         +MXCQG1pTHXbXzjreW2MdidEFhK1OrNTE0wpV8iFrbTN77Xu/oKziTustfxqGEJItpCT
         pHLvbzQofXzHIOW8tjmBYwuwMObAClsPKqRMA/KMTOlxD7iP3/+YdFljp2yO5komCg/d
         lilElHqGG9CgcyDVdVZMR76Jsh0oii9wcXBw0dkC3FCGs0pG0QkRAVbdYRkEHyKeC2cu
         qYoo3FwcfNalI6pu/6U7C4ELg0ByWACRd3O9ja0YYJA5xqQ42ph0kLLnQcFjd/qVx6Hp
         KAaA==
X-Forwarded-Encrypted: i=1; AHgh+RoLro0+ttJqoTPRBJmnnJjHCPGXwUwAK7se3k23dV9PLuQcAHX85ZAlvB2PQ5OCn1pYaqTw4HYohpg4eH3Zq4Xb@lists.infradead.org
X-Gm-Message-State: AOJu0YwjvSoOQ9jTT8GWL2+Or12b2UOaBmWFbKey5CcQqUKpBCehwq2S
	Rz/w9EEoJuIUdqESvHAekff+10PffmovNFUBgMLJ1lMIJYJG4XWF6ddn
X-Gm-Gg: AfdE7ckatF44O7K/YjW48X87clwZLT4SpF3g2G0GTc6yh6rK2y4SUGeZm+h+G0Ykdko
	uUcIpFBnFmMO24dnak6UopNVH6hXab77UB5v7MNs8O9WzQgXvTUYIKH0VbgVsaTN1pF679PyQQW
	QhCIXM+CjRt6rWb8y6dJAumvtSNANZvD7AuMV/73P2eXxO0JUd9QnzAAyH5IPEdJH17RXOhDbMK
	JN7cLZYuZJ9191rWRTK/N2uSu1hotAf4dUHNm/mHzdY0Kn4bOmWhbe63qA5QpZLGpY4lbnpSY88
	N4CTndf9D8PcKju3qs4bD1OQvWMdOj1zumnpXLrGvcvEUx6jRu32YOWo9GufBCKj+xenLopnsfW
	409AZz3hOVr7/1AEhKXQIB8YPR3kKnPJD4oYj87egf4kCQgGP08vnXAIWCjZdCqKz3lpzqBkayH
	PcVPJ84rRVP4TRF4HBcpKfl9rRbId9gbOwM0mm+qAzkxAI+IY=
X-Received: by 2002:a17:90a:ec88:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38e4b516544mr13416775a91.21.1784533266485;
        Mon, 20 Jul 2026 00:41:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: stm: Drop redundant error message
Date: Mon, 20 Jul 2026 14:40:39 +0700
Message-ID: <20260720074044.87528-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_004107_937781_D32F7FFA 
X-CRM114-Status: UNSURE (   7.59  )
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

This series removes redundant error messages across multiple STM32 ASoC
drivers. Since core functions already log failures internally, dropping
these explicit dev_err() blocks prevents duplicate log messages and
cleans up the code.
Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Drop redundant error message
  ASoC: stm: stm32_i2s: Drop redundant error messages
  ASoC: stm: stm32_sai_sub: Drop redundant error messages
  ASoC: stm: stm32_spdifrx: Drop redundant error messages

 sound/soc/stm/stm32_adfsdm.c  | 5 +----
 sound/soc/stm/stm32_i2s.c     | 6 ++----
 sound/soc/stm/stm32_sai_sub.c | 8 ++------
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 4 files changed, 7 insertions(+), 18 deletions(-)

-- 
2.43.0


