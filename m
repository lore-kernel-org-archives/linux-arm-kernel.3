Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B621093168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUZRaRSoeGbeHMPN/xeMz+gDo6IrLpv59F7gq0WwPeI=; b=Yzn0gziPAwiYVPw8erLLAKgSCp
	W9rgcQph2FAuld2hxyk9q6RRj4E1hxQLf23iKAev0X6+BIycLlvJw+xYZUqAqRFnq5omYXNAPlMg0
	rnqJzjooQ0UsqA2oSup4N9mdOQy4VzuKoZoWVGXo/7tk1coGTrt9jvv35CyUS9pGmuOTHEuS26wAT
	M/J7fM7FccXEJPRUMtIcGlawNB8mBUQ2AphyOxBlHkr2zIN9wx1iRgh4L0W2g+/lxQwN+xYHYY/rI
	Mo9Viq50WaLuTk62xYDKQVVLFyO8WPKji6JyQCTuDqEDhtmdbLBFfS0DM0mDCrnuB1XYvZXeA14fb
	sKdatZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8f-00000003Yud-1j2L;
	Wed, 25 Mar 2026 14:23:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8c-00000003Yty-46nF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:23:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab232cc803so23292125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448594; x=1775053394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUZRaRSoeGbeHMPN/xeMz+gDo6IrLpv59F7gq0WwPeI=;
        b=qAdXPAHQ9IVJLSfoiihHNAjnduM4l1jgiZsFeLiS2xwFRN6YiEZ/DlNIGbQmeZEsPL
         23OsiHpPJvgAX/SHY1GXJCWATlbwIdRAbo0V7ZZVWNoVhneEfApowLLGWTCWvaxBBvUY
         ZinIwK7ekfQ8Lh5qsXcZZfBi2ePE6zck41JUfrjORyo3sRkkCMwKm3qLAr9KQbI1NuyW
         8jYuDBdzEpWu3LaInupuJBgT17tso39sGY72xQiuEYiLa8SPJHkBiZW5cZ9CgiVd0XlJ
         TAisgH+3ZMHYboRkAQXbJdrQOmd7DC6AE9r3V1qxQj5c72a05J/JCyw+965//v2z73aL
         760w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448594; x=1775053394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUZRaRSoeGbeHMPN/xeMz+gDo6IrLpv59F7gq0WwPeI=;
        b=mQFBtFGMgmG/DwYNTBI6Cb0filx000BRpq8WQzL6NKVIX2jLFTASybITowMLdyg8zl
         3o4IPyztiFqLCVIuWIwUcNztDXq1BVgbf0Ogi6AOn7cMz6qEhttI6nr8fAVQkx8DLasE
         ucQmYshQs57l3r6UNJbqSdENJ8LboVcPCicQrwRj8EbIgXGolTd8UqgchxOjAtJ68lAB
         jfHQGudBzB4XKEKe+2KXYHMb0wFYMucrKBkHp0/PxONWWB8H0L2ibUHwwOTWYzm6EhYs
         ILXxA/5h8FV6VfwXGCDlkVes4sQVHY5t6UgE8jt1nm2G16F6vv0zf4A8VL3mHB8hNF/D
         QtKg==
X-Forwarded-Encrypted: i=1; AJvYcCUdIUUzwqJ/vDDU6VFvQSbY/jNJy0ouqe7p+AUkqvTuVhkwsTl3+p9qYHWsc0vX9bx5rR6xuiWabuAQ3LIGxJRG@lists.infradead.org
X-Gm-Message-State: AOJu0YyzRrh2N1QqBOCJyxU5bv84F3yUUDvJGOcGMMaeYWAugH7NoN5e
	t/rrKHE4XSyWwQsv0Dpa2J0mbfAN17eNNOKNJ9NT+qCsMrMgnA/6LW3o
X-Gm-Gg: ATEYQzxe8BV1+1d7XoOm6oq+fAQJQpIuwGj/kW6SlFxoZGaeDAXUlyUO/2235zM6Aaq
	2eRwTLOl1RWoMBLUR0A4kZ1/fEOeh2JsGEDHJBHBs3WFqL8bZn828vKuWdcN+SRqiH7r5SJE3uZ
	AS0OYB6Ebk85jcnHZqUwAYHQ/o8j/lYg2LC6o/nPjU9uIujsSqJoURZ33MKcHsi/NTapUTdBK1q
	IASBV3HqK9FS8cUyjyl2ixCEQLS+xllHl2ojkKPG997f4OUba+SjW5bEeZJ/SuFM8691XmbVi8O
	RmpeKAHLmk4e9hZ1kd3PmtUCeJxIOpg11whyh+gsn36l+iyJs4oNo2/vv3zMAL6MnbFrF2awBNF
	WCFKKKHJjqr/UM2I/soKUNDtFRmeKDaDO2uEok7KII23j2ZOn/5UsoTMVeGDYH47anOtPP9BSV2
	28poekwv+Hlrw3qCQ1o+qEZkY=
X-Received: by 2002:a17:902:da88:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b0b09d55bfmr42098335ad.16.1774448593427;
        Wed, 25 Mar 2026 07:23:13 -0700 (PDT)
Received: from bsp.. ([2401:4900:5034:e673:1f10:d599:388e:a85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b8adasm860705ad.33.2026.03.25.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:23:12 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dev@folker-schwesinger.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Wed, 25 Mar 2026 19:52:59 +0530
Message-ID: <20260325142300.3680-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072315_020215_718BB96B 
X-CRM114-Status: UNSURE (   6.43  )
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

From: Rahul Navale <rahul.navale@ifm.com>

@Xilinx/AMD maintainers:

Quick status: the ASoC playback regression is still present.
when 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
is present. Reverting 7e01511443c3 restores normal playback.

Could you please advice the next steps / preferred fix direction to address
this regression upstream?

Thanks,
Rahul

