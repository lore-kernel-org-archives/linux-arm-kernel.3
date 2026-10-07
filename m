Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30929CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLlG6oxieSL0p4PDzPMxZn7nV9OG767QOiP3EOIwymo=; b=H22l84iJwm9Qh30I8P6PYstXJ7
	sayJkzrnFzubfseMpz7cK36ry7BnFCRqBrFryTzX4lrpLQ2mphoBVP3QtzIhPRRpBwAzIh3TkTz0K
	WhZuam74VQ1RQasfR8QEzT3rfeP8PFtaqfIWTu6wlLWYfCbmmsXnfeuXjeBwgwJqTR7tSy9YeUMoR
	dGZjoLWWUZCnnOUkPv401itmF6JksI13Z9EJcA8b+UViI8sXfsTQNtBu1MobdLnawOzanFwnFUE/J
	j3znQmQGDswEnDhQz6esBXzFb7rAdw8gOQJfU5oix5tP2ZKz/JlPAK74gkSU7emxjQ+8NvmPNRT5K
	9vkHfNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESfh-00000002cRy-0LLj;
	Wed, 07 Oct 2026 14:31:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESff-00000002cRW-3s5N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:31:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A783C60218;
	Wed,  7 Oct 2026 14:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5C1F0089B;
	Wed,  7 Oct 2026 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383462;
	bh=QLlG6oxieSL0p4PDzPMxZn7nV9OG767QOiP3EOIwymo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M6R5HtY3LSN7F5e9vulKAKZ3yQzD9jllXuRdm3vj8+bKUbyy09Fr6MFB/J2OKEmJK
	 ucuBnrh8EbjRU7DCjxpe99c4EQxMozHIbLvQa8OG9wgrimJEkyV0KacRiuYEg9/heE
	 +7lhXYGs/L7z11TQq7wFMztpyEUDbsb9YF1rJwrVYVF8cAG2poFCxq6A8cglMqb72i
	 CQiNhQCI8sFNIKV/RUXSTh/clphr+/w3ZBeRhfWWNLDZqdAFe20P4d9BEVne1joKsm
	 7SZdmERzoWhwnfK6Ck/nAO2QyEymg0jCp99ngQ3KWEh7LnEiu8hUWhVXyXMcUIz51f
	 Ooo6DnJnGpIag==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: vexpress: fix two device_node refcount leaks
Date: Wed,  7 Oct 2026 15:30:55 +0100
Message-ID: <179138341052.606716.9871329893441157602.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 26 Sep 2026 03:32:50 +1000, Weigang He wrote:
> The Versatile Express SMP bring-up path leaks two device_node references
> during boot:
> 
>   - vexpress_flags_set() (mach-versatile/v2m.c) leaks the
>     "arm,vexpress-sysreg" node obtained via of_find_compatible_node().
>   - vexpress_smp_dt_prepare_cpus() (mach-versatile/platsmp-vexpress.c)
>     leaks the SCU node obtained via of_find_matching_node().
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/fixes), thanks!

[1/2] ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
      https://git.kernel.org/sudeep.holla/c/62b9ae8ae4a7
[2/2] ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()
      https://git.kernel.org/sudeep.holla/c/27b98d331f1d
-- 
Regards,
Sudeep


