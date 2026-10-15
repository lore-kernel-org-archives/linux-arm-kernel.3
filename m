Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73C2CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJuw0HG6b0/g50rFnImD3mqXWKPn47lEKfqXU/zgoNc=; b=c7eUt7CbYXDGF2WmsP0ZRZI2s7
	BlZjz40hFQpaLwkm2Gk0mzmEqAAP8GnxYO+Eq4KuJgFRteAI4mwjUB8NQZbkD6e8JxRO3oG9m8TP+
	BfftjPgs5L2eQrm8VsOfWpmkCnoAKlqs2gV9RSm8kgo2ZuBOwoXmf566J+ARMh9O2ZJAIwZrjYu/p
	aJ41g3AmbBsfpmSkEGwUnRjsZQeDMdHVPTkXiqecDdeK4wH3LYJC6f6sbmp/rZWqTONaE01vSf8wH
	PAbQvYDLD0keD5A92GRFs3dFRtj0nAvtTvvOyVaB7BFlfYxpXszajlLlatnSau2BvD0wI6Alcoadz
	//7gybag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGYw-0000000H7AL-1MtL;
	Thu, 15 Oct 2026 08:11:42 +0000
Received: from mail-ej2-f11.google.com ([74.125.228.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGYt-0000000H79D-3YJg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:11:40 +0000
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e25574351so104002766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051897; x=1792656697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJuw0HG6b0/g50rFnImD3mqXWKPn47lEKfqXU/zgoNc=;
        b=s7GDslNoMP7+QxAP5qgkBPSR4J8QSaTib+8pMUFxZv/NgEPnB6GN8aL0NCaqLP5drH
         0exr+zM3O25DlKDYYTOWRWYvHT631prmSAestOmOq6nVLeAfJVnVlkpxbGpgOY9Go9Uk
         B5Y/XABvLR5YAGCFVna1Ed4fVTxmnbkEBerhN+uiZIcJ583zeTbABUZu56FM5iisMvbp
         5x/G75KSnFygI0Qn4UTsHXpqLvDgZfIQyZe1WgPZKMChBsLQGdA9kCjRn33k/3/Zp/Zu
         bK5FNaGtzpdulGcXiWQ+mtOgw0DbZKJlCWQqra+vcAGe1BatPwYHne7Bo2CLWE74sN4X
         UcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051897; x=1792656697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJuw0HG6b0/g50rFnImD3mqXWKPn47lEKfqXU/zgoNc=;
        b=ASYsqH0XPi9t5at3iYS/2T5wTEyJyusOS12w3MMEjxDdKLD/Dkqfs8BigejZ86+9GG
         DuBEQ8/si4HSeijPFiCnY9rjkw6BUz4I5UJchJdqsWuWdL6qHkLfHUwiMgfWa1QmyaJE
         /481MhRBqbbaxnPCH1MTLDqYSyQ2nDTY4ByVckeoEMMLf6xMy6zWOruwi3PH5WPWmziF
         i9201uifV6rUX/RJF+7Mg4xt60Bq2N4wX7GDvO/QzUsclyAztxtysuF61tUspUwIAbDR
         G92gqVLQq3MAO1qB36rWn1xeIaBI4d/6aDPSQrfYi/2Igsb4OfzyHg/IOxTkL67lSC9J
         1Cqw==
X-Gm-Message-State: AFq9FYIy0d+fZMWijAAhpcHP1CcKsLnpwQF3UY+8vqgXTCv7DqriZn6o
	56+5vqp/jXHgUveHHlOWsOVtXnzgUY3hfRTEMOCIAMKeMYmsU9fOl9v0
X-Gm-Gg: AYBFou3e/FCAqS60+87U1ZYy+4sVPKJpBY2n/eNyL3hmR+VR4rT7eGT2lM/1SUQXNsz
	ghX7we3JL6q5Y//QeZXgp26G8E93AFgSxFbhLO3QWQx1HyZ77lr4KGODZ3HvuwiDoXbOyEPXaJY
	ulk302UI4Ek8VCdl4lAgD9IDPHMXkpTlqFQwqY98/vNh5WqmT4AM9/bha176g/H6tct4V0LUwkt
	wspLkumE0uWvs/dmMu4i2bqKuTs2TMiWEYB+I4aDU6e5how9ZVPjy0+PxAauiRxWVTO52nCPAx9
	bvdMZcEdoHc/HNQ2GUXTx3LZbJdLaKujRHnGoyNNg4aN4vL7HKdruRZ6RLrdxX/5VYERd46VNPL
	KTOBfk83eSCy78cRJjPyJPst+5dfVW+zNlInXAlAUaTK/EDChvtC01owpTYE/jnkrmJaMbxiM/z
	lBF2tMM1jPnGUd9KpgwRmqdAz1M2rMdAxwgqAH3oGRvY3X/CLhDm9Z5J/sTPFVHDOQGyjwRlTrx
	hbSwfHZnvAIP8HC5kpXg6dgn4Z71JDw9SY+QA58cmb6UW/iaFCTBnUJ4OrZRMZqe5ZPoWuEBBEz
	fePJ+GRRo/GewnkvqbTaLbhayg==
X-Received: by 2002:a17:907:3f87:b0:c2e:2e1b:30e3 with SMTP id a640c23a62f3a-c31aa00e12fmr1974043666b.21.1792051896835;
        Thu, 15 Oct 2026 01:11:36 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda5297b0sm96080666b.63.2026.10.15.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:36 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v2 0/1] i2c: i2c-xiic: fix clearing of bnb irq
Date: Thu, 15 Oct 2026 10:11:26 +0200
Message-ID: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_011139_900759_0CAC525F 
X-CRM114-Status: UNSURE (   9.96  )
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

Dear all,

This patch fixes the clearing routine for the bus not busy (bnb) irq.
The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

I am kind of unsure which branch to use for handing in my patch, 
this one is based i2c/i2c-fixes. 

Kind regards, 

Thilo Zirnstein
---

Changes in v2: 
- Unintentional changes removed .

Thilo Zirnstein (1):
  i2c: i2c-xiic: fix clearing of bnb irq

 drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

-- 
2.43.0


