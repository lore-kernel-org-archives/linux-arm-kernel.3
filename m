Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC1BFB44B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpxWNvuZBF/AXFXGdRoVS3Cna1SCwpFmFSpCgUaRWus=; b=ZJQF5qPR2rnaYJ0WtMhNPVFOUF
	IKBhP7/tJEUZDxUtAd1zOWrkBe4FsVXt66geQYTLn2A3owz7FmJ3IUXc6lqrNqX5d+G8ZDLaFdw81
	Rd1IOLCZgyUyovPU/6x+SKqF/UZOaEC3koCZFwDP+32eAMxv/Ec//m4uVnsLyT0VmBB18G10AROHQ
	pSzy6pxm0JX45wmfi8XVpdV7bYr8kpL4vC/GSDBJnLR4UO4zUUiRGtHzbzk5fIFhYcgREACV+xd7/
	nr/PdgKaYLS9xLfsDonMQTw+/p1eyaOspr4MII54yUnCHVAdtjqHCR7ik0dGgC/UGz3IiEWdqUDL+
	CwgSBn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAWJ-0000000ClP6-04Rm;
	Fri, 24 Apr 2026 07:00:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAWH-0000000ClOM-1qzr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1076D43D6C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E590DC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014008;
	bh=TpxWNvuZBF/AXFXGdRoVS3Cna1SCwpFmFSpCgUaRWus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CN9u3fR7Yp0EfDsHMVAxRfxsH5B6WA6Iar+8l9fO3A8yRKfDRsLvxXsVGyxLeRwsO
	 PASGGICj9VhJE0eudRV4EvurXWJVDlRZIGA4WKa4GdUrOr06p33c/9R12qdd/q6HDt
	 zQ+eyYbfn9F68Tt1XBavGTxPoROrin/g0A3vTfqzGw0r/hX5vqtCpLkS32plzVO2Cq
	 FmvKJpJo1LDhjj60Ex8IGTReJ8eQ7FonYiudIGiO98DcmJfOWvS/tAsfeTT4q8k3Qb
	 rouwBrQPg7wa41QzKrtBVQoHZPqTFFRYy6ZeFqwEgwGWf4/SS/Nn1l7DfVWo4r8xJB
	 KUL1HjFt5xavA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6833137e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:00:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UzYDZtuWkRptzI3i61KAWCmn/m7hQeWh3vL5d6HbbMzEfbp8wScHLlhEoQU0bk2xDbeb0yV1PyiiTzV5dwltY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/BvBrYvcVZlV67FmDsY6C4DNpIiv4M39Lrw0NMzglxQa7/x4g
	vYFqphxRbcMotm17nX2jd1XG63VxLncMTp4mubVoOobXNnvz/3GRuYuzmUM8N++OV4mseK2hitl
	iFVIzFHaQ0GuEPaKcF8Ct0rJL1j4RLyo=
X-Received: by 2002:ac2:5ecf:0:b0:5a4:1904:711c with SMTP id
 2adb3069b0e04-5a4190472a2mr5930173e87.29.1777014007583; Fri, 24 Apr 2026
 00:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnX8Mv=4uhwb8aJEhxDOxb=GUu+XKyzMt6YFR_oSzAo8A@mail.gmail.com>
X-Gm-Features: AQROBzCezkhG5rVZuAsLKRZJQW_-XQj075uRjGqqi5ZFtmzCA2vb_6WAeCT3IWY
Message-ID: <CAD++jLnX8Mv=4uhwb8aJEhxDOxb=GUu+XKyzMt6YFR_oSzAo8A@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_000009_504038_F30C501B 
X-CRM114-Status: UNSURE (   8.88  )
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

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> QCOM_RPMH and QCOM_RPMHPD can be build only as modules when
> QCOM_COMMAND_DB is module itself.
>
> Fixes: 1c25ca9bb5c5 ("ARM: multi_v7_defconfig: enable more Qualcomm drive=
rs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

