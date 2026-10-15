Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7513CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQTGBfFwNel//r8LlIYPNIa3fcgK1JxEP6QLmF4X6hk=; b=yDar2jEsTAJJ9LMFTG7eZIUUQ9
	M76ervoHDV0hfnpnRW3c5xOT6S9M8Kbu8RUQOO6kNOdtzIaTo2UWql/uV7+1BCL1RWZz8D4eJ0Bsk
	Seopdtz87jV2c/c3HuDGQ0hamz1qsn8uvbwKmPK1Ym6XH0LLVKSFvmzu7qXRruO6beO+daBA11MEF
	quMAziEaePhMJcCz6CE9K4KNmjAv1SC/A6errKg8Dl8mwNbqIx1/uqTz/BX0KgsyC6S6tEgI+ehTi
	uTMJuJ2Rm0XuXY+lOCZbbOIPvJj7Qo9BA6CTBIaB2eVebe2cDmZErYvUOpd9RuE+XAXWgO3YU6ZY1
	LEsRFdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHO4Y-00000000mV9-1OQQ;
	Thu, 15 Oct 2026 16:12:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHO3i-00000000lOl-1Q8d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:11:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C509E447A9;
	Thu, 15 Oct 2026 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1761E1F000C4;
	Thu, 15 Oct 2026 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080717;
	bh=YQTGBfFwNel//r8LlIYPNIa3fcgK1JxEP6QLmF4X6hk=;
	h=From:To:Cc:Subject:Date;
	b=RZai9/z79OYUC0eiNxX0mHMcKQCYOVSiskf067Enc30o/eBuQfcMWQqU3KAp039eH
	 bTe28SvdHGtJmCVMbm2luhB13qUvkfbba3/J8dUCUDh4YzHo406KssBxQzMhbdYby/
	 UeERvMkBZZ2+iJZqBaE0llWiobDjEal4F5FwyqXaOqs1nytAIPXjTfNtYem+J63+na
	 Kto390FO0dz4ybAtJVDnTFgV+p9UF45XNiQ7wTjsqTfrTe3lqRvbFO5hMdDirZdAkh
	 utHpgrNSjCfZOHAjrtvWpyVYpvVn6LUU0J4WEt/G44a49VY+YoZ9szscn4wkWziqyA
	 erQ7mUFxRdUHQ==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
Date: Thu, 15 Oct 2026 18:10:54 +0200
Message-ID: <20261015161054.357595-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=blum@kernel.org; h=from:subject; bh=8GJ6MqaiB/hV1Yci8GKT5lwH/8wWOtZYYCjwlS41Rw8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkXfvOHG97S5uI4V/nKg13ZrHWTlbHrmYOhGR2LlMsLd DS+HT3fUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPheczIsFtEO1JFqGWruVh1 BpNZttO6eRWnpkdMmxt43j5fZYEaKyPD0xlsUzre5fO7bea+zX1VPq42/4NtstZ6F5nFwWXvE+S YAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

__parse_cmdline() detects "--" only if it is followed by whitespace.
However, at the end of the command line, it converts the dashes to
underscores and tries to match "__" as an option.

Detect trailing "--" directly instead of converting it to "__".

Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/pi/idreg-override.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index acaf56234973..38aa28d19650 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
 
 		cmdline = skip_spaces(cmdline);
 
-		/* terminate on "--" appearing on the command line by itself */
-		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
+		/* Stop at "--" appearing as a separate argument. */
+		if (cmdline[0] == '-' && cmdline[1] == '-' &&
+		    (!cmdline[2] || isspace(cmdline[2])))
 			return;
 
 		for (len = 0; cmdline[len] && !isspace(cmdline[len]); len++) {

