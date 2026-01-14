Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD2D3900B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMymUs+O/5UOcoxAv9q1fwdIIJzCE9BopK7FUY1gQ9A=; b=BJMMZ//MNiyome53FEc9r8kh1s
	sk2QUOw6IVbMtA8iyfhuYAftTysmHX6eLWossFzgeXgpvXTUYMyGpEtW8lC2U0NKOzvvanttLLmxR
	1lZmBHzi0kxtPtfRSNIUejVovVKtCRc433n/n0AZYCEmefRC/y8966oNF3SN5vSi/FxVJz0htkWe/
	2E0fMfmMG8mjLn3EasvXDEjiF7Sgq3IKjsCbCm669MdTPqblOqmuhm5dHasffkoTWo/nDr58CTWJi
	3DPWGHhYNAZQ+o1i7xwaRIdTO9guv7pyba1V/ri5JNozHPPHydlXlVgMosrUBS0/Ur1cexfB4CvRG
	Igi6wo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5rf-0000000AMqI-2WSq;
	Wed, 14 Jan 2026 18:45:07 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5rd-0000000AMoo-1cvF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:45:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4drw5p4sfkz1XM0p5;
	Wed, 14 Jan 2026 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1768416300; x=1771008301; bh=bMymUs+O/5UOcoxAv9q1fwdI
	IJzCE9BopK7FUY1gQ9A=; b=3ADvw6ric/ZO7GZQI82meuEPExf+FCEdP0UMrUs6
	GSm44RsjZvEV5W6FRi0SEp+Ihz73nXi/IGdehBiRL8mNeazQdyqZ/GQhLD6sIBUB
	L9FxUXASoqcb8rn+eaSFYWsav5MfWNalPbS1keuj1WGBeUPI9/jw7L+hfv/sdw34
	9wzle8lL0bItLzheqRTunEt8ykDioiLt/KF4hcKcHmeVb65LOOvXynNxZeXBGH1J
	NfJP2VOZ9A9aqqm0/PwYP0U1AAUEVXE8zwYIHVkp9I3ZidtMiydczKbubtX9A9Th
	iSDf1qMJcFFo5cBNCxK4BWNpxY+xRfhw9BtIXAAykvpIWw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id KfrL4izFLC9j; Wed, 14 Jan 2026 18:45:00 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4drw5j0zTLz1XM6J4;
	Wed, 14 Jan 2026 18:44:56 +0000 (UTC)
Message-ID: <14f96dc6-bcea-4343-82c8-f321e6367aba@acm.org>
Date: Wed, 14 Jan 2026 10:44:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: exynos: call phy_notify_state() from
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
References: <20260109-ufs-exynos-phy_notify_pmstate-v3-1-7eb692e271af@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260109-ufs-exynos-phy_notify_pmstate-v3-1-7eb692e271af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_104505_448842_C0CE7722 
X-CRM114-Status: UNSURE (   6.57  )
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

On 1/9/26 4:40 AM, Peter Griffin wrote:
> Notify the ufs phy of the hibern8 link state so that it can program the
> appropriate values.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

