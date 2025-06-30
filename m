Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62F0C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMhrsG/YsbxMt+IC5JLuz7E1CuFXsvedzQusYHZo2XA=; b=hj46EajKztDi+ySmNicSVo+qK/
	7ND/K/qXbAORitk6P3ha3t6xdSu9/UyFXVbNHqWjGJxA9H7fjfG3hrrZgUpJYtMaHBLSm/Fm/0HSA
	tgz43AamIJvF+mQZTf/deYW7L8X0b92ugxLDiASRaCrINPJK6s+P6DlEn+vzlwiY1M1m8nWwh5FYC
	hHaCkm6861mGEEQOvegs6YqAZqVXavlvocLNoBMAjE1lZs5c8P6W0DWjgv8LhDgvfLfX7/hVZaw0O
	TC8SarlXf0MTomXQ0trtXK+WPDC1iujEdY42KRRZAGEgY9narUGp08Re31muk+gSRZ5sIv8ncuY1H
	TJDO3c/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDUM-00000002A4j-1E7l;
	Mon, 30 Jun 2025 12:19:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWD0o-000000025vt-32Ui;
	Mon, 30 Jun 2025 11:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PMhrsG/YsbxMt+IC5JLuz7E1CuFXsvedzQusYHZo2XA=; b=wYg2ujN0VisunfydIG9JuMA9QI
	jdxztCi+DTaQU7FBDGPgS0kip8gNcT6a/gOwmcq5E1PAzjNFcIIn6d+qGiEZ0hAI9VD//7WW69AP2
	P4+bxHVVS745eHOcDNiFgRv6mxEeOulfZ/U28poZdbApyEwvEtFTx93/iVnS0Hov49LycPdIYLcEM
	ndYLhkVqmsHVUz+XXBN2dk26TCOndtadsuCRQdSklXLGKfomBf/BQIrUwCRB3uFeKb3WfcEjyFzPn
	1CEtWLMgqyf5QcnwSp/pMlbeA/Ldz+SS+DclVI2tikLDQW8c8pYDrGq6+u5IY1pMuefaBhoR0gVeH
	OvRQGCvA==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWD0k-00006g-14; Mon, 30 Jun 2025 13:49:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/4] Input: adc-keys - support types that aren't just keyboard
 keys
Date: Mon, 30 Jun 2025 13:49:21 +0200
Message-ID: <10163666.lvqk35OSZv@diego>
In-Reply-To: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_044926_760958_56E3973B 
X-CRM114-Status: GOOD (  18.63  )
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

Am Montag, 30. Juni 2025, 12:19:25 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> Instead of doing something like what gpio-keys is doing, adc-keys
> hardcodes that all keycodes must be of type EV_KEY.
>=20
> This limits the usefulness of adc-keys, and overcomplicates the code
> with manual bit-setting logic.
>=20
> Instead, refactor the code to read the linux,input-type fwnode property,
> and get rid of the custom bit setting logic, replacing it with
> input_set_capability instead. input_report_key is replaced with
> input_event, which allows us to explicitly pass the type.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/a=
dc-keys.c
> index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b=
1e0098cd1f6a3cd 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -19,12 +19,14 @@
>  struct adc_keys_button {
>  	u32 voltage;
>  	u32 keycode;

nit: consistency ... the above is still "keycode"
Naming things "code" like in gpio-keys might make sense maybe?
Though I guess, it could also just be needless churn

> +	u32 type;
>  };
> =20
>  struct adc_keys_state {
>  	struct iio_channel *channel;
>  	u32 num_keys;
>  	u32 last_key;

^^ same

I'v checked that the function transistions=20
=2D __set_bit -> input_set_capability
=2D input_report_key -> input_event

do the right thing,

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




