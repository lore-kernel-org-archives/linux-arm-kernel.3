Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E39ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=; b=JHacq1yW/YDAMGcc/KLv9Vx/fT
	LFJU2I2g+n7GgtrQ8g2l8rwhiQM0GIp0vpoik6aLyhw85hPSzmSdl2guhkDmsRM0DiNGR/9s7OWbo
	mLg69Nk2ZthpT5aeuoEaO8N8Cxd5AJk+kpK78u7fO2iw/tltnFNgzdoBaF7wM30Nx5zojNZ7uik/w
	Ao316nAmNOAyRDjQTtptsO5gSQ+PM0iNXSo646Ux/74mqS/qpKjxOHiRsbXf0EuiS4BbHHp9nZViD
	04TRjZy2Wq3Y8xdVL/l5tO0MOkP8lbmgHtVxj3VQT+9XWjvR4Mouu+6A448nu/c+VUq/Hsz0nA8p8
	FQNnYhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcxZ-0000000BdHD-3vAA;
	Fri, 02 Oct 2026 13:05:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcxY-0000000BdGf-0Knk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:05:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5730e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790946354; cv=none;
        d=google.com; s=arc-20260327;
        b=atKcq+4nHObnRlm/w+y99+7kQytR1L/Mm1RNxn12lg/0OJuxIAo/t3jyrZeecl9D6b
         BLvLr3AkZtFRCXtrDQodUPOLrdXDvCJ5ktRY4e7cwLLpxVK0c1L4tEs3Gp2nJ5cDxJQd
         GhCh09ckDYx/2xL5R7F/1iSeeUYca0VWP+Pz7jwcibZ8EfpXdqZ0ys3q250RvdK/GuGd
         6g68nXZHbrpr4c+ePs/7O9D6UZz1kErnzCW3jdVp+pdsLVPzdEb3btYbds00uesJE1L8
         cbGiMtyUFS9vnaniJS5w097uX+Q7p/j+S4XVUf4zcytA8CM5tgHRB7z5T8ltTALPHa6M
         fpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        fh=xB8N7druw9ILpgs0jnWUL0UTnyMckt+vNTT+Hnwu7ec=;
        b=Kc8vwx8T0spbf+WgUW+pe3N2xBGIjRjn6cEFepCVkwSSFT+mx8xYnFLX1dvSELZtt9
         hyQ1o3iCbKqo7Wsh8rzp1icC+dPb1lHaNGfminvqTuQOkTFyrGqM/f6CtJF4JXzZPw3C
         7lv4TBkf+1B3GyjnWe2p6RfAUvp666oJBEQ4r979YIt+oT97r5VxE2SK3Qic495ahjki
         6dLDYAHgHo9ZUR5hmninIjYCorAzuSOqxkqrkGhdW5Ype2bVESg5KQKE9Ep0ruXQEYut
         IsbOyzvod9LS453B1bwoKimMy0x23kyH24LHDGO+WKsR+fG0GMxm6Rk8Y/EOQu3CEg+A
         1Xkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790946354; x=1791551154; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=EBkNM+cODqW9FBIihR3C+CH+fkcfvrQR1Srs9i0GPth0z/AW/XEltCmQ39zvlcMlVs
         XkkID8KodW4UPlocx3LgkLWtZ0l6y5TrMq7JDqiuRqT36tkwz8h2GfGbmXJYcpUKiLbg
         2nGLaL7DSGTgPniCCEQJuJrAShm5OR0LTNwH7PDeAeNCK2kpCqOSd9MxB4cEz62CKPja
         yBZSPAA90vWEn9K/HW8J8Z2UQmY+AhW+Fx5/LIO+eYcVhL5lg4JEIWnGKsv2jrzlABDs
         FdICsRHDTrqwG13RejaiU0NetUkXKSak8w+4ZAJWk4QGQpVisknpqrqihWR75qBrAfxm
         6rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946354; x=1791551154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=KZeSDLnGITbtSTu2ODCfZQnaSjpvZ93zlzjhyp8bpxMlIR717g2ub2nzaVSgVkb3Pd
         4kkLfrc5Cu+2maTsxo1H/QcoVkUrqZvB0fHCLVGNIGwnMVeL27UraHSqAoStjA39wA7o
         5vjS6j8tEJLBYyAvXDkksPpIJ7PDYUxf+UMjxDZKROMm3m8nvQLNst1yP1B2OS0pJ+Ud
         j6Y4Xd3+dlUof+gMpUfCU/K78hXifHMn9Vb0CgO8muVSQdYRLRt8aGUb4hVApvvCDdVg
         OL0zqFy1GvaKos93UQor1S6ehMHXFGZDXg/lBHrX/7NzdUIlo7ogVJSlfZPfRthYIT59
         671Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0o7S1Q338gA0amzdWkb4DVd9PGeFxHYh0Ac2QLYVJhTV7/VPRkYsEp1Uju9oZyV0lfV55PqS42qywFpFbGmSY@lists.infradead.org
X-Gm-Message-State: AFq9FYIpFIN1ttDOmcT5pEnAjjr4t+NqyB9Ql4ANgeZYp1iY3ZDdLnJi
	7uebVkEi7kzph0RNQaWtvW2W+IMnyKJfenCP9Y2IZbFPHu+HM3rH6M+9T+srZ4JcMcaCIGh5Rm2
	AZWabT4U4mo0TFl+LIrSJnGCm2AdTO0+D4X0N0wPX
X-Gm-Gg: AYBFou3tGzd9tPkGBG9dcSqR5IThQQDL0efUrRUXD/bkhDAEBvXsrvA6qyX03/cuBGA
	x9GTZfkRNJrZQdgutV8mBMisVw0E3EXh3laT2oBn5tSo7zydPmDyIZikBb9Eph7PD6YUad6xOWJ
	D53SmJ3vyZHE5EACp5OKou82OACSyJQ8M2gk/yKbKt68LI3bXgZcju9jvV2fqTb42w2/B3Xtz5S
	/6BLp0VaMapTrdl+b8MnAaKQxz6KdubDJoMMEcOPHRa1Thy/BUE1qHtXgJYYSPJYpLgmQsJ/xXB
	Z8UvHWSrNFh9rmZNj0zxRXzH5PV83l5kFjB4ntx+SjQmGlH3I4BaMw+JVLR8zihXRjXECYDo0qY
	qa3FpeR4w9ZPoSg==
X-Received: by 2002:ac2:5b41:0:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5bbe07ff867mr111076e87.9.1790946353509; Fri, 02 Oct 2026
 06:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
In-Reply-To: <86se2o2rbs.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 14:05:17 +0100
X-Gm-Features: AclHuK-8Kjrfe19sfHmKlc-tMXZBvGMWfs-wEUp4fL4Zc1UtRtbnXSXF_N2l_2s
Message-ID: <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
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
X-CRM114-CacheID: sfid-20261002_060556_138769_1FC79BFE 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Marc,

On Fri, 02 Oct 2026 13:57:11 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Just to make sure. Is that what you had in mind?

A diff is worth a thousand words :) Yes, that's it. With that, every
remaining hyp user of vcpu_is_protected() only runs with pKVM, so the
kern_hyp_va() case in the macro can go too.

Cheers,
/fuad

