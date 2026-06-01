Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E6ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=; b=dXVkhcj6B5obUj/F72PCrQJR0y
	zVfiCldC7JphfrqcFK5g+NrlkXRe7CVbaQn2VZYkzZMV2+QKvZmoStz6X1DDntBv1qxoRDUu/hCSp
	tlNrYDUxZvTR5Tnw2ZNLCfnbdY6g5p+tYdHRKWbXaOzAyrB14PoJ6C0eiqbWGOzuWODgcqJd64IVJ
	1HxWims/sviEtj7+K9JWpyPKResDvbpjhrykkdJ4FEb7geWuvz3m2IWHWxjIT6BAoJx+YtsURiTMT
	FwgYDChNj+ity7lbg4o4ia4Tog8DZX6o0c2HyzHd0uPJlFE90O9e09kA9Fs8XwDePanX59NjKmLfc
	zQJJ+vRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3qe-0000000BIu0-1qLv;
	Mon, 01 Jun 2026 14:42:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3qc-0000000BItc-2YNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:42:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf125989f2so27391455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780324953; x=1780929753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=NSDaWICuAZkM+Ol0l8Sj23gLI/jPR0BWP5iVtAc6dZa1MDucR/xaDKlSL7e8ccIeqx
         7FsnRs2IqSIrbJeWHWoEmgMb6s6r5YVtpOGYwS6rufHx7/o5ks9cGpPUJujOhoJTd+Mz
         IyLl5YwIC/ht/n2Tz2LW8hVyyzmb4XbfEYrSmYkzUdoWcVrXHbmLUSx3JAhLlg0jpQwX
         tkGHxMI8xKqqyKvbDsFt9JMg2IBD1HoxOApwZZPYaiSq5Fv/kQ8MIagrhPAqMJv8Lagr
         20Dh3iSuUbykRMQ0Zi/ZzEjmZC/33aKS+QgdpgP849LrFHbusMrGFxk8+rYtEpAGvPVD
         ez7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324953; x=1780929753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=rkCxcqj3mE6JtDm7uizlcRkF911kj3DnTjcxYn7BIm2SWBepAIo1iCrKG/0pmJJOGP
         HjRSBK30ZHp2V80njrC4cLZj8Cka1cc9j/gSSPAuftgn11CNhJQDz9ghHxK36gpKnytB
         vqDPKcqcZ8UF0T06oyC9z4jP4sWfpEgCTWrgSrQQt7pGFHr/16GvEHhOTBubb6SwIAMA
         dLoALc8qIEhv3sra0eY3yIoZb1wNEtnLf9JF/SOdYHZXoXK/nrIL6qct1FYnsVZ8ZBQ4
         DRkIacr0YqTcJGHkUL4FixiVNujrj/PthbpnvK+siVfkxnvCxgUEUpGtple8yzw0T2h9
         wrYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UavEMLpFGgplHtB84WoElHyJiV1uiHZgNoibKKdNNpr/eBpPWMsnSaILbTVCmohP4PnGGU5AGibrar00Xn+l7@lists.infradead.org
X-Gm-Message-State: AOJu0YwHHs21P3HYA/HMOrJhP9dU7dbjlMvqffugcFfs9zVgyIVSNhMu
	H6ABmjhOW+PqRmGjF85BnDto0Tu45SPqHSD3RdQrALGHZRi1IOBXzxCjtb7e6OCqlIc=
X-Gm-Gg: Acq92OHDWuPE6Ev4Hk2itFyJ9MWmF8pt/RYUzjl8G9AVj3cFD70WAu/LZf0KwxiLGV8
	Lxata/C8Xk+xMfXwc3hQcSxm5eV9iXiPl0HN7b/5Lv6BRtBJXLW0dnN0l28ZyoAZsXa0ij0+eAM
	0LU6slE+LTN+GnR2mpSw0+MRLC81KFv9c2xhL/i7Rxm/l8GwKrM4vFr/jkrkHJVVhq5isiKuPEw
	Ii91HW1r+L60l1zxzf8aGQ7rG8klvhVNzw+lpanrlNSQnwrzmyKlrrxKnkyC4Dt000Xfy0yuwGz
	2Cvx7+fTGaprhzB271xdpjHhN7fJhSHwdAQy0JkPgO5EvRvQIdffjpTw4+W/RC9ofs582nF+b2x
	vXYs/2LPyP6go9p755JsbDfDosG95fCVCAlUWWMuEDXaz6ewQiG3TBAMgZbGHaHSlVcS1va1wzU
	9Dvv1vSQFdO0W5ojlhMXLN4ZMOI23Gongl8dkTELui9tJvaliz
X-Received: by 2002:a17:902:e74b:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bf3679ebc4mr132076775ad.2.1780324953150;
        Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:86cc:b476:3696:fced])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0842esm107038115ad.57.2026.06.01.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:42:32 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:42:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <ah2aVdlsLqy9aeHP@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_074234_697619_99FD2C39 
X-CRM114-Status: GOOD (  32.09  )
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

Good morning,

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------

This set looks good to me.  I am fine with the checkpatch warning on the macro -
given the redundancy it avoids, I think it can be tolerated.

Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
and Peng, please do the same for your platforms.

Thanks,
Mathieu

>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1

