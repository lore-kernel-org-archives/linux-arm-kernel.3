Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9844ACA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIFnSPMg9Bymqs8kNREw99ZhuGgc5tL7GY1mtTi0wO8=; b=ngrxco/M8UoDHFrh94GKLnYOZ1
	B4A+xwoBktYlEJeOOu57jkeltK8e08+z0NxakOuOEuj5s9vAIDCPiPuzH30hd+ZXkbjOqJyAVmBej
	a+FanAFcZZVeEqsFjbNy5MXoTpajMM+hAqyP+3qoqGInZwCB6qp06e1OW+x0Xo3rIWvPU6ik5bgKx
	t91H+RuDbuRf1vbWHBvpE3NS5ECcSUz7hzGIcz6cPeifA84y2oIP3kHsiMC1GPgRHpEpimFV6ZbTK
	Bdjf1oSfJ9SVII+VwnRJWoZhY5xoT9QZtxORsDjhngvfTRZV6vCsCVSTy8L+F0akkA1/zYh/PsK+4
	wCHDl2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0yq-00000008mSe-2dft;
	Thu, 04 Sep 2025 03:49:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0w5-00000008lPO-2mkq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 03:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4D5E44BFD;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B1C4CEF1;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=/OwwI41G7+Tx15l2gGzfUnj2QKLIC0KZTQah1RCXchQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MylokCOLrkzILw21dOISnvzdCnC5ic0BWGjbhj8ixodadygjQteMcRPhO8kWoA6oM
	 6GGtXCwET8NKOjZBkeQkGxSP6IXjq1MixvApdHAq/v86BP1hkZUR0qeSbyCvE/ddJl
	 nx+Fz20MrH6eKgXxDA9x1tjRS2xT7WVy2EwOeLedKKzRsKXAYtXbuC/jxFE1u9qpvj
	 t+BktwnoIU7pmPMUzvEyGkybllUiJoG+Zmx/52PVWdBYgjjJZ+ZCXE/AeZwsmBRq9p
	 GkGB5PYo+MShdaIc3qEtNQ8SgapozpZ2b0dMj9QaWmUCcQ6kOEbIQKgteHkRbDJXVx
	 uMZB0k8YpJ8EA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/9] x86/cfi: Document the "cfi=" bootparam options
Date: Wed,  3 Sep 2025 20:46:42 -0700
Message-Id: <20250904034656.3670313-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=kees@kernel.org; h=from:subject; bh=/OwwI41G7+Tx15l2gGzfUnj2QKLIC0KZTQah1RCXchQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYslK7sPyK8r/yYYUab2O3f2jr2JoYvqn009+jJ05 /mHQR/4OkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACbyXpnhf5wCS2RwSuTUzIet 4T/Zd6uV+UjqykrE3eZIe6IgUGClyshwNDmyTXFnvZOH35caoe/G/HMao/tC9mbahsZZqp28lcQ NAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_204657_743462_62A47E2D 
X-CRM114-Status: GOOD (  11.41  )
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

The kernel-parameters.txt didn't have a section for the cfi= options.
Add it.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: <linux-doc@vger.kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..8bbffbb334ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -608,6 +608,23 @@
 	ccw_timeout_log	[S390]
 			See Documentation/arch/s390/common_io.rst for details.
 
+	cfi=		[X86-64] Set Control Flow Integrity checking features
+			when CONFIG_FINEIBT is enabled.
+			Format: feature[,feature...]
+			Default: auto
+
+			auto:	  Use FineIBT if IBT available, otherwise kCFI.
+				  Under FineIBT, enable "paranoid" mode when
+				  FRED is not available.
+			off:	  Turn off CFI checking.
+			kcfi:	  Use kCFI (disable FineIBT).
+			fineibt:  Use FineIBT (even if IBT not available).
+			norand:   Do not re-randomize CFI hashes.
+			paranoid: Add caller hash checking under FineIBT.
+			bhi:	  Enable register poisoning to stop speculation
+				  across FineIBT. (Disabled by default.)
+			warn:	  Do not enforce CFI checking: warn only.
+
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
 			The effects of cgroup_disable=foo are:
-- 
2.34.1


