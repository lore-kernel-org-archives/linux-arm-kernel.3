Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275AFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU9iMewhxSj8zsmJv6ZCCZom35dVvFGNNPh6xvXS+V8=; b=toGzxcII3tv5QFVvpGgoRHaC6K
	9cASQ2uZ7SIdzxd9NxZQD1NW7DsJLgbcXJY6VU3g1ONGh5WJWvmrvPqasaUjN6plZYjGW5cCWw6vg
	PF4eTYRoBFDjLEK5igfn1cBn55sTWFWhGuHEVAR4x3url5jJGEdQjSdRLRQ9HtKrIlMGtDUMmnvTF
	Aeq/+itVa2Jdm7sIxywgadGELupcT665ofAMjWmoQ7De1iIk+Mr9qRghJHL4M402YSmSYzyHn7gX1
	WAUVBBUssSQV/DoGh8zQok4vsSPRNTHg1ON/8wWEtrpgHwJGs4KViLFaJCAJtS+8VlQrCf4UX91BJ
	W9B0XfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTRs-0000000E0ZP-1YWj;
	Wed, 25 Dec 2024 15:37:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTOf-0000000E089-0sJI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 15:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D88B5C5E32;
	Wed, 25 Dec 2024 15:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E533C4CED1;
	Wed, 25 Dec 2024 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140844;
	bh=FYQVmq938nLORzg1zBjp/HyD8HK1GzETHgHf3wuxId0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PRRNEmpARuO7Tw8Drb1w23FGryFWNJKE93qSZqUrTr1guh/cW5InyFlqQjXNXnLd0
	 8tiEat9ul5n1lFcVMRxh8NPsmttCwfcdNuteF5USxsPHF9wbQ8Ep+DyCl1dLowCx1n
	 v0BnPiOjyjTUkxHi37Kx6h4pHSuF7WmH4AUWDDx8zYrSfKeOkfT/KmcvPbJiitbn0L
	 /NPqh1ta2Dd9x7nrRNiiNaOQ46z+UOkd4mHt30hoqRvEvI0nvYvGH/2N+VSi5vvwpM
	 G+rRsiYCXlM/PgUGXlvd98lr5kLXGBsHdjWaYmci/RqVdGXVupMmCuH15MN+MS0N+/
	 zqEzDig7lo66w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 1/3] modpost: fix the missed iteration for the max bit in do_input()
Date: Thu, 26 Dec 2024 00:33:35 +0900
Message-ID: <20241225153343.134590-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_073405_293912_2B539558 
X-CRM114-Status: GOOD (  12.53  )
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

This loop should iterate over the range from 'min' to 'max' inclusively.
The last interation is missed.

Fixes: 1d8f430c15b3 ("[PATCH] Input: add modalias support")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5b5745f00eb3..ff263c285977 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -656,7 +656,7 @@ static void do_input(char *alias,
 
 	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
 		arr[i] = TO_NATIVE(arr[i]);
-	for (i = min; i < max; i++)
+	for (i = min; i <= max; i++)
 		if (arr[i / BITS_PER_LONG] & (1ULL << (i%BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
-- 
2.43.0


