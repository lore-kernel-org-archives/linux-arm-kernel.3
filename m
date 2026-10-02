Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4101CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZEY2KuFMnZ9k0uAKqAQRBac5uCnzYVHzYqMLMLbH1Y=; b=1VvouS5zq6Y5Tek7a6KhFJUXUN
	JW6YIU456w+ZQ9q4WX5lWMr2AJIwrNQQ/8tIZx+6vbQoWAkYjV84jGhZAfvfDikuTWpwWWl4BROdN
	kRKks6bAW5faMszDT1f9mrj+kjHCkeF9f6Jtny/65uqT2MI4XJMpQP/hxRtMTkTGhtZ49lFO4pWfx
	BVTUdARyUfFswhEucZuCQXEEQQsUH+Kj0Q9zxftGigTv9ZIrQU6tZOr9021bW3z+yIAtaid462DLk
	Vv2nwwg0WMgVddfDFjdAewr6cga6f/P1jog+KxNUQiTXw8lTF6s7YnaJAX7GE7va9kUUrqyeqQRgF
	sMA0+StQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEq-0000000CQix-1hPA;
	Fri, 02 Oct 2026 19:48:12 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEn-0000000CQhl-2ahr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:48:10 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-9104e54b1abso3475126d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970489; x=1791575289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZEY2KuFMnZ9k0uAKqAQRBac5uCnzYVHzYqMLMLbH1Y=;
        b=VnT3r996I8ExMqx1kkT9bbPNHVtbuycJvMt/5tYBSTOCjVjt80SMs1W2gHtoo3NfJP
         9NSAdHeVZsjv5R+RkWBi+cSUfBg73fl9fvrJk5La4ksUjrmTPJIp0FuVElk6GssIN9Ld
         NoGZeRo8MoDkslmvgJeT0bv00jpZEcUYL++Ni4WCAIOkajqmPouWTWJZgNjFmcRCA2Bb
         Gg3RKO5L4p3zXHWkRfColh0qHK/sOwW7fmBPyzVuhRaogyaHoTMPbVjXZ5Qa+6cgvWgc
         vMSVlD+CCtzXaGvtURjqo9EVeZzBb7/vjW0rxqpKGjgEetIu2EzhTSoGN59flji8GmK1
         alYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970489; x=1791575289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZEY2KuFMnZ9k0uAKqAQRBac5uCnzYVHzYqMLMLbH1Y=;
        b=wDn4D11BxZ1BpiaGxNJ/AhqQrpdZQ3JWKtL3b2mlXETl8QlMYw8HeL3qqX/85lSONo
         ci/Mq8NxNzmLxX03a5lODCBZxR33Fo0ytDZ7OvFBL5a+g3TVoQ3VlvZJ1ZHJ0RNGkNmz
         O16gUorZaQ5+JGMYy2K905B6ySyUiT9byyh21Z/5YHEVErvKoVE5OyUHPFiazvzQLyRX
         UpxwkKFYSp/B8IIZfmUGtTkQqXWJK5787po/NcnbOMX/qROxR3WBsMY8xItH03P4Dd4o
         yYHT16W3/B/b51oeKQGFhbN/SoSjaob3sbjONpFH8fLhrHPl4L+XqG3qucIkeeshlyFC
         71qw==
X-Forwarded-Encrypted: i=1; AKwUvBznCvkvM4K4u8bKRUkcir/ucEgLbSs3Rj2xK+2CU2DOoEJMS4v4fYsKxA0w0NG2FNfcjEqTJIHxn31RTobFQH2r@lists.infradead.org
X-Gm-Message-State: AFuF++k7woIVrLU9AxrA/cg67Uo0SeDUNbknxyL8I24tawRjZ9shhrsY
	hN/HOeLtqB4Q34d26hrngfYhP7y2AjpSNBCmFaKWwv6yUz6RX1k8/Dc=
X-Gm-Gg: AYBFou3KYbsCLiZZDTR9tK/Wg97Cro67wiimgsw2W611ceuu6O77QotokVc3ckhO4fd
	5tSt5ImmQ0QrE1XSMAV1wLqD/pXIzkadAhEPNW9r0ZuU0EbmZ/Q0Ha7mFsNDD74pNI92fI7oNxJ
	/k61LS/6BOmy2NEgQp2eRR380LR1FuRnY0xfzLVpo0OyrZr5gXAT+iZo+GL2xgIVNzU3sFdEWJv
	xKMNaHjysZSX5QhXyCCgHjO0hEeqbiMQ3kmxo7npk+1b+1ipl0wf7kslmLIUuU82oj58KOhupqK
	CvNMFiC1Tm9U3ZNLNMWyDh8rAFeh88l57PdbiVwMtFUrqvku8ZBaRk8yuTJvNZKbtq7D/p9jV0W
	PcMrbaSDGkvOn2+DW3aA8/zZEaFuWi8v3yz+sk/9LSLhawiwPqSQNE2pjtgEAuSUURN6sUztxM2
	jzVsSPR66abX/OwfR+zcvj3pdd+IfLUTwzF97fHJxAlMAGPr2btDTui99LHJFq9oLMM2Ni1InxZ
	vTl+k/XVFFTJrFxL2/Kk0wUmS6rMq3RmP5s7ePoQksACRDsqw9izUxkEYGdD9Bz67XKArYxkyxU
	XCbB6f/W2Bj5uzSnM13kNvl86aIEqJJdov5f/GA=
X-Received: by 2002:a05:620a:1a24:b0:93c:ab1c:fc2 with SMTP id af79cd13be357-93cf18b1773mr713989785a.33.1790970488621;
        Fri, 02 Oct 2026 12:48:08 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ed5e2sm296846985a.47.2026.10.02.12.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	mhun512@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] soc: fsl: dpio: Free the IRQ before releasing the I/O object
Date: Fri,  2 Oct 2026 15:48:02 -0400
Message-ID: <20261002194802.375497-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194802.375497-1-mhun512@gmail.com>
References: <20261002194802.375497-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124809_663229_B3DA553E 
X-CRM114-Status: GOOD (  13.65  )
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

The DPIO interrupt handler accesses priv->io, but dpaa2_dpio_remove()
releases that object before tearing down the interrupts. The IRQ was
requested with devm_request_irq(), and unregister_dpio_irq_handlers()
only clears its affinity hint. fsl_mc_free_irqs() returns IRQ resources
to the MC resource pool without freeing the handler. An interrupt can
therefore access the freed I/O object before devres releases the IRQ.

Explicitly free the managed IRQ in unregister_dpio_irq_handlers() before
returning its resource to the pool, and perform IRQ teardown before
releasing the I/O object. This also waits for an in-flight handler while
the object is still valid.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 993fec7e11ca ("bus: fsl-mc: dpio: add the DPAA2 DPIO object driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Move devm_free_irq() into unregister_dpio_irq_handlers(), as suggested
  by Ioana Ciornei, to keep IRQ registration and unregistration in sync.
- Base this patch on the probe cleanup fix in patch 1, which removes the
  unregister call from the probe error path.
- Add Cc: stable@vger.kernel.org.

 drivers/soc/fsl/dpio/dpio-driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 8d31346..d8f28fb 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -88,6 +88,7 @@ static void unregister_dpio_irq_handlers(struct fsl_mc_device *dpio_dev)
 
 	/* clear the affinity hint */
 	irq_set_affinity_hint(irq->virq, NULL);
+	devm_free_irq(&dpio_dev->dev, irq->virq, &dpio_dev->dev);
 }
 
 static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
@@ -276,10 +277,10 @@ static void dpaa2_dpio_remove(struct fsl_mc_device *dpio_dev)
 	priv = dev_get_drvdata(dev);
 	cpu = dpaa2_io_get_cpu(priv->io);
 
-	dpaa2_io_down(priv->io);
-
 	dpio_teardown_irqs(dpio_dev);
 
+	dpaa2_io_down(priv->io);
+
 	cpumask_set_cpu(cpu, cpus_unused_mask);
 
 	err = dpio_open(dpio_dev->mc_io, 0, dpio_dev->obj_desc.id,
-- 
2.53.0


