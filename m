Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D71C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6RsrzvMrNRt97Mb+Kl6FE3cQbWfwrQHAeC/HvSyiSU=; b=ZW8HQnEaYK1HC53+pqV4GS2TJq
	ySj6vr8hvJbAkPWEE6utnnoQuZ495Au15xznVMEHzOOEk2pfGo4dUmqNpKw5dIDUn80c779/k61jL
	7yYBN1r7LemjPk0THrr2wCLxyYFzkDNjHPJD1J9KEDN6s7Z2Mas+W+IMKIzYKO8oZzhX9SO2bVRRM
	KPjhK29qEr0CGiyFWyvLZjsiSDk4oBfyODyEC61NAY3jK62VB145krERBAm5utUxLWqe75LzOnPJC
	yoMfn3RhGT/CEdksmHZgDTW6Xzwju+BZm5peWw5eWTmPctRsImwvpS8J0IQeDjzh/e7102HqxV+H2
	EpD1cG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u93JF-00000003glp-1YHh;
	Sun, 27 Apr 2025 14:48:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u93HK-00000003gfz-0fat
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 14:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6006AA41BF2;
	Sun, 27 Apr 2025 14:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982FFC4CEE3;
	Sun, 27 Apr 2025 14:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745765204;
	bh=EMjN1NRJqH0mdrr+kOIC6gH8ti4J53ARzCK2WMPH2sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlxiK2xxd8rpaDGVIJu20NpNhJW5Pwly63H5m5nDrHTy8PxEDP0avOeBdk6L5skf6
	 BBGenUCsyemIT4F2O7gRJhYXwUSnUl0z61ZlAauKrFczbPJAN7rCTVSNibjEOLS8Uh
	 COD0x68Rdhvzpf7MUZK/eWwAQ6pCbvIh4llans1Zh86X2rbSvG8L20n4ma4sko0fjT
	 ND6qMijIcJy6Y6fy0V0m+eEO6Fq9yvy1ds566lmFr0oUIRmwyKkXq4N8gXzetmY+BA
	 zhcln19HPtcBqC4NaOE6F0piDaqFVs8hL82zFvlgXrd3tjZWVwRjLwLmNHrHM4bp6h
	 3eCGUL2iag+FA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u93HL-0000000065N-0XPr;
	Sun, 27 Apr 2025 16:46:47 +0200
Date: Sun, 27 Apr 2025 16:46:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <aA5DVxP7n5GDFxoO@hovoldconsulting.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-5-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425125250.1847711-5-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_074646_270433_1ADEDE25 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, Apr 25, 2025 at 01:52:50PM +0100, Cristian Marussi wrote:
> Some platform misreported the support of FastChannel when queried: ignore
> that bit on selected platforms.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Match features has to be set-up properly before upstreaming this.
> Ideally the out-of-spec firmware should be matched with a quirk matching
> pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> platform at hand will ship with future fixed firmwares where the ImplVersion
> field is properly handled.
> If we cannot be sure about that, we should fallback to a compatible match.
> 
> v1 -> v2
> - use multiple compats quirks syntax
> 
> RFC->V1
> - fix QUIRKS conditions

>  /* Global Quirks Definitions */
>  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
> +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> +		  "bad-vend", NULL, "0x20000-", "bad-compat", "bad-compat-2");

Still works when matching on vendor and version (and/or machine or SoC
compatible):

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

I think we can go ahead and merge this based on vendor and version
"0x20000-".

Depending on what Sibi finds out, or if it turns out to be needed, we
can always add an upper version bound later.

Johan

