Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F8FD65C69
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaQln5KFChsYDlbyGz32xYd/pKZvVrs4NRGdlUfoF8E=; b=qNihK8h+6+vbJGn+bfn4vKaeYH
	z1WnBJUpw5baSfORxy20DTIEyZxz9F+rt9cCqBMeKgjZ7PJhrG6/cqD8Ah1ubDrSuiI29uyHOJix4
	TfaokGHd+GVjVXHXHh5kS7qdomFQSQcTyopHnhxLIjlu4brmfP3o9dpJnN5KeVu99CFqVrnH/WeY8
	Qo/1Hc1Lqy6ZsDJIp29pgA3KALsANNHB9LpjF07byEfth9bNbNukVDPGWfYLCE8iG3fgxWYIU4PSA
	0HIuKcGJFcXBPVTnIvsy1AqJL0gRVZlLCdMNTvUQryNgHyWGyHNL1i4JYRYnrkxI471ZSRf0HM4ny
	ZZ+0bB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVto9-000000072TO-2HOV;
	Wed, 17 Dec 2025 15:51:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVto7-000000072Sn-3UNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:51:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d52768ccso45074745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 07:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765986679; x=1766591479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaQln5KFChsYDlbyGz32xYd/pKZvVrs4NRGdlUfoF8E=;
        b=mMKWhWOMLEM921tXbdSdEh6jeGjKuw13y3r2lbwDhzCJrz40LBUkiezgt29TxogFJO
         Qu8IJf5dw/A8LVLQV2pE9FhCtamcg4nE24HPHVjVfirKe0b2OyWLuZdT66m6ti9j1Im7
         WJT9chUK30MUL63vH33rEsWo0/mJ5xJwQzKpgDluTtNbAeblJ5ADq207h49JEqCQQUvL
         /57SsrH0dk+6dcHRlQW0w0iM7lDwf4CG8actOA9CmrKrl36FmmXOYZgEp+FTJaz92bG5
         c5+JO+xbkAPD8teuJ7da8lciHRQhyCVr2onR2MdgzoV6Bu3DOLk7GxRW5ewWu/3CcDcB
         6zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986679; x=1766591479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UaQln5KFChsYDlbyGz32xYd/pKZvVrs4NRGdlUfoF8E=;
        b=pD08CorjdJh5pqT9SZEkFDg9pZo2zcRzKfElR66CspUO67TKt8Yz5V2c9TZR8qoHg7
         Dhh95N75nA1how3zSFuq/E4/c8ysw/u2x0IT2QGsGf6P++EKR2ePo3QPQkLYlje5E15m
         PWGZ6aaQgpLZ5INZX2Nk+l0WCjgSiyTz6IC+Rd3X37WG1oHchahJns3CYXrd10cL4uiE
         u683DRqN1eHRhP/URcT/bYyyKDhDdRmc9dcqr5fc5PfHXjMwSnFpbBCEM6tQbKy6pSqI
         Xp4+aSa9m2y9cnovCf+6t47lF015qS2rlIeL4r2CO6TeIjWz/wUfEsd6kQ4+Nzvd1BGG
         4+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq4tkkV9izhze73si1kv60Ep4addYWOA0fwbxKWfCcjhhqmRDX9WhGnnbDdDgMxA2Jw/LBOjEUSaDMTagchbzO@lists.infradead.org
X-Gm-Message-State: AOJu0YzNdbeM8nfVUyZDEpJlcFUyD70s3DM/Iz79lZ8S2z0aZwAMsg4M
	e3L4fGGsERkjvnqy4jgt1ASH273vEPZFfCaZNhxMprJw33y2kGJRYpCQwL7p56GgJmWS/vo7Usi
	iy+4ldBIFYZyc4R7cIJvrdavVkHaz+wc=
X-Gm-Gg: AY/fxX5dONacMbVTpZa5zuaJ2RhB5/Ap2g4NMXdrxRUEVMp2apJbPokNDXTvFZvPC53
	/5p1mvatoOEGy8EdjLbbnP4UuMy+Iib7ZJhcQwducu7b0RvPk0Ypk4U6dMWntMbjw/HLaSPIlw4
	zsyDLHRnX1sA1uUnbgVsknsD9tID8fBM0I12V7Nwi2sIYoixMOtIooyl7e3Tb4ottsa+X9MmI+7
	Brw9L4YmwD6YL/aK/a2XB9pYlFzJ9K82XEAGQo/yn0eiN8Jr0/UXAGKCnGuXDuqTl1S05ELUA5m
	sYdewNg99JN4
X-Google-Smtp-Source: AGHT+IG18aJElwDN7YRoQnIcAwDG0065E0+p1N7BsBoJnGjywb6Nug0W+C/xZ5Tt8D+SSlmv4DAlXZUSoIL+EflnzPA=
X-Received: by 2002:a17:903:41c2:b0:2a0:9923:6954 with SMTP id
 d9443c01a7336-2a099236ad5mr145593875ad.27.1765986678903; Wed, 17 Dec 2025
 07:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com> <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
In-Reply-To: <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 16:51:07 +0100
X-Gm-Features: AQt7F2p7Wlo1bqa7Hg62xU3xs1iBlgAI4mGSUgZiNcPZaNc3prffLkE7u9Mu5-Q
Message-ID: <CAFBinCA19ws1OmfZLh+OSmiEuvY4owOKyzFpaz5KO6E8HaKmmg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: Add S6 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_075119_873434_FEC55BE0 
X-CRM114-Status: UNSURE (   7.91  )
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

On Thu, Nov 27, 2025 at 8:30=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +#define RESET_BRG_MAIL_DMC_PIPEL       167
On the S7 SoC this reset line is called RESET_BRG_MALI_PIPL0:
- is MAIL <> MALI a typo (seems like it should be MALI)?
- and is PIPEL <> PIPL also a typo (I don't know which one is "correct")?

