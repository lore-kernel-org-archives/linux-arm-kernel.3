Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C38CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y4m2W3vRcXKEArbYqkHQd441LGB27Du4H5ZrkX5CSU=; b=WKw9oOuF9CL/RODhSR93nELJ7x
	5MKBA4e9Fzn4+jnCSJCDfRxcHA7/AGoftvyVr736szEv5ZkMlH5cza+0Vd+OU1uA61on/rgfqhleu
	8HljEvjcb5W9aZ/z71eZR+hdP7bkmtlGpxj7P9AA7UsgWHvjvEQUgDLhL/53QRcufuqKuHi+29ExU
	OjnzZdbfwgZgsjNpIfC2RjMu6bl5CkSCAs5/KrrEU/GzIRRzSNDoWgzLWWdVkPxR9OnRtpJALvHp3
	KRW9DAiM7vAB0M6XdVzS1FMes27VeREld7hsF9fmR45GiOfbMN4K+y98RxjRQk/0Rs8/auWdeoVyc
	KIEjBL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBPn-0000000C1Hz-2kMn;
	Mon, 01 Jun 2026 22:47:23 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBPk-0000000C1GJ-3Mwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:47:23 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 85AAB40E00BA;
	Mon,  1 Jun 2026 22:47:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WKoz_Vm_KwY2; Mon,  1 Jun 2026 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780354017; bh=9Y4m2W3vRcXKEArbYqkHQd441LGB27Du4H5ZrkX5CSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKToZ5+3gGYJPCMAps1wKEkuLcXumWvlhTdWMIlfG1ADqMef5UBqaGfQKKl3yKTh+
	 cEs3M+PIleKF8G36t5n69E4IaZ7XYcWqKC0mvOg6/x4tPQxhpYS75qqUmbLQMOSTe1
	 GqIgRonTFa/IZCYOV9zeKeHOcgXzv20upCjkkg4ZhHpAFd6lwiYlA6jIy7CwXGCZ6f
	 HWnl7JIcFQJ2NjeUOmXiILSe4OqZWiSTr3Ko8uEYSuNLPhIlQzh3ofhOqmoBP3Udq0
	 f1a0dt/fwKsIxaDBePUlTdh+yhwPSi4mbJ05BDApKZrvYlE3A+tARDICCoaXKyzVQS
	 VzXOmpt2ZR92kE03CxEk8A05gOqzCXL8tmYH0CJE+9WC0dWQSGt2EPhS9p1HasKlBs
	 eGTUYOuzNNofWGsqWewDE76CHwDIaQhXRJxKLIK7P96u1Vph3b1KR5wemcNkCGCJ87
	 re8s6+lRlu/FCeaVw/cdv90bjywZEaCyvF7K83wNaWya1biZPyzeMeLTQeGGZB0gzM
	 qDC6U+0FPIcXBO/ja3BK1n+mdPkedublg9EhRzoczftYcjopk4nWsoePN05bccbZQX
	 m44F7z+Pvulj/uYm7Yy2fuYxrwECgnmoY1XKUfRuoCn5osJUTZ/rq/6GuOjtmtuSme
	 Kr2SlJ34d6K0v0p1gFb2FGio=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 86AF340E0032;
	Mon,  1 Jun 2026 22:46:24 +0000 (UTC)
Date: Mon, 1 Jun 2026 15:46:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com,
	saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net,
	djbw@kernel.org, tony.luck@intel.com, guohanjun@huawei.com,
	lenb@kernel.org, skhan@linuxfoundation.org,
	vishal.l.verma@intel.com, rafael@kernel.org, corbet@lwn.net,
	ira.weiny@intel.com, dave.jiang@intel.com, krzk+dt@kernel.org,
	robh@kernel.org, catalin.marinas@arm.com,
	alison.schofield@intel.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 01/10] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260601224608.GCah4LsNGp3aLjy-xE@fat_crate.local>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
 <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154720_993542_06D652AD 
X-CRM114-Status: UNSURE (   7.04  )
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

On Fri, May 29, 2026 at 10:50:41AM +0100, Ahmed Tiba wrote:
> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.

What Sashiko said.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

