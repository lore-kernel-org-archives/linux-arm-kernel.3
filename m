Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE4F588CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJjRxqIoxs+kFoW+rgn321zUfOfzgUlKpWyHQaUD7Z8=; b=n0Cq8IEE/6RAmTBaxvNumKj7oK
	j2zpofhC4tleGwRcC2nCZJmiDSVC77vCSYkhSI2mDOh6dHmOo8lmr4k7PMlQwDc9o5FgMkNaHUo5k
	dLPfLl5jo74hI6Kn7JFJz+5EP83v4D5eKwZsHmcQVqoCGfLcMUUfHFCQxsErnjgDb0OMgQ+/6QvFc
	8OAJXKAOPEuzSZCrgAL6clXTPwGAlcqJc4zK1dOY1pRhdfb598Ie3Hsro9U9wcsNBxC0vCNk7zoF0
	iK2BvChUjXB2yU5TkkeXF9W1Q5YbgPmF7nvnpq17GnVwXzR1awsRYcp33FD8CgX9ZzNvo5BfqUvJ1
	YEU+rg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoiX-000000072XW-32Sn;
	Mon, 20 Apr 2026 13:31:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoiV-000000072W8-3RMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 432E06014C;
	Mon, 20 Apr 2026 13:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12357C19425;
	Mon, 20 Apr 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691871;
	bh=WndapDrQTW1NPt1zLNN45ytCLcjeyhPdv7mnUOJLjQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3vPibwKbJukBRKRnMELsjExQgK+Yp2oYTSMYJavReabOtMBoRuAuQidpnkzDtmpO
	 LDAUbsPIJZ+OV6CdkqZ5ozCyD8YQXpZL0moRo1DLMI8+7qExzUlTrK86eZBOHu0DbT
	 BDLn8i3Z7IxA8yTgh8J1Vx3yE0Bygqjkarnd6N0fbCWXgm8ee47kUSZq8Np3xBS2hb
	 PfScoF69hB6QDTZgnOCqdxto1e96IjG7mPy+/ZUiahNumxXLMSSqQHQe3r6ELTekNT
	 e5YS2iIZWqjWoNkPc54GU7ukMvmmRMijqkd/dfx4Sf5AqCt/B7Z55yFofh8C0jgqZm
	 trhSlfPCJNPWQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Potin Lai <potin.lai.pt@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching
Date: Mon, 20 Apr 2026 09:20:37 -0400
Message-ID: <20260420132314.1023554-243-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
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

From: Potin Lai <potin.lai.pt@gmail.com>

[ Upstream commit 7ec1bd3d9be671d04325b9e06149b8813f6a4836 ]

The siliconid_to_name() function currently masks the input silicon ID
with 0xff00ffff, but compares it against unmasked table entries. This
causes matching to fail if the table entries contain non-zero values in
the bits covered by the mask (bits 16-23).

Update the logic to apply the 0xff00ffff mask to the table entries
during comparison. This ensures that only the relevant model and
revision bits are considered, providing a consistent match across
different manufacturing batches.

[arj: Add Fixes: tag, fix 'soninfo' typo, clarify function reference]

Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Link: https://patch.msgid.link/20260122-soc_aspeed_name_fix-v1-1-33a847f2581c@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 67e9ac3d08ecc..a90b100f4d101 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -39,7 +39,7 @@ static const char *siliconid_to_name(u32 siliconid)
 	unsigned int i;
 
 	for (i = 0 ; i < ARRAY_SIZE(rev_table) ; ++i) {
-		if (rev_table[i].id == id)
+		if ((rev_table[i].id & 0xff00ffff) == id)
 			return rev_table[i].name;
 	}
 
-- 
2.53.0


