Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8BD106286C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=; b=ZuVC0h5s1j6qwvlw9U+CiHJzmw
	q19HmWFW9BdV/2ZAioWXEHQHDYtGuhceAOTFPaQp7pUeCpBAcRgy/OmTXERdCz0tMxBfMORTEU5bh
	ELVt0dUy5kaT8DpzVP/HDWOBswxRUduUTtcpCDPXoy4CgvoUVHWq1QUDHZGhCKgpn/LXhNpfz5UoB
	WkfzxI8YYmXmI8U/NfNm51AJNJCuPaZ2B50AbyG1bDQ7G1kRCND+qRQQbnBSdgpeVnuAOnTRn2eAp
	phQG99InGL2p2EujF6n7T+lu/BnPyrhTg57BTbMqDB3sapwXDFi/U3D/qELnsnYTYvBwdj3CeHzC7
	QBonxDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I5f-0000000BW9o-16BX;
	Wed, 11 Mar 2026 11:51:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I5d-0000000BW8l-0EI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:51:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso7956672f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=b0Hf9R3+/IGRrMTzuqYu6KyqHb9LC01E+G5512nj7lknt5Zm+Eo7ZmzspLQfDNcqdY
         8Z0Dm5kFBbrS5Ttkx2SH6pE6GdtkrcXs1x0v632ubA0QK/uliyDR/H9zY1Gh/tXIZBz1
         jv0lB3lM/FFR+mttD53GAQZAghGSP8EVJIqkByDBJzXUmKddsCYEKZJW1PyKIuwYO4Xu
         SGhv8Q5L7JD4RN/CqdqbzesqWyG67d/quMKvvGX7Lz/5yMKsVw/w/QAFsI8ZyEcEh5P5
         wZmVRyDSlMvH+0Imrg7/RKC8G3ST/UbXoOsUJLS0zVL3CcPcb7sN1kt4kwr5g+L1oTuP
         8l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=q3Tac8cCYSQd2SFBTsZvRbVNf4r0vM1xgoeH4K4NGMkobNY3JeFhFUrHhhE4kowb+H
         HTeHYl4wyykr/NSZpvL1bZ9GHzQdvtNqRdQMtVzTYMgbycXg9UowNYznsvDDeSUWa3Ql
         f1epQhhmx8GMAhrVf83LMEZ3e6wXui6L6HrUcBmNcZCwaadpNSSeDMPn2bY2NaF0Y6zt
         GiCV7ls3IysgzJPihT2fcW3q2xijdpM2n8vgBXs6+4ZXwtGVk+Wjw8zGFArcpIJjKpw2
         Ffi/mTSe3NdMLWJ04RfFZgLYfRtMM+G1W8y/xSUlsCC7lUWEfv+WpukQjDwRwJpjWlas
         4OQw==
X-Forwarded-Encrypted: i=1; AJvYcCXhE0ra0cBRXCtKjBryDhkBGjwau+9zTKDWd0tQYQb0r9VRLg30xR3IHr+icVW1KsMM2VMb/b8upIFvAlxTALfQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmVsCzDeiKXHx68rXDpr9spAyblAqjAPCgAyN/hJyDwIGfFqUp
	YYkLBxEyYD/g4lueDWvP3qZ+uZfffI2L6bb+YFSye1ZDJgY5VYvnxAmiMz8f91OtyEM=
X-Gm-Gg: ATEYQzxn6rWVvUvk5BcX5PDC7KqqZ9o8d+xD+GNzC2sZpCM5cmOn2kHCl/2DvC0IK1I
	MTrH0hChU6r1YlWv3nxNuddgn43G0x+MQ/hRH+vQzwB9nd1CLKL2cpOguqb/eZiITzVqAQOUq/Q
	qa5xrGFaTw4Yy0M4KubjSPB26FEWtVCm/8wvi3uJNmjRY83VzWRnVBbv63lNuvr4kIhLq8hXV6d
	6aYxr0ptN6S6knabtGsNKKt6q5Bwmls6OisQrs/4BRn6xqkvzTxsWq7imrDnqD1aObBOchPQ14M
	MhhdxEQo64OLQODP/QmVUk++aIGLoqOL2IRsSR+YwbeUQ30uO5/IAWm6Z1HjR9ZM9ZCWO6hx2XN
	eWPAb6HEyGe+XrT5w/BdITmMbfAsXNJZ7xjZnBowi622KVHenAvNZTq6oREe9vRolBHpxvkxBAo
	CnoeRQs1JVG8PIk8Bc7MAfBciLKv4M2EI=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_045101_134882_16058E74 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta

