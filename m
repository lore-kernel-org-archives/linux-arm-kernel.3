Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC181C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX+WqYiCw5qRjWmx7tMtJD8AKsU6fZ26cq9/PxDn0ME=; b=kRzW+IyHHFg4VhftkVAxhRJUOj
	awJm/W4Q/k2ravL905EPMMdFFxvmPcOuNsDp7QF+xFNH4Kb57koZUpakOJ5OR8i4iXvY3fSKkX0Db
	Swr2EryFuefgP1o7OnwRJiPQmAVA6Yr/11dvqgT4o7VSf6CZ7vLf3lnhHxciC0FkyEZPPFnv3LfYm
	SBtFTjpVLWfoAG+QTLC4LkG/4tTNQ01T0oJ1RwZ7KJEgP24OviAHNGHMUx9Z9W22sqblkzdTaGhuN
	ftduBnzrkyxVFOhrqx9rYOEOrBFnjQIjNevygI1su9FU1Rfd2B2tGIFRw6MwvRxpRrDLecEqd04I5
	8KtDvEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXDk-00000000rW2-1fzU;
	Sun, 06 Jul 2025 21:48:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6q-00000000qm2-3L9H;
	Sun, 06 Jul 2025 21:41:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-747e41d5469so2795766b3a.3;
        Sun, 06 Jul 2025 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838076; x=1752442876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX+WqYiCw5qRjWmx7tMtJD8AKsU6fZ26cq9/PxDn0ME=;
        b=KAarpbvFJxR8FZdpF+FLrCuYY117z0M6uh+LAjLg9uTr7U0Qd6JXxm5imU1qblJJmc
         tvXqoeDQS4PAIDzn4HsrjW59vUzojHv80J+0pP6jaYJlJdxWE+LoICPYOLWVbKzrAO+K
         HF/Q4AUDHOj1PDhcXAN3i2lka6ISnyaj/VpMvLrmxs94FBILCWqIftXU2NESrm8RXqov
         kpTCwNRpTKMNb9N+gQs41lqGW2rZc7PkoJ+wNac0HitRKQBI4GqV0QpgHqmCKVWsBFdh
         LWvVBj1+Qk2rya5xhNMshhXhQvaWqkmSkcyKUKbaSQbmeVQQ3Xw+eT+g/rkzRBLHyWnx
         Lflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838076; x=1752442876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX+WqYiCw5qRjWmx7tMtJD8AKsU6fZ26cq9/PxDn0ME=;
        b=R1Y02YIpx0g1xpl9/wZhC6/2Vh6Z1LSRsdO7j0Pntt3CAMCad+H/98GyQcKNU8fFaa
         ThvkZJPlIfKtIDmu7CvgLVh4ZaoqdC8ghXreTr/LxzqvsvOW6JHld27WDZZPebhKazlL
         mtGRpPLergK9qYBTL5uMHJFsm53N1za2IRD3vcZ0ZFy2xKRjzK+dRto2TaIM4/hblyVA
         mc4tq7abWtjjYUG/nCZx4IqvZ8bBCRagqsL5chh27ImASZzK1BMO0vKYyi8cQNcrHxWd
         vfpU3Zy0KwI5uxV3GQINroW1dhI3gDzRnpXhD0cx4p8SOOH8avAMiPf6HTwURPxm4Mvv
         iu3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFZFTi40PU1tcbs7sWLGaWmCMYjL0Kw+v4OEPyd0nLwAiLv3Npcvp+iMj/W2M5B6RQDUVY2t3/Bqlqa2QQONE=@lists.infradead.org, AJvYcCXfW8jvUyCIgVU0ve1sGS26xeryB/gCOgNzHx9hbwBhHwXDUwV9gqKaxo6FDH9RuTRoDyI0z+NKA/wdzoZeQmlX@lists.infradead.org
X-Gm-Message-State: AOJu0YxxIYYRicFm+CYDYbooYnT6YyS30CEZNeVZC18YPMlddVLR5Tcx
	TlwUsAEhxv0qyon2ZsfykfkEtr+P0cczXzV3Odpq/sJJ6GBWF/gj+uun
X-Gm-Gg: ASbGnctT2N8vLoUyfL0vOuQEs7VqSNwMRyqjfytFUQJJ9TZsWz+37aR1YgHYiyFqSzw
	dex/Ee7W7fGTOivhOXNPL0PCJb4QlC3LzhGYvaU0xzBzEfxtGmOf2HZFDEQ+sF/3Q4ERotqAGjb
	w6E0mMMXrQhCN8Vn0Oc2DJMLoA2HD6BBBh89OQqJyNbj/jGFdBGa6tmgZtkPua95kkqFR4fV9WB
	PpsLuINiKmEkSUo7qhiL7IX4ABIIJvP1n6c0DA4+egi/MU5Aa59y1l95q9JJMMFD5pW8yT8/Gwy
	iJ1pKh5SYKUUERKvM0SVU3T2sgB06Jr7o/UActk83Mg=
X-Google-Smtp-Source: AGHT+IGfAFzujLmWILt8UVxmRYxZiuG97IHsQSc+DfTggeEZMyI9sqg7u8YqmP6IrvzcHwDGVbxv/w==
X-Received: by 2002:a05:6a00:124f:b0:746:3200:5f8 with SMTP id d2e1a72fcca58-74ce8af2e9cmr13029730b3a.22.1751838076031;
        Sun, 06 Jul 2025 14:41:16 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/6] wifi: rt2x00: remove mod_name from platform_driver
Date: Sun,  6 Jul 2025 14:41:07 -0700
Message-ID: <20250706214111.45687-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144116_832910_DE14AABC 
X-CRM114-Status: GOOD (  11.04  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


