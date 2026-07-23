Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C13C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=; b=azdiJ9hPjycaoazCg/BDW9sddG
	vRgQjOrQiWgqI7xnJBqhZiqQQTUXeY45Is2fI9hnxD14OsgVCIKXScbpdEcxzEDP/d/FKJVhBf9qw
	o6L1sz5OFgPjNgBrXLvZ3HbuUi60kLBAXLGvRuixUPd+WCVmn/+D3Nkc3sATGo4ZTuaj7+6Ui2fTW
	lyFPypzx+DHbT9/uLtaSqunfceRmOD/GWpOEK6IVjSCpUhXE9ndLywdiWDiWX5G2STOVa5UYRa/+Q
	MnBqhR/lgSUSLNpXqPpfdYJkBW3mcUQ/bSGz3a3QrHmml3PZdCcS0xKYdivH9tV+TRErS/8e36+wv
	Wkbkm5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0qd-0000000F6mL-0Mb1;
	Thu, 23 Jul 2026 21:20:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0qb-0000000F6lu-1kRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 21:20:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B00660A67
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EBB1F01558
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841652;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AC80BQrM+mZEuEbTRDeEHKTd2K4o1FtgzmYWxV7lFZxddMJeWQLw5Ab3v4hiTou/o
	 s28xK1btB33mEEfpyG25JwMO47nrPvi2YZ9+69pJMqNJPP8haW6HKvRoG5iZqvrGOE
	 9ha61SfHC/ByikyByFo0UHvfTi+lEZyNhkqiJ5vx5q9UocAKfJN9VdlaX8OSZAtssH
	 2R2WECm7Adb7964k06xnaI+o8ZblKV7HUoVJQ3nyrAsOGlfL1Na/48HEidHR6jvb5f
	 h0abdo29MjZh/P+ZznC+W0nfYgZcOhzVOV2UAL+9YA2dMPcDvdLeHt0169TanoAPKt
	 ++HkyQhy7LFkw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so1077620e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 14:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq1FRbqYWYhVJi9sgBB5Oy+SIGaWEr7DKajxfkj7yYX/lZcf70eQzOp2IijELrkF5FD4mwVE+T/owhRRmeB4q+I@lists.infradead.org
X-Gm-Message-State: AOJu0YxWfnULFSYO3lFHdMQTi6MVsvOC7qLlyNf5nzKBz7pB/dssP4bj
	T11AVyW/JzgTLi/m2utpkS1v4M57/j66AikSi17Yqu+9APyQi6zjaQ5mF+C7VOMyVBwtYXier1t
	U60UI9LJfuwYGiswm0jhrp18Plrxzzdg=
X-Received: by 2002:a05:6512:40c1:10b0:5ae:c34c:aecb with SMTP id
 2adb3069b0e04-5b2b2f71273mr663306e87.41.1784841650927; Thu, 23 Jul 2026
 14:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:20:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
X-Gm-Features: AUfX_mzO1IFYAAzmWCaGdgClCyXt3fIPpy3GNEwr6OblEvy3QOAx8n-oSARvnK0
Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Mon, Jul 13, 2026 at 5:07=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:

> Add support for GPIO and pin configuration on the MT6858 (MediaTek
> Dimensity 7100) SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Patches applied, so we get some rotation in linux-next.

Check the Sashiko moanings on the driver and address with
follow-up patches if necessary!

Yours,
Linus Walleij

