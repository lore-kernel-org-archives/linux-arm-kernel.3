Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7170DC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=; b=PlvT6GowubmZ2i8iMLnR37GM05
	iUtxt67ms3P+H4qEI7rKmJwvPO9Bb9J0ErNIr87tjfP9c+jVtpv98ezZrI+Kykb3R8JX1mdI3WXh4
	alizu+/Ssg7QFeRlkQpA+GzaitXeFeQ0+reyOhU1YDzu1IE5mZenVqFvsOFLYBrlmOmDQYtYQ35H3
	RBZHOB1vdp1ywDZ9cdxeozxRCFX/rMUmL5VkWYlN6aN4HKcLKpLTWllfZlFYtFEzLby5NW9MEb5Ox
	3FB6Z/YZriAbBNPyVlV5gXJQKRIEs50iJev1alGkpMp8oaf0LHqYZfwM2eMHelofVPzl3FUwZPY+4
	4Ks7APcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5yy-0000000FrB6-0kUe;
	Wed, 12 Aug 2026 10:14:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5yv-0000000FrAk-2Jvq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:14:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d049069377so8335015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529684; x=1787134484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=VK5AltX6Am/z+hs0pG153yIFqc4p3u6BkAJ3WlhXe5GIkHJ56x7Fsr1I1ofWyubNSo
         +teDfXihO4n11IseOV9u21/jFEzey+8ioBNvaMF2j21E5Gywk4B5x2SdlRC0S+LjShNi
         1NDP6AmSfs7PD0nRspOkcZycAs1SMsRVZpLeewhC5YpZolkDEE/XjjibvaAD9wulbFSk
         CHeBewSdFFI4hA6wm+gKypV6v6bjhd/5PPLgUPK+6VXGtBUqPZUcwxOocd3iP23StbxC
         BShgmeSBeyA1m0lhgogaEcDdtaQK8DMXVXSiMibjib5RyI23x7y10tJVGT1CzITShwIX
         JRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529684; x=1787134484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=r1p8yz02yQtejfPXlmV+vaMbzBONN5icfYUnibHe2dnCbQ6Jgfy0k9eOb0jbbaJJ6H
         YszRFch+bM+Ow0Bu5X6Zt8dzweeFUDQbBNRt/39wMYm5Nw7/aFcSs/VnF3fEWgkBZdVx
         ugBDDH3XYSxF/wasWZKJvu13FzxBYf5cQuxjZbygQfeg/5u/NtSOPgeg1IgO1KInDImv
         ChRY2GTza4r9p2Yo82cyXpx4TqjsntF0NinkRJ21z22qkYAiWZshlFuynhBKfImRuT7H
         SCr/e0UUWQVbptLVt6h9j280Zrg4csjySd3fSb8clCOOs2AN0/Cb3mN9SKkeC7pRbrTf
         WKtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF5EonYLN0HizQLnJ2w66O3ZCpSwGuCHN3aHG14y1HR41yhSQLd9wjPWtqGzgGYcsaScVF49Bfx4mQ6B5Su6si@lists.infradead.org
X-Gm-Message-State: AOJu0YzWFsZkIKeKpS8PrkN1tUM08Fl4HUVq7e0eUwC03m64z3E7p9gk
	KiT9VmvbgT62PD2b8FafLRXkHelwrpkR93OVWRizLR3PjFcGSnWV5389
X-Gm-Gg: AR+sD13p/Gf5RqAYvJTNy4BmJzd+gBkzvdRf6wE9+gcwuOVKJpKO1Ak9gYY9tNlnBiC
	yP5GUa2GWF1UaCcx4msD7zFm0PiU/+3H9M1eMxuNRv+UwZ/PLEZmsGhPznmmcuzky8e0pzkWXoN
	C2fakZrgcTDLETqxiwYOq5G6Mvt3OfSYQGZKcg/pzNm8c1Y6RrTTK4caH+4hCmJ1yjcUiZ1x9PC
	mw71lXOxb9Q8Kyfyv4J7MwcWqR0od7NeIlKJjMSOSuAYHc+wELVmPYZlf7AdulVoDbtieKEIwsZ
	THs2y92Kil/SQTmu8FI7/MQJNqy+yCS97XM2nXaN5gGz/ne0XtcFMjJKMlVu7Od/AOKEH/AfM5D
	0LdvQSG3fALO5ILv2LUIyEBE9Vvr+t4Y3V2WE8SNkJHhdQXp6AzlGey9UUxTMsy6zBMECeZcYjc
	OCnKY/dS5UNnoa+GkO0DYWnsl5s/3jXailrIGpTQMmPjv7LdI21psQxoMn5W6Qv3zxrSpPRrqfu
	jFj7lIwnXaq5EaJ8IbqDDmyRQ3VkjsTKDpdfNaSjqFtnzfb4tvCRa+VBjM5G+XG5jAu5IekuNBf
	Goq7
X-Received: by 2002:a17:903:11c6:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d3452f5c1cmr45156165ad.8.1786529684542;
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: mxs: Improve probe error handling
Date: Wed, 12 Aug 2026 17:14:15 +0700
Message-ID: <20260812101418.37966-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_031445_608026_50D77E01 
X-CRM114-Status: UNSURE (   9.85  )
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

This series improves probe error handling in the MXS ASoC drivers.
Use dev_err_probe() where appropriate and remove redundant dev_err() calls
when the corresponding errors are already reported by the called functions
or further down the call chain.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (3):
  ASoC: mxs-saif: Use dev_err_probe() for error handling
  ASoC: mxs-saif: Drop redundant probe error messages
  ASoC: mxs-sgtl5000: Drop redundant probe error messages

 sound/soc/mxs/mxs-saif.c     | 21 ++++++---------------
 sound/soc/mxs/mxs-sgtl5000.c |  2 --
 2 files changed, 6 insertions(+), 17 deletions(-)

-- 
2.43.0


