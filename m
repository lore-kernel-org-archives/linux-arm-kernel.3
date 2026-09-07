Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7DEC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=; b=MNlv1NF4SFuaVB83qRZqKM154+
	RbKB5FDVj2VakWv6OeoafrT03ao5Ga/3VuQw7P5z4ivQnFZ+dhFDQcXNv1FTG1v1l9NyXsxuqNDO3
	70fQtPC0dltMqBDxpwjvI4DwZtqvF4NERkYux5c2tmfQ+iTXdkkZxPbMoiryKT1LABXyYPxWGXZTe
	IaP/T1/LgFnzpA3f8PwvNY/8lzyh/SGLn8CZh0Y1LJK537G+zS5qTc+Ji0rG/PpDfSR3Vg97pH6WF
	F7kXaia8k+QM5Z4uHnIvYHcw3p0mCNBmCTC3XCNzRphBDAxwR2oz2NjiAtLKDiqNWQobTSFUn/Sri
	MSi9bZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ROJ-00000005thk-0eNB;
	Mon, 07 Sep 2026 04:55:35 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ROG-00000005thK-3SGN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:55:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2429453a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756932; x=1789361732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=k/TebSpDMmSzWO6Z2MsKiazq/Q36Nm7A17exR2Kq9f2TLdrqCrDdjeyiVs19peiukH
         89edC+AUVeY7FSG5Efa302eJrtFbve1jNY0iBPbR27zOTHuA9PhmVK19xdH3ZqQsKXyZ
         FgZJS5VKq41Gau1JC9C34/0/mRv4gKWz4yO4DjJp+l5bqzwsqWV8/EBqFXtTjYcIKsOy
         DjX2oNLsXslu5KRDtTqC0lmZpU2WHG1apEluvUzpF1biLuXdUzWVXcw7XZLkek/rpgdv
         A6lKKjQd2Sxpy9+Djpvvw7Gm9xunhl06H8SKCHraRjZhxeCmV84kNc64FCQo6oJ0Hy+j
         hdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756932; x=1789361732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=tYgwCtDgWjRM3gOAC4qxr2M7s707jXOymMWGQHh2npEk7yU5ZS7vWhuE73+Y0ErndQ
         rgDHfjzt9o8wnXCo7Pcv5sOSHWqcIp8mfIOm4yPluLGxi5T/aMVdUNfLIRUPgH93EnfH
         oorvAdYCk/OOmkWTS6KE5VdA/8Dfcsy4U1HVW0ty3zA4p+UX2utTEimiBjhhtXjBHMc2
         vOZOx9pkzeumtY4ABmiGzcPmV/AR3Pp4Q+ego1g/tpWnFg5Q29onlRZkr6+FD/FfDIEK
         VgjTsutk07GN84nxNySeml3OjC6SnkQNx8rkCnbAtHkh6LEk5YRKdcuxCUYubnJqzF62
         daMw==
X-Gm-Message-State: AFuF++nGnlOxyuSTp5X8P2eoPZaRwmhK0I2/oWv/dCYqFPoC6OX6FPnk
	h29o9UhPf/l0XJuPFeetJzmRv+oDD6lGVulPyvxaPzUmByE20gAvz/7l
X-Gm-Gg: AYBFou36AxN4N34I75s+90YZoKIqxfju73xurXs5CHHglCSuc4jtj9teQA3Kfg7Zocr
	amtD4diUY3Vsa1J06tXH2bLZWllNEi0nmCSSGDin4WMeBLc2h47rzzQnmgsaOI+ZdE+TkcIu+uO
	8SWwGGewEDdv46cl5odXF+gB32ZturgDKQo8q9jhZZwSSgSMhJzjMgQPRcd962kzpJ/xfx4EUYT
	HBh6EEUlz2X1EYoeTjchi1+Wp1dg0ssB/lQGSDZYFiS+S91aD0aOndJQnfm6aC0s7FTXUnIji1I
	famkeooVaNwiJD/YMflM654qsMKXWPr060IGzKHqACNv0yapxqpRjppu7EyhQxk6hot1op9Jz2w
	b2pXAco0vHg2XO7Bs2MBmepG69ixYiPdg6Oo7/6E9N0DLXA63x3z0Qp0dN1/86UMN0SwFPExbtp
	ODe0FJak6u2lJIglsH4Rydtr12yLdDoumgFdMLYHkpXE0jskgBkj9iQ6Vg4dIkRGlPr3QrHMOHi
	wSNh5NW7xLivw==
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr32156369a91.15.1788756931715;
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm22006422c88.14.2026.09.06.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: ab8500: Fix typo "interupts" in comment
Date: Mon,  7 Sep 2026 10:25:26 +0530
Message-ID: <20260907045526.18873-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215532_861312_488AE71C 
X-CRM114-Status: GOOD (  13.25  )
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

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at

