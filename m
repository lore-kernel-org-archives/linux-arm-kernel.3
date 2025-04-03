Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67856C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btui26bDCKRUe1oW9d6XjXPwyx3WyxL2kbw6YD43+Pc=; b=2yZy7xzuyCPUOPIfeD7b8SVnQz
	9JF0cY5s0OhgAgcwgC67lTRIDnpBbHF9zNT+4CCzVqHhK6fUysQWE1/7u2dSCJDf/wlzYwFoybB1c
	eU7hfrzAh9BxfPNiwmxfs8NjmOUy4WoqWkWjBFgTj0nIKJQUgO1kBf9BlFZEN/8fpnNHusuGB7TEY
	2VI7xxNUMXioNKLnbGZH3Y+Or0tSNgTECrZVNm5ACcsGEbWAIxMYkkuDZ9cYS63UMKN3Dqn30unIz
	zOD+wihsOdKL8pUhqdFIJOrPfHGWSqqY/nN8V/tZhTc53o3TF70SBtpMarVQ2wcuFMqMLY36Ry5g+
	hQ+6zSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fuk-00000008G4n-3xt9;
	Thu, 03 Apr 2025 08:27:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fsz-00000008FmG-3dIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3CE768422;
	Thu,  3 Apr 2025 08:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F6DC4CEE3;
	Thu,  3 Apr 2025 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743668716;
	bh=W2GXp//p/lyuftqtpov8Pw3eTDvdK9rmsYuGvtyrxpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMjtYpqMUn0oZ4P/Y4Smk3o+lWbC/knZQSwyjheBq5wGC0wmQ6Yx3+wtz0e7EEelX
	 VSrBFnBzZ3julRuM78hF0MhjTQ4AUv6hweaGE6KMkt9Qr31tC593ltRz51wttaEGwu
	 WDmTfEigYH41o8GhZHXqIKa8WCoI/4QyfhQVQkSHQfspAXCoTNeHKhBlrwjFj3P1f9
	 H6oiTUIUQvhG9vWolXusW/Pth7woOu1w55QO5odOShuMo/vghEFCCvIMSaT37PfLu5
	 bBA3wgIzq0i9Hc0cO1LLy/16yISa17qwNtkFW50ebtfkrPJul0TlRDezXfRqx85B+c
	 NDEvRzH/YFpuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0Ft3-00000000757-0kce;
	Thu, 03 Apr 2025 10:25:21 +0200
Date: Thu, 3 Apr 2025 10:25:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 3/3] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <Z-5F8eTaZB2gLTNs@hovoldconsulting.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <20250401122545.1941755-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401122545.1941755-4-cristian.marussi@arm.com>
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

On Tue, Apr 01, 2025 at 01:25:45PM +0100, Cristian Marussi wrote:
> Some platform misreported the support of FastChannel when queried: ignore
> that bit on selected platforms.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Match features has to be set-up properly before upstreaming this.
> Ideally the out-of-spec firmware should be matched with a quirk matching
> pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> platform at hand will ship with future fixed firmwares where the ImplVersion
> field is properly handled.
> If we cannot be sure about that, we should fallback to a compatible match.
> ---
>  drivers/firmware/arm_scmi/driver.c | 8 ++++++++
>  drivers/firmware/arm_scmi/quirks.c | 3 +++
>  drivers/firmware/arm_scmi/quirks.h | 3 +++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 4266ef852c48..212456305bc9 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
>  	__le32 db_preserve_hmask;
>  };
>  
> +#define QUIRK_PERF_FC_FORCE						\
> +	({								\
> +		if (pi->proto->id == SCMI_PROTOCOL_PERF ||		\
> +		    message_id == 0x5 /* PERF_LEVEL_GET */)		\

This should be logical AND and PERF_LEVEL_GET is 0x8 (currently
fastchannel is enabled for all PERF messages).

> +			attributes |= BIT(0);				\
> +	})
> +
>  static void
>  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  			     u8 describe_id, u32 message_id, u32 valid_size,
> @@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> +	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);

This is cool and I assume can be used to minimise overhead in hot paths.
Perhaps you can have concerns about readability and remembering to
update the quirk implementation if the code here changes.

Does it even get compile tested if SCMI_QUIRKS is disabled?

>  	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
>  		dev_dbg(ph->dev,
>  			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
> index 83798bc3b043..78d51bd0e5b5 100644
> --- a/drivers/firmware/arm_scmi/quirks.c
> +++ b/drivers/firmware/arm_scmi/quirks.c
> @@ -70,6 +70,8 @@ struct scmi_quirk {
>  	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
>  
>  /* Global Quirks Definitions */
> +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> +		  "your-bad-compatible", NULL, NULL, 0x0);

At first I tried matching on the SoC (fallback) compatible without
success until I noticed you need to put the primary machine compatible
here. For the SoC at hand, that would mean adding 10 or so entries since
all current commercial devices would be affected by this.

Matching on vendor and protocol works.

>  /*
>   * Quirks Pointers Array
> @@ -78,6 +80,7 @@ struct scmi_quirk {
>   * defined quirks descriptors.
>   */
>  static struct scmi_quirk *scmi_quirks_table[] = {
> +	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
>  	NULL
>  };

Johan

