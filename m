Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5E5CCF2F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=; b=vH7CyxPv/hy+22r9tmPMuu2HXA
	hC3dsqMtlMfzy4426+lZHaCoYF9t4tz92LZ/nRASfTaZs6WWEgUOVS9MaiNMNPv1nzz64aXex8YcM
	ccF4h36vUAt2C6C+CVQ8+CSVW+h7Ngmn9iBZR7fwIS6lJLT0UQmwOFpoqCQpk724DJufz5V0soEY2
	mEx55ihx/dlshXB0wgmCDXcATARA8jnpGj627gLneREJ5IpkN/H9NtREGA4OfVsjhWGAR1nXxhTgO
	MxaASexwbDpLnFboHmtopVS33c6JFM+aK7jP+5OULDEKJVYHf4vHDtBALWclAEEnpmcgSs2ksHnqU
	r7Omt3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnqH-00000001vUe-0M53;
	Mon, 19 Jan 2026 11:54:45 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnqA-00000001vS1-1f4K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:54:40 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-11f1fb91996so9615518c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768823677; x=1769428477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=;
        b=KOyRtnJ8nGiuSuPf4h31kr0ne2vNI6h8q85FRGw/TEsswx0H9ezMa3pXgi7FcJaibw
         ai8xlUU1V2umft37cXKzGDg8CNbWFixeBAhe9okj6GtfZAw8BDPjNa5YCJqxAnYLahpi
         vb542xUZmdhYNmfzazn17LP/Ff6ybLp9VeNL6Mj1kmr0n7xfh/DmhMQUSqyz2CqFBvDS
         U4Pq1oKiWvVMwu+AsRspwcZiUHZexx2SBjbvgdLH1bOkqHGyA70eDT26Z4DQVKoAxLaf
         0INJcBoiVVB0ntn2eUEqIXHt4AlXfpnM5X6sBdsr+/kEV8tYNLd/wSchQcc2tiydQlxy
         ZiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823677; x=1769428477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=;
        b=wD3sDKswi0tZNMkA80NeNYvTg0YjE1ZD/spdhGVUxJSVFOYlitv0ELfXqmYrXulbWv
         GfE1BcnMKEAB1O9XxxWYw/EdBGen77XLblijuZGZ57eERFSLsyuou+HCx2vnI+NEmNc4
         O3pw08Z376hAF9ujSduvYmM5/nh1g2YVgGURe9FVBmulAfdw/Ixdzk5Zd+nVDUJ7xczQ
         ycmlnWgQG37xE+T2kXKnsvWEtOLVq1ZCQtuBPO7nrzVYx3HWPRQ3akxWNN2HYYF4afzB
         VJEHNDUtXY07Ryz5nBlerXSJdHleN7hLhXw2s1FV2LqiL8/va3vUYw2Lld+lHV59doFS
         LzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHq5o6Yeahl2NCDSO9xaf0zLRusQQ0uWDdqPzWug2XZ6XeWu7wqVU2crXpztWS9ULmsS4CzZwKbYhTkNfUhx9r@lists.infradead.org
X-Gm-Message-State: AOJu0YzGPdF8w8lrpTe2JhDISIzcl709mDrBU6BKOyPd/6HBRrtSpqGN
	QWf+JuyNKb/4B8/6/cYFIaWYwJ9onUoBoufya7g6GWiYkAS5nxCiJe5tR8UCtJrjHyaY8q9KWV7
	72ouliugIIooVk7HFMItD8BjNs/i+vc8=
X-Gm-Gg: AY/fxX5olSykEnbgYviRQapaBxD5a6yYkdjwdAb+qYzxGCn1S5YutjXHdbTXBbfmxbD
	VnwU8Y6OYxR6XHZmvP+A+gxQFQr4LNhq0jxLAEDrKupFyw6KRbZRNIEBIwWrnQFmgouH+Qn6Zgn
	r2W8YBP1tAO4ux8/4KJ5EavRM5mstkNVLE+U4rTOfR521tXG4zXTXthYdHEYVoJ+KzAsl71nMW+
	tbYr8F9akKZ+348fLpc+VnS6lrvePZ19SZlq7fdKG+N4polo8hyxY5snqaNUN3wAtGFai+xWZwy
	AESzDKY1602AvSq07ewsaYMbkAjbsRupgOLhWndx80vybH03ltUSuTyUoQ81N0baP2q00NYNDvc
	v9TOKUWz0Ag==
X-Received: by 2002:a05:7022:2526:b0:11b:9386:a3c1 with SMTP id
 a92af1059eb24-1244b395eecmr9065273c88.44.1768823677453; Mon, 19 Jan 2026
 03:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20260119103654.51318-1-francesco@dolcini.it>
In-Reply-To: <20260119103654.51318-1-francesco@dolcini.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 13:57:17 +0200
X-Gm-Features: AZwV_Qjn-law-_KhQdrPSaRXm2pJ9JQh-dHRP72Qm7kKPCJK_LWk9DtifbbNfZI
Message-ID: <CAEnQRZAk5awoJdkAaSEdcopkmT1g1pdJLz76DdqkQ_p5pqT73Q@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035439_444486_8A7BE5E3 
X-CRM114-Status: UNSURE (   9.42  )
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

On Mon, Jan 19, 2026 at 12:37=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The GPU is supported since Linux v6.9, with changes in the SoC dtsi
> file. Remove the related obsolete TODO comment.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

