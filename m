Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 23:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=; b=fEbd2LOYQk1bZ6PSepfe21Q8Hn
	de4uznUzleCos/SuMAIa8gQ8U3MuZc9u1PScNWZZFe9QDwaWj/CEcJ1mxKtfDE0CozAhMfxSQ/aSk
	HlI5LFSPU4Tj9mL+cS+9ZkGh78fCrj6GGZNxTuWbDEagTqHSH36KxJYyBkwRHK3kzEV4B9taiwquq
	A11bPjF5qrht6W+2KcAhVf1yJGsxQPxQcltZiEH90xRKF4o0cG+ZO2Nb7GWA9aohG7+KW8ycBo3KG
	vHcwbwRtUZJt1cTrk5D8yhZ+BQJA5xUxtGiTP7H6z1hX1aNEcFUB0EaUr1uP38OSg24kqa8t5WJSz
	MrHiv0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uON-0000000G5Wp-14YB;
	Wed, 02 Sep 2026 23:29:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uOL-0000000G5WS-2Meg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 23:29:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHfT63435171
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 23:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=; b=A2DvgDMKzHTOt5un
	aO9p6yLPTPDlW/3zYBXyIiUgMEh7OfiyYis2QUDlVvddUfkBpMzgT86R/70Q5NQ+
	F1vUjMI/6iqLi+vkw1yomQhqRVtgvpS9f3EFrvpqPqd7SFgYDIHXGnHQI9k1k5kF
	Bs0UYJpWV1/s7r2yzXQtrGabXjFYFae8Z+rygXt7Xr7nXvLzShYf978t1R6k3hGZ
	KBXq1ZftY3B1E4QefQLvIguplwYSXscH2kwJGg8//bWrK6g8ujJBW5ZGPKwm39Uu
	p8Q8uJMeqMdiYJp2hnTs00iX/MQzMdf4IO7nDT8UME8DEg9JJCl8enzHAg6tEBTj
	TgwXPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy3mkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 23:29:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so3761345a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 16:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391755; x=1788996555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=;
        b=dTO3qtDqRnUDC/RDb7/2JJ6ZxagboagLFpxNtaGuNkRSkNXjPe5M13lIQBtbhJK7GB
         7ZP7FcV5dnlDqoKMvbdauUTR6hyIraAs0UI7F2v4NWbkxDd+YPmmQGuiNnEvfWZkCwsh
         qK5DuUCrK3AyFzTowVNwz/CAtt22++uHbSCkv+OrUFx7Vy8HLAJzH5DfcLv2CZbGgRlr
         yFWJs51yGc4rSmKD4R8UBE30umVJTW5Oq9t8l/HrYFMqQnidfhz98M+NyD6/9JXiFcYc
         9s3L6rCA6vU9sSU/M81SAt86LkvyLgNND+pzTWrqOITNIAJViWqsk+YQ7HS7W3eS/WRS
         CSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391755; x=1788996555;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=;
        b=Bn8AxtO16od9NmEUYs2FDINzsBNOeVDYPsj19Wg2hAHm4ACpogJTxMmYq4SNnCiDmo
         8Q9K83B9jMTIWzJWxVJoRS0vnV/bNLUxsRh10wzRlHi5DeaRJcsD+MH27EPFJ1d9oVlx
         aQfWVH5WzokyI6pzmjhCgcUIhaJYX7I671J18TqpJ3XT0H9wszgzXnKYAXLrn9v4SMVL
         oEkpw4MeWu2eyEIwNcc6Yd+ouSb23EGe6ChpXJDXt7mASS5PGcxiNciQ+ncBTgAnzptI
         dTLJH/DFns/TB80FV0gIX0KMkNzjMRpqzFbhxGU5ADoWY//bpu6jTzLmAQGULp4rZu2K
         Fbww==
X-Forwarded-Encrypted: i=1; AKwUvBwiCLJVPJsxSRH1Brs8zCf7+fkR3ue6EZlekpC7zRKo2IN1D4LA03t67jD8cQq3EOFCWkAfo7JyySn98LOiQWCt@lists.infradead.org
X-Gm-Message-State: AFuF++nYkcx4aPngggf59pzFohSMOdpKAkbobE9s5XgjNnicaJNpy4RS
	/t0LZbVmq87qBzdZoKMmWdpnpTvXHR4/H+TEbOD6AngPXxh8Wk2uClY8ajRtSErsA03Nfryj2iF
	ZfLCqImcidITipHh6pa/3gc+J4yN4miXwru5Mf15E9xH1CHuVIvEjOfEl9eymNJh7eKLBr/aND3
	1xdMuERkQM2g==
X-Gm-Gg: AYBFou3JciXBXAC5OFr/WjOMJouiJB0bd5stgn/M87WiwC+Wbbye6G30uaKT6B6kZcB
	PVc/tWWWIqMH7QSzhXsFDvLaWuYOzlg64+SlQSiVfWiOfoum0ftEjvrqqzm75Qff+EMyPoRBGFj
	4dO1ECfDuM46qIyJf7JjfKd/h5ph4TVri/AJrW0Qfvy2uXJlro++LqOIHFl6b6MkkMsUU5y0jEj
	GWe2wr/ijiqS4xdxXk371WGCr07reKXrJIaCjgsXKNvac0FXoFHCVuROjrb4jR6xEYO2w/Uh4eo
	0E1k4l8CCCcBB/FIbUXYkmeBe1gh9ONjLzX97lTmT2kRdOew/4MVGVhXqJjrSUt1f3GahWT2R7m
	LdGXyLBsBUaupCKNqZfy/iw6PzLM=
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr12870228a91.15.1788391755186;
        Wed, 02 Sep 2026 16:29:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr12870158a91.15.1788391754734;
        Wed, 02 Sep 2026 16:29:14 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534c50dsm1363747eec.7.2026.09.02.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:29:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:29:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260902162911.0000761f@oss.qualcomm.com>
In-Reply-To: <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
	<20260824103929.00004912@oss.qualcomm.com>
	<20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98b14c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BGMOuxRx6cLfrRdBKbIA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: D6J5QMH7lRF3c0EUWDL65q2NhhWFAg83
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX38EAegZ4NEUL
 3qLKqpAfDCfykRlLvt2QhOsgl+YZp1GExzTCpcjFmPQnZj9mUhuEsR/e6hv8hGT/GERvanKt941
 AzYwZvLHL8PyrhgudPpw+fd6CyjagWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfXw0JYIo9bq2W/
 YDcDOX7cEWQOtOtPGx24Y46XM/geBWxZQf0nAxmQ+Apdz1TFSdnwzIQJJMcZpcnmIG+8tqnOFMG
 0X0pTdpZ2mqiSzReh8oA/ZLOm6Uu9lyALlW8A/dX8Iih8NIa/t5ZY6In1AzatQLjfqOTym7UVz1
 b+JW89ZtCTAzX9+MYcLY/B6TrQtBwT91+A1UB8D+MaNKTD2oLtmx4Cma/F+sVcu7qqD8q3CCqHP
 QwX759oOMIpkDs2ZVUSMvn0sPWeclcrGigVP0Xo7KRQHDybUEUVwIFDXZQnhTnA8AgFBTwDYgmD
 4uJjKS9/QK6SrbkKMUYgvLwvynU9F2YHFBA9WujtedJ/5Oae0oNK/JRvAoFPmQ4WWMhkD9dfJ6a
 pl/dgT+kpAbjDIGJwj8a3ai2zG2xlDI/50CwMi0cIYK50JG85viLzKlkt9srPfvPe+YHU8bWi5G
 EGsi6EdlA/oIKSPxDpw==
X-Proofpoint-ORIG-GUID: D6J5QMH7lRF3c0EUWDL65q2NhhWFAg83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_162917_726233_97899A45 
X-CRM114-Status: GOOD (  34.68  )
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

On Wed, 2 Sep 2026 14:39:31 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:32:58 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Switch SCMI core plumbing from struct device_node * to struct
> > > fwnode_handle * so the core can describe SCMI instances and protocols using
> > > firmware nodes rather than OF nodes directly.
> > > 
> > > This change:
> > >   - Replaces core OF property lookups with fwnode_property_*() helpers.
> > >   - Switches child enumeration to
> > >     fwnode_for_each_available_child_node_scoped().  
> > 
> > Why the scoped version? See inline for more on this.  Probably just needs
> > a comment here (or use the non _scoped variant)
> >   
> 
> Sure
> 
> > >   - Plumbs fwnode through the SCMI device creation and channel setup paths.
> > >   - Updates transport ->chan_available() callbacks to take a fwnode.
> > >   - Stores per-protocol child fwnodes in info->active_protocols so the core
> > >     can later locate the descriptor for a given protocol ID.
> > >   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
> > >     back to OF nodes where their existing parsing remains DT-specific.
> > > 
> > > DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> > > properties by mapping the fwnode back to an OF node. On non-DT systems
> > > these transports report no channel available.
> > > 
> > > This is a mechanical step towards firmware-node neutrality and prepares the
> > > SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> > > continue to work unchanged; no non-DT transport is enabled by this patch.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > 
> > A few minor things - with those cleaned up.  Only the cleanup.h one really
> > matters.
> >   
> 
> Fixed now.
> 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> >   
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > index ef29fd223287..9014723e0f7f 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c  
> > 
> > ...
> >   
> > > @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
> > >  
> > >  	scmi_enable_matching_quirks(info);
> > >  
> > > -	for_each_available_child_of_node(np, child) {
> > > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {  
> > 
> > There are no early exits yet and I can't see any added later in the series.
> > So the scoped bit is irrelevant.  I don't mind the change on basis of
> > hardening or similar but it needs a comment in the patch description to 
> > justify that.
> >   
> 
> This is mainly to release the reference taken in
> fwnode_get_next_available_child_node(). It is taken explicitly via
> fwnode_handle_get() before scmi_create_protocol_devices() as discussed
> below.

When the loop continues to normal termination the puts are all there
anyway as part of the iterators.  The _scoped case just deals with
early exits via break or return.

> 
> > >  		u32 prot_id;
> > >  
> > > -		if (of_property_read_u32(child, "reg", &prot_id))
> > > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> > >  			continue;
> > >  
> > >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {

