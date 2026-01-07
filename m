Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C525BD0D144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otEyuX3K80BYoIYcGZRsH2ma7v0aBo0pa0q/PC9OwEc=; b=dv3Y6uwheRv4lNasHD8nn3KiBp
	G1YOQ4KGTNpYGmX1omLJ5QN9pUX8fFBuLsiQ/w0ovJVdTd9dfUbVHacBCiqct/9vN1yYbKKAcdvlO
	FAKx8z17T8O1nshJk1aUOG2jjy7FZJbkKdvERz12SkjsNxxvU/BmXNY2Keut51ofLBjtq6Aec8QL/
	M0Rw6G4GQ2ZEePLfPF5R+XibCuO3CSgzFfU+2pKavrRnz4Hr7GO3HhFjVMO7nYnngt3VK4eKMustw
	fcY9TDYRyFzRWfuVdBpXvKG2EDmWwWVHUZf8m4sJYVR1dV5BzAhMEPOumLTFCBI5he+wKK8mIVjzJ
	vrLYRjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWqm-0000000FLK6-251D;
	Wed, 07 Jan 2026 16:57:38 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWqk-0000000FLJd-1Oao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:57:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dmZ302H1KzlkMXq;
	Wed,  7 Jan 2026 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1767805049; x=1770397050; bh=otEyuX3K80BYoIYcGZRsH2ma
	7v0aBo0pa0q/PC9OwEc=; b=4Gz+qQLUWeQghZ89CLQ7HDYP9UBzHMpIxZxNjLGV
	eF/OXUHveY0GAGbgGzeKaFF+8MJqQ7Sn/QYFZ1COR7UaltAm/Ie13ySSdUn8A247
	M4+0vuftzuSUc/GySb8DJQ0jGwDIrSsQ0977F+zaes1+hN3OVnNDqYZhMiLJdV4N
	VUuY3XT+WK6iud72WiPrsTgtM8NiCzdXjxw/FnwuVfoSXAFd57Stsx4OheJQBs39
	dFaTdA5MC/NUg1Q8Mky0sdnVSJYccU/7v6aL1lpKVFrkgqWlSvubshF0IKCfdFLz
	UADbbFmwoQh8q7Ou2dacubHK9wicONo7ElVA7u+6zTZ59w==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DYajElaLYGq5; Wed,  7 Jan 2026 16:57:29 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dmZ2t4N9Yzm73Bk;
	Wed,  7 Jan 2026 16:57:26 +0000 (UTC)
Message-ID: <7c3c2687-12c8-452d-86d7-78b3168a8f01@acm.org>
Date: Wed, 7 Jan 2026 08:57:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: exynos: call phy_notify_state() from
 hibern8 callbacks
To: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, andre.draszik@linaro.org, willmcvicker@google.com,
 tudor.ambarus@linaro.org, jyescas@google.com
References: <20260107-ufs-exynos-phy_notify_pmstate-v2-1-2b823a25208b@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260107-ufs-exynos-phy_notify_pmstate-v2-1-2b823a25208b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_085734_435605_B741B97B 
X-CRM114-Status: UNSURE (   8.13  )
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

On 1/7/26 5:51 AM, Peter Griffin wrote:
> +	union phy_notify phystate = {
> +		.ufs_state = PHY_UFS_HIBERN8_EXIT
> +	};

Should this be declared 'static const'?

> +		phy_notify_state(ufs->phy, phystate);

Can you please ask the maintainer of include/linux/phy/phy.h why
phy_notify is a union since it only has a single member? From that
header file:

union phy_notify {
	enum phy_ufs_state ufs_state;
};

> +	union phy_notify phystate = {
> +		.ufs_state = PHY_UFS_HIBERN8_ENTER
> +	};

Same question here: should this be declared 'static const'?

Thanks,

Bart.

