Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED863C98331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AMNcthQygf8VT+liZ8aNL8DRneL57jGS877Q1EimZA=; b=XogXguqIr2REQBNQLTkglwCurx
	awWg8ZfOrNBcU6FmDRzZWHCjshSOg2XhZ5kresFA7N9Kiu7fhzPz90mLcquTQgnIYvc3FV8U+VJRE
	Xs0SRlh7vGMHs+I0YeAhwMRJ+PImn/tabyawS9aP6G/Xxg/PcBHsxOXE31lOD+MwTdPh4D/iNBmir
	PP2E0bmCtX1NtBRJq6EPwL2lsjc14Qbui/xxa8YL4Lakh/ubV/MhmjsvEvyR8wmEwtwDEDXG8G8gg
	bSb7fki6a9r8+bYFn0zsyDYGaR+Eeq98114JYWM8OhAlXMXlPfUrVZVVXGC/sj4wX6nrc4VAQFCV/
	OXg2wIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd87b-0000000DICB-1Nd6;
	Tue, 06 Jan 2026 14:33:19 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd87X-0000000DIBZ-41ib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:33:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59b6d1b16dbso26848e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767709994; x=1768314794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AMNcthQygf8VT+liZ8aNL8DRneL57jGS877Q1EimZA=;
        b=jIxOQArWOp2eLd8UyMMTk3sBdVZide70F6NImbg+spH+YdtPcKfdAsJ/iP3kUs4t18
         Zsg3Jw9CB0dx5/RZ3YI4UTyz8WA6m77rbyIjafY2/rJNl9Ek0TpnYHmv2jd9j9VM89z4
         6ELuw/0NU9cSPrhvnC5w0x+cwGGh7TTc1pMWsA+6j+peMKrsNKXJLd+rI0bDSKSgTVjw
         yTMju4Of93UVimb42gzD/IVARw3GEj6NRmeus4vGOMQ6ccx0sfm7E4Tl4K6fruvxwK7i
         IvnfQj5qxv7ks+atvz6gLtfmjVBTB3Wo9YXDEh/J+eQxQKn+S2Q+Z2qcBkWteUbTs0IE
         A31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709994; x=1768314794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AMNcthQygf8VT+liZ8aNL8DRneL57jGS877Q1EimZA=;
        b=MC42OiXAAvwWg3pw2PXjf+SFBxsQJIDRcmpyii7MUIjp3NRPUrTss0cjhOmLfeSsck
         a2GftP2zREO/Hx+IzS1S2WnZzNRKiyKxwTdkyI7L8mfDmusU0LbNG9Ioi8b47Xjrxyoh
         zRpDlEnSwdnCHCeoZUZVYdfh3hf52EUkW791eEHIUT2F/uf4HxsZ/kGnRt+JUFyN94EF
         tsrPjT5T+dyt3/kStJtfI+AqF7avRh3A/jPbv56Hb4h7Fn6qOwi8Y5YvhyCVaEnw0/K7
         2f2Acp84uYdQsqlOCJPo40zHVvE2u7m+hY4wJ+WeZhOXaVwdBnmI9aWKkxm5vg+TIiOR
         qi1g==
X-Forwarded-Encrypted: i=1; AJvYcCWddRBIS4jV/yQWomIoOip56ykrODN31jaqzFD5nSF9cnvSx3fLOpgaVBxiG9xVZLiSq6Yn01BaOmfCJKfY0Xuu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYUhffTZUnqLazO8UrXnXImN4tJAm9TNulmrHh2aJywtV1bVGi
	fyGZ7nG58sLTYlCeOVRD1hWvZuOa7tyG+pNGqmQpnK97mqFDdSvHdjld8GTuHHe13w==
X-Gm-Gg: AY/fxX5S7D8ZU2IPn3uM8kLR1o1Rmv3zhBGuCOkTq9pL3N3v3FL1+SvRLNa2D4J5DV1
	nQL7nUdCDkKUzmEv2oYhVXEk1s4RMvE8VZff/AllYTupQRTSGOxjJARCdq0ziBKwICTBs8HI7u2
	q41MvkKZhXYu1OwBzFY/l10Xbs5uF+ScHyRjI2KqjW6RhezG2oJDXJ2ArEhGYwkWlUejYYWWCl8
	WkDJKogkXCbVy0xqxeMHq4mG+LhxbOrkTR6tZD6suYKan3BI/o0n3O2SE5h6R5JBxXMJDGyV+WH
	/lTdGBuq1VmolH514R04xaWO4QgRhkL0qvZN8FEkqw6kJ91v+Hjn8rJaPkU+k4zB69enC4s7sN6
	cc7eMezk3/s26Dnw74kvTCyRjczoDmRlNTXq3+NoiZFndfedJQ7FL+8gh6JuE8cQkl33zKZlx3R
	uIs9Rn/LfIyvzjhgUBSrKu5Bhk02MvHtQ/6R+Nl1cRkyjIALyovY/YYdQjapw=
X-Google-Smtp-Source: AGHT+IGm9/zDJUuH0cbylnpYxHdBnRrcu5NEEpA7nyYc/TIusHsYonshe+9LSiZdmjF0EBhJvVNLEA==
X-Received: by 2002:a05:6512:2383:b0:594:5685:94ce with SMTP id 2adb3069b0e04-59b652cdc1emr1192679e87.48.1767709993734;
        Tue, 06 Jan 2026 06:33:13 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d69745sm602189e87.83.2026.01.06.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:33:13 -0800 (PST)
Date: Tue, 6 Jan 2026 14:33:11 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 01/30] KVM: arm64: Invert KVM_PGTABLE_WALK_HANDLE_FAULT
 to fix pKVM walkers
Message-ID: <w64q53n6zmhub2fbpiloaha7ipydxl7albqvqerpgwxfcfkgpi@a5n2n3gule3h>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-2-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-2-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_063316_014094_BDCE2681 
X-CRM114-Status: GOOD (  16.70  )
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

On Monday 05 Jan 2026 at 15:49:09 (+0000), Will Deacon wrote:
> Commit ddcadb297ce5 ("KVM: arm64: Ignore EAGAIN for walks outside of a
> fault") introduced a new walker flag ('KVM_PGTABLE_WALK_HANDLE_FAULT')
> to KVM's page-table code. When set, the walk logic maintains its
> previous behaviour of terminating a walk as soon as the visitor callback
> returns an error. However, when the flag is clear, the walk will
> continue if the visitor returns -EAGAIN and the error is then suppressed
> and returned as zero to the caller.
> 
> Clearing the flag is beneficial when write-protecting a range of IPAs
> with kvm_pgtable_stage2_wrprotect() but is not useful in any other
> cases, either because we are operating on a single page (e.g.
> kvm_pgtable_stage2_mkyoung() or kvm_phys_addr_ioremap()) or because the
> early termination is desirable (e.g. when mapping pages from a fault in
> user_mem_abort()).
> 
> Subsequently, commit e912efed485a ("KVM: arm64: Introduce the EL1 pKVM
> MMU") hooked up pKVM's hypercall interface to the MMU code at EL1 but
> failed to propagate any of the walker flags. As a result, page-table
> walks at EL2 fail to set KVM_PGTABLE_WALK_HANDLE_FAULT even when the
> early termination semantics are desirable on the fault handling path.
> 
> Rather than complicate the pKVM hypercall interface, invert the flag so
> that the whole thing can be simplified and only pass the new flag
> ('KVM_PGTABLE_WALK_IGNORE_EAGAIN') from the wrprotect code.

Reviewed-by: Quentin Perret <qperret@google.com>

