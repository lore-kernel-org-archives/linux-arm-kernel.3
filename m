Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9857C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6qS8sNKqohtOzh0Qv5rdb1r/B7Aj2Rva8hJLtH9EXY=; b=ZGsRPiNcJ6LbV0wCRMIAmZMfbV
	VLcz9iAlk6egHhHOTjyeRqpi4PqKQJzHGYg8gu4IIoWcZ6pQyB2iU+hdeWlzkQ+Qiz00cLoT089x2
	qL2/Q11uxWhWVAGIoh6nGyfnW8U3JsOGFkBWqNLNP5cJHoOreNCAlNB4LeVAjrjN54LzzTXqS8U+p
	YaMk1CmU8cz5Pp7OeALlw6bipp51oRTB9VFBKCW8PD4D597ZMNQIr7uqBCRivnaSoRsgr8IS6RalC
	U4bTHJbPyJu+dzQNb1pkPVl8/hZy3Fcl46PO8cZiPaHMnGWRDZYmA3NTgTaWTgKMFeTvKnEesBJPm
	Kkl4BHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWj-00000001pud-19sr;
	Thu, 09 Jul 2026 09:58:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWe-00000001poG-3UvR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cca0c5799eso14101285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591116; x=1784195916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6qS8sNKqohtOzh0Qv5rdb1r/B7Aj2Rva8hJLtH9EXY=;
        b=jWfGiFSp66Q6U2FvJMCyue/BLvM4OV5tocyeAGY4Slzm+mvw/1PGDrIBGtUmZ1TdZp
         j++5I+BzxOjR3i0CtGBykBHQ8ognqP4UCxGYjkntcZSzGflJLE06IqgFbrnTzrLFb2gm
         wHeQR+FMfZfwPRRnq3sGKZV9Bs84QJ5cNDtxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591116; x=1784195916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6qS8sNKqohtOzh0Qv5rdb1r/B7Aj2Rva8hJLtH9EXY=;
        b=W92gjg5V8myT5qW7G7CuEwYwHgdC3IsFwdwem1HEW1a99Zq6gvjN1DF0p4g+FANgNS
         I/+mx76bIEep9kUC1YziAzsbs/1Zi8E4bkvteU7DJjf+2XAqc8NmJG7R4Nxlcv5KVy7L
         1qJfQa8HxroLDNhfeIAuSU9BiM0AQwnN+dO8TKHlwJr8OKFYVJupw+BiOva4iepzfAhV
         prcfy6o5oEDRJRDJag1K9MszoCmr9FTh+MHi5xh+xTWdvBJfDpcBm1gzUAijajJZWsPR
         dxGQywdQ4Ahn0oQwghoza2JcleLdM3P/0dxytW46DH+w28xsxwmtWqhRPk7xbRawxkeL
         dAOw==
X-Forwarded-Encrypted: i=1; AHgh+RpTj6XXQPPfiUSWWKpBNGCUlXFsBvY4gbMFWF8dHkP/+bhCUQ59wFY9RWjDnkpdnRqkpSXWBMv6yLp4mvB1CbLz@lists.infradead.org
X-Gm-Message-State: AOJu0YycPkKXQ9+vxzvHlo3+DvEQaYmPtGv5P8spmcb8JMS4G1W+yooi
	9iJDcIBVIN1gouflDcVUGK5NK0gdPu+zcCA9tHlxePqdZ6xTcgYTw7aKFRRaQ9bWTA==
X-Gm-Gg: AfdE7cntmrlHbyHK1ONIezBVHC/9j+rWhHCri5/KXlZ99/ntLca269SDwxPIjgEPlO5
	m3+NeCai5Nkf7srECFXA/iEVJ+gzWcjKYI+99iWcI+NyE0r9P/NO+mvHQcQuy7+Dv5ME1PKC7Ys
	NNkcvZLFRFIBHsTv2kkIrYCJPgbPOspuxRh8CYV5M6v7HwEdSr3EA6CBfyLda5iKzYPZ4WJ9NiW
	dQX9RZ2zCa1yz3IMYER2WyWsZI7mE7GtYP84o7e8g66lnVU6kHgfW8u+7Bo0mSYtkMQXRJTZlwR
	/luOaO2Fn+RJiea9zhvW4KFDfQ0wS7mKrQ9URKZDexcrZezKP5ULLLy7LMh/tWAYzLofImBwqIl
	h+O/2mF/rfH51kTMWzhCJ1O0wKXosWGnGm4Gh1KcSdaMeWwLxGZZBXeYk7mfF5apiY/jH44iuGw
	P6ot9t3DW1XdaLdfgYhBYPqeF5KMvnCu1L6++4QUU27cAOefdVv7743ll45tTayogPvpdJ/g==
X-Received: by 2002:a17:902:e74e:b0:2ca:e106:8e69 with SMTP id d9443c01a7336-2ccea371b50mr70745585ad.10.1783591116169;
        Thu, 09 Jul 2026 02:58:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:35 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4 11/14] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Thu,  9 Jul 2026 17:57:16 +0800
Message-ID: <20260709095726.704448-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025836_905932_3438404E 
X-CRM114-Status: GOOD (  15.97  )
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

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally (Andy)

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..733190175f84 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,18 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.795.g602f6c329a-goog


