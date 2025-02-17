Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6FEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jNR2ygIUsv1k2EwiRdxBTOrxxKHAiE6CwbD0ihBu6Rs=; b=t6r4QItd8371nm24mufsZWpJPS
	farQ5GqvarhoGMPTOhHJ3GnmBjpIrvKq3+fVPonaq/X1gcyuijmgT1tCLR2/CTio2522m3wONzXXd
	+vHyFajzl6x/6krkammpSRTr50nnNVZ9dtUhBdGbduJrVUhLxNcqyt7P4n03T1gJLskpVvTpw3JF8
	7UKUU+on3ON3KxDc+sQB0hqqGk6jrL+WpzVt7TE4e08DicXYKTO0oDF2D8UKYQyYP38w4NReU6fIV
	6FqKAhCbkCvoIyLOZiGMh+MWTUzmrVpClPs5vikyOf1SJU37FGc+IozYYpDhBWGrUz6JprQX+2CnJ
	Jazur6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvlG-00000003dbZ-3MeO;
	Mon, 17 Feb 2025 07:41:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvin-00000003d5O-1rgA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:39:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739777954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jNR2ygIUsv1k2EwiRdxBTOrxxKHAiE6CwbD0ihBu6Rs=;
	b=WkbSbzZNRaEuDRvrrP6VuKH12tXH4xgciMpzBxX7Gjbv1m4tuUB2gvazEFTkkDLShXs4fz
	qJY3rQQZeLRxglKztsImHSSsyuN4GL5VrNG39omZteOkd0DQSsnuza2lVXaIVAGDCT4dR+
	UX7FqbhCZlAkV4dQZuIE8l7BS/7KIInUEFKgdgH7+qdTARpvmZCm9t6AjhAKxUrS9CRpni
	765j7tSch1HNOwbX7fgwyrYgyVByQGAumgGXCnZuqwod1r0W09wJ2f17d6ENcPTN3v7KyU
	yQlF/4+Pn3Nrkm7wT6GVKLMCyMzkO1WDnibCwXKEqcsW2RMgbd8zXBbukBoM1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739777954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jNR2ygIUsv1k2EwiRdxBTOrxxKHAiE6CwbD0ihBu6Rs=;
	b=CA94S8a6eKEdcb5IbTZort5zGI6i+XjCK15imPv864Dh/EXMbsXwj3jPqWciP16CNRhdBM
	697soIUP1StY2LDg==
Date: Mon, 17 Feb 2025 08:39:06 +0100
Subject: [PATCH] arm64: mm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAJnnsmcC/x3MQQqDMBBG4avIrDtg0thAr1K6COaPnUWjzIQii
 HdvcPkt3jvIoAKj53CQ4icma+1wt4HmT6oLWHI3+dFPo3eRFdZU5obM2yq1QY2Tfh+BY8hTSCj
 uXiL1flMU2a/3632efzuKxw9rAAAA
X-Change-ID: 20250217-restricted-pointers-arm64-74d54aef13f7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739777954; l=1156;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZDBkYP7e4RRQZyV4NkDx9AEqrR4TIznTk080XM4j54M=;
 b=wxuocKS2tQ3eCVPZ3TBJCg+/tK4UpvZZR490FRiwdA5RJ6Uy2HcgjUnzyQh7SivJ0nn6Nieyf
 LK2TnDTB5eaBOZa3PeB1AB8LSiWITw/W+AwccNf37sQfw5hCWpvmoZr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233917_628297_1A6D9B5E 
X-CRM114-Status: UNSURE (   8.47  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/mm/physaddr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
index cde44c13dda1bc0924d2d50369ad87f544a0a802..7d94e09b01b35094e883875a46b979666549095c 100644
--- a/arch/arm64/mm/physaddr.c
+++ b/arch/arm64/mm/physaddr.c
@@ -10,7 +10,7 @@
 phys_addr_t __virt_to_phys(unsigned long x)
 {
 	WARN(!__is_lm_address(__tag_reset(x)),
-	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
+	     "virt_to_phys used for non-linear address: %p (%pS)\n",
 	      (void *)x,
 	      (void *)x);
 

---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-restricted-pointers-arm64-74d54aef13f7

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


