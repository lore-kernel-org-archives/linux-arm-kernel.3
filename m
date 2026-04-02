Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5103D6AAF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTsnRkMDW4bN5OzJnPwtzF9uMoTldtikXKPNt9FXCXs=; b=n+eabpMC3CC0E1iUQlhtYGNhJo
	jLGscsW8XzKgFe0LCOjxKy0rPcr483CujGwJBabufIwtiKuC54AwD10Houb1MN17l9cg4Ickrgvsn
	7ssxU4gUA7kGcNG1GJGCion0jsud+Yyt1rf+yZNgx3eTlH1+8oTpnHZ7nBB8W321Ud8hkMclFOwqM
	ei37k9f/9pF00MzFoP5kme5N3j1ETZvhwWR/KutgWJFB4Vot0p1vtUz7nGJO764tkqEWZGooqHQge
	+xv624ljwbu9sNLBG8z5SR01I4/fW72gz4bFHtObaBxDlI9o/4U9x63v8q8XqjTOZR8y5LgDenE4w
	JBhffnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LOh-00000000Z3e-1VS0;
	Thu, 02 Apr 2026 16:59:59 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LOe-00000000Z2v-3So6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:59:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775149194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTsnRkMDW4bN5OzJnPwtzF9uMoTldtikXKPNt9FXCXs=;
	b=wLFNlPAseUwuf223Pvge90E7pQq8MuSMmcLAK5R4mrgSf06ylW8xhI3jIjjHWvXHHUtAf9
	pVggNBZUkO1/dYXF0NeWN0eF9xir6oTxcswh8DCFBRfJ8GNYq9NltjMjKl0qqvG3SkQ6Fi
	0/ggIC5H3dfcfHLolphd4Vptmeg+MHI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] stm class: Replace kzalloc + copy_from_user with memdup_user_nul
Date: Thu,  2 Apr 2026 18:59:36 +0200
Message-ID: <20260402165933.895706-5-thorsten.blum@linux.dev>
In-Reply-To: <20260402165933.895706-4-thorsten.blum@linux.dev>
References: <20260402165933.895706-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=thorsten.blum@linux.dev; h=from:subject; bh=qGdjIpAz9PgAQS+iKJwr9LbL9orJQc6FV29pmNDALJQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnnFpTFW99V+pxed+lQ1vV7Hu/Su8s05Ayv5G/Lvi1rF evkkGDZUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABMR62ZkeK/R8nr6S50TvZNC kgJbt2W03z3/7nHAtZx6vzDjgEghOUaG2xynOu+cfjKrkleo2q7wbsbC7fyrzqzdl+Y2+eqbMxX 6jAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095957_161319_955B40BE 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Replace kzalloc() followed by copy_from_user() with memdup_user_nul() to
simplify and improve stm_char_policy_set_ioctl(). Remove the obsolete
comment.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 49791024bb86..f2c0f2b8f7b1 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -733,18 +733,9 @@ static int stm_char_policy_set_ioctl(struct stm_file *stmf, void __user *arg)
 	if (size < sizeof(*id) || size >= PATH_MAX + sizeof(*id))
 		return -EINVAL;
 
-	/*
-	 * size + 1 to make sure the .id string at the bottom is terminated,
-	 * which is also why memdup_user() is not useful here
-	 */
-	id = kzalloc(size + 1, GFP_KERNEL);
-	if (!id)
-		return -ENOMEM;
-
-	if (copy_from_user(id, arg, size)) {
-		ret = -EFAULT;
-		goto err_free;
-	}
+	id = memdup_user_nul(arg, size);
+	if (IS_ERR(id))
+		return PTR_ERR(id);
 
 	if (id->__reserved_0 || id->__reserved_1)
 		goto err_free;

