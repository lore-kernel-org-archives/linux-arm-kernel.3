Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339D5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV1H94tT0bXaCEhYUGmcekKDf0xmbKM8JtA/SimwxCY=; b=y1CyGBpDc2ADhSSdk521G4rETm
	/duwECWUjO6gVuekFzb/81mMR3iopXRQ5ZdypqHfl1BHUCztu/34eVkwAAVweDciXny4WlQn96RXO
	ZWtuBtqf0YELcMbh9DKy+t43PphYwaFSYDHAvJyDPgm0x54b7ZB7nYR+P68xBF04zhwwhniqpOJA0
	9lv/wzPRirDHQB+yV2KiWc/ADmvc5GcPTTiRg2P6EIIP0d/Ja9ymhUO8LT4Jwp7DEsC8hL2tySlgK
	zCKci8rJziX+HDMS/RTEhIwwkzEYvVmfVCHY+Y30kaXfXS/AVvQf3f1HHpTqrccbbyY9e2qEvOt4s
	YspK0PpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woP4x-00000003Vop-25HV;
	Mon, 27 Jul 2026 17:25:27 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woP4v-00000003VoG-1zkG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785173125; x=1816709125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xIc7mbEEDl2XzJ10CqzA3H5i8CNoTKHQjJm395IfRYM=;
  b=TWYt2FLO9vGDU0irXBNcJmYgx/F+iS2Kez4jzAjB26DmFxd6DjS8PrKY
   Ubionr3iBk4QBKDVFCzDU/YqylcYpLhk4ShtJLK86j2GPmQA8eI905N3H
   NTvc8hvez6kjZfX8ZtUShnaJoj/3m3VPMuynjdDO4lHVFqOTT1NotvL/I
   a56YkY+sGp3p12d+7YXa545nSTy5ETPQLTWKUYCBLsEW8HTV7eEoGmaPK
   6ekZrK1bl9MvFXqS86+vhMxpSMUxYdRLCH63uzhLqQALIVvYpS4SlDHeQ
   Iyqh8fwzmCpXGQlALzDehjbYZubX3i9o/LpNv+kP89Q4NlXn2rPFP32Gg
   A==;
X-CSE-ConnectionGUID: y5E4x8qFTxiq8PC8sYQjeg==
X-CSE-MsgGUID: l1eDbl6dTQm/0TzC2uyeBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85616624"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85616624"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 10:25:24 -0700
X-CSE-ConnectionGUID: eJcnvQFeQH2jgYbho+PJBA==
X-CSE-MsgGUID: qV4n0T5IRLyMVSQ2csM7uw==
X-ExtLoop1: 1
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.47]) ([10.125.111.47])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 10:25:22 -0700
Message-ID: <ce2fc791-e84b-49e7-8d9b-f864ee82aa25@intel.com>
Date: Mon, 27 Jul 2026 10:25:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ACPI: nfit: core: drop unused assignment of
 acpi_device_id::driver_data
To: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>,
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuai Xue <xueshuai@linux.alibaba.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nvdimm@lists.linux.dev
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
 <20260727-acpi-refactor-v1-7-ff900aa326ee@thegoodpenguin.co.uk>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260727-acpi-refactor-v1-7-ff900aa326ee@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_102525_562743_8AD58ACA 
X-CRM114-Status: GOOD (  16.64  )
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



On 7/27/26 5:10 AM, Pawel Zalewski (The Capable Hub) wrote:
> This module sets the acpi_device_id::driver_data to 0 but
> the field is not actually used within the module, we can
> just drop it from the table.
> 
> While we are at it - used a named initializer for the
> acpi_device_id::id field to increase readability and
> drop explicitly setting the list terminator fields.
> 
> Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/acpi/nfit/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
> index cb771d9cadb2..5732df5d53f0 100644
> --- a/drivers/acpi/nfit/core.c
> +++ b/drivers/acpi/nfit/core.c
> @@ -3515,8 +3515,8 @@ void __acpi_nfit_notify(struct device *dev, acpi_handle handle, u32 event)
>  EXPORT_SYMBOL_GPL(__acpi_nfit_notify);
>  
>  static const struct acpi_device_id acpi_nfit_ids[] = {
> -	{ "ACPI0012", 0 },
> -	{ "", 0 },
> +	{ .id = "ACPI0012" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, acpi_nfit_ids);
>  
> 


