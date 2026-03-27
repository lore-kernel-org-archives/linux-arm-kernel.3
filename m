Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD2410A88E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87Ga0haLfcxZZlYoUqObUgwz0A9gti5bOcF2f2CvlQ0=; b=V9Ywk4A9YId1dM1TKT+ISJcHPX
	RaCMomRpSNgdTHGkpGo2GcULhbhRZqme7kOySgDFlz5OOd+oPRXeUhvcQD+45XbIF+C4Sjzuv6JdD
	b2fbNBNUyKWtZmbltxU95yqHjuBZcywtFIXJc1KuSWU5VlQGENigi2OnruokLUp6rCS0cv9SugtKS
	uTiKKKG9KK4+wtxUGvxSiuLC/8YJaheI/1Nhny9DimIOUmQlA+aUUHI5zsi3r4Kn7TN0yEyw+3UlB
	9As6stfHFPmW/0fDRrDltQZz7DvMSvjV58/4t6cHqDQV4H1RQjHIrByDLg3QjNNYkOcnFzTcLBgtR
	Qo9ZEsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67vz-00000007Zlx-1Tcz;
	Fri, 27 Mar 2026 14:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67vy-00000007Zlo-0jXp;
	Fri, 27 Mar 2026 14:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 324E0600AC;
	Fri, 27 Mar 2026 14:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F51C19423;
	Fri, 27 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620788;
	bh=5mcg1waPoO21wSoUWMynxOB1O+1L/amm4zTHgrcVfQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGhTJMkh9Bq+k5+k40xOk3NeFoqbDJo/I30Evnz/mWtxMt3VlEaMpsrG2kVcpdgrx
	 mgjY1TYRrpGs2SUriLWnErf0NxHX8J2s+1TSggVuTcFCCgbA+9gAMwMXKy2ajtAMVW
	 psCh8SPtq/sUPrkouY9yCGB+s+hk2IhEG5HgBbqETSvuCuu0EuF+zSrp53uGd11Q27
	 ogRz6OwWmBEV+dXlrLobzC+68g3q5g7OjKiPGOXUEq7prS6Bfk618AyepMokewo6Me
	 GG4wbsShy/h72C9j7E4znJeCSxVjxYz3Q/GUMkg7sVq5LiOrhOWV72tFYFMAPsPCMu
	 Wd+VaI4cDgegA==
Date: Fri, 27 Mar 2026 15:13:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH v2] i2c: rk3x: add support for SCL OE debounce and slave
 hold recovery
Message-ID: <acaO5ouMmGA8-tqJ@zenone.zhora.eu>
References: <20260321105146.7419-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321105146.7419-1-linux.amoon@gmail.com>
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

Hi Anand,

...

> @@ -1125,6 +1141,17 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
>  		}
>  	}
>  
> +	/*
> +	 * If a timeout occurred and the slave is holding SCL,
> +	 * re-apply the timings/dividers to attempt recovery.
> +	 */
> +	if (ret == -ETIMEDOUT && i2c->soc_data->has_scl_oe_debounce) {
> +		if (ipd & REG_INT_SLV_HDSCL) {
> +			dev_err(i2c->dev, "SCL hold by slave detected, resetting timings.\n");
> +			rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));

argh! this nests i2c->lock. rk3x_i2c_xfer_common() already holds
it when calling rk3x_i2c_adapt_div().
Andi

> +		}
> +	}
> +

