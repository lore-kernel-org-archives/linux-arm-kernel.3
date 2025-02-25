Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCFEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAEbqPgmBi60dC78J9e9TaRL3Bq8nEEXaJp+eattnt8=; b=y79kqrhJknKDpqban48Vx1V6jl
	LHZWCa6I37haLMIDoFVNFw+V4W8LebUTmRMyevDupG+dCpDybn+b5b+D5M/BeHpCeZPdVkjILGPLX
	efq4j9fUNUaUX61FMzlUERraL28Hgc0CzSMNB373Vxd++x2M3hQJ2ppW5NjR4OY5+G5CCkPgGKmDJ
	XpkcvLNAxKezx/+3apOCLiSNw2x7INHcZVNbnN4TYRUcj8Pfpjdxd3WJnaEDRijv4WnPgzyJkAnlo
	KBDAwAdYHbH2pDLaxf1j98FTrh5Ljbt42apX3ZT2hoNp4s4ZbWJI2OoKRRot6d0SQ8DiwNEZPyaqj
	Nq+Q3rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt3K-0000000H1WN-3nE3;
	Tue, 25 Feb 2025 11:24:42 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrqo-0000000Gkv1-48I4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:07:44 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-307bc125e2eso50336721fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740478061; x=1741082861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAEbqPgmBi60dC78J9e9TaRL3Bq8nEEXaJp+eattnt8=;
        b=U2tmh08uiursckuPRXsPgBsylaBxk37DrjVFOyg3umAd483zJXLBWOdbLiLukG22uQ
         NZbTd/fSoOh+YaGnhSTj0/Twaqoy5G2pTO5GpokwOHyqMCqNzCh8RNvavnjAnsCotsbF
         PAkp+v3sMGg8sysyCmakCwMt+ZjncLCgvJnJT5c/LdVBQZGvPHnplxKX2Aiod88LWHhx
         PDk6ICDJLZRDcWZjOJVFtP9qLPn0yPmaQIjFsbtby0MP7QZiOYKFLalPrao4iHf+MmJB
         muhGaN3qG0WYIcnkNTFhuZJgHywUYO+Be4JKmfm2zIRAzNoucX/LDyzvQvHBbEH1Cf87
         niaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478061; x=1741082861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAEbqPgmBi60dC78J9e9TaRL3Bq8nEEXaJp+eattnt8=;
        b=mUCir+ccp1zmh2lXpyrILvlcRa/6PVZvyMs/ADaXNsS+3j0SbJ0uOfzl6ozGnDqdTI
         awkXtZUU1h1h7MqR9gX+3cf5qUNms80w6PqmQaNhDbsWoH3QtI8BhnGBkZfuO9a6uy25
         wCGTvDE8/tQgcqZzvX2Q8zFHe/g55lRpU3Gmza59iFvnll4NX6fj8cMOkd7/+1Edff8I
         z/dwUXZY+Px0v83TGEyl+6+ikUz1JaxCdSDkxAOdDcvg2eQMFm7pWn4luemlbcS0ZscK
         K60cUpwElirrhZ/tD5uGc1xXmQOKgh+1tJKDGc427R7s8pO1ngH6dVOU1UYXDBQNGhhm
         +vPg==
X-Forwarded-Encrypted: i=1; AJvYcCXwXhp7mz5YEAqLwLuOANITuvwrk1+V43xsGj9zUJrZYxYpHgpohC+e2kZgGUzT6eVe8tT6CTk0B/YfpgP/5eWa@lists.infradead.org
X-Gm-Message-State: AOJu0YyRupvbRiCOX79UoDSn+8/vrTmGrtuJbETu4GgUvSpq/I/w9FTf
	JLArOVo48jGuXwOow31PHS51VJ/gHo49MR2KgF4nScU7mkkCPBuo
X-Gm-Gg: ASbGnct8oMut+LzrcMHnktuEXIwCiqWrSvc9pMPbkoPYvkAzjAu1/Rz49yPOxnXslhf
	hycqjoYdIsgji5rQfXFE4nszfWlhSOZ+Um2cHOCHvhhuRzaNplalsISdCaRReswTqJLyVu/amFH
	ClVAT+H2L54CkfJuyKHqPIVn0EATnRFRlV1HzIEwMS8vQZu/Em8Ry0FO8OF6FXspVlTKaZJ0Czy
	WtxorBZal9ySRT43okRzt7BK2A68Fu70a6eYRJVWuxUneChjti34J5xP3fR0vkng6Bvz73W4a0R
	xy754KY349+DPKj+JCI6YCn2/jJog2yphz4fK5Y=
X-Google-Smtp-Source: AGHT+IE9LtSoTYOkptRbtvW+Pr2kFGMFaZQ0FPl+alwBphqqI58uxcxrb6TXfUP19MarHnVygwrw5w==
X-Received: by 2002:a05:6512:b8d:b0:545:2950:5360 with SMTP id 2adb3069b0e04-548510d7323mr856574e87.22.1740478060709;
        Tue, 25 Feb 2025 02:07:40 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f477esm130333e87.187.2025.02.25.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:07:38 -0800 (PST)
Message-ID: <c3cc7f2a-ea0c-42a0-940c-95735d008989@gmail.com>
Date: Tue, 25 Feb 2025 12:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
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
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_020743_031770_5484DC16 
X-CRM114-Status: GOOD (  18.80  )
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

On 25/02/2025 11:40, Heikki Krogerus wrote:
> Hi,
> 
>> +/**
>> + * device_get_child_node_count_named - number of child nodes with given name
>> + *
>> + * Scan device's child nodes and find all the nodes with a specific name and
>> + * return the number of found nodes. Potential '@number' -ending for scanned
>> + * names is ignored. Eg,
>> + * device_get_child_node_count(dev, "channel");
>> + * would match all the nodes:
>> + * channel { }, channel@0 {}, channel@0xabba {}...
>> + *
>> + * @dev: Device to count the child nodes for
>> + *
>> + * Return: the number of child nodes with a matching name for a given device.
>> + */
>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>> +					       const char *name)
>> +{
>> +	struct fwnode_handle *child;
>> +	unsigned int count = 0;
>> +
>> +	device_for_each_child_node(dev, child)
>> +		if (fwnode_name_eq(child, "channel"))
> 
> s/"channel"/name/ ?

Thanks Heikki for spotting this brainfart! :)

> 
>> +			count++;
>> +
>> +	return count;
>> +}
>> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
> 
> I did not check how many users are you proposing for this, but if
> there's only one, then IMO this should not be a global function yet.

I have no strong opinion on this. It starts with just 1 user (IIO ADC 
channel stuff), but I've a feeling there are other areas which do 
look-up nodes by name. I suppose "channels" are looked-up in other areas 
of IIO as well. Lookups are probably done outside the IIO as well. I 
haven't audited this, but I wouldn't be surprized if at least LEDs (and 
perhaps clks/regulators?) could find this useful too.

> It just feels to special case to me. But let's see what the others
> think.

Yeah :) And thanks for spotting the "channel" -thing :)

Yours,
	-- Matti

