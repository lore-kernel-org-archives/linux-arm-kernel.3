Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4031C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ho3i2ZEne3XWeE0sZzsIJ9CaxZDAGSyO5hDwEJ0am2M=; b=hTD+QTI/yf3kLm9viahOQfR+TQ
	SiP6qCboOLHDWi8tH2GAj5YL4YQiMjzENJZu5b5fCgGRgVbKLiXOz5poO1K5pattp6HBcS+poW4EL
	sno/UN7rJsVmFCjJOFOl1EjNYGZcnlg6f1llXb5r+kDsJ9pmgMqOgD+8tAzeTRnzbKRIjfUC1kshR
	2t69v0MuNzGNiBlBc5s8CyZjSrrACvHuAq3VKH9YrQ9Cn6XGtX6F5NnLCAx29AeHFCnz+ccJllMI8
	+P5kIr8NP6AnF4Tnt1l3yFbwNUWxlIbX0QE75Sf3zAoPE3WWgkvFOw4iUbUYmt+OR7CIfn8Ayu2qm
	2QnEZRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DuS-0000000HBxM-2lMi;
	Sun, 20 Sep 2026 09:32:32 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DuP-0000000HBwe-15hI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:32:30 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id E02521D000B8;
	Sun, 20 Sep 2026 05:32:26 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 20 Sep 2026 05:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789896746;
	 x=1789983146; bh=Ho3i2ZEne3XWeE0sZzsIJ9CaxZDAGSyO5hDwEJ0am2M=; b=
	W0D53KwZ9zARRHvFEMKWf1d7HAYdfdoHw3qpZvwsYsSaMmF1lzmFwD1WCt7e68EB
	kXBp0SDj3qMwKFCf0dWDijJTLrlTgcbx8lljQsQDOajBiuKJJ7671cNKQYvJMG6a
	c8Moy2BFFAi9/m2E8BA0l4Uc2UPQzBDDxGIgp/6r2HtoyE5Kek7rTNBztI2hPm7m
	og03655buJg9GlFuip5HopC87SSZBZlhxAmRoerGDCP2OaSMht4P/vQgMrnV/VIm
	V4AxZ0AOenduZ0KPfc3EI3nbV/0EFM+SgAnL9H8IOufLgDZwa2nN0CHg8CvR1VbK
	KZtzA65yXtNQyjnWJkUlhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789896746; x=
	1789983146; bh=Ho3i2ZEne3XWeE0sZzsIJ9CaxZDAGSyO5hDwEJ0am2M=; b=r
	YxQRbi139+6siV9qRXDW3NMfleFDAnAYgDDi+SB0GKrzjKxsXv/39WEooXpyjY8r
	kybEHRrGGf7WWo9EmkcuWDzLzfRaAvXcEey/Pzz02xd/d9JTOFEBOhYDZppH92+T
	xLZG5i2p6hcx3BBhABk7P68AWoYag62ub9kamymzyMPNVIP49Z6DJGr22oQM4EhP
	U1dcJD5WvtBtNQgSt7lt7sZOQq8vLRcE6CW0qPA/fioWWJ+MLFo3fn3HCKn2zpRi
	jK0zztNP3M/O/B6LPofRTKP8zHiBsMbHql4i6XqyZsyKyKV/CMqedZLDde6yW0cZ
	On2ygYt8pL/5Nu4VVR5yA==
X-ME-Sender: <xms:JqivaiMSjhSG2el-vlZXeFvCN_Dc9vs7XlsbVy4M8Uk3imScOlSlew>
    <xme:Jqivarz-m1KGJ0vH7-jeXAEMFTGXPuqNDwVlAP4qwidxo7Rctz8bIPKs-QS3D5eUK
    -hOYrQR_f7SOUORHgtFw-1GbQHq_z_tN_X9hTn3QnzlYV_lGUgQbLBS>
X-ME-Proxy-Cause: dmFkZTFDpxq9iaqfbx8D3WimXx4MB7M1g9g4zfB2+5uGFNXZ3AFJ8stXvDfhV1FH+PHZ+E
    70MyuhtqrHrHhZ3QZM/LzCLzeROFzqwf+/QChzQjs4tJUzIAY7adhEro5EkjLolniLj9el
    EgHzDiwDWXuinVt+ilVgF167crSLL+PIRk1w3kwf2DAK6fJ+AeYiPJ4+lbl0TscyMR6J1r
    HYFCjyAQVFqegv1FmiR1/kZKl5fcUBvQDMen2ikVSHQnGQYyL0FUrcl58fBPregIZTDDSz
    6n1x+XBtiCrXxHF17+cxZWTsdcC3hqfBaOX5h7fIVng7n0vQAF4ruBnI3WnBx16KjNyKCp
    uWLIGGhB++czTT+BauSjxGDI5JoZ4dBka5ywsbs4hlapg4mOuGvmmG/WzFKcJvwnYmg88s
    zIZE3UXrp1/JcAGga2ZTyeJNT7QSubCaWnwRlFVjDTpx4x0df+ScJNEsmZLf2yyuR6ZCRT
    pMMhslJucNB7mwQyMECZfsOOqdPylJUh1iGYRG8gHPjkYrW4TIwToVcfl/jbyA2k1Y/wbi
    78/pLUCFem/mLRrZXqXblvSkqmf/Nk3utSQ+qeZTACOojmuk+OhZLtuHODejlbNObtth1t
    aLTlGZ5xLE81DJRhA7is5aK2GZpt3qavUTSpy77q3t9rg31Te+6VFf4C4T8A
X-ME-Proxy: <xmx:J6ivasVL0T3M6Z19788okk3oMUUZNCnjPJ7YYDZ1C3XJwdM0cK3S4A>
    <xmx:J6ivasar_cjXg88wp5zzLPyPC1TcaKO4ujUMg_nTby_EjB51mukc4g>
    <xmx:J6ivarxAL1M65LVDpToqTBu1wpl6s64Kw8xaZvX2zxreR7cNVCFB_g>
    <xmx:J6ivak21RceGHH2d2CSFtOz6YVKYQyKnz0eOPc7ZTAkPz4_8Lt5Tsw>
    <xmx:Kqivai_TDlhLY7OXRBHdss6zS0AfoxD_i2sc33ugElktGooAmJ9HGHnT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EC6D732A0087; Sun, 20 Sep 2026 05:32:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AzgOxjlYMeWB
Date: Sun, 20 Sep 2026 11:30:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <qingfang.deng@linux.dev>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Vikram Sethi" <vsethi@nvidia.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Shanker Donthineni" <sdonthineni@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <3250a625-7900-40a9-8f3c-612d333122dc@app.fastmail.com>
In-Reply-To: <9895e60c-6a3c-40c8-b188-51891ee6b216@linux.dev>
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
 <20260920014357.7069-3-qingfang.deng@linux.dev>
 <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
 <9895e60c-6a3c-40c8-b188-51891ee6b216@linux.dev>
Subject: Re: [PATCH v2 3/3] arm64: use generic MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_023229_752423_71DCDF74 
X-CRM114-Status: GOOD (  10.39  )
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

On Sun, Sep 20, 2026, at 11:24, Qingfang Deng wrote:
>
> Regarding unaligned accesses, the splitting can only happen when the 
> address is known to be unaligned at compile-time. Do these accessors 
> need to support unaligned MMIO? If so, I could add 
> OPTIMIZER_HIDE_VAR(addr) to the generic accessors.

I think all architectures that have had this problem just started
using the inline asm variant, and I'd probably try to encourage
that more.

What might be helpful here would be to split out the __raw_* helpers
into a separate header that is explicitly included on architectures
without their own definitions, and an updated comment that explains
that architectures are encouraged to implement these as inline asm
instead of using the volatile load/store.

     Arnd

