Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E32C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge4W/i/mr5GP80rvcQHY92M4kqH0f1/lnzM+iyXqhII=; b=AeEqp3xBeLNy/PdW4RN854IkOV
	9x2LdQ343cnAbJK4BFc0mnv2reBDvzzlPq5SZPYe7XafU/O/o1GOt+PQg7U90VrG0C8IlobL0+u0G
	+YqDe+F5wbtV28GNpHfBJMUYX3iDFyURavroAGPIwSI4tWTGzXK5r61d++YJqKhGOelSlSyJSInWq
	Q7D5X7pGrj53JeUrKGVYT5M+GleYST9l1bw99L+VCqEHvuo8CdToxey39mTmx2ZfEf9AvU3cxO/oc
	wjwxtbzqHR3AVWM7B6v0Hl0Yf7goPuCkDKkB//Une0onXmkAGR+XEprcOBslybQzlr0WX7UYfWMGs
	EZD6Yl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxc6-00000003yTy-1Pwg;
	Fri, 16 May 2025 16:08:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8Q-00000003sf3-1vyO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B4FA5C599C;
	Fri, 16 May 2025 15:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE0C4CEE4;
	Fri, 16 May 2025 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409885;
	bh=YsofLFLi3rdB3bGp7np0mUh3ypEZ87RyG+A4xj6xx84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFf1em0ht+ti4QfG0xqp1Qw4JWmpOu+Jpo2sUOOJbWuWJWYgDAIdtymXVoIynGOu7
	 UtAcGdynv9ncMRYgfM8O58HDRZDMvuoYW1tlvi3riQPfwRh0FXMLx1Uu8rda8ISLhm
	 9GUDabp9ExuL+Ft1v2wG0Uqlu9dKCZ+Dn1YmpJLcOFbQ9r6IJk8XQbROh7RY1B9nLZ
	 +6xepgfkvy338wJ2k+NxVpT4rkyWDnz6GqfwcsPnKe5DYjq5jMjjgmU4oBZU+5CRZ1
	 acwEvHETayI/8C4brH6nCPl/EX3f93htoIRkJHCuwqOHV2Djsom2oKmvaLsp28Aqla
	 5nau2g65icDuw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	tanze <tanze@kylinos.cn>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Set default OUTPUT path when undefined
Date: Fri, 16 May 2025 16:37:48 +0100
Message-Id: <174740491354.2576982.10627092971010791317.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250515051839.3409658-1-tanze@kylinos.cn>
References: <20250515051839.3409658-1-tanze@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_083806_539006_6107881A 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, 15 May 2025 13:18:39 +0800, tanze wrote:
> When running 'make' in tools/testing/selftests/arm64/ without explicitly
> setting the OUTPUT variable, the build system will creates test
> directories (e.g., /bti) in the root filesystem due to OUTPUT defaulting
> to an empty string. This causes unintended pollution of the root directory.
> 
> This patch adds proper handling for the OUTPUT variable: Sets OUTPUT
> to the current directory (.) if not specified
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Set default OUTPUT path when undefined
      https://git.kernel.org/arm64/c/b225219a4002

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

