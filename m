Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7372CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY/FqE4KfpeLdqxO5SEnfQ2rmTvCTJVxh/VnIGWxr/Q=; b=DDRf7gmmkW9fuoIyy5i+z5jDbo
	QpjJ6SgvP7qlJ9iYIdgL1Lk6RsrvKuzJIuiB0vneKnHs+yNaTF9H4G+1u1K+C6/2qlVOK5wlQdf1E
	/G65+CjxAFyF2q3/MG4dQFaZqQwbo5EtNAo5Xtw6JrNxorCqoXVniPiyk+AC9XPTQk7F73eAGs1cN
	izycLVIoMjQlz9E7ehWdo5MpF5ofTIgsNFk/CHPooYosTtkSo0skRIJL6qTbgshi+7YOcBjnln3JB
	LeqbsMuqvI3jZuJYD1rURQp3FGPZC2xSdyHXRFazTTBtNQLXwlHcmmlVqS//oixpOflXSLApSEOUX
	7534NerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFqK-00000009CqH-2dGq;
	Mon, 13 Jul 2026 12:33:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFqJ-00000009Cpq-0lVR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:33:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id BE79A4365C;
	Mon, 13 Jul 2026 12:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 26FBA1F000E9;
	Mon, 13 Jul 2026 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945982;
	bh=JY/FqE4KfpeLdqxO5SEnfQ2rmTvCTJVxh/VnIGWxr/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ahCNqYYDQj184C28Zp/IyYSl35JjGtJE8jU2IaoFnHs9upAuK3YcRubnOtbKW9gb9
	 FIJatEDK0N6SjwcalzktMcqj0N1xURA+/Gi323fO892q/2zJ1ouBQZtUJWft2V4mO2
	 0ayQxdCCNJMbI8n0ahV+NxjDu9KwNgrlpaR1kC3nSEnTqZfm2hBaYlI7X1kAKF5zDc
	 0rJ07YBhMkw7hUXLejdregDztba4ntRyzAu4GhXUQlYK7RTMwZMPIy6ZISmYSfmuG4
	 j41LN/Ow+S22jIareAY33T/FCRg9oMYBQTRMEUIGHwk9+gszJuKXShqoKZE5uAr/eK
	 Av2DMz410n5Hw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use --force-group-allocation when linking modules
Date: Mon, 13 Jul 2026 14:32:48 +0200
Message-ID: <178394595379.708416.8197126658182660959.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612133139.1919042-1-petr.pavlu@suse.com>
References: <20260612133139.1919042-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 12 Jun 2026 15:31:37 +0200, Petr Pavlu wrote:
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

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: Use --force-group-allocation when linking modules
      https://git.kernel.org/kbuild/c/54747629

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


