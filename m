Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE7E78D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o1b7RIKx9SG9rqe5Q+J+UEipoUBnibJMMTqbkHDlz+E=; b=pOBHi+kGouOd2AdLbxFbwEx1dv
	FTfQgNjfcOK8SD4Xo65OPDQsNsa9bRrqbu1Oi9g1OnE1dEcs4CyjHcZ5r2DTRPC2Csb0BqX9NM+nB
	vFNZ7tkp+9+40qtRqgTH8D/NtaB0Q6q6sIvalS9StN98Xdza4Q9XJeeMKK3eX0ix3ZgY8Nux6adfx
	IVgPEwVRMP9JUw8xwCGGnk0nTHhPWoKeG3ZCi/V34XyX0CuvepY+dYit+kzt8MjVAP8ZcxZQg52Xn
	e70ZvFHHoZ/blnRDQewr+LE9mp+xuHakPdqNoYYUFPxg7avpLfMoeo3ksW1ddXZRrjnP36f+sws4m
	JZB+M78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMjW-0000000F2p1-1Xw5;
	Mon, 09 Feb 2026 08:35:02 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMjU-0000000F2oA-2vCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:35:01 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-354b20c1112so2048431a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 00:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770626099; x=1771230899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1b7RIKx9SG9rqe5Q+J+UEipoUBnibJMMTqbkHDlz+E=;
        b=M0nOxVZ1ldM+VEBl1WJ4xnuuIVa/LHM0AcrmTQM0fVFEYfGNy4S4z4zKrd9naUdSIQ
         mlV2Ws3EfUuUEL9arc9KIkEwj2PWcpS+hX1NTXnY0tr4svds+fr6EPZeOYniJ4URxa27
         gx7geL49guP21Dr2g340dlzG9q4yey5UByS6wTaw/sLvdZgF3vyVi2nvmnppnzNXFqpL
         VGSdyUNXm38oHN6MHpLqDl/kudgUd6egDH/mJHVRQzNxNBx5qcc7dbw6O91o1lOKcYqx
         FLTmtCVb8VSsuRtgbf7gHlHqkaSx2S7B0aQAW8tuQWLgYqS06N6/fzN/O7xmIdcauDat
         Phhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770626099; x=1771230899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1b7RIKx9SG9rqe5Q+J+UEipoUBnibJMMTqbkHDlz+E=;
        b=DErNmtOe7B6xEfB4KdXrXSxne55jCTOnuaE1egBMDkLPWKUtKCs2acdqk11wbrY3AB
         nneFQJ0i1aEPKRd+HrC8w9Jr9m4dRa72Z234nU6cd9JmON7ckw1pewus+xMin6PEUK9z
         5tzHi4VcfCyd9sun6qG6rGAKCLBt9Oigp+noeu3JOr+ruXt3Qb2DvxlOA2ScQtth1ub/
         dKma5QIMB5UUwHS4zVQc/vzaaJpyYviHnST4qWv0W9YjEhxTvh3TDhdifcShC2m3qHK4
         ycKcWdvreTvff4wp1ewPdV2Jynwz8hFOd9P7uVv133dMiQCfn0iwHiINukD7azQpVQJ1
         8WoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE4hjDRJYBu0a3wG6jFv7qe1tCeH70UEIaA7YiYwxKRoKO4lgleJVMTDdRdaJvEMKxJZCtjksOqMvI8Bl6UDiA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/bNJr+Aw8OircGRYeYyXjNSCNYfeWBk6p+VbdEgyHLTsCCkC5
	JOIu9Qb5vyIFjHj/mxMXWyP8HttivXy6q4HtayEXSPnh7NZ7TcyVNVyb
X-Gm-Gg: AZuq6aKYiUVq7vnc/sn7YatV77/6+kJd0op1jqyHfJZ0Sj33s3Z26Nwz+2oioZT3qwx
	aaYG4og0kRg+EIoFqoV39FEB1LXqCFde+4TFUN2V/+FQoPcozJ0ihp6aaotPZSuaDrLII6VJvLi
	/jYolPHnFxWpQ7UwAsVN/sCbFMV/dd9EUKMr/u4gWuyi9FK/HQpaKyciclS6I5C+wEg05k687FI
	//T/QmJpaBqWN/ZIOu2BuV75iFrW/dXn1N5aykzPnDk1XJxk78XGuUeu62l4V2TkLusbkZwB1wQ
	95ZK2UsUrtjjhMqFEFps5T1RNJ4+J0lUev2xEz79EMo8/8xEqSB0Ngev4WGQuRdmhrscqXYFQD1
	Gan1GN7ka03Pf/1ZHLIz2xeZ98rh8sGuTC68J3vJcBJmRwJfku6HRjmhF3ZgdYGz2+Uba+1jntC
	U=
X-Received: by 2002:a17:90b:3811:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35624f0b45bmr5484681a91.17.1770626099450;
        Mon, 09 Feb 2026 00:34:59 -0800 (PST)
Received: from wud ([111.4.10.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b21fbfabsm9748432a91.12.2026.02.09.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:34:59 -0800 (PST)
From: Dylan Wu <fredwudi0305@gmail.com>
To: Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fredwudi0305@gmail.com
Subject: [PATCH] mailbox: cix: Add IRQF_NO_SUSPEND to mailbox interrupt
Date: Mon,  9 Feb 2026 16:34:52 +0800
Message-ID: <20260209083452.154983-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_003500_738193_2BF49711 
X-CRM114-Status: GOOD (  13.43  )
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

During the system suspend process, device interrupts are masked in the
noirq phase. However, SCMI often needs to exchange final messages with the
firmware to complete the power-down transition. Without the IRQF_NO_SUSPEND
flag, the mailbox ISR cannot run during this late stage, leading to SCMI
communication timeouts and error messages like "SCMI protocol wait for
resp timeout" during suspend.

Add the IRQF_NO_SUSPEND flag to the interrupt request to ensure the mailbox
can continue to handle responses during the noirq stages of suspend and
resume, thereby ensuring a reliable power state transition.

Signed-off-by: Dylan Wu <fredwudi0305@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 5bb1416c26a5..5e27c2bf3492 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -405,7 +405,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	int index = cp->index, ret;
 	u32 val;
 
-	ret = request_irq(priv->irq, cix_mbox_isr, 0,
+	ret = request_irq(priv->irq, cix_mbox_isr, IRQF_NO_SUSPEND,
 			  dev_name(priv->dev), chan);
 	if (ret) {
 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq);
-- 
2.52.0


