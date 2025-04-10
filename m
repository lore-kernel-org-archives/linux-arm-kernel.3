Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7E6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsIoItJM0HwQ9fBVqxsmnrWZuVCKfVvwTd3ZZORqtIc=; b=e+Bpb2OM+OwI3sUU0fOK+OWbSI
	omTw1sPwyVIZEIuMgLT9Oq0gRnAcFO1C3V73C6iAjXVXdFHdaCD9Qk5qUWIq0mUp89jk+Zt3tM+qg
	Qx2zPcnYfPAdbFCbZ/ykTtRHV3Jew497O7LrmiHTVOy5KE5dWHHI9ROTTSlhDw8mDUmFnt8OFbNFI
	Fh4qo4qvuVVlD2B5Vdtnq2LG2Zw/4SJO+HL6mI7VZuYDUb02QJ9KZcJBrtfzal2yKpW6UBt9p9EZE
	TH4Z53z2/i+VN/q2FxjPfqp0ULElvpZIEAMeD3xJneF+6PmDokmyzrElNaHyV7IjOFvfYBc3xz7S7
	sX7DFtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rTM-0000000AaQS-3Dc3;
	Thu, 10 Apr 2025 12:57:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rKn-0000000AZ0F-0IJt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:48:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKe-00088G-VA; Thu, 10 Apr 2025 14:48:36 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKe-004Gv3-2S;
	Thu, 10 Apr 2025 14:48:36 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKe-00095Z-2B;
	Thu, 10 Apr 2025 14:48:36 +0200
Message-ID: <a0f9115f66ff2993ff8dcce768a071dccb011579.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Apr 2025 14:48:36 +0200
In-Reply-To: <20250410-b4-upstream_ospi_reset_update-v1-1-74126a8ceb9c@foss.st.com>
References: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
	 <20250410-b4-upstream_ospi_reset_update-v1-1-74126a8ceb9c@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_054845_132165_E0BB44F2 
X-CRM114-Status: GOOD (  12.50  )
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

On Do, 2025-04-10 at 14:23 +0200, Patrice Chotard wrote:
> Add the released variant of devm_reset_control_array_get_exclusive().
> Needed by spi-smt32-ospi driver as same reset line is ulso used by
> stm32-omm driver.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  include/linux/reset.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 2986ced69a026947c8aafa89cdddf1e4088caef7..840d75d172f6239540bd12ab7=
01103b7f02a624b 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -1004,6 +1004,12 @@ devm_reset_control_array_get_exclusive(struct devi=
ce *dev)
>  	return devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);
>  }
> =20
> +static inline struct reset_control *
> +devm_reset_control_array_get_exclusive_released(struct device *dev)
> +{
> +	return devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE_RELEAS=
ED);
> +}

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

But this might not even be necessary, see next patch.

regards
Philipp

