Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D763EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mYu4oax/thewz4e+p/abSxr+bcjcos4iMdBqH/7SF5g=; b=yP3i6CVvoKAthwuAVKLWgxUYPn
	PWggR7ovGBoHreOnr/3zZW08YRDQihd5vGGRPtaXJOT06Mx3i+SnKTBWcWr68yyXQ5ItpZ5nNiSNp
	qSxGpVdo2/JRNPUNNUfEpY8KxNCZVDRFi2rApLXf1ZEGhrxG+Dul4ZzkmzdYLF1mDVcYq4omtQ5fi
	pDXaGZaV+ry/XTcsZejKj1ksKorYVhpmRe0/VRFQE3Bn7i1sTSxFlZEUXC+6t9aevpWJuFE4oOrwM
	wYAGRYRP2+ALYrTI5D8eFFxRYGm6vKtHV+uyRDZaccSVSI4spLYvHR21yq4ujyzloCm0fDqIvZ4yd
	Z1BbAphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troQk-00000004LWs-0mMR;
	Tue, 11 Mar 2025 01:29:14 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1troOv-00000004LJ5-2tCQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:27:22 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c549d9ecc6so14682885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 18:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741656439; x=1742261239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYu4oax/thewz4e+p/abSxr+bcjcos4iMdBqH/7SF5g=;
        b=VURGu+GhR3KhyxSixA/vjWqAeZUbP+C9CfXmEJR8CxUTVFotg9/1WMy1yOqkIynT0F
         fpAFd03YQRq9Pg05E2uEI7PCfGGdIwi5h+E/lxYxFfW2+qbGpZXK4CJtwO+NeINjGV28
         pROj+dypq0jhlddkmHZ5tst9zCIAcGZ6sgd40dE80R7+5INTnHJXbhvyHBXYcarGb6/U
         zA+AbTKqHyVp6vnqpgVwuRrIrVerDpH+tORVMKuV162qfL4GaN5z0BmSOfXKa/Z6DiHg
         Z/sIwBKRkz1LVx7bUQhSPrTVfnUgS1R8TT6ydc0sUivj0NPd55fwBBeRlk6BuvZW4wAv
         hiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741656439; x=1742261239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYu4oax/thewz4e+p/abSxr+bcjcos4iMdBqH/7SF5g=;
        b=KYHxwxW9WCi4I7zQ1UQxWN7FUhv7VpyCckekRzCYaTspV4ObKKo8NcqJJ4LMiczvJB
         Ui1GORNQPOZHEOYpkeZB52z7LEpWqqKAGL7asjEYMzKAF9jFA5LndEDP8n5N2fn5NxA6
         U9d0WJG5j2VjjOw577gVb7lSdrFjR1eHRLTLH+ZAx6154gpYQOhkSjeMLq3QvYY7GEqF
         Rf4J5j/8+BxgbO7VWxiRE7kEKK9lHJ9LQRbL6K4iDFnJW5gyAYLQPEncb4rkFBZ7FIGp
         lRcHtwxhsbj22iekbYLEmrpTd0pEHSjs0CYFF/EtVoo3+C9bj0kg2pXjdOpUoH5tEfU/
         murw==
X-Forwarded-Encrypted: i=1; AJvYcCWNHabn4Y2me55XXB2a0EFwTPDdkXHMAqOT1kSMxe30VjFKuAkrsYHZJoF+XDsIjCve97gqdd9DnMZ2IhhtU0Dx@lists.infradead.org
X-Gm-Message-State: AOJu0YweDo+zv+vfHUzzl6dR4h62KZCopYFtbN1LTfipkbK65Dz5M7s+
	psck7CkZO5YkW+LrKLD6rDxYLf78j446TInfcWmQSSmnS9iEd5c=
X-Gm-Gg: ASbGncuic3zqP9gDYXy+m3SWtSFAU06EJRn6NtkrqoZSieEy8C4gTtg+99NXevZjbLd
	IQiXvxnJOJIZV7b/aNKOakiyLbOj4kPe70z21n3WE8hTaeN+QmP6HFRSALCgqJVc3sYtaRCqeqy
	aat59ubxO1ui5IRPH3+jjaTGKp1OkN0aapnm5F9pIcU68I0s2rAtd0V9+awyhjFg3vNjTHBc7KO
	87moEy4md4MkpNUdG4nb8vWz/lA2Mv0toAHZ3dcC/cnzSDBtd2oKeDl0Qy+SiwpR/UVDkGzOP/8
	oEiryC1JuXO9codMKk3xcUM3Tb2MKWKsn6udscmq6g==
X-Google-Smtp-Source: AGHT+IG1lIg0zhgXXdip9xAmm17KRNm/AUw5DrBkAQ32s9Cq80PSZ7xrsQWtT87xxvnN7LcqufT+vA==
X-Received: by 2002:a05:6214:d06:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6ea2dd1e540mr10215056d6.5.1741656438961;
        Mon, 10 Mar 2025 18:27:18 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f70a2dd6sm65178346d6.61.2025.03.10.18.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 18:27:17 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: gregkh@linuxfoundation.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
Date: Mon, 10 Mar 2025 20:27:05 -0500
Message-Id: <20250311012705.1233829-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_182721_735280_96A39D8A 
X-CRM114-Status: GOOD (  10.08  )
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

The variable d->name, returned by devm_kasprintf(), could be NULL.
A pointer check is added to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02
("ice: Fix some null pointer dereference issues in ice_ptp.c").

This issue is found by our static analysis tool

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 573109ca5b79..a09f72772e6e 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -548,6 +548,9 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	d->vhub = vhub;
 	d->index = idx;
 	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
+	if (!d->name)
+		return -ENOMEM;
+
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.34.1


