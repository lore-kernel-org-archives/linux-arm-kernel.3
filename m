Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB0C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=; b=HH7KQT41/gS4LH3wFAQof6jea/
	SGovTDh3euJWS35VmnZEaaqhZ2idNRNzoyC3A+JNc51kpM8OmNdA3/C1gL8IZvmuWnR5SOLqeq3Ut
	FV8xIcs5vOt9DM1BduMP5BYn11JvhwThXMm17KEbkszCVEs35izjWLb075hig4GOuG+bwLPfkquP4
	Y5NLcOV76/E8Ep/WqvLGfhgAAco37mg+Ih6/+P6LdNWKgdQu4UKD+bS9emDPhwdc2pYfpQcvai2aG
	GqiLqe/LS1ouPzqkJ16g+5QDCAtllpMdj1zitga4D7KM+TR74Fn+TuzEkKsPYiEZk+HIYke+bBmAe
	yJ11aAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOg-0000000EEHx-0yQZ;
	Wed, 15 Jul 2026 08:55:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOd-0000000EEDT-1vXJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-845c92bc464so1817816b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105715; x=1784710515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=TdmYQff2sD3OYowbhckR1a24H9AS3f2MZDaV8Rdn65Z2Q9eKrP0JasAsIFpR5KAi6x
         ihXGgVGGsK+1ZuKiEzcg8VtwjPxl4B8VwCd17Byho1E7dij/mrBn+8Bptw/H1UYLXbYX
         3QMbgibmBETE2ZjGgkwoc7JaGpvd8UhWhQqgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105715; x=1784710515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=Usbq0UAMrSsi8hC9QZ80x2nSYtw56n1urp2AV3X+86LZwo3OcYUQgK5f11O8TrSw6f
         /9wFiJ82S0/iSLYZ/StUZtlRLQZsAQPV3K8YwX3cO38dKL21P1drmFjLv1ohBVfGBIKq
         pCiv56WAcq3CK6Iy2qHzY4AJa+s5hVcMZDpaQLjYzfqyz9cAi/eyRfacy72bdrkgrvGN
         C10lFGd6MGyfRxQJyninobPQbteSizYWoyfXQ5YzxatwA31760xQh0E/ihEpkY9XPaM9
         KgZ3vqgM3/zFaJcVD1vbJitk7fNpQ53gyl4mUxFIi7b6mw4XsIu+By42dUvEdQyXTGvA
         8BGA==
X-Forwarded-Encrypted: i=1; AHgh+RoPUwaMHS9o50gcc1Nd0eHMy3chocjkdAN7Xwm+DhvWDM/eMi1feKi/38gOD/jvPF7XiDZ2yNwffE7wQBpq9GYK@lists.infradead.org
X-Gm-Message-State: AOJu0YznsNF1wFwgX6iYrbn/F2a5sQnxjUwzKVD+PtG7/mYp0FNNhHfE
	RaNXW3luNlpz0cldV3rMns/zt9kt5w6Vpd4pQMkdh5n16yJFynZqvExamB3iHebu1A==
X-Gm-Gg: AfdE7cnhoSkPUmbiO9C1DpuPXKEJYmUK4N8VvwTHC5CO0lZo/iEF6FcEoEpMt6YA9Qd
	dBjqkdAUHA3RudL67qgnkwouV07zHpTBeWuOmMyXSataU/EkU5q1JimoIcjCROQB1ug/bplL8L3
	r+S9r09Txhc2yzvRbVBXML8Ns4LknCtpzijy22fObdc8zwyf2yJ4VWTCCONNu6ojCseZzly4y/4
	jgZH2dObiTNb10UxTrH9WpIAeqEaWswE4JmNqFbHbS+WNYojuTDxudHo2pG73pLK95LsfmvekkP
	Lp3bL7tFWDVORLhSW4aI5H7nsYPluueZcwlTFcoQf+dcxyt673TosYu6fcjrOdyCOjII2Mps+Du
	SgoiNcX5dxQ4tbdxTYKwZXLOjHUeWPQZqhl2OUYNsTcSDz4qiCSLeftwN22f5UGob3GDvYx41Ce
	XmSnzQus0gjzfGBYRLUFqYEll3DIF6NW8AXdDlVwZ/A4xrzrpTeb2DqnnEU+282azwLUFPEQ==
X-Received: by 2002:a05:6a00:228e:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8488960660emr14884802b3a.23.1784105714825;
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 15 Jul 2026 16:53:42 +0800
Message-ID: <20260715085348.3457359-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015515_534015_23CC1CA5 
X-CRM114-Status: GOOD (  15.94  )
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
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional (Andy)

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.795.g602f6c329a-goog


