Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=; b=oYW0jRBMhAGFFSphHxAhON2p2/
	rL9f3BAHegAOEebejygdnzb6nyx2rrF+Tl/1X+7EDz/TLe5y+SguN9dK0SAb7tZLR7FKItHBBkKXD
	oaaXMwmU3J9lgEOaBW6JJmgrOXh/U5muP9pCUgUIfc8MU95cY8WCvEetQ2RmKbf7Lb1+1zu/i9Oq6
	fKK9Y5Po/sV417kmHnt5RxZMm+KYckY64EUu5GtI0VSVtePWNdR56f+ZfxJaMprvJ8EOLdqF5PCRM
	ZPPSA8Vah093qo1DSUFTidAWJ4ku5vIMMiR18WWLbcRe+RuXCXWui3vvDSHhPOvdOdQbJdGmEo9YG
	r2Vvl9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OS-00000008bCF-0i2W;
	Tue, 21 Jul 2026 06:55:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O5-00000008an5-098S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cacb8416a1so75091035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616932; x=1785221732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=FJlPbw8s+BVMTJhomgykXnhbuih1GoTR8MSxacoAUvDSZ0obpTwmQZEgEIiCbboU8m
         BEwLHUll02/PYO3vmqyLXuIaQx+lti2fZOSxqirp2jUG07AvpMPtx3OFzHPUug72PoAK
         IJeNaBJ0jWWFE9IIOeeh9/4bKv23RAckoSvrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616932; x=1785221732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=aYxrrhueKm2gsiYqcUUT7qQgPB2zobrO6s0sgOz4t9HDVjNAe1pOPHE6074ToYRMWA
         Qa1FdA2Wztqms1Rlq5JlIvpAilWJhw3qDHun7GKzayxq0gaufEyqO/7dgT5VfvmNdlSA
         gv5F3ctIDhvPDSkUtZlr3MfpseuUln8rJWstghZkL8bpmKViWVke10+97O8p+R5z10b9
         q+KbS0cUuSvDj7bXDr2zNpx3k/4jw9ntlg3sFzqfju3d21ZfAq5nXdQZctmqmKBFGwcr
         5SnKe+aJFDDMnqWZaJAntXqrn5gVUQwKruRlhYQaNxfOGw6SN8FXxhDMvs8uWebkD8cD
         ga+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrY4I395bu+RHIk6cpZPb+ERuTLJ3mqcl1drWVMuPF1pjzvnOuCIufHAoXWXLjvU6YXO+hSqQj+kvoy2jBw1m0+@lists.infradead.org
X-Gm-Message-State: AOJu0YwSlcMu2qv2rvWSwDh/Fg4anmiy9CEL2jPNHTfW5d9BYG/v1yW4
	vjm7V17uJm7v5sKHK1kadLJKAfnLpkJey4KCq69nOuyMPIovkd9HEiZLyIcq6NrpJw==
X-Gm-Gg: AR+sD128OYnjaVKE3Mr+UNhsqEP5xPBzBD/73t9+hoT2+8i9FzHF5OkluKryzyg0ko5
	FAgvS2jubAaciT2/fFIBLEfNtbkdD1sfXayuDR3MWggk3L/u69VkytKE3B93kvHB4b8pl6YGw/z
	zxTnmvhCTzvxwRxjZnP6g8rKLwC6pIxNn6he2b81gMNB09tv0zl2J4IsGOfeMuHq/XGhU/v2naU
	Kk77iIHQ9yGoEvD2aECk2rWLyl39Zb704rZ6VPBcVK0P+4CuF8y8KmUBVXUkwLCwLXqnE0r1zA/
	d4erw+moPsGljoVcBvp9BBc1+G1NFDJ/gHRyIyk4yUhCvKb1dyzSYWNo5XXc3QaTnmMdvJTqexe
	h5N3KpwCEG7yBUds/yCtuPDMLI1pXJhpZaIz07aB5DnsiAv6+L/1taoGyHmgvqWhwqdKZL8SeJ1
	uTjO4A9xvlo3HvzVDXzgKpNaIteMzsVBNM6pWEze29iuyGjUyr25LIirpIaJk=
X-Received: by 2002:a17:903:2287:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cf348366bfmr176522085ad.3.1784616932321;
        Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:31 -0700 (PDT)
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
Subject: [PATCH v6 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Tue, 21 Jul 2026 14:54:07 +0800
Message-ID: <20260721065413.2306137-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235533_109154_BEAC3BF9 
X-CRM114-Status: GOOD (  16.64  )
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


