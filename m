Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3679C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=; b=pwDxWYaYkkja921OdanPKRDqCf
	sM25VMTgJbJjvzciXN5IH8JURv05LqCANPQcKTRUmtEbjcL93PJS6sD5zZuMy6Tcm1XbL4lfIFQ4N
	mEi08/U1x3s9WRfyTFBT8prxJoO6jsR8cxL5LKxklDMnI4bdwb/+PdPw0RHUKfd2YVBxknVHaTZ3t
	5xCtrlHfX21G94Z0dBeed1ByoZFHrhA5BoN03IkhQwHL8eo8qvXasYZQyeQGwhEPONK8FmrPhfg6y
	F+uJzvG/WbppRwEVURKAE5QTphxDGyvoTFYYqNhiU7SC0Gd1L4a5cQrYAgTu/NASTItGfryCZGVbT
	IWHPcFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGc-0000000BQnH-05kw;
	Thu, 10 Jul 2025 10:12:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmrN-0000000BDSU-1NUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:42:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32f1763673cso8809981fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752136947; x=1752741747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=;
        b=ZSHDN618gnBNUgcv1usKkscspn73aOEsxwvvfT/+x+92GLqPSvjthEd2tFpAXo5SvJ
         hLU5catNfHSGjNpkjHJhu1UZavTPUum9UV0/c996U2bRQ/fcb/Cedz0BVjr2tbCm3IBY
         d1qMQFj771a5s8PQCyikndUiEljA+RFn0vLMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752136947; x=1752741747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=;
        b=uQK4t999e6xxDf2WzgoQ6Ob8D6qAxbc2uqmDGvwg6945ifygHGE3bVnwKDlzpDyZxo
         SZfIDSdScBfqLzOdfye7KePYkrGWNU6hkVHRF8l4igtzWm5E76Buoh3sGNMVGodLSpJE
         q8FfksUihRDrHcmEYaCYyjM+tnEyQwAVsNuXBDHBoDWmePEMKlwhhwq60ZZoC34YJmG2
         eS35SP5QwsovcqY7yaS/d8Z/BkmRB9+G/+MLHq6hta324n0T5vWOg034IDM+ZCWMuOZx
         C6G7J8OVOVDA+x4PwZ6ufHSZ8if4sXU+VjFQOfIbqXbE1x3pRIiKcam2qAj+06vR1hvo
         /qDA==
X-Forwarded-Encrypted: i=1; AJvYcCVCVfuhMy8OwMzg3NK+mlwDNcyrhqBBBAipzUdMciVkN4V5VTUlSuLkr6AdS/CMKWa3KmPyMMRpvB/ST/2MTxY9@lists.infradead.org
X-Gm-Message-State: AOJu0YwZOGeIi4pP+AnaxBllD738MgJYDDdaKb2xe4mpJIdAu941rREY
	EkjhlC+WSbXYVhSqlTWzrHp5GublBpUzqc9F0SSQsb+Ya5GHvDzil1RlzzbWRmc2PPGyPub9UF4
	JTo5si+CL+kL3vm9eNZjbA3mPWTA8fInlLFtOxKpo
X-Gm-Gg: ASbGncu0p6cqs9+EKUwRyRZlO09c2ZfLyx0AugHbumdGcVPCGapKIP2XjU83lEBUeu5
	B7ZXYmhG9M+gTW19abOu1LxH7XaTHc2FAIfbCnOdX8sJkloVmdx+zt7nRUlEs/vtM7V1DBKMTZg
	3XLzN2FuDfT0iqkLU+kbMQRXNWkwq+vLrHeJ2Wt0OdhULspnLd7/BhkdQQApBf7ZuGB+CEdZc=
X-Google-Smtp-Source: AGHT+IH98HyUSFcxzn0ZLDTDXzcG2xAq4tfunT0Q0Flrc8e1qgVm3bYMsY/33vj2EMiqcDSWrQ5h5u7h7vcdWubER9k=
X-Received: by 2002:a2e:a99f:0:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-32fab95f588mr5305791fa.11.1752136946822; Thu, 10 Jul 2025
 01:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250610063431.2955757-1-wenst@chromium.org> <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
 <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
In-Reply-To: <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Jul 2025 16:42:15 +0800
X-Gm-Features: Ac12FXxsLgCZAUA9cokLqBFuaQ1ZCvwcmNm2Lv9LiZZijxwC0ttVDjqCnXtUfEA
Message-ID: <CAGXv+5E=xLJg9Y4OProhrH3ROy12J+3gNc3eiebGeJuEVEq+zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
To: Srinivas Kandagatla <srini@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_014229_390025_3F30BDFA 
X-CRM114-Status: GOOD (  20.85  )
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

Srinivas,

On Thu, Jul 3, 2025 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/07/25 11:15, Chen-Yu Tsai ha scritto:
> > Hi Angelo,
> >
> > On Tue, Jun 10, 2025 at 2:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> Hi everyone,
> >>
> >> This is v2 of the MT8188 efuse GPU speed bin post-processing enablemen=
t
> >> patches. In v1 [1] the change was made to the driver. Angelo, the plat=
form
> >> maintainer believes the change should be made to the DT binding instea=
d
> >> [2]. v2 adopts Angelo's argument.
> >>
> >> Patch 1 updates the efuse DT binding so that MT8186 is a base compatib=
le
> >> with no fallback, and MT8188 falls back to MT8186.
> >>
> >> Patch 2 updates the MT8188 DT to follow the new binding.
> >>
> >> If possible I would like to see both patches merged through the soc
> >> tree once the DT binding maintainers give an ack. This avoids prolonge=
d
> >> waiting for the binding changes to land and uncertainty about whether
> >> things have fully landed or not.
> >>
> >>
> >> Thanks
> >> ChenYu
> >>
> >> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromiu=
m.org/
> >> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@c=
ollabora.com/
> >>
> >> Chen-Yu Tsai (2):
> >>    dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
> >>      version
> >>    arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
> >>      mt8186
> >
> > Friendly ping. Please take a look and see if this scheme is to your lik=
ing.
> >
>
> For the whole series
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Could you merge  the DT binding patch so that we can merge the DT change
ahead of -rc6? Or alternatively could you give an Ack so both patches
go through the soc tree?


Thanks
ChenYu

