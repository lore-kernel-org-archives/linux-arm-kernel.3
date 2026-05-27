Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3ECCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=; b=lSy46X43KroloYJKOoEHcqzpjI
	yuEvIuE7IVVlSa2XZxVMGTzqPYYS9bSS9+wFjsEVS/ufJfII3HHtvJUMlgnp/Cw+LMV5Fv+2n4Ia0
	R9rUkI7LBAPj+OfKNzgkp2OHGYitPqcpIPKkUtf1+ftm+isl7KluXpKMlYigZcGDWKNKR8nj/KujQ
	r4tnSUuP8SGSQKaTYvu00PRo0Psln6NaVCzw+/xSauCi3w6EW0udh1W+8sqohuaMANhLhA2XCjdpN
	x/5cUl7I1xfiBFJr9q14txAVQ113ETozEDND8yQ61aWRaG2k397n/4Qs2lTgY/qcIqkykZc7k4O3s
	KddMWtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8SU-00000003Rfq-01s7;
	Wed, 27 May 2026 07:13:42 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8SS-00000003RfT-0G9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:13:41 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c80227c9572so5126538a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 00:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866019; cv=none;
        d=google.com; s=arc-20240605;
        b=agJeV6aKtpBssrFZZil/JB1+xCNkauWVapa6AB9o+1Kv8cCWsTQgjW7rk1fhFDdfUg
         0v7bM0EN/oAGpToSs60Cd/BYWvC53emNjK3oF1/7ol+5xhZWrAEYoQsjXmKA8Fij0XNl
         ZYqwyaT2tmRwzvoCGKuBpIRKNA67Fz2OAdO2EsFPZz5uyR5I4rxF0gI2mulqgEje6ck7
         1MsvhY92X35h2tbSK2bhSGX6cYIDGPwEhWjnCBX132jM0z7EwSnhJT2ohRyDvnfoOdOj
         XbGcgkZQ+UoqCew1yZ++2wfl9VWQXfWFJ8Z8MSx+rzk2/E4LuRiXdm9k7hRi3MJFjwmZ
         Z9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        fh=0NI5XpO63/n+CGyStlGt1nZBNzKiGxNw/3wDzia9oQM=;
        b=hc18/mULxrGykb4gt8YQBaWhy9YY4njCHw5zDWiRTr4HIB3+A0Ih3GantNlXWJtais
         6cK00WbuodfnysT819dlpNpnxCGDseMa2Bm7n1OoRgsVGK1oASSLO/ehYWjqx5/T3Vfx
         pxL7IuH1Y3sl1eg/e7D16h8b8Xf3DFkg2dQ8WM/MqHWkc/X/EZkwkycgiKLoKqn831tS
         yPjd6k46XvKVC/+9Hn0nu8fQno4fcTLX9YRzFoh6ueaBfLgOofwssdig6pD+fquxiFrh
         2uvYFCzZ+VHc9hDcSie9unmVHk2ssuI5K01AfoeYM8epHAIAz88bneU7ss/kIeQzXQr7
         TCow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779866019; x=1780470819; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=SBTBJPnoqHv8pG5BatwSA3IlvVGK25KPGirBpHIekW5VjtKRRldUx391mlir67o52i
         L3eX0vMmtuPsB1UbBQud3DZP2eFVCyWUA74aDltYUw9A43NNRNhaBFupa0wqBXDCajSD
         I6uPhmSHgAUawDU564BkCs58BRLL5TdD63RmtCpx4yEcrJFtXjJGfo5lAGE7ujLObJXn
         eztOOlsh3gHxJg1ZUsQTXUvHHZfMtM2nxpApIFLZmBD09N/+1rchspiSDtU7HalpXdrU
         +xR2S70pIihqhkRaxWggwZYrf4rWTM8+Bn9TZIM1Ci4lEnKqmQwp376ejIDXgckA7Kou
         eb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866019; x=1780470819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=scXt5jn2SptmpZ1sY1qP9g3l/ApmBsb8hEHuHnvRE0PJgKyyaXhTQVPgnMYOM3ejmh
         wZKPtv3CSGmGtczZTVEj3pFkduvOTkwPxk5SRZ4WxqGz5N7anQ5iVHUa5l6Jddk2C0j5
         GHqaqMELBRaiboJI5MQ1i1JCbT47LKf4kaocOoUMhIzQMTuKooXNIJTFXGU81aiSz87g
         5m+vuBd0rt/B7RH/wguswrAlpaGbn46yiuZAQeoqm4V6oq1Lq4NZR647fcmln34hX4TO
         Gf8hLcNgMR4u6bB9aF+lBEjIemh/DlJx5V+4t+oVY781bSHgTBUcKPa/HEUatmfZKu07
         YFnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NDHE7hWfl4eU9iHMD7sPswy9IesQMpsN0NgDzE3amQoi+cjSaxGu/FB0hZWAJ87h6aZa9SkGSPlNDxH+aYDwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ/Iwe5WsMseGxORom3rGLYzOLDtT2JI7UriYDzQKuQXclfmG/
	WC0UW6KL8IwQjPv5cibFWFX0O2y8DXG8t9BPU+Z2omdwjTR2gF4tr2/e63EhLXaRS8MRBtVYtEW
	I/D757Jn+ZH7nF8Kra42nkUUaDeSB/v0=
X-Gm-Gg: Acq92OFXy14aM+Su0iwi9iuEFplwN/zM6yVDXrxL65MGQTRn1MQV1j4M8f8gjUhU0Oq
	BZaycWiNOMZMD40ceyYUSOOVgP33KmEsdQpnpW40cXu3a1FO7O36Wi8RFWbylGR0UgwPcK//TOt
	m61jl45l6Fg4s6syOcNe9WzBn/uXQIcZKo+8Fn/g9RpJotz8dbINbgaKxwPhH4kpfXOiA5WpJA2
	X+6y3QQFV/uVvCUpw+Q+ZNm0Dt4WgAeQRwqAM+md1NDa5BffXCoFsph+aDxri2cwE54FxY2wB5f
	7L0x6a76362wXAoSBVKyiL5etjDuTg3x9DGrvA==
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id
 d2e1a72fcca58-8415f580e40mr19675360b3a.8.1779866018607; Wed, 27 May 2026
 00:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
 <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com> <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
In-Reply-To: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 27 May 2026 14:13:27 +0700
X-Gm-Features: AVHnY4KYe_20mrf-YgFfeTtowuhQHlFA44ow40h-fRG4arohRfrD4-uu8diiShU
Message-ID: <CAABR9nFdvh9nfa03oxFLgD2WUj4LyHP8T77xKno9wjiQZ48h+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_001340_111654_52E51AF8 
X-CRM114-Status: GOOD (  14.35  )
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

Hi ,

I did some additional investigation into the regmap core functions
currently used by this driver, such as _regmap_update_bits():

https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L3249

and _regmap_read():
https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L2822

as well as the current sun4i_spdif_regmap_config definition:
https://elixir.bootlin.com/linux/v7.1-rc5/source/sound/soc/sunxi/sun4i-spdif.c#L526

Based on the current regmap core implementation, I think it might be
cleaner to leverage the existing regmap suspend protection mechanism:

if (map->cache_only)
return -EBUSY;

This would inherently prevent direct hardware register access and help
avoid potential crashes during suspend. To support this properly, we would
likely also need to enable a basic cache type (e.g. REGCACHE_FLAT) in
sun4i_spdif_regmap_config, since the driver currently
does not define a .cache_type.

A patch in this direction would look roughly like this:

static int sun4i_spdif_runtime_suspend(struct device *dev)
{
  struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

  clk_disable_unprepare(host->spdif_clk);
+regcache_cache_only(host->regmap, true);
 clk_disable_unprepare(host->apb_clk);

}

static int sun4i_spdif_runtime_resume(struct device *dev)
{
   struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

   clk_prepare_enable(host->apb_clk);
+ regcache_cache_only(host->regmap, false);

   clk_prepare_enable(host->spdif_clk);
}

This approach would not only address the current kcontrol-related issue,
but could also provide a more generic safeguard against other runtime
suspend race conditions that we may not have considered yet.

However, one downside is that this solution depends on the current internal
behavior of the regmap core. In addition, if this driver starts using
.volatile_reg in the future, the current regmap implementation may no
longer provide sufficient protection during suspend.

For example, in the first branch of _regmap_update_bits(),
volatile register accesses bypass the cache_only check entirely and can
still hit the hardware bus directly, which could still lead to system crashes.

Because of that, the explicit pm_runtime resume handling proposed
in the current patch may still be the more robust solution in the long term.

Given our previous discussion about making the pm_runtime handling
more consistent between I2S and SPDIF:

https://lore.kernel.org/all/CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com/

What are your thoughts on this direction?
Or would it be safer and simpler to keep the current patch as-is?

Best Regards,
Phuc

