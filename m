Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6854C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz7FB1JiQQWECxyDkCp2pLSNs/1cOz9bKlgbTiChjT8=; b=ya14Wuq6C1TkPjwbRim0ry53v+
	xzh6kfYi+sSFotZXaazwzQI0cs9VSj61hsTIuhtOzins2UPDW9f5QqnYc03WcFaplsGgGnyFcHlRq
	0jGa62Tj+p1stqhojHfbkpVMW7cO6DYn9BR+lZFjYsWh8AkxDpTkFK4UXBE5e+7umrumc1wzC8oh2
	+EDcZCYGSVYS+cOITELfXflnEIM6UWGmeW4QzLFmF2w/odGRjjq/a591BPy9x+60PzRWr67+Lm/eZ
	oVWmLjn5qIhN1e7D4y4TuUW6NwqeF26uhnCIVZhZ4ByIqXfsPV6xtF0N9uZtKwduYs+j1gxOgSHxU
	CBdvJ8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBabU-000000042Ef-1oX9;
	Tue, 29 Sep 2026 16:22:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBabS-000000042EY-43jw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10E366022C;
	Tue, 29 Sep 2026 16:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA11F00893;
	Tue, 29 Sep 2026 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698969;
	bh=rz7FB1JiQQWECxyDkCp2pLSNs/1cOz9bKlgbTiChjT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2JsrX5j9lsR1xXFVjTTyGN1wqf4vuTJeDCXzjA7c1FJtEqdf2CogUDPSrS05l06T
	 hho2m8ZFTk7ayXFvLrZCcvxd/R6MJE7xOBBNbRyFWwZB5SpzxdGpHEV7b+ACLxfxM4
	 Y3LV0Yb+xXLuVBwDVhGqEpAjbZv4dElKNM73d39xCl3V4l7Zw8hjN4X4yt8Y26UTU+
	 c9zrOrjcBBwbnKhzT9bhDdJvxt/fxBzT5r/RKGbw29rHIGEE83xB/+FMxo881WVRVP
	 2BSBv4Xp8BUR91UQtnBVoWvc4jV6zPQPu8rAOm7nOg9lcMVxHdt6/vEtWl6VlfsRA9
	 ShhhFSG6KrJlw==
Date: Tue, 29 Sep 2026 17:22:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arvjKjrh1NU4CKPE@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
> When they detect corruption the fp-stress test loads print load specific
> diagnostics and exits with a failure status.  In preparation for
> building versions intended to run as KVM guests factor the exits into

Maybe nice to say 'bare metal guests' here, though not sure if that's the usual
terminology?

In any case, to me it's a bit unclear in what sense you mean they're running as
KVM guests here.

> No functional change.

I don't think this is accurate, as you're changing the register into which a
value is loaded (x0 instead of x1).

That seems to be correct to me, but worth calling out that you're fixing that up
in the commit message and dropping this line.

>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks sensible to me, with commit msg nits addressed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> index 3effeb1fbf50..9cd31dc47709 100644
> --- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> +++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S

> +// Terminate the program, reporting failure.  Does not return.
> +function exit_error
> +	mov	x0, #1
> +	mov	x8, #__NR_exit
> +	svc	#0

And looking this up, svc = SuperVisor Call = -> EL1 essentially syscall(__NR_exit) :)

> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 9db7b5419397..5ee8ef51ea4e 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -298,7 +298,5 @@ function barf
>  	bl	dumphex
>  	puts	"]\n"
>
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error

Looking it up I see that 'b' is the unconditional variant, but it makes sense to
use it in the case of an exception being raised.

--
Cheers, Lorenzo

