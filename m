Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8D4C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzL0HH6+3pjB6JtUVnEkC+XEezkYR9X8Kd/L450a2PU=; b=JUO7B2cS0cbPnJva7E4OEEzJCQ
	XAvJZtBTI0Ptngvsa1D3lmNBcWD75bBIsHI/aNor7EpSlvReYF8+4b6A1NwGiqtzoNxtRnc4jy4cF
	rk9pw0DJt/FL8trGdA8kRs8QqjYKYeZaw7tNhNQh3pmJkW1Bac+0UfDXSDQbO/tTSqIWxBxe7/oCg
	Gec9P4kJt2TOvCE7Ba2tvzc8v7rSeJaKoeR79Y2yoP1RlfqyO1iuHZqjnkA3/AF73GLRRdNtcLu2a
	LpeNreK97e6wwTGmBzWiFO7oTYLRKFbB9mskN5MRRUBEqJ9RL23sFHN0DUTC8LPcCFQwrJBTXT2SZ
	TnvnZTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCml-00000002sdH-3C9b;
	Wed, 26 Feb 2025 08:28:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCUo-00000002pAO-2qU7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:10:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abb7f539c35so1262007466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 00:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740557420; x=1741162220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzL0HH6+3pjB6JtUVnEkC+XEezkYR9X8Kd/L450a2PU=;
        b=cjxYjVxLdAPkTNnHf1hwUrHKneaFC2MfoPEsNCX+v9RbghLZ9fy+X1ZDV/rIzFz94w
         oy68Ki5vtUmTCZNruCH7JT8FmmR8AkcdTqqMXo0sD0XcDRbm2wm8u2Dk9047lbnlI0+i
         ZUc9JCmvpX/JiBXWpHhMaHLHK4KhCYK+cSOMap6aV6ycZnitPjbLW83DPNXtpLPwUMo1
         Umo9LNlD2nrxjeyIkHFrykJ8Tz+Uvf06B1nby4/HYwzzC/A8lOIN18zYf1rMzsnoJce0
         A0E4nQLUHqV25G7HfeX78oHCBbEiJSExs8DUIMEWFKAFUUKdqBdDri1rScBiaeAlEZ8i
         WoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557420; x=1741162220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzL0HH6+3pjB6JtUVnEkC+XEezkYR9X8Kd/L450a2PU=;
        b=JVV55PLlVCzR6ruQU+PLongvaJboYMIeNc7VCif1yGypwdiftNgSbzM14KuGC4U4Wp
         G9td45W7BD/u3nDwQTd5+8v6YOQ7t5747d+Xke/N8FRLS8cd3SZzRt+IiYtnjzCIAzYg
         W4J5QgU87W0RKaeLOFM6mOLFdOQlOwH0MkyTUz2RQ1E5d+GzdWFqexy+SoGBd+BuiMH3
         ucRUZBnYV86jv+HXIZI3dLWE5sFiOVpS1YZtAvtcrl73bDqQii9PiVZQhQ3td/XYhTuH
         9MnkyP2oSCm7zIEv073AXI0CmDaSgIprEZf4LF/9qJoyJabhKwRZWeQgpKcKI21+bjpZ
         KhAg==
X-Forwarded-Encrypted: i=1; AJvYcCWKqnGf8yEYR4pwtJ5kq9MbSNxkLbnHZwA5AzuRGjHQQeIORcq93/l3w8iW0FlffMAYZ9rTxdS3XbbqFMSbzSXF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+y7QWtRARu83uYdhR/KL2fmz9+f0TbPpIwSQO9e8urq9UWpAl
	Ut8ORY1kQjkzFboNtQdDAO3PROJAlAct4dgJRqYTFQBWElIX9y3j2XhQcca80ew=
X-Gm-Gg: ASbGncvxIOF+BSaFx6Azt4PfeTKMgOJBAECydDZsZCbnkaz5zZxTAGZLURM+LlnBg10
	IKLfteMRvkFs/DDiXju22uEkNQx8XFcPvGzaqPypfl9s8YrLV2CnLDqhkhcYrQwQbx/kE+VErDN
	y39uFbjzgobc917WwWVPwyV1ndybju/j3MqoshBJT7icd8w6ehxK+/rmQR9rHt9UoQYavi427En
	+ibtnNcjM4+xZatVbO/3c+Xe2OWxA2Z9n5kno7jeJzOJ0t1X41Sr7G7TCQDNC9NxhFYoUoRcs8W
	ntKxcbAFfEN8R0phRR38UzwKBTi2CL8=
X-Google-Smtp-Source: AGHT+IHpAStU3+Mniiaci5QMGYjPh41Vll/PquOYd6UlaCbeosoKMMhRy2Vp0kLKhOE9xPeFAQTT2Q==
X-Received: by 2002:a17:907:868a:b0:ab7:d179:2496 with SMTP id a640c23a62f3a-abed0c77de1mr720783166b.6.1740557420331;
        Wed, 26 Feb 2025 00:10:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1d5c369sm288355466b.60.2025.02.26.00.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:10:19 -0800 (PST)
Date: Wed, 26 Feb 2025 11:10:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, johan@kernel.org,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <4fe60edd-6e0b-4e7f-9d4b-632203790b5b@stanley.mountain>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024338.3994701-3-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_001022_742999_A3A9C0CC 
X-CRM114-Status: GOOD (  27.88  )
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

You're fixing a bug that is introduced in patch 1.  That's not allowed.
These need to be squashed into one patch.  I means the patch will be
slightly long and the commit message will be slightly long but I
feel like it's manageable.

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
>  {
>  	int ret;
>  	u32 flags;
> @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
>  		return;

This is explained well in the commit message but the comment here needs
to be better.  Also if scmi_protocol_msg_check() fails then we should
return.  Let's rename the variable to "force_fastchannel".

	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
	if (ret)
		return;

	/*
	 * Check if the MSG_ID supports fastchannel.  The force_fastchannel
	 * quirk is necessary to work around a firmware bug.  We can probably
	 * remove that quirk in 2030.
	 */
	if (!force_fastchannel && !MSG_SUPPORTS_FASTCHANNEL(attributes))
		return;


>  
>  	if (!p_addr) {
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index c7e5a34b254b..5b4559d0b054 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -48,6 +48,10 @@ enum {
>  	PERF_FC_MAX,
>  };
>  
> +enum {
> +	PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET,
> +};

Let's keep the FORCE_FASTCHANNEL naming.  Normally we would do this like:

#define PERF_QUIRK_FORCE_FASTCHANNEL BIT(0)

> +
>  struct scmi_opp {
>  	u32 perf;
>  	u32 power;
> @@ -183,6 +187,7 @@ struct scmi_perf_info {
>  	enum scmi_power_scale power_scale;
>  	u64 stats_addr;
>  	u32 stats_size;
> +	u32 quirks;
>  	bool notify_lvl_cmd;
>  	bool notify_lim_cmd;
>  	struct perf_dom_info *dom_info;
> @@ -838,9 +843,10 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
>  }
>  
>  static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
> -				     struct perf_dom_info *dom)
> +				     struct perf_dom_info *dom, u32 quirks)
>  {
>  	struct scmi_fc_info *fc;
> +	bool quirk_level_get = !!(quirks & BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET));

	bool force_fastchannel = !!(quirks & PERF_QUIRK_FORCE_FASTCHANNEL);

>  
>  	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
>  	if (!fc)

regards,
dan carpenter


