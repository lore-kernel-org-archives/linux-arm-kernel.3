Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251A8C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=; b=i5noCnlMAlwgvtyB6CTZBlV/DY
	0fkaNrMzOqntDgY2YsIOq/ED8ZLad9rXnaU3y3VjqPiX0CDTR9wujCEw8x+avgG7OKp6Lfo8JXeeH
	5eS95W+PZ2lZ+7jPEYaSS3nhReeyjaWsxJjAYwKcfVzxzYq0a2pt80mtBCVtiHKR6d+lQanXjGuRg
	ElyPo6Ux2AzRWlvJXNzIWkaIFlJROKsDFmWokkRCc/haxkH+JjxJeK7YYFhNqxMP6kBtwzZI4lh+a
	Rl6VXINTm9+4QYjAwgxs9sqxbudK0Mng814SpdMmsLlECRlR40GI65DdWp3B7YiIff2SlCrpWI3f4
	s0DiADyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOoG-00000002KxG-2QqQ;
	Mon, 27 Jan 2025 13:05:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVv-00000002IMs-1afo;
	Mon, 27 Jan 2025 12:46:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso34004015e9.0;
        Mon, 27 Jan 2025 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982010; x=1738586810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=kWBcOdMjB2WQ4V9yxiLKFd/VpQE8xXdxCYOr1otl6H/kuctQoPX0rWxGYwYQgLBj5v
         fCWcHaTkpR6m7OaYplkZj1zJFdmMWW8JqIllgyyWpPfFjwdx4EwR5viRHrwUBgdmemxm
         mfh7bvQ5kNd6u7TZs1FS42pGl3aTrkTMGUvVVJxzxQyXnmcImEV+k033HNFHvorYmcl8
         oLzr1jEOLD9RGraSxUiL6V781XI4pi6Q31ETzqS2L/NMUj8ZxhgGthsV+8sNvT8Aoc60
         8GENYc7et0PUVFZX9dzu5B+6zdwwUZg/2X6nMQXZJRUloFH90fK37kSWUtwG2a5T4ec1
         ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982010; x=1738586810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=aJr32vFWPMCpb58JrQUcHB+N/a6l9Qetudoe9cQjl2Ish46IlDp/ZpHyRM8MBZs7kn
         5i7T9roVJBQgEgTUGOX/8nS3A5DsX9pPygqKp+YsypjFKWs9kHIk/aTNjY2XyzPgDX2s
         OCgxCwEQWwSP6cLhqzYbdpS06H5Gdr3XDSA/Ry/NipKKkXTtGjBCaJsOKJ5VVEhKGcId
         1dTDrVHB4naOj13+uY6nQQfEnT9e2Us58a5kG+k8SGpby665gp6Pec2sH6GsGfGhR48H
         fTMKGG/AzNDAh8XrWfH7gwva0a7u2+BislpgqbGEnIcMMQRnMsKz0f8+JHk8HNPcLlNq
         Tebw==
X-Forwarded-Encrypted: i=1; AJvYcCUT4eLgdRPGCnaYexPPNRgPeXUxaZrPash7LWreJCq8xN/1Hl/PRKf+K4bT/fJrTs3H0aGdWJwQMitta/kAiHiT@lists.infradead.org, AJvYcCVuY9W2RcysvhzilOKr5Whw+Qq7XN9TmR+h/rMEG4SOKUsVgM6X89M3gSNXDfM0urxdVD6uFvYyVi3mIKt9eds=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy9B5zdPYsIezWw8ZWR74SM0n+6oHFZcC48+1HdA4vroI5EfIB
	zmUxU6S6Ok5CtTLZUIuardJhWhYRzoaUsn1oj/BYR1GQSfesSrwr
X-Gm-Gg: ASbGncuwwakh7424eU8cVYECEFVE6QvLiH/enJov1N7gVArwrdagw8VYNSSSOto6pUv
	tGI/gwUxiIoSqcEBLEBxbr92X3ellfauPDbwCyZ8sIDy4QUxjFIvOfVPVfqMZwEbwvIqvuRA6Cl
	1gXaj3wZLduGExvWUmNXiA9Ejp1T1OcPgwb8w2boDqYkbSoyaOEMdwFbjcEIWyIlMVl7aMNwfPn
	JsvDqk8uOhaFyGflMOB6vNf5Pu4cXQwifhnVXUTJSEXZvZhn3ISdiZe1GeznPgaf4LX5OCK6p4+
	TGF8
X-Google-Smtp-Source: AGHT+IGhmYg12Hp8C0sebLYNbpYEvgc+ZIGcISfxxuByIVWp5JGbDaNxubM4KFeyOPfLyoSuuyFpOg==
X-Received: by 2002:a05:600c:4fcf:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438bd052fedmr122721625e9.2.1737982009910;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4199sm10751183f8f.89.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:08 +0100
Subject: [PATCH RFC 13/14] ahci: sata_highbank: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-13-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1sjh2+ve+pLpl+qs4JFyeDCujvbM9xUUKhOAy+ucg7E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsVMoZcFzlRd2JDEQ88PbQqwdNE+u1+HM/7
 InzrdmEGLCJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tYfgD/9CwqCJAL0ulfW78Tlar3+UngP9sSkslf0UBkWDJnt4X7LIk87zcfAI5d3iefV2cAxTmK6
 ao6wf5Y/ide4fMP3fOjap2jpht64DGEZavpEL8GrI/Bo7gf2DlChRJcjBUsqxnebyIiPeS58kwA
 4Ydddyz1Zp+F6Bqr2PqKRcpDrdblMuBUrblp4S6RITvqSIv9IZSBj8yLj2z/WfMhBaIv4ISIXiK
 C+n0JjmBLFqa7Pk7CSLczgOHh1qLfy60JwWNpIIZFmBbZONE1M6m2UZVNss/7xARXhfAKEzrx6L
 DK8pVWyDBJVOyvBet3rdvhuYkOqcea3nzmwMoZ0lg4cb6fBT5cUpo1bcyt+E/zs09IfK+sNOoGa
 iDWuOLdAluiRBtMpbYuqK/ldHaIkS8ranmgpAtvOTHP95HRNUuaMJaNz2oHDqrNFJ8oVLbIC7UT
 CNgM6tRXgfLK9nXJ39KBzBHAXflILB/eoTLEgykEpIctgdzntr7A3xjhnHFlk93/KGogBdIzft4
 PgQjO5+3/+TzxWIlVGJv7uUky1Ai0/n6KWK33bcRt6qpdzx+EwZD4/lwARWR4W6PO6E0LvwEvBo
 gHHRkONnnXc77U0KFLN01MFF/quoo7+Cj09FU+f4Fh5Yxil+Jsh5XooE0uhQRLYhEWxBWKPATpI
 QwAKsZ+clVVBIXA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044651_460781_3523D9A4 
X-CRM114-Status: GOOD (  13.71  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/sata_highbank.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index c8c817c51230a74df721016eb80238c188d96d01..c387e50485b974fa2f2defc0bd1ea8cd43dc14bb 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -565,7 +565,6 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_highbank_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -609,17 +608,17 @@ static int ahci_highbank_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
-		  ahci_highbank_suspend, ahci_highbank_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
+				ahci_highbank_suspend,
+				ahci_highbank_resume);
 
 static struct platform_driver ahci_highbank_driver = {
 	.remove = ata_platform_remove_one,
 	.driver = {
 		.name = "highbank-ahci",
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_highbank_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_highbank_pm_ops),
 	},
 	.probe = ahci_highbank_probe,
 };

-- 
2.48.0


