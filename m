Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=; b=39l9oYW0qbAKtnvK20yEftOJwp
	p3MyMAhNAyMzZeAvKeDumIe4zGbrIjw29X1mTXJHXry3MsXlv4OUFPnZhPnO1daFdyKkvV1rgqAtB
	9U6pqbrEQnC/YnWKYGxzEefWGZSOZViskd0SgZjZ7dIvLuO8Vk71Ba2014bqhl4P2tWZhgZW7pGbc
	vQ1lMKi+fnjNBNH2ojmQ5uUUWH5rj3i49IyCG6yyOSQMSLpezRajqnzW2piqBXHcFq9Wqpb4878Yj
	kYMw8DCSbxSDbFDLC4WIx00KpXA1jfkMsTtIvTQ1u9QowjLamYXhh3POYfL8Z9pqlsC5gInEuWuN0
	+JejJINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevkw-00000002GMh-1945;
	Wed, 01 Jul 2026 14:17:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevkv-00000002GLo-1kft
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 14:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=; b=hvohUaUIiMoagOOkUVyn3vM/g8
	HIgoI0GX4f7A6ybtJ1tpoO6r38qnfpSHvvnmB9jj+AqB50qqCgFFeRfbCd9fw/eC7LRLsVvEvjRB+
	EtJw0OJW8tjFsjl02Dz0c93cWRQvSKBNpOpnIQ9M3wV21J4sAU1cSpcVWjO8JjPVozAtm80y4Pm87
	QiNPSYs9MEizADjfRnOAOdx9CgmrsaFSVl6QWet4Re4Efi8EGPscAlGHGCnLh0Zl1CUTokHW3t73F
	hxk4d9dGxRlf4BLTAhMXTK8TFo9mhzjDimaPICGrCqtDzIoV3ANakFJi1s7M0l5QU07//2Bz/eyqb
	n1EuzW6A==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wevks-00000002sMS-2QZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:17:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so5123135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782915450; x=1783520250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=dvPziartaECogdiyH4839GjCBEYRLtDO8JfCT5rRJDMhNWUViqBDu2pSdJl3JjWcD9
         MF+njOk86NA8SUJchAjtJGErLvE2nd9esGDwJpWRiKVoyWUITBGJQZ/0zq297Ta8rZMk
         PPt3yWABvf3dd+cmfjdJDofcgUC5OavnhYeEcRH69z3cH6HvgDqxAkpGdCwj4LSKVw9D
         PVRzUT9WWw6Cvl6xOOYugEIN+kpp2E0GuxawvXUfJInXAVzGf44Cfrc7tcYbgJ4u/F+t
         dvnKRhvqhd1L10h8G48o4FLd6K/qg7mCD5nKdAHfBPc2/qJd31cFsJ8tmgoqcwzi0Y/E
         8ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915450; x=1783520250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=hopA9vj7W43sWWZKx7B6f+sy+gLRkWoTASnyA+RYN0yjpV3dFjsJ6fPJicBjKuaDw2
         xECbVMOPZSDxcN150hjocrCESLWW9auqdFY2FI18vpEJFh3ZW4HMPF8SU4ug17ohnbrT
         2kxokCJDPj5U15+bTlNvaQ83jvOnqyEcorIKsgrd5bvT46BLI2SkXwwucfXf8zHoulpb
         zHivGbNig3PG7q5p5UL7FesBOXevq7XrLknOkunDMU898LYRcBuOhNi/D1/bmrLp943T
         EB2Y2ldaia3KiQUbT+wMFiGhrn2Pyj5duZ8GsFmxmbAO/5GRt874KHbHBoMYQcrSslQj
         fiIg==
X-Forwarded-Encrypted: i=1; AFNElJ+MFMzlSnrXb5ruD+bbzU2mvPwODZHmOBEJH7EjvLGzssCrP1OXzTCFrTb69g3zS1VTG09MPBIFDJ6n6TPa3CQd@lists.infradead.org
X-Gm-Message-State: AOJu0YyaIe3mbHMOaqdWqIMNpEEdGkQH2huMvAm7ePfFWSMbYxdbeuOQ
	aXKEWF/7Awnk/QIK7b5L9grEwyz2di6LQcEvwFp8G9a5d7YkRzrWr4bdp5VOyOzAoXRgyO3vNpt
	7IBiD
X-Gm-Gg: AfdE7cnrXWkIdj62T8qgtB3OakYpN3KObL8Zo4H2TQRTkrWSnv261P3YBfeXHGsT6sm
	g9ZxbWGgpkKn0Fj3nhyTJy49ZKhbkn3bq5eHZMX1C9I+h0kP4cmh7XvqREmpkFewceyJQQNU0pY
	dg0mU9h/lLFy4BWI4GAzIUUX9L4almZe69T+N+rXp4Id0mM0/r2qhM4CW+JolTin2QjbtjR3jA4
	c55vummgYOZFHf27lIOB0GViwO7pEbAhXm/RRTPRjuIMUMXZhYsEZc5Po2oayXCBWraIXDzazpf
	WXMG3x2m8hWctdME4LnR5JhRt98jMAv5Uj86LwFmmSexkmoc9KptCPneTdD8qew06WPzh2K1mJP
	Bktkx5lKBqkEnLgmvK9PtV+dylgDDVUBFeSzpKXpYBzrq20alSTGDfXQ25bv91hXpcHC0XRkJUe
	AZlzuJm+kYYFIxWWC0xhx0FHM1ULBVU7RTaZl7O/TcYiI5IA+hHTrK
X-Received: by 2002:a05:600c:4f83:b0:493:c064:316f with SMTP id 5b1f17b1804b1-493c230bb07mr25432565e9.3.1782915450355;
        Wed, 01 Jul 2026 07:17:30 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:17:29 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 01 Jul 2026 16:17:24 +0200
Subject: [PATCH v7 2/2] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_151734_753923_B1BE6672 
X-CRM114-Status: GOOD (  10.75  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0


