Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7291D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTnDG/mX1Er10V6CjOPlnKa6y0MCt7ZScwEti+D/1c0=; b=VKqb8IGtFskVz2ufVy++0gwFG1
	I4v0uW8sabBrhTuW1/PUIMq3ARPFGSZGsFkRWs3iiPeEXvk8EdlJa8eDgO+y06lKZlU47kefdvwBx
	G9Y9GfFmQoJnKl1RZ5lMgyufD5E3xZ4c34Xt6Isj35o7HYuBBy7qM5N3Sjx+ZsQIG35f1LKexCuhl
	sVL5lRvD+gHWx1P55jxZRk7SOfdMJ+coimSyt0kc7KJD5msklzWB50o2xAKBMM/HWjoLuIF8dVALX
	jYY9/3CJqO8ifpSIqGQmBjEDW6LAsv36cgaLTTF/yqcduRwy9qmajnVDG9+1EIqUaBeJi1N9j3McF
	Z1cB6wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXqC-0000000CuaF-0eis;
	Mon, 08 Dec 2025 09:47:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXq6-0000000CuZs-37Zu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 09:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CTnDG/mX1Er10V6CjOPlnKa6y0MCt7ZScwEti+D/1c0=; b=A44TqR/wIWC7gV9rumF2H3UFcL
	guMr058MNiNX6XSmOeKg1YG7Vnm6d79gnY4RPoXaHrcA6VqHqmoVeIjD9SJeb13IB64mg/UjfoEkK
	ekprfdvN7sLEJtlQ2tI/3FWYJ1IsH4QjVuOQ5H4V4EqfFODGBl9H0iH5Sld6znSmvyUcMSQft9ltt
	t51OTq9hYELJcZMoN2C0ikIsXmWYcqYOKNHrm0qHYkgwmpu1+NaeH3BOXzwec9uAFqgPRek6Wu+p4
	vXzcMGuW2TjGf8hEh+OoH2MRk6T7Ff0Zyr0nwa5/JFd6YOK3BM0kPosV9BK0qTpbElgLzat1SdZup
	ZfVyfQOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSXpu-000000007a3-0w7o;
	Mon, 08 Dec 2025 09:47:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSXps-000000004vE-1OEn;
	Mon, 08 Dec 2025 09:47:16 +0000
Date: Mon, 8 Dec 2025 09:47:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Liyuan Pang <pangliyuan1@huawei.com>
Cc: nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, nico@fluxnic.net, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, xieyuanbin1@huawei.com, wanqian10@huawei.com
Subject: Re: [PATCH] ARM: fix input-only operand modification in
 load_unaligned_zeropad()
Message-ID: <aTaepMnRKqCM1IJe@shell.armlinux.org.uk>
References: <20251127025848.363992-1-pangliyuan1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127025848.363992-1-pangliyuan1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_014731_071854_CD824EEA 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, Nov 27, 2025 at 10:58:48AM +0800, Liyuan Pang wrote:
> In the inline assembly inside load_unaligned_zeropad(), the "addr" is
> constrained as input-only operand. The compiler assumes that on exit
> from the asm statement these operands contain the same values as they
> had before executing the statement, but when kernel page fault happened,
> the assembly fixup code "bic %2 %2, #0x3" modify the value of "addr",
> which may lead to an unexpected behavior.
> 
> Use a temporary variable "tmp" to handle it, instead of modifying the
> input-only operand, just like what arm64's load_unaligned_zeropad()
> does.
> 
> Fixes: b9a50f74905a ("ARM: 7450/1: dcache: select DCACHE_WORD_ACCESS for little-endian ARMv6+ CPUs")
> 
> Co-developed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> Signed-off-by: Liyuan Pang <pangliyuan1@huawei.com>

Sorry, I missed this email in the deluge. This looks entirely correct.
Please submit this to the patch system. Details in the signature below.
Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

