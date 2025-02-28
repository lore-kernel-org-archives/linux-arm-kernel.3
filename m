Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D94DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijqd47QKXGOVwTEi1MWq3e8jLsHYg4U3JJwxKiy6Sug=; b=wkqPT9Qmkybvs4urY3SIjLZeUS
	XUmMzfAkD3KP2Y46K2olObXDHVdoRC8ENUVlestz6TPHfIfkTBjdHxlUzf/rqgNjCnD+ZF3gZ21UT
	A8+3bUNb13YePmyXs0pcbOCBVOZrwvWEjP68POE5emdhGzvnjJW9dNoUuRPRaerBp8b2ZDpQMkfky
	R1XTInSAQeJWZ46Qs+6Cxd/6PXcVBFPbudrbIJCCxYPF7Ue1ctcywQ+s2cT8cNNEfP4dcmoHTceNI
	zwOvrnTRRKWcRyFZnv/5fCRydlpRLYUAxZC9MQPyfFdPLG86kUAlZEcYtxpYfNMB8XDO5O+44pUNq
	tB6WoZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5vm-0000000CLkJ-0Hlr;
	Fri, 28 Feb 2025 19:21:54 +0000
Received: from 002.mia.mailroute.net ([199.89.3.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5uC-0000000CLOZ-1kJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:20:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by 002.mia.mailroute.net (Postfix) with ESMTP id 4Z4J242R6Dzmhb81;
	Fri, 28 Feb 2025 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1740770410; x=1743362411; bh=ijqd47QKXGOVwTEi1MWq3e8j
	LsHYg4U3JJwxKiy6Sug=; b=PjOXS/Fxfg0tjQZrZ0JbYpPXzCAUMc04MjT8DQrM
	eA69NisCMokjX6Nw0EaWCf3Tafi32+f/5nvrkZXdQWqisJ2Jh22ahQ6OVZBnNaFs
	bsxvEAsY7THxzXW5w3I3j46VKSHK1Fv3q0u832yDfPCd8m6Qsm90jjyr/OWijCJS
	5I4/cU+nqGaBCOYe0xuLUvUNoDtsDQgoBnrt+81CDM5t+P0kI9nTxmCiFrPM8LiW
	HPz8mXslEiq9YIMzgsmAmDA279kBMtKvyphXfjy+qhWJObXOk2yLA/8w5qgak+yq
	KJI8r5qpOFC4NaQ5m3wp90x5pU17A+hgn5pZZS8oqDNr1Q==
X-Virus-Scanned: by MailRoute
Received: from 002.mia.mailroute.net ([127.0.0.1])
 by localhost (002.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cSwXOBJPq-ym; Fri, 28 Feb 2025 19:20:10 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 002.mia.mailroute.net (Postfix) with ESMTPSA id 4Z4J1z4YzCzmhZ9Y;
	Fri, 28 Feb 2025 19:20:07 +0000 (UTC)
Message-ID: <51ec6f40-c62a-418b-a538-082e3ad887cb@acm.org>
Date: Fri, 28 Feb 2025 11:20:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] scsi: ufs: exynos: Move phy calls to .exit() callback
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 krzk@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 ebiggers@kernel.org, kernel-team@android.com
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-6-peter.griffin@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250226220414.343659-6-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_112016_531616_EBA173F4 
X-CRM114-Status: UNSURE (   8.51  )
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

On 2/26/25 2:04 PM, Peter Griffin wrote:
> +static void exynos_ufs_exit(struct ufs_hba *hba)
> +{
> +	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> +
> +	phy_power_off(ufs->phy);
> +	phy_exit(ufs->phy);
> +}
> +
> +

For future patches, please follow the convention that is used elsewhere
in the kernel and separate functions with a single blank line instead of
two.


Thanks,

Bart.

