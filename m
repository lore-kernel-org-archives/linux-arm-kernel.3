Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9209C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=; b=S8Tfd1/aKmrl0wKdJRnWJ93JEi
	+Xx0BI1u/firw/A+qYoQyJrQfWkischc25+Nz97cv3dBo/8tPjmk+Sg4iQ1O3q7FWHns6bw9XjsRD
	87qlSNS24MV43mXkHiLecO5WnTk0uw/4aD9RYxK0TpZWDXhpHT/gx7dVEpEaEHJHNP8tE3YFzo23z
	SzWlHSD1gL3z5WKyFqMwJyjivK82Dey4A9sdsyPxch1X2Aha2+4POoX9aYlda0h+py415QxkAUYqV
	DQrSf8bvVC2gZy1iT1GDkdjY5qzarKk616jUgK1fZTXAlm0S1YMOPDCs6nxdW8/XjhgZyXTJn+QqD
	nieVt9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW6w-0000000DELE-2zZa;
	Mon, 24 Feb 2025 10:54:54 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW3H-0000000DD8x-4Boq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:51:09 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso3969237e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740394266; x=1740999066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=;
        b=YFWua4ZURvROpAXbHSfcn+cOQY3Ib5nepMcOjwZPobvKAo2uTuJnkiIpsLtcsmear6
         Redf3hfx+/9vLPWVi+mbD7SK1GcdhpTwnLfrHQQ50Iz59fSnX2GXtKX9lZPKsRE1ZOUG
         apSmx0BqujtzorxPbmyuQYAWbafFXdsL2xgHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394266; x=1740999066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=;
        b=AVvCv/3FQEvFXHRtbBq6ARGCXb21t3jMsmOEARLWIFx+ouOrPlBvQURm4JOMYPm9CB
         yy0PNvOWUaHHJNiq5/NVEDqjPYNjlxvjYCdCm03w8FVHveq/M8fUEsENXrcLNk0Mzwea
         cmDxXVfdS+hHOfZNFHO/2wEjWKWP3fFCNmmGYw2qkSC37psnOZuT4qwulmw8Ymc4SmaJ
         Od4SGNE/JvqaTLMGjTsVyRc41fSWlD69wg3LjVfoYWYOvs1B0fV47OSsvok0LSDGu24t
         9Rx1mngBtWZnplQr6hVW/fQOwCc0rprm2BEdrut+FpuWd2y3eHra/I2A8uLAcIGviZlK
         qwLw==
X-Forwarded-Encrypted: i=1; AJvYcCVzS/O8Foul1ee89tY8i42T3hxaMmVnquMSUr3q3sIM8hUcgL4c6TCl3awnfY8Wcir+pgbhDOkJLsysPIyaH5WA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LAXGm87DabF9VlV9RFzYMPyUGxnF6kQkv3lKAtcgXET8Ng2L
	5pgmEXu5qg8sI+ykeCBHiTWKQTRnJpFZYWol8pT24VfkeMohBXlnHfzO8zAy/N+XPd77Er2WZoz
	u6tgE7ZHxSd61bD8yrKaNCC4h0mJuKDzgcWgj
X-Gm-Gg: ASbGncuymcDQKq9Vy96YwBYx8uagKZx36T0RDNQ8cqBs+REYqDLKTHdqJrNDtt4v98m
	OEJsQe/6+IQCv8DqU72rQ5hnT/QGPtvnb+lCqQCbxgCrkqf+Dy/Q02ghkNhtwcTv4/EbNITWWTk
	qeA9JZuLBlaqgnjye6ziHOBtaZeP6zcuVk/sI=
X-Google-Smtp-Source: AGHT+IHt7LwH1FhfjAD5OKjp2mvKbAZ/8l+aQ1Ipxz03xtQO7zWSEdSFIHFgBDAxXVoiGz8lGaTL7HUC1kS6yhy7A7E=
X-Received: by 2002:a05:6512:3e08:b0:545:1d25:4604 with SMTP id
 2adb3069b0e04-54838ef07c7mr5016745e87.13.1740394266393; Mon, 24 Feb 2025
 02:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com> <20250220110948.45596-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250220110948.45596-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Feb 2025 18:50:55 +0800
X-Gm-Features: AWEUYZkS0SprGNFPq1iPBVTH9fxdvLxcztVS14fJMBAWX6iv5wuTONgtw46vcv0
Message-ID: <CAGXv+5GwY28s3m5jXX_CqKfK6iehJRhrwbEvd2=7Qn3u=L=mLQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: mediatek: mt8188-geralt: Add graph for
 DSI and DP displays
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, pablo.sun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_025108_060750_58A91E78 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 20, 2025 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The base SoC devicetree now defines a display controller graph:
> connect the board specific outputs (eDP internal display, DP
> external display) to fully migrate Cherry and make it finally
> possible to make Chromebooks and other board types to coexist
> without per-board driver modifications.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # On MT8188 Ciri (int. and ext=
.)

