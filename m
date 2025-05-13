Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8EAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=; b=059fMjNUolK5iS
	ToSJc89qw+b/pZ74AjBuGCzj/R9S3OZRLbstLg8Or3Cad79KM/ly/nFJtJkXWhQ2UZUsn0Y7kJFLi
	fhgEqOrVUQiGmZQDfgbUrmTGy4i2j4CkA4GfstQDBgggKRW8inKPezExWeiOkVIEODrXvCSJ812Zq
	HhT/anVe9dwj3AIBZQfRJwQ7T1Jo7WsOXaBOJpxTt1g9GltNKW+qKGWRSHmI+WEImsTMX9lbcdrOd
	eks01Oh/2aVdT3wySfy45XjV2lMTPCQpBSERpVgM7sWO87mNmWYitRL4wKzu9Tj69g+H6/601ch45
	RCyD5blIXd1g8dAUHbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjKC-0000000BWdW-3q4i;
	Tue, 13 May 2025 06:41:12 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjFk-0000000BWCw-1xup
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:36:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-736c277331eso5554992b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118195; x=1747722995; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=U8FRweR5L1lPeXMlm8udSs7QIPB6Wzm6Jc/NNDVAi1pPSYGFsgTU7IZorM6MEHxunr
         NegKzhZpa00eFue+FRD0t3C3LTAdbQEg8A6kRqPEHRn2Yb7i/285hR5M673ATXqUiMIA
         ESZEr4KeCKx21bOXh28IjqcIUVYlQeu8LEO8i49CZzyI6/oton/KePphr+Trdp7d9rI/
         PMEF+Ny7grDlp2l5Je9DLsYNyaruuiZsPFCzib5d5I0QHdZ37f/ooGWTdk0c0fvoFFdI
         WtD8funk3V75DyzyrfklTB/Ju37d/qA0bcGjSzR1+k72K9iO7aycEeyjI/qPBUVxBxy+
         CwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118195; x=1747722995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=eava6a30CeiRH6b++CD/HJwUhQ655cv3C0R/II4gXQGWzF19MshWEZ7YQn53dQFBA+
         PZ4Hg0UzHNv9KOBIy1d/YMuCyZAn8stPow1PhntC+goIxpFimEGXWnZc4M+yQZSofNDE
         GVN2EuIjl8YCVQZ67fMbjxZqvE+L1y04PvXK8irtVI/N2ZnUxtJSAdT7zZq4p6SEOBBO
         Bdme8HIl94S8bOJQ30V7n6Mq/eiZvPB/ZR7doWNZIymvF3ppgcQg4SUb6qYEMOUPdwPL
         GaGKOhqP0JtYP+USBYGMPtJpzWaCZYMq9lRlSug8nIGRJCzXDOR0YQNfe8sJFBCfawnH
         dcPA==
X-Forwarded-Encrypted: i=1; AJvYcCXL1kC97XW+zTGGBtVqEAz/EuIu23otuKkFl58Y6UgbdBYbHnzlvtHa2NLJ046By3pU8qnnUYNAusRB/gnx+uTg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2sdjD6D8kFGZXTDAq3EMDLnMIS+5DOkWwEPgb7xCJdClLVB6Q
	X+nxBXcEM6gqyjsCbu/w9H0tOvkHjnjQsBDHUxqnaFIx8OzdY520
X-Gm-Gg: ASbGncshwOjbHzmZq4hdJ4YqaPFtnVoR9Q9NEv7LUvUdqXCpM8Lz24ETfVsBKwotEKu
	oQznYSfZCjo8tUwCRndkdUFTjpH9RCCUA1OaVxwmsCxCa0sccUrrLpfdPqI5x7xf8IfzxWr0YYT
	IJJ/linU9QD9sfYG0SkZNfbEKkOAiQ2JnzkcbAxViWBxAhvmJcOdas0a3NJUI2Qo6VGvd22jeyo
	rAHiRAscJwPWQu5I2BUq7XOiXQrlJIJdGl9QNWacoRRVRTjAUdKBjQANgkQBhZPznM8vgFlDJVU
	SKy9VjjoccXUSs1djn1x0c5uAWVCZDI2dTihEIfpt2bFjM5ZXSuVeB851tHcpSL/LQ==
X-Google-Smtp-Source: AGHT+IHAzcJWPedcZbhkiu5M1cagox2tF+zXlSND/8z+TRNJWT8nZ3aHFKNr8Qq+zyYM82VNJEGSQg==
X-Received: by 2002:a05:6a21:150a:b0:1ee:5fae:8f6a with SMTP id adf61e73a8af0-215eb6dbd7cmr3827294637.1.1747118194892;
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v3 0/2] i2c: imx: guard and drop prefix
Date: Tue, 13 May 2025 14:36:12 +0800
Message-Id: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3oImgC/3XMyw6CMBCF4VchXVvDtJSiK9/DuEBmgEnkkhYbD
 OHdLaxIjMtzku9fhCfH5MU1WYSjwJ6HPg59SkTVln1DkjFuoVJl0kyBZFVJ7mb5HrGcSCIA5jl
 iYakQEY2Oap734P0Rd8t+Gtxn7wfY3r+pADKVANrWUGuj0dyaruTXuRo6saWCOnL7w1XkqEGRv
 mRPY/WRr+v6BbXPuUnrAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=1186;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Zc6yQyorlVRgdIL0rSi1mnvWlZcO61DoFG74OAaARg4=;
 b=q9clC7BV7yQN12t9Wb9qmMCulgBg+RP8VyfC4iP7GyDFUeDvCVNVajzQDZyDIgsMVxU8yBsdq
 blP52SIuTgBCGH3U2by9e+djgC2nV65clel6gFiWKkG+k/Bnec9xulx
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_233636_511307_4A3F7AAE 
X-CRM114-Status: UNSURE (   9.70  )
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

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


