Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4340FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=; b=V6+evmu0YN5oZbK6j5qt+vfLig
	pW14F9GrAa7WEQ2yQ1cDzKDLZbQrKCmvLOQtyZ9xvwGnwHS/PTXEXeWb3guQ7MlUWNu7gWZd/jkJ0
	Eq5ID6yRpDBFAAtezqwAUNiCrmzXkMSt5Gm8kbzT6pswIPXZ+Mtslvzixu4SMTxuQvjd9IOqFMKfN
	8PWdJ412uLNOl8Yf7vTDzBRzjLm4lbYZF568l05oReryLUmrqWn9V+Qw3KrOHUCjRGRBd7iJJC/6W
	+3TTe0ngj6hrXuMAwrHuZ788t9f+iaJP6nyjIwsf0n5nfCBh6u5D791thcHVRDfrmRxOhi1scFzow
	Q3Fjv0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9c-0000000Elz5-30L8;
	Mon, 29 Jun 2026 13:36:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9Y-0000000ElxC-2wTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:36:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493b0fe95feso5664965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=doyC8I0iyjgl9WNg7f1yJvwuKOKmYWmbgU7IZ2SdeB/6DOf1CFr3HCgx5t9DHg+64t
         Cc1H1N/rX2bnuuYOLBdcc5+GelvAd0kaGgyTCorXGQobQQLhmHF/lq1pWKVVe1GeymNR
         2KnWDhtly+3mfIgYsnlHgVZVLOU/tiEddK0nalEwx8HEPRjq4nIJM9OJG7MqgHlOtba8
         RcJ6QHpbmm+PIL8KU47rPK7JfGGtAk5TzYO4EcLfE/qxn5FC7jIGLRHenZ8jWteIyEQ9
         /06ANjhk+9STkzV5T9v4JGdSqvBbvS6lNIISiH1AE7cbL0X2QguSK6weSrnU8sX4IiVQ
         gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=SMkJCGdkQCaoJUK+79WegZ4qU3FATG/pUHOMqnjyqXKRXefQpcp1zc0LJpDtLZJQjt
         mULscP8Z/y15+DWNuIXYBBmExDRHSSeS8l96ObX1L0zrWw89FX3CBcZVOmf77ylH+LDB
         kKkZ/YVgpL0aqd+KTFt3BVjAmn1zhb9V/uukT/nnBY9sCxU4pQUulBn1qr1IPOffOWnZ
         h9i6v9pdAuWO9qUqvPcRKAAVabV5DJhXws+f5nqm5r7wSQIgQSGRPJD9vT+tLm2ZtDUJ
         JDELAyXAfWxa/34uQ/FdHb+3qYkY8jUCRUdnOWh8Wx6by2SqLi2Fc2lh9vUEZ/BbsmBn
         w0cg==
X-Forwarded-Encrypted: i=1; AFNElJ9WMovVlh0dS1qjJffPa0mgBZc4KdxhiuofZT0615wls2IfrrKb/Oip0mZ1P96mM0L8hbg/Lfkhj2HKz8dW9OMc@lists.infradead.org
X-Gm-Message-State: AOJu0YwtSAG/Fz77RL4iuL2z9Oh81h/63AjRZwBHvcdAKwdIG+S4dbtA
	diYi86ycqk7UGZvI4qzbxA3pU0I4Z/WX+Mma4juwa8Po1R74+1VpIla1
X-Gm-Gg: AfdE7ckBkXjHBmGT8/LUT+ANovhu2UqTTQs85vZGA782iqcxa/ZpOfM4a6NikSZN/PG
	8+c3vqELIzppfcmM7Jy6rZMDEBoNsoiSv1egAZ33oJ4hZoD6fgGcaLDxD4srKqsTBQ2UtXxs3yx
	tTN4mkjDOUbpjaCTCAu5CKKKtn7B6HukpFrFElmltWYxBbHegxaEwdRvoWWxBIFZZZ4XeZNmP/S
	wA9LGjGDI5eNUTnCTIJC8OaSfY3iuH2rh8+rZZdC2t2MM8W0z0VONSJGdzQvXjUBnWgpO5CfbNJ
	RVPoyNyPeUNfvZDCUr4zpbEiBpDVNL5GR60G8P9cShoAFW12nJhg9whhsJqy/dSV3QYwy4nK55S
	CeA9yoEMdfXx0Vqk9rhr9JnzPbt+I2XF6GY0eMdAqzb8SqT9c2lrnS6C/N7Q6rTKB62+8B3VfUw
	KAKuGPqcU7zgBYqNodJTYcygRjchkVsQQxeO6r0HzBYW/S/bvL85JWktSQGXSwN8w2fDSI82HEb
	z2OLNSq
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_063600_757633_9E0F8978 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Bartosz,

On 6/29/26 12:28, Bartosz Golaszewski wrote:
> +config PHY_QCOM_SGMII_ETH_SCMI
> +	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS
> +	help

I think PHY_QCOM_SGMII_ETH_SCMI is missing a dependency on PM. I get a
build error currently:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [y]:
  - PHY_QCOM_SGMII_ETH_SCMI [=y] && OF [=y] && (ARCH_QCOM ||
COMPILE_TEST [=y])

drivers/pmdomain/core.c: In function ‘genpd_queue_power_off_work’:
drivers/pmdomain/core.c:936:20: error: ‘pm_wq’ undeclared (first use in
this function)
  936 |         queue_work(pm_wq, &genpd->power_off_work);
      |                    ^~~~~
drivers/pmdomain/core.c:936:20: note: each undeclared identifier is
reported only once for each function it appears in
drivers/pmdomain/core.c: In function ‘genpd_dev_pm_qos_notifier’:
drivers/pmdomain/core.c:1133:39: error: ‘struct dev_pm_info’ has no
member named ‘ignore_children’
 1133 |                 if (!dev || dev->power.ignore_children)
      |                                       ^
  CC      mm/truncate.o

- Julian Braha

