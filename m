Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF6AC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=; b=kWDQboJs6AgoUO9zWON3kKY/wB
	JwnUsPyLye3cqh4QP8bYBLWZTWcCqhZ2hYRywb3rMyPW9tcRsYqDJnd/OTSaKXPKPMr/OCf5NlwGJ
	6LplN9h7Z8WMJ+BkTbUaIIYITdQPthoPAW6NwLab7kmOR0p+ehp/yr+GR0IDUspgPsqntX16JgLhE
	IarniAJIC5Ab1AWtV9R3DVYR1/Ax8Zg80DxPYii0koVrQnXNS2wm2djgV7mGLgrVvhZT9cK6Z5MMr
	X2TeI7AfwdV0DP3ASbh043uZ4rrQyem3RjlrL1uf5DEnHugo8ANwJT9ScQlGek0/WgPjfPAN9ujK4
	AUoLkppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgfe-0000000B3Ch-47oo;
	Mon, 05 Jan 2026 09:14:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgfc-0000000B3C7-1JAH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 09:14:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6934615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767604474; x=1768209274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=2bZHY2chWHb9R7o8s8kb3GAgXI8p/4L1Hin9f++ybe1DZptJJun0VsX5K+u75XzDaX
         XEgxg8IWtqN+YYkdtjw8PtgLccdQKoYBTM/fJDbcxrxe0VAGzjDdGVV2OJHoW60lz3UC
         Xl13sbSj8kv1//gGzw+hw8/0acBPE7A/fcbAJrZeunfJAXom9XLwZyKMk6c2RbviRPCF
         wL86RlPVOtzOczapbhUwGG+g6izWMl6EFqeVJYn5zIzvtkgoquHktKyadA1PgnzXdsdh
         EWpq2D8MZ7H9grb6PKSnlGEMbWRQcKiBhxF99accwGIYdZqTnic09N9sZStznSo2wffr
         fZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604474; x=1768209274;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=qES14EdQxXcRjSUi+GcL+Ju/3Lh+cyo+OQYpUzeGCQlm6KZm4i123iqbUsFkJOVNHt
         WTBBYNI35MC6PGFlDlenvi1qDGHMaB4EgJLAB5DKTlyyvj0V3D6AxD0z11fq4xH9TMVS
         l0s9VPWBcoyNJbLyTJzYTExDxwfJixxTsDqKFi88vaSzUswZr1Rd9nIws43hvM2LtRce
         wd41q3LzTArmA2t+x7jHMuptj6TPWMv/n7DIzQwJqXj80q1Y0f/iEoLU5jIihhDht/vT
         VNkXuMa935HfRPwROL0kOZKs4887QdhzCSM9SOhd6LvM84Xb5yOrNOfzyIt4aMRbpL0E
         mnjg==
X-Forwarded-Encrypted: i=1; AJvYcCXB8ls8zxeXaxnyg0MynvVVXPTFDii0bWSVDX/OFEJxAO3pbRbsIxCtcisugpzoGmYjKFZgz8MpE/uKDaFODoWf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJkKmevWdN/YLrDdY9mxNTkYe/7MxGur7yXIgK5ZeLrQsMI/4e
	tiOzgmMH3bK3veoAyiuUYt+tzB3dgoYJMkvAC9afheb1dn1raYrhemG9GmlOBOh5tDw=
X-Gm-Gg: AY/fxX4Fx+9oi20KebCUMp/WRZFpEwufX6443aaqehxvXxjQx6qTukswZxcxtmVFF+9
	fmiHSnoDPZOEsMnKxRiJNIxHhEaB2wM4R5Xa9SE3eBuN/ihProBC7eyKwRJ2G6NIwnpzh2IRKbD
	aCHXo36yOdyX/jJUIqoXlnY5FByFmPz5fxvw/ogq+t2cm4dEHhLU5v3F1qhhLUOs16htHtYFVc5
	KKljskN3hcHzrksyLrDdW6yL9/5Gx2irIczrSjPsK99FqZ3HI5RSeTUrxtMRXAyv82UVNrgp22k
	VGNarumhvTgOyQEGg7FB0CsdMqLlM23R1O1JdcBOvxSxQshLdUFtDwj4eFHYkzwd4b9Z+Ap+DWz
	Db+PTp7DS2/9lrTiV7+qN7GU65ROxHJtwZ3jAGEDMguVh2K+Pv37hBXXAQCzkJwS2vSWnDPivGz
	Lyqaqaz2RQ
X-Google-Smtp-Source: AGHT+IHg/Mv8ok8g3lfkv+f6Gs1iCHZthZ9+dvCaKIuCn41ycCh3KmnkNqkRkT2jAbCijygn0KRwvA==
X-Received: by 2002:a05:600c:4704:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d6ba8900dmr100501615e9.16.1767604474097;
        Mon, 05 Jan 2026 01:14:34 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b336:bcf:8603:f6e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d6d143f6asm147207955e9.6.2026.01.05.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:14:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com> (Chuan Liu's
	message of "Tue, 23 Dec 2025 20:27:39 +0800")
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
	<20251028-a5-clk-v4-5-e62ca0aae243@amlogic.com>
	<1jpl857e2w.fsf@starbuckisacylon.baylibre.com>
	<425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 Jan 2026 10:14:31 +0100
Message-ID: <1jldice808.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_011436_495664_59429CBA 
X-CRM114-Status: UNSURE (   7.20  )
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

On mar. 23 d=C3=A9c. 2025 at 20:27, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>> +
>>> +#define A5_COMP_SEL_WITH_TAB(_name, _reg, _shift, _mask, _pdata, _tabl=
e) \
>> No, adjust your main macro.
>>=20
>
> Do you mean to unify this into a single macro here? Like this:
>
> #define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>    MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>

Yes, possibly

--=20
Jerome

