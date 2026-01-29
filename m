Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FEBD46C15
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLFaBm+wEseSF1umLyBH7k6yiApx45B6VlUfo/7K1PI=; b=t4y524evm2NKG5oC8wGRF4WCQ8
	urOk52KBgPIxWcUSOGyqWRC475tDStB7J7hQMsrk86o/eFSlpd9GwiaU4DCWRvu02gNw+3xXY4Zq3
	JJe1O+umbeu1+ByUiJrseFFGILZIk/J6CBSg2yHQXM4+sPHLkVRjC4gKHsuGccvekYzNA8ftgyhlj
	FUQmqVeLzeKHahp4GS5Tv0Ro2ouuqEy5tGTo4SydwlkRUcHMJI0+4gLypHmE/OgFRNHtfyfVeRctg
	E5oVJbKRmtvAEOqA2l8xJAxVNG6YBLwwhfpTDWuK2SuVPZq6foKA/srcUaNToJO1Hq+Oa3WFAIeS/
	9OYcEhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFtx-0000000GysY-0BeA;
	Thu, 29 Jan 2026 00:28:49 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFto-0000000Gyps-1Lv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:28:43 +0000
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id D8D5E8C375;
	Thu, 29 Jan 2026 00:28:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 7518D2002C;
	Thu, 29 Jan 2026 00:28:34 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:28:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 12/30] ring-buffer: Export buffer_data_page and
 macros
Message-ID: <20260128192844.52190408@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-13-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-13-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: qudwhjfi81bakcw6yadd167nzskxcbx7
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7518D2002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/WCv8FJD8UF+HujZYF0gJjr4sqREnC3rY=
X-HE-Tag: 1769646514-966825
X-HE-Meta: U2FsdGVkX1+cpk7hAynmRv24KxQsND7QeSfWuDxiIjRee/WvUyE1teCarGLTIbLwjfnangZaVMAZuP7bMYtfdDIBQT8RWjfRBqCXGu58AL5WIDNqH63E/+JTSeI9KSjqtpHlLk20yTtsF55OjhMvB51ctngV0TzxbDbOUZMEA3JIhJeVxPi8hguD5CEr77bN6Klq2V4Sxuwx40lDfNwo9CLsNFWkXKrDJ1W9wgGk43ENphREQ43H4QSybVuLcd7VyF/ZIL8uvkoNQxqpEHUPozAGNWmKaBG4+L9pVws3oiTNShL4ni/M5AO2S7STNx6+kaA/xKcPC2mCA0N+VEumvW0GOu2fr0AEhfOO82byCZnTe5DAq/hbOHI5LuMiITCTPe3oVRkKzfIkjP9Uz/JraA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162842_698046_92443E7A 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

On Mon, 26 Jan 2026 10:44:01 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> In preparation for allowing the writing of ring-buffer compliant pages
> outside of ring_buffer.c, move buffer_data_page and timestamps encoding
> macros into the publicly available ring_buffer_types.h.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

