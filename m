Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202BCCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=; b=xBe9eRF4lCJJxQFtDGUSwHB1vW
	/MxtuOTunhEhm3enIjYpscZFuT4+KnmE2Am89S9nMmuYyYo/tKiMz4A9UZnrXsXD5oCGh3sM62PG6
	EHPTYIpBwkA+BC/CiAWaOnD+F34jLR0R3VNVijKsylQ8TafhBt04gOlZxu+3flPgyCAFpu0PUJaKB
	pih7ZFxiujhyXr5GMQyq1I9fO5LyeyNYQLZMJAlRRkGRDdpx0jSKTcubOjIUuyfI5dXllWvdI1Jb8
	bJd/qtNXZq2uvntiN0O9vglqXnZrfZs4VR90Mq7bdzQJmao7tm4/fFdfPapvwviwDJ9mOqLSrrq0Z
	hplKXB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZMc-0000000B6ik-1nS7;
	Fri, 02 Oct 2026 09:15:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZMZ-0000000B6hP-2Vbu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:15:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5ba40832934so4224e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932528; cv=none;
        d=google.com; s=arc-20260327;
        b=DzvcsUz/cHIrjnRc/OJcuyWWHJZv1EfED+bnnWlv6Bwfh+TfVVGL5v7SKBhxpXx8fA
         DEBRw/UOJuZo/Viz8i7tNpPI4kWi/naqceWC3ae8vS6EfDhFrDZsh4i+gxDs6cAgx34G
         b8eCUYLuarSEEnoKDxSXIYrpS1H/Chbv0Q2hmmdy2wQjOfzMY4VAHTGk/3yZvmHAhwVc
         QVhYFjV5wKGmwLDfLyL1bhPk4vjJGYJtjQ5WbkLR9e0cFnmtUOs93ZN0erqPoGSYxW8b
         ZvUaF2h7S+lf/14Y5xB4WtNQuf2mBtXdlMKsHmh1fo/ANWhLsk51IOv1Cx8nxvcMWigf
         ++2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        fh=YD/dsvWzKahuvm4ixTtJSQJlxQgZHyfgFBrN9ep5qwY=;
        b=kIibEyzrEPz6C/dq5V8IXM6o+FKQiUJOvBFF+V3ilxhpmOSQNMx//NOTxzB7sjmGH2
         Q27g239qx//AFSnSir+AzADvS+a8+iPKz7gfkpVGc1FA/3apSq4zGybnRNyrR0rGlf3b
         CTQyy7jrqG8wFu+LnASy/fd+XxVw8FqCOQsx/AxsK07xog9V3P36FyvPdRAYtkJCfXQK
         Y9T+saKFKMej0LY9uNqMZDEPftOJWmYeZiUMwNzw0tRvhhemI/NxubQZAP88g4nlrd1W
         Yt1Vs3I6ZJW7iQLPAzvCYRlCCdyt3IP/DmpO+p+Iz4mHH2PQvACGturuvCeFM4drc0tU
         mr9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790932528; x=1791537328; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=AyAF9aNziT35fIHmi+aMjHxEqYVF5HC2PaRPGsE3xDkBpw9HsYk3SEOmyfWQJeHWmo
         gLABYcE3or89XOvrkky+E0XFm5we+BcZfTKWdzNDhsYo0RLsWHHPJbZ8wOfUuoVfdVVW
         mD95MrY63QTh870PJcCw4QtyiACHJU9143imjGj/xgtV4BQnEEnLAgnkT9W8CRnn8qib
         Js4cXpc+BxKWyx5cXmvw3NwqQLgjDvnUGz80VA0zCxeSKfNfTUAa+UZNafXSzQp7yxy5
         f+IsPicHZ5Q9+6hxiWXxNr463xZN1z3tEdOb3rR6tMsXAEOn7NKvUi2eu69eniMmexIi
         2HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932528; x=1791537328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=u9iOzhwrmpFAjD3LsmkrbyrlM9NR5x687LOs+cVwPv8BFNg2lJG2B23wnBrXkrDiKT
         hPGQTy4A8CUzf9Uq0qXLb+BmWbycYppwzFbM2p2QrFl1N9MO56wsmKMLBKsuXYid1/68
         YuUzUjb6gL7W8MjebShUInWlwOexg4C5+5caxO4+XZkepabERSocBF0fnSMlBRDXwhpb
         hJ9wq54QLI3MVXnzbhtz6+nJWABVdJeRuGGpm6hFMcxA3aixofqcnvtjwyEJFHcf1YWZ
         v0osvMF0M5aMV0p/xXPuBq4lbi5LPsUW3DmzFj6ikNBd3i2MtkcTc+emk3JyLczRV5md
         YSzw==
X-Forwarded-Encrypted: i=1; AKwUvBzwBSxOZMoAwmGqx3vda3kyAcwZRCNhvwprsX92xhsNZOBSWj3ETSaGMS2nBjoAeGI7QhhOEgDMKygXZaDYGdmv@lists.infradead.org
X-Gm-Message-State: AFq9FYI9MUUSNxncwDueLSbm4caN+z3TDmE97c2Xxdws72sqzHAV44pg
	b9SLgxkzocrwIFQ3r/7dm1E/9CsyZSC9uVDT6fSTxxWFLNjz9XY7W0h/1JvdNCmaPteOQ127nOs
	syrTP2Vbehy6v+iSIjH2HFJjUE9NzfA10692tu3/0
X-Gm-Gg: AYBFou3wTd6fDn3FaIHfnTjuNvEcDDn53fEAOKuP4h7P0kFKGGdCdVTySkwqh9305W8
	jSS7ijclFOwOVf1km38aMW7ES3klqIYm5erIUn3+IYu5z4E0OtwWUu6HIXftniOL8x+iYJ/3G0K
	Q7vN+n/vbuMI/fcr1Pq3Jwt6+0mIUfjQ8lvjwZuawV21Trf6E+OObBXFKCzwkPrsgH9rCWdm3Xj
	XIlZfTQDRaP598p57hBkoNjTgO8z2C+2jKOJBwtZ8ohRFYzJZQUOCKnxPkxNwFdpuwHeROHxkWr
	D9ynwIAqPjKs5VWVxdYJxPjcz2uUwdr2fepYHOPxkzdcUnQFBNYx1f1UuVm68DIIenmrIK34oo0
	ZljkSxwSAHpJExA==
X-Received: by 2002:a05:6512:1153:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5bb7c8d2f8cmr108813e87.2.1790932527310; Fri, 02 Oct 2026
 02:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-12-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:14:51 +0100
X-Gm-Features: AclHuK81_w9T9KTmUVQvA6ovuNEn5Udf2ErB6CaTomYP4-WPob3E-hZqL0sp0qw
Message-ID: <CA+EHjTwM=5PXPVByVV75AuNVw5TJRiUqu5TNOcFNPOBmTiL-eg@mail.gmail.com>
Subject: Re: [PATCH v21 11/23] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021531_657690_1F4BCD7F 
X-CRM114-Status: UNSURE (   8.80  )
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

On Thu, 1 Oct 2026 at 22:08, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.
>
> Introduce a local kvm pointer and use it throughout the function. While
> touching the code, fix the missing whitespace in the
> kvm_is_nested_s2_mmu() call.
>
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

