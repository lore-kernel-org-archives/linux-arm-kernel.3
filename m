Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A777CC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=; b=MAHNpXK6ORBEXlxaFPl/j43dyx
	FRmSfaUO3fEVGFgfsroCKq/pnIIgSxL3Jc1yyzgdvWPrKpqXQ/HXGU5Nx1Rj7nQtnatrco25ju96z
	sAgqa6OIScbT0QGqhULQFIZUxZdVLqqLcg/kxwbu/UIpLp31kTSvu0VhxIpr/BVNUgYw26HxdpLsD
	Sd+TahAY4azhp46oECntQ3XtACSF9hkMSteYrUrPyj6JMoslDYwGIddUGQF4YzhB9HXT8s57clyet
	0/zdhZZmlOtlwHy8GqHKtEeXPKkWi5xjU0PesHlMirA0U80wk7+neBqyD5HYgIKt4ALodxLrx0tUY
	zIIgjyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYjb-0000000HCSv-39la;
	Mon, 24 Aug 2026 17:45:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYjZ-0000000HCS6-2BWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:45:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFmpbq2857113
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=; b=nkN1N2rVXI16kjTo
	nqcMuUZQ4Fg4sO4kv0V8uLUIubPxlJNLA53XqwH+Tz6DAHtOFlm3RJi5W/QEPoj3
	QK9z6GSBPuPdf1Lk09du9JJ3XAfLMKJLNT4K2dJwNYFZPsJtPSO1ObLMD4goRJl1
	ji71K1O9oG9Y8V8ndb9IHdpg8YlqQG9nSjEbZiWlijQe84ouHlhhaOggg+M6Gd7m
	CLOrIaZEXJ9VMwHF4KvDCg8aLT/YZSfvCC3VQCybqnhapgTFpAjOi+zX+akwk/Q+
	IXeD3Kz4QA8yFYfxEY1gVRXVZGo7bJOZ8PNAsBaWtNmHLW+k5lRz6cM9RJE0s5q4
	faAB9w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsj5ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:45:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so4460372a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593520; x=1788198320; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=;
        b=Py3TguV+Kp238Nc/8qHKzxA5RPc4/e+xRQkT5+CUSTBqvpCuwCTpo6qYGpm/UpdSlp
         lpgIE8ehZBFf80l8CXTUE7SLmk93R70M1PWSRxxi5zmgqBbgjSAOx9EQ+/kP6vBt0fS7
         HCJrtp30Y3ndNuWVZdpqQRmYVGaYtXQ6RTOpjkg93S+JQ+CtUNfCd+HGCmehDlqLAiQH
         9HaBXW/eL8Dt4wrCBykgPahPcA93sEBFcAsN0ysXNxxsYoaLR00CgLtWl3NbzOB+/HB6
         3gCp9ydPNUpwbXwH57GthLvkp4iWUWrH2hdfXO28n65c51mjWwKvsvEQ9Xk/gFtDHDrN
         rqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593520; x=1788198320;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=;
        b=Bmu/j9g9cAy0B8vEvmzJjbsJq0g8ef3GDl7h4NCrU3G9cRrzd2iS6kojR16Gzg/G/4
         4CQkGFHkkuJwVJ3GgIli3rLhJjLDrjEp8zqCEECnUM9hzaUZB4yzyOeeg8Wg1+ZuchJc
         Izu8S9p9htt+3P7FLV860qHTV4rcyEbd9/lOQySrCV5Z40AIRhnX01C5ARDuFS27ckWb
         hx4aDr5HdeLx7x1pN5WFTJgbUBBs0KlQrRk6ZJa4gN0r6jlex/ji+oNpzoGJmHa4A/Gj
         DiVnTFPCJ7erCFrfTHlAa8/75/lHWnWOSjvUViSwjgI1p0eFCbkCyp5fzZrCk7WCSe8/
         9+jQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhwYRW3PH/RpjksZBOupNGY1tsiOkudVNeuzxkpSZtuFo4b4xxlmdUnW67NQZLYkWXLWnlplsCfb9osQwAzktT@lists.infradead.org
X-Gm-Message-State: AFuF++kxZd4BtY4JeuSN2MTqq8tkbc/t7/zk+sbP6lvrbPnpSgSHQJW9
	5NcRhDz0sAXeghYrL7OLrHoAG/KXfRqrFv7T263gBhNYsZIydVzjVpx+tL8JzUKuuy1wUDItVEe
	nGL4lKnnWSXwvB6CDOh4JLzDdk06/D+lohpgtIegAIEWZTPoR624iTMJZdk/cn+tgtqGU5sJnKm
	gYYw==
X-Gm-Gg: AR+sD13KRaudCJWYqKXdwtN5sYGP8cp057qkbhEJwHMYNFl5C/DU1Gv1MUD1Yc8du/K
	Rj5EzGX2smBroBS4tT90QbviekEGux9ggva/RmAVDHPp9CdqC+EWewZQub9SIbz8tk/JXHmOTmi
	lRKlUxQI8CkgSZSWzN3bNjW4f40NgEopH2YFizG197Q4lGvTC2Rn0iGh1byAQ/i2lR2m1PQudCN
	DvowxczIldWGyzsMNqQCysiS92bKcDJxYRSYnfLQkk2juLhCsqCTmvWIIMUw8peVezJPFCkGNPI
	UA0anso549SUwA9yKa5/h9xny7fEfEs08Zt7QNKdEocd3Tk2t9sdZCFkbtzDzPQxPhGAXsSfD6v
	7mN+t2l8I2/lNuNRObKEIb64UZQ==
X-Received: by 2002:a05:6a21:790:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cd300d467dmr57067901637.13.1787593520182;
        Mon, 24 Aug 2026 10:45:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:790:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cd300d467dmr57067819637.13.1787593519750;
        Mon, 24 Aug 2026 10:45:19 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c697esm24112160c88.3.2026.08.24.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:45:19 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:45:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 5/9] firmware: arm_scmi: Pass protocol ID to
 chan_available() transport callback
Message-ID: <20260824104516.00002b8c@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-5-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-5-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfX+VFOB0ycELmL
 djp2NkiuOOqVK16i3r5VWSbS6Kd8lhFePPDVTCcxCNn5BtSbg4XFXoEsEBOO1zH3UhZI2qg/CH4
 m4xONwqaj2CJizfu0k5l4DWvTpLGwdk=
X-Proofpoint-ORIG-GUID: FpgTDsBfvYOhz_DQoCH0R1gnFbRiUvqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfXwZ9JGBSWv5TK
 shRM0zfgNWfq/y783Rk5wJyihhHMPMjo+c7zkJ25b51jcn3upUqw2yf5wGsJ8DyyrQMzZxUM8j8
 yoqFxMdjbosPTtrw7cb1ofT4k0MMzUQYGVNiwh3KWaFz/sAKDpmi7j3L+jNlfAOlWW4scyQygwx
 BQHJWc9zW7Bz280ThD3VUgKZpLtyJWJvO/GO29VP+d3+fGt5XefF8/fhjUU209IsP9uCIMg8ZNM
 2Xo85nh2G6widlU1ANyFyyJdaZNXgJd1mY8hCk+PIlxjHRUmvvIBVG+CBQz9ElK8hzH2us2zVpR
 wMfBRyWjC1SQL58tFygXhxdIiXmPqKn0RgY8lWLqMXKQ20iQ9cNO5romJYu/9LB+pJs40JWdcvL
 ZvtGZ/4MeVBMQbmn3CPxscLo/vxd0QWlWQ4UuB++4wgEOpABa62jkqn/8dsqQbuENMtJ5Of8jRz
 t8u3ftnRSTOTq6fSDMQ==
X-Proofpoint-GUID: FpgTDsBfvYOhz_DQoCH0R1gnFbRiUvqC
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c8330 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mK2TJSJBIbLwxmLH4kIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_104521_572416_D8BDCAC1 
X-CRM114-Status: GOOD (  24.89  )
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

On Thu, 13 Aug 2026 12:33:00 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Extend the SCMI transport_ops chan_available() callback to include the
> protocol ID (prot_id) as an argument. This allows transports to determine
> channel availability based on the specific protocol being used, improving
> flexibility in platforms that share transport channels across multiple
> protocols. This will be useful when ACPI PCC transport gets added.
> 
> Updated all existing users and definitions of chan_available() in
> SCMI core and transport drivers (mailbox, optee, etc.) accordingly.
> 
> No functional change.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> ---
>  drivers/firmware/arm_scmi/common.h             | 3 ++-
>  drivers/firmware/arm_scmi/driver.c             | 2 +-
>  drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
>  drivers/firmware/arm_scmi/transports/optee.c   | 3 ++-
>  drivers/firmware/arm_scmi/transports/smc.c     | 3 ++-
>  drivers/firmware/arm_scmi/transports/virtio.c  | 3 ++-
>  6 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 042867c28b88..1ab4543e0f4a 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -207,7 +207,8 @@ struct scmi_chan_info {
>   * @poll_done: Callback to poll transfer status
>   */
>  struct scmi_transport_ops {
> -	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
> +	bool (*chan_available)(struct fwnode_handle *fwnode, int prot_id,
> +			       int idx);
>  	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
>  			  bool tx);
>  	int (*chan_free)(int id, void *p, void *data);
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9ad827c6a9ab..aad678db0f6e 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2768,7 +2768,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
>  	if (idr_find(idr, prot_id))
>  		return -EEXIST;
>  
> -	if (!info->desc->ops->chan_available(fwnode, idx)) {
> +	if (!info->desc->ops->chan_available(fwnode, prot_id, idx)) {
>  		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
>  		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
>  			return -EINVAL;
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index b692cae4ff25..56af2cb0f424 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -77,7 +77,8 @@ static void rx_callback(struct mbox_client *cl, void *m)
>  		      core->shmem->read_header(smbox->shmem), NULL);
>  }
>  
> -static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +mailbox_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	int num_mb;
>  	struct device_node *of_node = to_of_node(fwnode);
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index 07d3affa0964..6022f74d28f3 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -314,7 +314,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
>  	return 0;
>  }
>  
> -static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +scmi_optee_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	u32 channel_id;
>  	struct device_node *of_node = to_of_node(fwnode);
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> index 1079cd01190b..ee9e44468c1e 100644
> --- a/drivers/firmware/arm_scmi/transports/smc.c
> +++ b/drivers/firmware/arm_scmi/transports/smc.c
> @@ -84,7 +84,8 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +smc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	struct device_node *of_node = to_of_node(fwnode);
>  	struct device_node *np __free(device_node) = NULL;
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
> index 6b060d61e0ca..3d608c8c4fe8 100644
> --- a/drivers/firmware/arm_scmi/transports/virtio.c
> +++ b/drivers/firmware/arm_scmi/transports/virtio.c
> @@ -375,7 +375,8 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
>  	return vioch->max_msg;
>  }
>  
> -static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +virtio_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	struct scmi_vio_channel *channels, *vioch = NULL;
>  
> 


