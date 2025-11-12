Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F161CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7kqNbJhtGXPBVa1lrNEtGM9z6WQeOfdoLl85/+8qwk=; b=mz/sb9eD7LOPsuGuk+eme80G6c
	aJ5F1b5hoZpWZTwpgJoXJYVq8Q73iZFwO/tShSjzi+iEonZL22GhGSDFbuFN9GwXqrPtKQLO9j/qm
	0+TaZjomeE9EaljHe3hGsYF3L6eX6D09HlCagGPeii3QUl3OZGgz1Sf7HxGvdeyCyO8D2o1IsI13v
	GFENYgYIlV7uYHILcXgwBVYDp5vh/Sq/qpilYjEctHOLna6VXQume43KXl7HTcBrJdvm08UHblomv
	qqHjq3jylGr4y8e/lDLkHakXjL9H4D93lUVkDPnxu1UA1tyVphaCGnsMr8Aj4+iNzxTSutyPLcXyf
	tLyYiU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAwB-00000008qch-38sY;
	Wed, 12 Nov 2025 13:31:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAwA-00000008qcO-35hD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B48A760213;
	Wed, 12 Nov 2025 13:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288BBC2BC86;
	Wed, 12 Nov 2025 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762954261;
	bh=2poLlO9B5CBMuS1HOT8AsTBXsJggdrQRNTQdmucUiaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=maQSL4InaEIoWc7a6LxKSVC9E12GsXKu0YLReFJoP/Z9xYuRKa26yQ9AuXQwVgUBa
	 depJlEKBsRznRaKvsg7BBMhUfrSkQcANG+eY7v6M1pG1X7O75wIQF2CWJcaN//Dz4d
	 IjV8BqL/Zwf0Mlz3z+5768ooXXso+AOWFezZQqjvgSgU3Rh65rX0CjBK4WxyRNQQI4
	 d5C2+hEnPBM1Vyv9HRFbWQ8+kJwGTqnkAb7tZ80JiwtmO4pbf8RBb0Qnu3TboZUkLd
	 VViUWKIKBreX3gztlXzP8qaQqV6QkwXHj611I6ETvBipFWIPLSCUPT2yrcPFGKJUdS
	 LuW9dGN2at8VA==
Date: Wed, 12 Nov 2025 22:30:54 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 Jinchao Wang <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251112223054.6ae557a50f1d998c9b46861c@kernel.org>
In-Reply-To: <af8f3543-4af6-48d7-a55a-bab24b6c7c7a@sirena.org.uk>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
	<20251027224347.4c887cc956df63602f377550@kernel.org>
	<20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
	<20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
	<20251029004219.dc9cda0eb56ae46c55855844@kernel.org>
	<20251029114317.167b7d908533385c1c9e6782@kernel.org>
	<20251029172004.a0aca144735f20a6a59d2aa6@kernel.org>
	<20251030090952.befea7f0cecd5518c7fda02c@kernel.org>
	<af8f3543-4af6-48d7-a55a-bab24b6c7c7a@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 12 Nov 2025 12:15:03 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Oct 30, 2025 at 09:09:52AM +0900, Masami Hiramatsu wrote:
> > Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > There is a single step execution code but only for default overflow_handlers.
> > This is a bit strange becuase other users can not set it up outside of
> > the arch dependent code. Even if it can, it is simply redundant.
> 
> > So I made changes below which allow users to set its own custom handler is
> > compatible with perf default overflow handlers.
> > I confirmed this works on both arm and arm64.
> 
> I think everyone who knows this code is really snowed under at the
> minute - can I suggest posting this as a fix for now?  This is still
> broken on arm64, we'll need a fix (or to disable the feature on the
> affected arches) one way or another for v6.19.

Sorry, let me drop it from for-next soon.

Thanks,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

