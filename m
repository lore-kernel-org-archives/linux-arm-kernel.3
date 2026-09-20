Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AMZou3BZexPhp9w/h5VtlhpWqxxliNTreCtBnAhm7U=; b=NdB6aFjSsZn9nX
	+DJUGD8d5LqPyQvKyDy8pPwT1oMxV6LJw/Qzkl84DMm0oVlNxUSkbWbNKM5xyW/SOUySf4ZaTyLZ/
	UMdrZIaRcoZqxawOG2qV509Ctdpn1pG3JklOrOrnkP0tyeguNQACZ8fNJpnE9TRI0yM69EnP+Jnk6
	e8wgvpq0lyTl4rA4LLjye6qAlLsrFkyQ1YvzFq10olK6fp53yF2U6DTW+jhcrB9QyG8er5SN/CGwk
	dlzkoej168YigyuIy04X6EpLyWGu+86mx97FppMdaOTZ9JX8B5VJ2Cw24L7O/f49bPAfHIX7fbC8i
	FmeLLNwFGTGjpAEpAB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8E1f-0000000HCW4-2kPg;
	Sun, 20 Sep 2026 09:39:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8E1e-0000000HCVv-1xmm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:39:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1110144020
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 09:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0111F008A4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897195;
	bh=4AMZou3BZexPhp9w/h5VtlhpWqxxliNTreCtBnAhm7U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=f8KL7atjNwkScTIsSWnT74N9Nea2wXa3T0R6qm6PFRZGMBOYoBpx/NfQ+5+zKQRzG
	 1hJ4/Oz0eEfGxs13wslAjjzeqPnxrWsVgzodJBY4R6+lKjnS/F6uZNuqUbjEc7kwrv
	 AGJ7PJqIiT8Nn4xkYGPwQxsosMlZ3SgOkh12VNFr6xNJ7yan8VBS5C57ccqEzvb5sJ
	 bTlbfF0djSJa+T+vUcxvOonapjr+c/uue5toXN2U0k/oPVreBXWZfUoxG2GCbop0hN
	 qKhJuU7hH8CpDh9fCQi2+23blEe9ya4S1PXImMBJySUloqERntexW98lNRHDm0WU61
	 1obNtU5/4VlxA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a3156692c6so13651451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 02:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPxyLVdRubHnf6S/DKvaiKGR7Gj3WaJXBAxxdORgk+ApGAQWPWk1xxmiqOXtCj651A4EGA9VMOy7rl4ZjWU+tZ@lists.infradead.org
X-Gm-Message-State: AFuF++lFJrr3KhMhSV6QKVJg6XuKU1vJlnZB4WdCn/2Ln4AScqHhbzh4
	YZ9nUcuvC9cSQqzPi2XVANby1hCqFmX58px8OXkNEXd4vQ0+N6oiO9dcVSv745kYHYAa/DYpVQa
	sJBWbhWkQAMbEbBLpMQtaDtLlGF3gNRs=
X-Received: by 2002:a05:651c:2127:b0:3a3:74b7:fc08 with SMTP id
 38308e7fff4ca-3a5fbfd4f36mr17073761fa.20.1789897194049; Sun, 20 Sep 2026
 02:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145527.18148-1-iuncuim@gmail.com> <20260913145527.18148-2-iuncuim@gmail.com>
In-Reply-To: <20260913145527.18148-2-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 20 Sep 2026 17:39:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v65v=2kC-9GrscGi=RXuARZYVNkmEkNhQZ5fFXnQsmL6BQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xk5hFqet9lFlmVe7uaLm2rV_go5OhWrqP8yaEGk0kqgWkXxxEJqM8dWAo
Message-ID: <CAGb2v65v=2kC-9GrscGi=RXuARZYVNkmEkNhQZ5fFXnQsmL6BQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Sep 13, 2026 at 10:56=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Add dt-bindings description of the thermal sensors in the A523 processor.
>
> The calibration data for both thermal controllers (THS0, THS1) is split
> across two nvmem cells at different offsets, requiring the two cells
> to be read and merged. To maintain backward compatibility, the name of
> the old cell remains "calibration" and the new cell is named
> "calibration-second-part".
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

