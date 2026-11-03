Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3EF606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=48vvv5oJ;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=bDm2GHYu;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=LR8s8ZiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=W0ZUFOadJC6PrSKEwszh5okV1YbbWnVO0ckCp82sIZI=; b=48vvv5oJHVbX/a
	6i0zZ8PkW2eatIBIzHAbTYa1aPwsT8Sc+NdB3Wz1lIL1N/WiH9lveTAC8c1Sw+xXFP4yu1a/Pv5iR
	eqrPID/s1ZzoLJdBhV6G8oOswsBEzOdRg6BUDBbX0yQXVMnH49qBpSYVUTwMATWtRw3f7WAdBQ5pY
	kTq297tD27yRXEjY7XBAtCEgTPgW5rABcNgjK1GrJk63Zg1eC4FPgdIRhjVkomZNMQzUvWhVAQeWI
	yahaaMLlaOON7j6ljppcIIy7Z4JaaSu1MliJk4Hev/M5/GkmMKytcVQ2SsKWE6KRjk2tW/nkQlBio
	mQ6+qhfCcpTlPr4mTneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD0d-00000002Gf0-3n6Q;
	Tue, 03 Nov 2026 11:48:59 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD0b-00000002GdV-2EpO;
	Tue, 03 Nov 2026 11:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793706530; bh=W0ZUFOadJC6PrSKEwszh5ok
	V1YbbWnVO0ckCp82sIZI=; b=bDm2GHYuLgJgsv1tigyfg8wCCz8luzpaITA7dtAo4ZROwJSouD
	nMZI9HWXSMsQ4c1P+5HOOR1iHzumvla4XuY6Fs2SiuI+dY0Zeco7bfChDKQV3eLI0m9kfKS5CE6
	YPuHBb2yT2+lMPX1xhzU1uuXQn4POUfWdswS7iH2WNd112Fo9CT+oASA36d8FtsZ00bxnmr5ljf
	SNwZSd0W7tfbEJ2AcOwh0jVqbd9TXx6Rjvy1kncVjKsDlEK2orHsqx/+L1i208BzkwfpehnHXmh
	R1uidw8LHtD37sqfT883lblwSaeKQGLFrEM3Q2zPTsBJ46QmSSxJXQFyBtsJk9uXioQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793706530; bh=W0ZUFOadJC6PrSKEwszh5ok
	V1YbbWnVO0ckCp82sIZI=; b=LR8s8ZiPGOLCPF9tLMbTdiWec6+ioKJ1ftUMcZwrMpaw+aerQh
	0OkZAtuGQEP4rj7GBl0l41ut2Fpidf/OlFCw==;
Date: Tue, 03 Nov 2026 11:48:52 +0000
From: Bradley Morgan <brads@mainlining.org>
To: daniel.lezcano@oss.qualcomm.com
CC: akpm@linux-foundation.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, peterz@infradead.org, rafael@kernel.org,
 tglx@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_smpboot=3A_Allow_restr?=
 =?US-ASCII?Q?icting_per-CPU_threads_to_a_CPU_mask?=
In-Reply-To: <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
Message-ID: <79AC1B3F-F158-4808-AD7E-70AE659E8DB5@mainlining.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034857_746570_001F3C4E 
X-CRM114-Status: GOOD (  15.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2 November 2026 23:09:40 GMT, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>smpboot_register_percpu_thread() creates a thread for every online CPU
>and registers the descriptor for subsequent CPU hotplug operations.
>There is currently no way to restrict these threads to a subset of
>CPUs, even when the user only needs work performed on that subset.
>
>For example, an idle injection device targets a specific CPU mask.
>Creating threads outside that mask consumes resources unnecessarily.
>Supporting multiple such devices also requires each descriptor to
>manage only the threads associated with its own CPUs.
>
>Add an optional CPU mask to struct smp_hotplug_thread and apply it
>throughout the thread lifecycle. Registration creates threads only for
>online CPUs in the mask. CPU bring-up creates threads for selected
>CPUs that were offline at registration, while parking and unparking
>are restricted to the same mask.
>
>Apply the restriction to thread destruction as well, both during
>unregistration and registration failure cleanup. This is necessary
>when descriptors with disjoint masks share the same per-CPU task
>storage: tearing down one descriptor must not stop or clear threads
>owned by another descriptor.
>
>The caller must keep the mask valid and unchanged until the descriptor
>is unregistered. Callers sharing per-CPU task storage must ensure their
>masks do not overlap and serialize ownership changes themselves.
>
>A NULL mask preserves the existing behavior, so current users continue
>to manage threads on all CPUs.
>

This is simple as it gets, thanks.

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>---
> include/linux/smpboot.h |  4 ++++
> kernel/smpboot.c        | 17 +++++++++++++++--
> 2 files changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
>index 9d1bc65d226c..98c072eeaf24 100644
>--- a/include/linux/smpboot.h
>+++ b/include/linux/smpboot.h
>@@ -5,6 +5,7 @@
> #include <linux/types.h>
> 
> struct task_struct;
>+struct cpumask;
> /* Cookie handed to the thread_fn*/
> struct smpboot_thread_data;
> 
>@@ -27,6 +28,8 @@ struct smpboot_thread_data;
>  *			unparked (cpu online)
>  * @selfparking:	Thread is not parked by the park function.
>  * @thread_comm:	The base name of the thread
>+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
>+ *			valid and unchanged until the descriptor is unregistered.
>  */
> struct smp_hotplug_thread {
> 	struct task_struct		* __percpu *store;
>@@ -40,6 +43,7 @@ struct smp_hotplug_thread {
> 	void				(*unpark)(unsigned int cpu);
> 	bool				selfparking;
> 	const char			*thread_comm;
>+	const struct cpumask		*cpumask;
> };
> 
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread);
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 4503b60ce9bd..07857523a465 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 	struct smpboot_thread_data *td;
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return 0;
>+
> 	if (tsk)
> 		return 0;
> 
>@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (!ht->selfparking)
> 		kthread_unpark(tsk);
> }
>@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (tsk && !ht->selfparking)
> 		kthread_park(tsk);
> }
>@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
> 	for_each_possible_cpu(cpu) {
> 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+		if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+			continue;
>+
> 		if (tsk) {
> 			kthread_stop_put(tsk);
> 			*per_cpu_ptr(ht->store, cpu) = NULL;
>@@ -279,7 +291,8 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
>  * 					    to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Creates and starts the threads on all online cpus.
>+ * Creates and starts the threads on online CPUs selected by the descriptor's
>+ * cpumask, or all online CPUs if no mask is specified.
>  */
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>@@ -308,7 +321,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
>  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Stops all threads on all possible cpus.
>+ * Stops all threads associated with the descriptor, including offline CPUs.
>  */
> void smpboot_unregister_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>


--- Thanks!

