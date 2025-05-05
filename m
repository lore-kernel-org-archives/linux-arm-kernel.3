Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B6C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=; b=ODjVGONFaaw0a8dqSI2IzzKzX+
	ov+CaiszuO0kmE1waTXTh1CU2n+VpLQYHXwmJjfLDYmWm2weYYj7FI6v/OFomNhaLIZjqJT+XL9BS
	ZQuqUNsy0IwhIvJRrSkcqa7ujxQAinO3bgoKCm5mukkCcMM1mqSdSGYBQyMkn2pdUVqqdy/DeCMfS
	tGV8pJ2gkuwc2E4hKrrwRLBl1dNScDBqvTjJJXEeTngfic/RaONff5+JHeWF5tw+LH0pK7n6AJncE
	O6VWHiYqI82U/LgsgztPhOusEARLKPZHzj6vvcS5+5D8nwvYtASHlHSFJszlkYAhcWmOK2keIxd/r
	1cMm8ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3x2-00000008gzQ-1Lqk;
	Mon, 05 May 2025 22:06:16 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3v1-00000008gkS-3Olw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:04:14 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bfed67e08so49112791fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746482650; x=1747087450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=;
        b=F73gEruw6r68xRH2jJ31NA70eZELR6UVLZofGKnOjMCPzF9ZGiPTuJDvCNtzkqxzP0
         vBvp8snhs7GOJ+0iMAGHZYq6KEsoXCpzKEvalUzg+fF+q65x7U1lhwRnqOcKI1Fs30be
         NqbINqZ4baIWOlNWImTTi6Ntt8Is5HnwVcMApLfQBqSu4gJtiZ5zSJaEfA6SUR7320qQ
         BZvo7YjxQzQSB0ShyDfcXFj19pzZxB9xJSJEaHSvkiSC+hRKyq5zMLQpAZTBSOFm2/KX
         jd4vLcK8762q6vKX4NpJME1SlG9Wit8hKXu4v1zNWUC6yMoXrDY4uTa1ZNb3ReAwYIUp
         VkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746482650; x=1747087450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=;
        b=TUrg1QRMpMCGElWaY0hTb4MMi6t4D4U5S10IGqON0uYocLh9Mw7DRAiTf9GsoqrF2n
         iPEGHm0sPTEZCkWSsGfIOpdOZaTyz0OOVar2avG8tfV5RXXVFx0TQFY2L3Bi3bePJNG+
         n960yNdr6xFLxRAoEnML4cOZuCCyzIh2ghBBonMbzQByhAZ3GLasAQS/FHa307zRocMR
         0ob54V2vjfSELdue9u9F0IPIOL4UZkBSo21e8wcOngn5aSJf01l973Sz4/j7300u5hFE
         VUe3W+wLYSVRii+0Ox6xFuFdsQ0gQ8+dsg9I6VGdrNr+JRNGib0duiGGGw7LhJ2OKMaP
         9R0w==
X-Forwarded-Encrypted: i=1; AJvYcCUC9DEU9umPQ9enHSGPTA/3JtTEkkE1FKOzQE8fiOiCBuO1KxgqqvZOLW2EqAqIqqRH7My8iPTC1DObEzFXasmM@lists.infradead.org
X-Gm-Message-State: AOJu0YxbfloYT2G5sLVq0b6F7sskAHf0Z3H6cWZVOragErePObV+PT6w
	PxkQ6IAEr14JeGlfX+V8HE8A5qWRsiN2TGONT/7lepvVlzfL0QiCFGBpv6rJysUfINlKIoUBYDJ
	Pk0a6xTD7qK8P///yhx8r1T2P4CmeX0ANADad6w==
X-Gm-Gg: ASbGnctkEpO6LfZS9soieasN8IrKzQE7w/D6FPzTerDFZ91hW1v37JX6yKTdw2/UEfO
	LvxJaENQ6gC8oMERVJarC49MeaJ9mV7wYFr3H6yCKKMF5ty7PDe/JfvQILr1PjnUxklK3QGoPbD
	j/1B9wV0Qj2T59917WIjvtvA==
X-Google-Smtp-Source: AGHT+IEHFxriErzJ6KWZ4Dnlp4ZP5W2Iyy0QEY/BgIwj3zLpxQz0U2At8oBYxwGceOg9dDWjzWeX9nJUKs0U3r9gdWc=
X-Received: by 2002:a2e:ab1a:0:b0:310:85ba:115f with SMTP id
 38308e7fff4ca-32650ec80b8mr3872961fa.33.1746482649729; Mon, 05 May 2025
 15:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250505144558.1286889-1-robh@kernel.org>
In-Reply-To: <20250505144558.1286889-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 May 2025 00:03:58 +0200
X-Gm-Features: ATxdqUE1cM-taJ4-SlbcCYbnOvbDEQV7s-gz28KDyeQW4mI3XtkOG49fIqlZFsM
Message-ID: <CACRpkdZgB4sg1FtDK3QTzKKviPhoCZ8xwP92fV0WGhOBWyUMSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 arm,versatile-fpga-irq to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_150411_852891_932FD525 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, May 5, 2025 at 4:46=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Convert the Arm Versatile FPGA interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

