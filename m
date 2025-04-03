Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B2C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp6DVD8zjT+4IzKmZQtEVRKMXag2a7stEOMh85ArXsI=; b=Hk4jQK/KksyuhQqRzDAMfebDIu
	/Vgwg0aA9jYsCKP4VQZez0MlWKuntD/BrKr5qkIcBCQ8cE0dzaG+jhCA9RpP/azDswCQjDr5UYtI7
	ndav9B31mKWim78QhZz/czMtILGLcCTluzag5qF+rMnlhrYffaQ4Q86ae0DBGooP6zc1D6g9rkBE7
	eHALTaMoinVg535mPp2nAz7Is/FDAlAKfIs1AwjOOflKcHKYlQsuFLXvDGtGHYHRIO283tA7GsXcA
	ssa/LgZwVZAO5cUPew9HXVqb86Amda2b1UmfMQ9S4ts0PA1cWiXUi2EOQFDk5bv5cZ+K1HuQYaK66
	p404XOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OGR-00000009RaI-41dM;
	Thu, 03 Apr 2025 17:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OEf-00000009RKr-1zJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B0E68438;
	Thu,  3 Apr 2025 17:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECA6C4CEE3;
	Thu,  3 Apr 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743700812;
	bh=sFuYz6JPzsyLyw23Bxb4nuISYFMQwzsbDTizTe+xTfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UCdr+qHrUzxqGXD00oLkRgLfGfi6fPu309b8L/8qRnEdTB00l9SA1GeRAx7OHPcY/
	 /Ug9G7RoIVBBZAgkWBt2Uu915t4MF9yDLzK7AxkYTeCfa3jUPE34OOEbXhza1NyGON
	 ktFLz9RJuC370d/OG5Lsv9yKmgrIPW5KEVhTFakHNRkne9ilukh3IQ7gD6Bu/iw4Sm
	 /EgNuvyBAUYmQYRADU9DS/H8XRFg/2YlMw1XeobLWHby5ie8zPDnTdwzp8HBz0bgEY
	 K1DANIO1VZfN4L0kPmCDuupJJhry19CslLl1lubkAH+Yf2DtIyc0TVqcmU/2pkbGzK
	 4A+6r2cR+RQSA==
From: Kees Cook <kees@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <pcc@google.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
Date: Thu,  3 Apr 2025 10:20:07 -0700
Message-Id: <174370080532.3186212.8943506811501747476.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403000703.2584581-1-pcc@google.com>
References: <20250403000703.2584581-1-pcc@google.com>
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

On Wed, 02 Apr 2025 17:06:58 -0700, Peter Collingbourne wrote:
> This series fixes an issue where strscpy() would sometimes trigger
> a false positive KASAN report with MTE.
> 
> v5:
> - add test for unreadable first byte of strscpy() source
> 
> v4:
> - clarify commit message
> - improve comment
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
      https://git.kernel.org/kees/c/acc66d46810d
[2/2] kasan: Add strscpy() test to trigger tag fault on arm64
      https://git.kernel.org/kees/c/48ac25ef250d

Take care,

-- 
Kees Cook


