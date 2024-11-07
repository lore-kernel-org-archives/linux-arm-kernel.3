Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF39D5AE70
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=; b=B7Jmubozx1l01GdKX4+fdTiTIZ
	M7sTfjHUMN9yvJ50HfQo0G6ABexK+dF+00bfJfcoSaNjx+sj0qikCAq2UbB3O1NLU0PXD7wWsVSxf
	/ppyRen8qtgiTiGgQxsJ/e/FxYVB2polH6sMr5M+u2Gy9dsdMi3fCNdtCXE0zEoXe3V6zHV7OF1RY
	wNP8AuTSn141a7o7nzSXG435buvKwK2xHwO1c+CgMnBSMsvVhCNIZxP3JOub0yrE+D+3k8kZiWDF2
	wY0pb0Ckorus0M5lKRPxxTCRUDVTBsu+io5t+RUZ5vKtkARl8zRmqYFEe7RTus/zOvlDhcr7+HpuE
	THZxi9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xNp-000000063JZ-31sY;
	Thu, 07 Nov 2024 07:56:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xGd-000000062F2-2LkB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:49:24 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53c78ebe580so1799856e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730965762; x=1731570562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=;
        b=DbRQLiTPmmm06fdQSTVOLfl3EXzcH/nOipS1V77hLFehB3Y1p7O8ZEuQgi7UQelX+5
         nVdMVEhteCleJbnGrjjN4LrmIx5B48qKHaUbg8VtIkJ4FXPNfB9fy3INzWkmjZRxzUKM
         pmtAJJEFx+pMZDTrhmA1QoHZhg1UdOLxZOTCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730965762; x=1731570562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=;
        b=g3WVgKXf8XZScFpwPq49XYDdf56k4KKkx0LteaMOzLRp/5spe3N7uQQIs6K1nL2kCI
         6uskCANBRKVyd3Tix0qA3ZLWdAgCAJxThKsnEdnonTih5SKvAe0IecnIE8/2YQ+GNnHF
         yrB6nxThxjsdHJO9llsuRMbStFqJTEnXzkC35mZRaxXlxu3lNOk7rUL7aeQPkBApILKq
         KEkjaBHwtjJbF04izSKNLoohstFMoD0YtHt0/jAGPWuZn4qIqH7fZ4nVEz8bZR4jmZyd
         sKIZL+cv7R22BUiFJE3mOez97m/gsUOSYGInImfJEjo41s1jY5hnuzlw/tDP3MkBYxVR
         9zsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCeWd0eiOne6i5HFXKDM8TcLN1TE1CmKHalj1LF4yvybUEY1b8UMHKM9CE8KmZ9NrduvYHvL7mtl4wwXHu59s@lists.infradead.org
X-Gm-Message-State: AOJu0YyS9lSaC75DxfrjGJapWFGnzx2joJ7KV+y4GotcFe0ecDSdN7N4
	x6/g8/a7syw6RmPLUVQ7rrts84+cbey7Ch3ogfnALkcpWxFU3133WvTazPz9oqRnjh2pj6eVlZ/
	i6VarQJV6TGXoK+qN+hfrzJahbO7QMoEhJ+cY
X-Google-Smtp-Source: AGHT+IGxn2pSbneZDHgWnWUCDZaUop/6c6chaGYhHrU991goYLF9CZhKqopx6hRuSSwvbSM+DLDtcwV7tpySQOVxgHc=
X-Received: by 2002:a05:6512:1086:b0:539:fcaa:d0ca with SMTP id
 2adb3069b0e04-53d81971b63mr724012e87.13.1730965761512; Wed, 06 Nov 2024
 23:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20241107074603.31998-1-yunfei.dong@mediatek.com> <20241107074603.31998-4-yunfei.dong@mediatek.com>
In-Reply-To: <20241107074603.31998-4-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 7 Nov 2024 15:49:10 +0800
Message-ID: <CAGXv+5F3+65gTsmz7Dzrm3QchmKnTECAGzLwJW9uT5aM_jLeMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: mediatek: vcodec: add description for vsi struct
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_234923_638962_0A96FEEC 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, Nov 7, 2024 at 3:46=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.co=
m> wrote:
>
> If the video shared information (vsi) is changed accidentally,
> will leading to play h264 bitstream fail if the firmware won't
> be changed at the same time. Marking the shared struct with
> "shared interface with firmware".
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

