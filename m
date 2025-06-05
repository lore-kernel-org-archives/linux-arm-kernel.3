Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8D8C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uk7jUtyFriANUDP97nlPEEGavPhnHMbnB5cr3BLrlT4=; b=vqN0nvmBG/Kf6nwm4I59E5DtZw
	D+17BqUIuy95Fgm+58oA52x/o9AtDhrOdxVIIwD2ISiKklBtGkVsjy0oEUP9XsUC9dzcC6Qz8GICQ
	+7yDb28IplJIWYA42s919dwlcbKQQeCUl74+cjNCleZNfmko48GzTvVjXZQKHKGNCuymsGgSsMcbO
	CXOMvht/2nrrALQBOgjp15N0brJzBJpZqa9Se0Xv9mtrc+xV7yWfK60rYCy5FaGcleBM1Sx8l86vv
	qQd9AWJfQ0dqXxaALUVhN6D6usa4qo1pykT6Vwkei8pQ0DE59SaZivMIB8zgQpt8z+AlSyTYCOTcK
	v/JdX46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5If-0000000Eybx-31Xl;
	Thu, 05 Jun 2025 07:46:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5FN-0000000Ey6C-0FkB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 07:42:48 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749109363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uk7jUtyFriANUDP97nlPEEGavPhnHMbnB5cr3BLrlT4=;
	b=dEzXuzzm7qOiZMhDCY/Uud8J20wiBvShDbrLBHWRDku30PSJqFP9GmEhs/RJC9zsYW0i8i
	9rYw4AXFkvvQLl7qgc6YXVpqqOzax1c9YNeZKxww5TQ9Ekz8BRNXvuIIm7r7+QijfB8ApF
	wRzBCmdbCdc6EYW3F/zUMAy/mdDKNu8bI/KCDMWE2OZYOzNAOXXTJTmjhl975w0ML3QWs4
	lMqG4i6cqEVCQ3q8No7Xwqt+/9EbvxPRts8XVGYSlSbHgijpztY/cnU9BKzKbqVZF4rRkv
	mkwegLuyKU6mzdPM71WzW0VOUayNd6RWLkIarIs70Dd4klJ7YPc1V9wd9VH/CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749109363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uk7jUtyFriANUDP97nlPEEGavPhnHMbnB5cr3BLrlT4=;
	b=xaIgdKHQsDFX9XqICsj59NIkOI0erRFCXhx9udCz/da7bXgApBUFttnk84VGCi7r9Uk1wC
	cfdfJoV3IOB1QEAQ==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Michael Kelley'
 <mhklinux@outlook.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <TY4PR01MB1377757DD5E7F27A41F0B4723D76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <SN6PR02MB41575419E1223B8A8B0A1F1FD46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <TY4PR01MB1377757DD5E7F27A41F0B4723D76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
Date: Thu, 05 Jun 2025 09:48:42 +0206
Message-ID: <84frgevdl9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_004245_244802_934A575C 
X-CRM114-Status: GOOD (  18.99  )
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

On 2025-06-05, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
>> I've tested the fix in my primary environment (ARM64 VM in the Azure cloud), and I've seen no failures to stop a CPU. I kept my
>> custom logging in place, so I could confirm that the problem path is still happening, and the fix recovers from the problem path.
>> So the good results are not due to just a timing change. The "pr/ttyAMA0" task is still looping forever trying to get ownership
>> of the console, but it is doing so at a higher level in nbcon_kthread_func() and in calling nbcon_emit_one(), and interrupts are
>> enabled for part of the loop.
>> 
>> Full disclosure: I have a secondary environment, also an ARM64 VM in the Azure cloud, but running on an older version of
>> Hyper-V. In this environment I see the same custom logging results, and the "pr/ttyAMA0" task is indeed looping with
>> interrupts enabled. But for some reason, the CPU doesn't stop in response to IPI_CPU_STOP. I don't see any evidence that this
>> failure to stop is due to the Linux pl011 driver or nbcon. This older version of Hyper-V has a known problem in pl011 UART
>> emulation, and I have a theory on how that problem may be causing the failure to stop. It will take me some time to investigate
>> further, but based on what I know now, that investigation should not hold up this fix.
>> 
>> Michael
>
> Thank you for testing the patch.
> I'm concerned about the thread looping...

The thread would only loop if there is a backlog. But that backlog
should have been flushed atomically by the panic CPU.

Are you able to dump the kernel buffer and see if there are trailing
messages in the kernel buffer that did not get printed? I wonder if the
atomic printing is hanging or something.

John

