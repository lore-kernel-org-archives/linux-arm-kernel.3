Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D235C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7HE16cTWh0LIBUy6fN5rL+qHRcRB8SMkm0Cp3E+ZQI=; b=AcHLL7FfwC1WnG8anmKKW8cvH9
	Q0WDvWZrjmqAYAyW6BZu/aIGXPWwzwyk/FQKfbWP9VUYAhtEZtcgXiCxhahk36iWvmCH79BAj6Y5R
	IYa+v6q+s0FHHuJiXqqniJkCeg+luPP0+mKOrz9Hd/VxnnEUw6hzzxb7Q/B8UcZjDwI6PNZb9BPlD
	By2vg0Krf9QuGNj4VDtW1ASIf9dQ0WfxY6Beei9TOnCu+1puws3YUemmtQQf7yd3ChUHhqSPtVckG
	6pUM7Jos5UAArdhuccnFAwKDV9j313Nhwgl5wHJ9KOhMPUPZ8BN9Q7ly5zR2PhHqoiOeCej1wIi86
	0o6XHLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bwH-000000053Kc-0qhJ;
	Tue, 15 Apr 2025 08:46:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4br6-000000052YW-06MK;
	Tue, 15 Apr 2025 08:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C03843982;
	Tue, 15 Apr 2025 08:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB10C4CEDD;
	Tue, 15 Apr 2025 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744706478;
	bh=sFvm3RtqxguiraxwSRB7QMxvnv4/oCgDX/PU1J6QmSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJDuH9/PABQLF1dtJg+CLTitXeFrpR69LUsMzYRdS4h7m5RVORYgSJyHIVUQIuc4d
	 NPYC3ZfTn8RtWMzksNNoHPnTxwpMGfLlNgy9tkpvXGgaPtGrRiAR5i7JxNdhhXQeZt
	 7YG8YK6GW39QEFN3C8slLJej93DIQcZkOGJYM6Ab19ipOExb5/SqYzVhYPdsiEikn9
	 +9vru6wf6oiCHuyMCkIDpuJsl98sGtxiRVwR3F+eUceu6Rf+UAR1HX64PUQWKJ2Z/x
	 8RfRVko5RF03697bXs2j2M0UYG/6nQvfC1Of2OBGv7GDlwFR9zYT1Ew9oiVZzKwPVr
	 V4zF9amJhKGKA==
Date: Tue, 15 Apr 2025 10:41:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>, 
	Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream <wsd_upstream@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "chenqiwu@xiaomi.com" <chenqiwu@xiaomi.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Message-ID: <20250415-speichel-heften-2eeb4ef264f1@brauner>
References: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
 <20250410210507.GD15280@redhat.com>
 <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
 <20250414165043.GG28345@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414165043.GG28345@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_014120_083457_E456D1B8 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, Apr 14, 2025 at 06:50:44PM +0200, Oleg Nesterov wrote:
> On 04/14, Tze-nan Wu (吳澤南) wrote:
> >
> > On Thu, 2025-04-10 at 23:05 +0200, Oleg Nesterov wrote:
> > > 
> > > As for sys_reboot(), I think that kernel_power_off() must be
> > > __noreturn,
> > > and sys_reboot() should use BUG() after
> > > LINUX_REBOOT_CMD_POWER_OFF/_HALT
> > > instead of do_exit().
> > > 
> > 
> > Yes, kernel_power_off() should not return, but this is the case only if
> > kernel_power_off() is invoked by PID 1 through sys_reboot().
> > If kernel_power_off() is invoked by a kernel thread (e.g., the thermal
> > kernel module) other than PID 1, then do_exit() could possibly be
> > invoked by PID 1 after kernel_power_off() on another CPU.
> 
> Yes sure, this is clear.
> 
> I have mentioned sys_reboot() because (unless I am totally confused)
> this connects to the previous report from Breno.
> 
> And I agree that we should do stop_other_cpus() first, but let me
> say this again: I can't help ;)
> 
> But in any case, rightly or not I still think that the init process
> should not exit/crash due to POWER_OFF/HALT. We should not mask this
> problem in do_exit().

I agree.

