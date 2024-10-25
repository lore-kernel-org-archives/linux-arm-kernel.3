Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E668AD116F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LENYqwcqgnLHnXVBhDyfSMRgdbqUwUn0CP6hPe43hIE=; b=pEMA6f81nZoJqzdY0aQI2RASIL
	3nn7wEPebKAnVdigK5Ee8R4T12e6u9YkvxWIbcbJLf6joTiLXhQ0qdB4oe8ctjnIUbbfq9V68WEc9
	vPyw1zdecofMAff4cmosi1xtIWBqhQFxg7GT7n67EAhPL/h7hk9O+6090iBIEHsI6eMRalnkJRE3y
	IxzfcmFMYo9XSyekg78JmFkcvXDu5tYFqoSd3fy1w/uWtHHrNH0xlnwYB2OKB4KEYIZiFX/HbCn74
	kqLLZfetXz0GNbgZmDimBBX1l0+ASTIFaG2B8MmIqc2+5ju1Q00g9duCa7uoTWT7DsUY3JVdFEHUi
	otcPewKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DFs-00000002c4u-25lT;
	Fri, 25 Oct 2024 05:53:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DEI-00000002bjn-0356
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:51:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1686264e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729835480; x=1730440280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LENYqwcqgnLHnXVBhDyfSMRgdbqUwUn0CP6hPe43hIE=;
        b=T0X2B3Q4H86CrL7dALRTwVSMqViRdOsMo904JuVpcsoez2HRBytKfoQFpsl5iuNg8R
         xPMLPx7uad+YCr8bjAd7lugE2wiM4X7esWApopxkAlI6LlxKO3ZF201QQffHw6YAzzcI
         y2de85ASNpn3Skv4mHhBlJthoVYJabFywz0ELfF8W67QAyjoRNCSr3vJR4msLgCN2zdL
         U+LrzvvXyrAcgRn9hs58BfZgLVqnx6POeZkZEsEBekLbluT50RWhjsCiU6eNx7SrkFWT
         ZnrWcEMNjXPWsQGjyUzAVZYTbt9tpcLriMPEQY3EVg3xnXFRRDBhCTZ85CE+YDl2TeXx
         qzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729835480; x=1730440280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LENYqwcqgnLHnXVBhDyfSMRgdbqUwUn0CP6hPe43hIE=;
        b=rz3HOpxFmjUg8N9WJEXIEu+5uNwCkZ1Hvp5tMgFsZQtv7svBuBG0nn7tRMKbyhUpDt
         SoQsC7ACffOV2+9hBP/PUjCL2FSatS1XcWkoEC08UIhQG2BOfOOVo8MhKuyMM0bUvWRG
         3iMf+5l39uepskwp4W8mlACNIXDmso/w+fEIgj7CD8DHOa918v2nuO5R6AxgYp9X1KoZ
         9KTe2xjdyVISIpAeYS/E8SqMWxRVvtUgzQ8S1e4Xvh0fZkR7oe4uNBwmcb7OLjw++OBs
         zV9X361U0aX4/vUyifnCB0dF4x4IO2mWNTw1ikmjS59+OfIaAAN6Gm0qnHHKdlv/IsWy
         1WLA==
X-Forwarded-Encrypted: i=1; AJvYcCWoWheGBUxTAgPNuAYUTRWac/JqzYy2s3neYcEO0rGnmy3RZlSxOUh36t/o1SwpJwLomC/KgxqnRpaBuIcKNtDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3fKLsGgJrBha7XNBJEAQl2VK3KxzkkBWshzEc58hjJdZsNIZ5
	pURuf3/AjVtN6TjgPkw8zgjRUv9yMPQh8HlV7kWcx7cew7yvPmUHQb2GkRcm5bI=
X-Google-Smtp-Source: AGHT+IFFazcNX159kK7SKOq3ShS1WRwWJWRp6OZkagarAkcqWS51wR1mfV0IdI+S6h5u6ZnObCUCUQ==
X-Received: by 2002:a05:6512:6ca:b0:52e:f2a6:8e1a with SMTP id 2adb3069b0e04-53b23e1913amr2312323e87.29.1729835479883;
        Thu, 24 Oct 2024 22:51:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7aa8sm60541e87.187.2024.10.24.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 22:51:19 -0700 (PDT)
Date: Fri, 25 Oct 2024 08:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, angelogioacchino.delregno@collabora.com, 
	neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v8 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <jhykmuvgltvuqf74evvenbagmftam2gaeoknuq5msxop4mkh65@dya6vvqytfcx>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_225122_076903_51CDDBBE 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Oct 25, 2024 at 09:25:18AM +0530, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
> devices.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/

These tags are incorrect. Please read the text of the email that you've
got.

> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V8:
> 	- Remove DT_BIAS_PLL_NSS_NOC_CLK and P_BIAS_PLL_NSS_NOC_CLK
> 	  because these are not required

What was changed to overcome the LKP error?

> 
>  drivers/clk/qcom/Kconfig         |    7 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/nsscc-ipq9574.c | 3080 ++++++++++++++++++++++++++++++
>  3 files changed, 3088 insertions(+)
>  create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
> 
-- 
With best wishes
Dmitry

