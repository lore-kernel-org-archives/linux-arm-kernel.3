Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEAD35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=; b=zMMHO1up/jjbDE2i+MUMNUdxq4
	hjUg1ZL871tS0lGVT55DgZBQ0EZXr/q4bYzcjqxQJnYGPdt1ZZEB0lBhwFiWXI7DbOkYYR37wn1u9
	s6uQQ30JvqKh5VL+t78FIWtdIi4OmtGZyolRH32AFZe7NfOoiPcALZKDNyHkM9yBwUSX+HgVLjImJ
	am+NTAZ3AZ5II0RUUhN3eN1R1lXK/Lxewe3sKY9WwBGREKNEUsc5qTkhicg0wcM9yrvrXoUgFTO+H
	iuj2x7wVvGx4StVCL14lTUi08Q4fgLPCkX4mOi/2tSzyMy7GhRHHSn7EF+LdGe4roZ86+n95huShw
	2WT/rrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Np-0000000FnmY-42ad;
	Wed, 28 Jan 2026 10:02:45 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Nn-0000000FnkS-09sh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769594534; x=1770199334; i=markus.elfring@web.de;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NRU2R2fE8XM4rBHrUO+a5t5chQAmZWzvv8ozQwmsWkxJD9Z9DD1a1mqudOXmSWTA
	 MDDtstuEKYfUq9WZoaoy9fnDu57YNED+Kz79j4ydygw1OrZuEh/O9svhSlw5YS4Uw
	 WQ7OAJvmbAgVJ84+0K+zTb7ZkrvvR66cO09as7qRY5ldoV3ZfmTe7/cXwRqggjvrP
	 d6a+FKcnBg0SZhCYQHV6WamtFKxlQFIXBvVSIXu0BzdXcXcvxZloEKHgegGISDqYA
	 ZYLedhXfRorPVy6m63IJ+E8tWrlSN9xMhb7ZLkfsMSZzZ0SnxR4RlhCbb18QOebT2
	 yf+dzWEgE+slcCdTww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Melaj-1wKv1X2GHt-00mtgq; Wed, 28
 Jan 2026 11:02:14 +0100
Message-ID: <e5c5e1ec-48ef-4cbb-bee5-feea163294e7@web.de>
Date: Wed, 28 Jan 2026 11:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>
References: <20260128042321.2260321-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] dmaengine: stm32-mdma: Add missing check for
 device_property_read_u32_array
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260128042321.2260321-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BiOVAvVadeAOw+xTyLHzXYJWkYJnxQ6VLKvZ9YqeIwCOEYV6qOT
 vZadxfgps0U7a2fafDqxZVGMdK4n85JGPPxGvAm/EdbW0CWHAGm5INoSjxD6v1pRYZ4xmJY
 TPX9e4stOAx0MW9A/CnH/lBouO9iQU5XhFUyq92wWzzhK1zqu+rWvHOe3tW3eMnZt/8raUo
 297ZYHw/j01UBS66j588A==
UI-OutboundReport: notjunk:1;M01:P0:4WdJKqbNIhk=;IpmbxYQSCuZWYMF7+2rWStTz6m5 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_020243_434647_F61BD2E4 
X-CRM114-Status: UNSURE (   5.70  )
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

> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

