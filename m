Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izawe8DD2gwWFOLoHnxUtt+pSMUB5xWY0tfrauu/pBY=; b=qJEY1SwPg56tR02V5G5NO+22r8
	M5fBBw5LzP+RjIMMgK7+lcq8a2PifudAW2V/NxOI3iD5gx+mQngk3THvfD/Wtta1KpXMK4wDLYuov
	WcdaVjalOzYIae9fYfww2KzCZEfYkWaw1UjDSl3eE9gQLgaqfiKI9pDsrKIqkNYhNtVEn0CTQsvXr
	It/YS8X/S/K0GwLPAp7Bcr9DqbIw2dt6JF2IwieCPAhve7+a7QIH7o/s2mSFLJ6rAF/1kbzt1uu5o
	yb2zMHnRsGxsJ337C2KVOwIliKavgjutggFk/PAnw7q2HvkOpqrgMBpowtau1IJU5EvhEjVz3WIHF
	K83VgmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCoH-00000002t7h-2HSG;
	Wed, 26 Feb 2025 08:30:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCWZ-00000002paJ-3tzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BE535C641F;
	Wed, 26 Feb 2025 08:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42A2C4CED6;
	Wed, 26 Feb 2025 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740557530;
	bh=X+ENWuPD+JB6t0c8PzzFNjzL6/ESOQRKHl4B55Rn1SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sukt2lmfbb1YRaIhEuoOIVPmO5LxtzAr4sDu54lYTLt2kmTm+sEi58qQIj8XKdAkV
	 iFR7LZ6gSQXV0vWF4imJIX2947HOfrYc2h3w5/vCT4UGaH8yOr1cWkHGF94rYMKdyd
	 TUBCWS0EHb1ZmqEuWhN4kdh/v3+uCl0xENlExZu9G+O1Kq74Po9fol0lJUe6p5vA6b
	 8Qw6OzKFqqE+KfHdD4aVxeysGbjkzGGwwF0ihGHWERizdlLwDwCo9ge77SxBzDdxoO
	 KwwC5oFTfHPd4M6AWGEpmymbUANHtgj2tT2Z7v/eH9s5iPZMZ0s2eVg0V2FhWf6uyP
	 6BoklGoCFLePQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnCWk-000000004oQ-3B4H;
	Wed, 26 Feb 2025 09:12:23 +0100
Date: Wed, 26 Feb 2025 09:12:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77M5iXHQsdMptWm@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024338.3994701-3-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_001212_058612_4CA10BCB 
X-CRM114-Status: GOOD (  25.77  )
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

On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> The addition of per message-id fastchannel support check exposed
> a SCP firmware bug which leads to a device crash on X1E platforms.
> The X1E firmware supports fastchannel on LEVEL_GET but fails to
> have this set in the protocol message attributes and the fallback
> to regular messaging leads to a device crash since that implementation
> has a bug for all the X1E devices in the wild. Fix this by introducing
> a quirk that selectively skips the per message-id fastchannel check only
> for the LEVEL_GET message on X1E platforms.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    |  5 +++--
>  drivers/firmware/arm_scmi/perf.c      | 30 +++++++++++++++++++++------
>  drivers/firmware/arm_scmi/powercap.c  |  8 +++----
>  drivers/firmware/arm_scmi/protocols.h |  2 +-
>  4 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9313b9020fc1..b182fa8e8ccb 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1903,7 +1903,8 @@ static void
>  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  			     u8 describe_id, u32 message_id, u32 valid_size,
>  			     u32 domain, void __iomem **p_addr,
> -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> +			     bool skip_check)

This does not look like it will scale.

>  {
>  	int ret;
>  	u32 flags;
> @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)

Why can't you just make sure that the bit is set in attributes as I
suggested? That seems like it should allow for a minimal implementation
of this.

>  		return;
>  
>  	if (!p_addr) {

> @@ -1282,6 +1288,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
>  {
>  	int domain, ret;
>  	u32 version;
> +	struct device_node *np;
>  	struct scmi_perf_info *pinfo;
>  
>  	ret = ph->xops->version_get(ph, &version);
> @@ -1297,6 +1304,17 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
>  
>  	pinfo->version = version;
>  
> +	/*
> +	 * Some X1E devices support fastchannel for LEVEL_GET but erroneously
> +	 * says otherwise in the protocol message attributes. Add a quirk to
> +	 * force fastchannel on LEVEL_GET to prevent crashes on such devices.
> +	 */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,x1e80100");

Here you should use of_machine_is_compatible().

> +	if (np) {
> +		pinfo->quirks = BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET);
> +		of_node_put(np);
> +	}
> +
>  	ret = scmi_perf_attributes_get(ph, pinfo);
>  	if (ret)
>  		return ret;

Johan

