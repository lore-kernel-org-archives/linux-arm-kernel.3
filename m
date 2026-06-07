Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2E1CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=; b=hVdc26IO6Re7AYEiocJ6J1AA/y
	uuzRWgbJLRlm4NPxjPrb42kNZjul6rPao2luvacNIS4kqoczQoBw6s6/Fie+3Qww/FrwyNerroAq/
	9GcnDZng03q3X2TQC6ocKYhGMzp1zw3kmMdfQvmFJc4qNes25/Nccxnao5ZsPhweO0r0II03GHZmj
	00/GNHB8w0pjlca57iGZWaYSX3rnvGpjyv/ZU9YBjzhfB6TtchkualQfyL1jaay67ozSMbGFyXTu8
	Y1x6NEFTm0TLa/dBkzWww+eYpyymgqnp5vKdUFZFWKcy2KhqME4L4J+W/8e6AKZNKGI4HTut1C3+q
	8Vm9MpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGPN-00000002LHQ-111v;
	Sun, 07 Jun 2026 16:31:33 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGPL-00000002LH5-0Bcz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 16:31:32 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-304d7f31215so2932687eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780849889; x=1781454689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=WthouSrhpIc4T2u8m7bktJxhF2+NL9m0BmvSSEjACR4QaUvNQz3eq8Qe69oiJnepQ4
         4Q8zaw9wR6zEvDzXItGTH4iJgUKNMuKSdIEZj78t1m4SXYQXi8q9aBoSotssbdoWuyBt
         nNy5O6g8MUgV10W02RlmpXDoziAdJzsFaJvlc4MXmguTZwa8L28ddfpjemCfqX1Ya9dG
         JahBLqHqN3owi0U9yxIxKoF6PFSqO172WAuQy0jFqrhXTwyCm3tfK5rrIrBN05/aIsU+
         uwkppEoe+ITPo/LAtoD8r6WMZPLSkIP+YxG6gYNeON5Y8On6WNrDf7oWykLsvyWCP6Fg
         W74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780849889; x=1781454689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=mhIqF/SdmfBHphIKYaGLtpXwB4GTTGpGrw7ycWgOIn0NWGUpxa6kmhKSghkFbLJ0Fr
         Pbp2spcUatXPNGBr0hBIKWKJ/IeErdRRkxyXiZY4p4dpgATi3ajgvNQONx4oSt96rMaj
         80zi9VfVX5ySLXTkNUXwX0fA0a5QODCE4ARDQ4pWNFXW6J49uFKBUVNduTTRqiTTWQ1O
         0/R7DLmfjDgWlxvJtVfGyV0yHC/jlOpP0CDokpAu7KSbJDQVk4wao158DJolU8C1+YOP
         /IiWFHIEbfwXOmgjcVMCnJlATe2rLamPWKnNomPrFs5s6ys/fsFSJHsRgYifAhk4G/1g
         ky1g==
X-Forwarded-Encrypted: i=1; AFNElJ8BxNX+InX4IWjggfLs/6NkpTw1cDZuf1LKUpXn1hb7NRZHJ3DZ1dDq0/ZXAB9H+03ZotwYT4uffgquWNNvQEYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6B5587LlZolv0VQKgssg/XqSGFclFUJY3rPgIjYwVPaav337O
	EvrmGARa/Zq4FkPa/bjFJZ4aXx5cSD3A1OG+8w7ffmfZqIy81HBIAfol
X-Gm-Gg: Acq92OEnyMCqcGMCwGc4Shr52bXEotiLdvIziMJ4EYDQ+j1XnHp2uQ/dCFG0wcPC/W5
	qDU5+Wox55hMs1aOKmw+pNsY4D1tAJbsI3Z0xre0QobvqKv9pWOeuQJ9967CpUxgFOdXjpo522s
	+uglXRzpRil04+JvPTYlE5VYz6EOA+s17mOCBTG9vujfjqi1Kv6m+woP05ydKsAS/LjGXNKRW7C
	0aD0F9yfdSU7hhx0lnJ3Wfwu/fkS8AVOTjymPU7nM4ZpxxbQMYGyTwwvOVVpFjC0fTVEY/5v8lb
	sRTv3UHRUJsr3CazQzq6yaR/kNAO963WkzblUc2G7pWgCSJgOrRO98v+cVhhJV1rBJ+v7d7yRY9
	wa6WGWRHze2I9d1/ZnEhvGDVzgQ+H21Hg+vXDoqZfR81mWccitLXBDATVA1Ie8TzGgh6EdZYGj/
	WTmn3rNRg9jp9+z7MDFpe7/XEQZlkmQiKAdDo3yb5oJFpt4+dm6UQUWVQzPeO0Fa49pQ==
X-Received: by 2002:a05:7300:6d07:b0:304:df0e:9dba with SMTP id 5a478bee46e88-3077b79d271mr6580259eec.31.1780849889307;
        Sun, 07 Jun 2026 09:31:29 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30777ecf9e9sm8906108eec.28.2026.06.07.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:31:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show callbacks
Date: Sun,  7 Jun 2026 16:31:19 +0000
Message-Id: <20260607163119.78717-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_093131_086776_870A7DE2 
X-CRM114-Status: GOOD (  13.66  )
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

Replace sprintf() and strlen() patterns in sysfs show callbacks
with sysfs_emit().

sysfs_emit() is the preferred helper for formatting sysfs output
and simplifies the implementation.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma.c          |  6 ++----
 drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 5a8dca8db5ce..7a7f302a9699 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -624,12 +624,10 @@ static ssize_t hidma_show_values(struct device *dev,
 {
 	struct hidma_dev *mdev = dev_get_drvdata(dev);
 
-	buf[0] = 0;
-
 	if (strcmp(attr->attr.name, "chid") == 0)
-		sprintf(buf, "%d\n", mdev->chidx);
+		return sysfs_emit(buf, "%d\n", mdev->chidx);
 
-	return strlen(buf);
+	return 0;
 }
 
 static inline void  hidma_sysfs_uninit(struct hidma_dev *dev)
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..9672ef9ee8fc 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -102,15 +102,12 @@ static ssize_t show_values(struct device *dev, struct device_attribute *attr,
 	struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
 	unsigned int i;
 
-	buf[0] = 0;
-
 	for (i = 0; i < ARRAY_SIZE(hidma_mgmt_files); i++) {
-		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0) {
-			sprintf(buf, "%d\n", hidma_mgmt_files[i].get(mdev));
-			break;
-		}
+		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0)
+			return sysfs_emit(buf, "%d\n",
+					hidma_mgmt_files[i].get(mdev));
 	}
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values(struct device *dev, struct device_attribute *attr,
@@ -143,15 +140,15 @@ static ssize_t show_values_channel(struct kobject *kobj,
 	struct hidma_chan_attr *chattr;
 	struct hidma_mgmt_dev *mdev;
 
-	buf[0] = 0;
 	chattr = container_of(attr, struct hidma_chan_attr, attr);
 	mdev = chattr->mdev;
+
 	if (strcmp(attr->attr.name, "priority") == 0)
-		sprintf(buf, "%d\n", mdev->priority[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->priority[chattr->index]);
 	else if (strcmp(attr->attr.name, "weight") == 0)
-		sprintf(buf, "%d\n", mdev->weight[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->weight[chattr->index]);
 
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values_channel(struct kobject *kobj,
-- 
2.34.1


