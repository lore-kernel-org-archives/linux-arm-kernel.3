Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D1AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh7r+wBULLX7xOhkCrEp64UsGuqdkH4pf7taI2bfz/Y=; b=oJ54b01Yb71iziPAUTqecC44Sh
	I0O4GKOCeLGCl6XV4TdwjpVfSyVSxRtLPuL6yvLZ9bE3ny1N5EtPzmgAWaSOAm6sp7Pwpz2K/9noK
	WLLahbfaF2mj/e7KE80+/rGa31IQqLE9ksHkJk2UIpkiJ9THC8tTx4bepjxm1BON/ucbkhGh63deC
	HgCUYT8auND+OlL30eqGqz4mCTGP6uoeJV/d8Ya7AtGAdtDHxYiKU48/q4EGN6+E27Nziyaf2jE1h
	xBJ2zlyS1sfkqGRziWaySbCHYBAV9ghdUKi0KVPuJ/1IcznWE4VYJ/4i6mmzifgrbzcFAewcFlwhP
	8J5BfnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m9r-00000003XFr-2DIn;
	Mon, 21 Sep 2026 22:06:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m9m-00000003XEd-1M7h;
	Mon, 21 Sep 2026 22:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Xh7r+wBULLX7xOhkCrEp64UsGuqdkH4pf7taI2bfz/Y=; b=VdwN1/m6cob8uyb69bcrs6kzSx
	wtZUqa2i/g68w6+aAstSNytJPJAdb7p0plB3mUGSxy1VC/EHfNYwPRyrZz8tiSDF1anBMUg7gK6rU
	eQC9D04+lNHkSnHgdukiwNCNsh6MSaUxYoATm8yDqOfGvbbi0V+WgZQImmgt9bArxhDuBZEaWhj7c
	xHLDzjwwbJGJ/pM0PyQX75uvDyz/O1A8n2E8GYOXOv5ZfHn9Z00J6AGt7DHP+YSCA3KUqgEzYDLnK
	EuCneA+xU2pEcqJX7T4gH5Qqo/H26phoAVxLkUy4Gsmj2RFiVxQ/hSIlSwLVSOTfYjm57u1SHLhSL
	t0eaVU+Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v13 09/14] pmdomain: rockchip: add optional per-domain power-on
 settle delay
Date: Tue, 22 Sep 2026 00:06:12 +0200
Message-ID: <15844283.tv2OnDr8pf@phil>
In-Reply-To: <20260915104328.45901-10-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
 <20260915104328.45901-10-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150638_392523_E10EF74E 
X-CRM114-Status: GOOD (  11.09  )
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

Hi,

Am Dienstag, 15. September 2026, 12:43:23 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Jiaxing Hu:
> The RK3576 NPU domains need a short settle time after the idle request is
> released before the registers behind the domain answer. Without it the QoS
> writes that rockchip_pmu_restore_qos() issues land while the domain is
> still coming up, and the NPU throws an async SError on the first cold
> power-on.

are you really really sure, this is the fault of the domain itself?

The regulator also can just need a longer time to bring up the power.
Looking at [0], it seems I actually encountered the same thing back
on the RK3588.

Only difference is, on RK3588 a fan5355-type regulator normally does
provide the npu supply, while on your board it comes from the main pmic.

Can you please try the following:
=2D set your power-domain regulator to always-on in the DT (so it stays
  on even when the domain gets turned off)
=2D try to reproduce your SError issue and see if it still appears


And for the other case, look through the pmic datasheet to find the
enable-time values and do something similar for the RK806.


Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D8acfb165a492251a08a22a4fa6497a131e8c2609




