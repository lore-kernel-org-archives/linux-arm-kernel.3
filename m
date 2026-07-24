Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB79C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=; b=sqQrt2kKnfSkA53Sz2ySS7fHhn
	OodHbw9mK7KuQEgKh6u83kD8Z80oqELQhcPdLHub6i/uChRhVPOBjZTj6zUw82eCb7KHpUHE2Ykdn
	W3+3B/mTegSCNi9RaCDNYLLCOUob3JX+hr5w3PqWvsHLAJIwNxK9aniH1P0X/ti0xzgl9OVZuddxn
	aPXQT3KD0QjhlJLfcy1ChHOyJWncNN+9YpqAp9fNXCBaYblSmfpFni+SCIj+q5gWciov3rSs3I3U9
	pHxzM5Yy3lUcyHXCvTTodQyWgInxBkKkhQ74UBcxyNtRUU0dV08WB/54D0CacfJWPmTuuIVob8Zd7
	SyDifyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBXD-0000000FrZ0-1kjM;
	Fri, 24 Jul 2026 08:45:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWl-0000000FrBT-0neZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso138222a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882706; x=1785487506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=NK66/fXHx69BPjeZ18FyseIj+dmHD5IAtx6EZRaKG/RFHaDUir1aP87Cqt+NvMtTeV
         v3+ZFzCuzpeueMQEFdKFQgm97kyLXkkKgu7BZ7lH1TrcPm4M3KRZc8Jy1ZNh1I/2UGJO
         DtpP88xtMmalS0ilapvscfvHvWw+kBqH3A1hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882706; x=1785487506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=NiiIZXJzj7HIrjazB7k6SQ8QbARjeNCRTmcUOUzfblD6RdUPUXGk/YFt3F8jiuERLV
         a1SNFlK/pC65jnIRVAmmXbR2tjBHtQzhBTrILK06NaRXMFOC2Q49cSnCXBEQ0Oo/JFRo
         pUyatbPNJJrv+P2sVagOK2vFXEg5j9U3w4ai8BQ5CZAe2sxpEfu/vQKPVryhyeOA84UP
         pq9PA+zxpXEa61j+7F3d+IdxQ1S+AFOMN5IH2lI7nlkkqxtXnxlCeh6naHd8DlqNgcga
         VrdQaErxMD0AYjQX4ZiuLoSTpMwljU4qEa5ZkxP/JWsnth3LBLDe7ZgWi5n9Tg4RG4xk
         okOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/EhDvQRP418Mx1dO2J8+62bRJAUTNp8NMijxPFsapXOeG8gSebE6rclm6OaRFKJosIlBKSBZcnVvb9pB5oNry@lists.infradead.org
X-Gm-Message-State: AOJu0YzBScUjUd8ibUumdOF8e+ZaFqSGcDKmr/EM/NO4gnzUD8ra4lqu
	4FtrU4kxYt7+Xo8o2TEiC+CIrdIXstO0/6G9PcMuoVVuKuNYm6KpP1tXutrX6psZIQ==
X-Gm-Gg: AR+sD10+RmcdxSplxguQ3cKsr9kFHEVqwSLtcmJNclGyc5W2jTOYsidm77wpRXDgjI4
	Z6/JOpXpC0DTj8v45bB1mjud4TyP900lOycmVaGodY0ToziEKa+24eJ098ef2ANhgBkubRhOBv9
	JnSNRMG6fN1kprNje9NldRkukp9I0dzZJSR3PiByzbUVI+zwJsuePGE0kUgBZDUcOYc5VHcJebO
	gzQUNncYLHYrWm74pTYKqfIkKrSGCupkdv9LLjxe4/NZtdArX/JFGdLyjYVv/hegVwMz3kHaUF2
	YBzFMLb0V+GzhZpFU3fUlaigJEoH4vZBkP9Ed1wohJZAtWaKX8s/1ooCkHNaUxfzr75vdaKjTa1
	+0ZHxFJNyUfBDVaWbJLknS116bCbv1fgU2X3c+IvhR11VZL0/Xuu1QuS1/YK4yNvwCW6zDK6prb
	OulFV+7PQ4wyitV6d70xoO5kAC0GeEoIxzle48Yedq3HCMprhTYh5o3fo/4zo=
X-Received: by 2002:a17:90b:5687:b0:387:e0bb:57f8 with SMTP id 98e67ed59e1d1-38ec6a9d77bmr7085311a91.41.1784882706348;
        Fri, 24 Jul 2026 01:45:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:05 -0700 (PDT)
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
Subject: [PATCH v7 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri, 24 Jul 2026 16:43:21 +0800
Message-ID: <20260724084328.3943997-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014507_235612_D616171C 
X-CRM114-Status: GOOD (  15.69  )
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
2.55.0.229.g6434b31f56-goog


