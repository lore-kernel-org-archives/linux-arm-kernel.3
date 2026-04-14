Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3583F531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3S9jBB7rFaohFOnGlp4KwVhYdhC0mAEOE/r6Elp0J8=; b=t+Eg6eci/ASSovNrzlPbaIVRa+
	pL5SXayY6wqUh2t1B+7mqp7C+eiHMwJ9QaVz8mDOXZYEPTAEudMbTcNlGRTYmxa2ZMQG0mMrRvp4v
	QX4sLbKJiX2jDPrvM80QrfsTG0gAhMCZpsgYT1fFTJ4Q/drURrhaJQvd/T8pueYaH6GrI0z5CzI3t
	7/nlkjNU1Ts3l41mL+vZq3cDRpNlTAXuKtDyZFmCPOwTMLyzFJLdrX/TFIGQ4YNu/5BwSdV9DtXuI
	JspqwVs+SceYKnIFmfFpO3uoU9JFUAEj+89jVAfTsjnFUxvehUoeM3hEEJe23E4BEw/kxRKey2lga
	nmIxLZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbdT-0000000HD4X-22R7;
	Tue, 14 Apr 2026 11:08:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbdQ-0000000HD4C-1di7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 795C44415F;
	Tue, 14 Apr 2026 11:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCC6C19425;
	Tue, 14 Apr 2026 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776164926;
	bh=sNu71ZUb1rt4ab2E8eZagKk8jYhy4eDjDlSs+G1tla4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLgGDLRcloWUP15mYzJp7RDXnNZmpO/6pWOEi45FADVz3SD32RzX9h4NfzJY5Kqwl
	 7K/1YTy21PD2fzwt7TO10R4VdrpI3vol53VyB2M+Z9tDEzzhVjVgGnTJIfI664EFWv
	 CRWcfyOx5DvTUCNi9MPDcCBT6rdurpP+9uro+a5aSUb1xztssrUFZ0Zb7MqOk4EJT8
	 9qXUQVmr7vcFrP88fkXuh7uHBWURQHUDaTtAp+Vue0AGSNrkGjj2kDmwkEwEW6f4HP
	 GzbQyGmYowRVYmnb3TD5xP4rVOPtNVVP/wfrWFNQq6efLbCgl1c1zRvVsUdFt1BJpS
	 LNzZR9cJgjEqw==
Date: Tue, 14 Apr 2026 12:08:42 +0100
From: Will Deacon <will@kernel.org>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ad4gOu83zY-SKijx@willie-the-truck>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
 <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
 <ad3wRQt7K-QLX8Jw@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3wRQt7K-QLX8Jw@zoo11.fihel.lab.ge-healthcare.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040848_449234_CC59D29D 
X-CRM114-Status: GOOD (  11.59  )
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

On Tue, Apr 14, 2026 at 10:44:05AM +0300, Brian Ruley wrote:
> On Apr 13, Brian Ruley wrote:
> > 
> > In the meanwhile, I'll see if I can add some instrumentation to
> > verify this is the bug we're seeing.
> 
> The instrumentation worked (used the same ring buffer approach to track
> dcache flushes). Here's the output:
> 
> ```
> kernel: [48629.557043] SIGILL at b6b80ac0 cpu 1 pid 32663 linux_pte=8eff659f hw_pte=8eff6e7e young=1 exec=1
> kernel: [48629.557157] dcache flush START   cpu0 pfn=8eff6 ts=48629557020154
> kernel: [48629.557207] dcache flush FINISH  cpu0 pfn=8eff6 ts=48629557036154
> kernel: [48629.557230] dcache flush SKIPPED cpu1 pfn=8eff6 ts=48629557020154
> audisp-syslog: type=ANOM_ABEND msg=audit(1776154637.460:15): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=32663 comm="journalctl" exe="/usr/bin/journalctl" sig=4 res=1 AUID="unset" UID="root" GID="root"
> ```

Red-handed!

Please send a patch for review (perhaps you can include that snippet in
the commit message).

Cheers,

Will

