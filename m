Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F027CE9D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg9Rt1HeKklkA4y0U78VeQ93uQ/qnZsmQ3EenAnRpxE=; b=QuSLtroox5SsHJ7jiBpHIyc0xN
	pmdv1tiONzQDQetA6NCi91oi4bQlyC4zIn18JmbjBsd3vZ2LzbtYsxa3jW4Q8TQlRxOWXKg4rU7np
	A5PUX+AOSzpWszot5n/QHUzWuOhjOnKtTBkY/ZgmgF9dmIuZhs+wGCoiWUgaarIZAQKIoMlTmxpJY
	7wk+Cy6guHC/Fy9USdp1MWWZ+s3OGHrQvl/wx/QV6XoppDvKhUPtXoDzhcG+R++C6n1dBesw4Bo7b
	LdJmvrNdif+8wwspvm2YWXLvFWdduIA9hVcn+j3CC4UxXYT27LyWWmWDQ6V9ou0R0nxlvOqLwRbYO
	ryevF16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8F0-0000000DJ2P-194q;
	Tue, 06 Jan 2026 14:40:58 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Ev-0000000DJ24-44dA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:40:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59a10df8027so1160415e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767710452; x=1768315252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lg9Rt1HeKklkA4y0U78VeQ93uQ/qnZsmQ3EenAnRpxE=;
        b=yjtIIBcvBcZsPa0z2lE/vrl8x94zZam88vBLwoBHOCy+8HVOnmmpAOllK0TFBhy0RC
         SuTvfksysGYu6m3jEmwVjKBaNOPEeje3Y00klS4GATqIVTigS/a19NsDKJ+Qv1SzgINC
         ZaZ/Il4I19jSrpSS6d83wdcZsy5NtCrovVfNoD5nRXrL47fwvsL/jPGGXoHbBrqhy81P
         il/+CVneBsxm2jJrCnV2ErgyPUmcMAFxTXn4qZcwUibHrdb1BzGYCU/nT6nh3zXO4bdz
         tV5fN7aLjLdmMA6FoNWB3OSImvp7mS2EDlfKvZaFWN+KaTXO0ugCiFcJu5p4BYNtCdlk
         bBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710452; x=1768315252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg9Rt1HeKklkA4y0U78VeQ93uQ/qnZsmQ3EenAnRpxE=;
        b=mAVQmav8Vt17jE0NUTV9uKf3YHX65A26VK9TbwvgbRbN/e8Wwx+q0S4Aw0OSefroXQ
         RqMTVvkHE3A9pbOx4fZJxXkAYQwvcV/5bW8C0TcvmKEpQVnTSNju8sSo9D+XoImbz9BQ
         Z4+kLb3jKFjydsGot9WD+X/qB+pCHBWQEAQIQJ8R8dCZUTKp2N8o6Eo9xP2peVripTDo
         kU4YLasuj32kLeludNZ/q64BPGEMmY7/YI3tTNGXpW6PNJRR0c+AJpCmKbUZPVFhzgEy
         GwD5ZBq1fuBGZTKYsy4/o4QV0MNWaTg9QHV1Q8/47ZnPeIhfjM9tqXVAfTZ0H3OILcb8
         8mxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtXdbhE3hpAwVDbB9CHW1TTMUBj77EDlXSyccjCCOVBL2PqwMxYh2sgUqW6godDiPnNJ5ptP1dCu51c7809YD@lists.infradead.org
X-Gm-Message-State: AOJu0YyhEUX0xC/foxFsNBHfJnSZ2RWGb3aQe0JcPuhD75EHzGbc3ubh
	eQGh+FSQt8NcIoJdwEg/GUViS5mrKwvMycVpfp1GmImO9GtUPwtq1gMVNhvwqCCdMA==
X-Gm-Gg: AY/fxX74X1A7mYJnYHVrBDGNi45vegwh4g9oGQJjcZCjDZhpOxUDXbw7SOnbn2pj2px
	sWXg8LQJ3NnILSzIVCBu3z+5YHxhdicbss10cg9gXZhLs04AHk9wg3htlSJY7Bd7NVqpKIrW/9j
	7iGnqVF+LCWWimIfthtA2HYsmJl1+Xtj3ZFcEmMYteO1tQbzsAcEgpVXyzmZowaT93VGJ4QTtwn
	Bf5ra8LCbNn0zoqKlyyAzQpOzQy/aWogvVVABM17PNP/ihCGyq7ehq7IhShmpSjphMfFSgj8RdS
	6wa7eblTA9zUmN0z1jPRN0NHJIIsTB7w+gaZqaHWbRTwZYrk64/qw5yCGJtno4uScCN+l2ZzVaT
	CvpGe5pbwFYxAlVnUpXwl+O2tzMUtnJKZl2cc3Y9ZKfGdDSmMNgy4+ZDwb3K0hKdlMOy+i9rkaM
	Cg8IteqEldE8yfBycWJMccXoI04/9a539Yo1wMep37adhs8igU
X-Google-Smtp-Source: AGHT+IGQmMYGyg67e59L/Ani6cot2XLoJXjG2yxRGQlWaxQkbv8b63wrBDjE/OQoVm5vCXoynokutw==
X-Received: by 2002:a05:651c:12c2:b0:37b:97ae:6728 with SMTP id 38308e7fff4ca-382eaac9c78mr9558871fa.34.1767710451570;
        Tue, 06 Jan 2026 06:40:51 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a0046sm5577981fa.8.2026.01.06.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:40:50 -0800 (PST)
Date: Tue, 6 Jan 2026 14:40:47 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 06/30] KVM: arm64: Remove pointless
 is_protected_kvm_enabled() checks from hyp
Message-ID: <cokixmkyotfs6ts2rqn4xa7iseno6hk34eon76raujupedgsff@hmkoakf5kr44>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-7-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-7-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064055_787354_D169F717 
X-CRM114-Status: GOOD (  11.20  )
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

On Monday 05 Jan 2026 at 15:49:14 (+0000), Will Deacon wrote:
> When pKVM is not enabled, the host shouldn't issue pKVM-specific
> hypercalls and so there's no point checking for this in the EL2
> hypercall handling code.
> 
> Remove the redundant is_protected_kvm_enabled() checks.

That made me wonder if we should further divide the HVC space to have a
'pKVM only' range in addition to the privileged/unprivileged split, so
we could WARN in the core HVC handler in the pretty unlikely event that
we take a pKVM-only call in {n,h}VHE.

But yes there is no point in littering the code with is_protected_kvm_enabled()
checks all over, so:

    Reviewed-by: Quentin Perret <qperret@google.com>

Thanks,
Quentin

