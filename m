Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2427CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=; b=vcRJoAMo8LO+wc
	YETEbywawkNa0DtlvsVfa4p2m2EhKUNd6ztWc9NNgGmEl1uyqYZ+iKLXUSxs96LaaLxlBqi45aArS
	fLqU3hm6t1jdDJXV12lHu8oQuix9Iwjw2lqQXBIOwt7Z1Btj+snrZw3HSKNcV5ulUgItpVwyMrFKf
	40uros5gstvtBFPFR7veQm97fVdKDmDuULldwGO11W6CYEh+M/Vw4A5eFPQa4EPxmkDQY9RhqCQvq
	x1Y96O1IVJWKa0KDYKGMBfr+oIVLaRj/mMZgnhXYFwS6bb4iGgqFK7YB6K7M9Qvewgf95ftSMtPla
	0QNy4F/lkyZv6DeHuZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIqB-0000000DOqN-2cs1;
	Mon, 27 Oct 2025 08:44:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpe-0000000DOBA-1qCm;
	Mon, 27 Oct 2025 08:44:08 +0000
Message-ID: <20251027083745.673465359@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=;
	b=xItvuyS+liJchgafJHpU9tYzPOno9TqkarDH1yZCK3/SY8LaeF0qT3opEQkDdO2pbpY6RP
	Htv+fdHsKQ7EcNx1mU7B7kjkr2MwCU/4llsA9ZTs/iz+8JRvkjQPVcPUyemRxjlbtktGKw
	GsJHGW2ZY09kGlWJaszbHS77TSX4HGu2viKiUm9yVfGlp4Wr7eYi0dBWXqDf+lbjgf3UOL
	EK1SbwjiDt9mqIf2xFqEMIs2XBc6hrKI7n1ZGKPIsTdyVEWZ5039b7tBmAnJ6wMzAJxKjx
	WAWU5PRgWHSrODttFM/9WH+13KTG9uP6NXR5SYwhtmgFY+wKA/oNAOAMka0zHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=;
	b=tYimNmTfzHE55VQN/cxG6Mfbc65avtlgEq43Xb/8LXKZ65sSl0k4ojYbJ4I2f258Ii1cd0
	MyXDnpD51wgg7VCQ==
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
Subject: [patch V5 09/12] [RFC] coccinelle: misc: Add
 scoped_masked_$MODE_access() checker script
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:43:58 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014402_744893_3ED1DA63 
X-CRM114-Status: GOOD (  12.28  )
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

kernel/futex/futex.h:303:2-17: ERROR: Invalid pointer for unsafe_put_user(p) in scoped_masked_user_write_access(to)
kernel/futex/futex.h:292:2-17: ERROR: Invalid access mode unsafe_get_user() in scoped_masked_user_write_access()

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


