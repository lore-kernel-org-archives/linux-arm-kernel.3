Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0EC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 21:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMfeYsP5GdnuDCfgJKEm3wwcc5Ecr2dv1YHRl9juiCI=; b=in+ragZNNDJ6P1ToYXZR0YHfUw
	UimVaEj/V50twhUsbv6HBa7nz1f8ykQ4P/8YJPW4tJBSHotDG1k1WROMBzSx5qxwK004E6w3y87VC
	Rz2V1j+GoDy3tuQzaMZULhnyM2f4aUnsO5calnbEc8ptqoXeMSxLxnIc7me+awsLp8QwAUy05rXyS
	35sVMQdQsWHki4HJyeiGdLH23FONo8BKqgViky9aWuYb+TCH+KhBK/HiWCvUPvQgJVf3A99FBMnJy
	2ZL3Plxs6B9/hzoBY2l8eVRjn16u3A/l/6L3v1Pcc6JBnw44EZPGAYY1GEEJe1sAhqO0yr6O5HOMR
	sjG6Mi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTD0-00000003zch-45Wi;
	Mon, 27 Jul 2026 21:50:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTCz-00000003zcS-2yPY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 21:50:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FE5B4150A;
	Mon, 27 Jul 2026 21:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7541F000E9;
	Mon, 27 Jul 2026 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785189000;
	bh=rMfeYsP5GdnuDCfgJKEm3wwcc5Ecr2dv1YHRl9juiCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVWTMr2cX4ewrBWHXUcAbrlt/cYMv2t1rAY6OmzwAk0jxEusNqzHhIvI+IFi8gusK
	 jeVo2x71CzuTqqbU9a+WJJEvzb73ShnQO3gqhTrXt7a2TPzCUTVkNh3hhVBylazW4/
	 4CeRyCI/IFRdnNyAJZiu6XWl0fPPuPV/CAOpVXlO5mgkBjqTvlCxPdL58ayHHdjWJ5
	 RjdQn+7QE6cmJ2wIBqxj7yx5OPwo/Ife3L3H08yQxcj+ptQNRXXCFsaXSPJmOUv/8M
	 z+lqEfGJ6x5P9pMufpzSSTCyZsvQVy0wiah9b9n0VGDo1ovNXxn8YJv2O47SoUwgEy
	 X3/tWKU4SI1CQ==
Date: Mon, 27 Jul 2026 22:49:52 +0100
From: Will Deacon <will@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Oleg Nesterov <oleg@redhat.com>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH 9/9] arm64/debug: Mark debug exception helpers
 __always_inline
Message-ID: <amfSgECpzET7JHTr@willie-the-truck>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
 <CAKwvOd=HeG=z1j2qB-SX3NQ=62ERr=KpQNZyqqp2Qy4kZ54RLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=HeG=z1j2qB-SX3NQ=62ERr=KpQNZyqqp2Qy4kZ54RLw@mail.gmail.com>
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

On Mon, Jul 27, 2026 at 12:22:32PM -0700, Nick Desaulniers wrote:
> On Mon, Jul 27, 2026 at 5:25 AM Hongyan Xia <hongyan.xia@transsion.com> wrote:
> >  arch/arm64/include/asm/esr.h       | 2 +-
> >  arch/arm64/include/asm/percpu.h    | 2 +-
> >  arch/arm64/include/asm/preempt.h   | 4 ++--
> >  arch/arm64/include/asm/ptrace.h    | 4 ++--
> >  arch/arm64/kernel/debug-monitors.c | 2 +-
> >  include/linux/kprobes.h            | 8 ++++----
> 
> It might not be appropriate for the changes to kprobes.h to go through
> the arm64 tree, but maybe it is?

They look pretty trivial, so we can take 'em with Masami's Ack once the
rest of the series has been reviewed.

Will

