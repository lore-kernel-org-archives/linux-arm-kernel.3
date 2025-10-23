Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA56DCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFJOfVdkWJHRulD8HfD61vkF8//SbVsJWE5Pa+v76dg=; b=lKIt9NMFqLHPwf0cS2iigFzR7X
	GDiMTgWlK+JZHweM9a8HoETaaor9nOSkAz1Jmj+ROFYsDqXIS7Vqg/7DWHTu6NT3HZUA49g7lL63y
	w9Mr89X9Ic6EewrH9ga7N2abmvtbTIeXItIqNZmlVoFjVwn448dJpgSV5ikSAAUmmw6gzUE+5hWVE
	a2oZ3j1fLqH3Q+5EQ5h3rYNWRHBWcFG51YJ4MqWgQnShYDErFm1Z0O58h1CnvVTaO/NBFJqOf3kk/
	xCgIQFm/DUqIQChf/TdSsI3SSbrcjnEFrAzMLiQWpb2MyTFrMwEFZ7tfgMs5nxaY8LVR33DG5Bj/d
	O29vs4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxiO-00000006pP7-02ko;
	Thu, 23 Oct 2025 15:59:00 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxiL-00000006pOh-0vM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:58:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4csrLP0GnTz9smP;
	Thu, 23 Oct 2025 17:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761235133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DFJOfVdkWJHRulD8HfD61vkF8//SbVsJWE5Pa+v76dg=;
	b=W5GrnDcbXg1dREAbAcjJ1Wt7/WmhgXyx+Hj+HHYDdcOpfiiiJhLIVMbe/C/sOR0XOHrqLl
	0Z7TJG/FLOmH7PiW8JAY/9aqiuoAoXASwb2B/dMdU2V24HNZdUz37K5u3IhMegIpkZdIKB
	YodUfnbAmanb0GDHUwMD+wmyJGQC3duu8ZQkLmgA6esRvo33HcgTIzXipi2aJDzXE1RDBP
	LOKQ/bCaBy8GBEWdfvq2XVY/YHmiDXYwvGxx4Sw4naKwybeazhiFh6DO5i4oNPM4cH86si
	xObNgqj9JWbvHUCYskpUz3YhafKn/90VTJyjEaS9PdMbjstDPOuOmTY5U3WuIQ==
Message-ID: <adefdb3e-7a10-42a2-b2fc-8c1490762454@mailbox.org>
Date: Thu, 23 Oct 2025 17:58:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
 <24c8da41-37db-4e69-b9aa-e33b2154acb0@mailbox.org>
 <87y0p13dlh.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87y0p13dlh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: c7wrdi8qspfi44q66t5f7171c9wa659k
X-MBO-RS-ID: e2587fe32a5827e83b1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_085857_656252_005E0DD1 
X-CRM114-Status: GOOD (  21.90  )
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

On 10/23/25 4:19 PM, Marc Zyngier wrote:

Hello Marc,

>> Except right now, I still trigger the AMU faults even with
>> ARM64_HAS_AMU_EXTN=n , which I think should not happen ?
> 
> ARM64_HAS_AMU_EXTN is a *capability*, not a configuration.
> CONFIG_ARM64_AMU_EXTN is the configuration. I have the feeling you're
> mixing the two.
> 
> Irrespective of the configuration, we access the AMU registers
> depending on the what is advertised, because we *must* make these
> registers inaccessible from EL0, no matter what.

Ahhh, I was missing this part, thank you for clarifying.

>> I would much rather be able to disable ARM64_HAS_AMU_EXTN in kernel
>> config for the old devices with old firmware, without triggering the
>> faults ... and say that everything which is going to be upstream will
>> always use new firmware that has proper working AMU support.
> 
> No, that's the wrong approach. If you leave the AMU accessible to EL0,
> you're leaking data to userspace, and that's pretty wrong, no matter
> how you look at it.
> 
> I also think your hack works by pure luck, because at the point where
> your CPUs are booting, the alternatives are yet not in place (the
> kernel patching happens much later). In short, this breaks
> *everything*.
> 
> As I indicated before, you have two options:
> 
> - either you update your firmware and leave the kernel alone
> 
> - or you implement the workaround as ID register override so that you
>    *must* pass something on the kernel command line to boot, and by
>    then accept that you will leak critical timing information to
>    userspace.
> 
> Any other option, including guarding the macro with a config option is
> *not* acceptable.

Since I am getting an exception when I access the AMU register, would it 
be possible to trap that exception, and report something to the user 
instead of outright crashing with no output ?

Similar to what Linux already does on the various speculative execution 
bugs on x86, something like this?

"
MDS CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for 
more details.
"

-- 
Best regards,
Marek Vasut

