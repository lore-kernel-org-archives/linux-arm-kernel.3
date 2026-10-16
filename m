Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A957CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4bLZq1EO3Hw3snWP7J++9hibpM77l9B4DBDoATQxFi0=; b=o637xkjW5lL4lx+EMimWoxNCVW
	zje7hVnsiGwqluB4YSc9UWkWNO/V6gC5ljDptbk2BALe5cUZu8rb20IY5DxLWqpCNoB7nC05S2JW1
	YCe4xerJq5f7gZbHo2BqQssEO9bcQkXIznHoWRwqls+uhVMEmLQZJEculTirqhUGoVcdFY90FaV4M
	v7fsaqrT5DtKTX9oZtggQxnnJbPtockaxPzGbopxNSsp4sOyYGhlwDoz/U/2kUQiFZolxyOkXPYoe
	rzrCy4PfUBeK0NDi2g9SNbibDSRwbz30fFZU+nCjIdTCSNamjZEXsP9frAg/fTTHvYbVexa4bK0B2
	Q+DVarjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQQ-00000002y1O-1ekR;
	Fri, 16 Oct 2026 12:52:42 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQO-00000002y0n-2PHK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:52:41 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c410cdcab7dso22956666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155159; x=1792759959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bLZq1EO3Hw3snWP7J++9hibpM77l9B4DBDoATQxFi0=;
        b=De1dyXrOhtjpPZMmPmacGimQMQxIAbSLJdLc7dEP0GvEuYUmXNx9rSN+qOeRfKzJgC
         QTYYfEiXkGS6qOzTUqnRzY4cD+2Wwfnbxx1p4FsB8CwrE185Udrmse8hEutXl3RlovLq
         9Q+eYGm+BSetv6i+l+TryPl3eLaoK9GN4gQ8d2U91jkhMpgdewKPvgkfUwgWWclnl1ic
         FSZz9ka3E6N0bWaK7ypJPQwqo+fDDjblgS7W+gF5uN958WKZtDwIjRRsTXXIcIpiTiN4
         5Avl2DIagxUfwKXo56IlZuO3DodO9QOsiVER4ylwES49CsYXPqyNn6cxxkuTIQLQ5a2O
         0IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155159; x=1792759959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bLZq1EO3Hw3snWP7J++9hibpM77l9B4DBDoATQxFi0=;
        b=awBl3zLTWFUOmonaBGQUrn6FwJPJu7pzNBx4c7CU01aQiJjTPN8x0bd2WaDslIro9c
         nceaZXPmymjzMSZl5DQicpsvyy6zDs+pcN8S4JYj60RUvwS59j7ywVsZofJCmjHK20Fe
         GlKPvI97kI1SZ6e5WMQTgJzJDCBPAHgemdKdPgcJcRog2z+ADJQk+FODSp9jVt8FsYv8
         v5bR0XAkzBNghZOmaXYn1lGa/GvrokwhQRbWF/QS2Lbn7TD47Pl7DCuNOaJV7O6pOvQ4
         n6q5OepmoCmVh7JAWx4aZPwBV4hN5FnciEB0YC2zuvsR973odmDVB6r/dnAJ5fn4qUvn
         3ODw==
X-Gm-Message-State: AFq9FYK1zv/9/szfU/vX7wDtCVQBVNXcL+7XxT3ch8vOvg0f5y8lBt8G
	h5YaftmoB6sRyG7BVVhcnUO2MaXuUJfX7tm6/vXnukRRRz6TxYuB7KpT
X-Gm-Gg: AYBFou0iH9MYo7xijmuVPxHPghtrQCPVP9DiTHie0lls0QWfSYdbL+dLM8E10uKaacN
	hFTx1ckzTRkYotG0nWL4uSoE4mbHZ1oyFy/kOJ6C+pzEBWErUTkaPScS96mO9Uct2FdNlZGPfZV
	0J7yjqc18gLzhlBLnO90623G95kuv4wyFuMIWVt70Oxv7qAxk8JIFhIhQRzzULbWRMLzlLAjWpD
	/lj5Yi2kx4KbQ3uXhqt8sj4rwxQQzESDgnf/WDX/HksAgwI2lM2ZWP6bRupyuBaNluX6e+nOmYX
	sgFSlBu7D3J6yDUHIwO3q9+ocEGuo94fTHkq32GQLJREVMKVRQzjyZh0qB6VH77LwMix4UtqGx2
	cRrXHqpsW2wTeLveZF03bGDi1V986KHEPPexrpq2FO5sfAFU9ddFMOF6abripVQ9ozgB3EaKrzF
	edQTeHEIgvF+wEaa2EPoqDXo/Z0LIu/mqeDL6sAse7wrhJL3bVEhccM8crqAsqizUjtu+ssrCoU
	DxHSpFlDa83NOPbcrB88TzquYMvb2nEksKyJTxsbrlUTogs/ASin7ACAKVdZyyqimM7NESrQBcd
	FPad1/lh5mzv5UtMXKxxJCEsSg==
X-Received: by 2002:a17:906:4fce:b0:c3f:ce1b:9971 with SMTP id a640c23a62f3a-c3fce1ba820mr366288966b.25.1792155158395;
        Fri, 16 Oct 2026 05:52:38 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:37 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Fri, 16 Oct 2026 14:52:27 +0200
Message-ID: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_055240_625608_C35799D0 
X-CRM114-Status: GOOD (  10.54  )
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

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

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

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

One question left:

Are the timeouts fine, while in an atomic context ?
One second seems to be rather high.

Kind regards,

Thilo Zirnstein
---

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 68 ++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 13 deletions(-)

--
2.43.0


