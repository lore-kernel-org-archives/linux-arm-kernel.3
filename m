Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3050CCEE334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNtoUy0Rbnu2n90Tsiyfvs/PHlZ4JRBfMndeRvKVC1I=; b=g6xr2dX5/AidREGT8ZdfK9gH7Z
	DGiscR368BP4/P9AgkdWL27MHwBIZg4lSM51eKgI8ERIGWVlf8LAjv0kfrqJhIj78N0dqa+sYHX3O
	oNjjYvv3Xgb8U8iKGwCKwOCf/NVhc975sjEYa9muVlS3zC9RrLiuqN3vFDWM3IRQLe8g6eu0d0kYR
	YhsPtDCDlAcXWEspcMLfiVC4j28EH957y3ct5lpIoVpuGw8r4QDFMzj0UzhROMj4WJln13WwtpwtA
	ZuG8sGxj9DItfVI8B7fdPAvndkfNmoiRnoFPWu3sILcGKxvhs/1TH+e8Tof6IU6NbwVQo0jrOloF7
	0fVLVKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTUT-000000018mr-2j4p;
	Tue, 18 Nov 2025 21:43:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTUR-000000018lK-2Ql9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 21:43:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2980d9b7df5so64064295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 13:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1763502234; x=1764107034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNtoUy0Rbnu2n90Tsiyfvs/PHlZ4JRBfMndeRvKVC1I=;
        b=MVCGGOSJqPMYTVp/C7yxms+BTOWLnV3rWrWoGaebpeSKTOV3Hy2a1tT7TdPXOV1rUH
         tlke6xKoXBNlkH1Yw7PpUyVeRuUSTUVfzGPxX/MSiBwB1SaYWZkD2wSE9V7QMrmNnkbH
         tW/PrWSc+yGpGgjTvG4Px5Gundw57z5ABJoMJj62Z8YVMNgN7HGko3UzxRHgbGlU7utB
         cIMGjxFnqJQnsq29SFnxLsbFbmydsX7FZ1E8Vb9CMLoMz/Uj8oLY/oOQzayIHCgFCbqB
         YpKbe2u928qXYVmR9XL1Ri25XZHQwE7/B92tOoTYYfnH5BUU92gF6RRRTY7xKyOCX5Bx
         NkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763502234; x=1764107034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNtoUy0Rbnu2n90Tsiyfvs/PHlZ4JRBfMndeRvKVC1I=;
        b=anCYQ5F9GrYowzUHT9DKv/ao4PJI5wjjU+LoQu692tIck4UJzI1+FSXh320C8wnQjw
         Z1FexLR3I5t5VmHwmi8Pg+7vNJa/I5xeGW+zuFxfLvDva2Dxg4q1y0wiWIORHZtLq94j
         jrQChbXzWUppshOUWoTa8qAwpgojil/Otui1PMFFSMk7eamVnBfAswIxifPonhW8g6WD
         2kD/KzOm7RtNWyS3QOSVnug3dcCA4n/Zc2LiEI46o5Nw2kVPlUwUhhnPZtWbHijc3lv2
         4SykLKRpipsdVT+DRpVJsxameVNTXIVIQVT1B/6TdNJQxB5Bd7ifrkOwkyoADtHQOKw7
         jLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxV5YcgvCm0TkeN2N9WUfvYPVeXZza2U06aGUvUOykaYWYVPlczvifyxYLDL9vOQP69lTTM6wde84Ah1oISZ7u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgqv8Mh7WH/ALzyPOekQEEJenMxbWz0qq3Gt0cUbyyVEgadgOl
	+JvsGrxBgGr4m4n7AvGhNtiE+HZW7tIe2UhrqBsv4BB5NwcZr5eRjXALHtlzO1Ji7MtqkcrFuSq
	/96jV304gXJqIymZ0Fpbb5drjVtkApUoK8AF3
X-Gm-Gg: ASbGncskzemt+jGp6SkxpXIXJj8OWh4p6fnT2vnneOLI2U4hzBLUbKcZBv5taH0aMUP
	ZGi894VzQ+q+w1QijQKi9vcNm3CVfchVmpF4C47f0XafYjgIVH8x3UVSV3ZBSPxsUHnjpEfP/qr
	K5y9s5wnDdX0RgMl7ornvJhU1c9xNN0tKnajPBDAWlKrltUZRUvFlKF87MqYVvU/M8eO/dVVnE0
	GQVedqNA7/YS3LuYqCG+bwzefyCi/CJud6Y7bl0xlLV+e17Uhf0E8jiaz2pCQjZAahibOGIU4EY
	MpVaXfxkIh4c3T4noSATcEO1f40U
X-Google-Smtp-Source: AGHT+IHd628lGwsZpI++GYNCgzLr60HHxUtuAdRPIXPzSVGABfGpGsyCVSZh4x9JJThN4L2osh0CY47TVhRtaDoTD2w=
X-Received: by 2002:a17:902:ebd2:b0:294:fc1d:9d0 with SMTP id
 d9443c01a7336-2986a750101mr224217285ad.40.1763502234354; Tue, 18 Nov 2025
 13:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com> <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 Nov 2025 22:43:43 +0100
X-Gm-Features: AWmQ_bk1k_T1rSzW6trxGV0plWKt9DXsG1Z-FbbeCcRZ7OyTLOcx7IZnQX1bFXA
Message-ID: <CAFBinCBnupgH=6NQH0oPTj3ETVkLfCB6aVyMySAqAxNEAHnuew@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_134355_613157_3A2294E3 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, Nov 18, 2025 at 6:59=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add new definition for Amlogi SoCs, include S6, S7, S7D.
s/Amlogi/Amlogic/

Neil, is this something you can fixup while applying the patch or do
we need a v3?

with that:
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

