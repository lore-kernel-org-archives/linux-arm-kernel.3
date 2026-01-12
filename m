Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A30D25049
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=; b=a17LM6HJ3TiSMqcUF2bqoLI6gY
	R3yNNHoRcRJpRghpvwgwzzrfZmX5T3eL1f9CU2l+kagBORmv5LxzCPYNKNbCtOIpNiCLOYBHPy1Po
	7wXSAWg6tx45ubDgvNFw750PLtcrRIYGQ5w/ODymo9BIIoxF3WrhkUORhrgK/Tyg9tRQ0YgqVDCiO
	BuZRIdfey7ZEuvfojZ+nueTD3Gzha5DzzUS9xNJdJWGUZrHhXAgETtxPje2XuDnTrAphHFeIOoOPN
	khXc1gyL4ZXSqOPnn0w4wX3nsY3skdm4nWjFU/fuj0Y9whkOsxa4Pvbim+p9TSGNrDRo/uBjASyCL
	Zcx+FzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD7x-00000004yAf-21rF;
	Mon, 12 Jan 2026 08:18:17 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD7u-00000004y9o-2SG4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:18:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so5463256e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768205892; x=1768810692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=;
        b=E9QSeHva6P7OmoCHLFEw5CWnreZur/s8t+xQ4DUcQg6CQU0N3kP4eh2SGEw9XU8Mnf
         XAarfliDsED6Hqg+hpDuF8yTmUO9dj11gTiAzAVJPzyW7ISGJjV+3xK8uZqF+qNR/PeA
         ugXzOhF1i3JJaqce7JY7lu1mwMtzFB5G4qr+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205892; x=1768810692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=;
        b=r6TtGq3gewOTQ1X3nw4l+YyKqpt6AiW+J91eOj25Atc+6vDdRNDfbKo0tthOWbzF/9
         rmZTuFjOtFRTRe0Nqe08tNK0Lp7KfaY9mD8FRwd1JD3cLwVFmpHI8WgpjUosTqr7g1xx
         WFy+ltIhlmyeay//hN5HGekyIeRrsGTra80Jyeh9gZZ67Z3McLGJH8/oYVJ/F6PvurRt
         aHs3xB3MrukSgYSGmT4hHBBSKL/f7O1ADivN/xjxIjFhK2I2FY3aCNK7q49ncdKOFAE4
         k6XblrP4Dwh8iL2yF0QJ0Z94Y5o8fSSzzUQLRnVXQ+X9FxVlgUW5obUJNtNxkL+bggQl
         I49w==
X-Forwarded-Encrypted: i=1; AJvYcCVvh84XMtvlYjodoLLbJS7Bs2dJATE/KsO0+4Dwa1lQkYRQP4LEIkVwyoYKzcHt6xeTpvxg5sfzvGWl7aayso1C@lists.infradead.org
X-Gm-Message-State: AOJu0YziCurZq8IwkW5PbVBxiEEnxpcGkrU1aq+CdVepIGMt+AcVrLxh
	DFmkBZiDSlfqcsqXvyZYPFZSEnDrLN//LDwoiULr99+dXdD3NDmMMNOVkA9zjMWqC7H5oWw5jKx
	2NfCdyvBbh6TNURCe2GEjG9vo9wHVjI7qb8u/3QI3
X-Gm-Gg: AY/fxX728utzO3wCe7M2uEZbfbp6jmEzZg+vXNs0YeUD8PUEJL33NZSHS64N2AiMlzX
	S9zLX/ue2MUM18kiKnHjP79IlQg17b6G6SMseU+bUTYMSWDiuX3nFB0rpTHdv1yWF6Evzb9Dxwd
	Q2bnOVI8CWQ6Bf63H++TD5/9pCu4mXKAOZxfUh30gSlP+tSmyxfCXJG0tITdY9qaa2wujCciSR/
	+qQnMMDL/zBPm34sXzaUyfX14rDE8C43lU8zvqcpxz3NW9raobEyzMFHCkQUKpRtRcJXQOS1+Xp
	nJ9Fa7kvn/XpaZHcgmKIQ586
X-Google-Smtp-Source: AGHT+IGx4V1mUXbU15GtT44eKVpOEb29WTKJMzbAoN89WgC4hrv7YNIuzZX0Gjd3/5EsNVcfP279dNFvkxagu3pPvnM=
X-Received: by 2002:a05:651c:50c:b0:37a:5cb7:968f with SMTP id
 38308e7fff4ca-382ff82552amr62183761fa.29.1768205892531; Mon, 12 Jan 2026
 00:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com> <20260108143934.69634-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 16:18:01 +0800
X-Gm-Features: AZwV_QhZ7-2DT35BSI-MBrcYVBSsLnJPqpTs3jsSxKZmKUrz-0wsA0fkQDOVy4M
Message-ID: <CAGXv+5GXcH48fy4WBaB7J0PM0Kt71L3H7ASTW_J72cV1TxE=cw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix warnings for
 vdosys0 endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_001814_923201_334D56FF 
X-CRM114-Status: UNSURE (   8.81  )
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

On Thu, Jan 8, 2026 at 10:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This machine needs only one endpoint (@0) for vdosys0: remove the
> address and size cells declaration and rename the endpoint@0 node
> to `endpoint`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

