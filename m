Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59CACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ3zeHjp9c6r+G/TeEWxmYQzWur7IwFq3GAOFT0Gw+A=; b=g7yMswjXYwchVP5SC+d8/0lE/s
	lw+nRLkm8XePqf7A+wqhkLsVhKEy9BtGvg6hHXz8IscQGXsbNXZGSzW59CFnQPJYEHe53TVrzlB5c
	P6A7tOjsJmYfAqpUAU1hb404hrHrpARL63eCcmWfciTCzqpwOelFQf98Z1B7aRUhFwekhXcmOQmOx
	LJdvUzUVgBcjlZIBd2PrQ4zKsOjR7p47I+hvxuZ4AVNF64RkroB5M8PUONMaF7WBWs2EgjVrGsdAP
	6hnzYlgptYqhmN8AfV+t9dMRAOKPoBLPC1utYAtJiyFrsQliPnidI0JhfHnIdYZwJtWFGlELpZeH8
	aRG3GkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux32g-00000009Iqj-09Nc;
	Fri, 12 Sep 2025 12:38:18 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux32d-00000009IoF-03S0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757680681; x=1758285481; i=markus.elfring@web.de;
	bh=bJ3zeHjp9c6r+G/TeEWxmYQzWur7IwFq3GAOFT0Gw+A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gq6BTXTxhaqVgXHRN6FRdKsAKerSZDisOzK+obdALsBZS6HrFBd9SRkrKRmQ6+LK
	 UoYiVFgvMLtMWDJKCZZjtbQIrKyd6udLKfDJTlz/Ejup3RGTgqfSZ/1grVdjphT1v
	 T1Tf95RXnH0t4vHdbinR3aTj982CG1jsDDZ8O1LqizneU8qYr8dlUIzHY88YZbRVl
	 fPH9EaNaMLbg87z08cgqZ1QnX0pWvIZ9CmTZqzxnlvWqoEisniMWP4bj/gnalbJAA
	 H6TYQJVmw8AzFY8psE8grjTEqiAMw998QJWB+llW4DovKKezfA4uv5cVuvqLnXRWj
	 XAmthfvHl78MZ8ccOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.219]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBB86-1v7XPy41Da-00Dsrc; Fri, 12
 Sep 2025 14:38:01 +0200
Message-ID: <ef091856-8803-4c68-a994-b995ddc0d4ab@web.de>
Date: Fri, 12 Sep 2025 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Use scope-based resource management in
 arm_trbe_alloc_buffer()
To: Leo Yan <leo.yan@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <3663eb06-6a98-461b-8fcb-6891165d107f@web.de>
 <3f2137d5-5bfc-44e7-9269-3069e44eda31@arm.com>
 <20250912102743.GG12516@e132581.arm.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250912102743.GG12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sy3OoeeJfG5yqy9XH7vpkuCE+asSQwwbe1LDPGRWNeOd7kylLfB
 ZsLY+4Py0I3/nwi7uWv9aidVvI/8Zd92tqqOO07NyRSeTMx5EFfEJx+1vPYIV0k32pCttDQ
 ujs9mRPT/ohdAkQwJvv3o60sXjQhSnbFC6qkRxJqKPhH9jotfv3d5zP7g/jAWqcTABkxoki
 yTqehoOVJvWeeJ99eJnEw==
UI-OutboundReport: notjunk:1;M01:P0:4WgyHIJLnNM=;+HjWdajmi6nVsk3bg5QRKQNMMI4 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_053815_343043_9E487207 
X-CRM114-Status: UNSURE (   7.71  )
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

>> Seems like a good idea though. But please keep the local variable
>> declaration in the current place which is bit cleaner and reduces
>> code churn as well.
>=20
> Though include/linux/cleanup.h suggests to "always define and assign
> variables in one statement" to avoid potential interdependency problem
> with lock, this is not concerned in arm_trbe_alloc_buffer().
>=20
> So I bias to Anshuman's suggestion of declaring variables at the top
> of the function, as this is the style widely used in the kernel.

Does anything hinder you to follow the mentioned cleanup advice more?

Regards,
Markus

