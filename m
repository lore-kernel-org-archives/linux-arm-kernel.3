Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8605FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1Oq5gT3pty+pigSDZEmQPkBK6p7TlsUx1c33dvXgVU=; b=GozE0LFyHq8kuYsRWQne3G30mw
	1+IPsFHG3gbsuJvvb0dnpm//nc73nq4f2IN2X7h1IgCQ4TmHJTnSqXjNxoxv0Mok0Fw0d7mk4S76C
	bn6YYX43hhMMEN+YSKevYBRaZSBOiw6d9nHDd8PO3bSyYecdcK0ADD5MAJVxZyT9d05J8S3UcymlF
	PdUAYEe0xNBkTQ6RLBa4huze6b7ygXUWnqEDSSttRydMp+Vc9AF5F/ZqqipRCmSq9hGObkJ3YMl8z
	V9JxyP6MrzXcl4JDLtwpXkhDzW+si52+9SXwVMV+XZKxeZN3CTbvB5BCuqnBs5UVJECN0SNPEG4my
	aT0/1Ftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGwF-00000000xu9-0MeW;
	Tue, 19 May 2026 09:40:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGwA-00000000xs9-1n2E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:40:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52A3B1CE0;
	Tue, 19 May 2026 02:40:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFFD03F632;
	Tue, 19 May 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779183628; bh=1EEkTBJ2/vsJloKiamHl8dU2H8n6mbJKFZttg7Q3C50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXuvZA0uDqawDEOb5EaXbgJaaJ3V8IDCO7Kauoys/FRL/PhPm7xUH3OOZgyw0DcVu
	 ovtFe0nUmSAveFCaoDxuGYOgu8LPY3DXOruyxPgXn+ci1jzvmjmXjzYeQR+Ufi+jsJ
	 jIUSe8XKwttgnVZreXZltxjoextS4UERkHWWwKKQ=
Date: Tue, 19 May 2026 10:40:24 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload
 size
Message-ID: <agwwCJ5_cL-Ip-xm@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_024030_778258_85493745 
X-CRM114-Status: GOOD (  18.77  )
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

On Sun, May 17, 2026 at 08:02:42PM +0100, Sudeep Holla wrote:
> SENSOR_UPDATE carries one or more sensor readings after the fixed
> notification header. The parser derives the expected reading count
> from the sensor description, but it did not verify that the received
> payload contains those entries before parsing them.
> 
> Reject truncated update notifications before reading the variable
> array.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/sensors.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
> index 836c294a9f42..b14bb1146356 100644
> --- a/drivers/firmware/arm_scmi/sensors.c
> +++ b/drivers/firmware/arm_scmi/sensors.c
> @@ -1072,12 +1072,15 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
>  	case SCMI_EVENT_SENSOR_UPDATE:
>  	{
>  		int i;
> +		size_t expected_sz;
>  		struct scmi_sensor_info *s;
>  		const struct scmi_sensor_update_notify_payld *p = payld;
>  		struct scmi_sensor_update_report *r = report;
>  		struct sensors_info *sinfo = ph->get_priv(ph);
>  
> -		/* payld_sz is variable for this event */
> +		if (payld_sz < sizeof(*p))
> +			break;
> +
>  		r->sensor_id = le32_to_cpu(p->sensor_id);
>  		if (r->sensor_id >= sinfo->num_sensors)
>  			break;
> @@ -1091,6 +1094,11 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
>  		 * readings defined for this sensor or 1 for scalar sensors.
>  		 */
>  		r->readings_count = s->num_axis ?: 1;
> +		expected_sz = sizeof(*p) + r->readings_count *
> +			      sizeof(p->readings[0]);
> +		if (payld_sz < expected_sz)
> +			break;
> +

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

