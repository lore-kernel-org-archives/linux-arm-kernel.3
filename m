Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DECFC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHucvjkkK7SqSpK12zGxOb9Q94mZFL4sT/c2rekjY3c=; b=n0S/0Kntcd0cDTGcBubxgUOQai
	k3ccUQvCE1xWLVWznA5Lw4VJDpKQu2pKoOvnOG86Asvk5GFK6x+ZZzAPW+/AAuZLHKpg3STH2hMc5
	k1cZa+PncuJ1XLf+X6DnqfKNuL2x3CdRfa3MUulEWxg9kxDVsCMUlPjirXjTzyd+ZK+5mqWn+LIQ8
	2sytd6eQsR3/f/JOB0xpOh+KxzabYAOWueqvIhMvGmSuo+W3Apr7J4omPF0MGhOzxZ06r2oUU9u51
	Q+UkDp7xgIgcW5N/Kw/OVF1yAIOvzpyOKdUR2qKmYOiMUaRdRgbSDfbw/Ay7uUTQqsicVgaPe/d0J
	PWsRJqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTZZ-000000053p9-1y1z;
	Tue, 04 Mar 2025 14:48:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTXz-000000053Ua-21hp;
	Tue, 04 Mar 2025 14:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 443FDA456BA;
	Tue,  4 Mar 2025 14:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD0DC4CEE7;
	Tue,  4 Mar 2025 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741099621;
	bh=rI+BVkT7Y2vGYeVP6jOXfszRKe3HLug8swUeKiDdZ2A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H9bOT7G9DGWcpw9B82UNVqOf3fzPTab4W0+jJ11PCHXDgeuFvcudBecTiFLVBdZni
	 rHV7ZvwklvbtY6HBm8LSSkfOLRcfQLIceMTB5paPOXFK48evlciiUrcYu6nprTwyPY
	 +cT6mt0pPjZ+2yVUVA9dp0j1YqRk+J7pbXrDFtgWx4i+GoB450j/vGRLT1e5Cf5Fxe
	 K5zerKk94DFg+qJmXED0I/o3HBH5JDwVz5lSanRZXZ4Svk+RGsDIU4SKzxbzyQUYO6
	 iU7/u7PGrSj3G8Dg6UGvRHpUaGHQZYzP3WfZhI1VQyyxX7+oHpWMghaIMllEj3dJfR
	 vUI1FW/rIRHmA==
Date: Tue, 4 Mar 2025 14:46:48 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] iio: adc: rockchip_saradc: Add support for RK3528
Message-ID: <20250304144648.29f376f9@jic23-huawei>
In-Reply-To: <11022969.nUPlyArG6x@diego>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
	<20250227184058.2964204-3-jonas@kwiboo.se>
	<11022969.nUPlyArG6x@diego>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_064703_582621_794FD0AB 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, 04 Mar 2025 12:51:47 +0100
Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Am Donnerstag, 27. Februar 2025, 19:40:51 MEZ schrieb Jonas Karlman:
> > The Successive Approximation ADC (SARADC) in RK3528 uses the v2
> > controller and support:
> > - 10-bit resolution
> > - Up to 1MS/s sampling rate
> > - 4 single-ended input channels
> > - Current consumption: 0.5mA @ 1MS/s
> >=20
> > Add support for the 4 channels of 10-bit resolution supported by SARADC
> > in RK3528.
> >=20
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se> =20
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
>=20
Not sure why but I can't reply to cover letter.  Anyhow, replying here
instead.  Applied patches 1-2 to iio.git / togreg which I'll push out
a testing for 0-day to poke at it.

Thanks,

Jonathan

>=20


