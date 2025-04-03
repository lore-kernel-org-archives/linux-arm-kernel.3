Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ED0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igrrWjIKA7a8qvg8aOTq0yFxsHm/NBQIR20zcRQX2tE=; b=Z/BqlXyy0+GR6eeByhJcc2QkOK
	FvJdJEeist/uAyYy5Mu5AX9zFLSfn3MYbrf8/HVI8tdF42jG2n6mDvT9Fcgwxocud/k9Aod9J3GrU
	nD/ooWZPtqOAwiV2abXZtIdWFUgQLv0R1WpW/WjaxeJQYl2Bo4EaodY6vus2UWroHnhGp9fVbunf4
	yk3/R1KoWJlChlUqGfMxzPfzcvnljr3MH6XkvuUjW+/bgsTKTKbzIjOGPDui9a5UEwZDLMam25LLf
	jqxs00b0aDN6WlLUEQhOFqKFl73e+IdmPF93mkKz9Bg/WGrz+ynHMpp5djTUZJw0PQDgnDrZMPx+U
	BBnJmVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Edv-000000082XX-2H4L;
	Thu, 03 Apr 2025 07:05:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ec9-000000081nB-2SgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:03:50 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-736b98acaadso519750b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743663828; x=1744268628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igrrWjIKA7a8qvg8aOTq0yFxsHm/NBQIR20zcRQX2tE=;
        b=cF75xNeJ7SGtI4PIUrBKqZmN5O+TtZ7T4OWNwuc5pFnIK0e6l29PIKiWGUY38rqlWi
         fa5AeElFCxuMJuy31bre4U2Q0b5Q/2/IbC86v1tB9r5nnRoqVoyWN1rpPkb6kHYNAg3f
         iwh8Lv+qjdLgVBCTbwUPT2gkxusW2rI2qrbflHPFXm3CWjMfur3Cs8uxKf+Rg9rRDI9T
         XolJ9E6pIVA1DwqLzxeKzMA7rr9YpGSmyixjg+1f9GjaM+i5VgDfmrMsgCYW7c/q/8FI
         Q/3M/6JvlkYOqWVu4VTClKnUmNv41KwxzkG2R9pd/vwKU3hRrqeIDO5qPz7j4wFESPeY
         D8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663828; x=1744268628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igrrWjIKA7a8qvg8aOTq0yFxsHm/NBQIR20zcRQX2tE=;
        b=YjAnKGWWcokUi5fJxefWLhBP3v90fhAmiNugYELJVZbYPj/yVgkVQNKp5bC7R91uyL
         1deP4pvK3rBzO0A47zUeQPo5zwYMghzLilhObXAfq5/BAOX4TsU/tlLinaS3WA8F4qez
         /ng7nEoGcVMzZL1XoVpKaoxla8FOb7b4R8Qp3P17efBVyF7Y06UHojaLjz/Sm/sWrFT1
         e7WMwfOol/SY2eJVYXzQcHF7+Gv5FFKP4C9NpqkLXh4FilsPGIDZ7H7eiWvVnY0avlCD
         yJeHhnF1v3mnN9XCjbPzToe+4e3lrK9hbEyHLXxyYFsS3Cnt/s2LhheCuBDWrMQCf2V/
         PFCw==
X-Forwarded-Encrypted: i=1; AJvYcCVa0dAiba7uzpOydJQN+9lsVZUgy2x2YUpLrRviFkU/AqlgSoatULgE9f5AMEtiDK4vkoBPzwaRpLMbQu+ddmOh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmdl0+krqP/CvUNdb5ymaTm7DtlNf4Ev5QiP0HitB5E3mFiLV4
	qKEHTafnTDokA+0mEbBvAYBmpp1xhtVsNexveTJvsouD3Q+C+1T61/N48DtAWVE=
X-Gm-Gg: ASbGncsJHE0QLlK753nt4AOCvpSoOAAFPVczxndTa66OoGa/XGfHdIj2LN/Wbx1P4sY
	qtWH7e8y1DGZSlIwBaZ2TH2N7BkjLd1TCxdWlnhWPlvrVImjWWWN4seNxQdM/x15zmnzNEEzINr
	8atRFnvYkCbbvgrEvnhMUngh+G6w2srG+o0JBaebPLANbYSVSkzbAua0puK5302tYUAiUgvt1lb
	DpGy5aCdH7XOOW1mgd+16HWaOMOzB4ZB1RqBdjXiFtbgEf5msQlWAG/7aaKtY8ApPbc3nSumDTZ
	LGg+jJk9++DMDgSxtS7jbuYsaWGo/dFurF6Ex6lNEKbIR42SePbzp2NBH/K5YBxMHE6HcwQ=
X-Google-Smtp-Source: AGHT+IGvBTDG64dD1aEu97XOwefwRvLxgmE2MZM8c2Q0z/ib3acvry/82BosJjBqsHs0ikDVPGaxLw==
X-Received: by 2002:a05:6a00:130e:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-739c7843529mr6441217b3a.5.1743663828066;
        Thu, 03 Apr 2025 00:03:48 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3009sm717700b3a.123.2025.04.03.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:03:47 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	sugaya.taichi@socionext.com,
	orito.takao@socionext.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] serial: Fix null-ptr-deref in mlb_usio_probe()
Date: Thu,  3 Apr 2025 15:03:39 +0800
Message-Id: <20250403070339.64990-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025040301-unmanned-lapdog-5446@gregkh>
References: <2025040301-unmanned-lapdog-5446@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_000349_625911_075CCDAE 
X-CRM114-Status: GOOD (  12.86  )
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

devm_ioremap() returns NULL on error. Currently, mlb_usio_probe() does
not check for this case, which results in a NULL pointer dereference.

Add NULL check after devm_ioremap() to prevent this issue.

Cc: stable@vger.kernel.org
Fixes: ba44dc043004 ("serial: Add Milbeaut serial control")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Add cc: stable line.

 drivers/tty/serial/milbeaut_usio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/milbeaut_usio.c b/drivers/tty/serial/milbeaut_usio.c
index 059bea18dbab..4e47dca2c4ed 100644
--- a/drivers/tty/serial/milbeaut_usio.c
+++ b/drivers/tty/serial/milbeaut_usio.c
@@ -523,7 +523,10 @@ static int mlb_usio_probe(struct platform_device *pdev)
 	}
 	port->membase = devm_ioremap(&pdev->dev, res->start,
 				resource_size(res));
-
+	if (!port->membase) {
+		ret = -ENOMEM;
+		goto failed;
+	}
 	ret = platform_get_irq_byname(pdev, "rx");
 	mlb_usio_irq[index][RX] = ret;
 
-- 
2.34.1


