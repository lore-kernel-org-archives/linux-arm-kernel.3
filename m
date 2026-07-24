Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA08C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1NxEzIyl57DprBUUSOUtSCXB+mtbnXl5Xys+uMdSEA=; b=io5WPnpIva3c2ZEcEwPmDCK8yX
	IydF5FSUMn5Lu0q3ZD9cnSfTdArcZkQGY0s6FmOL9xtsD+hz6CtUKq0sVw1iUeAmTXQZqBSca4ZaI
	PcKJqS1LSRjJpGnO9f5g1o+nzxQhhf6fFXtYA1lZVpE26zZ2tmAsB9P83scydbfJIDcwvBxYd52Tg
	tkrPECP9C+SvALmvyqHR4FVBZZ2qSUUpaB9Se142zfTGM8uNHF+hpkqDezyctgMuq8gqax2/gNEko
	cb385NQIw5kdQ7No4+5Gd5NyP80NvLb1jXeGlrqFZ7il0yhp9XadHYZrKPUPLXo/nrglsrfcScHTd
	i1LY3AWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHTN-0000000Ge2e-2cPN;
	Fri, 24 Jul 2026 15:06:01 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHTL-0000000Ge27-0itX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:06:00 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40335408B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784905554; bh=O1NxEzIyl57DprBUUSOUtSCXB+mtbnXl5Xys+uMdSEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cxS2GECsC1GW8TmvkDKgprdLRf4zXP0KqAMKBACxeJp8x1/CQylIcUMHmeDIHSG6W
	 tInM7iVVgYAv7YId6VctDrqTHx6ySTLJTR5GSKzURLdjlartYvY7R2U6J3qdDdw9j8
	 JfFkhpB3Z9M9ZyjFv8H1Vr8vtPiam8abIcSD156vW8TapLsjIdYyWfNSVXpWEIn/Bk
	 KXH4Hbu9bfDI7CgwTQKJaDxB2kPn2oqppHiFNwHM+0/QQz8j5xhAgPIbQWBGf5K+SB
	 UOTLVI67AIZcjQiM7OTNNgNcJ58WjYx7vV/R9DDVbIoNMKmijTBZII1Xu+9Ln5yXIw
	 URpVEeiZ5/5hQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40335408B5;
	Fri, 24 Jul 2026 15:05:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
 jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
 philip.radford@arm.com, brauner@kernel.org, souvik.chakravarty@arm.com,
 david@kernel.org, subrahmanya.lingappa@oss.qualcomm.com,
 leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com, Cristian Marussi
 <cristian.marussi@arm.com>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v6 21/22] [RFC] Documentation: Add SCMI System Telemetry
 documentation
In-Reply-To: <20260724144430.1440170-22-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
 <20260724144430.1440170-22-cristian.marussi@arm.com>
Date: Fri, 24 Jul 2026 09:05:53 -0600
Message-ID: <874iho8m26.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080559_213668_600EFDEC 
X-CRM114-Status: GOOD (  14.45  )
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

Cristian Marussi <cristian.marussi@arm.com> writes:

> Document ARM SCMI Telemetry IOCTLs interface.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC since it still needs more extensive examples
>
> v5 --> v6
>  - fixed typos
> ---
>  Documentation/userspace-api/index.rst |   1 +
>  Documentation/userspace-api/stlm.rst  | 143 ++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/userspace-api/stlm.rst
>
> diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> index a68b1bea57a8..22daa7ebf78e 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -54,6 +54,7 @@ Devices and I/O
>     dcdbas
>     vduse
>     isapnp
> +   stlm
>  
>  Everything else
>  ===============
> diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
> new file mode 100644
> index 000000000000..e34226b11373
> --- /dev/null
> +++ b/Documentation/userspace-api/stlm.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. stlm:

I'm not sure what that last line is meant to be?  It *looks* like it's
meant to be the sort of top-of-file label that I've been trying to get
people to stop adding for years...but it lacks the leading underscore,
and so won't work even for that.  Remove that line?

Thanks,

jon

