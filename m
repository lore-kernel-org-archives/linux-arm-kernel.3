Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66DD25050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlsv0VCIHIiHd0/nEHHL3lk5SEgEXeB9EowWFMHqs2o=; b=tQKOfZ4hx0YcwfrJxVuXhLyTDp
	wMsC8iUZSRf5MrMoms0PwT7zt1qzY9SNbjd5v/2OGJCgUSJzLuPZQCVLZIfNahtWekQSo98KXeAz1
	AzTmdIXF38nGwra+mcXg6FvZ91gve9l8n54nIUSGKpXD6MKrEZxsO4tSY7er6kc7T29JW5N2B4iWW
	doevhQ/NrM+LSmwA3P3lrzB0Yk47eR7n8/TdIk46IggJdmuIpgjnWOHVUN/DnESGW6GoahN09XSpI
	ZLSsoPQBCW6tB6ixdfHOodp+LxU1/pC6DMrxyXvjOIgyHJWYewZMBAE//K9EsE24x5s5w0NhtpjJY
	fdZHVuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDRN-000000050TE-3gOk;
	Mon, 12 Jan 2026 08:38:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDRL-000000050Se-1Zoj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:38:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59b786b2a5dso4694221e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768207097; x=1768811897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlsv0VCIHIiHd0/nEHHL3lk5SEgEXeB9EowWFMHqs2o=;
        b=XSqr/1guvdzjTUYNoTD5EdyP7yXQ61XkUdvlcmkwry8jYvkp3HAyiTAtxX+DG0jr5s
         43sfurq27eAdNELeJ6dCGN89JHLvum4SBwJHk+1DEkS7XyLb8vnLx6aa5ilosVJAUms+
         r4Wr5eKh1vkPPU5mv9SiN6J5a/F9tfKqUemg7ELskMFdU8GCdHkMm3xWnX17Dp73fRlw
         VlYck5GboVoOJgoShmrCeT7BT/n3itjRQmKQKVGxMIc/xVWzL0R7JFGMdAuDNmXsLtfd
         4ry4qEmXH/XSbbMj45+4/r0Jq+UvHXkXeU8A4OlVhf/5dK0yGqZSQycs3s3aeg7teG+m
         gVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207097; x=1768811897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wlsv0VCIHIiHd0/nEHHL3lk5SEgEXeB9EowWFMHqs2o=;
        b=K9yho7lXgrOPZQecr3Yx6YZEo6/ogSy01cg53Fu5yciTopzqVgKHf4CYAMpNS6ClUd
         z9uL4ulYHZud3CLMWbW6TRKYoVNTQsyPjeSz+5OzkVQdkL2v5QihvioIqAtKmBdo23oy
         VgGPYmzoED9Pvg2hQND7ZJRwLfXb5wenINOCULh8DtBuPdxlLpb0aRk9F2Bnx4EsyR+A
         8LhGZHtMk1JNYxz3e3DRp7t/u0mepDObTCF30l8sZ/DZDxaQO9igp17upgqD4kOU4Wdo
         CX6zNbByBhz9ETmAg7XNa+yw5929hQcWqr/hZoCJBj8gKBx78tUmoytpXj/lOTb0kWmM
         TKPg==
X-Forwarded-Encrypted: i=1; AJvYcCWYKkA9MyEjmPtuhITexrd/ynSdvtBKnXnXrORtAPiEUCK8L8jZ2AhS+kIQzJSPPQCAPyJ0mm1yCYwKhQTK+OZw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe2ZnYsGNSWPHKDdtVAyY7hwkBc4zEGnyecTsfwbS8cHouEnOu
	OddKVYcaWbBkszY0/GFzrTlGnkEug/8nVs/QvpUGM/at3FtJrkUnxDBvaiGZqQ==
X-Gm-Gg: AY/fxX5WMonnNd71iubSRh+qa9xOTIOBGo9CkoD3tZtvIELjLiIi1tw6eawQOB/lgik
	yX7MjaDuirljd2Gk2eW+8w1d7DUJXuwPkaDDvxo8jbP32wfwAj7Cb4NNRAwHoyBE+gD/PpsNd5u
	4qnCgRlCSMLwr/u9TojXhmRzweTZvnVPwWXn/lX9qiB7IAwj+k8tNvEDcvhGdgo1+7F6ku2lIrN
	mBFe8tf617pmT6ebd9GkKPBLlBdO4zomKJEtyGz4mlel2EoLtxREa15eTbY/msxJfA+QUyyTylg
	4NE73Qry3+jQgybLtW7ytnhLgP36QkeobwPiPCER42TQ0MpjKQPRxz6ueSa6ErPRKXMbeCQpjT2
	8SWXB5z/UUF0OGsfoqr+aBo9FTm1vg0ty4+UDtEP/Q1bEkBjC0krhjGZtz1RLRvetmRVMIAFv7n
	/cjTpDkp9rncDg9DVAZktalI+JxFhR8mCLq5ktxibuuJizdwCf1KXCcscdoTg=
X-Google-Smtp-Source: AGHT+IEArGBiKYPwRJ0Az/vkHndV/i+f9BSZpjpqWUBeI/o2LCXpED5ibt7YfNHt4LjcdnLJN4jYOA==
X-Received: by 2002:a2e:a992:0:b0:383:1bcc:117d with SMTP id 38308e7fff4ca-3831bcc13ecmr27420461fa.35.1768207096425;
        Mon, 12 Jan 2026 00:38:16 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38319ec5b73sm20131591fa.48.2026.01.12.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:38:15 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:13 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aWSy9U-JFocPAI9X@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uN/jfTvb9pytjRRb"
Content-Disposition: inline
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_003819_438017_B84E4C6D 
X-CRM114-Status: GOOD (  24.85  )
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


--uN/jfTvb9pytjRRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 09:09:47AM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Hi all,

This series has been in its final shape for a while now.
With multiple resends and pings on this series for the last four
months, I think everyone interested has had the chance to review it.

Wolfram Sang, could you please take a look on this series and consider
pick it up for merging?=20


Thank you in advance,
Marcus Folkesson


--uN/jfTvb9pytjRRb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmlksvAACgkQiIBOb1ld
UjIPdg//fETqNNW85f1AucnMByabxMZanfL15C1uuB87na7/jwdjkf4UOC/cdbTt
IY2NeyF1Boc825p7iSi8zPmZYECp6hYebLP77DPVVJjFkqSPIcDr1c4kfXAyNSAp
Tm1YwwTLIIPiMfAAzCCeZgoAUihY8m/8NtmY3MVWWWWeozj65Wa5Ey4oxNC/LuPc
2DRp5kjGfvHN/fRCT1FB0AdSP2WU+XnFm36hCnieB04zvf5vZojEFEcbRg4RLMmq
ITQTHipPySdVPv8CnKtaJony5VfSCLjjBJml2fyslzuL1frwO/WtZok7XRDqwuaI
lf4MGraiyMv2Kylwf84nqWGdse88a4N38EEwd6akMTK/IEK68gE3MEc9K0yDfHZM
3yMvXTVQ9lYI42dnmY5OqwDBalnZ8RxOvcj9dzJx6FhkIz7zAngjNtolOiWPwGl+
zuYehjmXugmYxNhr5DdxarSYyaIe3qxqDu4Vay0zSwqDLL8NUS1GYQNF6v2lgkWK
Bge8Zju90GWGTzqMXKLvmeCtp/mUE4gzdaWzi1rtUCeMKU4CCy4MZ+pAnhbRPUX2
6OW4b6KwRfc8hboO6YoAjzWBsn1srSZdIxIsNfrE98j39xcO4+rP39F7sCGjrdN0
+u6+GwWiXSN42/dK+PeBZ8uCZpr/QZZQOejAXZ042LHNbmbHvj4=
=aKQV
-----END PGP SIGNATURE-----

--uN/jfTvb9pytjRRb--

