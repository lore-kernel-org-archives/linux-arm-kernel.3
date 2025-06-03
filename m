Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D2EC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSILnF8ALIga7ol7KA0XLGa9sgrZiwLmZV6n0yOi3XI=; b=egrRasf/OunB7cmuykZ9xqbt23
	oZpfD4h9K3KYj/DWAfRkdQFWvvtI29fRMFmQjD27xNqVuPj37WeqvllNf3++Oiuci2Dl8TlKoYLdM
	yFZ1ztgzeRoUSB9W2PlOBn2USdOJJps2zl1N1GrF4P6l1OgaLfAYl5OlP1izocyROAblKsbsDdE2K
	43YMBQn3anRgIgwFfpGl+3uZ8DLc1SBuv684bRyvw+9ZlTgSd/43NEimMJEhwW5ETzsLIfQN/6nTs
	Fg2QJfcbgHJdbakRhAxCA6p4WQJ03iMUOtAVmR6C7si5pAlvk0YfTyCy0ouKWjOqxDWa6lylVeq42
	+IwIPHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPac-0000000AlkU-3YMO;
	Tue, 03 Jun 2025 11:13:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPWW-0000000Akrw-3g6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:09:42 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748948979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bSILnF8ALIga7ol7KA0XLGa9sgrZiwLmZV6n0yOi3XI=;
	b=yfTIZSBpy5wwH7vutk1qg0rFMVXceMLdecwvwpXNQJRcBoM+Yyy9ykNR98BVsj1TxMzMk2
	g8+UvQHVCBiteNweMsZ8rEEHskOGiWxknuKEPxkctPjaiwan81mPCSLlb34Yu0fmmipY1P
	taWiBXXsmXiC9pLqfPSeNCzR3iHsEVn8ee4zrdwGDt+8q6c+P5h8gkvaECqIoLO83DSNx9
	tF5y5NszsmM8J+cwM3p+ip4rid589mD3wMlaJjm92AcQvEtLBvL8BSxG5kHeY2Fkto8sto
	uvYDnZz+sD4TNf450kyWmzdZytVGD7gGYGIbt33o6NldOHWL3tWmzhdzyhcgmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748948979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bSILnF8ALIga7ol7KA0XLGa9sgrZiwLmZV6n0yOi3XI=;
	b=J4qg9UZ1ZUwWnm70gdWiEtdVO+Muyz5BT1zrP5oqHRzpEnmyYcZaFYNMwssNNEzDsz6X7/
	0Bt2qYwxc8y5HwBA==
To: pmladek@suse.com
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>,
	'Michael Kelley' <mhklinux@outlook.com>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <84y0u95e0j.fsf@jogness.linutronix.de>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
Date: Tue, 03 Jun 2025 13:15:38 +0206
Message-ID: <84plfl5bf1.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_040941_061414_3390B6F1 
X-CRM114-Status: GOOD (  17.59  )
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

Hi Petr,

On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
> On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
>>> 4. pr_emerg() has a high logging level, and it effectively steals the console
>>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon design.
>>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
>>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
>>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
>>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
>>> enters a busy "while" loop waiting to reclaim the console. It's doing this
>>> busy "while" loop with interrupts disabled, and because of the panic,
>>> it never succeeds. Whatever CPU is running "pr/ttyAMA0" is effectively
>>> stuck at this point.
>>> 
>>> 5. Meanwhile panic() continues, calling panic_other_cpus_shutdown(). On
>>> ARM64, other CPUs are stopped by sending them an IPI. Each CPU receives
>>> the IPI and calls the PSCI function to stop itself. But the CPU running
>>> "pr/ttyAMA0" is looping forever with interrupts disabled, so it never
>>> processes the IPI and it never stops. ARM64 doesn't have a true NMI that
>>> can override the looping with interrupts disabled, so there's no way to
>>> stop that CPU.
>>> 
>>> 6. The failure to stop the "pr/ttyAMA0" CPU then causes downstream
>>> problems, such as when loading and running a kdump kernel.
>
> [...]
>
>> After reproducing the issue, 
>> I plan to try a workaround that forcibly terminates the nbcon_reacquire_nobuf
>> loop in pl011_console_write_thread if other_cpu_in_panic is true.
>> Please comment if you have any other ideas.
>
> For panic, if it is OK to leave uap->clk enabled and not restore REG_CR,
> then it should be fine to just return. But only for panic.
>
> So something like:
>
> 	while (!nbcon_enter_unsafe(wctxt)) {
> 		if (other_cpu_in_panic())
> 			return;
> 		nbcon_reacquire_nobuf(wctxt);
> 	}

Actually this is not enough because there is also a loop inside
nbcon_reacquire_nobuf().

nbcon_reacquire_nobuf() needs to return an error for the panic case
because it will never succeed. This is the only case where it will never
succeed. Should we use a bool? Or return some code like -EPERM?

So the above code becomes:

 	while (!nbcon_enter_unsafe(wctxt)) {
 		if (!nbcon_reacquire_nobuf(wctxt))
 			return;
 	}

We should also add __must_check to the prototype.

Thoughts?

John

