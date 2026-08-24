Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=; b=yLLRLMsk0qpDEiznpRkk65xqeG
	FKwQvlQdGAHOyZPsLxcc/HbwnDLTkW5KjcLpvGZBeNimcch0LTNmdkmgKElqMP16fkLGfE3axUk8n
	rWhOUHpyceWMPiArGvwLp465WFL/YZuqwcS8OrEtYHzOOjlQFtfB0YloUdNljA/CmcYv+eDpr9cqm
	ScztaXR5Mi/Bnu9928DZK0sH8MLYAZSAyusTHumPdp+qS9glBHyQtI5QlOGY8QCIbim3CvaNS+4XN
	G7WtwXnGgxxonOYgtMG4D6bGk5pNikCj+d6wunCszwwjYsnwKOIQhqbxL2CvJQt+mfyCAHQElgcP2
	RJ+24TFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYe2-0000000HBc6-1Gqp;
	Mon, 24 Aug 2026 17:39:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYe0-0000000HBbP-2F7O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:39:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFmhfs3994029
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=; b=ldK4Y3rdqqT+6swR
	AiN/73jPFhP9uGIrKnBXEfOYfm1WKjw7XlcyVFrCPlnSwxMx1BUNTmI8zH8rU83q
	NEQ/Dw2G4QyDzIrTnppp8ho4HdZQNckqq6B6ae4rK1IpqDhzSIQ/TVAgcHojebji
	TSe+E0RAbAqvNBxKQd1/XKv+TdiLDpaCpbSr2Xjcj5Snhl/8iZVzfNfvCSdydN1I
	mXHjSKELL2SqjtvNiZWE2z34UHE+ol612e9Mmbe7TrqZgrbHmMjQoQ5cUcCLWpzA
	h6RO0L89F5pNpbVsu79VLNLtnRUamja0kSs/1JaPl3MoGzOS8hJUXNy5Zwnr7o2H
	cqGpLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk2j13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:39:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee5bab340so5152997a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593175; x=1788197975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=;
        b=Cpl1x1IftxRIO8rgGkC5GWKMKysKfv16msDY1tHkL4I4R6hridY3PKtAcPnqLrsSxd
         bQ8/LvVkl0Jzr4jJcK4lMRT7O2HNW3cthfYbtRgq36j8omziM91uSk/OEJP5vSt2dU97
         rukz7EGb2BwRqKdHsZmk2YxHH5FWKfXpZvvwsTZKytAjnFXQbfoUPW558P/+bCy4lrpe
         WZ2htjauAx/bwE0u+RYLd0MYzT3K627yvgXmh6tatORTiicdeUBvkuNtDdmqGUQqmfau
         U5wHPcplljcnmmsPTUJhF4GPYxzREkAZ5QqSgn9BPVbJmXquBdV/st/E4wgIUUGOYfzT
         TmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593175; x=1788197975;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=;
        b=ZHY1oxagETJKahocYgNpEmO/4pXqO5H4NamyDrdTTLhI/CgJ/UxOlqCwZfYjrJ68WF
         ZKWGmw45slQOpM6HmNpMHFjWJQcdLUwRMxynRULZKBejAWbWuvft1XXPb/84Z0Vw6wog
         rjvxCjuBuuEAvHrlh0r0P+G3IURzaxhkJnUo9TIsnPrbR0nJE+t1rXdkVUzEEmUta4qF
         oQAWwYhAjoXVjSlFLcEsAqgHbDbJXwJ37zlf4odk7f2MU9Oy3ivv5UhS1YMDhiX2SITD
         G1pYmBYSqn+nWnFCFDLwQg6o5V7+01cGQSBoyKB18KD8ixUyWIQLEhB+yOOGZdnfr6HT
         IafA==
X-Forwarded-Encrypted: i=1; AHgh+RpsSvVbbVbmFdjjKO++/ZKz0wtuAPxuKHy6LHY8CjA3Z5u/hGomfgSHCfDePG4ybNtzQ9ZdiX0lPWl9vIoP3kVf@lists.infradead.org
X-Gm-Message-State: AFuF++kAUhhJeRVDUMZ50+1Hgv/wy2MQoA6vRHOLmwfOSBNFQJlXNWIn
	GJkKVZlZqKTgw6/Dq/V44rxYhqnWi6/jQZIKsoSuLo4vIK4ylurYtFuyHDiKBc+u3riWyA5WFpy
	JP64dVxqnSdqEeVXfWImIajnPGYhhItADGTN0Q+d/vWKXmleP2b4kcFHNGiIX0AaemH3W/AbASM
	7eaw==
X-Gm-Gg: AR+sD10IURmJvI+HIPUg6RUXLUkJsCJWeshLKQawa6Dl6EJf4YM2gtefwe+G9Ifch5A
	s8Fg98ofBv6jhuSp+5Lqnrw78Tcq9oVhgBhY+RDZqmngLSZ2sOxxrY55ED/gKvd1J4iiAeS9PWT
	Dk9QZTuEMdZ2yOZ3Y1IY6TMfOr/qfvOdbc+FRgc8lko+J6Rgah0BF88rmvaVMfNroMoDuguL5Bx
	bxV8aAoQKak2HbqeDyJFGVbQPhajlB/ElE/cLLpEmqDPIm10ZFXT3lc+5pmk03j98W/gj4hM5b0
	jYFKOMIH8CWUuS0j6ypjofgGy1xC/z9X6FpMJ4p+O93idnYChQYfRFbtVKXccxgtK7C9iTQYRLP
	cLAkzNLcci6Eqfn+RoaRM/6HE7A==
X-Received: by 2002:a05:6a20:43ac:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cd2fdb913emr52171329637.1.1787593175197;
        Mon, 24 Aug 2026 10:39:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cd2fdb913emr52171228637.1.1787593174717;
        Mon, 24 Aug 2026 10:39:34 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm41944772c88.8.2026.08.24.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:39:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:39:29 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260824103929.00004912@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vO6BvtPD7Q0wR0HtR1whS9JdOSR6IEu3
X-Proofpoint-GUID: vO6BvtPD7Q0wR0HtR1whS9JdOSR6IEu3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OCBTYWx0ZWRfXzMWt+6ZdvaZ8
 wVPxDbc7UE1IWerLdJsWC8cnQIV1xifaZVbhJWurVl3TdGywzxZYiUESaz5luG0RQRJ9g9Z7Eqf
 iOVve6twdNPXyHCJ8+usaVLYIDEqSHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OCBTYWx0ZWRfX54jpatFoXqyV
 a7caht3zq7Parles9hUSdq0rBl4H/b1uRygNNC0QeG4nrJmI8+K0qZlU4fjFxnVLDUMk47pAMpu
 oDSbBZQSWCXkqZSScjrQK9RGombTIXzszPOnTDSagpaxJ6+cSm1EtxlRHqzZqhXl+HgVqqb7Bzd
 LzO7PBNbUMu/0Wo2A/f953yuiW1KTOWwdf4orMYwNocoh3j4D+JqhbN/w2x9ZMk5G3hTzpPCwpl
 PJllwtyimQPVT+PBT8ZXXMKgqkErhjBCBqFK5WfXVhYI2Doo29Kofc2KaABkYZLPZLjMU5fykZ7
 OxRgUh4zEVAqZ3A+G7ba/v7dHMhD+e7p2o0hAGxqCtPsuQSmPAp5tTS/ItBPoCeI6fXNe0cYV2F
 J4vVxnKAeWZfMcPjG9DVJdzUHnnlEtKsxv6yyDHAcmcVNpoE09EvJapahtekYeF2CJaqJAbXZhe
 gzse5wQqgGanMJvr0Fw==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c81d7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v8xRkvQOyyHsUIWQxGAA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_103936_585617_AD3C8F1F 
X-CRM114-Status: GOOD (  31.20  )
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

On Thu, 13 Aug 2026 12:32:58 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Switch SCMI core plumbing from struct device_node * to struct
> fwnode_handle * so the core can describe SCMI instances and protocols using
> firmware nodes rather than OF nodes directly.
> 
> This change:
>   - Replaces core OF property lookups with fwnode_property_*() helpers.
>   - Switches child enumeration to
>     fwnode_for_each_available_child_node_scoped().

Why the scoped version? See inline for more on this.  Probably just needs
a comment here (or use the non _scoped variant)

>   - Plumbs fwnode through the SCMI device creation and channel setup paths.
>   - Updates transport ->chan_available() callbacks to take a fwnode.
>   - Stores per-protocol child fwnodes in info->active_protocols so the core
>     can later locate the descriptor for a given protocol ID.
>   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
>     back to OF nodes where their existing parsing remains DT-specific.
> 
> DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> properties by mapping the fwnode back to an OF node. On non-DT systems
> these transports report no channel available.
> 
> This is a mechanical step towards firmware-node neutrality and prepares the
> SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> continue to work unchanged; no non-DT transport is enabled by this patch.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

A few minor things - with those cleaned up.  Only the cleanup.h one really
matters.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index ef29fd223287..9014723e0f7f 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c

...

> @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
>  
>  	scmi_enable_matching_quirks(info);
>  
> -	for_each_available_child_of_node(np, child) {
> +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {

There are no early exits yet and I can't see any added later in the series.
So the scoped bit is irrelevant.  I don't mind the change on basis of
hardening or similar but it needs a comment in the patch description to 
justify that.

>  		u32 prot_id;
>  
> -		if (of_property_read_u32(child, "reg", &prot_id))
> +		if (fwnode_property_read_u32(child, "reg", &prot_id))
>  			continue;
>  
>  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> @@ -3370,8 +3372,8 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		/*
> -		 * Save this valid DT protocol descriptor amongst
> -		 * @active_protocols for this SCMI instance/
> +		 * Save this valid fwnode protocol descriptor amongst
> +		 * @active_protocols for this SCMI instance.
>  		 */
>  		ret = idr_alloc(&info->active_protocols, child,
>  				prot_id, prot_id + 1, GFP_KERNEL);
> @@ -3381,7 +3383,7 @@ static int scmi_probe(struct platform_device *pdev)
>  			continue;
>  		}
>  
> -		of_node_get(child);
> +		fwnode_handle_get(child);
>  		scmi_create_protocol_devices(child, info, prot_id, NULL);

Give this is handing over ownership I'd make that explicit and do

		scmi_create_protcol_devices(fwnode_handle_get(child), info,
					    prot_id, NULL);
but that is a slightly unrelated change - so I don't mind if you don't change
this one.

>  	}
>  
...



> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> index 1fce3ccdeb7f..1079cd01190b 100644
> --- a/drivers/firmware/arm_scmi/transports/smc.c
> +++ b/drivers/firmware/arm_scmi/transports/smc.c
> @@ -84,10 +84,15 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static bool smc_chan_available(struct device_node *of_node, int idx)
> +static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
>  {
> -	struct device_node *np __free(device_node) =
> -					of_parse_phandle(of_node, "shmem", 0);
> +	struct device_node *of_node = to_of_node(fwnode);
> +	struct device_node *np __free(device_node) = NULL;

See guidance in cleanup.h.  Basically says constructor and destructor
must be together (that was after some grumpy replies from Linus to early
cleanup.h users!)

> +
> +	if (!of_node)
> +		return false;
> +
> +	np = of_parse_phandle(of_node, "shmem", 0);
	struct device_node *np __free(device_node) =
		of_parse_phandle(of_node, "shmem", 0);

And don't worry about the inline declaration - this case is specifically
allowed.

>  	if (!np)
>  		return false;


