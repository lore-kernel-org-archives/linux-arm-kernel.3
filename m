Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1FCCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=; b=qu6pB8Th/IX6Q+JfunoP3rS45R
	rrK6CcXjHGbXWYl3yZH9UEsuNMUYXw/4rvxYWpJsBFlprTr7c5KQqmQsSbRYcXmjNU1o3wVQ/S/T4
	ItiUxYTESv6II1+kTpxshwYN99IrsVW3pr9sp1A/dnTnhacKZ4I9t7Svfdb9FtFyI5yyjOx0y3J5s
	r3YcLXbL5TEDSnkwZNtymbghJx0MmmFMPRcYfqdsKT/58aKVrrDRTuwimEk8BpwFmZ0J/5oP2/7R0
	cyjVHsEekk3oJlpxqcD6eX7rl21wJu26iT9o9ID51xDqNI7PoiVGk5ACXsFo7lkJaQoQF0HmujqUf
	Qb+eSNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBD-0000000FKYS-2Uy3;
	Wed, 14 Oct 2026 11:29:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAg-0000000FKDy-29mW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=; b=pLHPTaPs6ss4QiEkLmTXRVMSPF
	K5Bkz9Xsm4RTvrrS8Z9nggcFI/oJYuWzrglTiP8q6MuVsM9YOiLXwHKPj5NoWPwVwyYjK2xVYBJyk
	iUsQoFHUsW1ZD+z4xFQjbrKHt4hIaQQ8l7xdz1JveH61Y1d9wNAO1D7XSyfuMWxBsJ0yhQXo9sYVi
	DIFadaVQNSNuxa9U4UgV5TLqYWvkPIWkdhabmXfEOU2KiFgJ1fLo0f2Gg49atAv7W/AsCXwvc8jdb
	3jvlI1OfaTXhMdCXDdCqR39FPFxoP5VBL0Mj6F9SNUD16zZgJ0ddwWQd4jc69yxhYvJxKJ0M4D4BO
	36Q0b6og==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAd-0000000Ggjy-3Y4X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3346930a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977358; x=1792582158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=;
        b=XN+mjxWQi1MdmoTCW2kLZXbOETtLZv7YxcNbkuhTxluVgF/w3zjKvWU42Zu7E3f5Ld
         9v40hbFmD3hEz1wK8uiMHzOYLwD8cwDjwicyui+HaGtEPBFCTz0+V1wN6M/B5L8457Qf
         cZyxeYgHHdJfwPXl1UP+/CsTi3nP+6dkHiGFw/tAvMvSIiPCpZAAE5XiDj/vKOOYcR3/
         Ft8/Yg2uRh1kuNn4G+7RvT6WOe/7rxj9CI/sx5V0JM8Rygnf+0tiMt3Bn9BU6Ma9UvAZ
         KMSxeukNuAIT8UfUzfoBInrkUGwsu35Qv8BMta8KBNZ/f85rQHhyDAFYnHnb53KFJV5E
         Grpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977358; x=1792582158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=;
        b=w8LfAf95732jAoiiuioRjKXqdUu5UthMvW3gcVNUIDWMy9HCdoxze88fB2LJyS4C5T
         EWX/bVYBbNGVDo3pgqIEnvg8dzegddhHNK4gPsSsPTjVFtwVypPaFZclHqYUnQukj/bj
         AkUg7Ri9MBASXd4Me8K0KRzzjH9aXJgpqsBl/Un6R1tYQNU49wb86/RTUN/0mCNZkTme
         m5OQ8nddq0f/grJr5YKiLVWcBn2TukNPKtjEblOVD9rLytqD/dOgdi4wUQ9Eeq1b6CYM
         x0Ur8qNnQ/k0s86VQyBZWvwd9DTOyV5tsXMlMCGZ3iVKrJ5Ri0I1FENycmTQH+mACCRl
         SWNA==
X-Forwarded-Encrypted: i=1; AKwUvByvrOZ376TQ2nKlrP4ZFMCMdyoF9/ksh5Ea2wKwlJCSMdI8FTbpkC2NtUR2C+C6DMhw/Vr/Mgs4aSe54vN4oCwT@lists.infradead.org
X-Gm-Message-State: AFq9FYK3/qp9G+3vMFNzfjX6aDyqaIEth2GnJ5116ElJnrWVV+k4d9/1
	cwyQw+10vbKJ6ia6X9cpBurXxWOpSTRBwR5eTTViZzmwSigQWnoSKo/e
X-Gm-Gg: AYBFou3JYr5VQyj8LYfGDYXpy3u1Gw1fHvP5cQACLlqbNRMZw0reAK1FAWbDrRVOrbr
	Ft8Dpw4Eyh9ai4K6t2+9U8R+LBcAuvEM+sLIMC8oOWp9jG8q3yjENBAlUqLxfJAGhDBN9SitSsC
	Xewh0Z1JkTVi7zAYwg3GrEteYK/+HiHwLyGeQ949QWPyBHsaW+SxkOSiMel9acQrohMVW4zNaP8
	a/BCSIbMt0RjeylokUE4UA5HfGdXY5yRsa2WR7ezR24ZUCRw+09QEaosxUpTs6Xz90OVqWrwxiY
	CToqcjP/F9oRviNgmLOxF3ArZxvifT5GBYHoipFN+coQYtb0v6BjwD44Fj4M9NK8kUrxh0y9QP+
	Q1H6fBGSIgjEiHJMqFlyhsHb2essBQoxeSmb1vNT43nuxDuwX0AsiFeqAvtQcZgyC6rLE6J0keM
	LBh4z8Yfde/HqSXGEqpGCmez1u4YDLH/98lI6Zj4462iiL2GrmR0D3VZ+5HJ3qr6nWySUHcwfe7
	Hb1KOEHzoNWDkftQqT8QprGZnNKEFc0H942sK9ZXfXKENTzmdtBB/cSnEAKhtK8o7uJUv8g6GwG
	hA0SxEB8cZU7Bl1m3t0ONUeX
X-Received: by 2002:a17:90b:5805:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3ac8446c284mr408851a91.31.1791977358023;
        Wed, 14 Oct 2026 04:29:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 11/16] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Wed, 14 Oct 2026 18:27:46 +0700
Message-ID: <20261014112752.683032-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122919_977397_0C944F46 
X-CRM114-Status: GOOD (  13.95  )
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

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 75d4d0578bcc..13e5bc02fac5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3132,7 +3132,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


