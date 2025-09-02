Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5131ACA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMJmfqvFyy+iMjlsEXM1T/zdFCArF7GdodLlr0nVrKU=; b=ZepXTt8Vzxi2772QTwkAC7z0gN
	ypZSNYlbCye+WI36QzNT7DZf1Mnb14Pk6qVPsLvNLuSTYDMQNFOhRn+glp3Qe4N13PAJuMb5Tfmb/
	zg4JHe3amoqcWzaIZnLsbQDX4ncy13/eM9NSlfWr9Z/H3gd2HwwNK1B1nNlheALgzRugo8iEJ70xm
	Okl5pwrSfHGA7BCzy05rF/Gas+Fb5ev6zyvakkTi5LCBGGOG6Xl05WZEO+5EbyYhbKqf65eQWjZ+B
	wrCsEaFtMviNpdinbyHIDOP2sDU3x4qFilZ0jzA3d+Y/0t6aRMYlvAxbKo0h8TuOvdVR+I6TpKIoj
	i89FWXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFb-000000006jU-3TTa;
	Tue, 02 Sep 2025 13:40:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOd0-0000000GmGM-3NRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:52:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756810359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bMJmfqvFyy+iMjlsEXM1T/zdFCArF7GdodLlr0nVrKU=;
	b=0VnCVdC0JyOreFu3txAY0etBQuxWxqRKTml8V+HWZEfTivRGtfFAO8jyd2nk7S39L9FdTw
	eL7/H4lQ3qZ60YSatsK7ZDZuTo8aIdWlu0QD2M/acFEEj2mxc2I7yB0/lcHOKGQkvQW8tC
	jXvXWxSfE9sWzlbUxwpMdZ/4JOAbcqARmnBEFFRcSZsfISFlz0lVLbJBNhp8PUiClaLslb
	SM5DxiOUcKx5+eyAcMol5z1K9Y6x4sPfkDOtYZoxYGQUeyl7VGSj2TO9/mRkEkGEW3mU1l
	DmKISSVy04TQg1UMApxvGZH6EKU4K3bbQslG737hdkgkh6tlrVF0me982/g39Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756810359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bMJmfqvFyy+iMjlsEXM1T/zdFCArF7GdodLlr0nVrKU=;
	b=XIyDwmlWNe7CWetzkBNJuLOoe+yzWUJhvHWqY5hbemAT0PYJda/K2pkJDjL8GWh8CYVXgS
	hb0U7dSgaUriFgDQ==
To: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Cc: Llillian@star-ark.net, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
 anna-maria@linutronix.de, bigeasy@linutronix.de, catalin.marinas@arm.com,
 chenhuacai@kernel.org, francesco@valla.it, frederic@kernel.org,
 guoweikang.kernel@gmail.com, jstultz@google.com, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@kernel.org, pmladek@suse.com,
 rrangel@chromium.org, sboyd@kernel.org, urezki@gmail.com, v-singh1@ti.com,
 will@kernel.org, Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot
 timestamp
In-Reply-To: <20250902070253.936687-1-kaiwan.billimoria@gmail.com>
References: <871pp14pkr.ffs@tglx>
 <20250902070253.936687-1-kaiwan.billimoria@gmail.com>
Date: Tue, 02 Sep 2025 12:52:37 +0200
Message-ID: <87a53d2kju.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_035242_986121_808D865E 
X-CRM114-Status: UNSURE (   9.21  )
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

On Tue, Sep 02 2025 at 12:32, Kaiwan N. Billimoria wrote:
> So, just confirming: here 1409443611 divided by 200 MHz gives us 7.047218055s
> since boot, and thus the actual timestamp here is that plus 0.000001s yes?
> (Over 7s here? yes, it's just that I haven't yet setup U-Boot properly for uSD
> card boot, thus am manually loading commands in U-Boot to boot up, that's all).

Looks about right.

> A question (perhaps very stupid): will the hwcnt - the output of the read() -
> be guaranteed to be (close to) the number of increments since processor
> power-up (or reset)? Meaning, it's simply a hardware feature and agnostic to
> what code the core was executing (ROM/BL/kernel), yes?

Under the assumption that nothing on the way resets the counter.

Thanks

        tglx

