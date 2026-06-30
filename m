Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D81DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P7LDjhqWjIbgOLzCEZQr2Bj9BM7s9iDecmTLikIjF4=; b=eZSxmJDAqvBxZklzH+Vc2izC5y
	KmlzQx2oYsiRZnnmiDBsO6tfkWusMsKUlh1sepxG4ggxgPa8YnvXCyrd5mN06042/jUpDvXmkXQxu
	solLEdxfN6weKlyEYIAViUmWoSHlLf5oXdxN827p58AOFeWAs3v+UnBVKSObzCUojmjYu3vOJo7/v
	l5NgMF4vALWWxpFVDSpRWu1p03LU5LX+2j2GbwBQxWO1jzygmC/+YZU4TkAbUfcfFm2fPo693+8rb
	hiZdny5/OxzzK1IpH3HOTeJJuznjzXl522zGcShoVEf1Pu64fqlvgjijZPXtmMsShisztt4TMs3p7
	6jhNJZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNgS-0000000FgPq-25N6;
	Tue, 30 Jun 2026 01:54:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNgQ-0000000FgPc-2sKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F2C641A6E;
	Tue, 30 Jun 2026 01:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DE21F000E9;
	Tue, 30 Jun 2026 01:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782784482;
	bh=0P7LDjhqWjIbgOLzCEZQr2Bj9BM7s9iDecmTLikIjF4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PelMRxBinaeKwK2rdKTqnmS20mRH6eqBM84foSu3gkZ5/33w4IDI77u8i+7+g3V/D
	 jm28xXjv/RwJgy2+J25YisEBnr9QGfJ/a7wJ7EaKPKjiyp35m2HV54h7vVsjdOzlZq
	 yiE860Z3u5KyJN8cx4UXlU4WaqV6xzB52Wn7O88/qFqbcnzfZ2jktt0XX7Fo3G696t
	 UhF1QWrEspNJCjTV4Eftpo/YESYuDEwPLE92HiRv6aXiJ8MenLJJhkwnccFcNWm3ab
	 ++jgrG/kXVN9Jl9uWaSyr0BQ1jbJ2cOSa7paGKvoE4M3bQYX1EWZ9ICezEiBV9786T
	 KiVOzfG129X/A==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: Use --force-group-allocation when linking
 modules
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Collingbourne <pcc@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
 linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612133139.1919042-1-petr.pavlu@suse.com>
References: <20260612133139.1919042-1-petr.pavlu@suse.com>
Date: Mon, 29 Jun 2026 18:54:32 -0700
Message-Id: <178278447248.3414597.4179963162938722029.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bn1LHd3OHhBk6/yvIpNvhrFt/UF7RlbjeVCHu7MJ0Fs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnOivc2SgQrKE9U764zNLx9iHdi0uHFbodu3+P5vclsn
 2DkfWGXjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRUwGMDAtNCifmRh+b9ThJ
 sFvJ6/Kq2kXCd7cyJu1i3bpisvicaUkMfzje8c8PzvBZ/XhfydatPlqrNwZ8FGVJnxumt77vZ/P
 JPD4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

On Fri, 12 Jun 2026 15:31:37 +0200, Petr Pavlu <petr.pavlu@suse.com> wrote:
> Specific code, such as outlined KASAN checks, may be placed in
> COMDAT-deduplicated sections. When linking modules as relocatable files,
> the linker by default preserves such groups, potentially leaving multiple
> copies in the resulting modules and unnecessary group metadata.
> 
> Use --force-group-allocation to have the linker resolve the COMDAT groups
> and place their members as regular sections. The option is available from
> ld.bfd 2.29 and ld.lld 19.1.0.
> 
> [...]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


