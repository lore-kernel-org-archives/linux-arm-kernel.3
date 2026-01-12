Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F082AC9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x39jlW+mZX3imq5BsjFW50pP1SLBszf5IoxZ/dZBPj0=; b=UmrkI+CTgzZJ1q1TRjK7+jkfkn
	K0v53h78/Egyf/ASWAHHcPS55eO5v5s/Oi41FL8541lYeeTCJns/uW4f0Qjn9Ss57bttJMxw8jnLk
	kovCU6AENBPMT7I0/GfZe+W3EEHQ/4vQ+9YKy8DBcASvP87vpkyoaKJHOpeFKFar4u+lAOIGMo0ki
	0LQIk8HELoSsbLDonuCmAfaN8tD/L9vm8jsnF/jVKh3cDT7F5IES3Fx1gj2Ex6q341qU3PHeWC0rO
	K+EsSZ7HxiIiSK+kSAfRGxo/H+IT9yri2HLwrXnEBLUQuTT9MAvsJPriMUwGnAqVdzR86KkV+Xl4e
	XQ4z2K6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGgc-00000005J1N-11HN;
	Mon, 12 Jan 2026 12:06:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGgZ-00000005J0u-3WaB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:06:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B163497;
	Mon, 12 Jan 2026 04:06:08 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB333F59E;
	Mon, 12 Jan 2026 04:06:13 -0800 (PST)
Date: Mon, 12 Jan 2026 12:06:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Implement arm,poll-transport
 property
Message-ID: <aWTjs1Y9yoz1k4Ry@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_040615_924174_48BBE79E 
X-CRM114-Status: GOOD (  22.38  )
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

On Wed, Dec 31, 2025 at 10:29:19PM +0100, Marek Vasut wrote:
> Implement new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies to mbox/shmem based
> implementations.
> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop no IRQ handling from SMC transport and update commit message
> ---
>  drivers/firmware/arm_scmi/common.h | 4 ++++
>  drivers/firmware/arm_scmi/driver.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 7c35c95fddbaf..7c9617d080a02 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>   *		      to have an execution latency lesser-equal to the threshold
>   *		      should be considered for atomic mode operation: such
>   *		      decision is finally left up to the SCMI drivers.
> + * @no_completion_irq: Flag to indicate that this transport has no completion
> + *		       interrupt and has to be polled. This is similar to the
> + *		       force_polling below, except this is set via DT property.
>   * @force_polling: Flag to force this whole transport to use SCMI core polling
>   *		   mechanism instead of completion interrupts even if available.
>   * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> @@ -254,6 +257,7 @@ struct scmi_desc {
>  	int max_msg;
>  	int max_msg_size;
>  	unsigned int atomic_threshold;
> +	bool no_completion_irq;
>  	const bool force_polling;

My preference would be to reuse `force_polling` for this. We need to drop
const but that should be OK. Anyways I would like to know if Cristian thinks
otherwise for any reasons I might be missing to see.

-- 
Regards,
Sudeep

