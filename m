Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D8C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPcSO++aLadMD+PhAcYNjZTJ5cORSmb5CC6MRR2Bwvk=; b=gBeqHWvp9nWWw+vwKqAJYbIbu0
	2qrOa11WY4sx9tJJdJjFwx9Vjy4fmyfWYHt8JkkvjmnRO1SVB1muOCILQAcwz0ZzMRWfN206snllE
	U664oqMrNUPc4FGhjk9WzbpjOrc5WScpjWJDiqgp4uLOMagbXTOS2MHQegSUoHJ+/fu4QtEKOzHPU
	GURi3X4+4IlsMN58p3vNRleSNm8GyKlzjvUdyHK/kB8TgAbKZkladjtPCfZADOQ5KMeRUFIEyS8NB
	0l2uIrQcS+jrDnhenhk7TilSowcWUHW+h/VJMHK9WJWrN02ztTGEJ+76xqYN3THXNQNW6LvL3ZGoE
	JhcrMDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByS-0000000Gbay-0VCS;
	Wed, 12 Aug 2026 16:38:40 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByP-0000000GbZj-1Yat
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:38:38 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92e99ef0902so50147785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786552716; x=1787157516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPcSO++aLadMD+PhAcYNjZTJ5cORSmb5CC6MRR2Bwvk=;
        b=XE8zum7hZPH9M8Gsxv9SXO3RbIcBq3mfkuRXzJQwF45eSCYSKWq/hfxLsUbelxiw2S
         dhvzGUN7+uLOjGgWVOMatnCbq1ZjYbOddg8qhCnw0ce42+BEkKd7imLUpOEXEjHJQDkh
         9Ad03mFP8CdIppZAzxUiK+VmXHITThDP+kUC3WDCk/Md40QT+egKlPQYK9d9ieszYs97
         qM8CZuzsHc9c1Lge4kim67pwi1AXrihEFkoHIsYMwUP1YPHm3dv/MhOcHVkEnzOOnC2S
         feJ/836X4qC//zwQYMwfnslTJxzvXQlIH6a8D3VlT4K7VfgrZSPs9V4uadR0u0bBToxk
         G1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552716; x=1787157516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPcSO++aLadMD+PhAcYNjZTJ5cORSmb5CC6MRR2Bwvk=;
        b=WyqgcrmdWSEqnaUlJcEBq5/EF+lt9GdA/mlByrUfpzwFO9IUxTxzo4Gdf6ztr4+x+U
         Uz4AP+S3ZiqUH1Ydj0fKyw8IZ02Ur2TbtLFb83w7kqwJRtF8N1i9bTUiVDbNEhkRycr+
         EHdz2kd4fPjuQb0ALdxycICAS/bIbQwubDrzP/hd74hsIVu0H78zYHf54msva3yl8Qzt
         DKRLps/mXRQ51Xs3F/Oaqg+zw4EVlkYOu4xX8VL5CoYXGuoyvaUYEFSEZCQk4jobMGYX
         MFdQWKbTqUtnT13xLVKq6vT1Px4Fy1w1JISaQQZmFszsS3QmfrlhHmyIole0c0l8iVJF
         E7ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWcpO3BL+0+bEw3yHPZ7YWof/z9Ff6rbeW9JT+R4eWdcC2zD25wFbuXYEKgEkKNyoRp4Xd8IbYjRohG2kZwIYU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmhNYyUeSBK8tl7xclm5R2R2XLVfyoKwjUU8rgJGzVHZdVntpk
	M9O3h7C6uz19JeB5wnPR7jxtvDpLPkIdP0JX29x3jeepsuBvZtCqzK2zEXMIcJTHh50=
X-Gm-Gg: AR+sD13Ku2XGIsJXDshoFDfX/4M6F6JZFw6URMviq7S1b7EA0hXa8X+ef30/pH4edPd
	lMt8YrWElbHuzFSde9XLYIy3d3ysWu6wPlNuAA8FJu5TM3HXA2ehrVb5Df/KaRMDxKJCmVYjtIB
	+KK6NVL3emxWRzJ8PX+67+8X/p/2blAdGP134AU63tOyrv5rEP9McN31yHcIoorykxfafc1Cts/
	i98S7zBug3G65YQhDIY2yq1siv2IjzDf8d8anHg726Q4RJ8mXMptplRefSEWO+aXd7D4E3LerZ1
	6XGussPyJbOlY0v1UcWAnsByxtAu33N/Q2r/Dgtchsop7m6HATtuv1fXgBXfFFpieEkSYxYu0Jh
	kcGIdrQsgCXdJGEpT060cYnwzAz2hyLefy5FtLGI5KW8jT+7CLFmNcZ/ZPWqKe2yukc0Y9ZQoBy
	ONViERQkjvdNcYG7vVfTi2GbeG7Nfwcfo1rMoHRJlxYK8Rs+yU0KzniFQK2S1xE+eo
X-Received: by 2002:a05:620a:7018:b0:931:3ff3:30b1 with SMTP id af79cd13be357-936b3a26859mr553359485a.4.1786552715597;
        Wed, 12 Aug 2026 09:38:35 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5dd3d4dsm166040385a.3.2026.08.12.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:38:35 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: sashiko-bot@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: stmmac: DMA address handling fixes
Date: Wed, 12 Aug 2026 11:38:29 -0500
Message-ID: <20260812163832.271742-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_093837_680217_DD2458AB 
X-CRM114-Status: GOOD (  10.09  )
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

Update jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c")
to ensure DMA errors don't get lost due to casting the result to an
integer of the wrong size.  This was a Sashiko suggestion.

In addition, add explicit calls to lower_32_bits() to DMA addresses
before they are passed to cpu_to_le32(), to guarantee the type of
the converted value is u32.

Maxime implied that a new version the first patch could handle both
fixes, but I thought it better to do them separately.
 
					-Alex

Here is v1 of the series (the patch):
  https://lore.kernel.org/lkml/20260811192703.1765416-1-elder@riscstar.com/	 

Alex Elder (2):
  net: stmmac: use dma_addr_t for DMA addresses
  net: stmmac: convert DMA address to lower 32 before assignment

 drivers/net/ethernet/stmicro/stmmac/chain_mode.c |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 15 ++++++++-------
 2 files changed, 13 insertions(+), 11 deletions(-)


base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
-- 
2.53.0


