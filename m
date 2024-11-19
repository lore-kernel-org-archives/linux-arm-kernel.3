Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DED4417A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyRxPuRzp7MtuHBFSujz/tG1Z1/nbHP5FzWRe5C7ltM=; b=hLlgEXZynBjN8j8NeP4VEcpGzJ
	irxVE5YtCsyYvCpIyqiQwGW99PUQl3xtFuvrgT2TBq8kJYPjgfQH1Hk9688oZAixdi3Em4G6/r7Wu
	YlRFZmBCuh3P3/mi575NgbllvxaIVLZcXWlqds28QZ2a4SuPzqpQ/gf+Kj6GL9Go8T1sJ6Lxvlvz/
	4vXjKnwHVEdIVNXnxnSA5gbCohOZN9YHLszI+IHX2oiGLLd6wH9V/OafMCU0dOVQSbZQ/cjeqZzNn
	irKl46VtrxPkW9ZPCrlrVEz1g/50Irv2VQHaODbUCXvVrQBHZQ5tccQxqlkjdp49LZavvRIrGotjy
	d6TM51Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQZO-0000000Cwhz-1RW3;
	Tue, 19 Nov 2024 15:55:14 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQYC-0000000CwQM-3Cy6;
	Tue, 19 Nov 2024 15:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732031641; x=1763567641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oerxtD3nEVi4XTue4l49odCUQx6jpGjoapzMXc667oY=;
  b=ObhXSfh5lk3os5WfofSNwb5vPvxol17J3NKW2bVIeVyWxbMf+hhTke/8
   haOctIkri33i/NaI2t2xi1q0p2ryv8jX4ynsPN1RSlK9rUac4xZPqYaDN
   +LZM5kWKBSeGraFlUdZf7xuph1mpPkgo94zkLNI5MkWIl6xtUF9E2CTTq
   yhn1LP8I4o29qDM7Z+OyvOX0TLJvInUMcaLtgy19wH1PFbrAcWcMNkE0C
   tLN4hHdYFhmJENrI/oBZqEIB946tpUU7yndISlMm9bGgtf+3M7ad7gDEB
   iXTOLF0Hs9NTMe467vGoAl9rIxPZAsNZGH1dVcH7IymfNvoS0hE0LqypO
   Q==;
X-CSE-ConnectionGUID: CjIJ6p00SPWFE4bdpv/vYA==
X-CSE-MsgGUID: swVnlp5JSh2+uv2HquqXwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31420438"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="31420438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 07:53:59 -0800
X-CSE-ConnectionGUID: 2vowImP2Qoe5lB+Anw/K8Q==
X-CSE-MsgGUID: brq/mmlnTOm8eWaPpVdyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="89535173"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 19 Nov 2024 07:53:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 19 Nov 2024 17:53:55 +0200
Date: Tue, 19 Nov 2024 17:53:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 14/15] usb: typec: tcpci_mt6370: don't include
 'pm_wakeup.h' directly
Message-ID: <Zzy0kz54bW3Xe0Al@kuha.fi.intel.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-15-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-15-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_075400_809160_A529951A 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, Nov 18, 2024 at 08:29:13AM +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 9cda1005ef01..bc5fd2557e6f 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -11,7 +11,6 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_wakeup.h>
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> -- 
> 2.39.2

-- 
heikki

