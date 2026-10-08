Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3A8CA6009
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=; b=LkGtmLOECr42AZKAXk+ggmhRhT
	yylhnnFa2t75+rs1aCJPSmvH9seUc50e6pj07CUDHcbga5c+3OtABK+U/4mFgcdRipqx3PBh09het
	lnMiUigDBmc4SgzvHiQA8+/qoDwF6w2CLLs5x3Rz7HddOB57Zaqlp6+yHy1Q/HifTPicjiPvPmWoy
	Y9ZtIw90uuz0L/RFaVTFR/1gzjM2YTg/7xKT1lbUCHHrWBjzn2ZmxQqs06p7pfu1Cy53GPg8xvpfJ
	AzR9lmNoTxauOiTr2f6hALdjDrmjtlK4PIDcyIPOIVTyHZq+Zk234jUz1yBHuPGJpcUaAK1VZTC6e
	qaxT0LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbfk-00000003JJB-08oH;
	Thu, 08 Oct 2026 00:07:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbfh-00000003JIT-1Not
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 00:07:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2556921f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791418059; x=1792022859; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=HdkiTn240CkDnLB/3DQrr0XTXY3GzXB6Ard4umLEOwv2OJkSA6q8t1SRzQCzu8OfWe
         43D/PMpHJ1mdXxTrcu2y1WiISWdCX99YVIuLTwoQ8fM3jfQPpALizCm6Q2rRnKW0Hkio
         Zbu9aFk+RQYSFOSYyZRomOIiWNk+xexmobHmNs2bRtUYFtCuFOtfWCzeTdH9FfETCZWr
         G/oByvjg4OGWcNnNVHHUfDGpKwkDY4wU5v7beeaTh7xu2oJFW7WkJW50ScCGpargur/Z
         G8horgdUqostwA0u/FHOEyt4XVAh2QT4wdKa+ArKDZcog2deL4TAmcFVU2Q9gP8HQLMM
         dQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418059; x=1792022859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=Wz7GuJhgp/gTdkZmGINe+8n0AfBoSaCPkA60kWXH8l0R4M7ba6OJczzlMBUtvMVuU6
         1cz0sLa++Q0a2vsjw44vNjKwM7MVoB+VrxNVSDTrDLX/3JHfXLYuq74+3B1903OSPsoL
         zyXpxXAj7Gl1VKyDI/RacLJQflNwnj3+t3AVjxJ445SOaGWty+PRAroRvQQPI1knWKyy
         oEjYM8bMsSj5m5xrDKsTukLl6mPYrwLqC4lXZjxj/x9pEBVFDMdgFk6fT5bfku0h+5Lv
         MWtbXTIKd9k9XWhyeU9+O67nm6FMKN4zytW+sPDbCNSeZnoXEvyZVY7WdWDZJvGUEJnI
         SU8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHhnieEOFrxR8PFKDcyxBWUXkB2Pdpg3s6m/CSkJxUPgi43OY/fktwOq3iFaygzo/OJ0PNiBSFMybWNQeJdzv1@lists.infradead.org
X-Gm-Message-State: AFq9FYLhIWT0gNDvMWT69tYbD7VK+ZtynVY+v2KpuM0Kj9uLQHTPB+bG
	xKp2Zh8BMlHyVId87RhX9/rnTyRcQuM2qCkM0rvV79HWPITJnjljU72w
X-Gm-Gg: AYBFou1+rLTnY2l3KFzgexoeaXLb4mRZ7vMV/GuKmbYSdte3uzbbBn1bCQ8SqF7F0ZK
	8EvSp0Fpk9eO5gn5v8BycOxr8H8jUfEHnOecqK8e+y6Vvnemr3U4hGfkpOYPt2Tf21vZXQ4yHCQ
	CKf/m9FLFBSdgoPKZ+lpXXWHGkG/22CBKAvdXbZ9m9yzUxaTn4lmh9usKJogp05byrdRgFwkyX1
	tDJOsg81BETtHFs1xuptgrISBs73WJaSBBscPU0YLXsArwQ/4ohTJzR2k6dJpghhb322Lwr+QCS
	g1HsEnThqsIqzjOaogL+O7eMVw6hUUBWSfAhH/96+ubc4JZLZHKhrWAT4Vxqu6owCkwJNOMHtVF
	D1t74LM1pLCntXOwlaR0SHy5ftAVTjgaGJT6g47WSLkzlZBnADJNQ0jz6PgbE6QXzK8cXrsCbSP
	1kilGy3Gyc6kd6sLqsyfQi5xEE6AEmo8KcXYIKIb+p4ltXu/zaGqHpQPIAyWrbW5CKG3HXkc+uw
	OQ/W7bCbg7F38h7GkUbEyL6iR6F
X-Received: by 2002:a05:6000:4818:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48c72788373mr6736354f8f.16.1791418058790;
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7fb9eda1sm1040996f8f.7.2026.10.07.17.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <179140715034.293470.4459182430175564610@iav.lv>
Date: Thu, 8 Oct 2026 04:07:23 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
 <179100548183.3372253.2014593916926884551@iav.lv>
 <179140715034.293470.4459182430175564610@iav.lv>
To: Igor Velkov <iav@iav.lv>
X-Mailer: Apple Mail (2.3864.700.51.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_170741_381631_C1676D22 
X-CRM114-Status: GOOD (  18.31  )
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

> On 8 Oct 2026, at 1:05=E2=80=AFam, Igor Velkov <iav@iav.lv> wrote:
>=20
> Follow-up to the dropped patch.
>=20
> An out-of-tree restart handler [1] power-cycles the card: it drives
> TFLASH_VDD and both tf_io lines low for 100 ms, then releases them and
> the card is powered again. With the SPI flash erased, ODROID-HC4 boots
> from SD after a warm reboot 5/5 on 6.18, 7.2 and 7.3-rc5. Without the
> handler the boot stalls in the ROM or in U-Boot.
>=20
> Where should this live upstream: the mmc core on restart, =
meson-gx-mmc,
> or a board driver like this one?
>=20
> [1] =
https://github.com/armbian/build/blob/main/patch/kernel/archive/meson64-7.=
3/meson64-reboot-02-port-to-gpiod.patch

I=E2=80=99ve been doing some bring-up work on S4 support with a VIM1S =
board
and Claude initially suggested a u-boot variant of the same patch [1]
which improved but did not fully resolve the situation. I was also not
able to explain why applying the same change via the Linux device-tree
that u-boot consumes didn=E2=80=99t have the same effect as essentially =
the
same change in the u-boot dtsi file.

Claude subsequently added a second patch [2] which resulted in 100%
reliable boot. However that allowed me to move forwards with kernel
work and I haven=E2=80=99t yet circled back to u-boot to run an =
experiment
without the first patch.

[1] =
https://github.com/chewitt/u-boot/commit/0a3f5693a4ff192eb044fc4c5a434770d=
e053835
[2] =
https://github.com/chewitt/u-boot/commit/8e663632bc500ee6a83a846bcd3242231=
c33aa43

As usual both of Claude=E2=80=99s authoritatively worded descriptions =
sound
convincingly or conveniently good :)

Christian


