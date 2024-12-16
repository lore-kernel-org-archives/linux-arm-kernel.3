Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4537E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr35VqwgweA69AHCsQwnqUK4U36oZgsI7Vqv1GiCVuY=; b=juLBmk+5AnBKohkJ879CraN1El
	3pfYpwCd9BAQ7ccrauOJaLAirzr8LsNk25uHey6GAs4tOi0Wm619kOHPuQ6q9YICg4NpUKD78fzZ1
	Vps7JWPeSLm9Qp1RNVpdFj1g9zseIjZPMu6gIiFE95d03KoglHGY0dBFeFSddRNgtvvLfuXxGu5Ou
	kb+Hz2jwfjk0fUUboM1UdP73xLVrzddlPmoS5GfXXOyVHMZq+zy8vFI6vfnNAHn3a6dsSRsLmQDGe
	yGqvud0adY+vtyER2uE/6s8ZwBfPlJR/C1QMFr7dqcIVQl9ScSvMZ9Lqi6RpUEd0875TKTyNSwxrr
	scDsq3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDCO-0000000AR1j-1KcW;
	Mon, 16 Dec 2024 15:39:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNC4M-0000000AGAu-20BB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 14:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mr35VqwgweA69AHCsQwnqUK4U36oZgsI7Vqv1GiCVuY=; b=JxSL5qm8gfvNIFFyxZiBQhxDhr
	P77Pcr+gEIKnM8KVn883PEYi18/L0ISS+uLR3eEX4sbYWB/hKlP5I8qvxNWxAT/mhgXcrNDCHh26v
	NNlniA0Ro5JdxfQyQoc1Ddu2RTcRc850wFEynoR1l4EozWlhy/vTMfT0kHg5tjHS1b6xpWOg+heq5
	YfPPl0YmnNUGJO4NEFmBHqU2BjHCdlee5Bua4m5oMSte/qvevx4P1IT0/ppmVP18/OzIU6AYRX43D
	PQlYR1wqjAh8DzQCfd5xSRxxS+7mZhhNnvCBfdapCZb5/sJ1bErBQN0rfTXM9s0Vp5QoNeKPd2LK+
	Jc+ieALw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNC4J-00000004rBF-2BuY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1004B5C6281
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 14:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53F6C4CEDF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734359246;
	bh=Mr35VqwgweA69AHCsQwnqUK4U36oZgsI7Vqv1GiCVuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fro3i912XCn1bOY2tqDZK1/F3kQ08RLKElLPkKR4AjpKHSvzjQNUBV9O5tO0vePg7
	 etDP1F62WwqhGNXW6m5w0/wQRuyaAIRyTUKWR8lQiqGi5s15IQAH5/GN468+K/baS+
	 Ym11OmhuaeXJk76uyVqFFeePTsyEsrv5ZZs86x3Z9nP6qSWkpQU6Bp7ok4Nqyzs50N
	 WLzw3jddrXnlZA1cEYo0Bei6COMdjRGpJUFd8OeRayx+LzRjLIIL/wOBfJMI2veFMV
	 EZJd+/wdLl1fEynZhgx0fCRFB8VVPuJ/5m6G3fCU64sTC9Uz3KQoLTk/k38U4mhQRL
	 2/8eSjDm11WEA==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso2764699276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:27:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQWnesSdbsJgKlkePwxYG9CHX/DegkA/Kri78+LItsSq3gAYXpTwllrjfXvS2hc8Z3aVeHfV7Hc5y1SjsHeiWE@lists.infradead.org
X-Gm-Message-State: AOJu0YxRAh68gfx8QnPBK7150uSh795NXyCEwjlbhHbsOoK/XQOKcM81
	BT9Jgjp5CHvqF4kWML4+GuDru2OHNjAKQaM2OJVVE8UZzd5KBD30GLFmz3hkAEPs4AyI8nupQQ9
	8APpTBIYWlUON6/gyOrIWXCiqDw==
X-Google-Smtp-Source: AGHT+IF+SzaoPtVSZAlJvWgwFl8E44ixi6sB1aULDbhwrV6Mys2MrEPY+9ulABzQBZn3pK8qf8Lpu1q+VL/7Cde5Jk4=
X-Received: by 2002:a05:6902:72a:b0:e3c:7b6c:9d1c with SMTP id
 3f1490d57ef6-e433f94c771mr11142194276.0.1734359245885; Mon, 16 Dec 2024
 06:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <20241216141846.GA71151-robh@kernel.org>
In-Reply-To: <20241216141846.GA71151-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2024 08:27:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKNZGwgd17q4Em9-fdVLgTsjLYnVHEXjDcH+i60b1ssdA@mail.gmail.com>
Message-ID: <CAL_JsqKNZGwgd17q4Em9-fdVLgTsjLYnVHEXjDcH+i60b1ssdA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_142731_837802_36ACE93B 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Dec 16, 2024 at 8:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Dec 13, 2024 at 04:44:39PM +0000, Peter Griffin wrote:
> > To avoid dtschema warnings allow google,gs101-pmu to have
> > two reg regions.
>
> It's not a "simple" syscon if you have 2 regions, so put it in its own
> schema doc.

NM, I see it already does. If you keep 'syscon', then 'maxItems: 1'
will probably need to move to syscon.yaml.

Rob

