Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53CCE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2dYj5Y1qBZA90BsH2TSbGZFTLu8yxuGwSmgwkAGjIM=; b=uok0pmSBzSg/OwDmS2WLDOIKJa
	go/z6tLEjbq567LYbfBM3y6kmkUKNj6CLBIeJv1feNT1WUmDaag6g+a7B35qazBCpChAyVK8Hw7rS
	oQPSYCzSAn5Yj8wwElDjJpMmOSmDIKNllwzFKZZKJHSH/Q5sb5zUDQ9FM5+rhHGenRAeE5nNEpyEl
	/vhzJ2Utftmpe8QJz9+QPga+pJxx367SVhci4Hf9/Jb9ZziQhaPw0+nVpIoMe6RL7+3mlfsUjwnzI
	uznlPOx0eSdVX1k0Jwz/QpH4Kdik5Og7cFCHEfnZeWWCoHhjIqpRg1RQBYG62v4EqbSJOfS50hnRY
	X0X41X2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYrE-00000006r0N-2Y8b;
	Mon, 09 Dec 2024 08:11:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYkD-00000006pBh-1MpX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:03:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434e5e71a08so70815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733731431; x=1734336231; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u2dYj5Y1qBZA90BsH2TSbGZFTLu8yxuGwSmgwkAGjIM=;
        b=R+9BHpBWBOtRWyephb5JuLlGeSsq/ccODOrgqvLYDzyHiWyGerrijWxhQuu/bbmbuL
         GP6aLXZtZNPwsIDemAV2orUxn4y5DcsMvYRPQkmZaukc7YFYuZyA9j+3i1u2PvcFR1ds
         BK3Q4PVtUBbHqxmxDpTg8aQQgEzMV6PHoDHQlW/kNfo4T4vynPwNPr40DG0XU5UNmlhK
         ZqcYgn8bPTGwWy3db0PdjyL2DDRzPSBI8xPFWlVrE9uou/Vvp46Q1s98v8r7bFhDLbpP
         XHAyz1EmHkuxpT4KjPCNFX0g50o2U/ZEjpOXQku6SkNrTHntH/2AYIvmvILOUZERsVYH
         9iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731431; x=1734336231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2dYj5Y1qBZA90BsH2TSbGZFTLu8yxuGwSmgwkAGjIM=;
        b=itct3xh6kAL2wagJ8yRHDiOTgO0M1GMAym3B78EbV1lYiHPgKQyztrY2uSSUlKabIq
         iTnhIwHTbaj1aHNZ+9BusCtckoE2F2gsqoTV5janrznU5dxdfUKh5tOUH0/Iv286zBMY
         2tOviPIMIExhGe53mDdlVm/j/inKCfnjoa+uil2Mf1zSU9Rq1R2AB00pUGdNGLqEkSKH
         Jaj5SniV7fRhpkv+mD5dMlJdR9Eyuise1T+ngh78JjF3KvmY5NJKGvt5DQzKZ/wKlzem
         6uxrOwtWIiGuAv6cgoUIahpvYcTm7EA9bRZm38x68vlKcV1TvH3QF9uKyV/kn0TeFIWv
         NidQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJF+NKhVyzNfRxbo5+tPxil6dTptihZuAZp4MUDtSI26fbjIBrmCksUOchxZH1Jbl9CozkIUEKUIJEcuk3bvHE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7DcQsBYANTrBVxS0C6IV8I5vFKNHxWQ+9TBq4uPpEhlilq0u
	wQv+IbvWiKklF6YWbTezcAwkrNCnxsYDyB6FbdjnRyGlnIalebkHo81+oYzf/AXcpkuvTOzIA02
	CzlLmIvN6iQOQtALm+Lrh8mK23Asdd1Dpveic
X-Gm-Gg: ASbGncugUbbOO4KEtJ/sc8rTHvCIs2DxQhYlmNnqRRbyYgex4XyMpA3I8Aem5pLSBOC
	tIWqmYzQ1v2Oi500VNBv1FfuRRbZFhw==
X-Google-Smtp-Source: AGHT+IH67eWORsr+jQiiZGauYOoVdBjdmBrCOiv6ZkJPLXQX3gVK7771Zd+rTsGuMSZ+nHtM69u6cyCjbWXgGjzcgm0=
X-Received: by 2002:a7b:c8cd:0:b0:434:a0fd:95d9 with SMTP id
 5b1f17b1804b1-434e92d5118mr2174695e9.5.1733731430538; Mon, 09 Dec 2024
 00:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-2-tabba@google.com>
 <Z1MihH-aLq6lTccm@google.com>
In-Reply-To: <Z1MihH-aLq6lTccm@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Dec 2024 08:03:14 +0000
Message-ID: <CA+EHjTyqLnXmkBp9yKGES8XXgChb6LNHS27uK+5iEWpSOU=iYg@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] KVM: arm64: Consolidate allowed and restricted
 VM feature checks
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_000353_362666_833B536B 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Quentin,

On Fri, 6 Dec 2024 at 16:12, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:28 (+0000), Fuad Tabba wrote:
> > The definitions for features allowed and allowed with
> > restrictions for protected guests, which are based on feature
> > registers, were defined and checked for separately, even though
> > they are handled in the same way. This could result in missing
> > checks for certain features, e.g., pointer authentication,
> > causing traps for allowed features.
> >
> > Consolidate the definitions into one. Use that new definition to
> > construct the guest view of the feature registers for
> > consistency.
> >
> > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> > Reported-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> >
> > ---
> >
> > Note: This patch ends up being a no-op, since none of the changes
> > in it survive the series. It's included because it makes the rest
> > of the series flow more smoothly.
>
> Is the Fixes: tag above really needed then? It 'risks' being flagged as
> a -stable candidate, but should it be?

Makes sense. I'll remove the tag.

Thanks,
/fuad

