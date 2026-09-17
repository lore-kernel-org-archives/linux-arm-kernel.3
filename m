Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA9C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koYHEmHF992hOO59AVBGv9/ygNafcPNBRRwBEev9dCQ=; b=gs5UeYB0ow6eoXuBN2x4pZ746u
	sDT2GijGlLfhGHdqmh67aQmaTXH7ckyXIv8b3XJVLoFF1HAZtCPbJN8Ma/2oGy74xm29U93Ax5vg/
	Je4RSRTL1GNCW13lAa00cEjXHHwyG42BXPIE51B2qLNBCpv7/5fsoEJL9F34HULZzsJ326f5Rud08
	AuxmKxABQfFCtspCgSE/RgWGDv91zxRApeWmACi/ijmvLBc0rB+uFqySEjVxCF97qoQJ2+HXWgpCN
	jqQ+8OJhtMjbQzXRM8W74/BMJEi5QEngGmLW4B6V+VzRDp/kkgLtYmbKrWg8Uj87HwmbItqCQSldP
	/5Cdr80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GFP-0000000C8Cx-2xwC;
	Thu, 17 Sep 2026 17:50:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GFK-0000000C8BS-1nyw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:50:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB9E34E407BD;
	Thu, 17 Sep 2026 17:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69E0F60580;
	Thu, 17 Sep 2026 17:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43EE011C787D7;
	Thu, 17 Sep 2026 19:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789667399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=koYHEmHF992hOO59AVBGv9/ygNafcPNBRRwBEev9dCQ=;
	b=G4/CgNPzK5E12/9/EmIjENcc7TwannYkXgttdS+iILgEN7rNK/7/lxeRP4Rs239QsVgmen
	Rp3kNHvYHrs3mGRmJrvApN9xaKwcGKQuTpPWV6yz2JLBGdat02GKuHEFpEGQrQ747dGkU+
	MrXIpL/cxj/qtmOthtuu5m8HTGt7YKHhmsyZXx3xMQh/Z+CDaceLZMKhx9wW6l55R7Ma1m
	9QBma3nANPpD6Zct7/pj8wZZXCkxDgSTTzq2drihxjgANR+lqsFWiErbW2qWKmiX5ShCFX
	J1M84qWKPQFODr/Hpe24iPlkSckPc6Tzx+smdmz9A8gYEIG7KlS1SsWJnRGs5g==
Date: Thu, 17 Sep 2026 19:49:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: broonie@kernel.org, chleroy@kernel.org, leoyang.li@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, qiang.zhao@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: Fix clock leak in
 tsa_of_parse_tdms()
Message-ID: <20260917194953.69dfd873@bootlin.com>
In-Reply-To: <20260917152719.2160395-1-vulab@iscas.ac.cn>
References: <20260917152719.2160395-1-vulab@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_105006_607852_DDFACD81 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Wentao,

On Thu, 17 Sep 2026 15:27:19 +0000
Wentao Liang <vulab@iscas.ac.cn> wrote:

> The error cleanup loop puts l1rsync_clk and l1rclk_clk a second time
> and never puts l1tsync_clk or l1tclk_clk, because the branches that
> guard the transmit clocks use the receive clock field names.
> 
> Use the matching field in each branch so every clock acquired by
> tsa_of_parse_tdms() is released exactly once.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/fsl/qe/tsa.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 4a88e54d25b9..94691369353e 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -865,12 +865,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  			clk_put(tsa->tdm[i].l1rclk_clk);
>  		}
>  		if (tsa->tdm[i].l1tsync_clk) {
> -			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> -			clk_put(tsa->tdm[i].l1rsync_clk);
> +			clk_disable_unprepare(tsa->tdm[i].l1tsync_clk);
> +			clk_put(tsa->tdm[i].l1tsync_clk);
>  		}
>  		if (tsa->tdm[i].l1tclk_clk) {
> -			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> -			clk_put(tsa->tdm[i].l1rclk_clk);
> +			clk_disable_unprepare(tsa->tdm[i].l1tclk_clk);
> +			clk_put(tsa->tdm[i].l1tclk_clk);
>  		}
>  	}
>  	return ret;

Indeed, good catch!

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

