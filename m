Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2343BE94107
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBG9qGfwdN2gzPyM4vrD083y3HoBOEnU7+ZJVK/meSs=; b=1qT6N5I487szef2hFnGdG46V5I
	mpWqYctBBAW7ccem2mCvlTSUPJG8Da2OjNkhp9194Vm5Atfo0V6KBjmVlQIzMX9CfmX9K5BVXPelo
	ac8Cf/dFVOkWXzSr2jdrxJvZbwAGQLxNaDV9JHxSwH5muU9+VAlQQOf8CprHXd0duYxADCmVCH+aT
	tKcQEhMsQ8Kb+oM6ioxXSPdr/R9ZCRuTb/UesgUVV7M6WTb1ELeMQVGit2Od4kyFIAihkJtCVWf9Z
	I8CdaRRJT7ACugxIY4TEYHcjQudW4sBth1sgqBfVDEVp2NhgfJD8bFir9Ot6xJKTcIzARfanoGUOX
	BwBZn/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPPk-00000004Iyg-06x7;
	Tue, 30 Dec 2025 02:24:48 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPPh-00000004IyG-1PA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:24:46 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b0588c6719so9129823eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767061484; x=1767666284; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBG9qGfwdN2gzPyM4vrD083y3HoBOEnU7+ZJVK/meSs=;
        b=tMtMfOQiFi8DlnCXpSj4gC55jyIEuldIHHFuaP3BJe90WwhMYyanIiaVmDNI/26uxg
         7TgJAWlMYnOjYswIGIsVast4s1Rs5py/2F5vIiXxWfcxqXcRXANoDeeCoexc+FJT2y78
         1JdmvnvEEyK9F6EJoZxHn2+sXmGrLfMuycAKmYCFtjgEUBijF3luwp7MjfmKvu9JeqUe
         xgCBjKdUwyPEz3w6ANVlBvmKTJ6XymgpYs3idp8Nruw7FvEMg8kt8TvkPSBBQvtkwO2X
         sHVukgTRkU4AiELnYit1h5FoL3un/kOx3WfgFAfLVmr/acOrSw0j9V7s2qQK5DvODhbv
         3Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061484; x=1767666284;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBG9qGfwdN2gzPyM4vrD083y3HoBOEnU7+ZJVK/meSs=;
        b=Poo1bLa3mLQGjKCmtyGDVhgOYUJhNwCmvEvBUtIgdNwFHPL3sIp6WISYq6JJ3bvzuH
         DUQcq44S6/U6xdO4g452XNHPhWWc3zuDfxaTL2fBq/cLvzpzURqXdotWCkn4YA7Uw1bB
         3rBOKHJWIJZiQ35qb5V4rpamjYPA6KliGrOU44Lq9+EqLKF0/e5jU9X7YeQKwLHA4+ka
         ISQpRyzI1naOmqtoRGSBae9dCLa55ZH7OPDkr43nGfuxaoVRucijdEXErmJ80EW+jwSc
         NPmcV7W5eEMat2prK/cfditqfAp94MpGJWbGH6MKF7VvZVo3imaKoMJG/5vBMUQutg1T
         gHBw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5NB+rEo/Up9J600bl/C64UvbvXoQWKrfAAZFxqtFq/6glPypSBy7p+iEDyi+E6gHsnHIeZA08Da7T3cQmFU3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9nW0MPcLk98n1jJQLgVEEaBE1f/0sjSg6rEN+6Q7sirsfHdmW
	3kC86pWIvNKg+J0jgTq/59ksogYr6HjPomZLv7EboX5/tahWR/Kcy3FkvvzZ5nazdhWxab/N4ti
	3EMQ8UyEHww==
X-Google-Smtp-Source: AGHT+IGuKbBb2lRfg0zkm1s3qWA/FlYtdLZvNL3qHYsniInakt/sV+rfHnyjB/VJVAG4XIo5VyzVxdsJDy6k
X-Received: from dybgp28.prod.google.com ([2002:a05:7301:211c:b0:2b0:5541:d643])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:80cc:b0:2ab:ca55:b75b
 with SMTP id 5a478bee46e88-2b05e6beb4emr39241858eec.20.1767061483570; Mon, 29
 Dec 2025 18:24:43 -0800 (PST)
Date: Mon, 29 Dec 2025 18:24:41 -0800
In-Reply-To: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
 (Justin Stitt's message of "Thu, 04 Dec 2025 12:44:48 -0800")
Mime-Version: 1.0
References: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Message-ID: <dbx8cy3wso46.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [PATCH 5.15.y RESEND] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Tiffany Yang <ynaffit@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_182445_375109_401C138B 
X-CRM114-Status: GOOD (  11.94  )
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

Justin Stitt <justinstitt@google.com> writes:

> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.

> |  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is  
> uninitialized when passed as a const pointer argument here  
> [-Wuninitialized-const-pointer]
> |   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
> |        |                              ^~~~~

> This patch isn't needed for anything past 6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration"). Since there is no upstream equivalent, this patch just
> needs to be applied to 5.15.


This error has also been showing up in 5.10 since KernelCI started using
clang-21.

> Disable this warning for sys_regs.o with an iron fist as it doesn't make
> sense to waste maintainer's time or potentially break builds by
> backporting large changelists from 6.2+.

> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link:  
> https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e  
> [1]
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
<snip>

Reviewed-by: Tiffany Yang <ynaffit@google.com>

-- 
Tiffany Y. Yang

