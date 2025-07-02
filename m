Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D3C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drgvbrBOB7Cgai1j4ZmZIJxlKPvGRZ8ENy2/OwY0kTU=; b=FBlShsf83I4qHMvLWl+2k+TQSU
	4HA8HNia44WwiNutzAKrNBDkrdDUmc/57A34LLyUmasMuzPliyJz3qO0mr+G+jMIuqx2wzZBX9FX4
	ZunDku6lo7eb8CfNw/zebrbBOessUi4swgXYuro+fIpKbjWa64/DJgKknYs8KXh3WaKWTRHAXTxG7
	UGCoIPJaIQp/1fA/jVSG8biTmxNW2dU5nPFiB7/T3e5OtJO6BVuu54Mc0e8EtmYYru1EnCAosd8dT
	LTfCZo1DHovcsvkm1CVVtkgw6iEwwg9sTzibVdCMXalS42Jf7KMqJDmHEt8TJYuXdLaoU+LdJYUr9
	8DtqxNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Lr-00000008xI2-01XB;
	Wed, 02 Jul 2025 16:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzIB-00000008lvX-13av
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF58C1424;
	Wed,  2 Jul 2025 08:22:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B303F6A8;
	Wed,  2 Jul 2025 08:22:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:30 +0100
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
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082235_329843_0FE6788D 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc.

We now have SCMI telemetry protocol to provide such information in a
standard protocol. You must consider using that or switching to that
in near future. I am OK with this but would like to warn use of custom
interface for things like this is not scalable for long term.

-- 
Regards,
Sudeep

