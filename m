Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7546AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVqfjQiQHCa9APiBAYTwHxe0w4t0H0mT5QhnLN7jra4=; b=HNM9jf+PbXpvua/ChzsjIHm5Eu
	JOR0tZ+scb2iz3/+LP/zS/e1nHVF3iCUTuufsomuuaK1voSPOk6u4y/6bvyYRCSR+vlOgFlbtQo3J
	ecvKfs8okr3GuqIIXNKt0gBCg2UM0IzyF9OwuGx49koJ1xP6zR6N5HkeUcoHzzNtu11OEo0smUACp
	IifwXTwC85+tynyssUn59TawycevwBPMn4Rl6DUYwu/kInrEYLM+lHR+W/FwOHQ8MxNkko4+79P6l
	we5e8Sl1qFNJ277N4GnK9tCorREfjlz0X2o/rGUGuy+Jq9fp0LgR2HIVcXIPf4CyeSoaDvcymEFkN
	zHw9+KZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwkQ-0000000F8gq-2HAN;
	Wed, 12 Aug 2026 00:23:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwkP-0000000F8gb-458g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B1A041AB5;
	Wed, 12 Aug 2026 00:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEE61F00A3D;
	Wed, 12 Aug 2026 00:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786494189;
	bh=HVqfjQiQHCa9APiBAYTwHxe0w4t0H0mT5QhnLN7jra4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jv6ul+a4EGrYnKqOsRMwHpw8/KSOgGmlSlk/Rke8ZBPg6CCZco8iVgFsPMlka6+3d
	 pM99tZFn06OVlT5TqpgWl7HuhhTBrim8JyhhlGZ8Ktmo3gsnVbpbXyh7OtctQDftTk
	 9JJ5/ezVGMponksoHDYaKv2Jhva4ibS7IoADLik4MSi4LyfzvbaF/MW/PnMj60fu1Q
	 R5hOJAg59PWZJdBM8IU2bcG/Cp2c2bN2AUKutcG/9NXClIJqwUVOqx0RKl8bxaT3wy
	 XAnYoBmUyE5JSG3kBQK5D8xnYoTrM62lDC2bhWJbeNywWTQF0IzGeVCoKdmKdxvY/n
	 LAToTCpxMlvtw==
Date: Tue, 11 Aug 2026 17:23:06 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v4 14/22] objtool: Reuse string references
Message-ID: <anu8su4kuf3eUF3c@jpoimboe>
References: <cover.1786230311.git.jpoimboe@kernel.org>
 <e0856be4208a6bed2b22dffe2bf8e010470f49cf.1786230311.git.jpoimboe@kernel.org>
 <CAPhsuW6JgV1a7jMxQ0bknOpQ7WQNSqYbAHWss18GCrzGZ79OcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW6JgV1a7jMxQ0bknOpQ7WQNSqYbAHWss18GCrzGZ79OcQ@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 04:52:51PM -0700, Song Liu wrote:
> > -unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
> > +int elf_find_string(struct elf *elf, struct section *strtab, const char *str)
> >  {
> 
> elf_find_string() returns -1 for error and positive number for addend.
> It is a good idea to add some comments for this behavior.

Ok, will add a small comment above the function:

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index f6219f495efdc..f9a4226f115ef 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1410,6 +1410,11 @@ int elf_find_string(struct elf *elf, struct section *strtab, const char *str)
 	return -1;
 }
 
+/*
+ * Add a static string to the strtab section.
+ *
+ * Returns positive string offset on success, -1 on error.
+ */
 int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
 {
 	void *data;

