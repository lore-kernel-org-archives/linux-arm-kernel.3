Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DA3CCF9E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=lccNRRk780OLOrvRTmsIIfoLd+zwTDZxXhd+4kcSfCA=; b=uXj4Zsgjb25pTb
	kBbWzWrjTVXAvejNnRzrW6SjIdpnzjmnVH/3fiSUyy7tHTi2CTHAXtqPr/JOWkgCUoTrk6RCYnW6W
	y+jbGqtnM6BoOA9B0rL3lr6DjuJtAA6GAsWurYXn+yT8Lfk5EXQMAVsAQbi9e8yyUnTIt8St/UlFZ
	L8ey0+OweVo+/ZmDsZhZSzRmplbjWqkgMWlnJs1rPdDTcpVb703P/MUeQ2NVvIRYIaV4W/dfTAvDB
	6TfZPPb1t7LdwK9ba+TnaxsVNK6UACScXZ/k19tuQnMb8gIfPk25kLhmAS02vm92M5eU/Ga7oHHUD
	/xA0nKMo0jWd2jaO4y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYI5-00000002rII-0Jkk;
	Wed, 22 Oct 2025 12:50:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHD-00000002qOt-0TH0;
	Wed, 22 Oct 2025 12:49:22 +0000
Message-ID: <20251022103112.419590507@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lccNRRk780OLOrvRTmsIIfoLd+zwTDZxXhd+4kcSfCA=;
	b=kSNLvhZHcJTcvSj8XCd+k+HYD9K4T7yCINmy83VEZBK84m3WfK/bM45mfZ5F0pkI6uuJu0
	oytRSuCMIOKuePJ3eBS98GD4Y8yR0+mSEW1CFZInDFQFQGtQ6aybIQf+lGATl+mCkVjvAS
	Bv9uqeqEjKipDkPqb8YRk0E0bTCt4ULyXEgYj11AP66+iaO0pej0K5kqDozoGdnp3g6kIE
	QADjIdbC4Rb2fXcGo7OGvJ4afzmSSZCRuG2WSJvRB6gDLxIxDlS+byoXg3jYsPtCPt3tXy
	mz5W6+lpGnVsjOfQuAHbg7HE8LLFTei08BImHMANYVlHxFwey+pKUDBBTnKG3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lccNRRk780OLOrvRTmsIIfoLd+zwTDZxXhd+4kcSfCA=;
	b=jBvd0+8wGhqi9YLp+G44n5XgyHsh8eF5MQnWzMNg30j3PgApN0ylxUrS8tq8eAgva7Gr6V
	RLwP5H6AG5silIDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V4 09/12] [RFC] coccinelle: misc: Add scoped_$MODE_access()
 checker script
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 14:49:13 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_054915_343311_062DC32A 
X-CRM114-Status: GOOD (  11.99  )
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

A common mistake in user access code is that the wrong access mode is
selected for starting the user access section. As most architectures map
Read and Write modes to ReadWrite this goes often unnoticed for quite some
time.

Aside of that the scoped user access mechanism requires that the same
pointer is used for the actual accessor macros that was handed in to start
the scope because the pointer can be modified by the scope begin mechanism
if the architecture supports masking.

Add a basic (and incomplete) coccinelle script to check for the common
issues. The error output is:

kernel/futex/futex.h:303:2-17: ERROR: Invalid pointer for unsafe_put_user(p) in scoped_user_write_access(to)
kernel/futex/futex.h:292:2-17: ERROR: Invalid access mode unsafe_get_user() in scoped_user_write_access()

Not-Yet-Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

--- /dev/null
+++ b/scripts/coccinelle/misc/scoped_uaccess.cocci
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Validate scoped_masked_user*access() scopes
+///
+// Confidence: Zero
+// Options: --no-includes --include-headers
+
+virtual context
+virtual report
+virtual org
+
+@initialize:python@
+@@
+
+scopemap = {
+  'scoped_user_read_access_size'  : 'scoped_user_read_access',
+  'scoped_user_write_access_size' : 'scoped_user_write_access',
+  'scoped_user_rw_access_size'    : 'scoped_user_rw_access',
+}
+
+# Most common accessors. Incomplete list
+noaccessmap = {
+  'scoped_user_read_access'       : ('unsafe_put_user', 'unsafe_copy_to_user'),
+  'scoped_user_write_access'      : ('unsafe_get_user', 'unsafe_copy_from_user'),
+}
+
+# Most common accessors. Incomplete list
+ptrmap = {
+  'unsafe_put_user'			 : 1,
+  'unsafe_get_user'			 : 1,
+  'unsafe_copy_to_user'		 	 : 0,
+  'unsafe_copy_from_user'		 : 0,
+}
+
+print_mode = None
+
+def pr_err(pos, msg):
+   if print_mode == 'R':
+      coccilib.report.print_report(pos[0], msg)
+   elif print_mode == 'O':
+      cocci.print_main(msg, pos)
+
+@r0 depends on report || org@
+iterator name scoped_user_read_access,
+	      scoped_user_read_access_size,
+	      scoped_user_write_access,
+	      scoped_user_write_access_size,
+	      scoped_user_rw_access,
+	      scoped_user_rw_access_size;
+iterator scope;
+statement S;
+@@
+
+(
+(
+scoped_user_read_access(...) S
+|
+scoped_user_read_access_size(...) S
+|
+scoped_user_write_access(...) S
+|
+scoped_user_write_access_size(...) S
+|
+scoped_user_rw_access(...) S
+|
+scoped_user_rw_access_size(...) S
+)
+&
+scope(...) S
+)
+
+@script:python depends on r0 && report@
+@@
+print_mode = 'R'
+
+@script:python depends on r0 && org@
+@@
+print_mode = 'O'
+
+@r1@
+expression sp, a0, a1;
+iterator r0.scope;
+identifier ac;
+position p;
+@@
+
+  scope(sp,...) {
+    <...
+    ac@p(a0, a1, ...);
+    ...>
+  }
+
+@script:python@
+pos << r1.p;
+scope << r0.scope;
+ac << r1.ac;
+sp << r1.sp;
+a0 << r1.a0;
+a1 << r1.a1;
+@@
+
+scope = scopemap.get(scope, scope)
+if ac in noaccessmap.get(scope, []):
+   pr_err(pos, 'ERROR: Invalid access mode %s() in %s()' %(ac, scope))
+
+if ac in ptrmap:
+   ap = (a0, a1)[ptrmap[ac]]
+   if sp != ap.lstrip('&').split('->')[0].strip():
+      pr_err(pos, 'ERROR: Invalid pointer for %s(%s) in %s(%s)' %(ac, ap, scope, sp))


