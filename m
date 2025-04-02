Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CBEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=; b=qCRzHi2IoVXh7mOwGQWL+M+crO
	Iu8t7kMJPjTf8y8MVt9RI7nzY/6kZigTpgeDIHnDsFIx/b6nMHHkePc0CO8jcme5QCECYzucmkI6u
	VLt3J9E1KYiA0liSGWZL/I5Q8UIKu3arxfwNgH/chpwWzIgx0azOf4kMmolI+/SzuHNQBxCn1H7ds
	xw+31xGPa8IlC0aLTiCaB6aS44wspHXJH3FiqBZs9IFdDai8E5ox5+eHToyHl61ga9V13/OpD1Kk2
	iqS+TTpdE2Hn4BPuAQWwN2K0AIilEtPl95HjnYbdB1j4YuyPPdC2cmcVTQ10uOS3mwTul4AP9yuv+
	BDLgnilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuRl-00000005hBq-1mtK;
	Wed, 02 Apr 2025 09:31:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuKY-00000005g8e-1LEQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:24:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54acc04516fso6174853e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743585856; x=1744190656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=;
        b=fUTkwcl8Y1mo0wHPiatJZzGe50xy5lA4H7Z/0lruko9r3Dbr2/50RjbsiaTFnxIUC/
         1+Y0fXUDRVkrsXZ6DGQW+N6ery3kPTY7DhzozYFtXLFnEIBqzO3guQw5AQAL4D/+gOMk
         432UgWl04Ibvul3zhVeqFHhtenUlFFutJo/Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585856; x=1744190656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=;
        b=RR3ytcp0a2xhtlhVD3t51mJLFOuHZr1EGzr8IaMUxqrAX2/bFe9G4mUXcdXUMr0duM
         12Rpt9y9FyKTcEJiqLltddstw+WOXEbHIc8BQPhU0l5/f8jE7K7fdhSdcjlR/Ysi7uXO
         VRgFcsTDb1/v/PfWav5wHZi+P2GnVh5R4bZ2lOXzAmycdNlOvQacCXXLy99yV40vXE25
         cLG6kHZzRv13kuW0e2B6kSefTDyDJr3YjOIsikPM3WTxyriBqk9JSWk+u1BXhvR9rsJ/
         JWgn5eN09F9I0AINyNwMXjQbvwpeLSTHXYxQ6ChdvmPnghXbrKRMRTtvZDnWhWJp2ZpY
         ZVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqeNXUyqC5xGC3IiNLIqi9dhUWupzi5E8C16Y7OvJGi/349SUr2HR1fKIkcxLdXuWaoupJJ+rqbgNSNWN2QvUZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyINL0UN5ELXPtm1vYxefFtVSzc/bcgDuFKMiuzNapfeyjsu8Yd
	1Qmo1mr2ZtK6NlF07c3x8FLk/vbZzgaDBGR2dS4EoXKKsEVv+6vAQ7abInF69XNecBAeSXutaO1
	k22mBnBZujl96KjlhY0JU09kAA4EsuZVkCxNn
X-Gm-Gg: ASbGncszWYfhuKldnfB363mI7T/29e2DbjiNvQApR6DKyqx6M7PdzKoFeOTzCCvdqHO
	l98rTMe1n7jqrYm19yqS/SQlmTxDe0pETU2ZE8NYQg0BehwxKNKmDM8AreeJYiY2PZ8zWjQM2PN
	2cgw9o3gJ/7Z6A1/E+bNStUiJTXR4KIHHj8z7DPX3+MMmSV92P64OA
X-Google-Smtp-Source: AGHT+IGw+YGuv8ErLPgxlPKM2b09XhB/ltk6uSyNLvkfiPfwDz8v+Y/E4L1VGtq26j3qk9kLU4E2MeK3y1Gu6VR/5FA=
X-Received: by 2002:a05:6512:2341:b0:545:8a1:536e with SMTP id
 2adb3069b0e04-54b10dba30emr3831169e87.6.1743585856527; Wed, 02 Apr 2025
 02:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com> <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:24:05 +0800
X-Gm-Features: AQ5f1JoCbqqAMlKuOxFWbpG8BuhCzvYJb5XMq2RSYRHsot0By3jXZZ1xVJeT03U
Message-ID: <CAGXv+5GuUm0LMphTMvV-A9zebOfyb1sAG+QyQ0jhrF7TV5M48w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and
 venc1 power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com, 
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022418_430142_96E6BAFD 
X-CRM114-Status: GOOD (  12.84  )
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

On Wed, Apr 2, 2025 at 5:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> By hardware, the first and second core of the video decoder IP
> need the VDEC_SOC to be powered up in order to be able to be
> accessed (both internally, by firmware, and externally, by the
> kernel).
> Similarly, for the video encoder IP, the second core needs the
> first core to be powered up in order to be accessible.
>
> Fix that by reparenting the VDEC1/2 power domains to be children
> of VDEC0 (VDEC_SOC), and the VENC1 to be a child of VENC0.
>
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Changes look correct. Would need MediaTek to confirm whether the power
domain hierarchy matches what is claimed here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

