Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48952E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iqsuDDlHDJ2bNwEn9TFHJaaIK1PftSUTThEO0MmNF/c=; b=M36fd2vlkZz3J2
	FzvTJk84et37BcBzml/G897/AeFiFDuwd7g1NwZEpnmzecNvrgJgDEy0O3dws6gA1FqUYzkimxxUW
	HEejGCJ0W2H4Nvvib3L1Dlgqx3kRAyAg4ltIWM/N6U51p0F9mWfvLiRkxvnc0FUqcj8gPx8YdmY12
	a5IdC+y3Algy/lpabaDWXHjNlQold3dSxwOTSkmeYfRPv4esZL3IduvRTc2+h6nVdMKquoAcGI/t2
	y2FaHkotg79q5Rx7A2pwg3a3rh/Oy9UpmpZ3NAmTAzazCFUXWaX5KfUxYL//GAp8Y6JQzt+GtWYL3
	8PznMXqyQRhEolHun3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrDt-0000000CzAA-1kud;
	Wed, 04 Dec 2024 15:23:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrCr-0000000CyrN-0lJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1D015C455A;
	Wed,  4 Dec 2024 15:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79C0C4CECD;
	Wed,  4 Dec 2024 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733325744;
	bh=YxbdLK0hPdinmJ7aseN6ZxvZEvKSnXJP4oKfttGQxMg=;
	h=From:Subject:Date:To:Cc:From;
	b=so4yfvkvN9CDgMc6hEnOllf8Nm3zaqsK5NEJLHvCdhz31RV7sTx/cq/2nSN8Dku7t
	 23F6IN8Gad0ycca3IE/TPM3lwhxI7iNC2BH1NAJVtJHwhtFwaQwFha6HJxkiA7y6jY
	 AaDRjIFCQ9T0G/pwyJ4cI9YpG28v7YJt0+vsQIsL+fF536WuodGM9uyl8tS8QKPG7Q
	 sslqF9neGm6Ws1LyD1yspxyYr43IkTWrfSzyxp1MfAkvQKUwIcGsXJeWXP3ZOWkHyp
	 K2eneCiB2Wko+9nX4bWJlBHZy3ARSAXj9wwRxypcpDL7q9wADVPGEKCYqmhA6UcaCc
	 Alv9sv6d3sEGA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/6] arm64/sme: Collected SME fixes
Date: Wed, 04 Dec 2024 15:20:48 +0000
Message-Id: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBzUGcC/22Nyw6CMBREf4XctddQqDxc+R+GRYERGqGYW0M0p
 P9uJXHnZpIzyZzZyEMsPJ2TjQSr9XZxEbJDQt1o3AC2fWTK0kyrGGxkLjT7GSyAM+0ErisUulO
 FMhUoDh+Cm33t0msTebT+uch7/1jVt/3p8n+6VXHKfXXKdVn3qi3Lyx3iMB0XGagJIXwArzVMW
 rUAAAA=
X-Change-ID: 20241202-arm64-sme-reenable-98e64c161a8e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YxbdLK0hPdinmJ7aseN6ZxvZEvKSnXJP4oKfttGQxMg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnUHOoeQbPc1HbfhMEJ6VMwbqGljtgzH/xL/utSJwc
 BuyUoruJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1BzqAAKCRAk1otyXVSH0BawB/
 90OIzPt6j6CGU6RuSdHVSMeewxBU+uf1YFk4npaIu9/p54fletxj5NfLw3xCyb3bdsFlmpFpk3S/AW
 Wx/8C6TMHj/2Iuohrqgm5pUK+h8LS1WET6CSqFh45R9N1+V3MvfuLr7Z7L1mMMBd+VbV733ZiEJAFO
 sg/pNDrso2ZbqEDbog4svL/AwhmtkaL+uIUSdikXRrNzc0TPGvQ6w4pgzXlau6eTRbuCUrPP/8rfRy
 AcS1URPzbJ7KoSmU00K9d0c6OY2NCH7une+m/R6lM5SZcLdY23cnuE/TWDFDNO6K5DHaxpZJ2IUBnz
 wWdJhYdYKubtbJO5c4aQUCD979PDH2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_072225_267750_BAC8DBCB 
X-CRM114-Status: UNSURE (   9.28  )
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

This series collects the various SME related fixes that were previously
posted separately.  These should address all the issues I am aware of so
a patch which reenables the SME configuration option is also included.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Pull simplification of the signal restore code after the SME
  reenablement, it's not a fix but there's some code overlap.
- Comment updates.
- Link to v1: https://lore.kernel.org/r/20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org

---
Mark Brown (6):
      arm64/sme: Flush foreign register state in do_sme_acc()
      arm64/fp: Don't corrupt FPMR when streaming mode changes
      arm64/ptrace: Zero FPMR on streaming mode entry/exit
      arm64/signal: Avoid corruption of SME state when entering signal handler
      arm64/sme: Reenable SME
      arm64/signal: Consistently invalidate the in register FP state in restore

 arch/arm64/Kconfig              |  1 -
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 57 ++++++++++++++++++++++----
 arch/arm64/kernel/ptrace.c      | 12 +++++-
 arch/arm64/kernel/signal.c      | 89 +++++++++++------------------------------
 5 files changed, 84 insertions(+), 76 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-arm64-sme-reenable-98e64c161a8e

Best regards,
-- 
Mark Brown <broonie@kernel.org>


