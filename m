Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C758C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 02:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwj029qvfIuS0n2IlGGdFsymc671fa/erueghYr3m0A=; b=nq4C6QtEYlDN00VVBOvlrMlGlk
	WMeV6lYLcRo43+Gg5V6KVkBQr9CEyYhm8oC2KYpfsQVE1r0j381ESj0QFcfacEeMiaa1O8Dwm8nIp
	TvV3VSFTzmBfjoLbvD6nDQV8gIYrmqv/RFflKX9/SIW3xP4bynfRRFlqsNa9Iqd1MvD/zrZ/DKqXE
	Dx4yM9/v7QdXnbR0royovrw3wbBD9Epopiyl01uCedhOHIwVVUbub3b+seA3LN+AhehiK9tUv7MM7
	VA5GfNXsVuPm9+nZNJMZ3rRfJiqrGT7l7eN0x+IsvaxAjyf2vcmNl4ltun6j+DOnwCwjyAcI7KxrS
	Vz8ohr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEv5-0000000CS7G-3y3G;
	Fri, 21 Aug 2026 02:23:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEv4-0000000CS76-2SSD;
	Fri, 21 Aug 2026 02:23:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E251A40179;
	Fri, 21 Aug 2026 02:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7941F000E9;
	Fri, 21 Aug 2026 02:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787279025;
	bh=nwj029qvfIuS0n2IlGGdFsymc671fa/erueghYr3m0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FKOdp80K1NCdExfZ1tcV6jarRclI8uxefHf43o0VfsGMY7h6gHGbb2Rx1STpUXm3W
	 ZqllCnvzbL/8/x8dercSC6kVEvqT2XPEZGyYrbE/rwLPpSiTtbtKl/4vEvNiotiM+H
	 /ppk8euQ1OD384/8sy5svQj87ViMgNLjapwxeRn6TmnDbBv5i/zXQQ8t/325nQ2NjH
	 AqolJF6RXXh+L7bpAQA8mNzojnq//qqj9QpSOI+LWw5dQiVChms/JXaexpX7c34u1l
	 e++Owow0HeRcTCq1jG3DhsIBIx9wYnOEK/idwAIO06GpBh+b3diywe7T4A4oLu4hfJ
	 p6mVte1Qi/1sw==
Date: Thu, 20 Aug 2026 20:23:44 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
    linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
In-Reply-To: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
Message-ID: <236a0edb-76f4-a28c-175b-f43994310a9f@kernel.org>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-746012605-1787278993=:86110"
Content-ID: <1dd06b80-a066-feec-b1fa-addb8fb6fff9@kernel.org>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-746012605-1787278993=:86110
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <c4da6fb9-7dfb-d0d8-ef0a-6c21140cde31@kernel.org>

On Mon, 2 Mar 2026, Thomas Weiﬂschuh wrote:

> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
> 
> Move the symbol to a kernel-internal header.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul
--8323329-746012605-1787278993=:86110--

