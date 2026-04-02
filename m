Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026D111224A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 00:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LXMgCcTK6RGFXVFZT8A9Tz2PiBZRhwxEuoWHnwTbJPI=; b=Z/AKqKx4M3JnsPBEXg3WU614h6
	MdpTufOo4S2EYEUQeowmV1XP8PXQKcLq8dUVZApH6c+VSj3jH72EcH73v8gDuLpwObYfT5ZLdh1J0
	O5kHUa/KJWlofKafy3DwH6QSs1+QCG03145CK1VpedwypU9pfOjlJ87hNUzOj+Au0cztCY+TPM2Ts
	JgfKKf9kPGp+mmeEJcHFdFi1+347mBFW9UEDPUpejQE2m60b4otyEaBC2MZOVce79tpDw5GPOfVKq
	6PY3uN1x9Ji6h2Bw7B2b63jpRAeIc0m64qijVvK/iFvCvsINEIdFXWL76FFUJOm6PGMmj6ci84Myb
	+Aws6NkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85nW-0000000GU8e-2VLg;
	Thu, 02 Apr 2026 00:20:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85nS-0000000GU7o-3kAS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 00:20:33 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b4520f6b32so512070eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 17:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089229; x=1775694029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgCcTK6RGFXVFZT8A9Tz2PiBZRhwxEuoWHnwTbJPI=;
        b=a+mQa4eM+E9ukWcviYs7iwR75S+TYvZpA7gCqwc5ECoxfPwpSXODmaItKOQWcolQ2h
         QALvtT6KhKU5O4TGynPD+62FXrR9YO2dy6+zwvFpOt6Yzyku5wbVB8fNMAjNZw5zDNIm
         7/7b4nAw80Wu0i7u7YuxTBZ6OBGvabjmVF5PZda6CLhxNR40OIDouo3u0AxBbODWxQ2d
         Hg7WaGdDT/MhLPSJpZybtS30n9I/cQ9exHUriDFAslM8TK6CodERcCuZ15uJ2RsxX5Sm
         XZN+Kg/lT3yxcGwm0zGDQutw6SdO0Zv6yaqGCuh3nH2TZkT+GFbkObeS4Y0kk1m/Wxr1
         Gr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089229; x=1775694029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXMgCcTK6RGFXVFZT8A9Tz2PiBZRhwxEuoWHnwTbJPI=;
        b=bCSsM8iNicJlYglOFUM/q0oQ7qV4PQdSMlnIIPaeu7/q0K/nx+FURwQxL4crv98cX3
         aZ8iC/76ekXaKL1GyqoyM3Y98sN5FfEiYH08/CBN7C6ZoOXAWG8F/hSx5lg26guAkf1f
         mjWSF7bRtyEuiAs2RO7gPTKfhdw+z+mP0fgEsMF5w3Yu7BgkxfsFFu7r2TYpnpZi0jUf
         kPewu02t/304TT2xJPIS6oqV6oEnAqX7wiDuzpQF3nMJ+WjhkRonvOl10VC9WzRKQRz3
         PGFzZgIizzYZLpTgqNuqQo1biUs6D2Vl9Ei4os53SKcTP8pqTzgotAtRAhqaXoLZCBEG
         ZDkg==
X-Forwarded-Encrypted: i=1; AJvYcCUiDy/p9kM6FaNDxTSoyKPsIVnxF2nY2jB3R8gIdYFWKMabDMwl44dGL99fcgFHLriRtWsrPKI1Ek5yOZGiBrQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk4oIGkioPlMG71O+GG9KVJzFOQ6/bzRt320BiO2NfFtxnjS51
	X0raj0ud/pdKp6QynE1YyUBRwMUkYEf0Y+E9iC4QDlqmYBvIh80njk/y
X-Gm-Gg: ATEYQzx82Fs5+Jxe9TxX5gHCpXwnEQuPFToDEgz79SqYuTWQQRIaoE87DTcwoXHe+TQ
	7b55HXyCRPKYY27A7iqqVEIaF3CtF7lbImuqz3KBdNaazPuWhzqlzNHL31ZEyLb6iOVIQv5vvkK
	d4LZKU9GZr4tueacy1S1aLWqRjC037wFHLJ0mfhIHYRuJVRPr9uQ/rFljUFJP4R3YPDlKBk9r3d
	V1WtqU9X4ixhhtONhgmv/axIvu2U4YfcoWL6mjIH5PTDcP0QHxGkSoD4DvqX/B3dxeOgs+3gVaM
	Rz8hGJU+W3kICP0GAcrsR8Ss0gaZuASWkvvcNen1WaWuS3r4h+LRz5mlbMdbdk9zQI2s47Ltx46
	y4ouzttIjLlEtL3O4PTwlCOgQhGrYBUqthlk0v0Mk/8+zzdzPsSrbXwqakM5LMK0awSPm2t2yjB
	cv5SzHpTq4ND4KPNBDELXO5rft/wh5wrbfJXX0pybYUOZmleM1c5B2lww=
X-Received: by 2002:a05:7300:e613:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2c932eb27abmr2824768eec.26.1775089229350;
        Wed, 01 Apr 2026 17:20:29 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm1031337eec.12.2026.04.01.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:20:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: mvebu: use kzalloc_flex
Date: Wed,  1 Apr 2026 17:20:11 -0700
Message-ID: <20260402002011.89926-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_172030_936428_5DBBFCD6 
X-CRM114-Status: GOOD (  12.68  )
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

Use a flexible array member to combine kzalloc and kcalloc in one
allocation so they can be freed together.

Add __counted_by for extra runtime analysis. Move counting variable
assignment right after allocation as done by kzalloc_flex with GCC >=
15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/mvebu/common.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 28f2e1b2a932..4129690fcae0 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,10 +189,10 @@ DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
 	spinlock_t *lock;
-	struct clk **gates;
 	int num_gates;
 	void __iomem *base;
 	u32 saved_reg;
+	struct clk *gates[] __counted_by(num_gates);
 };
 
 static struct clk_gating_ctrl *ctrl;
@@ -257,24 +257,21 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 		clk_put(clk);
 	}
 
-	ctrl = kzalloc_obj(*ctrl);
+	/* Count, allocate, and register clock gates */
+	for (n = 0; desc[n].name;)
+		n++;
+
+	ctrl = kzalloc_flex(*ctrl, gates, n);
 	if (WARN_ON(!ctrl))
 		goto ctrl_out;
 
+	ctrl->num_gates = n;
+
 	/* lock must already be initialized */
 	ctrl->lock = &ctrl_gating_lock;
 
 	ctrl->base = base;
 
-	/* Count, allocate, and register clock gates */
-	for (n = 0; desc[n].name;)
-		n++;
-
-	ctrl->num_gates = n;
-	ctrl->gates = kzalloc_objs(*ctrl->gates, ctrl->num_gates);
-	if (WARN_ON(!ctrl->gates))
-		goto gates_out;
-
 	for (n = 0; n < ctrl->num_gates; n++) {
 		const char *parent =
 			(desc[n].parent) ? desc[n].parent : default_parent;
-- 
2.53.0


