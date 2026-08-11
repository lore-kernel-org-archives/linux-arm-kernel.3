Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT6hSK6dCyhvMY8v+H5Q2DmkLhuUd8areAcsKTCVpMo=; b=dFUNEvty6hbc34oDFRXnmq2FPy
	YrdRuw9Ccc+YqSZGdoR1DLiC58TzhOgdbt5JiaTXVhTkdWwzpbERPNme7EESH8XJDrZFoi3IULYC1
	mnMVrqa9oq+qguEf5hR7Jh3Sl/HUpgUJIJXD1GU/E/p/HiNCUWQNgyXar/U+SViU/nuZmbeWrFMgJ
	6dJbPeEPDN87n2v4xp8+0qHKpyX5rLh/o14+oa9Kt3hI0s0h+QybityvvkzQBlpZ13lyqo9fyODIX
	P39i/lAdOHj0BIZ0oGHHMGWGlDQihyLGQIoX5i2CrVtn7JbWQouF7Ns9jwbJ4k6rzEjIuTYXM1aED
	TVH0znkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtntc-0000000EGCR-1Ic0;
	Tue, 11 Aug 2026 14:56:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnta-0000000EGCH-3jnw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:56:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5ABF432BC;
	Tue, 11 Aug 2026 14:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07911F00A3D;
	Tue, 11 Aug 2026 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786460162;
	bh=HT6hSK6dCyhvMY8v+H5Q2DmkLhuUd8areAcsKTCVpMo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=fn2b+gjhJmajcN1srFLVzD9FCv7FQYRTwcoe8IeHHxIjm7stJ7Fciqq7r8g4t+L5y
	 3ztv2ksdWI9g3NQZUnocdNkKxroDBjqdG+F2GEHQUZcB94Yd20H7fybN+hpNFqUUqA
	 ibwRbfwNgJE0rJ+Sqf0a2uTkTtyr5czsdMZGjAIOqFmVz+gGX7CTSUImELbN8UiQt5
	 78lwwmjUDRwtlEbq7Bm8pKhhyExybiUHm6I38Zv2UST8fgO/G9gqjN0fz9O4yiUypO
	 aANul5nol8+RUB5KAzyJnSicRihu9OW9gO04CcdHAkkFYqoIFOzQjAUii9LdvxXZfS
	 p41hRFRpD3Ivw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 340FC198005C;
	Tue, 11 Aug 2026 10:56:00 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 10:56:00 -0400
X-ME-Sender: <xms:_Td7auTHp_PyxLsfGZ0V4OmLFyGbYS-kcXiRumVFOGTxQR4cnt8QIw>
    <xme:_Td7aunHxVWGDEb7YSM9OhHI9qNnPpDfL7RKbzKhQC-B1bs7d5a-y88qQXiaxRrxB
    7lxAPXU7SHh0kBANFga-WMnzc_zjBeXhYna3l68dB3gOmYnJirOw0w>
X-ME-Proxy-Cause: dmFkZTGvyB8glIV2LSlhYkTe6x/y6RJKM55sr6x+k/Yfuis6oSpI/RJTCkD0x1FwkOaT5l
    XC99IWTv1jOCu4TKB9XXlJSkwOvz8zR/+ECt46uzl2e0zvaRoL2zWpP76x4gFpqVSdq7S8
    dhoQQMRkVdnq9JienpvKL122VWbsWgrU1UxRYcrwP1/7ap51pQJVYPu4s75AsIUARjxi8i
    03+LMy/uE8et6Y/6923S+WJA7NNvzJtg41BMbg4JLu2wsgZBCYnNpWe1mcPhTM+rFJnxG0
    rxM/1h0XTcNPeUofBsXd3ym6u0VzV0bqlOkjmKBSLWSM+3X7prVRMLYHT2GSkgcnJGTqjt
    QYDksdzIPdEfchZ8DMZrYbsSU+pCglMF0ZT1Wx5lRKPS/YwA3UJ9dIlakspGWUKJ057SYI
    5Qyq8fsX827GztGt880WCfTurVkecNHg2ieMVGRx+TonTHnVQxO+m3gs7aKIO7zPvUe5Ma
    fzPt2JKe8CPg4dQkjuaU9p1G0uHaweOnv9uNyqokRs/FGAGwCMzjgXJqF/09fKQg+R7QM+
    qhMRF303ufraEJ+n3R0nJGZLNvLgnCAjDwqKMQxFKVakyPWx3PzI2n3cdVwNYDZOlVMxuf
    YJbmTVdCiyOHxro6ZOqbdayWeqrR8fC0S/J3zGAc08U5d7lnhvE+VZz1+b+Q
X-ME-Proxy: <xmx:ADh7agjX5bLGxZn2l_hbuPM4zN-_EZNiipDVDV_9quT8fCHSikRRGg>
    <xmx:ADh7alY-ThdF3s6QDrXERyB-xhlPMrtSM-qUT5OYME1GiE-_TA5wxg>
    <xmx:ADh7ashfVYZmY8QR5Frb9xQiF4_34O9-BcIrDBj6Kupdf_8T2eWHcA>
    <xmx:ADh7avaM_CmFrxo0rEif0DRptw0CLjLSY-l1cT1PAO7sZsU0e4JYvQ>
    <xmx:ADh7aqOou7oDKf2yECCSSJJaJL5B_j1yfI_Gmc9sexWUytAdycRRRQPr>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6311BF8006A; Tue, 11 Aug 2026 10:55:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 16:55:37 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
 "Song Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>,
 "Petr Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <eb01f226-b067-42dc-be86-328a19a20844@app.fastmail.com>
In-Reply-To: <answWdRpVQLtIzIj@willie-the-truck>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
 <answWdRpVQLtIzIj@willie-the-truck>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 11 Aug 2026, at 16:23, Will Deacon wrote:

> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> Date:   Tue Aug 11 14:11:44 2026 +0000
>
>     arm64: bti: Disable in-kernel BTI with recent versions of Clang
>    
>     The following BTI exception was seen when loading a livepatch module:
>    
>       Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
>       pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
>       pc : kill_orphaned_pgrp+0x0/0x150
>       lr : do_exit+0x498/0xaf0 [livepatch_combined]
>    
>     The problem is that the patch module's do_exit() is branching to a
>     static function in vmlinux using a module PLT veneer (indirect branch),
>     but the target function doesn't have a BTI landing pad.
>    

I had missed this bit before, i.e., the fact that the target is a static
function inside vmlinux.

The lack of a BTI landing pad suggests that the address of this function
is never taken either, and so the symbol in question is not exported to
modules, right?

Does KLP make any special accommodations to ensure that this is safe? Otherwise,
BTI is not the only potential issue: the compiler may apply interprocedural
optimizations, and the function in question may not be AAPCS64 compliant as
a result.

It also means treating cross-section jumps as indirect calls in the BTI
landing pad elision heuristic would not work around the issue here.


