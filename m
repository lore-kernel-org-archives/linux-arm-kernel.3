Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA61CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7+1X2QvVAzUQn0IB2NCSGRXp1XNJgD5ZwEAHvQBbsc=; b=mtcOCHcOwBKPMzuZ4IUDM9POqE
	y+VwFvxAY8AqcRqKT0qgRBtpAyop0wBkakEEOTGDbfQrL1sBVn76v6kFoJXhRquZ9KeglbRdz66rR
	8Mkc3nw6aCNTD8j++yFYXQfk9uYFmNxSg83qXzTMmt7kKPTjYoUWflZSzW/d4jIqgSq3AJt3tEl9+
	racq18/MuAqiNBho5pA7vdSfdJdbgdZt+ipb2y8aM1Ihm0lIX4YlMlByyERV8sQn98PxnggqjWies
	hhWuARY/hlHSpmxrYerrNUbqQkTRXdpzETj4Laz6X556QlyufTKbCTQB0r9tsPhRhhe2Lz3sUkBSj
	Y1l/nDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPclX-000000042s1-0v4u;
	Wed, 20 May 2026 08:58:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPclU-000000042qp-142r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:58:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29B47488B;
	Wed, 20 May 2026 01:58:47 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F183F85F;
	Wed, 20 May 2026 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779267532; bh=YfJrh2tqW4oiFxVzvovNy67le8j1cP8HssBVwy88V+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOWLPCEZYS0lhB6TdtBQvXnHSQMYLBzWXJB/asOAQgDGMrUEG9NUFlOq/W1iwtNDD
	 8+qwOoJlPvIH0xVw4Urg0nR5iBnZraNiPP7sscKh9EXCe1MSTbvr1FtPWehs7ESjYO
	 BEI6OQ2TU+7ZHUIPZfZbCSbfD7ibOEf9NL5JjN6A=
Date: Wed, 20 May 2026 09:58:47 +0100
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH v6 06/12] firmware: arm_scmi: Extend powercap report to
 include MAI
Message-ID: <ag13x1Wp7PQ-wa4q@donnerap.manchester.arm.com>
References: <20260518135234.2953532-1-philip.radford@arm.com>
 <20260518135234.2953532-7-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518135234.2953532-7-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_015856_350275_3794EA3C 
X-CRM114-Status: GOOD (  14.04  )
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

On Mon, May 18, 2026 at 02:52:28PM +0100, Philip Radford wrote:
> Extend scmi_powercap_meas_changed_report to include MAI change
> notifications.
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V5->V6
> - Re-worded existing comment for POWERCAP_MEASUREMENTS_NOTIFY
> - Added define for V2/V3 sizes
> - Used new definitions
> ---
>  drivers/firmware/arm_scmi/powercap.c | 28 +++++++++++++++-------------
>  include/linux/scmi_protocol.h        |  1 +
>  2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> index 1d1188e98d49..fdfaf03277ab 100644
> --- a/drivers/firmware/arm_scmi/powercap.c
> +++ b/drivers/firmware/arm_scmi/powercap.c
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/scmi_protocol.h>
> +#include <linux/stddef.h>
>  
>  #include <trace/events/scmi.h>
>  
> @@ -21,6 +22,8 @@
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
>  
>  #define CPL0	0
> +#define SZ_V2 (sizeof(struct scmi_powercap_meas_changed_notify_payld))
> +#define SZ_V3 (SZ_V2 - sizeof(__le32))
>  

Apologies all,

After posting I have realised that I mislabelled these macros where SZ_V2
should be the smaller of the two.

This will be fixed in a new version along with any further comments.

Sorry again,
Phil

