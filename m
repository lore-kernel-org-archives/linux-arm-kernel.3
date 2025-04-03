Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CBCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F2bCXeXDz6BOafK945XVXmcdUbcfN5eB/naeSB4qJU=; b=uYuYXRNoSW26x8DPzXoWbSTGdi
	ws+3UZItjFBVH8lAGZuwW6MY/EiDS0RN/d2bFgVBXTyQcuMjHw6y9TsWzpjogpnPZilq8Npuf90cP
	jqcW/sq0cXYvGItmUmZ9GlWzbVcLa7idTRYEdOb4EdHOwubirp69GmMdb9ydAYKqnIawq3pA7r0Ec
	30ZIDOdF4soWhgwziF+nmz9j6GbGpVzG9m2VKcaJ9DnTe/Qj9XP3ZJCboNUYTcE80JjLt9i4FSTe5
	IGCEE5gw1EVGeJ9fa0anmAbF8E0xQ+MYf+aIkxS+iAX6kXQcth0XfOLDuns35Q3oBfcmcBgbRCZxu
	X+gs27YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MSy-00000009EBn-2C7s;
	Thu, 03 Apr 2025 15:26:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MPM-00000009DVM-0jWd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9AA95A43E67;
	Thu,  3 Apr 2025 15:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D02C4CEE3;
	Thu,  3 Apr 2025 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743693787;
	bh=3VTqbVG/HazYgLFpakJ2Bconzo3PtWaoRmUqQrVjbaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zAFZzW9YqbTGjwn84pawRCoQlIptoruP2FO9x7rEfFBzbvWkRb7o4uAjR+TW3JyW7
	 WJ4dn8e0ZxAv7FTCq3I10lIZvRaawj2eJBqLkZ2uFYyoxq6iqVCdfr/u7iFj0ZD9Xp
	 KdiuOhITXZGeZzmp7gBkEbgimbZNzO+ZNR3DXWOc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Wang Kefeng <wangkefeng.wang@huawei.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 6.1 05/22] ARM: 9351/1: fault: Add "cut here" line for prefetch aborts
Date: Thu,  3 Apr 2025 16:20:00 +0100
Message-ID: <20250403151621.099836965@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403151620.960551909@linuxfoundation.org>
References: <20250403151620.960551909@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_082308_325554_3FBF0C3C 
X-CRM114-Status: GOOD (  10.03  )
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Kees Cook <keescook@chromium.org>

commit 8f09b8b4fa58e99cbfd9a650b31d65cdbd8e4276 upstream.

The common pattern in arm is to emit a "8<--- cut here ---" line for
faults, but it was missing for do_PrefetchAbort(). Add it.

Cc: Wang Kefeng <wangkefeng.wang@huawei.com>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mm/fault.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -559,6 +559,7 @@ do_PrefetchAbort(unsigned long addr, uns
 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
 		return;
 
+	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unhandled prefetch abort: %s (0x%03x) at 0x%08lx\n",
 		inf->name, ifsr, addr);
 



