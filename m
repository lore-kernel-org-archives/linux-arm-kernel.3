Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68550CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cR07XDjlS+wXZUNvs0UUZjGctg9E4/1xeGtGHmHDoY=; b=Wg9aCHwZOWjqQ53k2dnVTmrxgc
	4wWMkPzZKD/kCnmgMEiPZQU6ji/2Ygwn4MJZYn91hJK8pD2RFh9zF+tjeSm+k3xcHJdituRPbcBxk
	dEDUHRvWT62ZMSPM7OPr2is1AMTSQxLNhSzxMBajfWOVBqsDdNDCNrvHJgdMf7QJwAUMueCkT88yU
	N98mZMFatf/P3nufk4Flchmxx6kw7l67Xas8d5e13A64M+Kl5KmgnzB+ocFaRXOpnQDlOKFTsS5Rg
	26gTib+0eB3JeyRcCaHrr1s/7ZlTl8H1Ndln1jfzmGAYdt7OoJdavgl7KFxNhUWW7aiQgMmwQxO1O
	nFY6CuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38J-00000007ok9-3vZc;
	Thu, 21 May 2026 13:08:15 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38H-00000007ojG-1Rtk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:08:14 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50e61648f10so25331cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368891; cv=none;
        d=google.com; s=arc-20240605;
        b=gfmcXgySOw6S8PO2stDk44nggXqu3zuOjhxtpBL9ICpZv55A2WDPyOUuX0N5bHZndm
         /spxQ/PZ45ERFVeGl9Has0tlZJzGEmObOPQopPyfRaaef5Ah9QMgQXfidWY9O1l3Twg0
         yKag8ebDT8bqxVocouiCmkugYWoYk5aysiN23oQejyQv3bwnGeUUqAlRGx4vXog6GMXl
         SRh3s1AIO9P3VLKt9CSzsDP5mhwR3LTi/FA+mIEp/CLLa9KyL3ZBsfxXTn6Q3+FEaKyT
         ELIzxtOUrHNbw4ZcPDET0GbuW0PHffDKzRdbyUC0AcI/MPBSJWENuITizjINL337q1wW
         NN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5cR07XDjlS+wXZUNvs0UUZjGctg9E4/1xeGtGHmHDoY=;
        fh=US1h0sqiWnWKriwjdIOgFSEhCS18DR8B7gIkOzsggC4=;
        b=UEOncZml2EoON6hEtSI+uNn7Gw2Tkb+BBdyRN2vTPggxnwv2WczrB6YWBxp9vMHqiK
         oCX3kh9pu2zgfBFBIv4pWHfEp0qEZP9pvkZOETzXn66HcOeErAp34g88cvvmkSprvetL
         aw3wD+R/OCCNrK+Y/ZkLEbjaV72m/CfnhgMou/DB/LAta6d3pvd3vuTf/suqe2NWK2tP
         tzmd2mVRfTvbjlmmpVrdWxTrZzcCz1oNSScK00PTBREgUW4CC1XQIrwdUs/9Lse/JglV
         /OJdrS6UgcP/d53t0fGZbhuJEeo3ZjeBW34X39QLiGcSHLUau7UKf6jRowQivx+nqDLg
         3LFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368891; x=1779973691; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5cR07XDjlS+wXZUNvs0UUZjGctg9E4/1xeGtGHmHDoY=;
        b=t5cVw/fe3/VUeMyxr6Mn9EKfKqUm9+FirSmSwIO6UJoYLVtMcgUqTz1+13LVzPWe2a
         m7ivicbUnt9251asIjbXf4k6uw+tUVbGFI81WZH6g0W5cScMFnYB5CXyp239y7rZ1YNw
         BZZ5z6hwpaAWSfgyvLugGuGHq+fzPmb+VbuSMAeZNzZ7CuvL0q01zr9LR63Xy4g/AbJ4
         IieNpnYc9QSyb7Qgl2w9R6meQQDJQzqmird7c0KqPl1o7bMsEgEuDxb5X56BOlDkxUJu
         knS5nn9rjCjPDWTtwo/f898H6eart811wNswXFb8gpBDMDtoVw4NIZ6TYKt1ET/9Cqnf
         VIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368891; x=1779973691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cR07XDjlS+wXZUNvs0UUZjGctg9E4/1xeGtGHmHDoY=;
        b=AFIC8nTWIrORNViPFY/uZxHQEECeeNzMwTsNZsU95HBZ/5y5xcm7DxIT54KwbPigmx
         LNYrnL4UuJAqllfrDPi16H5h/6Mt/MyrF1KPb2p2FMyZX66fEq6plFQwROjToSYPhH6W
         gHxQEnD37Nd7KjEEeOug0yVChhHcXQed9MmnnYGsuXxELotn8YL+9zQEGrpW7hMsketB
         zK5OHAuTajonvNsr+tRMXwvb/gx0FZvyx5omq+zpquTNdbsRetlELl1+viBJHY9XcrMU
         BupPigGPKoL9kF0mQeotnBWyk0TgZJ8ryJhr1XAEIvIcbQL8LX7m+ev8nWKpCRbmHbdH
         0JTA==
X-Forwarded-Encrypted: i=1; AFNElJ8eTdPUh4nyvalZmhX2lVShnvAPHkFUhZlxxF8en5hztfhl+AN4OK8YCx12p4LIyjRdBmaGiRMlAJtsmQ73e3yj@lists.infradead.org
X-Gm-Message-State: AOJu0YwGu++W6b5yNnuKwxZQ5//0X7wWhODXGuvXiDITCJczQWQ67VAU
	cg846B3QDo8ysZLjKRUTqn9h878h0rjzqPwVgXa2+WURhbQHBBGi5gYGEC/l2P40ty90K0DzvgO
	D5nmeRLMItHtcD7S+9VqESYXmtOIkM4tsZMkOtbJE
X-Gm-Gg: Acq92OFHzaK+OV1+98IBzkz6KLCFuRP8tk2JbFKrqQ7VgkaZd+5GeuqY/BAfyt/UmcH
	y90meI/oXtPTgzPyc2SzYWf6YRR1PzL14OrNrEFukf8cwQYwfX2RKvPkFHQUZranzIvv9T/Z/ph
	s+FAYNjcWw4AV8cuJbJ2+zo0HeZdmbW3+zJ1W87RwG07ablPMve78VazTlTZLA3FtfV04Q5Clsm
	dcSVe3gcmIoyQEdVMq4xM6o6hlA27jrNxGtQzdaW68temjw6y8R8F6V9Q+4liXeON+G3RpB9w/l
	iKwQOoQkyTPUrzsbt/0=
X-Received: by 2002:a05:622a:5147:b0:509:15b6:f6a0 with SMTP id
 d75a77b69052e-516c533a032mr9304301cf.6.1779368890494; Thu, 21 May 2026
 06:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com>
In-Reply-To: <20260521102149.804874-1-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:07:33 +0100
X-Gm-Features: AVHnY4JIjf2uZYHmJ4dR6Y-DYOh1okfQ1cljWLx4X95PZ0crH8aSvwnk1-SFv8E
Message-ID: <CA+EHjTxWp_NB3p+z-iVriSKq1iAd_CwpBVUprO30G36X2ZJfdg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix __pkvm_init_vm error path
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060813_390608_EF728228 
X-CRM114-Status: GOOD (  12.53  )
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

On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Sashiko reported a potential refcount leak in the unlikely case where
> insert_vm_table_entry fails.
>
> While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
> function doesn't allow leaking refcounted pages.
>
> Changes since v2:
>
>   * Proactively init hyp_page order field in hyp_pool_init
>
> v1 (https://lore.kernel.org/all/20260521081250.655226-1-vdonnefort@google.com/)
>
> *** BLURB HERE ***

nit: missing BLURB :)

/fuad



/fuad

>
> Vincent Donnefort (3):
>   KVM: arm64: Reset page order in pKVM hyp_pool_init
>   KVM: arm64: Fix __pkvm_init_vm error path
>   KVM: arm64: Add fail-safe for refcounted pages in
>     __pkvm_hyp_donate_host
>
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 34 ++++++++++++++-----
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  6 +++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++-
>  4 files changed, 34 insertions(+), 11 deletions(-)
>
>
> base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> --
> 2.54.0.746.g67dd491aae-goog
>

