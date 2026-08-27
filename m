Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8115C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWfd5/uJ5kBo6WJGlskG3tntoc37IMd3ji7UZYIgyR8=; b=JcJW2KOKdQ3fbV7ILIspdSqTWM
	i+iZBM96U61JWyiySn8fZOohtUaU6lh9zeiICnuqElpKYmqSZneicWFQlhMiOip/Hh19G3VZ02Fhq
	AopHzltXEcuGhqWxrWvgkV3DpFtMEyLMKD8oQcuNGqyLmG9JGSQHuXcJ4zmhXUjBI4roK2/xiPIUE
	g14mO0F369V1vG2+23POn6O7gmO2dVHEDgKG3Ly0K/r1IPQkPxTg+9Rb6gtDhDo0CZ3ex5jwVZwO2
	xWqwoZNy4uxu2Awi88Do36Sxvt9W76eLrZd9QK2mf8pKVfsPLqOqGhqbT9jdGtZNrPkaeaGIiv2hm
	QU2mOaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYa-0000000469y-2ao2;
	Thu, 27 Aug 2026 13:54:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYW-0000000468L-3WPQ;
	Thu, 27 Aug 2026 13:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rWfd5/uJ5kBo6WJGlskG3tntoc37IMd3ji7UZYIgyR8=; b=pXUzBDvEJRH2f1EWdSQVLIRPD0
	st02wJxpl1rJYqoYPw3CMLo+Fl6YPud3datM6GryS3PIFiX9JDkxm7vyVKCrzihH785halA13rKcE
	PTYnbuZIdWtycOfiSlFoqJS+OsCVWKQWD/2mXNbsJcnP900fCotQqRw78QseyYPdwLuCFLocWl9XR
	t1m/VMl8J2s7/pUoSzxMmYjM6TXt9Tj7awsN0vnz4ZBAphh1rBt8hAkjZ+g+SYyUumBnT1xHjSDIZ
	yip6AcM5B6C1XByK2mkGoM0Ihm1BVgPeT0j6RrYB7I4ZT/Wfyes2a/gKSVJUoEpmfRB19mCgE3WGz
	SEGjWgdA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Srinivas Kandagatla <srini@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Stefan Kerkmann <s.kerkmann@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] nvmem: rockchip-otp: convert to runtime PM
Date: Thu, 27 Aug 2026 15:54:06 +0200
Message-ID: <2048906.PYKUYFuaPT@phil>
In-Reply-To: <20260819-rockchip-nvmem-pmruntime-v1-1-01f1acf80dba@pengutronix.de>
References: <20260819-rockchip-nvmem-pmruntime-v1-1-01f1acf80dba@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_065412_918664_247109D7 
X-CRM114-Status: GOOD (  15.34  )
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

Am Mittwoch, 19. August 2026, 14:33:45 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sascha Hauer:
> From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
>=20
> The driver enables the OTP clocks inside rockchip_otp_read() and drops
> them again before returning, so the controller is only alive for the
> duration of a nvmem read issued by Linux.
>=20
> On RK3588 that is not sufficient. Part of the OTP array is readable only
> from the secure world, and OP-TEE reads it through this same controller.
> Its clocks are in the normal world's CRU and are plain gates, so an SMC
> into OP-TEE hits a clock-gated controller unless Linux turns them on
> first. OP-TEE cannot do that without a CRU driver of its own, which
> would put both worlds on the same gate registers.
>=20
> Move the clock handling into runtime PM callbacks. A consumer can then
> take a DL_FLAG_PM_RUNTIME device link on the OTP and hold a reference
> for as long as it needs the controller, without knowing anything about
> its clock list. DEFINE_RUNTIME_DEV_PM_OPS() supplies the system sleep
> callbacks too, so holding one does not keep the clocks on over suspend.
>=20
> Enabling the clocks is now the callbacks' job alone, hence the dependency
> on PM: with CONFIG_PM=3Dn they never run and a read would go out to a gat=
ed
> controller. Reads are otherwise unchanged.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> The driver enables the OTP clocks inside rockchip_otp_read() and drops
> them again before returning, so the controller is only alive for the
> duration of a nvmem read issued by Linux.

your commit message got duplicated here.


Heiko



