Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9002BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=; b=yzhgxo+EaiH2NXFMC+fE8pKXD3
	SN/9guSClSOnP9UBMZbn+cFJ4ZXyvwn0EAuQA5NxZVugNaM5SPGiTtdA/DWLmiHVW7ZsVVDMI5p8i
	s1q+sK2MBQbK4aT9G7ycyXvJC5mxEP1dOz5QYxabFJg3cobUknIzehfa9rW4clwyCcMKret5hSPOX
	dasoTCVrwFlAJosGSMdVLEzs+r8pIv84QUv/ah5SACNhSJiWH7wNCvT+/14Jy3itXgIhBYBCKNKQ5
	P72obvnKqP1YvzqAhLLLGhY5S7WWG9B4n9SKjAXWu2T0eJ3IdJWy0Ro8xwQYaqyL+KaQyN9mJlaxH
	chVvtExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvvI-0000000Am4d-0dhS;
	Tue, 10 Dec 2024 08:48:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvtl-0000000AljX-1kei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:47:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2162c0f6a39so23604575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733820436; x=1734425236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=AbQe3b0wO46FMmIWZoXmz6qr2MdTY5VDGQXZRdE6DPZ5x2ny/MISw3hgClgx9ybb9F
         ssQEEyIywX4+ta9KUxGq50/CKBlIxKesZr5276QNpXmy4a7CQ0Mwb0x64O8q3Hj35om1
         Q3WJpral0DK6YcYwp2RgCj/7c+lmHgikNdk0B3p5CGi6B+8DkPncO5wvGLsI3z6Jqi1E
         3xqJyWx5jaDADJ05EvMkXhwodufUNc/akYfF0hfKoDXbbdmZDC9rHkOKg2kDV7o2qx+8
         HG+5B9xW17Tl/ny99I1S/pW+avsnjAehP1DCLYQxOeSf32yp800XRUwNfAUiHUhDKKp6
         YjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820436; x=1734425236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=o13/QVbMZJhoW3CCKBAqQkumTyErmEfE9Me4GDf1xUe/vnyNkfaJ/pHQ8DfpfJhM8U
         oWfqYU+YCvXFqvJ8lRraZx5+2TrS5S8kIMtTIXiin2Ib6U77AbDtROW1swcrZcmt5fdr
         5P73DPWQoM4TedXmSqpGx3YF/ZGao2rWUZP3nsWIAf+0W0JGBIB5feNiFuDRHEPscjEX
         wX0ZsKeocUJ2IZc6dQERVKwaJGIpRH5IEFQcYVRX7cy+OG326oLwg112O09JJT9f8nKv
         fdFrBj0JqxBxz7HLNS+krxnQ+g365dLaitz3WE11HtXaefNiAp7INOX5WyflK8+4W3ox
         LRPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjN1TjLm0Xm9aZxw9lFeArNFv+/iBf2IO9MseGztvNqy1DdyPh/SSjwF+pTJhkIEkHkApd2uW6B/bIckKGXyHS@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLe4S/zbthkX1SANpi6j8DM0xCtWMsIqyzjjXhTTL/ghZAfnF
	UblFVQnAewgDugbOEouoDsuonN9K+kdqiSs79lX8leQMj+TCc7dq
X-Gm-Gg: ASbGncvwtFuRl6d/Ai7QHfqAEoiX5AtHV8wV44nk3hRSVs82hn3nLLwhsyWLZ0plrC8
	forEWRuiEzpqssf2Wf0JhowRwXVF6Tn2pim0lvo31l/pd3udeN/tP2x5Edz4LZoTfW5B7Z/9sQw
	vJtGB114WXWJ160FUsWNMy0uInV5V2dRy7gr0oDhz330ztMnAc5tSukiZwE8UE72mlKOThuNzBo
	pZ60JRm1RMxum/svhujLLmkdK6+yp81fKDgXyfNNonoNfMJiRU4JwMafKofgn7Vo9uOwEiMvaVt
	Gg==
X-Google-Smtp-Source: AGHT+IFyFx9u2Q8EBc+BBmDXtC22UJjW0IxAAzdnx72zpqdewbRBPV5UQPIkvDpar7059Mt3H6VwCQ==
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id d9443c01a7336-21670a47b3dmr40495715ad.25.1733820435973;
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f26c6csm85230675ad.233.2024.12.10.00.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Message-ID: <23e6d9c0-c3d6-40c1-b933-01c5a9ef43f8@gmail.com>
Date: Tue, 10 Dec 2024 16:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
 <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004717_453528_B6D3574F 
X-CRM114-Status: UNSURE (   4.76  )
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



Krzysztof Kozlowski 於 2024/12/10 下午4:32 寫道:

> Nothing improved here.


This is sent before you left any review, v4 will have improvements

Nick Chan

