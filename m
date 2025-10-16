Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15460CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzI4Ut12pJAKPtvzuGciHzIkIU66wAwYHAzNsh79YvE=; b=17VTPfL/3pEnX3Y0ZubSR8ITdd
	ysySuIwZ0Oe4HZzTJzfk3CGmZujBdXwPkQj5sH4SpcCNjmXoh0Q4zov9Hqi0WuNSiManLstj2K67W
	KeqQ6piLUdewSjeuBotL7vckg0hnxUKZTJp+/EJi5qXsa2yIrX6tCX0RIxhqBa0ivWc/qJRAx0ojB
	c/uobbKWudpyTR68+Fj4HF5N4GZUa/45KJUAYhJAsvOgasGehWsKaVyI1FTxbOQ9+yMAOg5vC+GgW
	AiEudKVZwnTtTmvGxbfag1WR1OmSiu24BW3eKkHRChHe6Dxx/IwV+F74BBIICPLdeUaCHTATsoGmE
	Au5fYwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uvj-00000005v42-3g8z;
	Thu, 16 Oct 2025 20:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uve-00000005v2H-18iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D12DD44929;
	Thu, 16 Oct 2025 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA14C4CEF1;
	Thu, 16 Oct 2025 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760647829;
	bh=ITlIzUAUo5pssT1lw+5f7WFRnL9FQktvSQ7YkS/Swf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k+Lz5rZBobuGND9FUYtJH8NH5vh9PWxwRUoTE04ieCY9L1ZYOEv6KSowX27XvzdvQ
	 Z3RDm/K4iKRxg0IJDOOqW0Ghs7z6YfksWl1db3oe8w7t5je78shZgX1cFiARrxlpS/
	 ANZCwotNwcmuyftujQphlq2yleXvWJEdvZcSQEcI=
Date: Thu, 16 Oct 2025 13:50:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: Lance Yang <lance.yang@linux.dev>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Arnd Bergmann <arnd@arndb.de>, David
 Hildenbrand <david@redhat.com>, Florian Wesphal <fw@strlen.de>, Jakub
 Kacinski <kuba@kernel.org>, "Jason A . Donenfeld" <jason@zx2c4.com>, Joel
 Granados <joel.granados@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, Liam Howlett
 <liam.howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Petr Mladek <pmladek@suse.com>,
 "Phil Auld" <pauld@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, Simon
 Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Steven
 Rostedt <rostedt@goodmis.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: =?UTF-8?Q?[=E5=A4=96=E9=83=A8=E9=82=AE=E4=BB=B6]?= Re:
 [PATCH][v4] hung_task: Panic when there are more than N hung tasks at the
 same time
Message-Id: <20251016135028.aea65e20b0bc7efee11572f1@linux-foundation.org>
In-Reply-To: <bb443552b6db40548a4fae98d1f63c80@baidu.com>
References: <20251015063615.2632-1-lirongqing@baidu.com>
	<4db3bd26-1f74-4096-84fd-f652ec9a4d27@linux.dev>
	<bb443552b6db40548a4fae98d1f63c80@baidu.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_135030_368978_9821F736 
X-CRM114-Status: GOOD (  12.25  )
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

On Thu, 16 Oct 2025 05:57:34 +0000 "Li,Rongqing" <lirongqing@baidu.com> wrote:

> > If you agree, likely no need to resend - Andrew could pick it up directly when
> > applying :)
> > 
> 
> This is better;
> 
> Andrew, could you pick it up directly

No problems, thanks.

