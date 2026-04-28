Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2C4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=koTQxkk4qv7km4iNuMHAOJaf/k281r1LMbxMyjh/No8=; b=nM3sGhF0KOf1Is7fcUzVrTIM4d
	vlUfB49f++TkCPei55qpIuf2E38aAMA19Rf8zLsbuE3Daku+XT6SVZCsibBeTf0BfzOVdwmGOoQZv
	zhTYhY4JK7wy3Jo3IL8pAbTWQ4nBo0hehz+UlHns6KavD+7JO7+y42agUnNEA35/BWrPvxLnQNwM9
	aOIEdg5muuAhQM7J7DcoKIOERcV5GiTIaNhzm8Oh1pnbcQSF4mojB5duqlDmuOFFQ1UxfeyPgolh/
	HmQrMPIlIdVklCULRQkgbqoX22ihi/dg/kqtNXpBdCN9ZohXY3TIBeGOF9OBCwUysxz6EErnhjE1K
	bPnNOb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoDR-00000002ALr-1GnS;
	Tue, 28 Apr 2026 19:35:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoDP-00000002AL4-29Gn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 19:35:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso7733918a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777404926; x=1778009726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koTQxkk4qv7km4iNuMHAOJaf/k281r1LMbxMyjh/No8=;
        b=pFyxJ+ANu0akK+vFzfNcCAEYUTSY/bs1y7EX6ZlMEmeRFDncddznc3BB0RkCHuyRlB
         tfZJvFhFDzHDi4o/4vTuirQFv+pOnRTb/Hirkcr3kpxfuHYfDMvO1qKNAsXRjos9dXRy
         yW0Rix1guNSFYeIq7/6ryfNO/q70S+Lx6ettQWfeChyLhzwv8k1JiOHadLQb6sw6t0xw
         8jW9mlGRcD3n0Nim7EZZiNDdNiDvF87zmHfE5FJk2xUXN6djdiuD+ETCa7x7cfhuWvPT
         QjzY6KJWNfcxWufHELjqNwSvARvk15jiSMIEanCHywyg5hjVtX2FpDS3BadXyL48YcHw
         GKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777404926; x=1778009726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koTQxkk4qv7km4iNuMHAOJaf/k281r1LMbxMyjh/No8=;
        b=VdgBBZg9f+bV38luqgrQbTDiULOkzSAoJy1HQ7WpqA/DXASlrqVzwNspi//7lxx2Zj
         asad78vWlu84mKyNbvWxww4s+pe7COnEitRsjZX3eFmYSDLz9fne5BvUPv5MX7FX/PhM
         nc3uZ/fFl3as4x/SHhq1cwVUkgjhuEUezOU/d3eItX3l/XBi2Z7KRhaKv8WtNAZbqd2w
         epkaOZAHTe4NACKroNIE5uCww0RyaiyySYF1jHLEldt+h/Y8qYMm1KZ1FpKMsCroFTCw
         t+I0eN3+H0JW7ges91xaVzx7M5PTf9PPI0jRdbC50RV0/4OyRm8PlOfoLeP8U/KXgNvb
         wDFA==
X-Forwarded-Encrypted: i=1; AFNElJ9wkNAmx09Alb3HI+Cafej3go9bPM34h88jhFnfiy5pHkxuKEgdOG4/Bu1Rygp0c3UkUzpXKawB5IV0+ySU+zuF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/IW6fRAud8IJQY2NMbfIXXp13sZBhSRMDrON4Z4hKHXM68niS
	JBnEovFC4tAf82ivdRIyF74yqz0qtnkXhN/L91BfDUZll7I9rvXOUgnS
X-Gm-Gg: AeBDievAMqBScKkJ6mUTGRSZszFXPNc5LiUTmLH+DfFlZO1iPHeApikccs+7N/ZFcdh
	H0mWsesrXg2bX45F3D/UX00rS+aQAwwD7a/yiK2ag2doY2l0IdB+epupFP/KypSSjJYI/KWXr6b
	0l1gh39Xa7epU1i/c0cDozBmWTjygBCwncOfZVcWKkHgVV0ViHX408+NYhbotT2HvW8l+sTdDzK
	Ra8aehh2xDRlkVqDmYqJ9Ho4X8WaTGBp6MXd+8n/4kXRwMb52aqGk/5LFaLAu84h91x2K6Fzvup
	PeyxYP7pdCxeETDVMdDsBeu7PRY9cPhgyEdiUqNcKawgFyDPeqXVkxirBzwmT/a8tA4Xlgi01TZ
	tn8EVJN3orWih0Xwjw6n0FV3lEW+FqQarLR3cfNuWOqxqfBgQ3ikqlRwZpjtYz7ItDXisCDUVVV
	BPCtqSYePgYXrsp9O25wYbuCRE+c/atvsN4fhdbS8HXGbYYV1uee3zd0tCNw==
X-Received: by 2002:a17:90b:3506:b0:35f:b784:d3bf with SMTP id 98e67ed59e1d1-364a0ade6f9mr721896a91.1.1777404925971;
        Tue, 28 Apr 2026 12:35:25 -0700 (PDT)
Received: from LAPTOP-N4V2OTAG.localdomain ([49.36.186.79])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc29b40aasm3196706a12.12.2026.04.28.12.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:35:25 -0700 (PDT)
From: Aditya Dabhade <aditya.dabhade066@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aditya Dabhade <aditya.dabhade066@gmail.com>
Subject: [PATCH] phy: airoha: use C-style SPDX comment for header file
Date: Wed, 29 Apr 2026 01:04:59 +0530
Message-Id: <20260428193459.5865-1-aditya.dabhade066@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_123527_542975_E801345C 
X-CRM114-Status: GOOD (  12.02  )
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

checkpatch reports an improper SPDX comment style for this header:

    WARNING: Improper SPDX comment style for
    'drivers/phy/phy-airoha-pcie-regs.h', please use '/*' instead

Per Documentation/process/license-rules.rst, C header files must use the
'/* SPDX-License-Identifier: ...  */' form instead of the '// ....' form
used in C source files. Fix it.

Signed-off-by: Aditya Dabhade <aditya.dabhade066@gmail.com>
---
 drivers/phy/phy-airoha-pcie-regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/phy-airoha-pcie-regs.h
index b938a7b468f..58572c79372 100644
--- a/drivers/phy/phy-airoha-pcie-regs.h
+++ b/drivers/phy/phy-airoha-pcie-regs.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2024 AIROHA Inc
  * Author: Lorenzo Bianconi <lorenzo@kernel.org>
-- 
2.34.1


