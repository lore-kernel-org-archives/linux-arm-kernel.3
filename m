Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE1ECA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78N5yAzXn9F4cMxhSTaeDyetjjEQj7TQb3kpzPri+ps=; b=fW35dRJ5N0IlvX
	OE6kNhRD0EYshcCk0T7k3uqm6FslIIqWmYcFIE2W9aGr2m8B2rP4bCpu5QuRui24+ksubFmVfnu/1
	7HL3XN7rlYC3j3TVqrcmJWeIgMo7YisDXUcHthvcxdLkOUe3ajVlfUKNJqZpBlBhNG64P0ETwzBX3
	f1p6xZZOQ3AcIbShbNYf0SqNMny8MMvH6sD4710/Dfmfp42K/vXyTqgC8FzSC370vRrlLv4Q3X6rE
	OP7K0nz/P9bUdmjQ+KA4m5++eHPksJJEJFPh9UHAQBfldQ8y5F7y11dDhwmXaRxPfYtN2ond7bX1T
	UHCfjJCxnAxkkSTyBf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1n8-0000000GSQw-1zDH;
	Thu, 21 Aug 2025 09:41:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0AE-0000000GALc-2eQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:56:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755763009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=78N5yAzXn9F4cMxhSTaeDyetjjEQj7TQb3kpzPri+ps=;
	b=OwS5Z+2sRowPnuwoMRmdCEST/rk1jg+FqeXzKunDEkEoQ/ElZ1QHyfjyNCxRxkG0TaNv/v
	HCiwqUI4MA/RgreOcaPOL1pvV1q4WJ2URLB+zKGrZV7zgf/Qbb9VhtuSqfBc5/fA869f9T
	brUYdCXzURsNfOKW9OVU6ePnTRP8DFzn7yk92gs9Fhni8+qAf1xwYfytGm3azvtgk4fmLx
	HtjhJGqzxtXAppkrCs3TnRTTVDcr2sKa89kvNRp/zW/4AHh7LXWwQlW+gDR3Ff385y7oeM
	yvyxAB05yC4/+CArYknDhQDKhPLsqZB/v8r928LVxt0tNdyuvTUkTNyRWVCeKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755763009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=78N5yAzXn9F4cMxhSTaeDyetjjEQj7TQb3kpzPri+ps=;
	b=pcseysWdxT0feFT+CR+MGviNCt1/2WmXDJPR3gu7TtTJzzPjET06k8uyj1X7rjquAvEBQp
	CoPsbF3gKF+k51Bg==
Subject: [PATCH 0/3] arm64: uapi: Provide correct __BITS_PER_LONG for the
 compat vDSO
Date: Thu, 21 Aug 2025 09:56:43 +0200
Message-Id: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADvRpmgC/x3MTQrCMBAG0KuUWTsQQ3/Uq0gXsf1SB2wSZkoRS
 u9ucPk27yCDCowezUGKXUxyqrheGpreIS1gmavJO9+5m3e8z5Y56Nq3POW1hI1fslmBfnJauI3
 dPWBA7DFQPYoiyvf/P8fz/AFOR/mrbwAAAA==
X-Change-ID: 20250820-vdso-arm64-compat-bitsperlong-4f59ae7ef6e7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755763005; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FtgeFYaDlptcACR44zN8/uEJ15VLyaL5sLAi8t0tqwg=;
 b=cQoS+W7yx1HdLENzCa9chzj4mcTqwVSeZKJmiTYpFutzIQBXQDMV8Pu/Mw4tsk3hB6r6GZ6qQ
 MemqYTqF37VBb0wqFqy7qwCqmc6oHu+DYu2hcihLlsviBu94OOA1DRV
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005650_805339_1CC663A7 
X-CRM114-Status: UNSURE (   7.95  )
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

The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG is
always '64' even when used from the compat vDSO. In that case __GENMASK()
does an illegal bitshift, invoking undefined behaviour.

The first patch should go into the 6.17 tree.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (3):
      arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO
      arm64: vdso32: Stop suppressing warnings
      arm64: vdso32: Respect -Werror from kbuild

 arch/arm64/include/uapi/asm/bitsperlong.h |  5 +++++
 arch/arm64/kernel/vdso32/Makefile         | 13 +------------
 2 files changed, 6 insertions(+), 12 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250820-vdso-arm64-compat-bitsperlong-4f59ae7ef6e7

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


