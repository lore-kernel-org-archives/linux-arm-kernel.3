Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C05C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UqB+ZcdPBHABzE32jG4dg74lCIilLL5SjMXqW/Mf2cY=; b=CEXPOFVWINkPLFIVZhQsyhMosm
	kLOF3y/uQNnH1fyitnzAr0F6h51h03Whcvt5BPaaI8q5TxnzX38cKKwHUFXEsA8d/r6L1EqfYVEHU
	t8btz/SnH+W0gQdnZrOm+cqhaeglpKP3DeNupbwlJ6coyn456rX5mXwT/CXcVz574ArMzoptGgpO+
	8NCCzWwPjExCzhk3S/D/TkAHaJtTU9qA9hYusFmd4k10FSeg6GA5eLDcXzT3Y6q4ekOp2mhhitOct
	R1ak1HHv5lICoMgN7hQsSBYFoWx7XENmQtnAtn2AKfMRaqgS7x0x+nM7sjufwkqUp/AlXo2E7k3K3
	J3vYn8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeLp-00000001kGO-2FYl;
	Fri, 17 Jul 2026 08:55:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeLj-00000001kCI-1XXJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:55:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4953f64372aso3153015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn.de; s=google; t=1784278512; x=1784883312; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqB+ZcdPBHABzE32jG4dg74lCIilLL5SjMXqW/Mf2cY=;
        b=dswilyn39X2k5HNOgumjbjT7BqmAClKHqqBgZEzxch2epF/+2JRkdshVXrgM2UJuuI
         dlUrjvBri7YptFlRdttpij9Ldrt/xSJYQHraESyAhOGb8/5iizMETWKcojQnsrpANaPo
         H9C4U7zmY74kmAKWs5O0XnAAlQ19xfesINkqFeyr+uIJWdlYWZSNbjqTwFOLGao40sD1
         HAcYEGh8w6yC6BVV3BtEkh5XOokNfBrLEWklVl/2plEr1rz6PNqplIYl9hXDA3tnKwRo
         iopqO1ygx8vxHhPA/6m5UesdbH2mf0iIrPG+S3/gNazZ2fFw8cUVynYu0s3bbiaw3MhE
         FV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278512; x=1784883312;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqB+ZcdPBHABzE32jG4dg74lCIilLL5SjMXqW/Mf2cY=;
        b=fxAJaw5yzxaz+jWYoyNYPPW0ghZO5PWteYMdc6ZSVYDIPwheSX/+jIlaK78+bZ9PYe
         S79QpyLYIYrMX27pupU1XNw4rUY6lOTI48bDU8XaTPC0U4K8JRyX6DO++VLjeMC3d4s8
         HkwNMSQOIPD7IRoUdDE8jJLIT3roi7bUbPIibSoKafn/k0F3VG3LuruLAtZnCf5Ue/ok
         qaq1hRYFf1xsCLmroPFtOsAmHSYOoDUV58hsYKeZeLyWtLUIPVdiPM6oAldZuFlmr7Qd
         y7744BLdR/sAUF+urml0z+D1Hi4K6QzNSKIIvZldbuq/WbNng4cxmFspjXYIjBoLVjHB
         h9VQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2jnWaHK0TIdNedNwBfv50K3qISSevsrZSHMLfJtG+6pLOx/+vqe99fAD2TAr2BIBs32rsroZDLcgfcsZCjCwR@lists.infradead.org
X-Gm-Message-State: AOJu0YzPSXKmXKXfIxVK5Xk19Nx/Kc0QXFlzEEy8bRupVZGUd/o+hXTK
	u6fDF19i+Ylndpud7JqNpb0LIe+0aqibTDrBWUTQ3V4YJr6IE3jZY4EtqpKOh3IXq/i1iIOFFSC
	k24nr9fak/Gyb0CvDtUS4S0jMCm1DDqmkCJIXcfvTwRQy1ANzvM6GbRGBgufJ2X7Gnj5xOQ==
X-Gm-Gg: AfdE7cno8Lo0UTqCKFDJvX9xsov7g546c/+w9UHsm/QxoLxKZjZj8HOuf0u/ql+F9N9
	b5yvV7c4nUtqkDZJYuKGRdZXaQPfMW/Aapi1lLaliQRHBrw74ltqgz8EUvqhes+55t7BI/SpaiY
	e3yF+TrFGJNv9QIc9FCre5EmNLhvP+yNaVM404BBzTcS/FW+cWRJhg7M/y/fJBp6ELYyFO4Ubh4
	VPfrljwziFTK/aQe4InS0RAJiznss1E+qf0YwMRAVUNaATtPN8KTfi8OL37s2JahFVvxVhaLz7j
	tBS5G2yonG04k/syP8WIOBUu4+p9NwlQn4SdLGy7YDgptY70QItmNUqP+aJlCrC1cjXZEWhof7j
	MbseHJgUgoA0wte177HPBwouOKQqV2apQzkK60A2SKD4AFHGTHLES6R6Xh2/t8hrsZYwLXwhBV/
	J4AR8okhadZ9m2Q+W6soLCWEVz2TZfhlxzKnf8vxSSJj0qVJW+pF5DN9WE
X-Received: by 2002:a05:6000:25f8:b0:472:da70:a45 with SMTP id ffacd0b85a97d-47f62344544mr1249749f8f.8.1784278512306;
        Fri, 17 Jul 2026 01:55:12 -0700 (PDT)
Received: from localhost (dslb-002-205-021-241.002.205.pools.vodafone-ip.de. [2.205.21.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e52f81sm2193727f8f.9.2026.07.17.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:55:12 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: Andi Shyti <andi.shyti@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: iproc: reset bus after timeout if START_BUSY is stuck
Date: Fri, 17 Jul 2026 10:55:07 +0200
Message-ID: <20260717085507.34209-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015515_720528_571C9731 
X-CRM114-Status: GOOD (  16.55  )
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

If a transaction times out, the START_BUSY signal can stay up, and
subsequent transactaction attempts will fail as the bus is still
considered busy.

I can easily trigger this by attempting to read from an address with no
device, e.g. when running i2cdetect. After the first read times out, all
subsequent read attempts return busy.

To get to a working state again, the controller needs to be reset to
clear the START_BUSY signal. So check for START_BUSY still asserted on a
timeout, and do reset in case it is,

This is also done by the original non-upstream iproc-smbus driver
implementation [1].

Works around situations like:

    bcm-iproc-2c 1803b000.i2c: transaction timed out
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    ...

where the bus never recovers after a timeout.

[1] https://github.com/opencomputeproject/onie/blob/master/patches/kernel/3=
.2.69/driver-iproc-smbus.patch

Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
v1 -> v2:
* rebased on current master
* reworded the comment and the commit message, as I found I could
  trigger this intentionally

v1: https://lore.kernel.org/all/20230904090005.52622-1-jonas.gorski@bisdn.d=
e/

 drivers/i2c/busses/i2c-bcm-iproc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bc=
m-iproc.c
index b5629cffe99b..86ca4c2221c4 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -803,6 +803,17 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2=
c_dev *iproc_i2c,
 	}
=20
 	if (!time_left && !iproc_i2c->xfer_is_done) {
+		/*
+		 * The controller may fail to clear START_BUSY after a timeout,
+		 * reset the controller to recover in that case.
+		 */
+		if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
+		       BIT(M_CMD_START_BUSY_SHIFT))) {
+			bcm_iproc_i2c_enable_disable(iproc_i2c, false);
+			bcm_iproc_i2c_init(iproc_i2c);
+			bcm_iproc_i2c_enable_disable(iproc_i2c, true);
+		}
+
 		/* flush both TX/RX FIFOs */
 		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
--=20
2.55.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294 <http://goog_1008408251>


