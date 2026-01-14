Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03CAD31A3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=; b=RNr8CEGM5cZsSfpktwKWNgb6KQ
	WqGnsca3o34RCI1zTu3clKoKGCTonMUFTSU1v8rg7wwZ2AUV8r/WCjNZsLShHh/WvJR3Dqim9rHt+
	TforpYgzdxpelSny285Zu/DPS3v4LBgVQ0fKVJp7x/x9ShQrid4pfDLOfTqQyvByOKyOFwFAlhWnG
	x0HPJQBLTsn+ifwvlNLMPKh34cHDcbQWZx/nX7CebDsYCUlR4XtNpQv3iRu/wlymaDy08bR5kVUzy
	VpVXwRVgzr2UC31G1XFB6CJU2zW92nweZc1uwAhYj+a8nHrgFj9JXtVRqIw/PLA12Pr15A/FSpAbz
	Kedjm39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxo2-00000008hEw-1cKl;
	Wed, 14 Jan 2026 10:08:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxnx-00000008hD5-02ej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:08:48 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b04a410f42so7623621eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385324; x=1768990124; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=R4rNzc17Wnuz0GGbrBitx4iRWzi96bXCC4NjkpinklVHbaAzZKDkNdcvqUpUqojA9S
         QCykyp/l1qW3WEhpaWlSdnvqmw+kONT4isIues2XeFbsvPq3mmgL6DeWE8ThhPwNqHV3
         WbpoVA2e2ZEDGXJPv3336sPKcW1Eb84TSvU7VwpF5uIqSd2z7UembtZoibU2Vi75wEYN
         sdp7jO9NAGrrWH2n/edFGkGbIXM5FwV0g8tOaQZ+mihghIDe6lYjqWGktB9XEYYPGtLn
         VexnxvzSrDk5xPgfauYC1HacSfwSpML1EwfTbZFmxlTlWV6wAkcMPai8GbN3LqLiqkcs
         zQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385324; x=1768990124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=ayBXu+dwmDXZiTRRQ9l+14ZnTS0iY/4gGPhlhIxUa0rUry508kkl8Wm/meeyqS3/P+
         1VgDzJnPWoXIbYoMQpeIZhuzR6NiTOJqfPVXUp7ohmpXnFkwRsyUOllm66CtbaIocLcw
         WYFktpOLbjtZcMHNB60HQdJ6QMaOP54kwkJfYXg9A9Of2fk60iFiDYjwXmM7egzYiSlA
         3u5UrRsIjIBAPmrHNCG6bZohpnmBYJuIWF3mTsxHUvupNkvr4Yak0apV3V/LgRT/AQ65
         gK+iOhdeedChVDjJlBt7HCUsgKsITlgd6HlFmfmlAnQH05VBAkIW0LjyyKVe2RTsWQ3z
         N23w==
X-Gm-Message-State: AOJu0Yz6fOT0BA+8d8m21HXcn5xsSvA8i9o7D1TwJ8f+gqNx4Nx0zFtD
	B54Ku56vKyuka24O23Xf31Oj3A0sEi3eW2DIuB5E77sHOaX3I1UJ4WyPOcA68Aenc8Q=
X-Gm-Gg: AY/fxX506fMp8fGQa/qThJkGnZ/gRb8+xRC6ejPK1yIYRfijk1AlAHUUeZMVJorC1HL
	6jBuycx3+bJVMmvj6WXVofo3TgZyv82ZmzeWoUPAYRj9UjyC/xW+UuqxHZMw3y87GgzldfoZ6S+
	Fm+/Rrc6bCjLOKONRDgTrjIdCum7VVR/1B7Nzy5YHjogGPgK+KgC7cqr85yX9oyMt38KvjdR/Ny
	o23fnGstJP7aX+OSdm28pmFhWfhBSBONpaSA/wZKyj0nkPtG+KeznP8cmWfth+xuMn6O188JC3B
	Y4ao/It/HMGXQ/S2ek6w9iFvFs4ZdY+f4lbgHrK2GbOatXEg3iK/TKOZqJL3Ie/oy8z9PcEGxVY
	PNPWqQac83+4OBqryVzOTpa414rA7CEL+SqO61bKX+SmDUkCOKlb9yuF4aUT1gfwGk5Ke3l41GJ
	xk0w30kAG0EtGGj+11
X-Received: by 2002:a05:7301:4e08:b0:2ac:1c5a:9950 with SMTP id 5a478bee46e88-2b4871eb693mr2526439eec.34.1768385323644;
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d60b1sm19790893eec.31.2026.01.14.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Message-ID: <c449218000258224fd9460e898b9705c1d0d415e.camel@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Wed, 14 Jan 2026 10:09:20 +0000
In-Reply-To: <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020845_051612_E58E7D86 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue, 2026-01-13 at 10:59 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- Alpabetic ordering for all cmu_top children (Andr=C3=A9)
>=20
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

