Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2BBC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=; b=L3AaltwS8oa+uyo0U3LAJe0rOF
	qKL6a/66rRV4lnGph+t5+9FeR5ZTp0YHU2rrGzYpF53+oc48J2bP8dDl3cV8aPm+wR6EbNwDH5wew
	Nh4onZ+TOvk6bgW8/MP9oSLW+vBhtC7ojZiSu/2A2cH5+Q/bwvEvVc9/pZc6ce42DSqqABG8erttD
	BW6jSvDSR2lqVIKNLdlG5OO9+sUVd2avM4edNC8Wqj2TIc63pK2tRmqChSvuCQGX9z/pNR5ixvfZN
	hENk16vvSdThb4tY6CCLVqRzTA4W/RsWZh4WwnlfpEbC9jOk+wcImvPA0ze1NFaE7lsz+m65uiza1
	3h5L0O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jtc-0000000FCqd-118m;
	Thu, 10 Sep 2026 18:53:16 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jtZ-0000000FCpp-3mPE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:53:15 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so9576e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066392; cv=none;
        d=google.com; s=arc-20260327;
        b=WZUou4LkCCHAxJ/eiHcvNf6nXs1JLbk01GEMc0/9L/OfbBwHCEDyjjc1TMgb9EOhh4
         7emFFyHnfa1fQlRemouQiPOnFSJbxltGtgQy391wyJQ/FGo9wtR/jBAh0FJIIBNLyrWb
         T3ItlDiKNAO5/uS0uZR7JNcuEUWJn7WCLgFfHNYd082VjsYhrfSXdNn2ma644oCVZBVt
         24dAaXnDa17SC6HxaxqpA+hgttNtOvffmvUYqUlrDMob6fYF78Hizu9gOTEjAKYyJt7V
         gbUx6sdYasSn0iLllSSCWo4GOVawINgfo0c5wqYbMfu8czJKY4EK7EL/c4cuS15KoD0r
         9qTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        fh=1Ipe8pdf67UQcVSGdUlSgRxlYp57Suymw9VoJp+qQPg=;
        b=KNa0clxquZlng4SucWHKu5ioRprbUtdVrS8En69GJQVznqIqGJ+sUsfb7sbQiz2AwM
         SVqQTOtULt43Bnc9rbtwm8EEVHIkEe+ZPb1nGX+XBOC1ZD3JHBNU7nUC8aUdSZzP/Iu8
         ATkpbldgJtgcrYo5No488ubBp5M9K0jmT2AvW3rqsG/K8q+PuOWAJmEDiO/aVZcOn8W0
         C6bU3k4INJKLslFfRSgpqGGR1Vo2xGK0Yjlq3ZZ4IT+opHgOIQY3QCZBNMQsXqzfbSt2
         OsP4R1THvLN+xjmXdD1jfwMTOc4xBVsRUKwSia3L1JbC8fkM0agxpEZjwFTjQCMTRnpi
         0LxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066392; x=1789671192; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=Ox2Q7vX7N4e+7XcBfiI/zlgXWkg6sCyZFLahICgA6Lw8fusXxgSyuYsZha+BsGBQgk
         zoJAot4l6ws1fIwkhdP9umR3+2oMi6QxylhLQot+2mamsCJRCfnjzEm9QkrUzeZOSinG
         1oTqWHZlbuFgbhVLkXP7QyBVhSK6rkWTzkF/dOjQaYCQ3PbRdxzJpupe5J5Z2eshYKKF
         p1D1C4zWC4FnJ6mhDTOuY/MSwlwDBI3WuTC1jDQHL/AfOoIKWQCij+ldaeaIyKvAgBin
         egHOQBoEOR55Rx5NByj2D8xPybZcsLdCEfYI+w5CYLDC5SGwI7Wo5R8h2L7iFRlnWjdI
         rx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066392; x=1789671192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=ay8l9ptVKJo+bd0MqcUGdshTxPAQ6tvYDjHM+iv3GNEsnGThiW4+HEr0VSm8J57Yg3
         Wwmq1G9rBM5tJynXW7UXVQ3XRP9L+Pe7sr5kUwMsEkCdUwpP5cq5wtBR98UwAQLgxKsd
         t7QbqhD3XmUvVhYrisLIAxl+RZs29/S37SI/XUV3mSC7ZTjTKirh4jx3P/DkGC7JQCoF
         zm5A6XlCWcxvxq3QkPrRJo2rIetL+TPyZGuE7Gk6qBHBMnenOfNEPxoNSLVnNj5eHHQs
         PdenIBg70fukiGonmnuhdmiqheAvBJWU5ZZjtlUVZfawcuhd79Snr6sUU6h2IK6aYty8
         fuWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDhUBQKsOAiQHfAPjHyaNoae8fzKiSnw9hTScjyUltEs7oSXbNBaif9MPrhwO3dgKCkYmG+RSoeXhYdUd7vGWL@lists.infradead.org
X-Gm-Message-State: AFuF++mu36lTCbd+TiO6vWMreBaEiv2Vp3K+/j8PFpjm7OhUEII1XBvW
	pcmFVpczgcAnRzfd3AVSv3KzZk+KT45rR99FLd3twos94Xt01J3DzqSGBL8mGtj4AOZz+usXl23
	dOpE4wByLgA/UIL4Ld/vM2XdANLvEueL5nVwU+AMf
X-Gm-Gg: AYBFou3S/zWPzKM3YYC6V4C10iM874J6sMLOnewqJopqOHFA+++8hdwzsvwti4O6TH7
	ROisT5n/7d4h5Xts7rKlZikLNJuZw2LydS+cX0NEwjxfQ4OnUrvOD4BxoRScVHa6/UMt0/lZ5dO
	9Au/mw/sFupprvPxt2QVghKmvjYmUP4dt98b0hlmbelImqxUjxss8kmF9cy8Ce6XtJpJHWo7EAV
	+TXLN5z3t9CchwCT84G7IUmhqtMjQfIapa1X8nldKvHjztwj8LxOHH9B0dyzbXdCbAj5src42+g
	eVNwDWlhgifQq/uwa65A74K8Hk7H4PNHzk1k7TAAhzoM5r8Z8CTmSzcVQ0FOpm5TYgPbRKkkqhj
	vOnGdSKWlcLotgA==
X-Received: by 2002:a05:6512:4009:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8a07a0e5fmr23463e87.3.1789066391400; Thu, 10 Sep 2026
 11:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:52:35 +0100
X-Gm-Features: AcwNN1XPPeWtd-a0jzst6s0fMnTr0aHfMbhg6rA4kjyMckfbadgDOVe553duj-k
Message-ID: <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: selftests: Enable pre_fault_memory_test for arm64
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115313_960001_CF7B1AB7 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Update the test_assert to compare against the UCALL_EXIT_REASON, for
> portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.

The message says this updates the test_assert for portability, but the
parent has no exit-reason assert and no struct kvm_run; this patch
adds both, so there was no hardcoded KVM_EXIT_IO to make portable.

...

>  int main(int argc, char *argv[])
>  {
...
> +
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>
>         test_pre_fault_memory(0, false);

Would it be worth adding an arm64 case for gmem_abort()'s pre-fault path?

Cheers,
/fuad

>
> --
> 2.55.0
>

