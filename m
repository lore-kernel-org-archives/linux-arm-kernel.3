Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D0CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP/daIapXnuz2z6qvUP5Y5lpGTgWQqoWHD66qAXBaiU=; b=W0amTKmHKKu7sTbsZWwjq+OiMT
	K8Y+ornSPyYmTk5m2GaqxtIoyg6h1tVExN4MooIreCJEswiCIIf3A0UqaPE1CDzTjNWgTTvi+PIgq
	+jT0rA0LbBDNoebckPRXYUqfv6xSSQY3H0MzltzRrzOL+D0NYoZFcet/aW3YL8/hay5VV+crfAOw3
	cc2DNLLPbML9r9qUKyeKAjtxnx5WI5HqbWmGeQoo3wIDuswf4GPApZ7GThc9DvbzMSHCor+AmK5i6
	8dFMW1sv4L204BrwuduyB9dgIjFG8qGGQhYEK5on5ZXRqC0e9OLJjCwGqb6qTJfZw2JfDjgKbJj3y
	ZWVJb8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFgU-00000002gL3-1RW1;
	Wed, 26 Aug 2026 15:37:02 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFgL-00000002gJi-13NP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:36:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hVTKJ6mPJz1XM6Jf;
	Wed, 26 Aug 2026 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1787758609; x=1790350610; bh=kP/daIapXnuz2z6qvUP5Y5lp
	GTgWQqoWHD66qAXBaiU=; b=AXU4M62tt+M4L9Ek5gxHaOdHRXES6OEDOMdBnixB
	sZNpRLmnUA/0AnMlf2f5U5nL8wJ97KE0BWWQAtTCc0TEO9zwNSodXQ+sN6K1NN+2
	srbEncFpk5Q3YEydZWKV/nKOwBTRkzAnQRveKFnWhC9cB0tdwJVr+wKr1jXu3PW0
	uOy6mLbvR4Pc78GFUxWcEB9KxNXRAzdb99r+L9U35p9bdqqa9gUIx8xKRl7XEWUa
	cKpHIAfTQ8tm9Tcwhf1Wyp6p+60YCmmRWYcRWzTkYnbUOm/QGx4PHvuTVdEPdhQj
	jyzN8z424pWSLKZ5cQqDU1IadVJ+rs8nzrSeB9iNcoC5Uw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cM3_naodxlgN; Wed, 26 Aug 2026 15:36:49 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:f6e3:ef81:c380:703b] (unknown [104.135.182.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hVTKB5RVBz1XM4Tn;
	Wed, 26 Aug 2026 15:36:46 +0000 (UTC)
Message-ID: <378e02d3-bc7f-4c2b-9e48-cb0610e9f421@acm.org>
Date: Wed, 26 Aug 2026 08:36:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] scsi: ufs: Move Versal2 M-PHY CREG access helpers
 into ufshcd-dwc
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-5-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260826134048.854748-5-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_083653_302778_CC099844 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
> +int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
> +{
> +	struct ufshcd_dme_attr_val phy_write_attrs[] = {
> +		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGWRLSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGWRMSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1, DME_LOCAL },
> +		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
> +	};

This array and similar arrays should be declared 'static const'.

Thanks,

Bart.

