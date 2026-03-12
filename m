Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCC106ACEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=; b=idZNywZ/K1dESwJ0eKH64TC6Dm
	fYb1zQSCvT6gSRL2Snj4N5KmKnCLptAASQ0hNyhPwBTuZDjWHqaWap3y0XkKNoMjF08RkNzGxIpVb
	V8urQB6mvU2ZfbW2FQVzuhGMp1ybOr2neurCsCnWa0Oz7wHoTldHr1obm49t78kus/uUk7M1E6ibI
	CbBcKyvA/bEOYFUCu7oUmyq5xPHlBA8Dvd6TTrRmIR11a0hf1uu1iIp7j8knpH6fE+q33bKCv253l
	CddYp+gRF6P/tk3sJ+MEJvledFxB9iUS6FSq+aeGet+e7YazP7nzymFlBoazHDh01ZTLL/wEZH8rA
	WmTsdyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJV-0000000FDZO-35Am;
	Thu, 12 Mar 2026 20:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJP-0000000FDVv-3QdX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 20:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=; b=JYrkvrboYuyZOqnpJIQ10JXEsI
	rURy81qmCWESpqQwUmggMwMd6jy6mcMBA+CpeG1cdCNU4+gzyWUt+t0CHI0As9jMQkRJ9kpEBzR9U
	CefAzbf9+4Fxerq6dsDmmZ951MEZiUAZshRiQoK1KXD3VK4xEwPj42Ar++RdPJPRLOuFr7mjPtZgU
	CvR2Ft0NQ8JZrJFb51AJcG/CX83bIxswrcXZhOdkRtwQi4gUBpD9Z0NhFwQO7gg8MHvr3x48VCZLT
	MTO+3W/LgOiNqAayaNJ9+Yq25u6nxgwd0KNfmLELrdQ2EulHRSTTa594zGWr2rTdECEzRgwo1fyHg
	faqGxC2w==;
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJM-00000001xjh-0xdA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:14 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-40ee9b945d5so948183fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346030; x=1773950830; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=;
        b=l6UUQJMS57KqszHkoHD+Ur5FeEcQH9bKaazyrdYr5Jj25Oe5Vvgj2TxXDhdfTqLZzE
         nAa1jhFqIVWPnlOiYG+k7PjYc0+2+Op1HESRqZeVFeGTLPE3ChwG+3ElD1+X+Hra7oLT
         eELMEKwB6mdTLUdKcZP5sqy5VPUnsy4zLjMDSAPWFvFZ/dTeyByDRmqBaoUk7LoT5TbQ
         hHIf5oAj4b4qDHhfqBX7IEJRJ88nM8kZMY+H44FCM3OXy1PWqCZ1Vu8btNFstYnTDKpr
         CyWn2qErPTiXRwXv40UstwQbdgYAGqOxE1MOBoaUTH2Tf7AZmd8z3IXz6ppnfNtCTP88
         AALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346030; x=1773950830;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=;
        b=bpO0Ysk7mtNag+deg/97aWt55mmUsSGG58BhleMV3+pyr/FZyBps+W27uimycrlVGo
         FZysFeVgxy0mOsdrB7lIR3B+vD30XqM77vXWsnsHYM6kbnDHIO1/ICiI/lGq6ziV/X4c
         zGHzGt7z/DIJBxMtj5kIuSp1k+o4Frb5uAeOizQ6+yxMtSrI/oCEgiLxPWKFqZeLigwZ
         75X2BObbB7GhPpk1gg2X3x/0bAll+MJQGmd1ckyOuEN+OAuqqmUmKvoaaySwYcrehbJZ
         WpiLiisZcfTq3e2rErg04DteEWtqLeecvkw3lLkFtIqjV2M0/Ov7kv4W+QyXb/U3sIjQ
         M2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUt3uXj/qsEkM3dOF1uWCPORKE0DHwylEVYIK4KaVrTMWVNHGEDN4uaZoec4dSyx28qbMfjq6yhAD8aWqzEIn7W@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxpJHIGCe1eEf9P9k1NnpU5CLw/SZkTndrHUiUXprs7H0ud4H
	ymj3XIHFF2hVSNAocC7fr1QF0SBIo4jrebcIGZp2ceGb17JdLNfq9o2tB/y4dIERqxQ=
X-Gm-Gg: ATEYQzzl8CWHSTawswSQ4Ir1KS0eoADwVkMbtpBxAxhLCwQ386t2s3fxSIalolnmxXP
	icLOcKUzutGUkJrqurSzpoNEkhTBGd6RWljqRqGtY/0bWsvpqAauGJLjrLorQxjJ7XqDZ7oc46I
	3urJk+4xHFVeF+heuyylGodxEyhs/+cr0QUQHAANA2UwMqO/SBM6bDPHeqBzfz+Hp9O/LiHU+WZ
	gM1KfIUikyIkgNUbMW2fOvYUXa9fv78TBT3okYdLTpQDqseb5ReP2hY7Ez8gml+pTeOJbtphPjs
	KhaRz0Hsi9qa6cnsmEzlQRn8+a/ZEhAddXIyA+HvZL+NuzRznLUzT/BJdNswIOF022HdPBm8WvI
	9AqjH7ONTIH7D/8efzw3InNCsQQ6A9gSQXrqCqV1UYEa1V4A60fA7I92W+t3GUjM/3gtEyczfjX
	G56+PwRGR2dgmTEE97xGI8EZRbozgE
X-Received: by 2002:a05:6870:a796:b0:3e8:8b6f:9d85 with SMTP id 586e51a60fabf-417b937d46cmr332682fac.29.1773346030308;
        Thu, 12 Mar 2026 13:07:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:09 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/18] clk: mediatek: Add MT8189 apmixedsys clock
 support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-4-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-4-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.495599695131479130@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=mkPn6azSc5sBdNjIBFEPFL6chM6v748TKJtFgSgI6eQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzdMiMJbTxqXDno8lz7uKeJqq/XgEtUTcoAy
 ZhkKwBwxnOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc3QAKCRDCzCAB/wGP
 wFqcB/48FpvKpV3InEamRZjYBZWJ6fLi/SAwUkbGJyUmItM/vnWwftYkuxXm1sC369JhkJ6LTZ6
 YfgivaaIA/87e8AwAr90CJKmSjB91XqNMT4+0k8RYkN+77VvJcZ2apyV/geYv8E1R7u7nT8gr0m
 fsxRyDy7ZrMFdpc8ENod3K9Tt/ord3fYSSeyUQBCbbZUha8Gsrh4ptu2rpCErKtQ6Vigzdjiw1z
 o+eTFnGlkzvD7rcJLxm1Qp8UAeRgvqtYIFmydhZNYocG71l1fIEkKe+XDpvnBMkYyj3dW1+mP+Z
 1SKiymojf8wZ+PdFx4HI3agvkAyfo/sl9yqVkSAZvBJAm859
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_200712_368946_6B030070 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, 09 Mar 2026 20:04:45 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 

...

> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	int r;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	const u8 *fhctl_node = "mediatek,mt8189-fhctl";
> +
> +	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> +
> +	r = mtk_clk_register_pllfhs(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmixed_plls),
> +				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
> +	if (r)
> +		goto free_apmixed_data;
> +
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return 0;
> +
> +unregister_plls:
> +	mtk_clk_unregister_plls(apmixed_plls, ARRAY_SIZE(apmixed_plls),

Should this be mtk_clk_unregister_pllfhs()?

> +				clk_data);
> +free_apmixed_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
> +
> +static void clk_mt8189_apmixed_remove(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_pllfhs(apmixed_plls, ARRAY_SIZE(apmixed_plls), pllfhs,
> +				  ARRAY_SIZE(pllfhs), clk_data);
> +	mtk_free_clk_data(clk_data);
> +}
> +

-- 
David Lechner <dlechner@baylibre.com>

