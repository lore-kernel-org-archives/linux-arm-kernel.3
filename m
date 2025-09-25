Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7256CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NcxTOwDekTgL2GhgwOZjxKvQwx1/iFkog9wKBVaUZ8=; b=3jyffrurbqLNXC9YXLlr++zqqH
	1Tww7JdEnrtffw03ALCK/61aG+2RYZnMvyPQWBHIinHL0yT/G8Ujp1i/NRJ1jcI8G6yvzeULW60yr
	VBQicluni0CoZq5EXbdjY8I/fNREwlTReEFLaAhq+dw14aRScLvRC5kTUc7/VcaBm155ssAOHaFoG
	Wqd+iev0ldgBRoDT2c66o8S/f0uuFNmDVfBZRaX+P12muVqVsMYo3cfWnn0pZ6PfmAV2gXcv4JzmU
	J20e1R8eB6DxjNRaBdU5vXXBg2vpgN92YnBMmWl8qZVPYqh4g0LJxU3wUuJADFxknKXairc0/i5Cp
	fu7wCeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gBn-00000006cVE-2EfE;
	Thu, 25 Sep 2025 07:14:51 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gBk-00000006cSG-1cAS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:14:49 +0000
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 2633D160354;
	Thu, 25 Sep 2025 07:14:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 7E35C20031;
	Thu, 25 Sep 2025 07:14:38 +0000 (UTC)
Date: Thu, 25 Sep 2025 03:14:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Feng Yang <yangfeng59949@163.com>, mark.rutland@arm.com,
 catalin.marinas@arm.com, will@kernel.org, revest@chromium.org,
 alexei.starovoitov@gmail.com, olsajiri@gmail.com, andrii@kernel.org,
 ast@kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix the bug where bpf_get_stackid returns
 -EFAULT on the ARM64
Message-ID: <20250925031435.64f54ca0@batman.local.home>
In-Reply-To: <20250925123331.f4158581bd488ca0ba838d1c@kernel.org>
References: <20250925020822.119302-1-yangfeng59949@163.com>
	<20250925123331.f4158581bd488ca0ba838d1c@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7E35C20031
X-Stat-Signature: a4mr1i9f1s1f1ursbn1t6s3w14841sug
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19p+72UpTwl1SL3DLMeRJ+8sjZlK+VlD3g=
X-HE-Tag: 1758784478-716288
X-HE-Meta: U2FsdGVkX1/Og0jSkahwE0JXw3mOt8HgK/ymsHjHzYQJ+FMYHp8u7q/cbR+5f0WoD0ewLCaBEPf2Ohmx7olIKIvarMmzWShR4irKtrqG3vRQbkFmZNrBjJ3XQ0lv5tFcXv5jPeZm1f2HaPu5Hbtfn9+6N2ivgosLuA1+vBubCSZoGlfhovNzi9k4QlZB1tZqfXHSqwg8LwnwF3/uVB5uGb0359N3KP/9AIi3rXH3cq+sJfKdPYrV3B566i/o+35AMnIekigSk6Y8N0TYTGd0HmRU+mBZIZBzOybxCeEVGtXUBjLvIkZWwuTvZFuBui5sU97LahsRyiHK47ZfklEeC4pJOyfYad44Kr2lxeX6FYx3QJzvqoIbUQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_001448_495653_DBB7B061 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, 25 Sep 2025 12:33:31 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> This is actually a fix for arm64. So I think it will be
> merged via arm64 tree, right?

Correct.

-- Steve

