Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 01:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLfW0rN/4qyXewetHV4qdQVWL6NJH6ThRORQVfeKYJ8=; b=UJXea6TdGqhMkE8PM9VuN54kpo
	kNK3nOhwEmEF/jUyiJf/EqNftxF1ZoCJxFhjqQ+/FUHJq//MIwmGNHW6fCfSIwvjRI2ZHaw+jEBgU
	/qBk6SQvHgj3thmct5r+3WjNm47Fnr0R4RXSvGCjyk/P7S1xLnpr2EJaBzwxrH6u34iACsnq8HWsl
	CSUrY1FR785JPkc2MVybRf3wKJ2gxwPPD0c1iLyv3rahNLv/BaMZFFui60V9uEUCws3NuVSmdcM3N
	RzTJ9vITG4Ro2Pb/AtyS65Y6H6K0jO+3/Nai16t4nn5fwg+Q0raNd1AYoKUTsWmJv2oaD/ZRKO//b
	IWEiuY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tik8Z-0000000D9JY-1fhE;
	Fri, 14 Feb 2025 01:04:59 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tik78-0000000D98u-2SnY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 01:03:32 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 1826C72C99C;
	Fri, 14 Feb 2025 04:03:26 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 054817CCB3A; Fri, 14 Feb 2025 03:03:25 +0200 (IST)
Date: Fri, 14 Feb 2025 03:03:25 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/31] ARM: Switch to generic entry
Message-ID: <20250214010325.GA12626@strace.io>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_170330_786326_50AE0DB4 
X-CRM114-Status: GOOD (  11.57  )
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

On Wed, Feb 12, 2025 at 12:22:54PM +0100, Linus Walleij wrote:
[...]
> - Tested some ptrace/strace obviously, such as issuing
>   several instances of "ptrace find /" and let this scroll
>   by in the terminal over some 10 minutes or so.

Could you also run the strace test suite, please?  Given that it used to
catch quite a few regressions in the past, it could be useful in this case
as well.


-- 
ldv

