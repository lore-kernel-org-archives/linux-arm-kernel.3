Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B429CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=; b=bv1FfaQo09xOcNECNkhs/qcPvZ
	CG5TOk5uv/bk2kGWftMg4SPX13Cw4HmpuIImXSI0qS1pLPVBjUPI/LLzUhzLLd3OpDueOjWEpKqrA
	Noepko94nUkyvV/YeqXJVIhEFYedcE08DKkYYU2tnq7wsBk4LslgTgXdwTU/hl1pVg4LxWVFuTU2h
	ZHwa+9j6QUsF7H/xlDN2kN0Zvb2FPGPrUBMmBudUEHj1way+LN7idNy+tS0OZY2RmO8iuezJTtAs/
	zkTzmZIEG+RKTLB7CX6IfiJv3jVmxkHLu5zsWN3y5bmaVH9KKJ3xbT8Zt36C6M+mJSlxDVj7Y6g/G
	pqex/m8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVi-0000000768a-3Auv;
	Wed, 10 Jun 2026 08:42:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVf-0000000763i-3KFZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf36a6905cso46298015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080923; x=1781685723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=OerIOtDy/ti+uRzOja0p4oV8MVzfKhi+pzytZUxzJjSg7NuGzrmyRrCyUxfFwP8HDf
         o2VlHt0yU2QipHAQr/uMG470Ly7f5TmPajRgnW4xk33/eydr5GOgVBl4pxpmMjJY1F35
         5kP0O2xRLsd7InUuJ22r6fl4Iv31vHHmZ6mmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080923; x=1781685723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=EDEQLIW3UG9e++rPFz/Ji7cLcsRp13FZq1lR5vpi9NWD52p6r5wV7aF7fHaJR+x/nR
         NjTCJ9mjPpstzILKXUXqGc57agw+H9xT1UbfwatzF0lkVjau6go2ifL/1nfs8jRc0/QF
         CPAAQ8tzbACp2yDJU3mVrUvhPZpUq1cTosvPNo/18cYo444BAxMnk5Mqs6UoLlvcsWSR
         hVk4C/c9WoJ6xjzX4/zegog9rVvdIz76TZ3m/822tVjDvSjGME79beyqi8oRdPTCSRVa
         PzQXsXHam3aFknwE7XAxqt8LDNJ3ZGofiS20jla6y1UgCdjJyadgON85zC77XuqAoWPK
         gl6A==
X-Forwarded-Encrypted: i=1; AFNElJ9L5+5SbohNtFJLJySGtXswNJRzIaPIHbjR/0zQIaE3sB+jZbgICY5VuTt+DsH3+3YY5ITJgnS5rpE5hlUFf5bi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf8gbI8ShYm7RHmU59ZGJSiY9+Yvqp8lQ8wbdEq7dTx5vIFzDR
	VlG6YDiBX1yDoa3G7760qpnbK9PcpTGgV2LL4vsoay30D43oRwmgwlbOgaQa8o2WWw==
X-Gm-Gg: Acq92OEWalHaBl88E3QsF/HshQuQ90tokUN2FHmDtAR6Ep2YZJLfC+9TsSr5RgJ9P+7
	TGyKSYPgsFep2GESNZPIzQFIZFpUmRWTjbGCUbqCYJLaPFfWRXZpqIkiwGSDlPJbP7cQoy0viH0
	rBjZ2KpehHIf5HR7PgGuC7YkAI8zh6t8uBbEz2YyxXzNT3a6UeULJZa37KATAii4Ltkrih3rN3a
	F+wOneywrEVpm4X8epaOukNqv1/F/FmrTkZHOs9XIUJiSyDSLhct6VNhPhHaWdN5g21LK5Zfbyy
	7XDCvDAdCQFvRLcKZfJQPYyQsJs7oSdu9IoPBL75LgrzlI/iNwYDb7sh+de/1KTAMUYCDAxaZz0
	1wx8k0u+lALSj+gAZq6FFuhYPBg+iCiviZX3ZrgS60QVdJXamF2ybNFLKCkhFdnRDNzYG86dxNf
	F//QvwgnBMQ2uuNL4RAcEtZwsC+r+T/sEhTNqwKHkaTDsRP0Zm5t43N0yGa3iabTQhjpqyqc5Iw
	l/4cIbXjTE1Sqp14w==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr79859165ad.17.1781080923157;
        Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 10 Jun 2026 16:40:44 +0800
Message-ID: <20260610084053.2059858-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014203_843732_9E16AFA0 
X-CRM114-Status: GOOD (  14.77  )
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

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e82821655fc4..49293376956b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -176,8 +176,17 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && remote_port == dev_of_node(dev))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
+
 		if (remote && (remote == dev_of_node(dev)))
 			return PWRSEQ_MATCH_OK;
 	}
-- 
2.54.0.1099.g489fc7bff1-goog


