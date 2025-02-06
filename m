Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A97AC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=; b=iwG7TdjYyyoS4ObYSG0tmOpaaW
	n5wWjK9DRogZkbDkTt93xtoviWzlMZa0uCbDkDZT/EnsQPQUexoW12eesCwBt8+l/vOd4CKuNBCU1
	sloqBD1AQqJNBAErfFvBM5TiYwiBf6XQy5Www8qizGjOPWMXgM/TWbDCh5TLj9Zu5r8b0NgEYFn7o
	a6sacM3KVugwbT0jQEWTNE6hDdO79/G5tuTTz/Nif+Jus4xGTRdVmfgv870ogubvzSldxrL3is9Vk
	l80pKBfSixlXvKIgNrnozCMb5T05vJfItFU1rvVU/Z1Zs1yRvl7eyZL3+MTRFsjTjjJyxtRg+boat
	ZbgvujWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwtx-00000005g4w-0OaV;
	Thu, 06 Feb 2025 08:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwiE-00000005ekn-3SJL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 07:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=; b=DkIy4EJec7e3f7SZwA8rALRfmQ
	BaTZhFCMd0c6qxvFtCvBm3h3tdojJlexf04/E3kVWVL42zVfcURIm1GwV3EGzWDDXr3uTItKLY0nW
	yerFSr+7OzoDk7J9fOke0bwVzv1hQQUK57HzzN//4CQS1zeZmQG0GaqVtk7h78/WZq9fsVus3BhvP
	33DFMOEaG5+SHlZs5/jOdybwvWfn4xFZShwINt8vbdbeKoOAdGTnULe8fBX89zo+SE41PhKKDMK12
	RCtc572ids0dwYrEWBMbapECotaGSklTiHnauy6sm3KUjkIP9OnahcbjkHs+IB4AD9RvdWlZOL4/A
	PcdYMQVw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwiB-0000000GrVj-2LWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:54:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43626213fffso9980165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828449; x=1739433249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=xPPzsrs2CduBcBhkMJN1s8Du5fu4fH9Y7jYxlyUw5fRm7Ojw0mdhL3EdF2qZa4ZVPT
         eSz5nVXYnwLIvq/CiTnAR2T1m1fTxeVIvJ0h2EzVfOlVGNwk8eBKOYE4xEEfeKxom4pV
         EB/v21OLjzow5JLNzNdjMg0VuGPmS2VQjRR77HiZcHnWEX2+TjZ6G+TkI3ysNoGXaJQb
         1/36fOofoJqaT+BULmtixV4FvPsb8CPYgY8g5ZKEXD2Stp3i3GrroC5nLBQDNeUMX2UZ
         Aw4YLiPQmKMpYEZkQAprLlI9+8kErvlZO3hKp++aBYRGYiOE1L/PPiMgi5pydB9mht/H
         Trmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828449; x=1739433249;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=T/bzWLCTWHJcGyQOTHUA6E3UvJ1+0XlvC4RLjG8DaClpbUlEFgzxRZnGSwY79K0tJ3
         9/1sQXGVwGA2dwfphoXjCUuYCoiezIGoxf7ZSEoNhb2/VO9WhB9yc9XFhYrkkt8PIwTF
         sgJW0VjaJkA0fas6OtKIbUVI/NTLuH8TRNNoj1439dYHxlm/5qki/pfCwsVWtL78ycxp
         3voS/hdImgpq7PfqnXekRFr1vBCclekNkmqQp1jCtL9TEZ4OP9PbpXHTB6/AbN6NdJdk
         k8Yj5RJxmqvwY5+Yx08o7CN/FFCwfhznOpf1kQxpEoU70kuQQ6xGhwTIyQ9xR15JPpi8
         is5A==
X-Gm-Message-State: AOJu0YxjskB3bDiVoi/wBfypAz+vXhlFqsq4CQs7WvezkOHM6YlUKICS
	+89PFFPhDlQrC37d+bgpyR8nez65v1dlH9TMFNU4DneNnd0dGJNbwA8CXyfH5n0=
X-Gm-Gg: ASbGncvIfzJ5UH1P/HDTPMfkxFAMIahqUUt8sbhb85BcSN2dCYDh47h+svFZlQnaeLU
	vWt7gMuYhcAqQ/+QGalWHP38hUNdk3vkKyHxkBT3girEoDEjw+iPxt4cvFgSgNpfNX4hz7x24Fn
	DhnTnn0ECKb60j53SCUqoyJJD7YEtv/EhE5F24iNlmet0Ru9Ng7VOPeomCrGhLOIabt3KHS9ggO
	2hU1KIuoyi94q5o71gCvC9MUZ3KYlnydA7n/C0tPNCA5W28TUG/6ZhFuJLTKlurrNsbSMeefWPa
	BM5z7dBT7tO7zIxnvC+ybKNJNUahpZRm3dVbm5P+G0ZjRdxBEpPE/ozbfox0+UkoisJO
X-Google-Smtp-Source: AGHT+IGrzW1LdzySmLH3XUvU+ruX4SLesnotJf/9MZ7S4Ul1OkUGYV9PvZdjXAlQoh8a/JyV5GRRkQ==
X-Received: by 2002:a05:600c:4703:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-43912d1510emr13458025e9.6.1738828448157;
        Wed, 05 Feb 2025 23:54:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc050d688sm522181f8f.24.2025.02.05.23.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:54:07 -0800 (PST)
Message-ID: <9db01455-f3e9-474b-b87a-30f934ff6a02@linaro.org>
Date: Thu, 6 Feb 2025 08:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075411_878665_96DEA8B1 
X-CRM114-Status: UNSURE (   9.54  )
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

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

LGTM should patches 1, 2, 3 & 5 go via drm-misc ?

Neil

