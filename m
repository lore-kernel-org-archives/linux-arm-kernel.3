Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6345C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8E7zBmmWLg3ht/ivGt6wNiB8HhGYbCrWpBk3ARRpsY=; b=jUe/KSR7CcfWz8jv7NLg5N7HiN
	MgprpC1J4gr3m7lTh3T6MYSoa2NU9aj0481ZZSAz306xXYgZpHNHLBc1IHRPwoo2TtMreGzfeYZnn
	JjA2jRn4MoSaC1JpVODilE5+frrNJsMu6L3qIsONLg4F7b/V9J/LG3GCsfbXUdRlo01ZD3b3+9TSz
	S+y7YzEJ0A5DR7bCS2EibmbHk1on/UFoSvO+ZH1JZb9BQWBi0Hu7CC/aWzqCZOc0633GIdJ1rLgm5
	G16qc4OUNYEpQ0lkXIXfyOgJva+zT6aFTnjgIXwDGdMy9G4C2qvxrA8WadO4e8vl6GGAoiXrCBHyQ
	BWQPpuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IFx-000000089qK-1Mx6;
	Tue, 22 Apr 2025 18:22:05 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GEt-00000007qqI-0vUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:12:53 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-60219d9812bso1256357eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745338369; x=1745943169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8E7zBmmWLg3ht/ivGt6wNiB8HhGYbCrWpBk3ARRpsY=;
        b=vOMQu4l0s2REM2A+Mh/iXQeMTx1TcOYDhSHvbVgTZ47YYAzNkwr/jRD6zysPqaLAFW
         fr2/uNWV8QQJgmifETEh8KdVAtgzzKB5cew9/NQiOKBYn9h1Sd8cdL02xGygZLTme9Is
         RSCifRIjH3B/glgtH/cfXXsWIVDQu7ijjeR6YkYaFhrygRiqnaBRsrAfHMTldhB5CcLz
         /vFUJrxPmPSRULJNBMj23bGfUkvftBoLRkAJPebUPiEhisMEsxYXQpxaAuR2vuAbpmPu
         uBlFwFm/VKfHFWJodLQ8UjdAw0A3q2rMqtI7SPzV4xnA6Et8/TE9FOpwEu0wID5ontMs
         Fmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338369; x=1745943169;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8E7zBmmWLg3ht/ivGt6wNiB8HhGYbCrWpBk3ARRpsY=;
        b=QiP1X7N5NyOKEC+wKkaoGn/fr0o3dfDVKkn5MbT/XKOOk1YtdEdD6+stlSMNcPBLUq
         WUqZCd4TBuaNGGCGUcnbLV/RAzh7aAjAWcTLhNt/KIasOQGjE9/uxmQkMKXxPjdrQ5sp
         +oPn6Ka4YssA8gfa4xazrQjexuIdZGnh05Wy6xWqoa+yjxh14YhIe4QuijQxasrY0FwR
         XU4B1eHxCtiBx1wR22BBSIzUsMB+YqxsUgzpAvDwoJWKlLEGvxdXhReSfu43R8uIXvhp
         XlIgiGonf+gNHo6RHzUoFPV4jS7iK3xEs1/6SqHqfyCsim/tJUpMgn/LIwrhy9MgNnNq
         0ELw==
X-Forwarded-Encrypted: i=1; AJvYcCUwwCe6RtHKFcmEPqg0eShm7VKXPP01Vc3nwf8kvYL7r1wNqpH1BclmqD4+3U4z2ilwnw4XulMzaowsV8Ak3PqP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQdzVXgAiF0L/zZVVKO+VhnJ2QqA4fNLGDXmlJVhqGeg6mE3eP
	v6s5evNNWsslS5AL262pnqxFAoec8IqntwQRBnGzHc9PKajqHSQ/2TdD8Ahyh8w=
X-Gm-Gg: ASbGncvWxmmHyL8hMS2sevUakQGbWi6F2uSyT3TwzbIrWLqqlkAirrSbNhVrlMp+Mr8
	Org5pgK1n/S//x7P4twOrWayKVX8G47FZnr0f34pA8AGySW3fEI7lg5/+JvujFd3vc7s4m0Lx+F
	bm1iwb3UxBXe75pbgYOgNTc3THrQ4v3swgA1ovBoqg9FruBKG3cRfJ8XFkWxK2rcIcM0NrLuByS
	155FhQe1Q1MFgeQ98RBJWl4/MwxjUlN0OoviDiow+RWJlkXLU05mWVgstn8vQ50zbcQHUdNzCAb
	dvXGwgKDqDg2YhcKeUz6mPBsZvyqFVs2/2ULjvLI2ll2dBIafDtD/KMc9Ynsfyv0p9XspQmyoTn
	/T1wmUbinxUMs+N1jvQ==
X-Google-Smtp-Source: AGHT+IF9Z3gSX8kmSbSuKPRtpakMkJO137BJhDQaCwgNlo/KRdfZOcLBygIlEokup5a5MePwFQ8OtQ==
X-Received: by 2002:a05:6820:618:b0:603:f973:1b3 with SMTP id 006d021491bc7-606003ec9f0mr7716312eaf.0.1745338369622;
        Tue, 22 Apr 2025 09:12:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff69c258sm2150287eaf.25.2025.04.22.09.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:12:48 -0700 (PDT)
Message-ID: <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Date: Tue, 22 Apr 2025 11:12:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
 <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
 <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
 <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_091251_501670_CA70A07D 
X-CRM114-Status: GOOD (  12.23  )
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

On 4/21/25 12:03 PM, Andrew Davis wrote:

...

> Which parent device? That is my point, if the top level node for the
> whole CTRL_MMR region is made into one big syscon, then a big regmap
> is made that covers the whole region. All the child devices also make
> regmaps covering their device range. Now these registers under the child
> device belong to two different regmaps. No synchronization is done as
> these are not the same regmap, regmap only handles this for multiple
> access to registers within the same regmap.
> 

Why does the child device have to create a new/separate regmap? Can it not use
something like syscon_regmap_lookup_by_phandle_args() to get the regmap from
the "syscon" node along with 1 or more args specifying the one or few registers
out of the full range that are assigned to that specific child node? This way,
all child nodes would be using the same shared regmap.

(And yes, I know technically they don't need to be child nodes - just using that
terminology to be consistent with the previous discussion.)

