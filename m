Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41B1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=; b=Am+y3vVZLPwZdm8mg//tR3AGoj
	pMHrEaiwRs2pYg/pzbBx6XlUjS0CAqtRlLTRoOgoLZGVEXNs3GfNKugRDhEnGTXO3ZlLd31MEWcqK
	cZMVVIATkg/5mamVWSg9DwykMyyyMZJ1xlLO7vgjO6qmbtUYjIUwJcmuBepEKMlTwViD0GNJkRnOz
	wbF7OrD5UfvLUFW4ZmQYgh0tUaLMOu+XgDJh87NkeWpY2WjGEnVKd8QhCxZKAtcZLBWqprlF8ASt1
	AjLXwSd+vvcce8lW4si8K+29Js8m8KHx55NzzTMEG8BvLC2JBg8OYaQskchtzXpwY7Hc8TQ5KfTj/
	9tcLofKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzV-0000000CTFk-3FCH;
	Thu, 03 Jul 2025 20:57:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLae-0000000Bm3R-0OSy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:11:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so8592050a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555466; x=1752160266; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=yzQcBX2kCxJOCwgjP0OMs0dXjEzuEqF9vQ9CfBRTgZUjPu6GV4yxQsByndKZEhUnVH
         EIiqqRSA3ewWBLNAOVwIU8njwrjKf9RaBBa1JmOQ8Jw6uyCVhOjoOzXOnMepv7BRgCE+
         mr7hP/M5dZql3wEbe2XecW8S8a+aJyx1lRqrtBUmsA0lWou8KsI2ugEIdH6AQWSTevJA
         +CTi+3I8fk5oZhulEQgFF2g6vPekvtU38NMn6HTEID0UhJfLP3/IsTkg0GxUtJiXIDcx
         ilSMNlBChFIJVNeXmmcgUUqvLyRcJY03ufHMatzrolwJK3sIM3lMo5pqXT7CwBkUn1fm
         qqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555466; x=1752160266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=C0rEwyvZ6ELaZ32EaZWd6aU4R3ghVWTXIoVaRah5xhmIMWT3jOWMb5TbJolXnGK4Dd
         SIgo4JjgEXl56i/gafPSUcZ+zXrOxlO9/YCA+lJJWRFm4hBPQch9czXFTXxjgBVid5AO
         XsxTCd+GZpr7sP2bnsxAXPQYrDfiEDmX/UuqLHKRxTT5PA4NBQCoO8dxiQ5aGl+jEKJs
         9+m287zvv63n/QhWXrWdyclp/gGy6jJkbj2csVG7+AzywJ7+HlgCPSvTsufj8yguFU3N
         i7fVBQv2aFOWwCHdHsl7J/+vgAEuGcohWeTACjSHqQjfQTrVpoYcwQAdA+l5AXcMPXpB
         v4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVB1NXfwylwQnEjeHeQxK3/sAKA7LoGvhE3J4EZm23LFbFLKBvQ9V/tbQ0iGaqn6IHChG8Y16yTNgGTSpgQz2+N@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZLobKwQeOdwBo++JCO2/77gxOa3u2Q+7LZXbi/VS5RXeUuf/
	tyPrepBUMZN9fsq8C8BhJ0pZXzOpwxGaa+MLwRzz2snMH20ptzva/EEZ7FgRgPzM+Hw=
X-Gm-Gg: ASbGncs695tUASRu74D2vK2Arzg+ocV/oB06GNii0qTGA5HVnRex01vKRc0otJCujsD
	JeiO8t0Ze5ZjWoSv+J1vByQ86m93Okyhv64SLYjwyMG2JN0Ylebsh0Tby7ROgI2igGPLGDjF+EC
	hDuxneZKaCIUW5crZhRgOBgq4xHZ8lyVpnjeAGHwXxmYY8Mi2nk7BzKGpR1G7W1QZxi5c/Rc+qe
	AJBGOLUJWCTvLbXwcmwU50z32BpUp5y29UuJkPc99AvPHK0bsEVusJbcvumEyLxzkQLK2skwuP+
	4/NoEtM2aid7N+VGPXogpGF4rklVW4xtdn1VfPe/5zV7In5gLHo6gCXzYsM=
X-Google-Smtp-Source: AGHT+IHzpMVd5ZdMJKAden1BEk7leNnkWoWJcBZRiZrrIpoemL5vbs9A7FF6CC6wG99E12R7ltKp/Q==
X-Received: by 2002:a50:a412:0:b0:604:bbd2:7c88 with SMTP id 4fb4d7f45d1cf-60e5350025emr5522209a12.26.1751555466332;
        Thu, 03 Jul 2025 08:11:06 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fbf791d06sm258603a12.2.2025.07.03.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:05 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:04 +0300
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sandor Yu <Sandor.yu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix
 csr blk
Message-ID: <aGadiPWIKbqDVek9@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081108_134310_43CEECC8 
X-CRM114-Status: UNSURE (   8.74  )
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

On 25-07-03 11:40:22, Peng Fan wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
> support for i.MX943.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

