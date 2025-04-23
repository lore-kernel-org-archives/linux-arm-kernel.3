Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn/kdeC0hIJ6fPjKrtocu5NnRgujubxfAbJ5Urbgh9w=; b=DaGOuZbWasUU/7XCFbMRh1Tf8d
	7IYED5A7IttTnP5ikIEbi/TCJPPgsx1nbFog59HzyJud9mxCaoJl82ZqmAdBzeTEOc3mSsfXg2Yst
	5p1JjcG46M7qYxMKC8R3f91OPbbrkMHPnHQV/atzm3kq/d7PDUif7c8bg8nxAM3shdZkOM16nwsYn
	N14Px8vKav2YemtslNbrF2KsuhhKRXqW2JBTVlNdbu8sZA/XY5jb6HP8QtsOCbYEceLwLc0U5+q4b
	Y6yl9V7nvjcO/qbR+so4wX0cw0sLGaIJzP3t/ezaQJL9gnOEPV9G/2jpp9bmoLhAMWz/L0hf9CYYM
	N6XB4S0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Uzc-00000009bO7-0Cz7;
	Wed, 23 Apr 2025 07:58:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UVY-00000009VrZ-14rF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:27:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso28933645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393218; x=1745998018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn/kdeC0hIJ6fPjKrtocu5NnRgujubxfAbJ5Urbgh9w=;
        b=n3o1EOpyKa/3mKzPAa7YHkVfuOUEjLlYkBO27HjPPr3lomCaQYNWNJrfkdw/nKUu9H
         7ebCxWO5mSSJD5FVDND8ZVcK9p7k8j6QWedidzLaXTHu9nwBoRQL3/iOUl1rHuxCipAo
         t6/sY5SMn4kT4Spk4diVnueVPmqNZz2vFyn/AavA82xU/7TEHo7OoVN4SXOLpKXE5MFi
         lFHkEb5xZD1sEY4BpwPUq2b/9mjjMFMPzBfGk2YV8rcB5dJfqtoqcSzktFcTyHUmxYOP
         93md+312D3CN/b49d+bwnyMMxG8Vh+lRMzewzvAmSJ7OQNfRZ1b10kdIlScU2TF6x4ba
         672A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393218; x=1745998018;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kn/kdeC0hIJ6fPjKrtocu5NnRgujubxfAbJ5Urbgh9w=;
        b=oETAi3nDNDU88dybYxwXtIX7YEk95NkzPsIquXmMT6V2qlzrHwCsQ1R1eybjUPaiiB
         8dzt9ifm1pNrB/GNOXbvK/0Jh7+SSM1Le4w9FxmfILvPgbxHWnaBcC2rLQiIRjPugkTx
         siR7YL+GxnJXUND8hI3/kUl0IRvC9kM8EURSFN19kORyl+4lGs/0aq1cXnoh7VSzHL7e
         j55ZCEKFEHmleGwQeZ9prtlsjqs/O21jUBBgPEZBUkGP561ZZ7VEwyJYr6j3kj0g+TMo
         p8jqX55cUQsfUR9VDF42Q0IwdGvSnfLQhkb81kOI0rEKbSVmOak05w0ZhOWsJ2dxU/jx
         Pncw==
X-Forwarded-Encrypted: i=1; AJvYcCVCx5Kcuc14uw2qW/Tr99uCqIvUnNL4PwnafzDfvXNBaEjetEUHJn7YGBOTof5Nc/hR3nX8S9oqVOZVSDw0C6qC@lists.infradead.org
X-Gm-Message-State: AOJu0Yylep18lXJXdQbL25jFkyRbMn/VnOPCtLhelULRAQSM1M02orQx
	TXgxcuxxJO5ZEUozahGbeIQ7KNH5rVeEOAaOD0yNNvH+x7yafbJ4UxY+mlrw3I6ghDxE6pTqMym
	1
X-Gm-Gg: ASbGncvh4PPN1mzH37nXE5mx6nQMB7C2hOsPEVdx91MFkKDDdLHcqjmyiOwaokHiFW6
	Qd7IEBRnKGUEzhOtIxNocoP+ZyG4J2+B+fvzWaS4pAZzA1KPRKsgDZZ90w2QzAKkNVvGtQMmYFm
	Eo9n0JayQLc6lU8fyXGzb7V5Ng5gCLNH5tj8WGfLnInMcnHLuoTI9trOsSTxtmQv80lIgBm5hrB
	/4rn2GABi5nLKYDzEge+NsOL1eOFJCo+c4d7ITLPUcIj1QmJCmNAVdON4jgjiNrAHxWjlr50sCf
	vp+zBThHSdV1jll62v3mjBrMrwGzbDeNIM49h0yEssAf8z6F1WUTi2scxbCqFLRPawz+pV+3mra
	QEZaPxGDQLnnl4AaiFw==
X-Google-Smtp-Source: AGHT+IGQjZAyp9xHW8ASlQKrR9fCiGMeMbCakgAb3SkKNca/+Rt6CnnTlRW63K73V1hHmlOCRLIMvA==
X-Received: by 2002:a05:600c:1c8f:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-4406abffc5emr134620725e9.23.1745393218300;
        Wed, 23 Apr 2025 00:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092db2bd5sm15015645e9.26.2025.04.23.00.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:26:57 -0700 (PDT)
Message-ID: <283096ad-ae1b-42b8-8312-b192f735fc80@linaro.org>
Date: Wed, 23 Apr 2025 09:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and
 Google Pixel 4a
To: Jens Reidel <adrian@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Connor Mitchell <c.dog29@hotmail.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
 <2ca2b774-fd7f-4612-b38d-f60e32ff6f9a@mainlining.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <2ca2b774-fd7f-4612-b38d-f60e32ff6f9a@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_002700_297651_B9EF4362 
X-CRM114-Status: UNSURE (   9.98  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 23/04/2025 00:07, Jens Reidel wrote:
> Hi everyone,
> 
> apologies for the mess this created. Danila's mail provider ratelimited him halfway through sending the series and the attempt to re-try sending the second half an hour later ended up with a new message ID (I think due to not using --in-reply-to).
> He asked me to let you know that this will be resolved later and the whole series will be re-sent once the problems are resolved.

The b4 web submission is a great alternative when the mail provider is rate limited:
https://b4.docs.kernel.org/en/latest/contributor/send.html#web-endpoint

Neil

> 
> Best regards,
> Jens


