Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A60C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pryg4BOjErXSs0Xn2yHTUz35QCoY9O3vsgYvN0uOPVw=; b=2e/jkryiUQkna4KBpRucoIc65D
	dTcVohIiHTRcpEvsBsyUf9HXhuxB+zM1MjrzN0f0PU/mHm35oVB416vPKr/uJckq+s3iHPHU2QRkJ
	Z4ekRArRDjgNX94rvYSPhATcMxknhUW31dzzAsN1jn2bDXhXiLsZ+05xxgUpbBSH7PRRQPGBFqyRP
	u75Db6b/Yc+YlT+1wphvD0emSGkkcGecHnLDWUij2e7tl1RCGKRGvdWKYBD9yLCJlwKX7kugvtGKs
	OD1PcGfbN6yRtHedtQb3xoLyl8xwnIbEkf4vOSAHj9MO5wlAdXY3gNZWvS28IRRX6NNLh01CgCWeb
	Xo3bXc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gqR-0000000932X-25Sd;
	Tue, 29 Apr 2025 09:01:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gnr-000000092aB-0JFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:59:00 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-310447fe59aso65591101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1745917136; x=1746521936; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pryg4BOjErXSs0Xn2yHTUz35QCoY9O3vsgYvN0uOPVw=;
        b=keRmYynEuq/zCaM99wuzIixSs17s4v0wfV4kr4pgWJxclOUn9M+w6UPBBNZ9GEXOFy
         7s/99oq/XpWTaaVc9vnwvJ4c3GcU1+Exj4R36UifHLNXvtZT9w2csQPySr2DnkAgx+cF
         Il2Tmp7PYXL5wf+E2QHEajmIwEU7HzEcjbNIEhb7oEBS5yWjPoetJNwJtDbZKaAkej7m
         SFTRVb26gom2f4I2kWrvyEXkWQteUd+MIBWn7lAxB3I+3kkaU4N+tOV8LyKav3euSoco
         e0MScVQWwMI6/2IIr80zuwlclUUleoGv9b5uNpJGz23cP/HY7TBPzlanO4Cq7D6JMKxO
         pB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917136; x=1746521936;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pryg4BOjErXSs0Xn2yHTUz35QCoY9O3vsgYvN0uOPVw=;
        b=gyWSgIzR4VVtP9igPmgKiEW6IjvCwY+INl+zkt54h+BqFTzMy38p3foP81KqcSnb8r
         VqcpE0n807NuOY8/UAE00Aq/Bt2+MOA+eHvbvvSRCBI8c65Q11DoNzw/hVfQEmtyyqCB
         /Xusj8Cyq6YIpTP7lI1oIOVUSYCBrMb8RBwvudvhpgfi9BUD/mKHxcLFmd6aQ9EEOkY2
         XjFkvaYVIuYmU6/pDQLaQJRdZ1LI/WmCrjfrxE7DqkUrYWdC5XwrS6mE73hW5YZ7RkVm
         +CoetqG0WlC4H34EpggCseuOzWTI+mjPU3O5Ay5bW0haWw5Z0Dq8LZFWFdgrZJovfcBv
         MAwg==
X-Gm-Message-State: AOJu0YxJowLAGUuBSwVYEfZyDEjNAGFsX21URNAbhkt/YPbb6WAAjTrQ
	03isXaIMjwt3IzI1BVa+bwoK7nSMKSbqbIvHBxaQjCXXsbR7nVClMgjQfBW1uUNQYdwJXrVKT+h
	kts3ShKeKW7KKYDXLI2VdD/OP0afgF25/bsY06/WTQr4G8q2i9dk=
X-Gm-Gg: ASbGncvWCpO4yqcUf9c4NjAtZbQS2FRfXtQBuXLdoF7IlXlyLJ53hv9rH1NJU9Cs2i9
	zkhr1aXcdpbVCBcKlDPo3MkNqPT3szaoFNvK87pgVjlYBaH6z1ncwpWR7L/T+U11CmcP32ZK8Hc
	RtLIK9yY6Qhc41ImDb70lxVA==
X-Google-Smtp-Source: AGHT+IEO3BJ8joM1Fb7OTOGcMtRtvqTiiPZCiRSmO5TgzokC5yzzbwL9ugJzMkP7dPAim4SZnVBszhXqICAvjDabWRU=
X-Received: by 2002:a05:651c:1506:b0:30c:5190:b264 with SMTP id
 38308e7fff4ca-31d34c61109mr8012211fa.20.1745917135739; Tue, 29 Apr 2025
 01:58:55 -0700 (PDT)
MIME-Version: 1.0
From: Zixun LI <admin@hifiphile.com>
Date: Tue, 29 Apr 2025 10:58:45 +0200
X-Gm-Features: ATxdqUH3W8ubinIe5leGWwyad8aSOdWOpnbMfl7K6pol0JPaGAGuOW-Dv3IjlyY
Message-ID: <CA+GyqebJPJ-EDd3M_mvfjeHEhnz_L8sTN-T3e3SV_MfdLLoLVA@mail.gmail.com>
Subject: sam9x60: how to select TD_SLCK instead of MD_SLCK for PCK output
To: "SoC support'" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015859_315304_98E9D5B5 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi,

I=E2=80=99m using linux-mchp 6.6.

In order to provide 32.768kHz clock to a SDIO device from PCK0  I=E2=80=99v=
e added
a mmc-pwrseq-simple node to the DT:

wifi_pwrseq: wifi_pwrseq {
compatible =3D "mmc-pwrseq-simple";
reset-gpios =3D <&pioA 14 GPIO_ACTIVE_LOW>;
pinctrl-0 =3D <&pinctrl_wifi_pwrseq>;
pinctrl-names =3D "default";
clocks =3D <&pmc PMC_TYPE_SYSTEM 8>;
clock-names =3D "ext_clock";
assigned-clocks =3D <&pmc PMC_TYPE_SYSTEM 8>;
assigned-clock-rates =3D <32768>;
};

However the output is inaccurate as internal MD_SLCK is selected from
TD_SLCK, which is confirmed by a PMC_PCK0 register reading. If I set
CSS field to 0x01 manually, PCK0 output becomes accurate TD_SLCK.

I=E2=80=99d like to know how to use TD_SLCK by default ?

Thanks,
Zixun LI

