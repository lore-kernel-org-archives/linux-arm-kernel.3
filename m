Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2BC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=; b=0vgQGlJT9ezJ2tgVU0KlI2nnIk
	B8eKtIBl/rqdhpSwfqu7zBJXBPNecFX9nWQopoxsM+f7Cj4ko9IwJbEVOu0rtArLtzHqBpfLVj9tj
	7Z4t9Ye60r91FdB9tdpyE/qJzyqbI8OhTanRLe78Z21RVzjDqGjZI+qwYpFkcOv1ZJsTSnUe3bydW
	WJhxoSbxtNHzf1PkAGCPzQ7I6uX9XrbrDAxrZStBGHeYIwbCn7sxYEkwrzRFXtWzCDY7vQ8GcA+5z
	8J6Pbf2Z2pWYJ5yYmBBm4ph9H/jtkFFMsqD8l/sqYKi9YRWRU2E7UcBJm3treKrNtdDLcLF8I0mE8
	7lv6Bl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE1o-0000000F5bd-2VRE;
	Mon, 29 Jun 2026 15:36:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE1m-0000000F5au-396I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:36:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso9481695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747365; x=1783352165; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=DO4dqH/TYYh8HCTE1s+3HyZOMdHcTiXRf8Z9orlbaBrkkqRIgNK5eDpmdxXMsjPIPl
         bGtfaV1RCIYyPn5E7R+3HyUkYkAXQSk9LasZ7ikzPYEaM8nZ/SKD0J9DDyC9KFyOmkZv
         2YKedInmIzO9AxSKcJd8+1M9qp20eEzeeqoLoknuy5E9Qgeo9hQmqTv44SDwY6xTBLEN
         mqb4oyPlmTmUPA95rBY4GYDDc7ywn4QdHZt2OVKlP8CRYJsxDwuRhzUpJD2bku44IoGX
         3Tifhh9tU9KBgMeraR8rSLth7/pi0VByJsscfrryGSIUS/KQ9sN/RR7UStsosBeQq/K3
         S2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747365; x=1783352165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=XTiMyFoRYoKWUIY9AB/Shhtsi/p6XS/jI9bKIPYoQ1H8XL09IX3G1T/Cj6XrULafwc
         T89PXBFIeyaSV2zsh6OoaoN9du/o6UExTgh6bV4twVEg8f7+4a+mfStj0OKYiWdS7LKM
         IaK70ydo/wNCxjZ6zyCX6WzDCiOjnEOM7I1gWCOCjD8fk075FvrvavrPjHtMWBZtdx+8
         GwcizZsi7+PucE0s5W1n5X5LWH+S+DldwRi77y/2OUQb67f5Wq1O10JyIz+bq6/biwh/
         VYbgltIZcqEH48yWrxIjSl/+a3K4AD9uO6NbtQDvRiYdp68hJ/mWUrA/r1eghixtdMkM
         ZhZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBCdDb7Lo11maAHhVuI63OHN9udv78En+I7kHLgvX3ClRuJY9/apY6of8poJvyEwzP7JXKbR+wFXfaNfR0LDhj@lists.infradead.org
X-Gm-Message-State: AOJu0YzQhuQS/fb7riN/sfCotlpVEPn6AkldrjaDeneraDlRLyPIEeay
	stbwEwjpggp8STHyRnXSDe5Pl2K+wrDZUu5chqABLXxCcbAFaeHbgLWLKCer28UHSMo=
X-Gm-Gg: AfdE7cnogEhChitMTHOKqmHa1lElBaQgqGfCwFwgrtRPsCG8ojGIC5GpkHqV818wS51
	KjS/XYx0hXho/sm69AI+k2iF2TZZ5RZ+mcEam/L/0DWkYWN81jC9kZujDTqTywNBX/hiplvoQB1
	QJP8wUxR6JJGCoED3xSoPJeZWnn4tWMXrZg1ZNRdxVRKgCz/P/NSbxZx/PTqvxOHCTr3/uY60iU
	xAnzbALqAim8l6Chlp8E0pkpvTrbXdwFepApEbc0jipM946+q3oICePDY3gu6hmxpA/K50HwKck
	2aayvLYrEMYtCMZ2kpgZ60HRdWVbed7YP7i2FtrX6tysQ/cgHRnl8SR/0COltdU5j/GS4iv2fpI
	LnBN56fyNpRckKphedAgkIixwLqd2mwJPu9VohY6UgR55NBKG4LxT7jq7iPCJrCaL6vFtU0xZIH
	ptzxWgX7djLXEsKnADoIRkoS0CIag=
X-Received: by 2002:a17:903:2f8a:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c9854b5597mr89458355ad.12.1782747364963;
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm98408955ad.56.2026.06.29.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:36:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
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
Message-ID: <akKQ4H09G2MpRVGN@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_083606_804417_E1852A3E 
X-CRM114-Status: GOOD (  30.17  )
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

Applied.

Thanks,
Mathieu

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
>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1

