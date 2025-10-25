Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC3CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3yl5ADTAgZ4qFPPfSsmp9DqkxB2aNEJ2RyJyGbf1Zm8=; b=s9NfYqxcSswNL0
	QNn6kMAsKHcUajKi8Aeaywd1mgTcgHf4SE4vnjZygzhnCrchvw0FLZJ9ekmIiJHWckUwFPMbopYt6
	x+kXaHidtbhHkPWoC+vMIrBjcQH+TTeJLLJ2+2pcT1XjKVQez8PFldxE00Mk0a2Vim9ey3kG8UtNu
	90XJZ5fa55usSNUqf9jyzpjjM8/iHPneB6NzDihqg9BGMXlhXYv0RYZLqoNZGi2zib62E9pzojvez
	PkKO6/un0d/6Id2l7wJVoOffs9SX4F5nnS5jv0Q0XXidnZpgWF0n/BNZh99kqaPCQGOe18c0jIFZT
	7Fzg4/OUZqG9zDVPhfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGe-0000000BkFC-2chy;
	Sat, 25 Oct 2025 20:53:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClGd-0000000BkF3-1qgD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75459602E5;
	Sat, 25 Oct 2025 20:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19D9C4CEF5;
	Sat, 25 Oct 2025 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761425616;
	bh=rFP6/tMgv7qEPLocj8aUGISHZ+Qd8YkLgA3SOHA7IFg=;
	h=From:Subject:Date:To:Cc:From;
	b=dO/6fv8UzBrVLHCd0fc5uz0cG4KMB4yZCCKfEv9PNfJyt84N4HvvFkr9SLnMqoDFq
	 MC6eeGlHxKjdFusduqS7whF3+LI8uKHHteq3L9cWbYdyemGHfH0ZSATjn/+MON4nS+
	 SGGq1Cu+x5RfhbSJy4JDd4k8QNud+Gl3MRmzbK3Ov/jHNuzYhE+y1BYrF3vbNNsq+Z
	 VmnU+g43DmrJD1Yeb54OmFGrJsvhVL+6rzRnlCyQruroujbYpynmGyUkhljT/ulpWi
	 Xeeaa19Wt57Ra1CCiMogevG+w3M2zt0PY0oPJYav6FKkRGvOhDbcTjcx4VqYVYJpKr
	 0oc7OvhL9PEMA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] Resolve ARM kCFI build failure in idpf xsk.c
Date: Sat, 25 Oct 2025 21:53:17 +0100
Message-Id: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL04/WgC/x3MQQoCMQyF4auUrA3YajvoVcRFp001jM6UFEUov
 fsEF2/xwePv0EiYGlxNB6EvN95WhT0YSM+4Pgg5q8Ednbc6ZS1Y+IdR3rikwjh/+JWRRDbB4CP
 5S7DhNJ1BG1VIv//+7T7GDuPH3rVvAAAA
X-Change-ID: 20251025-idpf-fix-arm-kcfi-build-error-65ae59616374
To: Kees Cook <kees@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=939; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rFP6/tMgv7qEPLocj8aUGISHZ+Qd8YkLgA3SOHA7IFg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl/Lc6kLCj/wcq3yeGsWg7TjF1BU1OvzJSQmSEluq/5j
 HWb2Dr/jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARxxhGhpMGy3/Le1eG6FrY
 x++odOT0dJn48p5ImrV8U3D8r61Bbgx/+Lv3M71ZtCXF/VdhpWPpuyP58q4bnoSFhR9hYrlkFtP
 KCgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Hi all,

This series resolves a build failure that is seen in
drivers/net/ethernet/intel/idpf/xsk.c after commit 9705d6552f58 ("idpf:
implement Rx path for AF_XDP") in 6.18-rc1 with ARCH=arm and
CONFIG_CFI=y. See patch 3 for a simplified reproducer on top of
defconfig.

I think this could go via hardening or net.

---
Nathan Chancellor (3):
      compiler_types: Introduce __nocfi_generic
      ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
      libeth: xdp: Disable generic kCFI pass for libeth_xdp_tx_xmit_bulk()

 arch/Kconfig                   | 7 +++++++
 arch/arm/Kconfig               | 2 ++
 include/linux/compiler_types.h | 6 ++++++
 include/net/libeth/xdp.h       | 2 +-
 4 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251025-idpf-fix-arm-kcfi-build-error-65ae59616374

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


