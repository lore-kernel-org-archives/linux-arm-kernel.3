Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEA6C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+FbrRxOgnYTZyaA+lF8b6QjfgGK+98gNFHNL4vg+8M=; b=cJKcyHtrfSjXgPkboCS5QWd4A3
	ZTyC1NFSBNidHJs24CIlIOI8I6G2n6Aorpf9uaii3KSpOh+i6/70n5XJcdZMuwdIypZTVL0Vlvg6D
	/IoTliROEtYBC77ZKmx5YibvEyT7C4PSmmd+55bVyN4KU9GxCgyE2kIve5KhIYqx7wQdssIz0mPM7
	Y0C6OrJHgXYLJab2xcmsqmNm6i+oOUlSaVj6+vAGl7BYLLpjkbZnRXBq+kWbFL+4O9XtddtQz8Wj7
	NxzhcMQgIg/s6Hini5hYOK8JCkOzmR/P+Wkj5gK+GD6lwgR44vtCPis2UGpnUJvf/L5+Qc4j+cjIZ
	0TdCvNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx4-00000000FgH-2Uxl;
	Tue, 25 Feb 2025 16:38:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuzx-0000000HNXN-0CZQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:29:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-546202d633dso5543918e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490159; x=1741094959; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+FbrRxOgnYTZyaA+lF8b6QjfgGK+98gNFHNL4vg+8M=;
        b=S7MNW3iAwSjfoeSYfHCixICQeixhNkGm6kX6WKJUkR+fALpIGnmIFldiCErreRoXDU
         3axjQa7436qG+yaSeuSL/M0Vcrx8F+HFxsv0zq47Nq57Bj2R/Am6ykiV+ifyCgF02XZD
         1afzCUqvw8L6jjxBVdX0ZqumC3xLNBt2y1fkwXhQfK3Xu8XVxAjq6pnJ15Q2tYtnnOqh
         tPDK+u5/B9VO6Z8uem1uv1B0w0hZh/oHZlEc18cVW4UpoNgoMLH3Di4K84LGolgT/LFa
         qZ9FICcRK5PBjKn2p00GRYgRPNTVK2DRKjpUi7EtjdbnQqpxeqRsKe0zNCjbb1xAaq6g
         yMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490159; x=1741094959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+FbrRxOgnYTZyaA+lF8b6QjfgGK+98gNFHNL4vg+8M=;
        b=EJhNv1RS4S4dbdbiVL8QjRUh2ujhPrDVk3+cHyolyIcsoV3mWNH3hnNHp+fGEOsMfA
         nEbAGp+fqHFfWZbia1aSDcCqmsLHU+a1sk33RQ7JnkcchiWoXl8llM+1hrF4SUH1cVhO
         rWQF4U/D+KTAOhIutJewlApD9KySacIEf0iHRd9ABWZvQZ/wM2bsKTKNqONLA/Z3517j
         q0p/K5zec+tI+l/gQqjwQfOEoswchisc0VFMDJ8lRU6t8buAf4kvJfW0Y92/aQxzp43z
         LJtD//5q9yPTLYD7u5zAMKH8btQP44oEylnpN7JGQviwzVJNANHBombsHs+2jARKy6qi
         iuiA==
X-Forwarded-Encrypted: i=1; AJvYcCWjbpFH0g1eEcCS8ZCKQfPGU0c0L5tivU4ueHQQiRjsjKuretN63L876VAiQIyumE13AZX5FlYw81Bnk7IRkfgA@lists.infradead.org
X-Gm-Message-State: AOJu0YxkSA3dKySCUvCi83t33HIquDlrtVQ1Qu8/7O/xeL2fXQnojcQ8
	aazeuD8SpA+1Jy6vcKxybe47uffwr7RlMomTvi/OKfn7lLwtrJI3
X-Gm-Gg: ASbGncsgpsUizSe3dkiPwOp3toLpgdjSZ8bPgQ48fPzFlzE7sGKPzRdg8X605EW3IYZ
	tIjZ2qX9lviTKLExDnAL9QaPCNYnsCQKopu6wI8NUW7vDa3qObEi6rFuN3D8aKZBzUdOqIN/Rul
	T7e/R9MNoLQW1PcSAlXpFEeSdZl0qJRlZc1Z9O+W66Di3MaAUEABcxlD3eT0CzSAK0oIzKxS3zk
	YxVk0x4sHwDR0OV4ue+5myLouMGWybp8KPqMzTu9JCYRuTrcmWgu3poP6KdmnF++eglXspQVBUh
	eDVbu42Uj9yDuPoxV2OIVf2q5Du0CvAiJ2MxaEY=
X-Google-Smtp-Source: AGHT+IGjIiZRQoCqQpRaub+un/XzTU053MAFUSi2TNm85/fj9TbmZ/3TfRa1taLP4aGsaQej3mQfPg==
X-Received: by 2002:a05:6512:224b:b0:545:54b:6a05 with SMTP id 2adb3069b0e04-548510eebcdmr1461663e87.45.1740490158959;
        Tue, 25 Feb 2025 05:29:18 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9db3sm181711e87.88.2025.02.25.05.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:29:18 -0800 (PST)
Message-ID: <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
Date: Tue, 25 Feb 2025 15:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052921_091346_B6F5165F 
X-CRM114-Status: GOOD (  14.15  )
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

On 25/02/2025 12:39, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:

...

>>>>
>>>> I did not check how many users are you proposing for this, but if
>>>> there's only one, then IMO this should not be a global function yet.
>>>> It just feels to special case to me. But let's see what the others
>>>> think.
>>>
>>> The problem is that if somebody hides it, we might potentially see
>>> a duplication in the future. So I _slightly_ prefer to publish and
>>> then drop that after a few cycles if no users appear.
>>
>> After taking a very quick grep I spotted one other existing place where we
>> might be able to do direct conversion to use this function.
>>
>> drivers/net/ethernet/freescale/gianfar.c
>>
>> That'd be 2 users.
> 
> I haven't checked myself, I believe your judgement,

I took a better look and you obviously shouldn't believe :) The gianfar 
used of_node instead of the fwnode. So, it'd be a single caller at starters.

Yours,
	-- Matti

