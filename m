Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D548ECD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzQ2Q92BkyZrcIbCUmXt/htpBaJmJbUACSBmA0TFGo0=; b=B0VQB7ichuCzUNjGuKMIu3UsmK
	uJfYJN4FRkAcAknzDxunfBDefccwu9qLBH/JtP4rluMLXZsLxWnfOpH6qM9uMH1Hyg37DOIJfMv/B
	H1Iu6p5UMWzipY+FyiMcf7MfK/IbG7nFu3GoEgEAhQqa641KIFh4xVqrTcmrsVPCA4wO8rnSj2etm
	OW50j1iJhj9AMIYvlICsddxI7o+gfL2sHvJXzofGak2bEroEzKO2K3uEUSuPHgQw1JsXYcxuyraL9
	jcJue9oHl+rIMBPVjqnwxgnT0zkmTt99CB1C33Zh/ccG8i6Hpx/rbpJ8iQjQRONv4unY57YZJPQWn
	E4oEp0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA1l-0000000H04O-2Sm0;
	Thu, 04 Jun 2026 15:30:37 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA1j-0000000H03n-0qXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:30:36 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51765331535so565791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780587034; cv=none;
        d=google.com; s=arc-20240605;
        b=TGFjqPLkheCdc5/yjmGicr1daGNL8uRwSJMlv7t0STXN1AQA/yfwrAl+WD55pmVknj
         wjYtM72lxHN6gxK6sVsLMNw8SKvnjlut9SRBewq3GNosToFM2zcW8gxNgR1sxRHfEnGg
         wJYO9+Uj7ZXwMLP846KOoUba8O9A/Po5wdOTmxtIJLymLnoj3ApT9rTZ+c4D02nQKTwm
         uzmGrfvbjOJErdEFbBezJxlldC71dHkREjVwui66p3dwkUGXBavxHNBihH51a6GIUDGB
         rrPPvDT/sZyindqb07LMzec/VP13THus9qif7lAYHhK44cv7Go44tl3aDtFKeqyaTTze
         RA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzQ2Q92BkyZrcIbCUmXt/htpBaJmJbUACSBmA0TFGo0=;
        fh=ar8vS/z1APB8Bg6QIH5E0S07Jd/srytHybj8HTIZV7A=;
        b=jBx2Vo8926KHe4wnOCvvS92qeppmls74KWBWB4IsRSRZeanY+DEFyVxdWiuXHmLOud
         kU7NqjbL4eE4FncEgXphFh7LRbUsgKHA/1lTwQkMNkC+7GDjiupY7JTORXkgA4GEmAwm
         VoWD34k8ShMzTWtD5YbxhfyW/duHjgacv73JL0S2nr4t9Y8hD1HW/CbBpHdeNLx61AW/
         +8sIaAZ/rIwT4OdmOIFnspFBwWFMJnPa8Gjbzsk4aIGIByz0MMVrnSQ1bNnsxNFEZPwP
         yGy+6zSCg4TGuBhcdbsLIbNBNqsK4cWNHXxy8hS7Mf2qXF/cgkRsbVU0Ap4tYbJzdcRN
         m68A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780587034; x=1781191834; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzQ2Q92BkyZrcIbCUmXt/htpBaJmJbUACSBmA0TFGo0=;
        b=RQRTOcdqboVvXN7avUAgUwuOuKa6xeHs+osCFvaz0DzoXl/YyBj4mZeyoU8/JWsWfv
         fWP1gneiF7pk6eA+Ah7xUqC7DsVQet9gWCx8Eo77gWaOoqoEQ2AwxSOMrhxV210zZ6tf
         CygAzVjsvSLegc09Uxlum9TyWE8VYd4MCFJWPZfdZdvYi5ac0lVT23GjsTGXGE/veIrc
         EIScbgeCC6Ys0HqGNiVfqsgKiAzGZY9U2z5rTezTIe99NXQKxLsgO0jfFX6oCqKL/DEn
         WRyyql+6U0nQXUq0VQNlR5xfFwB+ubkonb2U1BjzbJ/XuAyBnOE/6XhqwdqE4v6ABaqB
         Sufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780587034; x=1781191834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzQ2Q92BkyZrcIbCUmXt/htpBaJmJbUACSBmA0TFGo0=;
        b=bJOOpqJccAYrj5c1Y4ntrMXQ89lq11JCDPgdka3840Q5JcQx8xv040CuSTs6DjcVdd
         8KlV2Dz0Tx+nzgV1gHrRf2TRfqpiVj2M6H7BCWnn3pigSYXVd2VH1BZgrONMpSkOjPo3
         yhNlR4Q94W2EF221YVA7jUxuqNDP+dp8CnnHwz7VGqDoPc/lHi+bJfcyFPrdQ6NfRsJt
         FLQsTf1e60ti1giIl5kVFykkc7eAK9LsOIhIo88zRmG6avkgWIkbholJTDWeYpLErNnL
         8NtKRPWWLc/W3Yt/ME6R1ncXCTGKpFyEzj0lJnlqiN8VpfWywxLH40xcvGb/2SVb3KgT
         Hfqw==
X-Forwarded-Encrypted: i=1; AFNElJ/4HWG0yQ1YwrP4rXAaTCUfY1Tzf2Pj4aU/rM9e04lT8h6OQH7jkgAOKMQVeVOHMluxUuGDCy1QHr7xF6BKL58u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6L+rhy56X4Wngn3BNJMZvSPfVx0ljNj0F1bSu/ieX3u8ckUo3
	TbOVYVFYE9gZdQTjkgxAeRRofK5IcqXADCYZguTb/8GG8ONOQVvSKbVtponuDORyUJC3j9f9y4I
	iNTXb0Vi5Eml7BwWqPGfFojlsKMm5LHhB4gRolcPr
X-Gm-Gg: Acq92OFFoWn2ZkKeFgCEXyECl9UNHIurvpLxN461RSeqe827gsdy9l4lXbiWYMp4MUV
	LBuGIo9igh1qCPpAbytZrsrbFArmDp22Sp3XvUWjojpD6JMF+DGlssnr+YiKrYyzxXyn7UEqgnk
	vG9i/hhvkfUXW1LhTsJCSj1SZy5ki7NFiKktZ+iHGzigb8nGCO1iTN8TvlrjigY/7SsVD9I7lyC
	M5Y/bmLepDOxghiVguUsKpXONEXGSIpiC1wxIBvmSOmM34r2zL09iJamVBsKW3EKF9dEnTROwN/
	KW15Uq8KeEZWsqWV4wag0jd9yXcfVA==
X-Received: by 2002:a05:622a:1801:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-51787ab8be5mr8370021cf.22.1780587033025; Thu, 04 Jun 2026
 08:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260604151210.1304051-1-imv4bel@gmail.com>
In-Reply-To: <20260604151210.1304051-1-imv4bel@gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 4 Jun 2026 16:29:56 +0100
X-Gm-Features: AVVi8Cc2MXFGX13UgQv8KxsaFbLAfi1SrGkBO6c_9HOxSmMh56zuIxa4lndJTVw
Message-ID: <CA+EHjTwaz1fvnOKOPc94S-vdvMa8JMLafd=ZNJcbdN4AB+6M0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Sanitise host vCPU fields copied in flush_hyp_vcpu()
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_083035_247171_85A50E60 
X-CRM114-Status: GOOD (  12.16  )
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

On Thu, 4 Jun 2026 at 16:12, Hyunwoo Kim <imv4bel@gmail.com> wrote:
>
> flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
> hyp's private vCPU on every run. This series sanitises two fields that
> it currently copies verbatim (host -> EL2): __hyp_running_vcpu is
> cleared in the guest context, and used_lrs is bounded by the number of
> implemented list registers.
>
> v1 -> v2: split into two patches, one per field, per review.

For the series:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
> Hyunwoo Kim (2):
>   KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
>   KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
>
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> --
> 2.43.0
>

