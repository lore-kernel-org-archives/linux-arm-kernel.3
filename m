Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4899DC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UEbJ/VAWjPmYzHoiXMCxanMP9kM8vRDeI308etvIZU0=; b=ODzAd9ztKdFAuo
	q6SIepOtNvgzPyPuFTx5g5uQDcHX+4bEDkK286ukC0hxD/p9cu59V++vAryLA3179BxLWkPHWsZpy
	3MUzc48WgtVQexHiXsR7Pj4157TpRIdvzvAHA+5JVaX212HmhQZ9dFS+56F8wCFx3gDZ3mbIcr4mB
	ng122MzqWc5t4GnGJZPPnpfKeJ4uH1aFqLxVbewDu31dECjY3pNAH7xkn0qCAGkasQ4+j5VDeAHOz
	wuXzMxuhbpIkYKbdfWznQrWqP1VogMVyc8dlNhylcdqkoK1OlWBRgtponj+l35MocxBaZgktUwiKd
	Oj/renvWyI1yANgZ+4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeZt-00000004XlD-1sQt;
	Mon, 09 Jun 2025 15:38:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe7g-00000004TGk-053v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01E55615F2;
	Mon,  9 Jun 2025 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8899C4CEF0;
	Mon,  9 Jun 2025 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481754;
	bh=eClMNWML6Y/hLG8/cwfFv+FCtdOhBVyY4h0efWqdOBY=;
	h=From:Subject:Date:To:Cc:From;
	b=qIuxA6JsKHs5ZsWyGlYTrRi7eNPVuS+mChWpMoal8f0WP6u8MnG9bSdhoO+yTSalI
	 riE83kJ4zX8GSV/mmMVlrwQy4drZbxWPo3J4Jkd6pKzuBSgQT+SacY2XLpuLqtFWan
	 AD2fqrlqQe4jA0D7AUh8rSXci1PoVcTsKv4ishssvAlF1LWUlJ7UL8I3kwk9tzgNxk
	 VyHrOsSE/xmFOHkN+sScStmoJUZ6rUVHhHm+2Vmzzckl0QeKLfDgytFXIN4GT8ozjA
	 75kEKLV0UDL7RXJhqtQD9bzEQehIbcV7+V7GfmUBynLrHX0wVzqmqMNKSe+ylNr/CA
	 hqfLW/4pM9FJw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/arm64: Add coverage for the interaction of
 vfork() and GCS
Date: Mon, 09 Jun 2025 16:08:55 +0100
Message-Id: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAj5RmgC/x3MTQqAIBBA4avErBsw0YquEi3ExhqiH8YIIbx70
 vJbvPdCJGGKMFQvCD0c+TwKmroCv7pjIeS5GLTSVlndo5O9Nbj4iE84ZUNKfKNx3exC11pNBCW
 9hAKnfztOOX/Wt8ayZgAAAA==
X-Change-ID: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Brauner <brauner@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eClMNWML6Y/hLG8/cwfFv+FCtdOhBVyY4h0efWqdOBY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvkWgecmvwJzw4HRD4Q2aISRm6dDnAH28UBSuH1d
 anVzhXCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb5FgAKCRAk1otyXVSH0HVGB/
 9C8iwAnAzqpZPAUPfvh8yQpJEFixX6V6KPlCHaUeYfnk7PvXWIwngIZcKjWPtm7lfr8+Ys0Lm2ykVy
 /ETfy52WPocHwviAyIlUFHMotpMwuZwdTRIfJsaQ2U5yKbSkguMDo/md3poFQ7yOM3bYgnKqmei/86
 encNkBplGqtIt4yL2fMmJud/nm91/rN/7Uv1suHNliEXvuYtpFyO4R9qTVX9Cz5helbmjPxEPBfWQl
 +OpU5FdMobCKuAWOVSzE4C+TDDbMjz6zUjgQKBkVrKNnQEjRrUe5uqlib2wib0yAuiKA5ic757BSnf
 L0L2gnv+vfjluquq8QRkX/4yNwJx4H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

I had cause to look at the vfork() support for GCS and realised that we
don't have any direct test coverage, this series does so by adding
vfork() to nolibc and then using that in basic-gcs to provide some
simple vfork() coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      tools/nolibc: Provide vfork()
      kselftest/arm64: Add a test for vfork() with GCS

 tools/include/nolibc/sys.h                    | 29 ++++++++++++
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee

Best regards,
-- 
Mark Brown <broonie@kernel.org>


