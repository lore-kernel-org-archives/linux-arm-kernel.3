Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyU0WWPEOvKR3G40BO2Fu6EDGNO7kZsKotfUj7HedY4=; b=hpipBdBBRxlI/tXAStFypmuorQ
	Ed2k1k0tSTpLvp55dNWJlWq7yX9exNWaBcrwx5DyKIQSpXHMtbfT4acmYOeDzoAqISr8mgJBuc1A6
	RMRrx/3gi2IiZm14Zs0cZnKhdNAJC1UJ4OBaOivpis/ybYvEXvtf22y2i70ibioHbSM21xON4Wii1
	B8e6wxYa+OzvtyeSkI3VIBSv1TiiK+WmFlj/2341swCDACQHjT5ftGZXJKZQtsDtb2pjIbYpKWJRA
	hbaXtXEBJC/TxPWPzoqo3cd6rXHNYoYOUaJ5TR6xDFRA5zY/lPK+EkwcYirMHRgtsLlGJIsc7fnGe
	cpyyp0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCLG-00000007QmK-2WDg;
	Wed, 12 Feb 2025 12:59:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCJp-00000007QUH-0Rhg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 12:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99EFAA40092;
	Wed, 12 Feb 2025 12:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC30EC4CEDF;
	Wed, 12 Feb 2025 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739365099;
	bh=+rUyy8CCsAX49LoyMo4QlyZTIfngKhPrGjoTwwC4T/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYoHh9I8hOFC/rd6q6DuWBa0ELk6Z7OMZH+d1Po86Hca4RmKPfp6Iy748FXUdyIlI
	 tgH/3yl0mOAPAoIko670EqeX9y9i+3JZ/uI7ZsPHzcVNNFWCQ27UkVj53+bdt/O6h1
	 tp2zNyvG6uiP3W6uc1ax8M6WidyQaPTSueZo4zk6WWNhXIYT0nyl+heT4KgnulLxOT
	 VgWKUUVaGzBd9JgaNBnvjddPhhnrvtOVueKPNh9Ht9jYirxxZuEV9VqTmcHVbKcyW5
	 ewHSt4dDIHHeiLGHQBiKMVEehzQ+s32Auf+U/HtB+/DzK1kpDbUrePlehroB/oTObM
	 X96pQV4d2Rp4A==
Date: Wed, 12 Feb 2025 13:58:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Andreas Noever <andreas.noever@gmail.com>, Avadhut
 Naik <avadhut.naik@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Eric Dumazet <edumazet@google.com>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Sean
 Young <sean@mess.org>, Yanteng Si <si.yanteng@linux.dev>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, James Morse <james.morse@arm.com>,
 "Nysal Jan K.A" <nysal@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
Message-ID: <20250212135808.58d2f032@foz.lan>
In-Reply-To: <Z6yFG_NntQfkwYli@archie.me>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
	<Z6yFG_NntQfkwYli@archie.me>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_045821_274373_3C0244CC 
X-CRM114-Status: GOOD (  12.69  )
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

Em Wed, 12 Feb 2025 18:25:15 +0700
Bagas Sanjaya <bagasdotme@gmail.com> escreveu:

> On Tue, Feb 11, 2025 at 07:22:54AM +0100, Mauro Carvalho Chehab wrote:
> > Now that ABI creates a python dictionary, use automarkup to create cross
> > references for ABI symbols as well.   
> 
> I get three new warnings:
> 
> WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cpu:27; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices-system-cpu:70
> WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cpu:89; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices-system-cpu:70

Those two are new reports that get_abi.py detects after the recent changes.
In the past, symbol duplication were detected only within the same group
(testing, stable, ...). The new version can detect symbols that are
duplicated on different parts of the ABI. In this specific case, the same
symbols exist on both stable and testing.

There is a fix for them already at:

https://lore.kernel.org/linux-doc/673e9543783349b0fcf625018e38e4e93fe98f52.1738020236.git.mchehab+huawei@kernel.org/

> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

I need to double-check verify this one, as it didn't appear on
my tests. Are you getting it against docs-next or linux-next?

Thanks,
Mauro

