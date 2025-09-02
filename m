Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D08CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WksebJj9ireqwOac4UgaIlH2XPqgsMXUCmYJ1OU2yTY=; b=jMXNYkBcTTjuS6FS/YR/IAaRPb
	/XpRtvguMpwiQf1+QuezjNx+DjRNG0OPMCCHYTOzruRBxdCiQs/XzOnIPtPNya2vvf3zsSYQ6Kraa
	UjG6x0qobHDoqr4XxUWkf6+UHKTn2IsSeZHthSZ7qiB+4QwbafAXD+6mOdt8LpcFQ0mCUKbxsTVcw
	UI147wBKmf2GiMmQEIDxgENHtiSgSX39B559EOxbIUJbqfjSb08p5AuX+pi4W2iwaryzb2D0fgkef
	7iVlra08Onw+Xu25ysnz5ku5CDH9dEHXLsi60vn3gLjlju4EUHtfdi13jpvcBLuypIzz+sU49umv6
	OuWE+RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFX-000000006eq-2wl8;
	Tue, 02 Sep 2025 13:40:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNIK-0000000GMtG-2kzF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:27:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE5B168F;
	Tue,  2 Sep 2025 02:27:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7289F3F694;
	Tue,  2 Sep 2025 02:27:14 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:27:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Artem Shimko <artyom.shimko@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_scmi: add missing spinlock
 documentation
Message-ID: <20250902-daft-pompous-angelfish-459c6e@sudeepholla>
References: <y>
 <20250901161207.2501078-1-artyom.shimko@gmail.com>
 <20250901161207.2501078-3-artyom.shimko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901161207.2501078-3-artyom.shimko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022716_767096_8BC5C2C8 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Sep 01, 2025 at 07:12:04PM +0300, Artem Shimko wrote:
> Adds a missing comment for xfer_lock spinlock in struct scmi_xfers_info.
> The spinlock protects access to the xfer buffers and transfer allocation
> mechanism, preventing race conditions in concurrent access scenarios.
> 
> Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
> ---
>  drivers/firmware/arm_scmi/driver.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index bd56a877fdfc..6828392152f4 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -76,6 +76,7 @@ static struct dentry *scmi_top_dentry;
>   */
>  struct scmi_xfers_info {
>  	unsigned long *xfer_alloc_table;
> +	/* Protects access to the xfer buffers */

Thanks for your patch but this is quite obvious and I see no point in
just adding this comment.

-- 
Regards,
Sudeep

