Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D013E83844
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1C0IPnydug6rw3V3fM8YPHePn3LBKfIJJtqgR74b5I=; b=MwFLgWgQIbF+ft7JqSECPqHzmW
	nnaL4XO4gjmQCJFUYRDm9BLGWCL1p2cNJrGdSziuOY5g6jPY+QzMdxbbsxd8sqruOs3dQFB0gQq5Q
	POf99Niapwh0oCaEDjHNs65DVkARO4RYHi43m6C7IZT/kLJ8DWY8MwhIcVpm8Ljs5ZclC3skVtwEW
	UyeFugjPwgZxleNxbuX8inmKHwR0RIgD+6KwZYr8SM4x7nkzbNv48cgT7zR2txh7j3JH64Uu487Eg
	hiS4uN2WNNpaJSh94f9rVEAkzUkwH/P97yY/cWdhAAFKDKl1ZnM7L0b0K2yQ+P3k9FKX84+QjuvG0
	ISIeMz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKtr-00000008HoT-0jNw;
	Tue, 17 Feb 2026 13:13:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKtp-00000008Ho5-1mYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:13:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-65a36583ef9so7091228a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771334035; x=1771938835; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1C0IPnydug6rw3V3fM8YPHePn3LBKfIJJtqgR74b5I=;
        b=sfy3VEd5ZnHjeEPwRrT1M1b4RMMqqu8t+srjzwkqamH760FFhnVnTeQ+9NpA1ayzID
         Zc852FXjVybQSLjwTxMrbpz+tYo54GkKAuZROjwahgCt7yQ1K7y4s5plI5xFCwq+kZD2
         k8qLatnOhyDVqDxj5z+mEACI8UzB69ZMrRXN0Nm+K3RtseAIziOH3AVBF5yhY1RIOnzA
         GoeNCoEqIkxAJOsJOgav0i4Fmyc6oZ5pU4vJ4fMrYWkz5G1o26ZLPJje40KcvascWTZL
         4/1NmtFVU+xqUY7n+CT66y3TBB3EgFn3LiVjrvttTeomWDjvyjOQIqQD8gFyqqHg8Cli
         u9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771334035; x=1771938835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1C0IPnydug6rw3V3fM8YPHePn3LBKfIJJtqgR74b5I=;
        b=C7i/me0Cn1aavzkgnjNnhpvyqelg34O7M7db8It4B3iF5UjGuV8VnM/6g67+1i0C7V
         k3iL0+LyHFfVZ44zlo13WudREG9kpamSedjSGRsubf1NRzWLGnzgI+b+FEIoPyn3HgVW
         xq8TZFNVrJ8V8Ho9q0XiNQvQbXyYmMZM0ECz5of9ISnJH9DtXXQhkcP4pHh0FswCWmhB
         M35tzXxpqncn+wFmdZavKMZpBtsU5o0vON5v2HhNH+40t/LYDXStjeSYaoEpbRCaOtmT
         gHh1fBlbBWDD9+7E7b9mUa7Dfe+Z1kAI2ELPZgWh2FcZujOMwIWqYku9e7GcJhUJJ0Gx
         0A3A==
X-Forwarded-Encrypted: i=1; AJvYcCV0TW/L23ZJHCnrUy5UM50Ti5r41sDwhROTujVoHn48yY4nbqId5GdWXT6qh5aeNzi7bbiBgV9ocezanQ4D+hyR@lists.infradead.org
X-Gm-Message-State: AOJu0YzfwmZajOt8RD68UOlC2muOYNuGKqkzIX7CcxBR5yqjOySWdSkv
	NiyOxeaM0D+23ngNEnZio5gPuR5exub7ehNiy2dWziZojlTdk9LWi/L45+3t+0L/j0w=
X-Gm-Gg: AZuq6aILZr7qtTQD1SYZvtlhRpk/2kY2vdHUiHJFo9ZvrakCmDvbzARvOHD5BkbhcuO
	wqruYBFD2OeePsLOjU4Xuq/mySTLzgV5XDN4G+nB5XVxmltbvHsD8GnEU1DkX3uwF2E+bu+2vcH
	rKPMrMCawDYbYOJmjafQBQcUEhd19lzo1u3lPtUclqepaBP4Bp6T7krXgElVQz4ErZBCudcUCkm
	35kzEo3mMy4neo8GVqm+1ILS+AFhIJw1KJn63cPGfE8RmNLAG/Vybs5+fOB2C9sOtJljxGqKpi3
	2VLd+t2cHie4uErrx//VmAaybcKXtJsBN/ertblHANLrHokY6VIj134nf0jAER6hwq0fkADd+FP
	9CwkE7At18KUffwo9iScaZpzYmuCdLGcLTvi9LWp8UPdwnER8kR0l1uAtDAxUhvFp/ka425Eg6+
	QMIj1/700yP5ARc0h28wcskiDixWE=
X-Received: by 2002:aa7:d719:0:b0:641:88ff:10ad with SMTP id 4fb4d7f45d1cf-65bc4298c44mr4741148a12.14.1771334035506;
        Tue, 17 Feb 2026 05:13:55 -0800 (PST)
Received: from draszik.lan ([212.129.84.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4fa7c7sm2473768a12.31.2026.02.17.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:13:55 -0800 (PST)
Message-ID: <0b6e7cb7223e553d9b53df464959e97fd3d1ce43.camel@linaro.org>
Subject: Re: [PATCH v6 5/6] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Mark Brown	 <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Morton	
 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Tue, 17 Feb 2026 13:14:14 +0000
In-Reply-To: <20260214-max77759-charger-v6-5-28c09bda74b4@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
	 <20260214-max77759-charger-v6-5-28c09bda74b4@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_051357_511546_AA59375C 
X-CRM114-Status: GOOD (  22.58  )
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

Hi Amit,

All below comments are only minor, feel free to ignore them.

On Sat, 2026-02-14 at 03:12 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> Li+/LiPoly dual input switch mode charger. While the device can support
> USB & wireless charger inputs, this implementation only supports USB
> input. This implementation supports both buck and boost modes.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/power/supply/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/power/supply/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/power/supply/max77759_charger.c | 768 +++++++++++++++++++++=
+++++++++++
> =C2=A04 files changed, 786 insertions(+)

[...]

> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> new file mode 100644
> index 000000000000..d4e02764ba04
> --- /dev/null
> +++ b/drivers/power/supply/max77759_charger.c
> @@ -0,0 +1,768 @@

[...]

> +
> +/* USB input current limits (in uA) */
> +static const struct linear_range chgin_ilim_ranges[] =3D {
> +	LINEAR_RANGE(100000, 0x3, 0x7F, 25000),
> +};

Shouldn't this one also have a entry for 0x00...0x02:
	LINEAR_RANGE(100000, 0x0, 0x2, 0),

Then you can also drop the umax() call in get_input_current_limit().

Ah, I see now there is no linear_range_get_selector_within_array(),
meaning the code is fine as-is, unless you want to add that as
well :-)


[...]

> +static int max77759_charger_init(struct max77759_charger *chg)
> +{
> +	struct power_supply_battery_info *info;
> +	u32 regval, fast_chg_curr, fv;
> +	int ret;
> +
> +	ret =3D regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_00, &regval=
);
> +	if (ret)
> +		return ret;
> +
> +	chg->mode =3D FIELD_GET(MAX77759_CHGR_REG_CHG_CNFG_00_MODE, regval);
> +	ret =3D charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> +	if (ret)
> +		return ret;
> +
> +	if (power_supply_get_battery_info(chg->psy, &info)) {
> +		fv =3D CHG_FV_DEFAULT_MV;
> +		fast_chg_curr =3D CHG_CC_DEFAULT_UA;
> +	} else {
> +		fv =3D info->constant_charge_voltage_max_uv / 1000;
> +		fast_chg_curr =3D info->constant_charge_current_max_ua;
> +	}
> +
> +	ret =3D set_fast_charge_current_limit(chg, fast_chg_curr);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D set_float_voltage_limit(chg, fv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D unlock_prot_regs(chg, true);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable wireless charging input */
> +	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
> +				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
> +				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
> +	if (ret)
> +		return ret;
> +
> +	return unlock_prot_regs(chg, false);

Should early error returns here try to lock the protection again? Something
like:

+	ret =3D unlock_prot_regs(chg, true);
+	if (ret)
+		return ret;
+
+	/* Disable wireless charging input */
+	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
+				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
+	if (ret)
+		goto relock;
+
+	ret =3D regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
+				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
+	if (ret)
+		goto relock;
+
+	return unlock_prot_regs(chg, false);
+
+relock:
+	(void) unlock_prot_regs(chg, false);
+	return ret;

I guess if one of the regmap_update_bits() failed, then locking the
registers might not work either, so I have no strong opinion on
adding that.

With or without updates:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


Cheers,
Andre'

