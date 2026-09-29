Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21528CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pzOtnEI9QGF7Q4KS7u8yKxdrrASgPpmPOvOAsDFo0U=; b=c7Cv+qws9kFRkVpoNCwWEeq9Ab
	6G7e62Uh+aic2OJGWLy396b1cl+Jp6lZDBURiCLko76rffZu6/pi11dpT4CLzdFbKHRJ3/ZEuZgzB
	J9prYRvYmyZ4OAA4/3p53SJfp3uXB8oX+vvNUleQZahSdGR5KMg2Zwec3FzVv3mSkSd0GDTyG1D3o
	k6qzAAx92i4dyS37mPCCZ8WRK2KY0EoDIeo5dI9HgByL0JI51vcSdp4jIhfk8+9a8zch+oKGccbjP
	GFNAZWmHnxzsfabXJZop2kZVP0zRRVut7TLkg/gLF7DCvZyznWJ1QPAL9SREo+xfzWIqYsv0x5OsZ
	dCnHZzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaN5-000000040r3-3kqA;
	Tue, 29 Sep 2026 16:07:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaN4-000000040qq-1m2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:07:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 961E36022C;
	Tue, 29 Sep 2026 16:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8582E1F000FF;
	Tue, 29 Sep 2026 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698077;
	bh=8pzOtnEI9QGF7Q4KS7u8yKxdrrASgPpmPOvOAsDFo0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iuj10jRjnyL5TZL08SdpWIdpltnEIv5kzNn3L9xHYBwB8CORDJyzHVaiJrsHcWhLB
	 uKRHAB4I7btnc3Fua8+heVnjM9tQGAYNrrBrXZ0ns0M81AZwrKT23me9c7ESJ7hkrE
	 8I6DG4OeGYF/HxkV32fyzqbgB7cVyRhWjY/hotxkYRCaIcXG+L1RnkPH1K/yTDQ4l/
	 9hU75SJfi5UgvsveZYmMm8LFb1GXACwDQtP42SIZYMnO/kEOaDEJGuXUpKQMNzS0wm
	 6NsVoK9PW76uHdTp7VTgSrafGVikUbcneXTyZigwUezktvjn2peOIV3vxYYkzxSd8C
	 3Uf+wlmPHDFtg==
Date: Tue, 29 Sep 2026 17:07:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/11] kselftest/arm64: Factor shared signal handlers out
 of fp-stress loads
Message-ID: <arvhSiSpGXMZH5D1@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-2-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-2-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:42PM +0100, Mark Brown wrote:

> Signed-off-by: Mark Brown <broonie@kernel.org>

Nice cleanup! Yikes at that duplication.

Nit below but otherwise LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
> index 183e9d319b65..d92a755837ff 100644
> --- a/tools/testing/selftests/arm64/fp/Makefile
> +++ b/tools/testing/selftests/arm64/fp/Makefile

> -ASM_UTILS := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
> +ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o

NIT: I wonder if it's worth renaming this ASM_UTILS_LINUX in the previous patch
to reduce the churn a bit?

--
Cheers, Lorenzo

