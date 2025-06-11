Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC0AC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L68Nrxo7rMbC2eLrKnEUhSw4TmNUcJF/4PaM7VQteg=; b=X1O63eFhxwxMpBUJZl1Lqwehyg
	k2towN49AYoGvy5yHZRXB8KdOIaY6ea2b25O/zRJaUSwwsTJYqhucC0DMPA+X9CWzTQfC1aqTg0Dq
	4gcFbfeW5QZFs3t4Jj1zar9juxjkKemLJOfyhfvoYL6IgmJ3M67u01X/W3NWcbPCfjgWHO4rd3Vm8
	otdyhoH3i11S0YKg/luYfBzQmmJHkcI3YfQhB1oyZdQlacm6KUE1LZ2BU6bPPupPrNcabVY7DYXwt
	uf81WFw8zlsA06PNs/H2TQQay9YODQUpw6Z68S+v8bMWzNXJcs5AXP2fYwkvl69QlaX53zWu1QnIy
	WqB1UowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEf1-00000008vZU-2yIK;
	Wed, 11 Jun 2025 06:10:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEcr-00000008vLB-2pWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 06:07:55 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B67bjl1291549;
	Wed, 11 Jun 2025 01:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749622057;
	bh=4L68Nrxo7rMbC2eLrKnEUhSw4TmNUcJF/4PaM7VQteg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q3N6BKUN6I7Y8RnobdrHtJihLZI9OCD5OAGJTR/kAerxyk9uXA30yrExTomjcLeqX
	 MtJi2iI65BiPX4H1FuIBL/O/VMVCAyGyei+4xu5bL4VwgorHr6dg7ulltm4U3Tn1Nx
	 Qh0LFRAXoaCU06ZI70XF201PX6F6JbnYICotsGDM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B67bZ71502361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 01:07:37 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 01:07:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 01:07:36 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B67ZBg4072016;
	Wed, 11 Jun 2025 01:07:36 -0500
Date: Wed, 11 Jun 2025 11:37:35 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
        <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik
	<m.grzeschik@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel
 Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Johan Hovold <johan@kernel.org>,
        Maulik
 Shah <maulik.shah@oss.qualcomm.com>,
        Michal Simek <michal.simek@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/21] pmdomain: core: Use of_fwnode_handle()
Message-ID: <20250611060735.gdnnckw7ysrny526@lcpd911>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-2-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250523134025.75130-2-ulf.hansson@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_230753_757329_4B04E02E 
X-CRM114-Status: UNSURE (   8.29  )
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

On May 23, 2025 at 15:39:58 +0200, Ulf Hansson wrote:
> Let's avoid accessing the np->fwnode directly and use the common helper
> of_fwnode_handle() instead.
> 
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

