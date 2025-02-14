Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnbZ8VsXODkmtfXWh1DBqFmOEWEsXMo+zmBXg0OmqXs=; b=4zj/ff2L5IS6/SeYbNvNGd4oum
	NFo4T1tqc219g/ctQcQm29o5gH0GTelBmQlOuuljbABhPzW/WMAx29sV+bxmZJwLnj1BIUGjkOw13
	X0RVV4YzwSXEQo5B14VsswlCimCTEyY22ognJlh1dj6fJDWE4IVCI8Uad0hezlsG4CAaIjgAH4RJW
	a4tF1k7cGA119HRe7zQxI5icWIkoyEfNjnkJVqvgxAciaHdps9CNIYIeJPMq+lnPNUk1xvK3om9hA
	DGWoL4b3vTYXBjKXL+Tc8l2wNqVX+1SD5ffhgiZ6HJk2VhK08LWP8WknBVXJolihUrODUzlYkUOPN
	vg3veGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqle-0000000E3rT-2XzS;
	Fri, 14 Feb 2025 08:09:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqhZ-0000000E3Dh-3zxk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:05:35 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51E85PWT096861
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 02:05:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739520325;
	bh=XnbZ8VsXODkmtfXWh1DBqFmOEWEsXMo+zmBXg0OmqXs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=x8of1uYHIIXhMySQrFtiWf6aGMA1bCXQ3CkgVJzOeDXooLdP4R698ExB+edfSTXgl
	 wGH2ItytTZxfZMDI6aaSqxF4WVKql9BXnYwgumrff3tjjgiiO+jd7L8lx0H2gACVNC
	 CnxGvO1sxsxEAzoN0YePpEQCyWA8dhyow5YnAYck=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51E85ObG013406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 02:05:25 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 02:05:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 02:05:24 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51E85NMZ117734;
	Fri, 14 Feb 2025 02:05:24 -0600
Date: Fri, 14 Feb 2025 13:35:23 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tony@atomide.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Configure
 ti-sysc for wkup_uart0
Message-ID: <20250214080523.efqvheeso5xoai6p@lcpd911>
References: <20250212215248.746838-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212215248.746838-1-k-willis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000534_276259_BD4BFE52 
X-CRM114-Status: GOOD (  19.58  )
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

On Feb 12, 2025 at 15:52:48 -0600, Kendall Willis wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> Similar to the TI K3-AM62x Soc commit ce27f7f9e328c8582a169f97f1466976561f1
> ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for wkup_uart0")
> The devices in the wkup domain are capable of waking up the system from
> suspend. We can configure the wkup domain devices in a generic way using
> the ti-sysc interconnect target module driver like we have done with the
> earlier TI SoCs.
> 
> As ti-sysc manages the SYSCONFIG related registers independent of the
> child hardware device, the wake-up configuration is also set even if
> wkup_uart0 is reserved by sysfw.
> 
> The wkup_uart0 device has interconnect target module register mapping like
> dra7 wkup uart. There is a 1 MB interconnect target range with one uart IP
> block in the target module. The power domain and clock affects the whole
> interconnect target module.
> 
> Note we change the functional clock name to follow the ti-sysc binding
> and use "fck" instead of "fclk".
> 
> Also note that we need to disable the target module reset as noted by
> Markus. Otherwise the sysfw using wkup_uart0 can get confused on some
> devices leading to boot time issues such as mbox timeouts.
> 
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> Tested by suspend/resume with WKUP UART wakeup source on AM62P.
> 
> Similar patch was sent for AM62x by Tony,
> https://lore.kernel.org/all/20231219072503.12427-1-tony@atomide.com/
> 
> Similar patch was sent for AM62a by Dhruva,
> https://lore.kernel.org/all/20241231-am62a-dt-ti-sysc-wkup-v1-1-a9b0d18a2649@ti.com/
> 
> Original patch for AM62p existed in the TI Vendor tree with Vibhore's
> authorship:
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.6.y&id=efab3fb636673837886599a49cddf1e862c8aeb6
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

