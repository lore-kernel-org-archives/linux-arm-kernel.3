Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F61BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYH+ov8oElEFOmVTlEpbYDnUOqq2mfP+IK48OcxwXYM=; b=Wvp5gcdi5FrRCCShULQB0hLDKG
	ckzLBOnDSpWifIe3P6OkXvbhzPb/ChB4mpmVY6qUyziROjkSw/0SRKvrEi7MTlyNxGaPgVQA+jQRJ
	fL41UHOirrXweAgY34kzWEM8Zrswi0aEA9MfNLDIVZRMTidLQdIhQ5DCcvgSAOgLXYkjX+tuOl06m
	0qQkD6kinVWVdqm7BCogfQOyr7dAnkWKtAD3nu36M7bJY3BxERGcYzOgGBMUZ0R/cdRHCkAni9/X6
	YJT93L1awuCnGWIvqX/1J1KV+q+auZVBTSNp7+sYEdasJezg4v4dzar3aM9ReMm0KpHkus/k95l6y
	ZnA34WVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8t7-0000000DJjf-15ok;
	Fri, 28 Mar 2025 12:32:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8rN-0000000DJcx-2zl5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mYH+ov8oElEFOmVTlEpbYDnUOqq2mfP+IK48OcxwXYM=; b=uHnOCwTnS+OKQVB2CBsia4KuFh
	nl1xy9lyi3uIXfUguYTmVo7aswc1erVQo0sgdRVvXAWq1X99uLyR3z5un82NdIsWEmtWJaIxvFIjf
	Im0VAMkPP/JZQQGtH42yLxaa7IIGr+RCEv9uHGUoUOUGp89XDuhPkZgMoCR1iF/4fBw7RlcvUSlPk
	f99AL2IhHDXjlc8osp1inmHgfZuo8iBNTd7/I4SZ2iJ28vqyR5wx6QXLaxUl/ZYwoS7+FCSlVeBqY
	3P55oWJ5tn1/HQdZuHw/E+14k5Vn+k9pU+pw5ot/QP+c3zPwhUrI2b1Wk5q2yDV9ZF0J/HaCkHDZM
	XrY+8BwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56104)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ty8rI-0008Oo-1e;
	Fri, 28 Mar 2025 12:30:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ty8rG-0007Bk-1F;
	Fri, 28 Mar 2025 12:30:46 +0000
Date: Fri, 28 Mar 2025 12:30:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yeking@red54.com
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Message-ID: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
References: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_053053_749341_BF6EBC55 
X-CRM114-Status: UNSURE (   9.76  )
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

On Fri, Mar 28, 2025 at 10:22:34AM +0000, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> After commit e6384c398459 ("efi/libstub: Parse builtin command line
> after bootloader provided one"), the behavior of EFI has been consistent
> with FDT.
> 
> So add back and fix support for CMDLINE_EXTEND.
> 
> Fixes: cae118b6acc3 ("arm64: Drop support for CMDLINE_EXTEND")
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

This breaks the ability for the user (via the boot loader) to override
built-in arguments.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

