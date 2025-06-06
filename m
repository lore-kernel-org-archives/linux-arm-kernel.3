Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AA1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNlEqQbY+fa98gHMzcIrLM+qc3h/stf4tBXFHk8HQmQ=; b=Kw80cuZxz3c5mcrEAuTBzlLaTZ
	G0q6C6KoNkk62ffO3LZui9BoCTlYqvV8aOxBy3vHXEQ8OJR6glVvMweoEKv+l30pMxzjJbdKCn8HG
	hED2tz6/F2lC5kifxpnpHo95zKDE7Pl5NrHEt0v45UFUOqF5WccCWcLeJEwcwVRYCo0NLP/h7Ghmq
	i7NRcU5XgEkLTSX0+PnkOyPtZgiTmmr/4YaruyxAiowm1u0FPWyFGhfDcenOtCbAMmjWEYMoFlKBp
	rEoMh0OfdQr0Tc3+fBAL6ogWFlTO1+On5P6nYL6+YxhgA+6kqYD2zTOE8nvH4siwR+sanVZ5z2Iuh
	g3pPv3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUbv-0000000058W-0cbR;
	Fri, 06 Jun 2025 10:47:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUPk-000000003Yj-1RCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:35:09 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749206106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNlEqQbY+fa98gHMzcIrLM+qc3h/stf4tBXFHk8HQmQ=;
	b=tY4fxOkzUOGEzSfuyTD1Xd7XXCr0wIg9z+OmDJ1uHXs/0D6FrBM/ARQL+JKenmmx/SpN1Z
	JAaEnnksFD2pAgpGepixdsCDbPwxD74kL6ismmFvB9cLDuRgf8ibnKAFi5/2b5701+mDCg
	5VpEE4EglAvv54Fl8fO/P2s7xX4L3DtAiHURV80AJrT7N47nWHbrRREZFuqYmx38diQKZs
	BKUf+HgD+rtvBpRhYWfMzpNZuqVoW4oPOpDSwEJeV5WekTNskz0yvoEUH1kCnq2ICR1vVE
	YbvnoKZtWzTI3AC6z4Ds2rIK1sD6dpBSviLaFZzF+GvfnCIm4DZojFmf8kxmVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749206106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNlEqQbY+fa98gHMzcIrLM+qc3h/stf4tBXFHk8HQmQ=;
	b=nRJZ20AcwHFYUmZVwaWsjyLVYVVIrcXFd2uY86bpZxAlNp2w/pQPxHQZvAEKp0MqcL8Y+l
	KcVTJEOFTSVwaWBg==
To: Petr Mladek <pmladek@suse.com>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Cc: 'Michael Kelley' <mhklinux@outlook.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <84frgdcgug.fsf@jogness.linutronix.de>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz> <84o6v3ohdh.fsf@jogness.linutronix.de>
 <aEBNLMYVUOGzusuR@pathway.suse.cz>
 <TY4PR01MB13777CC92C858572B9C19394FD76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEGeARVcCwqcoHb8@pathway.suse.cz> <84frgdcgug.fsf@jogness.linutronix.de>
Date: Fri, 06 Jun 2025 12:41:06 +0206
Message-ID: <84cybhcg4l.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_033508_666008_B2047D6E 
X-CRM114-Status: GOOD (  17.72  )
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

On 2025-06-06, John Ogness <john.ogness@linutronix.de> wrote:
> On 2025-06-05, Petr Mladek <pmladek@suse.com> wrote:
>> The question is if it is worth it. Is the clean up really important?
>
> I must admit that I am not happy about encouraging the proposed solution
> so far (i.e. expecting driver authors to create special unsafe code in
> the panic situation). It leads down the "hope and pray" path that nbcon
> was designed to fix.
>
> What if during non-panic-CPU shutdown, we allow reacquires to succeed
> only for _direct_ acquires? The below diff shows how this could be
> implemented. Since it only supports direct acquires, it does not violate
> any state rules. And also, since it only involves the reacquire, there
> is no ugly battling for console printing between the panic and non-panic
> CPUs.

Thinking about it some more, since it does not involve printing, why not
just always allow reacquiring directly in panic?

This simplifies the diff significantly.

John

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d60596777d278..26c229b7f56ea 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -235,7 +235,8 @@ static void nbcon_seq_try_update(struct nbcon_context *ctxt, u64 new_seq)
  *			the handover acquire method.
  */
 static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
-					    struct nbcon_state *cur)
+					    struct nbcon_state *cur,
+					    bool ignore_other_cpu_in_panic)
 {
 	unsigned int cpu = smp_processor_id();
 	struct console *con = ctxt->console;
@@ -249,7 +250,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
 		 * nbcon_waiter_matches(). In particular, the assumption that
 		 * lower priorities are ignored during panic.
 		 */
-		if (other_cpu_in_panic())
+		if (other_cpu_in_panic() && !ignore_other_cpu_in_panic)
 			return -EPERM;
 
 		if (ctxt->prio <= cur->prio || ctxt->prio <= cur->req_prio)
@@ -568,7 +569,7 @@ static struct printk_buffers panic_nbcon_pbufs;
  * in an unsafe state. Otherwise, on success the caller may assume
  * the console is not in an unsafe state.
  */
-static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
+static bool nbcon_context_try_acquire(struct nbcon_context *ctxt, bool ignore_other_cpu_in_panic)
 {
 	unsigned int cpu = smp_processor_id();
 	struct console *con = ctxt->console;
@@ -577,7 +578,7 @@ static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
 
 	nbcon_state_read(con, &cur);
 try_again:
-	err = nbcon_context_try_acquire_direct(ctxt, &cur);
+	err = nbcon_context_try_acquire_direct(ctxt, &cur, ignore_other_cpu_in_panic);
 	if (err != -EBUSY)
 		goto out;
 
@@ -913,7 +914,7 @@ void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
 {
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
 
-	while (!nbcon_context_try_acquire(ctxt))
+	while (!nbcon_context_try_acquire(ctxt, true))
 		cpu_relax();
 
 	nbcon_write_context_set_buf(wctxt, NULL, 0);
@@ -1101,7 +1102,7 @@ static bool nbcon_emit_one(struct nbcon_write_context *wctxt, bool use_atomic)
 		cant_migrate();
 	}
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		goto out;
 
 	/*
@@ -1486,7 +1487,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq,
 	ctxt->prio			= nbcon_get_default_prio();
 	ctxt->allow_unsafe_takeover	= allow_unsafe_takeover;
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		return -EPERM;
 
 	while (nbcon_seq_read(con) < stop_seq) {
@@ -1784,7 +1785,7 @@ bool nbcon_device_try_acquire(struct console *con)
 	ctxt->console	= con;
 	ctxt->prio	= NBCON_PRIO_NORMAL;
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		return false;
 
 	if (!nbcon_context_enter_unsafe(ctxt))

