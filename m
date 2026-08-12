Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE29AC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuY8RYmCvrpYmOBlOCc7chInxbHssgRs/Cgm87/Wy54=; b=j2YPYBejTUxBRjlcXl7Pe/0SaM
	w2HWy+vnPSWEKZ8z0K/O59x3wiDUzQvX6J/MiOnrieWFuulx9TdvIpIpzL0Tz2egwBawxEPUMuqF6
	ZfHR1a3fqxxwkmX5WEvVXFJsVOm50XtqO/hsEN1QSzWLtvvbq/B9gVxHLI9g5OkZV39dSEvSp+t8P
	3w6z8FS43mKNsKAwMGscGff2eBQC2uVdk/CK562SUtW9XVJJlFaG8Q6aH7IvZvuJAGNwgSF0p+3cA
	HevvJqDi9BO8SzDC2/CUXavgpqgKurVlkpccgxiyYjAuBBktSFMd1RC//HkB2UOmXzrX+wcVOgocy
	zXcnxW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5rG-0000000FqLT-47sk;
	Wed, 12 Aug 2026 10:06:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5rF-0000000FqKx-0lju
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:06:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso891995a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529208; x=1787134008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuY8RYmCvrpYmOBlOCc7chInxbHssgRs/Cgm87/Wy54=;
        b=W+MzumasYHNA4HCVh+dqRsrCNTNqN1UHid7IC8m4AnMamVFFEsB1TEI3Fi6zbqqEpn
         nX7QuhRKg2jxj8UERdcx3zz922TzheT1IvtYIKsiLPUIMcOgKS/AtnTmFzOobKAZqyf6
         KKQa8vjoPibk88IrQoA7J1HMJFArfy4DdzkzIANNibu4k4WXQzNNpyAyKPTmV0+DzNK8
         RetYvRDw3mXXmalSc/7yuqzhnQ3fMbAYz5kfS1xoQ25t1hOyTicAVwtmEX7tr7joh1LU
         ykpADByDiwg0W2Zwh5gcGIhsL35tlMOWxAVIHaFdnWXQlkg+IK/yfd6wB9FO37jXL6JV
         PEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529208; x=1787134008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuY8RYmCvrpYmOBlOCc7chInxbHssgRs/Cgm87/Wy54=;
        b=ssAzWSC2fuvSUBlwGOgqNIvgfzgadNfvfdszOzgRkaM/B9j/mMTxIo4ExIetcF2QFd
         2q+bGxgNg4Bj6SGzrofQ14eajdcfXA36sn7AVKgtE4klFUqvf3htAqaNQ/lHOkXStOlt
         VoPcuLEunEhaUH6xLwQ+1O/778SPx995zctSqI7hZpFczNN2FBB5lmUehnFZOHkx9LXC
         s7ZNngjQJTaihpD+VGsMpIkM9fhl4MjBa7GMJhrZjCtkhbo2G8VeF1YgtE8XMw9R8TJV
         okaT+vpMJ0PiEyjlzt3rztsvh2+Zh51TDRg/9dSbTyuV1Nvm11dSw5WR0W2TGtL5fd9R
         C/cA==
X-Forwarded-Encrypted: i=1; AHgh+RqC/Ndhb8bzoqxGl4YN+y6IYO6XIx9mxSjjjIk/TsKQTjXtqKNFp5Z20DuEcSwDIq8JPdNv/jzfrTqg9vyJdJR1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd1ZH/00JrszBbCYvhoNovgaw9rJ0x2u1FfrjAdGmASPd+p5Si
	96t3kCMuIK/BHc5dtIvzcGepazPNrjJ6U3dghk0phNvEMkQsMN3NV69d+21dZVE=
X-Gm-Gg: AR+sD12SYl6mNJ3BnKjflCYmdN0erdsR7Ei1VeND/r4g+xl1P6YQTyDJygii6rmj3nm
	WwCPoyuQMJzvNzMBMBKfHTIuda2vHZJKt8ePM4tyNDJ1qsoZ6i0H2YY8HIcYp9Fs9zM5L8YdLEZ
	lHXMxtpfQ/QmPytup+fyKhn7KVvdODKJF4psjNNcXDmOMyKceQbKuj87K1jlUKwZdJrj+yl8Kfp
	JRhnwLZQ+037cNuh+20KApxsmaIewXTVgKmbZn0nJStFQueNgomhs96do7v2njuoRbnUiXxj4W0
	LTdZHPpUJXf2FTbtOlmU/0WLc5Upk0YURzH/2W5IuCeTcbul+xrHG3XWuB7SXWRHa6CeXAzlGxb
	5PrizCf69XxNreiFLGYTXrg8FiG8fkEcTvFZeP6FJMnnjkNZErscr4kQOID2q+OEMlfslcThnPx
	Qv3BDqCnqo+USj/r8cP235Su2Xx+XovykqVih7Z4NiECrpWu9ZapHlqz4X5G+mPkOX1IfWP/n3c
	69wgug=
X-Received: by 2002:a17:90b:384f:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39301244f91mr3492177a91.8.1786529208099;
        Wed, 12 Aug 2026 03:06:48 -0700 (PDT)
Received: from t-rex ([27.59.124.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm8581549eec.7.2026.08.12.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:06:47 -0700 (PDT)
From: kr494167@gmail.com
To: jassisinghbrar@gmail.com,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2 1/2] mailbox: cix: validate fast channel index before request_irq()
Date: Wed, 12 Aug 2026 15:36:22 +0530
Message-ID: <20260812100623.36939-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812084742.22081-1-kr494167@gmail.com>
References: <20260812084742.22081-1-kr494167@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_030649_274538_487EE8A5 
X-CRM114-Status: GOOD (  14.05  )
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

cix_mbox_startup() checked fast channel index constraints (index < 0 ||
index > CIX_MBOX_FAST_IDX) inside the channel switch block after
calling request_irq(). If validation failed, it triggered a free_irq()
cleanup path.

Validating channel parameters prior to request_irq() avoids unnecessary
IRQ registration and teardown churn.

Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 43c76cdab24a..615218c69eeb 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -403,6 +403,13 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	int index = cp->index, ret;
 	u32 val;
 
+	if (cp->type == CIX_MBOX_TYPE_FAST && priv->dir == CIX_MBOX_RX) {
+		if (index < 0 || index > CIX_MBOX_FAST_IDX) {
+			dev_err(priv->dev, "Invalid index %d\n", index);
+			return -EINVAL;
+		}
+	}
+
 	ret = request_irq(priv->irq, cix_mbox_isr, IRQF_NO_SUSPEND,
 			  dev_name(priv->dev), chan);
 	if (ret) {
@@ -448,11 +455,6 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	case CIX_MBOX_TYPE_FAST:
 		/* Only RX channel has intterupt */
 		if (priv->dir == CIX_MBOX_RX) {
-			if (index < 0 || index > CIX_MBOX_FAST_IDX) {
-				dev_err(priv->dev, "Invalid index %d\n", index);
-				ret = -EINVAL;
-				goto failed;
-			}
 			/* enable fast channel interrupt */
 			val = cix_mbox_read(priv, CIX_INT_ENABLE_SIDE_B);
 			val |= CIX_FAST_CH_INT(index);
@@ -461,14 +463,10 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 		break;
 	default:
 		dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
-		ret = -EINVAL;
-		goto failed;
+		free_irq(priv->irq, chan);
+		return -EINVAL;
 	}
 	return 0;
-
-failed:
-	free_irq(priv->irq, chan);
-	return ret;
 }
 
 static void cix_mbox_shutdown(struct mbox_chan *chan)
-- 
2.55.0


