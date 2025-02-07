Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7F1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0G53MKFU+QVr2xiDHlFWZnAAB3twrsam44rAosj2Zw=; b=Eee8He09o5Itbg4tXfRVMkDZEv
	lQEiW/v6K8eTv+2e+AU2Pw8DktlvoPiml/Y1ERPF7X1ZrH5K4123bfzsQdfatpQDL55PRW9uEVec6
	JnyooFDXqvSMvO/MraHkitoDgUb5wdxNDxboKUFLEAyiDGMP8AsBvzoSWwjbiOljnEvA1Ck9NBm5V
	amWzrIbBBb8i9dyWtfRfEl0qzEBAaZHOrWSparpplbqiInL2UW+vWcYEa+GJLAcElK+H3xWtUT1KS
	w7vZPJHGMfldLpZNrJ/7nnKAjxZmS+GWGmPR+vl+/MrAoc1uD6KRoitVOSIkbEYZTAR0gV+Ueucnt
	biyf0/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgScT-0000000Aapm-3XvE;
	Fri, 07 Feb 2025 17:58:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSX9-0000000AZbv-3nyf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76E345C6A45;
	Fri,  7 Feb 2025 17:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D52C4CED1;
	Fri,  7 Feb 2025 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738950774;
	bh=o7WL3rojOnZteVHaXqfHStpkFhdgk+b0ovUxVviMNXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G40TBqV1iOeetam5qpFi3xZs0wRJjQws8L0f8wwMs7uRHkjDRWs1fzI/pB4PdJgxo
	 qpCGqWEq02xMTTrow+jjp6zEyegQ9cL5WZfavmKDK9+67ajyf4v5ZGvX05aWD3cG+1
	 oQR2BU7Gaaw7D1dlP21wzupMrNYGnNeQ+PmRddAdqI0De8HLOxp6aazIjHtrgga0Py
	 V9NpsPHmTNEXO1BOkwVk9J2WHEWTX3gwASbcaLwH4Y4MTvvVRGtJ/NIPE9gA0iawE5
	 C0XXs8m3lk/E+u+7P5LyNbjG8OX1sTZ2PmlbD33flwqsdbVEHtuPNeIdgGorYXKbVh
	 Re8DBUsIAP5ww==
Date: Fri, 7 Feb 2025 09:52:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, indu.bhagat@oracle.com,
	irogers@google.com, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250207175252.wtsfjqnm52jkevog@jpoimboe>
References: <mb61pwme55kuw.fsf@kernel.org>
 <20250206150212.2485132-1-wnliu@google.com>
 <mb61pikpm3q76.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mb61pikpm3q76.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_095255_983758_18528644 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, Feb 07, 2025 at 12:16:29PM +0000, Puranjay Mohan wrote:
> Weinan Liu <wnliu@google.com> writes:
> > Thank you for reporting this issue.
> > I just found out that Josh also intentionally uses '>' instead of '>=' for the same reason
> > https://lore.kernel.org/lkml/20250122225257.h64ftfnorofe7cb4@jpoimboe/T/#m6d70a20ed9f5b3bbe5b24b24b8c5dcc603a79101
> >
> > QQ, do we need to care the stacktrace after '__noreturn' function?
> 
> Yes, I think we should, but others people could add more to this.

FYI, here's how ORC handles this:

	/*
	 * Find the orc_entry associated with the text address.
	 *
	 * For a call frame (as opposed to a signal frame), state->ip points to
	 * the instruction after the call.  That instruction's stack layout
	 * could be different from the call instruction's layout, for example
	 * if the call was to a noreturn function.  So get the ORC data for the
	 * call instruction itself.
	 */
	orc = orc_find(state->signal ? state->ip : state->ip - 1);

and state->signal is only set for exceptions/interrupts (including
preemption and page faults) and newly forked tasks which haven't run
yet.

-- 
Josh

