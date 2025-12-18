Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6BD6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/Rcf3Hg5ag0DcGmnAq5FEqru/NAjkc84k8ampAfGFw=; b=yizcxBpwojZI+RMUq4BhYU4uHD
	7Y4jOp5Paz0S6aE/uSTHP5jhYFGHybu6W2HbcAhA0ivoHsAkbO8OqtvnN8d4EJYfLrInFitCgEzBX
	OR9JyiH0PILOav8nFiJOeHMdA0LK6ojY8a1h2BgzcaLPOEw3ywz+EQU5qvHzZVF65oVFXsHCSFVgX
	iyorE/9Ha6Ix3WtcI0bQK57qcdeblygmAdHeZ+Zid7zaTIjJAJTDU4RJI3LFgkbsywUGGmR04r1lr
	yeAeR/aprygqU3txavOWTgcDaYXJhu3v3Fhq+hn34jatHaPR8qjC1eQcFAkXGDMsvLF/pjoOQ2S78
	PhSQ4ZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGUv-00000008mWs-1vbK;
	Thu, 18 Dec 2025 16:05:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGUu-00000008mWB-2eiU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B299960010;
	Thu, 18 Dec 2025 16:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA2BC4CEFB;
	Thu, 18 Dec 2025 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073899;
	bh=gzFkONFYOr71raXYHjqduidbBwfeoTNGqEuP2iomJ+g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dwM4D9KklNSbYCtuU9tVvtuEfH4VpJ7/nAc0EItPJdiI1dhki+01lCXdVgCIgcHRa
	 CoZb3CSjm0/FhxeS1PVJYRNUPZUTKJpbHnqNO6I3+4nn4fp5MIGISMo/eah8yKEDOJ
	 BhNgpmKLiD2tkFtW7W+/O+96MaGEzmpdepQQTrp9Yb7wCALEAkWCp2F8b/XrZCdGFS
	 w1eNsNglFFbiWKCTY8MXKXKB6IXuLtiQz5lZTfBL7QjqusOPkroUyZ9f/EfXMtxuHO
	 h14y8oAPRCmsPMm/ZptP2fq54jPO/wO+8xCgPPvIAeha/vQQZGARJBEQ+wpod49nFR
	 JG9dBvlPoWo/g==
Date: Thu, 18 Dec 2025 17:04:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 tony.luck@intel.com, bp@alien8.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com, Michael.Zhao2@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Message-ID: <20251218170453.23be9049@foz.lan>
In-Reply-To: <20251217112845.1814119-4-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
	<20251217112845.1814119-4-ahmed.tiba@arm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Wed, 17 Dec 2025 11:28:36 +0000
Ahmed Tiba <ahmed.tiba@arm.com> escreveu:

> Teach the estatus core how to walk CPER records and expose the vendor
> record notification path. This adds the section iteration helpers,
> the logging helpers that mirror the GHES behaviour, and the deferred
> work used to hand vendor GUIDs to interested drivers. No users switch
> over yet; this simply moves the common logic out of GHES so the next
> patches can wire it up.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

...

> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bool sync)

Huh?

This is a CPER record from GHES. Why are you moving CPER code out
of ghes.c, placing in a file named estatus.c? Doesn't make much
sense on my eyes...

Same applies to to other GHES CPER record types.


Thanks,
Mauro

