Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82887E98E13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCKgF+SQBcRf7H7yGf7xlQEg5ny9ucdp2uQxbv5/0Os=; b=HG5DccK/ztHzUcYDvr/YGRt1iK
	kzWmjZBOdwkT7oytoNHadfrOzpb9Td6s1kohmGJado28zt9dMcdLWQ+Z3k4PP2UCEbI+NqZwhryy8
	ua1xSpnw4c4eGyXsVKRXdEd8LvGDwX1IiqDmWISvuXt+oHUAql8+M06+OVExBgbZ6x3KApfFPNVZa
	R7FnxaEaep2zdtP2+RIi+wZ81lk1AvyrWHam3kFalCliQAxL6pJ9ZAlkUOqwv43FyTuT1QqDThP1n
	l4rq1ox1DGVxR9Jl/47uKqYnS58RSjKIhCOrJUgJF8z6afMDOMlRj1ABk4VwGyUaCMvvz7LEjBqjt
	Ht+9dTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTIZ-000000004UJ-3BTq;
	Mon, 23 Feb 2026 10:36:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTIX-000000004Tg-0fVJ;
	Mon, 23 Feb 2026 10:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CBF141852;
	Mon, 23 Feb 2026 10:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DB8C116C6;
	Mon, 23 Feb 2026 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842975;
	bh=AiVxbYjTjkFCDusZ5tWu7n3s2U71UIpWbTezPnBHohQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=g018biIbLMWiMgHMZWobv71WB0aDNk0V5mHABji3/oQj3XLzM55HPmrBH+gw8NLP9
	 4aFelAoKv77LNIwGM+/LTapuKx9mVvzEJ2L301pPtTMtOM0r8aXiVRj5h0tlOYPnq0
	 brl1ukA+PDKddKhXcBHoVMuJcO/8RzmbIldDMOOJjgUT92rUnefSZbuOXkTIRjUX9P
	 joksQ/AF6fENHVP37XJW5oZWiAzNSPklNWkkCfGuG5kfnx5WJyX+qqe/Cp7gpQNvkT
	 FOUUUbuXuikeaIw63y50ihIesqm1gE1hUP9Cy1hgtbOVFCRNlNdZfvKbHVgxwQe8ft
	 zfydjoMRh3uMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 11:36:08 +0100
Message-Id: <DGM9WUWC4ZE8.1A08TAKKT4FLJ@kernel.org>
Subject: Re: [PATCH 1/9] workqueue: devres: Add device-managed allocate
 workqueue
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tejun Heo" <tj@kernel.org>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Tobias Schrammm" <t.schramm@manjaro.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Dzmitry Sankouski" <dsankouski@gmail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Benson Leung"
 <bleung@chromium.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_023617_264596_A83BF538 
X-CRM114-Status: UNSURE (   9.87  )
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

On Mon Feb 23, 2026 at 8:27 AM CET, Krzysztof Kozlowski wrote:
> +__printf(2, 5) struct workqueue_struct *
> +devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int f=
lags,
> +		     int max_active, ...)
> +{
> +	struct workqueue_struct **ptr, *wq;
> +	va_list args;
> +
> +	ptr =3D devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);

The function pointer passed to devres_alloc() is commonly named *_release()=
.

> +	if (!ptr)
> +		return NULL;
> +
> +	va_start(args, max_active);
> +	wq =3D alloc_workqueue(fmt, flags, max_active, args);
> +	va_end(args);
> +	if (wq) {
> +		*ptr =3D wq;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return wq;
> +}
> +EXPORT_SYMBOL_GPL(devm_alloc_workqueue);

<snip>

> +void devm_destroy_workqueue(struct device *dev, void *res)
> +{
> +	destroy_workqueue(*(struct workqueue_struct **)res);
> +}
> +EXPORT_SYMBOL_GPL(devm_destroy_workqueue);

I assume you did not mean to export the release callback (which doesn't see=
m to
be useful), but a function that calls devres_destroy(), i.e. something anal=
ogous
to devm_remove_action().

If you don't actually need it, I would prefer not to add something that cal=
ls
devres_destroy() for now.

