Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375CFEA794F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ahJ1cL++B3RaxB/LKd/n6/ujwLu1R58AmEq+ZhPwk0=; b=vpIT9f7pzAWqFUYYY3g4wiQWIo
	bPBE8z3MbOQngaJVqUSRYYU1KWrCRzpWfmh84UTyCr2/0NxuMvQBFLe7EFhqRjeoYEfU8UJH29NIA
	tK49FJTnRqbXwFXNkVt6bSll45hbxCyl+qB2H9kEvB23ewQjCmRw0PinLrCjevygA2/Y6Epa8HyMB
	9bkasKI2GBbQCKuRDq7wog0QS3Bj7WSWeGqN/a74/Qfi4eBUD8BrPYOWbBY1NxPbjnlKjFI7J+L+D
	PtABolt6tulNrC89h8xtucbvADvYcVQOaChXPw1yB4jt9dKjolqWaOOlF1HDUOnT61j8a+ieHTV28
	R5tjrnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoEU-00000009GZ3-0rjn;
	Thu, 05 Feb 2026 01:32:34 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoER-00000009GYY-0XYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:32:32 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id A6FC51B1C2D;
	Thu,  5 Feb 2026 01:32:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 3672620010;
	Thu,  5 Feb 2026 01:32:24 +0000 (UTC)
Date: Wed, 4 Feb 2026 20:32:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 14/30] tracing: Add a trace remote module for
 testing
Message-ID: <20260204203222.01064aa9@robin>
In-Reply-To: <20260131132848.254084-15-vdonnefort@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-15-vdonnefort@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 3672620010
X-Stat-Signature: kb9wzt1mfyn1fwopt3wk9ur4oubdog66
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18OzKxI10ZLVtVcjd6iNhrr6VhjUOVLmYA=
X-HE-Tag: 1770255144-305708
X-HE-Meta: U2FsdGVkX1+EDR/c3dKgo0s3NgB59SoOMZgZmHJXInP+X82Ema1haQMEbnZ1mZfmooGScFWBRRzLMqkEMug8zZpYgJ6zdE2JpsBkgFnHvuu9Xz6KRv8ywJ86TSZXJ5FRXbDk8FZAEtXQgOO4AT52EFt9hQnFyjiuTgPTzzbEQlp0dJLFcly/ENn1XqlJ3Cs8w9IsPrcm9oLoMvf2YyriStfSQCgLsDauptpH4Mtc5+qBa5Mh5wfzAWRRbmKAeKyPu3e08aJKWmWtC74LLbtOw3rAq7Yb7cn3ZY0pTzxrBJoVHMCqNDMqq0apRsphMXXQqFaDblCQEawZlyLlHKGr2p05aCT5vNHQXwmQE0WthYsMLSbVC+iGtG8N6VNYHxS93zEh/M83ZTZAi0Gru/ouNg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_173231_225734_E32BAFAF 
X-CRM114-Status: UNSURE (   9.42  )
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

On Sat, 31 Jan 2026 13:28:32 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add a module to help testing the tracefs support for trace remotes. This
> module:
> 
>   * Use simple_ring_buffer to write into a ring-buffer.
>   * Declare a single "selftest" event that can be triggered from
>     user-space.
>   * Register a "test" trace remote.
> 
> This is intended to be used by trace remote selftests.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

