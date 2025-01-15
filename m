Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99514C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=531eP9d2EVZc4B/UEPj4b7w5anBAm9FV2verOI258E0=; b=KSyeBAw1NLek4HxxuAhn0UNuIe
	pJFCdTSrZaSLZ0o74CVWkq6eQwAm6xkmG3+wqPF4Rw9WLb5Z4GlFh+AuoCyAgZfomXz5/Sqa20XGm
	JpI6u/K5XAfOKWVrg6N1dyKnqZtYuuepqDLw1tK1Ru5ZgC6xzMrDhO1ksJmcWCdJZ7fmQM5z3oR3j
	udkiQfBClSjxWgMEJ8fi0xedJVJbJvsqwVnUrJGHwF10yeUSB800ly8gzcjja4wA7m+yQTaXXUI6D
	kbtvI9KFHjnG57ng4ScT+T+6zdoaAnWKfnAo9JDJklgTGJukMzYPDsBGkozgS+h1VTEz85JDoHNN7
	pLkTU6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4KJ-0000000C7DA-0DKt;
	Wed, 15 Jan 2025 14:24:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Iy-0000000C6uH-0401
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25EDBA40CF1;
	Wed, 15 Jan 2025 14:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FB0C4CED1;
	Wed, 15 Jan 2025 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736951014;
	bh=q4W2Kck2O2YAKdfwQHwHZnkuzzxW2hE7DYKNQQM0EQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hlaKFewz5YWt0G1rm80K2FBZX9Q/EQY362et1lYsiHiKc/oBgpeV/ozM0HAF9BVAy
	 sq5RHYB+bb65r5KY1kc7vNBbwHmiDTyibsA2NONMGnzxD3xMVygmiVj9pEjgJeI/aq
	 Gc5q79i+cgY6dlkxESzT1kOSCKf4ECwm3K7jfIE7rG8SMhYozKewN9FLZADc6c4Sct
	 VhyriyRoV9WJ2a5+6TNAGxMul/FD3DkuJ9CDm9homOlHw45VjwajFky5H3MJZSklTV
	 0cfj1rBBZzZMFOB0Y/Mxa5u9/MpvfWmZZcBarDv8gElgG0wc7wLiaXsJB0bPlThvWb
	 4Pe0GBaTLZqjQ==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250109175427.64384-1-rgallaispou@gmail.com>
References: <20250109175427.64384-1-rgallaispou@gmail.com>
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-Id: <173695101333.1849743.15943905169390341632.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 15:23:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_062336_120509_0AE79D15 
X-CRM114-Status: UNSURE (   5.76  )
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

On Thu, 09 Jan 2025 18:54:27 +0100, Raphael Gallais-Pou wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> 

Applied to libata/linux.git (for-6.14), thanks!

[1/1] ahci: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      https://git.kernel.org/libata/linux/c/f2809aa4

Kind regards,
Niklas


