Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF27BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dL1eE0VeQ6RX56/vTEplkGyZPr7ujtJbDYmCsYxRsck=; b=03HNIKH0la9JPg+t+i077rLUlL
	CtwMk5s6DbBhs9HvklrQ29IY9vu6DvsPNFrfAqnjPjaob9wPJIkrV6aLP3msU3XPEwAH1xtZiRzgN
	OE5AuQ5D05zWTNPN58S0QYRsv4UpLNxwEmgENzd7o3CJr47+ZfckDvUNSU4E7kMUM0H92clNWW/Yz
	6ME3MT7+uAELbArPY08Uac6n69z/4rOBwnM8ob9GNJBAXkMcnP53udUQJk6k84tzFyuiToKqYaVTk
	6lLCgWY5E6tadgWxZy3/6RsAVUoG4F9xPkZEyVJw0/Z+UISdKSAMFrCGYCq59GLImMc9gwfBC4jZ0
	F263Bp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp10-00000007vfS-1t5p;
	Fri, 15 May 2026 09:39:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp0x-00000007veq-1Mvv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6DD2574;
	Fri, 15 May 2026 02:39:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC58C3F85F;
	Fri, 15 May 2026 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778837966; bh=gxim6n3t6lP3FJL59f365NZqsWpGkWhc54Sb3o0mqT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmxLxHk4d3zSeM7DxoshkdCdne64FeYOu8SJfgbASHbVH9QahB+4TXQOs6Z3fZG64
	 R8cMu9t5xwdF3dgwG+h19scK+hTkw/XQ399LlIuibkMRkzHXpqCKJ05tTSnYiVyOoB
	 fVuGy0b3LeEFV46vPzzh/W8DBMYeBjvY5r3fzf3g=
Date: Fri, 15 May 2026 10:39:23 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <20260515093923.GJ34802@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-10-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-10-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023927_428785_7F2E6F20 
X-CRM114-Status: GOOD (  11.57  )
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

On Wed, Apr 22, 2026 at 02:21:59PM +0100, Yeoreum Yun wrote:

[...]

> @@ -895,6 +895,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			 * Missing BB support could cause silent decode errors
>  			 * so fail to open if it's not supported.
>  			 */
> +			if (cfg_hash)
> +				cscfg_csdev_disable_active_config(csdev);

I prefer do a bit refactoring for this.

we just save cfg_hash and cfg_preset into drvdata in
etm4_parse_event_config():

  drvdata->cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
  if (drvdata->cfg_hash)
        drvdata->preset = ATTR_CFG_GET_FLD(attr, preset);

Then create two helpers:

  etm4_cscfg_enable(csdev) {
    struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);

    return cscfg_csdev_enable_active_config(csdev, drvdata->cfg_hash,
                                            drvdata->preset);
  }

  etm4_cscfg_disable(csdev) {
    cscfg_csdev_disable_active_config(csdev);
  }

These helpers will be used by etm4_{enable|disable}_perf()
and etm4_{enable|disable}_sysfs(). This might benefit the future cscfg
refactoring.

Thanks,
Leo

P.s. I will stop review at here. I assume ETMv3 changes just mirror
ETMv4's. So all ETMv4's comments would apply on ETMv3 patches. If I
miss anything, please let me know.

