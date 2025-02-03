Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73C0C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXYlcduRaEuZBAJSJkccbjFtw9LjN05LrT6o3bd+HDw=; b=WTxCT4wPe82TWWsi/kBajlif0H
	i5ZmtNfUoDOYodbxw0/NXJaBiSWzKO6CyCEkJHStfkQ0B7nwU5gdZi5R/LTPHy+ZjST881+5m8h5f
	DuG3Vy5Gb73Ul0YK/OgemTCjxyfW6dZeKJY8KvkCAFdbUkxMKJOpSvId8vqjukWZJ1AZX5ct8J8JM
	rt6ueo3188oQK0VVocGSuYFahZHQ49uSdWiwm+/1UvlmvUYO9ZJBoPkoAdNhMnclcNsbc099jLsBH
	iSyYRrzCsfYrdkRpFVrTRlW1dN0K7Qnonczct4aRowWIHxiLEZUHkGnDxQL/W+/Xq+fETTLbFx2LY
	IKX3Au2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepsD-0000000Edn3-3UUL;
	Mon, 03 Feb 2025 06:23:57 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepqB-0000000EdV0-1mm5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:21:52 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5136Lied2964707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 00:21:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738563704;
	bh=iXYlcduRaEuZBAJSJkccbjFtw9LjN05LrT6o3bd+HDw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=U/ZMQcy76SDdRgPJBjUDqOjH8hMX63KDfttvW8yCorGwHczDInvX94jcMEZSK6aBP
	 ZDa/Dr6arhhazNm8hR+V4zfzkRhetxWb/xYF2t12kCXylbCALRooreCGNBDOqeN5LR
	 qOCi2tp6+/uX3x0C7KWHyQ+trBcRdvdedIYGZeDc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5136Likd104541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 00:21:44 -0600
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 00:21:44 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 3 Feb
 2025 00:21:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 00:21:43 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5136LhIs004552;
	Mon, 3 Feb 2025 00:21:43 -0600
Date: Mon, 3 Feb 2025 11:51:42 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Xinqi Zhang
	<quic_xinqzhan@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
        Guomin Chen
	<guomin_chen@sina.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint
 across protocol ids
Message-ID: <20250203062142.okaan6libbn35cbk@lcpd911>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_222151_782047_5C94A9A0 
X-CRM114-Status: GOOD (  25.27  )
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

Hi Sudeep,

On Jan 31, 2025 at 14:18:20 +0000, Sudeep Holla wrote:
> Currently in scmi_protocol_device_request(), no duplicate scmi device
> name is allowed across any protocol. However scmi_dev_match_id() first

Yeah this was indeed a bit too stringent.

> matches the protocol id and then the name. So, there is no strict
> requirement to keep this scmi device name unique across all the protocols.

Right.

> 
> Relax the constraint on the duplicate name across the protocols and
> inhibit only within the same protocol id.

Makes sense to me, it will indeed make things simpler.
Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index a3386bf36de5..8acf33ccfd21 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -42,7 +42,7 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
>   * This helper let an SCMI driver request specific devices identified by the
>   * @id_table to be created for each active SCMI instance.
>   *
> - * The requested device name MUST NOT be already existent for any protocol;
> + * The requested device name MUST NOT be already existent for this protocol;
>   * at first the freshly requested @id_table is annotated in the IDR table
>   * @scmi_requested_devices and then the requested device is advertised to any
>   * registered party via the @scmi_requested_devices_nh notification chain.
> @@ -52,7 +52,6 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
>  static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  {
>  	int ret = 0;
> -	unsigned int id = 0;
>  	struct list_head *head, *phead = NULL;
>  	struct scmi_requested_dev *rdev;
>  
> @@ -67,19 +66,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  	}
>  
>  	/*
> -	 * Search for the matching protocol rdev list and then search
> -	 * of any existent equally named device...fails if any duplicate found.
> +	 * Find the matching protocol rdev list and then search of any
> +	 * existent equally named device...fails if any duplicate found.
>  	 */
>  	mutex_lock(&scmi_requested_devices_mtx);
> -	idr_for_each_entry(&scmi_requested_devices, head, id) {
> -		if (!phead) {
> -			/* A list found registered in the IDR is never empty */
> -			rdev = list_first_entry(head, struct scmi_requested_dev,
> -						node);
> -			if (rdev->id_table->protocol_id ==
> -			    id_table->protocol_id)
> -				phead = head;
> -		}
> +	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
> +	if (phead) {
> +		head = phead;
>  		list_for_each_entry(rdev, head, node) {
>  			if (!strcmp(rdev->id_table->name, id_table->name)) {
>  				pr_err("Ignoring duplicate request [%d] %s\n",
> -- 
> 2.34.1
> 
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

