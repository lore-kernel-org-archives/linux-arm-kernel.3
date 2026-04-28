Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOmVa5HEYXAhxFxX5dmA5ibLhZjG/rAPjw3EsQuigAE=; b=trR9YWQio77zxgA3vUfS73sK8c
	I2t7jRt/1mmArbBbY/bzt4UbP5PodvhFHnaVUh3/rME9/23bvoJsx36HAmlXxERqoEg+4QsVqLC5b
	dCOOq+u89gH6O30DOdkOF9kTIOAIBPGLeaq6yrnHa6ffiCyu0sWlw0EQ+kehsEg76GNLnnjminIEZ
	ndWD96M6s7Py0jIy0yPeB3ZfSCq8qhyhG05FZ2H+nqZ+iuw5vuDJ5lagnpfmGuNW/S5nxCs2viZLQ
	k/zPkggCnc11CioqPe8olzUrqYTw0lRSCZf4740QxNn1q3uRKDd5AS5t/vNbQEtnkKMx2G1h5zOkV
	SRJwYdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd29-00000000n1y-0AQW;
	Tue, 28 Apr 2026 07:39:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd27-00000000n1H-0uu7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:39:04 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c797d8c9c2dso12048183a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777361942; x=1777966742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LOmVa5HEYXAhxFxX5dmA5ibLhZjG/rAPjw3EsQuigAE=;
        b=fRdRgiCx9lE0n5SivfW6wapR1OOC4FjCr2VSGbIgn5Zl6rqfZdlE0uqSPfrYPUTXdr
         A0B/iL+cUEyovtPT6hnq4a2im9CRlH+0IrFfJlbBh6+9d+UJBr/arXwewjpceoIdkW9l
         qsx4s3LVWRde1Bs2Ze5gcS6MZQteMbHnqPCoE7irmvWaz3tMmrNMt1kuaupM/I9K3XqR
         aClyb4Ee2BrvO46ViZamGDEgE92gklR/BTYiEO05i4cxo+T2pTpZd2ABcrP7rTc+nJfp
         sYmEsOkw1iTj7rNDObDc/NinAJUTUqyLlRXK2oDkQBXCvhsM/Heoga6eUy9p5QHJt/OE
         kYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361942; x=1777966742;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOmVa5HEYXAhxFxX5dmA5ibLhZjG/rAPjw3EsQuigAE=;
        b=oc+wouzVqEaNlU2XshpatZnIgDlHJCtYScHjX/YXJnYWN/FMBw48sT47wnQVV3vpi8
         BQPrfG8Y+l5H6kBiE/ZE4yCGuQBuIuAX8TYxmXDXtdADxRK45dld4K6oU1eMbrlvYsEx
         fwGLsz9L9MEMTQATWFm38cA8iQ/PifKUUWCupPK83RoVND5XofzU4aCtX/55KBkODRoq
         KQ2Uvr23ZIHqFFfDTxVt9Di4EnEFgr1s/sWIKRSQQ25hijHVaA+kEYSAlwC/kr91aEHB
         9wlizJRwxZeADGbjNhRKE1VoAnfxMLseDYO+oSR2yuTk1ZUoZSw9Upb62FMh+L/Ve8d5
         jaPA==
X-Forwarded-Encrypted: i=1; AFNElJ+HVgSlqsy23V0jghCZFx5g7lJc6vQREmOMtAXCw5DhV87S+l56rWFrjC02kyLGeiiOMlvQ4eUjLjMSOIegiwzG@lists.infradead.org
X-Gm-Message-State: AOJu0YwbD1XAA/YH+W3CLeJsxo+qKouab7YObd73/ZcQVB8puOXNun0k
	n7ZkXH3wl1vf0B0TzNQCXvUacoUClddNtAVP9qZMeHsBSfgehDk0sEnsGGFt1N+E2L39Hkcsvl0
	4wbbY2bv64YttSLip3XKqp342ew==
X-Received: from pfwy28.prod.google.com ([2002:a05:6a00:1c9c:b0:82f:a201:42c7])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d22:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-834ddbe707fmr2002397b3a.34.1777361941509;
 Tue, 28 Apr 2026 00:39:01 -0700 (PDT)
Date: Tue, 28 Apr 2026 07:38:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428073859.1502047-1-joonwonkang@google.com>
Subject: [QUESTION] Is the ARM SMMU v3 implementation designed to always
 ignore SSID when SSID_VALID == 0?
From: Joonwon Kang <joonwonkang@google.com>
To: will@kernel.org, robin.murphy@arm.com, jpb@kernel.org
Cc: joro@8bytes.org, jgg@ziepe.ca, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stimim@google.com, cychu@google.com, 
	hhchung@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_003903_258657_03A48E1E 
X-CRM114-Status: GOOD (  10.98  )
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

Hi team,

According to the ARM SMMU v3 spec, I believe that SSID should always be
ignored when SSID_VALID == 0 and the current ARM SMMU v3 module
implementation in the kernel seems to comply with this without exception.
For example, when handling an event from SMMU, the implementation checks
SSID_VALID(SSV) first and ignores SSID accordingly. If there is any
exception to this rule, I believe it is a bug.

Is it true for all the current and future cases? In other words, is it
**mandatory** that the ARM SMMU v3 implementation ignores SSID when
SSID_VALID == 0? or there might be some cases where the implementation
needs to refer to SSID even when SSID_VALID == 0?

Asking this question since our HW may not be able to clear SSID when
SSID_VALID == 0 and so there might be some garbage value in SSID at some
point of time(the HW will have a correct SSID when SSID_VALID == 1,
though). If the ARM SMMU v3 implementation is to refer to that garbage
value for any reason, the result would be devastating.

Thanks,
Joonwon Kang

