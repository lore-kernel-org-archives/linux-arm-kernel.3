Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E6C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuGqQGrV21GjVYaZtMHxkCtFSyxl6ccxDasX/4a2VJc=; b=JP+kgpHavvEkY7Si4LiTeqKuip
	OHefjyPJh2GuaD28xGCnZfFGD4AkquAGJSUDzFeADu7J6AhZI+rdxs46NoC8YxJ2jj+G9Xe4qfvUd
	wdOPT9RsNRKIFKqnT/BTkQW6KUL0b65aA7DHvU8ZT+o9O7jK807Ax07jhdDXaVsEAdICbmXQXExX3
	07YhfjLWTvx3BA1iZBzC9poO/GA4tMbK/gBJvw+O/K+a5/l5nlF/UN122d3sbfrede1g0AYyTaZK6
	6TsiSN6AOUWEpJ8yb0hTx3opHb9Lqf0BmP0BjNzJ/KRKMy5MV//rl735SnR+q1RvMzCMbpy/Rxmaj
	En2gDKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJnA-0000000H4yP-08q3;
	Thu, 16 Jul 2026 10:58:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJn9-0000000H4yA-291T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:58:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA56260054;
	Thu, 16 Jul 2026 10:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2121F000E9;
	Thu, 16 Jul 2026 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199490;
	bh=XuGqQGrV21GjVYaZtMHxkCtFSyxl6ccxDasX/4a2VJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R8mX7CnE7NTo1y4pcYLyuJEjGUSoNWuer6ncwtUmHFXaDNyjKp06mkVAuyTy5/1SU
	 1aqGggkpzsn6iGvzdzzNbypBry9xf3sR+kxJUxMSNB6bd/vEtuQNc3wBsylVHQ/JWy
	 HHUSwdptbZGze6sGIfcmEk/DQnvjoQNZX0IIDXJuwm81KIsVGiluHcit8VTTrHtw9r
	 BYBTnU+z4S+NdVge/SfMkWi1btVEFG+/YakVd7fqMVI72+vSBQbdvqwKFGi5bEt8De
	 mbSQ0Kjg+Ko1l0DggZouEwsT+6dkqvhNXy468laKTtzXd8OiZS019B0gCgTJmOuw5b
	 ezqjkNeUtQvVw==
Date: Thu, 16 Jul 2026 11:58:07 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260716-generous-organic-skylark-b9dfb1@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
 <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>
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

On Wed, Jul 15, 2026 at 03:24:03PM +0200, Yureka Lilian wrote:
> On 7/13/26 11:57, Sudeep Holla wrote:

[...]

> > 
> > If WFI is replaced by NOP or YIELD, do we really need to save/restore
> > IRQ context used for pseudo-NMIs which may add some overhead ?
> 
> There are optimizations, even in the ARM64_IDLE_WFI case, which could be
> done here, such as checking that an interrupt actually occurred before
> continuing (and repeating the wfi/yield/nop until this is the case). I would
> prefer not to do these optimizations in this patch series, and leave it as
> future work, because I don't understand all the implications at this point.
> Is this acceptable for you?
> 

Sure, I am fine with that. Anyways it is left to the maintainers.

-- 
Regards,
Sudeep

