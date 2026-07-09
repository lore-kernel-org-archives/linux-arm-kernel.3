Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91Kjy1zeybXRCeeGvh59yf06osK/tzkAkgdwJW/cTYM=; b=v/S57rnejL//722d6vYCGi5Kww
	sLZKy16yBU4/xmRPTz71juAx+T4cd7UTNwMVY+l0uqJtnB//iY7sod0SCvPthI/WkbAkmQi8s5KsW
	MV44KsOucON37S/Ya0XictGcrU/EK9qMY1uHo8hYVO+aWAOaccIBGF6Mah6xAfPLn7IrCyGbojHoD
	ZiC3xdf8//CIJW9eNeAY1YgIHAoCGoNX2nsFLO98Oerz3Br3mLEj+8ICMXlFws6jH6I2HV6t5lDjF
	qbPRCd3Wv6LkifkuldjoiaAosi5WwtFBuOKrcpEUbd1Z2R5cCBE28SUlAj82km8OIaFxblXRp/o70
	+gxjr74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whobX-00000002WWA-19qN;
	Thu, 09 Jul 2026 13:15:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whobW-00000002WVl-0d4o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:15:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F7B16132C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B483E1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602948;
	bh=91Kjy1zeybXRCeeGvh59yf06osK/tzkAkgdwJW/cTYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gSCxJZbIl24MhP0Zhqb0oxb1lCopKMBME/78SbkshPDxvaWHwYvJdrs1qT+wSxl0R
	 e99/UJcY9v5ZXGmTNgoszPIWkY3J2z3PvVgyj+AAVN556CQRQqwputqNYVQq91YXUG
	 AoV27x1xs79DoCZVWWyuNaVIimWLixuHtaf/su653g+rVRqLvIe74J+0FjDGD84YYH
	 uXMtvW1pDNoCpLrFQlVWu/tRIlpX38kIbAB30q3uKbIXA4JaUc7iKcf5zxboO+d2KM
	 8jVb36sm6Q4Kt+nljTkpXjfwqeGhudYv42gd5SyJ++sbXHz0VYPPMLFbPQeivlzs35
	 bNvqZyk3Wy6RA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1488405e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq1lRd+a4l31gjrgeMXLVbEqEyo2NDONlSSPnW7c1+fw9xSKXm28ICHtJ+NkXMTmM8PoIWuG3JBOSMCxBae8xQH@lists.infradead.org
X-Gm-Message-State: AOJu0YxArg8AkBhmjgr/tjxNJWT6n3sjUNZyCS6EqMOIsxajrWG1yjsv
	q2KBE2yhLwG69qhzoRLwhC/kGm7087v6mTzH7YLe4yUU++SdFsLk/UJqcWYfjEzU08ucobDlWui
	QOzg9UuKji6risMW0d7xXdlQFHYwn0SQ=
X-Received: by 2002:a05:6512:1092:b0:5ae:badc:47d3 with SMTP id
 2adb3069b0e04-5b016d615f0mr660965e87.28.1783602947523; Thu, 09 Jul 2026
 06:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 15:15:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Xy_gdJ0GRtKJJRgjwWgpK6wjvQNqemyvbcZfuJZLNyg@mail.gmail.com>
X-Gm-Features: AUfX_mwUf2c-_Y4UekW3PrE8vLF_7BJ35RTcEyy-SktxQFNLjW19tbLMp0sEH2A
Message-ID: <CAD++jL=Xy_gdJ0GRtKJJRgjwWgpK6wjvQNqemyvbcZfuJZLNyg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 6, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

