Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C8C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSjDSLuuBopyN87tQrBtshxN58JXONqfLOG2XA7UUGg=; b=y2yHFbV7c+Vufi5jCzhJdsJS2B
	/oxobSPXW9j5IAkHSD9nj0cPuBYxoCxc2KLoPOkggmq13YIU/sAKzRjeuuTPRiqeStu5znHRqaxfx
	+y+teIPwziqV6qRWOT56+ePt9SLMBXUDhrcxzMUW7ayyyasFhHcv9G22z1j8Raw3fMBz/0xOshwrc
	rwCLgrta5Gk/fXiqT8fnF4t/tpkoExyQ8RBRLNyqTAzdhK4vDOrBOONt1OZcGjnYNxbxjEg+Cegqz
	P/KT6MxhyVqJ3Zo4ZVLAU2I7H4fUzvMAzTlwmbyvg6b9KGZN7yb1HVrwZKjPkr5uRWDyolpiM7N4f
	x3Ggxnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepur-0000000EeLM-0WqY;
	Mon, 03 Feb 2025 06:26:41 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teptW-0000000Ee4W-0cOR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:25:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5136PBJ52086375
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 00:25:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738563911;
	bh=VSjDSLuuBopyN87tQrBtshxN58JXONqfLOG2XA7UUGg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JJGtx4qLPqo2tt7GEDKNUlN8+CY1y56gNtoib0a7sMJ5i4O/xg8n44y3mxcDmF7BD
	 sqT2xU7JZskSAGXfdv0GSQ5qKggSAyij/YzECVzU25RJ7zRTQQertSRTyWQzlTeALR
	 a9oFVKoPG1FuQrn5FYFeOn6+f0MaLUuE8ahAYkNs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5136PBF7106159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 00:25:11 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 00:25:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 00:25:11 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5136PAtv015127;
	Mon, 3 Feb 2025 00:25:10 -0600
Date: Mon, 3 Feb 2025 11:55:09 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Xinqi Zhang
	<quic_xinqzhan@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
        Guomin Chen
	<guomin_chen@sina.com>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Add name and protocol id
 attributes
Message-ID: <20250203062509.rm64fr2dpil6x7y5@lcpd911>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
 <20250131141822.514342-2-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-2-sudeep.holla@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_222518_684416_0D72BAD0 
X-CRM114-Status: GOOD (  11.07  )
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

On Jan 31, 2025 at 14:18:21 +0000, Sudeep Holla wrote:
> Add the name and the protocol id attributes to the SCMI devices on the
> bus so that they are exposed to the user-space via the sysfs.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 38 +++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

