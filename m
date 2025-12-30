Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD90E94122
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=216KVOlY02968JQn1X6t3Xl8U0YV+kMSpa6yCEhcMZ0=; b=FWp1kKZ/y7WzQuWWTQ3HieNw0E
	Pervi6l6A57KDzFameS3+YVVFgKs6WSUR314wDsX2ybnt1LVZk3D5+E3eqeFrCHF+1vnBeViCO+wv
	ChMAKvjpzBrg4Mr4NpFwt6yMuzCRCh1auxhRa0DiFM7jDs+abQDudjXtfRYGmt7PlOAOfYXUCiavP
	YXYHCGeYUhGMiyXkKGYhJ3T3OmE9cq4cccpl1MzIScTQ+3CjaYIrL2rA7H4d4SUE5B3LHUiS6ch1Q
	ahGLHmgMgL6ghESBRpMCiCzw4z1vF+S947qSWSNK0DgmZOWuK9v6F7UqJcOlZw7RpiFF7hKYlu6lA
	cCqqQAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsu-00000004Up9-15ih;
	Tue, 30 Dec 2025 07:11:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsk-00000004Ujv-19KB;
	Tue, 30 Dec 2025 07:11:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=216KVOlY02968JQn1X6t3Xl8U0YV+kMSpa6yCEhcMZ0=;
	b=JntQ3si8MLrP2MpCR1+OEWNd81aJ/qhkCp94JA/Ya1ve8COVEizpQpdOtwHChAXB5kltbU
	Ws3gZWwf2Myp17MCTCJAHH3HDfVMt6wJROw/X6gVEREUdbBtAjz3EjsUmDRgwyDoRngH/7
	vUqd9H/F0U5YB93waS8ZU4vmhBot5MgRv/CEdepkjG0X9nbxTJaJZfd5lG5NteBa4EBVrh
	0ErZG2q2WrrcXdkV/rnLgNolfMOXBXWG5PUaxPVlwjiPhdV6g5EITNsDacv+oDqg9I8d18
	NZTvPR/bfjFHib8xNSLt7nWeoq0Xu2lY5LG8o+5la0rr3hBMzuZ/PwsHwPzXBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=216KVOlY02968JQn1X6t3Xl8U0YV+kMSpa6yCEhcMZ0=;
	b=KI95VUE1ItLOgk32L8YjnYbIKghtAzkSpebLn2uXfUH3jy+0BPCOpegdnYYznoFj/i1Wej
	UZ04m9ZkrtUUVXBg==
Date: Tue, 30 Dec 2025 08:10:59 +0100
Subject: [PATCH 4/5] x86/uapi: Stop leaking kconfig references to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
In-Reply-To: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1557;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZOE7KyuSlKH6XcxA1h4Q37Qp45CteslFj5lH67emOQk=;
 b=OYir6/1EucH7c1HcVMuphZ1xXvzTijkLimlJ4SpgcqZmSSE0gYkERzRWWRVaMrfoovAGdZrxd
 fDqcdtuv+EaCh+sTYpUahJeWGST4wS+3dsAx5bAB5+bNC+BNgNfLceK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_470444_72DEFE5D 
X-CRM114-Status: UNSURE (   9.86  )
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

UAPI headers are not supposed to leak references to kconfig symbols.
These won't be set when building userspace. Hide the kconfig reference
behind 'if defined(__KERNEL__)', so it will be stripped by
headers_install.sh. The result for userspace will be the same, but the
exceptions in headers_install.sh can also be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/uapi/asm/auxvec.h | 2 +-
 scripts/headers_install.sh         | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/auxvec.h b/arch/x86/include/uapi/asm/auxvec.h
index 6beb55bbefa4..bdde9e18f94e 100644
--- a/arch/x86/include/uapi/asm/auxvec.h
+++ b/arch/x86/include/uapi/asm/auxvec.h
@@ -11,7 +11,7 @@
 #define AT_SYSINFO_EHDR		33
 
 /* entries in ARCH_DLINFO: */
-#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
+#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64))
 # define AT_VECTOR_SIZE_ARCH 3
 #else /* else it's non-compat x86-64 */
 # define AT_VECTOR_SIZE_ARCH 2
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 613f400a67d1..1301ba68d772 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,8 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 "
 
 for c in $configs

-- 
2.52.0


