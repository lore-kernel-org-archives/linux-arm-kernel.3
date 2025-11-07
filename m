Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D36CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wFg4sEi9OuCa1c0qwdmYGRON1nIlfIlliXKoJp2VYg=; b=FsM2lxhczxT3yUkjyrAX8R+0b/
	XkRh1Spq2GjH33rI7ydUJFrTWFqrS4BMD+QGzk6joQcZ23c4ASbEgX8dWM7KMobiGekJ1pgq4wjD8
	NffAda7EgxCPEKC8cpIyTGxVQcqYX11t2G+EmXcPyePmgAev768r8JVLMP9z8OBoBBmbk2n2EBKec
	SdZFxoAQRMW5GYSYO8JZUyFu8W2fBBYH8q1h/pK3j4yxlfNL1oALOHTkmA8JTOr1QRnXBDha25me5
	bVVOP6YSIdCrQdPa3iFo1WDVf9heXUNcp//boQV6Ev3D1GNQpc9gP+8daX0XKu980D0vKT3PToTgu
	CCXpU3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLep-0000000HIYJ-09p8;
	Fri, 07 Nov 2025 12:33:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLem-0000000HIXv-1P8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:33:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2956d816c10so7893285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 04:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762518811; x=1763123611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wFg4sEi9OuCa1c0qwdmYGRON1nIlfIlliXKoJp2VYg=;
        b=ApeySBz+sBDgDZ+GNF+hKh6WHcZKIlIVoqJQEe5wWeIGOJrPkCqSdKNd4kzqWqS7yt
         IJd7Qr3VyKJz9blN6Bj8FrjoDQiyML9y0gFKeiwF4v7nmEAnMsJ7HtxqAeGUa9u6bErx
         AhYxzrOU1aDL/eAqPAJchYrFb1ZJIxSfe5EtUML5bI4F55aTJvjBSSMMd4wwhtrXiL8I
         bwynDKUy/Lts2SeFTP8KLr/ajTeYBInehoOe/i/ba+26UrkLwxqQx1sWL3jrBuZPLAPc
         +81pfEyKh2cOWjQ0EemrZqeN/HMaSTr1LnGxMJ3fVVbDJs7NQtipA5+Y2BSdz461BFKS
         nWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762518811; x=1763123611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wFg4sEi9OuCa1c0qwdmYGRON1nIlfIlliXKoJp2VYg=;
        b=Ap9EZqXqHW86wz7Tg5g9SRfXwRNTAPO/ROjMpXRXYUUBbKzhmmPxrxVGxIYat1WYVk
         VIlN4wVbTVsWUOngdPsx8OO0b6drsUfHMcGvuO+FBNB07R8UTdZ1/7+BSLYosl1YPFn7
         rQhYGHWrAyBX19HnZ/1IVxBuw5kHNZGooDBLasUBWFkUACJP//IVSjAp6oYgtkxYDaBI
         OldjYwC75QnMojQo0UpEB/Ue5bMPQ4uFOC/5mA7WfWwjuN4YLPTNfkJMkDZ9RclvE80Q
         tGMmE0z8Y6+iEMz2lf2XEmZX0p8Q+r3om/pmpglg1fV/9A88aLyLm6SS/wGe5VVLfmxf
         FcKw==
X-Gm-Message-State: AOJu0YwWr2O2dHveqC/OTUaVdYe5JnDGQOu8nF3K5iB1lzNjXey9v7ad
	6JibwTSoBH3K6yrTMmDy0HCGhe481asCE9Gfsb3hhlBYWZwXhopCznBz
X-Gm-Gg: ASbGncvukj8ndYi1oV8d/lVmrX9p2oEAwUrmlUTmGjQGOfFm5QN6adjbJUaEgoo5x29
	o563ip9b1LCaPLvdoGRDLc4e08l4Vv3xgrRkTJR9wVCi/CA3LyqLX1wGn+SBCiNvCQKcgM4Ypib
	UAOtUX6ciPnqJXTzhry2j+TEyp84YAgc82USc5MHkBO6dTSi+M4p3zihUx/dH73uA0q04qehil6
	bDcuZ0CZu/wFyPmJivG3iIB9VxvquHEPkTthJmJVFfjBg+rsunbsvanhy7sDraDJdtQh6qlg6qH
	SbHDBOJXtrLK/OV3UPWBUWVtG3JgYTSjUJeGZpQBkxhDBQcmfEMjQyXpKU9gaKnX3SzeG7SPNFD
	UnFrobRpZHNXs2n3NrSplfcjTTIjUocz4/2c2/yCDt+xN3RKIaTOyBjqEBSf56p09rTMxE3H3dB
	t6PtNmTIyw7ev/ioxTw/d+V6Wm1+e9ov4QDL1QRC6sU1Eel47ggX1HthbOBIXvBGM=
X-Google-Smtp-Source: AGHT+IE7z6KNZTDs+X3lQn5orUAZb91cr+qoIc5amPGDhp4Mbj7m/pXX02bL6DNNvigWgocoVupEPw==
X-Received: by 2002:a17:902:ea11:b0:288:e46d:b32b with SMTP id d9443c01a7336-297c03ad66fmr43022505ad.17.1762518811194;
        Fri, 07 Nov 2025 04:33:31 -0800 (PST)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([27.57.191.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968269sm58959735ad.17.2025.11.07.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 04:33:30 -0800 (PST)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] scsi/arm: Clean up coding style violations
Date: Fri,  7 Nov 2025 12:34:34 +0000
Message-ID: <20251107123435.1434-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043332_372128_F9C863B1 
X-CRM114-Status: GOOD (  11.42  )
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

Addressed checkpatch warnings by separating assignment from a conditional
statement and documenting the empty for loop. These updates improve code
clarity and maintain style consistency.

No functional change intended.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/scsi/arm/msgqueue.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/arm/msgqueue.c b/drivers/scsi/arm/msgqueue.c
index 58115831362f..7e09624e5505 100644
--- a/drivers/scsi/arm/msgqueue.c
+++ b/drivers/scsi/arm/msgqueue.c
@@ -23,7 +23,8 @@ static struct msgqueue_entry *mqe_alloc(MsgQueue_t *msgq)
 {
 	struct msgqueue_entry *mq;
 
-	if ((mq = msgq->free) != NULL)
+	mq = msgq->free;
+	if (mq)
 		msgq->free = mq->next;
 
 	return mq;
@@ -99,7 +100,8 @@ struct message *msgqueue_getmsg(MsgQueue_t *msgq, int msgno)
 {
 	struct msgqueue_entry *mq;
 
-	for (mq = msgq->qe; mq && msgno; mq = mq->next, msgno--);
+	for (mq = msgq->qe; mq && msgno; mq = mq->next, msgno--)
+		; /* intentional: iterate to the msgno-th entry */
 
 	return mq ? &mq->msg : NULL;
 }
-- 
2.43.0


