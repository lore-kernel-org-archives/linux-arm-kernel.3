Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E191E9A053
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrmuFJtx/xFV37s1HrUTVNNYNqMAOEdHaltFHcO5V3g=; b=2nlzIfU7m1NuVeSMv9Vx4dObQF
	gXw/5AuyFDbzQMnOVmqCkTVY6c+8gd7e9WiCF1MCAHI3z1f6LH6Zt5+LWoT6xTvRHPKfC4VqveDsz
	Bpor32B0vYgp5HVc6SGqPwqe1pGAQZBnRBQ6JsuvQVwioDIeMK9/gK0qhWcYCROUBuOvnKOfJ+OdE
	CSkqm2l2NaJcsBgSV6ayXfKTFQLRT/h8ce9HYMljKbg9HSrZr/H89X2dXD89UrCghd8SOhK41Waj3
	YdiRpjcd6TDgNP/JRcmSH8X3DMBMrgtlqFwIcrAboIr0UY9u62VOK28xtAZOI3ZCPpELVpzv2G9FY
	Akw/h1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8M3-0000000BkKc-42O0;
	Thu, 19 Feb 2026 18:02:23 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8M1-0000000BkKH-17Wd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:02:22 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id B2B8A1A05C3;
	Thu, 19 Feb 2026 18:02:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 56CE52000E;
	Thu, 19 Feb 2026 18:02:14 +0000 (UTC)
Date: Thu, 19 Feb 2026 13:02:20 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/30] Tracefs support for pKVM
Message-ID: <20260219130220.063c8db3@gandalf.local.home>
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 3in7iq53re3wcp4bjfb45ehj6p83i6w8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 56CE52000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX189EHO2cj0/ER1Y3s2xm8l7FxzngbV/18k=
X-HE-Tag: 1771524134-16267
X-HE-Meta: U2FsdGVkX18KsOW634c556Ay13vHARR3KG4iY9bpKgjeimF0kt32KKjae7aXrRnSMJvjA24rkCK1I2KRg6sbjxJ4TuWrR61mVJD2cJ0Md77TIqpMR46+fiK1TW7LwmkXwHbJgeYwTaQLsvKdGP64eU9XY5K6aTGQuiytjdf7LgNTVVhPHrEszyGEi+0EsoLYqoydPvHsWxetb78EJZV+8+Fb8NZAqef5y3BfvnJW4bxA/sBaUm5auwcuTGYwiowNUjGGHA40xyhyOyNL8X/ne61begI9OBko2AupzQZjhIq7xw99cqZ4nRkajdMKJWGMsz7fTOODChuVshdY889FxsOPUcjSK03I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_100221_369479_2412C76A 
X-CRM114-Status: GOOD (  17.73  )
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

On Thu, 19 Feb 2026 15:02:37 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> The growing set of features supported by the hypervisor in protected
> mode necessitates debugging and profiling tools. Tracefs is the
> ideal candidate for this task:
> 
>   * It is simple to use and to script.
> 
>   * It is supported by various tools, from the trace-cmd CLI to the
>     Android web-based perfetto.
> 
>   * The ring-buffer, where are stored trace events consists of linked
>     pages, making it an ideal structure for sharing between kernel and
>     hypervisor.
> 
> This series first introduces a new generic way of creating remote events and
> remote buffers. Then it adds support to the pKVM hypervisor.
> 

So I finished my review of all the tracing patches, but I just realized
that there's likely going to be some major conflicts with changes in the
tracing tree that's going to happen against this series.

To solve that, after -rc2 comes out, I'll apply the tracing portion of this
series to a branch in my tree directly on top of -rc2 and I will then use
that to base my changes for the next merge window.

Then the arm/kvm folks could start with that branch and add the arm/KVM
portion of this series on top of it. This will prevent major merge
conflicts in linux-next.

Does that sound OK?

-- Steve

