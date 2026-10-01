Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC972CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVL0YicU6s4vWnH0QGlqg5VqXOz3HA74QxakKY7UMwI=; b=ZlNr7kDjvr8Ny/hhSJCBjC1QKK
	utAABM5liZlKcEM94qEbTS6zyBSsShfKXc25K+M2sKEQ4cGYcTVuiqxbuWqsYI79Zu03MhYn1dzFA
	SokkkEuKV7saOtbh2OTEofcAmVlT40pLKvp1C5mS5/vJ4uskpZVJGeaKKQZW3yye6KOGZltzhDF7F
	didJKXSteX924/4UBLDBsvHdVmbPyvWtLeVyQJoNJnkzK/r6UgiFrjsfRHlRDBCpBRiXhpMQePRIW
	Mg8dKB3RAlanvKnwSyvoKt9a3fzHrfNL5lcL2tFb+0hRC+B60Tam9HkXED8x3kVRT4Bd5NeoS4eB8
	0TzFH2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Kt-00000007or3-0qD8;
	Thu, 01 Oct 2026 05:28:03 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Kq-00000007oqa-1wwr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 05:28:01 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so32151665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832478; x=1791437278; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVL0YicU6s4vWnH0QGlqg5VqXOz3HA74QxakKY7UMwI=;
        b=Sdx65ifRLYIPJxuwk562rfVeH0ZJ0a5XY+CCxYbM/7S2p8PjKcVyHkvgjALITfHVir
         8JbPPi3BhjvMWZkBr8DBSRLHZgwg1hb0NQdophIHFDE+9tURakYdhS+sZ/dk2wwuImnm
         5KtM5U6NR2AuSTTmaeCnVO6tm/ZU6DtCy8KoKTXdW41agaHd4fYmJPzVGDShNzpJ0YvN
         RnKL/0zE1t4rikWkGiZ426MjTB90mFI61FAV91wZHg60X2KZdEO6hGEx0iBNDoHqq8H4
         P9oTXaeoejhZURaSzLa8xX7v4n4H+Bhq8oKWYHbDsBZqhzAOaiRJmbrpoBneDgQO2hc+
         fiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832478; x=1791437278;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVL0YicU6s4vWnH0QGlqg5VqXOz3HA74QxakKY7UMwI=;
        b=0LBTE1BNY+t/nvhzSKvMU8T9cs9DCZACAzRcqTW1LOMN2Pzh3rccoMFOj5lRi1UjOz
         +Beu/fR7osccCcSqtBVUqU8N0oqoMVhlhkkaqX5qD0LmFcQlCUZs8O6YApBDX1G60yaG
         WLln9so0uVv8WH2qYSsPRTC5eaOm9E9muGxkZfUP3++rEBfXqRzdzqIdt7fYbxIXWNqE
         eqecUi644+efZ8sWhtIsZf/FCqyeK+NMfFMWpY7jaw4ZoZmDy9HJxGdxmdvnYBe6FIfe
         5RqSch6SgUgyW5Cc4y1cprFLoTrGto+ElpSshldZ41mhBVrIditscDw5fJOizab6D7D1
         eJpw==
X-Forwarded-Encrypted: i=1; AKwUvBwl22QvXjuaEFzphQsSxAjoBvhPPxKs9c3Dndxh86t26hfljC5qx07x2Mm1Ir5bcSuuL+sTo1nUnAwSRYWNfFfj@lists.infradead.org
X-Gm-Message-State: AFuF++mF/oUJqtDrYdKHdwmiz4zc21/Fk3FG49RW0Q4lyjXePhvwVhaV
	WQQjF6MYoDISRP4LsHdpU3NxRMQzOh8S1b2bhJz0GT/VJjaOOM1EEhQAPHDrgsLCPfZQmD/o
X-Gm-Gg: AYBFou3Ulh8Jrc/R6Ul8tcXep3vD+RcHn37ZSxo9cUdmEIC4LKIy3dctQccHyNjo0tP
	NLw5lKRGx2+IPv6Fn5oYkEFjA4ZIyg93Y/HKB+X1BKGh8EZdAupjnqxgaWYndakK3GW/zb85a4v
	M4oMX4kADr3NaIgKPa5EchSLAnesZfCsaSx/sJSwmfadKL+QOkRv3Lcw8uifiZMdH+dKfwV2ytD
	GWEjUJqE+oldsmdYv1N4ZLkAzFKngfagD9tERRwzg/Mvaz/9DCwV7BEWi/T+QADqNBIVbysl8jE
	i4xTDR0NOaSmwpaoBq42fk8MTIDCtWyAEJetws3RXvIQTIUl3wXbynlY/YRk6wugBJdPTM5sqnj
	6G+dXH7vZwvu+/K4e46D+yM9Pa1dSOZUaiYiTyFR/V/r2zVWUpaPTg0K66+ZMjLTiKUSakuRQ7V
	b9fUeeDMmoPsKND4u9s0A7f7Ws4auSTU5TF/Rb1jqwgwXMPm14sff+22CVkHRenG0zG2VuYWBRp
	t6O2eITNzrizF1fIWkEftYRlAb1mYNCf10PY8hPPzg=
X-Received: by 2002:a05:600c:4687:b0:4a0:3a3:33e2 with SMTP id 5b1f17b1804b1-4a01adde08dmr57434805e9.5.1790832478268;
        Wed, 30 Sep 2026 22:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979c05sm64944975e9.3.2026.09.30.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:27:57 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 08:26:39 +0300
Message-ID: <179083239972.193541.4791387611943615705@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222800_551657_2D0E5C41 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Oct 01, 2026 at 05:14:59AM +0000, Jason Li wrote:
> We agree with the approach of using a single UART driver since the
> CS75xx and CA series share the same UART hardware implementation.
> For the Device Tree compatible strings, we would prefer using the
> "cortina-access" vendor prefix for the CA SoCs (e.g.
> "cortina-access,<soc>-uart").
> We do not have concerns with using a neutral driver name such as
> cortina-uart. However, for DT bindings and related documentation
> describing the CA devices, we would prefer the wording "Cortina
> Access" to distinguish them from the legacy Cortina/Marvell branded
> devices.

Thanks, that works for me. So for v2:

- drivers/tty/serial/cortina-uart.c, SERIAL_CORTINA,
  SERIAL_CORTINA_CONSOLE;
- the CS75xx parts keep the existing "cortina" prefix
  ("cortina,cs7542-uart"), the CA parts get "cortina-access,<soc>-uart"
  when they are added;
- the binding and the Kconfig help name both families, as "Cortina
  Systems CS75xx" and "Cortina Access CAxxxx".

Arnd, this also answers the prefix question from patch 4 for me: I
would leave the CS75xx compatibles and the dts directory on "cortina"
then, and use "cortina-access" only for the parts that Cortina Access
made. Please shout if you or the DT maintainers see it differently.

Thanks,
Fil


