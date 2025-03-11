Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISmwNdQ73Q41PwXiqsO2dtX8JhnQg4v/zHOILyDvVTY=; b=ft9fdy8HrsR0EtdDuM8MGWfHk1
	vGghXJLOXPGSWBG8VL0QBKbPWT+5Ct4PwWv0aj0QSnq9JPsGoJj35FQYo+pq95XqiD5Q1jrvPZsHT
	t0xI0woYtCYQ2i2hXYguxSkt+/Rf0mUbfvKn3uApVJFWmXlRtkZJ/Hpi2G5hQerCTRG6D+b8F0D5j
	uKYBQJGVWzZcpPjSUqzqq7H9JcdNG2VaCXUkg3OlNW63dqUNOBYAyi3CMX6ptBkGZGeLUvvjLr4V+
	Dt2PPpg7Pj1FjX4j0DMR1xP/om0LtuLXo4cDgxt+Woe5shlcfBjoSsjlcB71yzh9RXai87+O36AQQ
	urEYPDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Ax-00000006QW2-0q3f;
	Tue, 11 Mar 2025 17:13:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts32q-00000006OVi-09o3;
	Tue, 11 Mar 2025 17:05:34 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741712730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISmwNdQ73Q41PwXiqsO2dtX8JhnQg4v/zHOILyDvVTY=;
	b=BZKUChN+XqYnIwHMV+UKU9CbTv4nOTwJ2/BWqeLwNkEOxSY+8fef06CfjVb9IXErgKoM4G
	zIYdB6HjFnxh1uI13DJSzKq+S1jYdQHynYng7HgPsm8N595e9H6Jn+Ip4dsfwY+NR2d8HC
	1fe2CmUEimGpfDQh7t1uZ6RM68E91VA/Lva7c1lBKwdkDmIGRY13g2ukIdnOFCKAhgzF0d
	IiU5tyRw1kJcofrCguB2mpFt7IcUSL3g/rY6Zadkvkbws17ONpimf2FIb0pKOlF7VBRBbz
	K+d1i3cGAbam9+Pb0CZZLYn75M8VekIunLmWBOxkLoDsXvb+gYRmPJCYLYpGgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741712730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISmwNdQ73Q41PwXiqsO2dtX8JhnQg4v/zHOILyDvVTY=;
	b=tZf3owLoxfs0ZUq5v9X9eQiErlZXP+wKBFGRuLo5Vx4/8BQuNADtOTwfMYuhhXurRf4il1
	ihktBVsHBjoyZEBA==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	john.ogness@linutronix.de,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 09/10] rv: Add rtapp_pagefault monitor
Date: Tue, 11 Mar 2025 18:05:10 +0100
Message-Id: <4b289114af4191be9e905ed6e5b6d43206136673.1741708239.git.namcao@linutronix.de>
In-Reply-To: <cover.1741708239.git.namcao@linutronix.de>
References: <cover.1741708239.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_100532_361157_D70B7BE1 
X-CRM114-Status: GOOD (  33.14  )
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

Real time applications can have unexpected latency due to page faults.

Add an RV LTL monitor to detect such cases. For complete description, see
Documentation/trace/rv/monitor_rtapp_pagefault.rst.

The document is mostly from:
https://www.linutronix.de/blog/A-Checklist-for-Real-Time-Applications-in-Li=
nux

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
---
 .../trace/rv/monitor_rtapp_pagefault.rst      |  36 ++++
 kernel/trace/rv/Kconfig                       |   8 +
 kernel/trace/rv/Makefile                      |   2 +
 kernel/trace/rv/monitors/rtapp_pagefault/ba.c | 139 +++++++++++++++
 kernel/trace/rv/monitors/rtapp_pagefault/ba.h | 158 ++++++++++++++++++
 kernel/trace/rv/monitors/rtapp_pagefault/ltl  |   1 +
 .../rtapp_pagefault/rtapp_pagefault.c         |  84 ++++++++++
 kernel/trace/rv/rv_trace.h                    |  20 +++
 8 files changed, 448 insertions(+)
 create mode 100644 Documentation/trace/rv/monitor_rtapp_pagefault.rst
 create mode 100644 kernel/trace/rv/monitors/rtapp_pagefault/ba.c
 create mode 100644 kernel/trace/rv/monitors/rtapp_pagefault/ba.h
 create mode 100644 kernel/trace/rv/monitors/rtapp_pagefault/ltl
 create mode 100644 kernel/trace/rv/monitors/rtapp_pagefault/rtapp_pagefaul=
t.c

diff --git a/Documentation/trace/rv/monitor_rtapp_pagefault.rst b/Documenta=
tion/trace/rv/monitor_rtapp_pagefault.rst
new file mode 100644
index 000000000000..0ee223d83d09
--- /dev/null
+++ b/Documentation/trace/rv/monitor_rtapp_pagefault.rst
@@ -0,0 +1,36 @@
+Monitor rtapp_pagefault
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+- Name: rtapp_pagefault - realtime applications raising page faults
+- Type: per-task linear temporal logic monitor
+- Author: Nam Cao <namcao@linutronix.de>
+
+Introduction
+------------
+
+One of the most devastating situations for a real-time application is the =
need to assign or "page
+in" memory. This can be due to the over-commitment behavior of Linux when =
accessing allocated or
+reserved memory for the first time. Or it can be paging in disk data (such=
 as text segments) when
+calling functions for the first time. Whatever the case, it must be avoide=
d in order to meet
+response requirements.
+
+The monitor reports these situation where real-time applications raise pag=
e faults.
+
+How to fix the monitor's warnings?
+----------------------------------
+
+The first thing a real-time application needs to do is configure glibc to =
use a single
+non-shrinkable heap for the application. This guarantees that a pool of re=
adily accessible physical
+RAM can be made available to the real-time application. This is accomplish=
ed using the mallopt(3)
+function (M_MMAP_MAX=3D0, M_ARENA_MAX=3D1, M_TRIM_THRESHOLD=3D-1).
+
+Next, all allocated and mapped virtual memory must be assigned to physical=
 RAM and locked so that it
+cannot be reclaimed for other purposes. This is accomplished using the mlo=
ckall(2) function
+(MCL_CURRENT | MCL_FUTURE).
+
+Finally, the amounts of stack and heap needed during the lifetime of the r=
eal-time application must
+be allocated and written to in order to trigger heap and stack assignments=
 to physical RAM. This is
+known as pre-faulting and is usually accomplished by memsetting a large bu=
ffer within a stack frame
+and allocating, memsetting, and freeing a large heap buffer.
+
+Pitfall: Keep in mind that each thread will have its own stack.
diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index d65bf9bda2f2..2822af1b2b4d 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -39,6 +39,14 @@ config RV_MON_RTAPP_BLOCK
 	  Enable rtapp_wakeup which monitors that realtime tasks are not blocked.
 	  For details, see Documentation/trace/rv/monitor_rtapp_block.rst.
=20
+config RV_MON_RTAPP_PAGEFAULT
+	depends on RV
+	select DA_MON_EVENTS
+	bool "rtapp_pagefault monitor"
+	help
+	  Enable rtapp_pagefault which monitors that real-time tasks do not raise=
 page faults.
+	  See Documentation/trace/rv/monitor_rtapp_pagefault.rst for full details.
+
 config RV_REACTORS
 	bool "Runtime verification reactors"
 	default y
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index 6570a3116127..7f21a679ad70 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_RV_MON_WIP) +=3D monitors/wip/wip.o
 obj-$(CONFIG_RV_MON_WWNR) +=3D monitors/wwnr/wwnr.o
 obj-$(CONFIG_RV_MON_RTAPP_BLOCK) +=3D monitors/rtapp_block/ba.o \
 				    monitors/rtapp_block/rtapp_block.o
+obj-$(CONFIG_RV_MON_RTAPP_PAGEFAULT) +=3D monitors/rtapp_pagefault/ba.o \
+					monitors/rtapp_pagefault/rtapp_pagefault.o
 # Add new monitors here
 obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
diff --git a/kernel/trace/rv/monitors/rtapp_pagefault/ba.c b/kernel/trace/r=
v/monitors/rtapp_pagefault/ba.c
new file mode 100644
index 000000000000..6f6322717854
--- /dev/null
+++ b/kernel/trace/rv/monitors/rtapp_pagefault/ba.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is generated, do not edit.
+ */
+#include <linux/rv.h>
+#include <rv/instrumentation.h>
+#include <trace/events/task.h>
+#include <trace/events/sched.h>
+
+#include "ba.h"
+
+static_assert(NUM_ATOM <=3D RV_MAX_LTL_ATOM);
+
+enum buchi_state {
+	INIT,
+	S1,
+	DEAD,
+};
+
+int rv_rtapp_pagefault_task_slot =3D RV_PER_TASK_MONITOR_INIT;
+
+static void init_monitor(struct task_struct *task)
+{
+	struct ltl_monitor *mon =3D rv_rtapp_pagefault_get_monitor(task);
+
+	for (int i =3D 0; i < NUM_ATOM; ++i)
+		mon->atoms[i] =3D LTL_UNDETERMINED;
+	mon->state =3D INIT;
+}
+
+static void handle_task_newtask(void *data, struct task_struct *task, unsi=
gned long flags)
+{
+	struct ltl_monitor *mon =3D rv_rtapp_pagefault_get_monitor(task);
+
+	init_monitor(task);
+
+	rv_rtapp_pagefault_atoms_init(task, mon);
+	rv_rtapp_pagefault_atoms_fetch(task, mon);
+}
+
+int rv_rtapp_pagefault_init(size_t data_size)
+{
+	struct task_struct *g, *p;
+	int ret, cpu;
+
+	if (WARN_ON(data_size > RV_MAX_DATA_SIZE))
+		return -EINVAL;
+
+	ret =3D rv_get_task_monitor_slot();
+	if (ret < 0)
+		return ret;
+
+	rv_rtapp_pagefault_task_slot =3D ret;
+
+	rv_attach_trace_probe("rtapp_pagefault", task_newtask, handle_task_newtas=
k);
+
+	read_lock(&tasklist_lock);
+
+	for_each_process_thread(g, p)
+		init_monitor(p);
+
+	for_each_present_cpu(cpu)
+		init_monitor(idle_task(cpu));
+
+	read_unlock(&tasklist_lock);
+
+	return 0;
+}
+
+void rv_rtapp_pagefault_destroy(void)
+{
+	rv_put_task_monitor_slot(rv_rtapp_pagefault_task_slot);
+	rv_rtapp_pagefault_task_slot =3D RV_PER_TASK_MONITOR_INIT;
+
+	rv_detach_trace_probe("rtapp_pagefault", task_newtask, handle_task_newtas=
k);
+}
+
+static void illegal_state(struct task_struct *task, struct ltl_monitor *mo=
n)
+{
+	mon->state =3D INIT;
+	rv_rtapp_pagefault_error(task, mon);
+}
+
+static void rv_rtapp_pagefault_attempt_start(struct task_struct *task, str=
uct ltl_monitor *mon)
+{
+	int i;
+
+	mon =3D rv_rtapp_pagefault_get_monitor(task);
+
+	rv_rtapp_pagefault_atoms_fetch(task, mon);
+
+	for (i =3D 0; i < NUM_ATOM; ++i) {
+		if (mon->atoms[i] =3D=3D LTL_UNDETERMINED)
+			return;
+	}
+
+	if (((!mon->atoms[RT] || !mon->atoms[PAGEFAULT])))
+		mon->state =3D S1;
+	else
+		illegal_state(task, mon);
+}
+
+static void rv_rtapp_pagefault_step(struct task_struct *task, struct ltl_m=
onitor *mon)
+{
+	switch (mon->state) {
+	case S1:
+		if (((!mon->atoms[RT] || !mon->atoms[PAGEFAULT])))
+			mon->state =3D S1;
+		else
+			illegal_state(task, mon);
+		break;
+	case DEAD:
+	case INIT:
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
+void rv_rtapp_pagefault_atom_update(struct task_struct *task, unsigned int=
 atom, bool value)
+{
+	struct ltl_monitor *mon =3D rv_rtapp_pagefault_get_monitor(task);
+
+	rv_rtapp_pagefault_atom_set(mon, atom, value);
+
+	if (mon->state =3D=3D DEAD)
+		return;
+
+	if (mon->state =3D=3D INIT)
+		rv_rtapp_pagefault_attempt_start(task, mon);
+	if (mon->state =3D=3D INIT)
+		return;
+
+	mon->atoms[atom] =3D value;
+
+	rv_rtapp_pagefault_atoms_fetch(task, mon);
+
+	rv_rtapp_pagefault_step(task, mon);
+}
diff --git a/kernel/trace/rv/monitors/rtapp_pagefault/ba.h b/kernel/trace/r=
v/monitors/rtapp_pagefault/ba.h
new file mode 100644
index 000000000000..eec2068c1419
--- /dev/null
+++ b/kernel/trace/rv/monitors/rtapp_pagefault/ba.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is generated, do not edit.
+ *
+ * This file includes necessary functions to glue the Buchi automaton and =
the kernel together.
+ * Some of these functions must be manually implemented (look for "Must be=
 implemented", or just
+ * let the compiler tells you).
+ *
+ * Essentially, you need to manually define the meaning of the atomic prop=
ositions in the LTL
+ * property. The primary function for that is rv_rtapp_pagefault_atom_upda=
te(), which can be called
+ * in tracepoints' handlers for example. In some specific cases where
+ * rv_rtapp_pagefault_atom_update() is not convenient, rv_rtapp_pagefault_=
atoms_fetch() can be used.
+ *
+ * rv_rtapp_pagefault_init()/rv_rtapp_pagefault_destroy() must be called w=
hile enabling/disabling
+ * the monitor.
+ *
+ * If the fields in struct ltl_monitor is not enough, extra custom data ca=
n be used. See
+ * rv_rtapp_pagefault_get_data().
+ */
+
+#include <linux/sched.h>
+
+enum rtapp_pagefault_atom {
+	PAGEFAULT,
+	RT,
+	NUM_ATOM
+};
+
+/**
+ * rv_rtapp_pagefault_init
+ * @data_size:	required custom data size, can be zero
+ *
+ * Must be called while enabling the monitor
+ */
+int rv_rtapp_pagefault_init(size_t data_size);
+
+/**
+ * rv_rtapp_pagefault_destroy
+ *
+ * must be called while disabling the monitor
+ */
+void rv_rtapp_pagefault_destroy(void);
+
+/**
+ * rv_rtapp_pagefault_error - report violation of the LTL property
+ * @task:	the task violating the LTL property
+ * @mon:	the LTL monitor
+ *
+ * Must be implemented. This function should invoke the RV reactor and the=
 monitor's tracepoints.
+ */
+void rv_rtapp_pagefault_error(struct task_struct *task, struct ltl_monitor=
 *mon);
+
+extern int rv_rtapp_pagefault_task_slot;
+
+/**
+ * rv_rtapp_pagefault_get_monitor - get the struct ltl_monitor of a task
+ */
+static inline struct ltl_monitor *rv_rtapp_pagefault_get_monitor(struct ta=
sk_struct *task)
+{
+	return &task->rv[rv_rtapp_pagefault_task_slot].ltl_mon;
+}
+
+/**
+ * rv_rtapp_pagefault_atoms_init - initialize the atomic propositions
+ * @task:	the task
+ * @mon:	the LTL monitor
+ *
+ * Must be implemented. This function is called during task creation, and =
should initialize all
+ * atomic propositions. rv_rtapp_pagefault_atom_set() should be used to im=
plement this function.
+ *
+ * This function does not have to initialize atomic propositions that are =
updated by
+ * rv_rtapp_pagefault_atoms_fetch(), because the two functions are called =
together.
+ */
+void rv_rtapp_pagefault_atoms_init(struct task_struct *task, struct ltl_mo=
nitor *mon);
+
+/**
+ * rv_rtapp_pagefault_atoms_fetch - fetch the atomic propositions
+ * @task:	the task
+ * @mon:	the LTL monitor
+ *
+ * Must be implemented. This function is called anytime the Buchi automato=
n is triggered. Its
+ * intended purpose is to update the atomic propositions which are expensi=
ve to trace and can be
+ * easily read from @task. rv_rtapp_pagefault_atom_set() should be used to=
 implement this function.
+ *
+ * Using this function may cause incorrect verification result if it is im=
portant for the LTL that
+ * the atomic propositions must be updated at the correct time. Therefore,=
 if it is possible,
+ * updating atomic propositions should be done with rv_rtapp_pagefault_ato=
m_update() instead.
+ *
+ * An example where this function is useful is with the LTL property:
+ *    always (RT imply not PAGEFAULT)
+ * (a realtime task does not raise page faults)
+ *
+ * In this example, adding tracepoints to track RT is complicated, because=
 it is changed in
+ * differrent places (mutex's priority boosting, sched_setscheduler). Furt=
hermore, for this LTL
+ * property, we don't care exactly when RT changes, as long as we have its=
 correct value when
+ * PAGEFAULT=3D=3Dtrue. Therefore, it is better to update RT in rv_rtapp_p=
agefault_atoms_fetch(), as it
+ * can easily be retrieved from task_struct.
+ *
+ * This function can be empty.
+ */
+void rv_rtapp_pagefault_atoms_fetch(struct task_struct *task, struct ltl_m=
onitor *mon);
+
+/**
+ * rv_rtapp_pagefault_atom_update - update an atomic proposition
+ * @task:	the task
+ * @atom:	the atomic proposition, one of enum rtapp_pagefault_atom
+ * @value:	the new value for @atom
+ *
+ * Update an atomic proposition and trigger the Buchi atomaton to check fo=
r violation of the LTL
+ * property. This function can be called in tracepoints' handler, for exam=
ple.
+ */
+void rv_rtapp_pagefault_atom_update(struct task_struct *task, unsigned int=
 atom, bool value);
+
+/**
+ * rv_rtapp_pagefault_atom_get - get an atomic proposition
+ * @mon:	the monitor
+ * @atom:	the atomic proposition, one of enum rtapp_pagefault_atom
+ *
+ * Returns the value of an atomic proposition.
+ */
+static inline
+enum ltl_truth_value rv_rtapp_pagefault_atom_get(struct ltl_monitor *mon, =
unsigned int atom)
+{
+	return mon->atoms[atom];
+}
+
+/**
+ * rv_rtapp_pagefault_atom_set - set an atomic proposition
+ * @mon:	the monitor
+ * @atom:	the atomic proposition, one of enum rtapp_pagefault_atom
+ * @value:	the new value for @atom
+ *
+ * Update an atomic proposition without triggering the Buchi automaton. Th=
is can be useful to
+ * implement rv_rtapp_pagefault_atoms_fetch() and rv_rtapp_pagefault_atoms=
_init().
+ *
+ * Another use case for this function is when multiple atomic propositions=
 change at the same time,
+ * because calling rv_rtapp_pagefault_atom_update() (and thus triggering t=
he Buchi automaton)
+ * multiple times may be incorrect. In that case, rv_rtapp_pagefault_atom_=
set() can be used to avoid
+ * triggering the Buchi automaton, and rv_rtapp_pagefault_atom_update() is=
 only used for the last
+ * atomic proposition.
+ */
+static inline
+void rv_rtapp_pagefault_atom_set(struct ltl_monitor *mon, unsigned int ato=
m, bool value)
+{
+	mon->atoms[atom] =3D value;
+}
+
+/**
+ * rv_rtapp_pagefault_get_data - get the custom data of this monitor.
+ * @mon: the monitor
+ *
+ * If this function is used, rv_rtapp_pagefault_init() must have been call=
ed with a positive
+ * data_size.
+ */
+static inline void *rv_rtapp_pagefault_get_data(struct ltl_monitor *mon)
+{
+	return &mon->data;
+}
diff --git a/kernel/trace/rv/monitors/rtapp_pagefault/ltl b/kernel/trace/rv=
/monitors/rtapp_pagefault/ltl
new file mode 100644
index 000000000000..d7ce62102733
--- /dev/null
+++ b/kernel/trace/rv/monitors/rtapp_pagefault/ltl
@@ -0,0 +1 @@
+RULE =3D always (RT imply not PAGEFAULT)
diff --git a/kernel/trace/rv/monitors/rtapp_pagefault/rtapp_pagefault.c b/k=
ernel/trace/rv/monitors/rtapp_pagefault/rtapp_pagefault.c
new file mode 100644
index 000000000000..32aaae9fea46
--- /dev/null
+++ b/kernel/trace/rv/monitors/rtapp_pagefault/rtapp_pagefault.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/ftrace.h>
+#include <linux/tracepoint.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/rv.h>
+#include <rv/instrumentation.h>
+#include <linux/sched/rt.h>
+#include <trace/events/sched.h>
+#include <trace/events/exceptions.h>
+#include <rv_trace.h>
+
+#include "ba.h"
+
+static void handle_page_fault(void *data, unsigned long address, struct pt=
_regs *regs,
+				unsigned long error_code)
+{
+	rv_rtapp_pagefault_atom_update(current, PAGEFAULT, true);
+	rv_rtapp_pagefault_atom_update(current, PAGEFAULT, false);
+}
+
+void rv_rtapp_pagefault_atoms_fetch(struct task_struct *task, struct ltl_m=
onitor *mon)
+{
+	rv_rtapp_pagefault_atom_set(mon, RT, rt_task(task));
+}
+
+void rv_rtapp_pagefault_atoms_init(struct task_struct *task, struct ltl_mo=
nitor *mon)
+{
+	rv_rtapp_pagefault_atom_set(mon, PAGEFAULT, false);
+}
+
+static int enable_rtapp_pagefault(void)
+{
+	int ret;
+
+	ret =3D rv_rtapp_pagefault_init(0);
+	if (ret)
+		return ret;
+
+	rv_attach_trace_probe("rtapp_pagefault", page_fault_kernel, handle_page_f=
ault);
+	rv_attach_trace_probe("rtapp_pagefault", page_fault_user, handle_page_fau=
lt);
+
+	return 0;
+}
+
+static void disable_rtapp_pagefault(void)
+{
+	rv_detach_trace_probe("rtapp_pagefault", page_fault_kernel, handle_page_f=
ault);
+	rv_detach_trace_probe("rtapp_pagefault", page_fault_user, handle_page_fau=
lt);
+
+	rv_rtapp_pagefault_destroy();
+}
+
+static struct rv_monitor rv_rtapp_pagefault =3D {
+	.name =3D "rtapp_pagefault",
+	.description =3D "monitor RT tasks do not page fault",
+	.enable =3D enable_rtapp_pagefault,
+	.disable =3D disable_rtapp_pagefault,
+};
+
+void rv_rtapp_pagefault_error(struct task_struct *task, struct ltl_monitor=
 *mon)
+{
+	trace_rtapp_pagefault_error(task);
+#ifdef CONFIG_RV_REACTORS
+	if (rv_rtapp_pagefault.react)
+		rv_rtapp_pagefault.react("rv: %s[%d](RT) raises a page fault\n",
+					task->comm, task->pid);
+#endif
+}
+
+static int __init register_rtapp_pagefault(void)
+{
+	rv_register_monitor(&rv_rtapp_pagefault);
+	return 0;
+}
+
+static void __exit unregister_rtapp_pagefault(void)
+{
+	rv_unregister_monitor(&rv_rtapp_pagefault);
+}
+
+module_init(register_rtapp_pagefault);
+module_exit(unregister_rtapp_pagefault);
diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
index 79a7388b5c55..560581d7edcb 100644
--- a/kernel/trace/rv/rv_trace.h
+++ b/kernel/trace/rv/rv_trace.h
@@ -165,6 +165,26 @@ TRACE_EVENT(rtapp_block_sleep_error,
 	TP_printk("rv: %s[%d](RT) is blocked\n", __get_str(comm), __entry->pid)
 );
 #endif
+#ifdef CONFIG_RV_MON_RTAPP_PAGEFAULT
+TRACE_EVENT(rtapp_pagefault_error,
+
+	TP_PROTO(struct task_struct *task),
+
+	TP_ARGS(task),
+
+	TP_STRUCT__entry(
+		__string(comm, task->comm)
+		__field(pid_t, pid)
+	),
+
+	TP_fast_assign(
+		__assign_str(comm);
+		__entry->pid =3D task->pid;
+	),
+
+	TP_printk("rv: %s[%d](RT) raises a page fault", __get_str(comm), __entry-=
>pid)
+);
+#endif
 #endif /* _TRACE_RV_H */
=20
 /* This part must be outside protection */
--=20
2.39.5


