Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBDECA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ty71fS7JCInNJljzKRploW2jwHUy+H3+BnfyWa5A978=; b=zzNxoiCBUgmJL5BuIggrkdBeuQ
	4+AWr656qTNNLuGfm8yOEGAfRL1zVuwYY60cRELi3q6eIHwk6kglWPB7IelfbcxmMkZVccFeZwO2+
	9RNj+lT6Mzd4gnUTaKC40Qn39bdBKhmpvnbFp9BCzKKESNco3VpqYoaGUkxMjJxrX4y3sstBOIaij
	ph/B1Us+HlcC9B3LGzqSKrcKJqslXhPevssKrgGQNEQtWaIV3iP/qI4yqc3Z/NhAEZKO90r9h+qt2
	RUKu2sXVymKjTssMWGkPZE1fkxAbtANdDqApr43IT1Hw4JmpMCp+LXfq+HdzVQCNUsWqMlVYa6y4+
	pus+Grag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us04P-0000000615V-3BWs;
	Fri, 29 Aug 2025 14:27:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxBN-00000005TGR-1PLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:22:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EC8E19F0;
	Fri, 29 Aug 2025 04:22:04 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 741683F738;
	Fri, 29 Aug 2025 04:22:10 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:22:07 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250829-ludicrous-giga-bison-aa8ace@sudeepholla>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-5-82c982c1815a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-sm-misc-api-v1-v3-5-82c982c1815a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_042213_425370_CE082154 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Aug 27, 2025 at 12:59:17PM +0800, Peng Fan wrote:

[...]

>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 27bd372cbfb142b6acb0b1cf4b82f061529d0d45..6e18920aac56de67d388e985e3305745d3798c3e 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -52,6 +52,23 @@ struct scmi_imx_misc_ctrl_notify_report {
>  	unsigned int		flags;
>  };
>  
> +struct scmi_imx_misc_sys_sleep_rec {
> +	u32 sleepentryusec;
> +	u32 sleepexitusec;
> +	u32 sleepcnt;
> +	u32 wakesource;
> +	u32 mixpwrstat;
> +	u32 mempwrstat;
> +	u32 pllpwrstat;
> +	u32 syssleepmode;
> +	u32 syssleepflags;
> +};

And since the document/spec doesn't cover details on above, better
to add comment for this to explain each of it. How do you ensure
the backward compatibility if you are assigning a structure to a log
buffer that is not so structured the spec/document. Will be end up
with one structure for each version if f/w screws up the structure ?

Can it be a raw dump of man 4KB instead ? Sorry just realised it now.

-- 
Regards,
Sudeep

