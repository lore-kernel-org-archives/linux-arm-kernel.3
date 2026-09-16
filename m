Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4588EC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=; b=BVGc6cpK32SDGBqzG0uoDkoe5s
	ovrCDYiTbimcxY/DrRFZLLQUEGpg1Nqoa3e7r1rIoPWknJTNpxJrMctrt71bBCZPG5nST84irQtKm
	oQudMmnH3/+sqFmpzFDkb7dONKfyzu/Pm5g4OV8LfRmP8sh+yjQWxLI/PSIoVtT55s/p3JLuQfaP0
	Nk4VzWWXj0E+sIpLSYg3/g3QolIlIAQwJ9e81c1S1gv37GzjTL/7HZxyANR5X2OW+j8HJkkPS9TeA
	Iw5TuRc6KRr36ivSYNpBoV7KT1IbE33QW0uSIi84BGyLNrRwLAUHTlaA18HGYarHrnJxXijTBUnoV
	RWDUdAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZT-00000008f4u-1UNr;
	Wed, 16 Sep 2026 08:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYB-00000008eBz-493g
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=; b=P4TVpCiNTV2QvSdHS5xF9Wix7x
	JkrI6Um2FKtjeo2nD/WgkqlX30iBD+xEc6LL5AosGyiv7n+G75dBKOyFVGw8kEytgiCyiSRFuMpow
	6VKSlNYm0i5XL4RQVFsRxqlp9LZLEpHlYCPnA2Xm9uD/4P9JkmIr2d/XtDz28KBtoqKVg7OAwHXMl
	89IQS3cWy1ZY6qn78s4sUIkBRTwS8Kd1M3ozThrRfhBwK+IizhnZt1ShcxTYYhxaHV0J50sJ/lZJT
	AE8gE868QycdYU/JgWI8px7QoCY3Vd5j+TULJ08ZD4rufqwBT6BAP+01NMJUj+9xDjzFmvM+GrBZO
	kci4K9lw==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kY7-00000007bcw-1DiE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:26 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so504070a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545561; x=1790150361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=dtjfzbgF57ZxCbbpz0CzbuqoSFqj4nBm8gAPe+li7q8SSur8gIJ1c/P5YH+MTlg+eR
         7Bwdhq/BczwJm1k6/Rig7S4V5/q2jau/+V5Ufe8AUdfay+YN9tllIVNRd6U8BCCuVYUy
         NieagI8czYdrrD4ZK2/U0vpjm/QMFf8unaicY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545561; x=1790150361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=g3LI4hTg70WWgkR5AFNOmBComNhxkzGmlX+dEKJ69qH7lEB8Ky7z3WfEngomlNiEgs
         R/YG61Gw553vs3wCvEeBiOnhDmumheEzyrQcVYcrIJ7Q70dB7Vlb2fhjDGcX9Pc+GzAJ
         yux4/hYQCLg8TfKnmkcEIc29/ncYqDibqqW1SZCtrKAFZmQQAtlsh17cWlrMRDxz7zgS
         wtYajtG3/mOmUy8vpgvAUpmHGln3I2Bq+cQ8tjzCVXRxn5D7Jp3sL+Vrf02K5vNTsoqK
         ++OSlkbe+qXg0VNGXZMNRnQGwEzonZbNmBtKrmlxsW7GCF4BSWI0FqUrs+uX+PnMD+yz
         a1Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx3ud0E/YRw4d4Y0oKKP7oRr4ezMUknZq/LcmQWscx5iw/2OXEYipKp9CEYa6ZkrroTPyRxL97V/1uHOLzWAiCN@lists.infradead.org
X-Gm-Message-State: AFuF++luGdpUvUH5n3nW9MnHN3su7RKZUm9s4OIuaWXXUwgX39KMz1yB
	Nzf459OnlapHjW26bfc/pxgs8eqEjjT5jYkt5FNotpGzWJyqodp5Af/5ki0BcurBcw==
X-Gm-Gg: AYBFou0XYTLDFF6Ovk9ytHf6IE4BjKa8J61Bv5eYaEURxmLYj3O8759yNA2QAjmgn6j
	Zd40VcVHafETibLGiHG5iHIqug0D6fOSpdIuMjGpwp63D1PNehB21b/FoVhs5vg6At1CSbhFoBW
	qwRxCJEvvhG5vTAyaweYhxqvSFFFu8P9L2XR4S0Ci6mgC9TPyUVL0Rp9d9S8/oeWYEfy49WaUY+
	5UpI1y4eA9tSMEtoimESANLNJF/rvYgw76uRhQ1zrwMJ70UVebXkEIKDr9eGizQkNVlikAMRM8x
	Bnl/VWdBC0UxiUuriiGbORwQs1vUhgtZe9VbeTgfBc9K31Ps1DTqZCa0VbEPhbh0fQnqZmMpsno
	slb0AfaHSjA9ax2eKavnavkmaXChl5x+G4Pi5nMlPUN0tBaEQxzw2gy2/3VgC9lJ4+DFqrGWhrG
	guIXznfkKzcJYNC50JIqkzgP6XmTn9XwPXxACcNjim7+0rilv1swiXo4gyR6+4InGcB4B3F5jmn
	92R7cDFpUwa2DIFO/9Eey1IjfDON359Lzb0ktnGtoviv/Z9t/2pMQlztQ==
X-Received: by 2002:a17:90b:3e85:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e1e55f7ffmr3982483a91.24.1789545561399;
        Wed, 16 Sep 2026 00:59:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:20 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 11/15] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 16 Sep 2026 15:57:37 +0800
Message-ID: <20260916075745.3549953-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085923_644540_E27F0991 
X-CRM114-Status: GOOD (  16.26  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 322c307ce6c6..350a4c8831f7 100644
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
2.55.0.1032.g73a4cd73de-goog


