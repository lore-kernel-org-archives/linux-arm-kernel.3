Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3F9CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvFgK6FEHqB5imV1GEiicuipGjQZKEOacLlkDJLiHJQ=; b=hg7xDoCnuFxeuI+9FFGCS08wE8
	h/pbmaJHjuxI7sEnpKmarT6nmRohdg0RT3J3InrKUMHRHrwRDYczAduBaSeIXts4X20fccuWeb3lb
	M3FTtDtJywvoX93PBq1VBZ2jcAmx3SemDOYNJ0IsIJjyfVswquAXJcN7PnGTLK0m8Rr5m+rUauPeB
	AXnxlusNwV+9pZpbXvjtUxtoFjUp60IRnrF+LMKTmE7xf9WuqjWcEalKUbXhIspK0aADXr5qFOvfR
	joATZndXdTYYklE/w8CzEzdpgbopLOoEsl7LF0Zt2kaSVd6328Gf7tacihEqU7LQ/dCf76HLT2zWs
	6A1PUkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwHv-0000000Cec4-1Mz5;
	Fri, 14 Nov 2025 16:04:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwHu-0000000Cebo-1j0r
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rvFgK6FEHqB5imV1GEiicuipGjQZKEOacLlkDJLiHJQ=; b=hyCPW9bNFFEhPUWL1yTzBtam3E
	MtNZoKGetbqe/2vfwllWAzXwoDxOWDslQQSBDm15fo38BjtdtYqRzDeJ0Ma67LCLWjwKS1Y5iyk4e
	elmPADgD2JDdsdAAIFFyORLWYgrX42i3ZkNzFzzc7rGrn0AH9jn0YpX4kczJiDeqZeiOMKi18Bevn
	DzJ84naHr77PkY4KmuWluz2QrBu0/zr0mprHeuZARe3sUpZzWe/kZA4hIZKX/tLEyeYtA1ZzkjwtR
	wspatFP0h5WPVzrSwoFog1xNdNjyUQHLkElBN1YnhOCwpy5vEldeVPCYCMnTbswbmrISjsCKpIgKQ
	xJ1IANUw==;
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvQC-00000002uus-3Eej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:09:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763136271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvFgK6FEHqB5imV1GEiicuipGjQZKEOacLlkDJLiHJQ=;
	b=DxCt/7Ow2uwmuMRtMwG5hyOiaMpLhJfspeTu/qVHeeoHOwfHwEmBl+ugMuCifunsRS2Fs+
	FoYLsQePkzLgGJzFs1tmHTb4ha0xG5EDek6v03wPjOXAm3kOsG14sN+rx3QS8uda8wG8Bb
	BzbOVF3i87KmacduttrlNxtVdczF5mc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] stm class: Replace kzalloc + copy_from_user with memdup_user_nul
Date: Fri, 14 Nov 2025 17:04:15 +0100
Message-ID: <20251114160416.230513-2-thorsten.blum@linux.dev>
In-Reply-To: <20251114160416.230513-1-thorsten.blum@linux.dev>
References: <20251114160416.230513-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150908_886045_CF0E2789 
X-CRM114-Status: UNSURE (   9.76  )
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
index 5834f796e86b..335bcf749214 100644
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
-- 
2.51.1


