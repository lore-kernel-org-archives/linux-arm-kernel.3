Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28FACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNaIOOo0z+MedOH+TqA+kdAGFqIVnBmN8T0Zjktc6HI=; b=0hwrnffI8q3neNsVl8Qv53wwqK
	MEkKNj6tmysjZ4LBGhl0JHE6cl8duwjDhdHpCpSdIzH+r7ysmrof1WddTvJtbbl30qqL6ImwxuQmA
	bEuV0Y9CnyZ36zsbX4rKr/adFvZmoMmEwiWw6KKT0F8BwBFVnvgxAcVRrw4+VadmqzCqaRRIC4YzF
	sopyBYsDngj+LPelbAkXVcYx+SsR7PHaGnbdFNeHXWPC/a1OWqzbR39Oj6R09SsK0E65ZtyzZimFO
	6yoHg5ORtVg/a4bqR1XyLQ3gkl2DWyA7LA7eC+VvxbFqSrOPCMEcaV7R96KAc/EM5B686pclpWrbw
	rS22WyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMps-0000000GDHS-34Cz;
	Tue, 02 Sep 2025 08:57:52 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMUS-0000000G5Xg-3IxT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756802139; x=1757406939; i=markus.elfring@web.de;
	bh=hNaIOOo0z+MedOH+TqA+kdAGFqIVnBmN8T0Zjktc6HI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LjFFywoGWSKwSXxPUG3jNe3Jj5JjR3ZFBELDAuxqQ7vDSM1AZXi0KB/7Ef4GLMNh
	 AOGDpbfimiVXufTrkeMN8ZTkyitLXXyMpezM+v56Mc5G+Bxn0dHr8v1aHO7tEvATB
	 jroGqFWXUQp21jfOre9bdL5jvAuxl7pHVr42cX65gwqYLl6lKC8m+dEgmyWcPdz9+
	 m8YoGNjleaCrY/aKmYD7FWJRAwKlLPPQDMJcDhgyk4CziKGTetFJEkbh+//rP6TjV
	 +EoiiSnlTelPL4IkkKGuQTEwflmUV8oJ3wKehcl0yA4fIoDdB6iUhcwHZy/RlBArE
	 LtVt9kRUBskxlffJ0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxpiU-1uXqp31Ykw-00sTTE; Tue, 02
 Sep 2025 10:35:39 +0200
Message-ID: <6c6da31a-b452-41b9-92db-28d22912a603@web.de>
Date: Tue, 2 Sep 2025 10:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20250902081929.2411971-1-linmq006@gmail.com>
Subject: Re: [PATCH] bus: vexpress-config: fix device node reference leak in
 vexpress_syscfg_probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250902081929.2411971-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:735cdvSihHqlcXfjRWM3MOVVJFM5GbAsNEYbKhccEflr4FZvCc4
 LNCvHp8SzYOIrdGrJiz7/GkiXk8vmGBjI7ncy/tGg4XELG/+jgk52aaKqSL9rCfNIYUE+th
 qR01F51YfOqdxQrdfCvMkLpEuzboRLhrVzRiP8xXxlLoqNqiRsGOQ/EjnKVJrWau3qmn4J7
 iwWF5MkSPzOVMzk3FZNIQ==
UI-OutboundReport: notjunk:1;M01:P0:EWDArq5iKas=;Vla8HAKDusvBS6Kf2G5wfq/FhCQ 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013545_229102_F9AC8861 
X-CRM114-Status: UNSURE (   4.36  )
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

> Add missing of_node_put() call to release
> the device node reference obtained via of_parse_phandle().
=E2=80=A6

You may occasionally put more than 58 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n638

Regards,
Markus

