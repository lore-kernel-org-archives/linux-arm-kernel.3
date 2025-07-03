Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D43DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=; b=P2y6aEfB51rOkOw4MVCxK9ByDO
	6O6YB5umDVoEoydgzX5DAY9gP6WHbiflrsAPlgoOrb/3Ea8dIrBfBLgTtlWKpABH7Oc9DhPhQ8GkX
	IwduEGw37VhCpc7LRXhRNiR0MBghZfowenH5BNV8bqeElh3NL//qhtWlLpzP/rehjYIUN80z99qbZ
	MWk+lH/1yK2sdYN+KjG75jnng+1LLSReonukiCAiVhG5m+IEmqb4zzcgGgKq/dhMLAlZbEs0P+/ad
	JaxTTPajZ8WdvG3ISqdx57I7CkyM0Whj7pudMscSIwFEsY30iOTQCGmZVcufcGG7JR2TYWnslTqUJ
	tDHQiolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzU-0000000CTF4-2NCC;
	Thu, 03 Jul 2025 20:57:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLZR-0000000BlwF-1Jbp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:09:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a52874d593so4817693f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555391; x=1752160191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=Ebg2/opwf9Wjyo2igtCRHWyKUVvS0IhSysgErk4UwN7KZlfDBcJK6vMUPe4KwOw/fo
         DDdt+B5x5jz9mYahvHjAyd4jsME5s5LLdfkWIDrYdYisnP0AiXk1IUI26o3kDgmgBUij
         TsAfrq9zEMqnzAlgZRPXzYBBYfkiZ0QwtnVvEZj5aa0lbJMvKnoVKXPoWDNGoUFa+5Og
         0smORGst1Eju1dwHMJih/8ylaXEWVUlVVi+2Lm+0Z9+zo9/PH2vLMKf61wtuaJTQoFu6
         Hu0bwfGCB1qIbjxOq2UacNL77Bd4nvGAiVwv4NtK4eIJ3k2NpexiSr1AceeCjuqP1XNx
         qg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555391; x=1752160191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=hornO/cMjzXTLzmddh3sD3Dtyu3xv5OmURtSW0lDa7JJOveOM1IjCvhDekzq072zMR
         XLJmfsswfZkVpgon1bvys412/HACRCcMb3QuLtO+roKqg9+56glupD6v74HnHPxBbve1
         II/Xnq6T74iZa9d1rRWwCwrs02SvHwj8myeS90QhCvB5r3Uc0GFfFEIqS+vLT0nw3K5j
         yjLGhEfeVSAgTlCA5/4gY4m6qcNC6HZCGkuaKbj77ESn5y5oaPxIfvbyXrLlkJ3WZNSY
         2fXowyrYbpu9zBcC2uKzR5ogVpGvI08l7Cay0Axr+q2ZqrLgv4hmOKzx9a0EAoRzn73x
         UmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8reNJEYyU7qT/GxEVrtsOrRvwscLO5inDR7ZVuoNXEM1fIu5aSxopEpOAscewWZYiZYYa3p86nu+wYsQklWbb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi8L+VET2Cg5sLYxOf/Ql2CA0z7mZ4nJ7BlJX2yaD+Nan8tKHk
	0Xh5s18y+mJh2NuJqHPZ6TigXGPBDIjZyir5cWRJD4CDuW3HdMPet1hqWjxMPqzJ1HQ=
X-Gm-Gg: ASbGncstQlMgkvxi0CKXvBi8IS1C8qh0J8IA0i141IaBriyeupetkNBE6gTd7ymK1r/
	K1wC4vNLd0K+tI78OCGXf2585gplMcgDsnyFqG9pbas4SMR5TDSShT1kKUZRrd8reZxAzX7IjO4
	3Y5QyzdU0lCApHEi5bKcB+Nxp+NSOMQfV/eHVE73XxYrYpMmXiUxs5/UyXRG3824vyQwHy0r8gl
	l9Sh1Ofi+4aGKGKzV3IwQRAfAw9NJuCZtPpnZy9u3Fv18nUI2eP+owgcxl0pIeZzjZcSJ5NxOI/
	Af1me/lhuAe7RMJYtIyFnXpTLno2rFTo5uGa5xd/TW4kJIGoI2N7tdlkCt4=
X-Google-Smtp-Source: AGHT+IEmRzbd+GUqMa9EtpxZkxLu0N77USju2BDfKfk5a8aVAGwl1ML9f6DqwUQeD0xjX4cStIATAQ==
X-Received: by 2002:a05:6000:23c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b32bbd66bfmr2181064f8f.17.1751555391014;
        Thu, 03 Jul 2025 08:09:51 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290d670sm10712164a12.30.2025.07.03.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:09:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:09:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <aGadO/7e4ndjK2Wg@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_080953_372724_887BD95A 
X-CRM114-Status: UNSURE (   9.12  )
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

On 25-07-03 11:40:24, Peng Fan wrote:
> Add nodes for LVDS/DISPLAY CSR.
> 
> Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

