Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EA2CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 04:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBnIK/nJsi6jJN8QWY7b2HVBRiA75eCXzZiNWo4QQ/M=; b=oQqNWANMAvALm3v2zGglnkXhG6
	5HJqTJiLejBzDnsQxwO2Qek+724EBEqFpoOU2owMRkl9llaYL8ktWbVaK1xxUiecfdYdYnrdhT8Wj
	jePIi2MjvHqTymCc970uRo+RjkDr3yt2t8dkn3AgPVthnHF4ErxrTKxV0nZNmzJ3zQGDEjtZkB+Wl
	OJYKsZ5IaXmgpNM/Ld+eq//Yo+b1nlqXbzylhc+uP6DPpSPzAqaeLQZ5lF8qx0sOFhTzQI5He7If/
	2tCqdZgdycm/1MjI9PcJAMR838uum1S7tvFRBEULXt1nljAQt7T3V6eLG4E0Kj5HzEZx+zi8dJTff
	IhUVf+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1N8-00000008u6Z-2GZu;
	Thu, 04 Sep 2025 04:14:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0w8-00000008lSx-0reZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 03:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E96D44CDE;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D26DC4AF09;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957617;
	bh=xAOGr0wz5pVGa6TAyVuH2Ski5/R27AIRietPZivlbmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxUuM0l0f6VAAADe9tpJw8aZR/FHuaXXhhclaetWnKatzrmKi6ULANZV52XYZUpPf
	 NTdQcABHTS9HYn4nNWXtYCJ8UXxgdsWbJXIULuaS76nQ+RlFVkwRYUHbeWeBiHtS+3
	 e/Vbnr8NFwQKJ6toL2gZulhjRTAN+kSSM6quA6WGwUkezR9ngqGJQbqj/DmklpOi2r
	 zbKYtjBexzhoDD5Pz2s2ODzYX19xf9/mvJ9Vub/CqhC7ccjcoRAU3qI45jULzhIvsC
	 FCXWrTyXe7XRCdGkWL9Wlr9m0uP7NTslglMW1chFs2+WHSJWnGeMHobGsBxsAG/ZXA
	 4GYXUb7113nFg==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/9] x86/traps: Clarify KCFI instruction layout
Date: Wed,  3 Sep 2025 20:46:41 -0700
Message-Id: <20250904034656.3670313-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=kees@kernel.org; h=from:subject; bh=xAOGr0wz5pVGa6TAyVuH2Ski5/R27AIRietPZivlbmo=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYv+GWdP3f0jz/ecudlNqZ2MUk+XdjndX6TGcmXJX Mmiovv+HaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABN53cTIMCG2z3jpxYd+zROt DkRvZTHaI+nde21V1OEvD7fNWH+27jgjQ1fBrcSXK3ubLVRPpx3TPudw2mN654+p71OLJ+cdrFv VzQEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_204700_283864_4751E2AF 
X-CRM114-Status: GOOD (  13.28  )
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

Just a nit-picky change to the KCFI indirect call check instruction
documentation. The addl offset isn't always -4 (it depends on patchable
function entry configuration).

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/kernel/cfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cfi.c b/arch/x86/kernel/cfi.c
index 77086cf565ec..638eb5c933e0 100644
--- a/arch/x86/kernel/cfi.c
+++ b/arch/x86/kernel/cfi.c
@@ -27,7 +27,7 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	 * for indirect call checks:
 	 *
 	 *   movl    -<id>, %r10d       ; 6 bytes
-	 *   addl    -4(%reg), %r10d    ; 4 bytes
+	 *   addl    -<pos>(%reg), %r10d; 4 bytes
 	 *   je      .Ltmp1             ; 2 bytes
 	 *   ud2                        ; <- regs->ip
 	 *   .Ltmp1:
-- 
2.34.1


