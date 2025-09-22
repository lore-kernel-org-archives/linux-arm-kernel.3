Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C82CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=; b=kgr4WhpRdmcnVUB5rNsauY7IBS
	0S3T6g1YaJWcNYc9hz0FaRzI0MisL4oam9pdkWBiYrmFVUa2crGLHQ25kp3wBnxTYBklxRajSjrhI
	4teuuZ9DbiEaFtoQGC34CzJpT6ogdeIe37TYN3uSCCfmk3u/k9aCkF5XTOlPO/vgvplCsQsYH1FiC
	Eei+MpvLvtiNmdKRWjYt7WuSPz4ms78vO5b1Io0L7NjdWPEEOAHFUAwIsEevFiYpGDyjztCatkcIC
	Pw2xyNcF2/gqulExR7xOhy9tj88oBDcvc87veDHNVO0doyn1qtco7vCTxdnB1Vol/mLY0SedZtInh
	YKhjXw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0i64-0000000Al72-0twE;
	Mon, 22 Sep 2025 15:04:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0i61-0000000Al6D-2bAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:04:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77f454c57dbso558213b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758553493; x=1759158293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=EDOeyRW3mUgNwlbiFNHM9r+L3cIemL47ghVZ+fxjtV0GHj5qfUS7/q1o/mtJwJG0E0
         BUe+8fJmM98Tk0yw/FbCkt/dwWOUXRsGK+fr2GFAphCde8MVztapfLCwK8ntySmTZCLS
         bxj7ozvu6xqCMEsfESsedT/fCNaKFmkex2QFU0Qely6AWp53rf1ua8NEwiQSDk09ynxR
         HRnqHhAPNmRivnaO946tqQXzbjJq9hU5VdHA/ji0IRCP7vr5Q+dY40FB+NNF960zMmB7
         VgC1I7xvHM3N225ba3xhAkt5z+hTqliN/MjoMD1+XMBA6/LGCpND6HiA9SQ/opWw2LRt
         Ei3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553493; x=1759158293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=LthQa6p5HJq0H4pNpD85fj4slnpYqu87D2kEfEeCSSMl34KwumDvo30xcdCDfK95as
         qZuMjXkQDkwcAsMJUYC/Y2TFbBwzYYo884sawsJyUD2zBV28m3A9SdK8mVg4SqyuliR8
         VZAk/LSEpYF/nVzZF/jzHW5o9uS6kHUkqDMvXzdlnPAmuoUkh1UUheACSXs0ZJtazw5M
         YXVOexfW8+rE5F4f2PTgwE8hyE6ATC8eHegxS/C8HymdE8y9PgvbYQQGRA3X+3+UbPWb
         5Ce4IZJfHD8zTfJgUETArs1UpvgjxO1mGIZKbECNK3JXrgAms43/skvdKua+F5mLBlT+
         PEzA==
X-Forwarded-Encrypted: i=1; AJvYcCUFxI5LxW4iOnzkM4/WmhExub99zEyaTJjWrrFtgaUBaBBT+QwJ7jDjVBK+WVr2GrNVIbfDcviUGlzftH68+Aof@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+IFFuUW/wB2JpJ1SwhSihJ6kPfR6qswbAvPKMN/sm5KUPxFzQ
	DId0G+oHQzPczQ4HkAGgIojPay+ZZXSxigldNMp+uwzC0wDe6H3og5uK
X-Gm-Gg: ASbGncus/kOeEIHfxU6iEgFrQoO7wWIpGyYR1hgcbqxzbwVCnKq0RecRKGWbH+Ct/Bp
	jKEVEVeM5s5P38OlL/ibcIMwTxGGMx31/t3yrO7qAGlh3zXcdDL6CdGkNpc/5EV+gKgUs9WK1au
	AZ8zWLyhkXRDhrX/1tpBd36JAg2H2jbaYN+U7RspubaP7xhrxRipfo4qf+AsHkjFlPsFJRkvz8f
	luoU0v587YsSq0KOCQY7BXfONZThGTe5rDsNEi2Ug4oNIXHV2xbK8KE80iz6PHzWocPYH0o9TWt
	QAKkcctUC+pTOuktSR9FMALxJbLqu1PM3grViX5JhKKJj/kArblVxw2t5BLzWDlzPXqj35e9bYN
	BQ+liaRfa05o2Pui3aZcERA==
X-Google-Smtp-Source: AGHT+IFeAHlS4iAJPoHh7ZOm/cwEens/eNTaBkhmdeLozkDog20ChhiRrPA5x5jaDTgoFT+gLSoGCw==
X-Received: by 2002:a05:6a00:9289:b0:77f:2ab3:32d0 with SMTP id d2e1a72fcca58-77f2ab33626mr6873061b3a.31.1758553492759;
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
Received: from lgs.. ([101.76.246.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315029c0sm4101850b3a.47.2025.09.22.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/smp: Add check for kcalloc() in parse_thread_groups()
Date: Mon, 22 Sep 2025 23:04:42 +0800
Message-ID: <20250922150442.1820675-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_080453_656553_783AE2DD 
X-CRM114-Status: GOOD (  12.26  )
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

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..2da064e00d0d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,9 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array)
+		return -ENOMEM;
+
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0


