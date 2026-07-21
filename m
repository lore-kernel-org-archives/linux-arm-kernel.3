Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C26C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkJHITvqX1FWX4L63OpNnz2Qb0aVsri/wXqI3fsoexw=; b=mrH6zm9oLzPLEuNTAcTJZcQOs7
	ksg0tWxII+m8Ey5UJ0Zy59jXeIzreOCLOX+udBVj2F5QDx9OYNKkt2dZhYPfLI9UMmAh/KisMFHBt
	JozX8085qsjFEqmXaHMy4rFTMtSdSfdxymAzu3Purr+jE4QVSiJ94YnoPhJB7z7b+3dEBv8MaVqOa
	O33SmdQmy27+6IjVr2Tn1wluQULsrcN0Lw7LhpGe1uymqhnQ6Rp9oFqWZJADjWjv0ZMp6l3FAcSRa
	l5RZaFGk4XB4kDQCaYxir974/5mRypMRVXjaqKAfjqZ8RQ5NtmCOVxvsnZpWK/tfVYPpPw6jVYa5P
	mSlaYotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ew-00000008gmo-3T6Q;
	Tue, 21 Jul 2026 07:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ev-00000008gmL-3b8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E15944EA7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814131F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620209;
	bh=xkJHITvqX1FWX4L63OpNnz2Qb0aVsri/wXqI3fsoexw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eoFPW2OD7s35Azw47YLLuikvix+UDF0w3sqdGWpfkJOeyiK09Fda4d0fyk9jUl7si
	 OWojPo2DlQjfjcU4fw+RMJIn4/Mp/2FOQKFNrEZPr8Bs8aZ5Fi1z4v3Z0lR2IdXJnO
	 eInAya/5/1oriC49/F1qvT5uA17CEP+nNEKuPD+czMZp574V2gfluiK1GzowZK9mxu
	 FJVRlvUdYUGS1VVhGR4beeQ0F0qvp2AB+hVkTh5Pvs4d1kfmIM7mBCD6gPVQTUJI/a
	 kh5kYFcyTFomZrO4NCQNzhcExq7n+5tplAkoF7WuocSAUoEgJsX6J2BzGVcfGyTqce
	 ltFpvhJfr/xUA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b159850b16so7284959e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDQmNNLoTtxMIPm35uvYw6dfCNVz+nlsREamCJwAHnpBqQOzufq18rRcOmOjqIIslVYMctidqPMOIAE9YlsbzB@lists.infradead.org
X-Gm-Message-State: AOJu0YzmAuUU2yNMsbwHx171z/3WhakoCVC1ddmhSZmsBFV6oJRN2Ojj
	qDNL2eGLoADbcBVv2MAXT0lV2RJxGTi/zGt1y3cDVEIpj9l1Jvgo7w1C9abc6/7xBMsZriRCbe/
	GeSdO9mpSV7p2Xuiy494fORYxT5bIBPc=
X-Received: by 2002:a05:6512:b83:b0:5ae:b5bd:5e72 with SMTP id
 2adb3069b0e04-5b28fabb816mr3793719e87.59.1784620208288; Tue, 21 Jul 2026
 00:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-8-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-8-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:49:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkzDDC66KjyMGommrC7T0L5KW3TA+JLKUmNf_psF-eRuw@mail.gmail.com>
X-Gm-Features: AUfX_myAPX-Fx-YYXrqqVAT9emnPnmjb3E1aTj_6ToEx3OEbZBmyyuGAfe7f9n4
Message-ID: <CAD++jLkzDDC66KjyMGommrC7T0L5KW3TA+JLKUmNf_psF-eRuw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] ARM: configs: sama5: enable Microchip/SST SFDP EUI
 NVMEM layout
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, Jul 21, 2026 at 7:31=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Enable CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI so the factory EUI-48 stored
> in the SST26VF QSPI flash SFDP can be used as a MAC address on boards
> such as the sama5d27_wlsom1.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

