Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC44CE81BD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=; b=ONXbzjqAX/pBNEBPWcxr8YqSBs
	C2WsR1YWw4LG1aYaR1t5/K61feKFh+hi2WFzhBgeH7rg2Ggh6ev3q8xAoqojRbpDJSGHsFOJIIlu7
	+QEES1LueF3kS4Yn7HYx9PirQ3aSU309YOxi+ujH172tUTWFQQCm8jqdl1J/lunoZXmrz/OsJynb/
	3Em+v0tHCTgB+ORbNCjz/VwucUG3BkeuSMLA9w5Gy2Ll2eUKsmnezy1/QZs4T1iAngK6mwH+wKz7p
	j3hbs7EYWremryVbWY7v4b+/QCkxlx+pgS0akDjZhT+f1LfFyIZdEUFdQHuHkKY+kUJKtSrmyMn38
	QUqvmb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT2U-0000000Fakl-0KQz;
	Mon, 09 Feb 2026 15:19:02 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT2Q-0000000FajK-12Ts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:18:59 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7927b1620ddso64526397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 07:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770650336; cv=none;
        d=google.com; s=arc-20240605;
        b=ObPwV0s8gDoF+/0WL2ArMsbSVafJdGkhHeS1Un9hGCXXyqRod5HN04NHtHxHEYR65E
         /pywaD/TtovqKk0KeEnNCqDIm6G4bYzsGQ7Vs0Ms+wcFlBRohlO03M8HlrPxcyna1ivt
         wYjAYf8YiVFHVFp+DuCkBZhOdJEeO2GK1hTdXqgWeRTFUsbXJHsb7kAaGqJ0IYgi6NFg
         jKjRM1+4Wny2/NI1ej+IxUi+nJh+JYxB/mqxIhxArn6bn7fHRkEvEg6/DhHy+dNmTpb7
         U2EGzoiiexFNakVIT84bY7RGgPbJXa9zH0lJDOCtORNCgQ4hlLMhDHUwzc5tKlJCf5p3
         Xu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        fh=SWz8dO1EAe0X4c6f5VJzUs/tlXNQ0mV0XixZvw/18i4=;
        b=WEkyoKGcz5LgZS15lI185K6Up0Ge8t1/x3jK1LOzoG3kTvjIr4Ao/1aCac86pIChoq
         cQBA2zB1hQcCy4b3TWTYiX4Zl9XadU3CGOPQ36SDxV3DVBqGjOC22i30yIl+gnHH4JvT
         s358fmAFwH26k+aBchnabPp8/Xr7XfpnfQg0zU8HTIGwK4JcDRZQ8LuX3I6XsIEoJfFS
         SLMAK2jCoE0DFzl4kwH2ylv6d+6XcfL5btdHSDfynqnCGeWKsdOUVCNIn7+FOzNCV90A
         EPMPfGZvzpQGRsuDyUsxFTA890S/OFSczO0uYC2aTqNwoueLle3mvhcQvZCLH0qeQOli
         2fUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770650336; x=1771255136; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=lqUI7MsIicgfdjsxuGAcOzZGSzs3az7ZXSOTHgf1VBl/H9FKEhKDeRqtsu3wWdvJUz
         eRoodvNAhTFPyIfFZcPgfeA+6R0F6i9TJsOg/6Nm8VROVA/erTmCTtzCDYxyVlra5T2x
         Plf/ZIJ2SlGOYAUN7P4hE2oTAHAGmj27R2G5j4V9bFzPI87RVA2I8P06oZgfbH1piAv9
         SdqnPxU5qvaXE3kdtMjh1x0BdConQ7FX8/vkJnCTVE9hT+XTUoLu9Y8X6u5CuQHtxlNW
         9Nt0zXrpswbZZiaqcaM/w/Z9Jhnp82p8liU1F7fS4/Z+8ilB+ZaSEXcghifB+JNLTyjQ
         WLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650336; x=1771255136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=O/QTvK4z9OzBQFHNe3o/HQDnNQMXEup+Pn+3hUn5/7CRGDDRFunrJMbIwIKejXRmEQ
         S7rBYrwKaXBxMSX/uf0vfHte65TJJnvlDgQEgbGxW/F4KbBC78GbLpjGVdrVkJb/b5Bu
         HnxaYKG2Q5D0ACZDe88e5n9BxuLvSl4PtF7wnJ9yV8H/uQSbNkB/Fr8pQd7JXKp5FmMk
         QKWuyR89wwA2aflluL4MtEr6v8ULCQCXbJpKta1cmhpJ/ebE71PMvmEiyW6zrF2Mcgte
         kNFCCK1zuQfwABL/y9M3oY5eg5CfBCy2sZBlDpcUY1+fXyCic7fcpB+A9HkMth6vXWfj
         bT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtzLts6R7uH7NY6qk72SgujYTj6X3ybO4v+/zcP9vjKzeQt+tNiKb2D1ohcg/+4vTTbkKKNGwnZhl7X3fCGD93@lists.infradead.org
X-Gm-Message-State: AOJu0Yz62U5Kdee9rl11196CSxcGBxQa84bLtrKOvZ/HrIg73K6JLVjh
	n7qnBtjd/ai4ym4sZi5xzbP9v7Zge2OohP4gGRA/CkW2SczUShKaaqzAmO4EZZ54LQ2JNWGzBq6
	Pd6HXIHiFuCOJ6YH23te5B4Ju2toSL0ninaaan6ag9A==
X-Gm-Gg: AZuq6aLdu8nt9PW35cmGr4HUOkxapO0XCMeqWveJ0eMGZtOuBA9SDOzvqClIOHcFr0I
	+mxle4edzpJYXiMk3Js9lrY01tLVtTzq1lAja1ajr3EqpENmQwsq5v0vbH2UMfkamUGwe7aP9O1
	r/veaLlbikDx64G9wHcExPD8soykG1xX/DU/AdZl0qfv8jNSAF1GI3kllilp4s6f0WuYC+pzNlN
	cWDFkm86ISCKIjkX8BjL+EU0CzMeAGCezqTTuNfBx2KOLrFNNzSToySorQMiFponkHwf0X0Tnxr
	TYEg08o6znNqWzPrUCZ1iM/r5Osfs4jM/iE3rMHIWSHdd/+NLj0ssjg=
X-Received: by 2002:a05:690c:e08:b0:794:87bf:76ef with SMTP id
 00721157ae682-7952a63ec7amr99106367b3.7.1770650335943; Mon, 09 Feb 2026
 07:18:55 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Feb 2026 15:18:43 +0000
X-Gm-Features: AZwV_Qj3JfZxsU8iVNrT9S4IUwlHEkuMD3WG7W3HRrHxULDnwFPH-_uH0mM-meA
Message-ID: <CAFEAcA-nhHdwuQODmT4-dBCEuiut-jbHsCGVYByoMF77-UWbCg@mail.gmail.com>
Subject: Re: [PATCH v9 10/30] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_071858_355628_7A9345F5 
X-CRM114-Status: GOOD (  14.19  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME, the Scalable Matrix Extension, is an arm64 extension which adds
> support for matrix operations, with core concepts patterned after SVE.

A late reply, but I just noticed that the cover letter says:

> Userspace access to ZA and (if configured) ZT0 is always available, they
> will be zeroed when the guest runs if disabled in SVCR and the value
> read will be zero if the guest stops with them disabled. This mirrors
> the behaviour of the architecture, enabling access causes ZA and ZT0 to
> be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
> any order.

but the doc patch itself says:

> +Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
> +to 1.

Which one is the intention here ?

thanks
-- PMM

