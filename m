Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F883CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4ykQPoNMW41qiAsFsicD8C4SKvlQSjn0d21wbxQ5rE=; b=TG9hENeNXxhtzBoa+YHOCSr7gA
	LTGW9SI6y/hC0craROl2jKJk1AtQWIvbA/CZqy5w0L2FjyPtZDSbr4L4Sn0r36CPDNvR2kpUXuY92
	Klc8HP75PgPi3h3PcpQwGRUl06VdRU98JICNr1bvLkrYB5sAexwUfWVNhiBsNjZxBhqoX+FNPTDKT
	U9f4TkX00Tnj5gblsARblJcLXzVMZH7zGvBWh4Bw6rXIsg2/e2JSIr24XuZQ8Y5cFL5NtSiBZlCyf
	ugmOREBzmrENkUMnb06BubLzFnDncn6/VlN3P9F/wMA24f3Bk08b+7LC9xK8YiDrT+4GLjKmCY8f8
	sGY8MZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QcT-00000005O4N-3fmV;
	Thu, 16 Oct 2025 16:14:25 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QcR-00000005O2q-1MTU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:14:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cnY1R4MhVz9srX;
	Thu, 16 Oct 2025 18:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760631259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4ykQPoNMW41qiAsFsicD8C4SKvlQSjn0d21wbxQ5rE=;
	b=fu7olJuST6n9YNiEoqd9FexuEwzz5nkj+1juIcrE5dMI8JojVpEpojRf6RltRDP2agSfFY
	zvYWm7C4lkhO4spprolalrsg3z5kxSXdN1sc5NLTk1XGFx6d4ty6lartGXaLf6xxEu8JWG
	QMGBhHoXuX6MGf3g0Ui0zuQTh4RYqWEj/3HuHoLIsbwrzHoBbrvbHX8hamJ8ACF4+tevBP
	Brf+eXUeVoDcvA3FAXYW+mzqmoyH79SaRPyHOTOE38fBmgSbRzH0uUqei5IyxZadct2qz4
	qb2v4S+SvaFgStGkoeDJdnYOEzCMd90qPYg+AXHjGFvgmL1QSjP3Q0uUfzA64A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KFmO3Lo2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <a35c1db3-eba1-4f42-9821-0b7924665a18@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760631257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4ykQPoNMW41qiAsFsicD8C4SKvlQSjn0d21wbxQ5rE=;
	b=KFmO3Lo2UlgRT8eSRmdbTTKuasRfcTzYQKBG212ZYUKIEkqVU0lJ5QhYAqYMoh1r2zEct4
	dBPT1HhTTPCGg1/m8lvS5h+1qTJQTuwfV7BYSG/rVTBF/kqSLA9KrhMiPZ0DCbHg4m9/Gl
	by8BC2fLJpLidos8giD96WgZr4f389n6q7k3oUW40HJVcM5y7o4Cc1coTYFB27IgbNUW3A
	occw+6WVAQJULnnY5xcFUcyfnhHCx3np1nAsOWexlr2x3Bd4DeRABTM5wKQ1epjDw3zleP
	ZaSAWMH19j7u/4/6E5Zv+/7JKeZaoeAQlQgxoR2VBI/UNUrbUopdeaT0KuwQQA==
Date: Thu, 16 Oct 2025 18:14:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
 <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
 <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
 <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8748bc98df86c3278a5
X-MBO-RS-META: 7rmbx5z3ycuwfy7mjqpcgkai5ob6r7g9
X-Rspamd-Queue-Id: 4cnY1R4MhVz9srX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_091423_509029_6E82DD19 
X-CRM114-Status: GOOD (  19.27  )
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

On 10/16/25 4:32 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 16 Oct 2025 at 16:13, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:
>>>> which are also never disabled, do we want to disable the GPU by default
>>>> and enable per-board ?
>>>
>>> Yes please. We do the same with renesas,*-mali GPU nodes.
>>> The board may not even have graphical output.
>>> Or do you envision using the GPU for more general and headless operation?
>>
>> The GPU does have GP-GPU compute shader, so even headless system can do
>> compute on the GPU.
> 
> How is this handled on other SoCs?

I did a quick measurement to get some statistics from next-20251016 :

$ sed -n '/gpu@.*{/,/}/ { /compatible/ s@.*compatible =.*@compatible@p ; 
/status / s@^[ \t]\+@@p }' $( git grep -l 'gpu@' arch ) | sort | uniq -c
     152 compatible
      66 status = "disabled";
       8 status = "okay";

It seems there are 152 GPU nodes, 66 are explicitly disabled, the rest 
are enabled, so about 3/5 of the GPU nodes are default enabled. But my 
measurement is crude.

>>>> I would argue the GPU should be enabled by default, so the GPU driver
>>>> can do a proper power management of the GPU. If firmware is missing, at
>>>> least power it off on failed probe, if nothing else.
>>>
>>> The *_PD_3DG_* domains are powered down anyway when unused.
>>
>> If the driver was bound to the GPU node, then the domain would be surely
>> powered down in control of the Linux kernel driver, without depending on
>> the prior stage to leave it powered down.
>>
>> I think it is in fact better to bind the GPU driver to the GPU IP and
>> let the GPU driver power manage the GPU in a well defined manner,
>> instead of depending on the prior stage to leave the GPU in some
>> specific state ?
> 
> The domains are powered down by the rcar-sysc PM Domain driver,
> hence the system does not rely on any prior stage taking care of that.

OK

-- 
Best regards,
Marek Vasut

