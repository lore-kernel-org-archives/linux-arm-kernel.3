Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B65ACA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL+VhK/kN7g7Ujc/6hg5xJ5Iz3Hxoqc8dIX27qk3etM=; b=a677pK86+sLyI0tXObMTj2z6EW
	i/d/KsU+U1VXoY+0+8UoOW4BiTmUvEm+dWFER4SZ/zI+0Ma0KSSccdxn12oPBRL9TX56q1wD5G4AL
	TqXTeo1MA56+jQkzFoZ7OdlHDIc2MyXcvchQFG+N4ElX4uBGr4y+Ra3iUcR4y7xFb107t7yBYFsH2
	Zy/dEZ2W6iy9edLsDpt7JO2qxw7PiPHPT1wNJud+Z/YBqDwTyZnd/qcfGiVDGaPG13f+YbOvYxprA
	FDXN0cN+58C6708S1y38JjnuWgGjrfX8M70do1gf/twGFU6BTDFVC8D0Zrs8GOd7XpkEVdsPeE8hv
	pUyBNINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnVp-00000001uBP-0rLw;
	Mon, 19 Jan 2026 11:33:39 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnVn-00000001u90-0IXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:33:36 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dvpH56bBJzJ46q8;
	Mon, 19 Jan 2026 19:33:05 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id A4A9240570;
	Mon, 19 Jan 2026 19:33:28 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 11:33:27 +0000
Date: Mon, 19 Jan 2026 11:33:26 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<sudeep.holla@arm.com>, <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<d-gole@ti.com>, <elif.topuz@arm.com>, <lukasz.luba@arm.com>,
	<philip.radford@arm.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH v2 03/17] firmware: arm_scmi: Allow protocols to
 register for notifications
Message-ID: <20260119113326.00005902@huawei.com>
In-Reply-To: <20260114114638.2290765-4-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
	<20260114114638.2290765-4-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_033335_254918_E9DE0668 
X-CRM114-Status: GOOD (  16.20  )
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

On Wed, 14 Jan 2026 11:46:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols themselves to register for their own notifications and

and provide their own notifier callbacks.

> providing their own notifier callbacks. While at that, allow for a protocol
> to register events with compilation-time unknown report/event sizes: such
> events will use the maximum transport size.

I'm not keen on the 'while at that' part of the patch. In an ideal
world that's a separate patch.

One other comment inline.

Jonathan
p.s. You get to my review victim whilst I run a particularly annoying
bisection on the other screen (completely unrelated!) :)

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v1-->v2
>  - Fixed multiline comment format
> ---
>  drivers/firmware/arm_scmi/common.h    |  4 ++++
>  drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++++
>  drivers/firmware/arm_scmi/notify.c    | 28 ++++++++++++++++++++-------
>  drivers/firmware/arm_scmi/notify.h    |  8 ++++++--
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
>  5 files changed, 49 insertions(+), 9 deletions(-)
> 


> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 78e9e27dc9ec..e84b4dbefe82 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c


> @@ -779,8 +787,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
>  	}
>  
>  	evt = ee->evts;
> -	for (i = 0; i < ee->num_events; i++)
> +	for (i = 0; i < ee->num_events; i++) {
> +		if (evt[i].max_payld_sz == 0) {
> +			payld_sz = max_msg_sz;
> +			break;
> +		}
>  		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);

Everything here seems to already be a size_t.  It is rare that we actually need max_t over
max, and definitely not when all the types match.
		payld_sz = max(payl_sz, evt[i].max_payld_sz);

> +	}
>  	payld_sz += sizeof(struct scmi_event_header);


