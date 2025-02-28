Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C8FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3KgZ7v6Ac3qNC5ZXayA/TVd4J7v++7VBhLT8uenwA4=; b=Mlt1VjnlmzTi6Bg4PfhfEPMwRs
	3qgWYVVLqqc0UOZZYk8+hDpW8wywwY6d8COQiD5G1TvGDoXJIHnUEf1mkPfi44RM+K3ENidCtngem
	pjFUvW7jYF2oP5VYskjBXwhQFrDDW8ss+MNtqW7/EAXEt98YiiHMVvJzq4GaUobvuYPwSF4JpAJ0G
	zx8CjJPGdJJGKZ64ssAMPAshtd9cP9kTMA818q84z0vpxw41Oe192EUmrFrReJBnhUF70w0M5B/b0
	11XeFsAc8xZsthG2Mkx1Nn8GFHsL0l4XDWWu5CW1GAMyaertBXGXdZ25qZyjs/yZQD1b8f+7l0wV4
	eklGs+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5u9-0000000CLO8-1uWC;
	Fri, 28 Feb 2025 19:20:13 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5sc-0000000CLD9-0WTt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:18:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4Z4J0B2qdczmP5c7;
	Fri, 28 Feb 2025 19:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1740770312; x=1743362313; bh=I3KgZ7v6Ac3qNC5ZXayA/TVd
	4J7v++7VBhLT8uenwA4=; b=dYhmjvIcrnsbOzvnnHlzoURlRaeubcVxk4HL2/8i
	Jp/JunGL0GcZOS8uVtJ22qqHtnw0bDvyAYkU5ZSBgvNLfS4uT3GmbtuJCrPYL2Fz
	0VmgUcqeM7iOgB9aZYTA0FQdLdrmi/BRCXv/HSD1c150QGmfWvw8QJomMYDSsX54
	TJDmriNqjaxFRGjSJ94rV+kFQqIQZ/mdiYFBD3ufAPwHDltBAINvJVjTAbY1lw6B
	YnR361bhhDiaD/JSFWPm3kBXcPzQwFVH1qw4VaJSL8VtaCIOXOthcvUSYt18Yvqw
	QNQGkmBAB7QNcZkPbwl0GAYMmpUc3tZjQRtf+UdFbbJprg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Zmz81sBKZJiv; Fri, 28 Feb 2025 19:18:32 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4Z4J064hDqzmRY85;
	Fri, 28 Feb 2025 19:18:30 +0000 (UTC)
Message-ID: <bb595629-f975-4417-af28-8f4924a5ca5c@acm.org>
Date: Fri, 28 Feb 2025 11:18:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with
 UFSHCD_CAP_CRYPTO
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 krzk@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 ebiggers@kernel.org, kernel-team@android.com
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250226220414.343659-5-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_111838_252455_AAA2DA07 
X-CRM114-Status: UNSURE (   6.71  )
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
> -	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
> +
> +	if (hba->caps & UFSHCD_CAP_CRYPTO)
> +		val |= PRDT_PREFECT_EN;

In a future patch series, please consider renaming PRDT_PREFECT_EN into
PRDT_PREFECTH_EN.

Thanks,

Bart.

