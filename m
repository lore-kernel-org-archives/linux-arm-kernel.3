Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD60BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Cs6stH3jDoEL4R+6FL9fs/i66csi9fpSgXgkT6zTC8=; b=H578vGuDEviEs0GUf6J48SDM4P
	//0zIc0aYd2M8LijUziJShS/MFtdX83CbFsCYY24qFcEY2hkRvDxdwlHvcVVnn6xjjGDTbecB7+0C
	+43rGzz8LeZdyZswHxZty65ikuJErU95llGCJ1NUa6Xx6dBKXFUzMlKD5BtSn5uES03rGZuuNN9yN
	0YzO4XD4lK3Hk3PtA4ZY2sVumYmxF70YGXbdCLxb1zoITJ8iKlQF7niN8IuB1ZP3tbxTofvfFxK8y
	/IIdXA6aU4IreL6uXfw0mLenSkcePm2F4AzTbd7suzxuuGUgGv04RoVzIywv9RUsdBE6Y64lKQVDY
	Fzt3F4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawDu-0000000CR4C-29MU;
	Thu, 23 Jan 2025 12:22:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawCd-0000000CQzM-37q5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 12:20:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FF8A1063;
	Thu, 23 Jan 2025 04:21:23 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7421D3F5A1;
	Thu, 23 Jan 2025 04:20:53 -0800 (PST)
Date: Thu, 23 Jan 2025 12:20:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: imx: Correct tx size of
 scmi_imx_misc_ctrl_set
Message-ID: <Z5I0Irl1eUarzLlA@bogus>
References: <20250123063441.392555-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123063441.392555-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_042055_824243_FC76AB00 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, Jan 23, 2025 at 02:34:41PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 'struct scmi_imx_misc_ctrl_set_in' has a zero length array in the end,
> so sizeof will not count 'value[]', and txsize is smaller than actual
> size for tx,and SCMI firmware will take this protocol error.
> 
> Fix this by enlarge the txsize with 'num * 4' to count in the size of
> data.
> 
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Tested-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V1:
>  Patch is cherry-picked from downstream, so tags are kept.
>

I don't if Ack is really helpful, but Tested-by is as we can't test it
on any other platform. But it would be better if provided on the list
instead of coming pre-packaged like this in the future. I will add it
as fix soon. Thanks!

-- 
Regards,
Sudeep

