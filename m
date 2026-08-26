Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0C7C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yA7IlEbhpc5JZOb1B2LTaWZGzNPT/IaVr/dVDVaDels=; b=C6iVmijDVeSQA0Em2v5dLerXW3
	Xgc2DzKAbjMYU/ceQksVQrHg3SjaG2gsVTMgPnx9CByr8UvY3qlRh3Hxpx2CaaQ39xDzFTLNX/gau
	GTrn7PvINsDCT/RcCL61I1yXPNXHjhB/6q2P7CmSF5tei+Rwnuo5rU7lDQCQX2gvgKhPrcQMO1onP
	PQuj9M8lAe3Sx3sibxHj5cqefulQUKb4Cnfqn1dyH1V+jez1XxJYS6sttfob7zQdGtKjfSJg3WDy3
	Scw4dRdQleJPjWt+S7984IFheEScd4WNUhOnLjyOW3tiXVzy/0jdjTjtNMMp5MUztzYoOI3BgY5Bp
	7FXwUIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFdQ-00000002g5l-0RhM;
	Wed, 26 Aug 2026 15:33:52 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFdN-00000002g55-0Ie5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:33:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hVTFk4Yp2z1XM4Tn;
	Wed, 26 Aug 2026 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1787758422; x=1790350423; bh=yA7IlEbhpc5JZOb1B2LTaWZG
	zNPT/IaVr/dVDVaDels=; b=QEQXZXAMTQgkZcw3A5aKtdAX0iPLxTrjOadJgBrX
	tSxI4sNod7uLDWVOB9NI8xLVMzONRF9EPdN0eATggLnyyY3bNAkpfVcBM7bQqGXd
	H3DP89khJyvDxn2OFOjPfQCgkxzDXV5NiRyOOAB0j4Lbf4fPmYXrfbC+9UyMcDUG
	/ZNdJXZFjTVtxc678l1RAWGziRlLoxVZG/TKNhqGKsx7kfuf36egdv5l2aaSgvD8
	FHeoEvtzg0djvMQawtSJNgXtAPkJ6FQGhma4KukKpCJZU66bcRbt9GTmL9VL0XfY
	KXJX3u3YAFfEF5jm+42uXxrREtbbdcCIVyUTce6eb0pz6Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id azxD2R4YC4av; Wed, 26 Aug 2026 15:33:42 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:f6e3:ef81:c380:703b] (unknown [104.135.182.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hVTFc2kFlz1XM4Tl;
	Wed, 26 Aug 2026 15:33:40 +0000 (UTC)
Message-ID: <4af1df20-f6e4-4559-9cc0-e4db05597090@acm.org>
Date: Wed, 26 Aug 2026 08:33:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_083349_168625_48F81BE7 
X-CRM114-Status: GOOD (  10.68  )
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

On 8/26/26 6:40 AM, Larisa Grigore wrote:
> +	for (i = 0; i < num_lanes; i++) {
> +		err = ufshcd_dme_get(hba,
> +				UIC_ARG_MIB_SEL(TX_FSM_STATE,
> +					UIC_ARG_MPHY_TX_GEN_SEL_INDEX(i)),
> +				&tx_fsm_val);
> +		if (err) {
> +			dev_err(hba->dev,
> +					"%s: unable to get TX_FSM_STATE for lane %u, err %d\n",
> +					__func__, i, err);
> +			return err;
> +		}
> +
> +		if (tx_fsm_val != TX_STATE_HIBERN8) {
> +			dev_err(hba->dev,
> +					"%s: timeout waiting for lane %u to enter HIBERN8, TX_FSM_STATE=%u\n",
> +					__func__, i, tx_fsm_val);
> +			return -ETIMEDOUT;
> +		}
> +	}
Instead of duplicating this code block, please move it into a new
function.

Thanks,

Bart.

