Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1BAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8FRI6cy9CCt8b2M5LhQNzurCwCuZ436s4fIsfr2+0s=; b=e41bnabeGSyTZsssooqUkSWlSz
	p2prbj5oO2IKHY8r4VJoNedFNuFmM2Ob/jlE8xzCi0HsR6EXG82tsKN/sKPctB3/FqLLocqhsY3Ar
	UG2uU0/n5TysHQzrp9DWNvltJzoMCv3bytC4Wdn+nT3QJiD5WEdWbsGkc76YtE2bKKWTiDDJXEI2W
	J+svNnZx9Z8qIPPPoaytYN5V/67xm7PuMHJ6pyGKQKItOBy31vJnC5Em9iGaDrfJu5W4qcmyaS/+X
	oJlIsD9r1jHMmNXNAClcm/DUqkkkvA6knV08mkRfgGvtlyjEGRXPJJgHOj5IGQp6JD+Bs3WvTaYde
	/1obqo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5ly-00000001j0z-39mO;
	Mon, 17 Mar 2025 08:24:34 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5jk-00000001iMh-0HpL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:22:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso47003821fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742199734; x=1742804534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8FRI6cy9CCt8b2M5LhQNzurCwCuZ436s4fIsfr2+0s=;
        b=Rs7PpcwBuSnUMCbdNSfH1WbpIoGCaiXc2d4sBVFWm2K9KVU+SqBkbBgOjlOobcv7mH
         Hfkem6r2tmLhTxxUAN7+HrMYP+L88KCMf8mZeGwgpfkEdzmly5SBrmkUQWU0e8T15OK0
         fDn4BR1ButMGnvlBo9YyyShEkrXjVufG9qKokoalZz2pR6yE4heovQAUd2jMduvewRZz
         7tzS4SorbO0UA3fdO+y+sq4QpfObkOPgPeJQN1DkvgawmVjDolbqBkEWerSUZfRhXCTI
         zb9AKsPmrVkzFrMrjAfYstqprC42aiwZ9PW6YlUsVMlTRLm9ZMFoy9w+Zy5W54MBlqYe
         rVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199734; x=1742804534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8FRI6cy9CCt8b2M5LhQNzurCwCuZ436s4fIsfr2+0s=;
        b=MqA7YsoejTRkdaWLz7o4dlk7smLeCistpVc3Zy00GwDxYVWsQbaF1MIk1gP7MtCok4
         D46MUoFq4XbFkJUCgM2iBCJ0xYlBxuZr1HKS70Pc1D7I5yhE03Wrv1WvsMI4Cqb+Nqri
         cDyiD4/YtfHHqijzCYnIjPbd0j/xze0aDRzOAsIDMO1m25Fi/ouBybf4vnyEHZRVvMnK
         WLRAcUH/LX40S7H20NJfY2dwEtBEG83v6Jjz6TXj2FVNmCPk4N9UmFRCz4bhmxdGLH8N
         712IlQvNTFloVfQLwUG/zRfIq8lXIxjdBuuzVdSi4luaAWPjnMoGxpHpK13jLgqKgg7G
         q4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUy2buq8DHgjPfpb6wXaD00EPBnGgc7pSyfOrkivkNBeYKgCeU2hGP9ZIXWGCrlOvbS+a6+W7VpQQyud/fZT4ej@lists.infradead.org
X-Gm-Message-State: AOJu0YyvAcNeFnebTVQrnoCfja+mJ92CyH2a0ZU/lkh6CwuGLf0J+24B
	eU7/HFyxhr+wR63ruhMEww1rWfIamprV4QdQeBVPyiOYrIHv+rPp
X-Gm-Gg: ASbGncuyrCGNBN++jd/3aur4XVRMvAmFRQ29h7Cee3HpjEVztw9agAxVG+L22VZ7NKH
	T+ieINObC4IpKBaz7Tvj20K8nnvoFbufg5Ui1k9jAuC9Ocf6T4bhdNVKwZwfv0RPEbhpuSvYUMs
	SDBxeby2qy17UzNce3Yft48irX8gPqfcJPD+fDppbQy9dICdFffCUzSxqZ49kJA+Wh4CqoRV1z0
	YbgDbiIpfqlpsR5W3lAq7UbMo0aVQjqawpjTLNIwNl0xUMgKgWTtquKY1vvtqnMXKA3EEdNUgsf
	vh4DCI+wANry18oHWJ/uagerM/iPbW0/fQCSd1wdOnziFCKvpt18cpj7jaxFFXXsUTg5zhq5QeB
	lYaOqQIYsYWgBeV7YozdGON7rnQ==
X-Google-Smtp-Source: AGHT+IHBKGlUlP46i1muxXD2BoUJCo9oeQCMBPNLoYtEWkTjbhR1aqc3+f20CvsiTwirEb5eGG/pEA==
X-Received: by 2002:a2e:be06:0:b0:30c:1fc4:418e with SMTP id 38308e7fff4ca-30c4a8d225bmr66527681fa.26.1742199733797;
        Mon, 17 Mar 2025 01:22:13 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c2233sm15370161fa.69.2025.03.17.01.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:22:13 -0700 (PDT)
Message-ID: <66a93de8-f5a2-4ffd-9c97-c646934cc90d@gmail.com>
Date: Mon, 17 Mar 2025 10:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
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
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
 <20250316093752.0eacaa16@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250316093752.0eacaa16@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_012216_112971_63690BB7 
X-CRM114-Status: GOOD (  15.25  )
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

On 16/03/2025 11:38, Jonathan Cameron wrote:
> On Thu, 13 Mar 2025 09:18:18 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
> I suspect we'll need the addition of an optional trailing timestamp
> channel at somepoint. But we can add that when we need it as only
> matters for drivers doing iio_push_to_buffers_with_timestamp()

This is true. That'll enable using this for devices with buffers - which 
is not possible right now as most buffer users do timestamps. I'll leave 
adding the parameter to first buffered user though, but I think it's 
good to say out loud this is doable :) Thanks!

> Otherwise no additional comments from me.

Yours,
	-- Matti

