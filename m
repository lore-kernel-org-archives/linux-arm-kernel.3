Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF25CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 02:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDLRgCmtZofHlLsEzxCeg1mgRHdArtiFGSOrLCvantA=; b=WlqlnNn/KT2uC85Wqwks0mqaJx
	r9meIYGjYPzWeVpemSndllIrS3AJ7VLEMm7oucB6aCVkdKv43NYrm9anFdAIMuT10ssW8llv6iJGG
	sIb+6U52deUrGv66Pw5RR6NTOnhz5h9x2Et+kIoyCz3fezSY6oG9m6j6BVpxGd8Xs5hJkjauJ/vIb
	Zb5tjbREab4XZr2/5o8R2byLHI8oWuX1RPjch8J1H6vm4edsG8I4OGlEZDYABL8RQL1KIfxhknhhf
	ub4N8+2vv3cwU9KU6c2F+N/gmw5L7afpLke/nMoyPs2kAhkz7uxGm1gAFIxCZD6y6WpGc4BzNupom
	FFHWE0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkEX-00000004v0P-0ZKa;
	Wed, 30 Sep 2026 02:39:49 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkEU-00000004uza-0MlY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 02:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790735986; x=1822271986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpumM33xCGo2iOKTxGmSwYJt7A4M/e0v6a/QhZC+xPw=;
  b=s2KPps6pRdktdc1CM/5w2v9RGjlQdrz0+UIGpQh459XXnIFH3UhECH38
   I9qcIPWbqil6CdQquOqS53PeImjjTW6NhIPNAiZvAcwdjlio6dBuyxMrk
   7gXB6C3BpRA6H3MEPkg+y/QfmP8S4ce2ICB3ljv48HiTyzHvkNzjRbHnZ
   EIm4AiZFQgvNZoL6wR9FCv5duc4YGFVNuIDFvWBWQaP7UYrNTXwqU41hP
   LullK/uRJOM8I4SeoJ/JrzI/4bVhL3iJKihdvEYdUJ7gtf/vPyjnct1dE
   CPOv/1J+vQm8ERGMWUxMe9/x7JOcY7DTbbBfwqPHO0qkQvCPmBoNPzZYS
   A==;
X-CSE-ConnectionGUID: kN5rd/50QyW81WOavj0fjg==
X-CSE-MsgGUID: pL62VS2qTPi2DzPl3EV3mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="234347098"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="234347098"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:39:44 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F3A0B820710
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:39:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A2F15C011AD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:39:43 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 643BA1800139;
	Wed, 30 Sep 2026 02:39:39 +0000 (UTC)
Date: Wed, 30 Sep 2026 11:39:36 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
Message-ID: <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_193946_408414_767AF670 
X-CRM114-Status: GOOD (  19.27  )
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

On 09/29 17:57, Yeoreum Yun wrote:
> From: Sami Mujawar <sami.mujawar@arm.com>
> 
> Add macro definitions for the hash algorithm identifiers, as
> specified in the Realm Management Monitor (RMM) specification.
> 
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> ---
>  include/linux/arm-smccc-rsi.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..a83df2655808 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -144,6 +144,13 @@ struct realm_config {
>  
>  #endif /* __ASSEMBLER__ */
>  
> +/*
> + * The RSI definition of the Hash Algorithm (as specified by the Secure
> + * Hash Standard) returned in the realm_config data structure.
> + */
> +#define RSI_HASH_SHA_256	0
> +#define RSI_HASH_SHA_512	1

Is it intentional to omit RSI_HASH_SHA_384 here? I realize it might not
be implemented in RMM yet, but would it be worth adding the constant now
for future support?

Thanks,
Kohei

> +
>  /*
>   * Read configuration for the current Realm.
>   *
> 
> -- 
> 2.43.0
> 

