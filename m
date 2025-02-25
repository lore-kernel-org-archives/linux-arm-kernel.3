Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3DEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FWLaiabtNirDSi5oyCbdoPFm0NWp7Jf1VqisvjNdfA=; b=rYx9zjj7TpQCxu6NuFduhCHl3c
	rtIEG3pOVg4tzFS7PFoKrDSLCT8YhVEYSLsvWts9DOMbpWa2xPrYn7QKh2Y697vLHt4yBnFDpBvKo
	9uBxcCgpDce6euFKrh7xpyGU5K2Mi9vnWQC9HEL3lrNU7QQeTsCbKvothwrKwVfJ19YuIidgN1BDF
	KDiBuvFVZmq0ce3W+DaJ7YDpxvmjGK3jySfDXBohxzxWOG03P/Gqfjl+TUNOcThv6Z20TqfxHCzDm
	Pza7fvOmV51Jt8J/ehd1gW9vSTRsEarGfk1am6dwDCrfh7V0BCWuHHNuJ9bPhu/+rcoE/7wcB9vH0
	R3tPpDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsu7-0000000GzSh-1m46;
	Tue, 25 Feb 2025 11:15:11 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsC0-0000000Gpem-3d5b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:29:37 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-546237cd3cbso5445144e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740479375; x=1741084175; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FWLaiabtNirDSi5oyCbdoPFm0NWp7Jf1VqisvjNdfA=;
        b=l1H2PuTnIZ6t2S195iMLuypMeBb17VoKNtQ9pk6tZiYDCOfs3OgSQaVjU+rxkV4dSc
         kts4uOr6zd949Fqt0x3b5Jbju2W+XGiWPsfs0ipv0WEXqccXvCfAphC/cjJbypCcFs+e
         ab3e4E4lDP6YfHGZNp+Peipy2KmAkrjY7BjQEfny0WN3ry7oUaMpf5ykhcXP5x3uLKv2
         MjgpPKQIayXYXvgiTV1uEClrebnZGKRlHXUy9q4qF04mk3lAk3ZXM8bKDZ8AFKhOwcUl
         3n15wC4mnk7BLuBjXIpXeVSge/JKfAUeovqhi5Hbxr1fU770kMQAr+rZBxMZ2sfeub1i
         enEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479375; x=1741084175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FWLaiabtNirDSi5oyCbdoPFm0NWp7Jf1VqisvjNdfA=;
        b=peEvvti8X0gZMe3JbvrLF0OKJ5mG2CcA+HOD1VMwjO/L/aGPtWKJw9LOO3YqIE2CXN
         e9NxrwEz2acdKcYnxpRuiRRwZ4nB7L33je1XmcXUc3pOOf+Q7oKJ1Q5VfnpJuU+JB+6F
         hT6JRSnzCSxZB47+6pJ+vXU49HHtmAk/iv773wyHNMcUfnIse4wW/kpP5u44pFs3R2rh
         7mFgVraWgMzbkpWhgvH6bL5fuG8PR8A0PX2h5zjglPn7oIK7Zu/mk69mCVP2sIrBM/cG
         yVVXTMJUsRLR4VQSsLatrS1rVLYYRtxQ86B/L68u93cEnat9XAEYBhsUvZZLf2kgpYUJ
         unGw==
X-Forwarded-Encrypted: i=1; AJvYcCVKGUZNenrcVYz1c2KP44uakeFIAkR2oPZr+sm6mh9wuhtx6DXf/hnJDR6yB7H4aAjwtCjCSwsijK3L62vBbgqY@lists.infradead.org
X-Gm-Message-State: AOJu0YysUmCGmfrBMd1yUlBAnfG+lPMoVbsmv6YcDCpd6z/YvO5hQld/
	TB+wOm47T/W0akbb1pTLhmQzutUjC8ZGfFhguhWUXLxyzsTZ7QYQ
X-Gm-Gg: ASbGncvopEb3/gZXcKFI4NrPmOfLeQAkle1FQPbqSJQ0l9271Kz8juGueCuTh4JSnob
	XflOy2aYgDfKVu9j6bV2IqgDqM3fIJWeqMvQzH7yZaLyjF+3xT/qXEwKYooa+XTyzGCgw0/0toX
	cyDYulAlI3PKgVVMHNR6Fl9aIDCJJKvhi9kK1FDcLV+2TpOzROM2Smh+XR/pJViBwvHPdcGjOiX
	nAcWZu0tWVOn27eCH+ZNUdYnikveUVI0aR/7uk/hgHrKHuHVUK3e9D+ybTCG3tIeyeGkMbHtEJm
	KDGDGdbCFou6M1zFCALODF8FZrLCytCTihq1ri8=
X-Google-Smtp-Source: AGHT+IEOX4SAkVcbCaNkIS5Eiz9jLOGMD6nDNsNIgWnc9c9zZ4J1lGJhqX/FRtQ2oyAHuj6SZ749OA==
X-Received: by 2002:a05:6512:128b:b0:545:ee3:f3be with SMTP id 2adb3069b0e04-548510ce69dmr991958e87.10.1740479374858;
        Tue, 25 Feb 2025 02:29:34 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f742fsm133919e87.205.2025.02.25.02.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:29:33 -0800 (PST)
Message-ID: <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
Date: Tue, 25 Feb 2025 12:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022936_910344_0227169D 
X-CRM114-Status: GOOD (  20.95  )
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

On 25/02/2025 12:21, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
>>> +/**
>>> + * device_get_child_node_count_named - number of child nodes with given name
>>> + *
>>> + * Scan device's child nodes and find all the nodes with a specific name and
>>> + * return the number of found nodes. Potential '@number' -ending for scanned
>>> + * names is ignored. Eg,
>>> + * device_get_child_node_count(dev, "channel");
>>> + * would match all the nodes:
>>> + * channel { }, channel@0 {}, channel@0xabba {}...
>>> + *
>>> + * @dev: Device to count the child nodes for
> 
> This has an inconsistent kernel doc structure in comparison to the rest in this
> file.
> 
>>> + * Return: the number of child nodes with a matching name for a given device.
>>> + */
>>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>>> +					       const char *name)
>>> +{
>>> +	struct fwnode_handle *child;
>>> +	unsigned int count = 0;
>>> +
>>> +	device_for_each_child_node(dev, child)
>>> +		if (fwnode_name_eq(child, "channel"))
>>
>> s/"channel"/name/ ?
>>
>>> +			count++;
>>> +
>>> +	return count;
>>> +}
>>> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
>>
>> I did not check how many users are you proposing for this, but if
>> there's only one, then IMO this should not be a global function yet.
>> It just feels to special case to me. But let's see what the others
>> think.
> 
> The problem is that if somebody hides it, we might potentially see
> a duplication in the future. So I _slightly_ prefer to publish and
> then drop that after a few cycles if no users appear.

After taking a very quick grep I spotted one other existing place where 
we might be able to do direct conversion to use this function.

drivers/net/ethernet/freescale/gianfar.c

That'd be 2 users.

While I looked at it, it seems that a 
'device_for_each_named_child_node()' -construct would have a few users.

Yours,
	-- Matti

