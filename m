Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB6DD2A532
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjxV1GGIN9looIm8lhU6Qg0odw82tyPmLwTXfLVcqr4=; b=UWPUoFttx0AanUa+qdgZICiVQ4
	Q5RKynbhLLs28ocUw8b7fYLndzmxxuz6T/0+am9+kg4Z6hVmirSHcbFf1x01TB4NHFRLOubW0L+hW
	HqPOvK20gSUC+yY1ueCJRvHE7yTcTm31qZAZLhcZbKTrQAnn11DZFIfgDjXmmZGHWXOY2Y3WDDsVg
	oxvvoy3W0WIdnm9sWyBnei7pjA164MOGU7xA0XDcOWfky9g0KgEkktc4PYua80lfqpD3dRM2wuJMm
	azaQp27VVIy9OjxigQBCpjf7AiAteu8kKwtwp18byXsnJJ3dsnhSckbZe9vEfAvCNOuRhMMMdmFao
	m21CsB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGL1-00000008dSE-2JtW;
	Thu, 04 Dec 2025 20:54:07 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGKz-00000008dRR-1eTR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 20:54:06 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7c7545310b8so844045a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 12:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881643; x=1765486443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjxV1GGIN9looIm8lhU6Qg0odw82tyPmLwTXfLVcqr4=;
        b=acUaZWM7TZxm7QJzkaKc61trZyr4RT37K/hf+DNrpXjpJhKu09/uaM2EAd0BuHdGDD
         6+AyUpwecSYKt9/6BQ+wL7vRe6WRvdEuAP9ZJ7h4eJ8+UW0aRbd4HEc0qlqRRiX7sgnB
         STNWzb09PCrVfNk57rCEZ+Bz2wXhUpU2iwLqJcPc1fBCYrYSkYPS3s00LuvmjzuRl5Z7
         2ZG1ow12vzp+21dOu66eMJ/ycjftnM6FFHJcTw+HzQtso0L6NPNtlHtKSsz/9X43Wplz
         7U6mLqan+goeWTgHYWFGdcQITqpnJqcQXQxn9HVRyd6+FRFkMVG9EC3lcVBF5+NHrqYH
         ++vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881643; x=1765486443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjxV1GGIN9looIm8lhU6Qg0odw82tyPmLwTXfLVcqr4=;
        b=EGcf4+r80vmCtj+XaNiyJXH8Vp9gQM9tKcjaQTPlsUsYxPu6NgAz3+9cGbKbR1DY26
         UhHMbSNg49Fap8cyv7PVbStDWAuvgesBZ8s0rrALZPi/lt6cf3VgU9yHsXK+c7jFGCd8
         ZvScEOXgWexPV7cntkEwkhBnite0Pk7OtTNwCetm3QABV6NMwyrtsOMoN1mEoDYmy9fv
         w16Ibdegd4uM+B2nm4FHp7HuU5BwfOhreLWT8xApqWJM0UbD557M8lsh5v/PbwSfOp42
         uwdgnOOhKw6wcCpjtYwSzagM5siRoe7Y2se3TT7jnsaiRwMYy/IfDDSMRusCFwFaQS9J
         KX/w==
X-Gm-Message-State: AOJu0Yz2EjNoK0DZYkZHg7j+JMZ4VqnXWMe67tdM4ze6ISbbeRDI1on3
	LqRpX+QYlYxxOhu68bOiDT/TYhzN+IKAYu7XRBdo5NI/tV0tEMYNyhlx9KyFU70N/g==
X-Gm-Gg: ASbGncuwLxb301zz5dwPSFuZXfsd3vQutGxO2gQl5reMLrT1wm9FRymN3bleoFjCWBw
	weNRk6jtfzo2zoEHQzwZ4mKCRaTgOxdOLKS+fHpCzn4WjmpBUQvRTMuAwyia9+YTR0N9T5KcfvU
	6hqjwgW3YV/ldr0M2DRYTnvgLtXKz6BT9X78sletMqFOfcb+V0F8gN2hsC9d2VGwKkURfsDaMty
	uiSgWYUzKgfv/ayPVGuRNEd5XieJG66phZtssNG1kwSsBHEQwZ9SbKC3vnHfQ2abRz0Ia1AKTDO
	rHqsoC0jtTunRK+hSkj/RM9+YCOU8QHQlGoykDB3RMQJ3Ewt1mZJoYHRrpxm6On2KIDIsf966a0
	LWXS73MU0wQdpch4XSdW8u+n3Z4lFTsqlXOeWyyvY04yA1+7B+kwIUGGexYMCC4oP16/4sjihfc
	rwUpD4pBuwK/rFIlARC0tfu2tjSLeCt57kD4VWIBsECBCR0iSFnNfJnLLG
X-Google-Smtp-Source: AGHT+IFc4WbzNmVwBOO7OsptYXIZilhlzYjJdJRMxyn1AGPFNdJAn0xtmay3Ejl641B+vFs75D2TtQ==
X-Received: by 2002:a05:6830:24a:b0:7c9:5810:92db with SMTP id 46e09a7af769-7c958bc42acmr1961422a34.29.1764881643438;
        Thu, 04 Dec 2025 12:54:03 -0800 (PST)
Received: from google.com (122.130.171.34.bc.googleusercontent.com. [34.171.130.122])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acb0565sm2127096a34.24.2025.12.04.12.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:54:03 -0800 (PST)
Date: Thu, 4 Dec 2025 12:53:58 -0800
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y RESEND] KVM: arm64: silence
 -Wuninitialized-const-pointer warning
Message-ID: <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
References: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_125405_441414_16EA1491 
X-CRM114-Status: GOOD (  13.16  )
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

Quick correction:

On Thu, Dec 04, 2025 at 12:50:11PM -0800, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways.
> 
> Silence the warning by initializing the struct.
> 
> This patch won't apply to anything past v6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration"). There is no upstream equivalent so this patch only
> needs to be applied (stable only) to 6.1.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Resending this with Nathan's RB tag, an updated commit log and better
> recipients from checkpatch.pl.

My usage of $ b4 trailers must've not been correct because this 6.1
version didn't pick up Nathan's RB tag. Whoops! Hopefully whoever picks
this up can add that for me :)

<snip>

