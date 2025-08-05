Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DBEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=; b=SqHqTKtI46BuYZHbxFYrtIZja7
	HmRrJrKDN+RSZQG9JXSc++186BbwONXCNO5DORq0ADN434cWJnlfp+Sk0xC+I4hlvS5hJXu3mvaPC
	+UwHJk/vsjYXmttznJAJrKWStTVDdWOda/TUGP/WxoU3hgSe+zjSDaTv391l2mhyDf259r7kWTavm
	U4ZI0PaCcY/7LHs+hnLG8wFuTDmGh+ErRRaFrGVfqNYUDt0sKSWlzuKaPbY7en7lqhM7JuMt2UQMM
	s+5+0JdTTJkvVEQJAPW314DiiGnoJ1S1V155rl5m8DrdBIEKW0UFXBrVPZDESFKtyDK0ubDO7+Dzb
	VzU12ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujD7h-0000000CBsi-0JBz;
	Tue, 05 Aug 2025 08:34:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCSa-0000000C4zi-3i17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:51:50 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-747e41d5469so4410358b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754380308; x=1754985108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=;
        b=TfyGRGTfY2JWuQJa5tlDbt6C3ICUMTxdDwLGvlVv4Mq9vrs4bNZAaxVaWtXeD1mMpv
         +Dnx7WnZSukbie2udbbSVaGp94YyHNBu/dW6OYZkgYDU392ErtL5EbPQAl7mgh8VyFMx
         QSmmYnPCDQLzxFIJycWifJnVB2L4sC8pGmmtap1tDOzDgKaRxobCxI3csqVwPCUBzI9M
         zeT11K6zC2EO4bbkG13Mb2F2qIuFI3h7Cbs/XEg2Qxd1dMPCXwNgnYodMcFG42QA5Lpr
         kPGXdt0MG8wgwGRWvTHp8w8ByG22JDwGpG1qbOAGBrA1Vu4QVDWj4FUVtsfnooG0ofly
         wFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380308; x=1754985108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=;
        b=jJMsKLe4GRrnUh53n9466aSvnixQDyzm/8roLK4vh64Xkz30rOjoIYtUD/MawtP5kh
         Airh9RPrNwbQ4poBvwNJQNJPaFddVHEmyORyrxthYkljtoaYLAZiFtev73ZUEnn6KDan
         ebryN0OYrMlRJ6EC606evMH0xkvE4nTRY56/1fgLpqSZJXzdy1cgHoVBq42pW/TaUgYy
         hZ1gqT1RaG2pNoyDjS4Jb36I3D+rSme1KfrDGwOJinubaei5a6/vM19rrb08tfgN2Q6Q
         7ZYTNKzGkB6mhJylAHmTgC4yB5plltiidVoxSLlZJPpmT/VvUeCG1kTDrT4DWGo8Anb0
         lE0g==
X-Forwarded-Encrypted: i=1; AJvYcCU2cNgP6Up+7GR1lRS3eRhiz3gWl9cRqt5h09UEjVsavfHx2zwM8fxyHGpBM5Mtvezbq13BryRxjHtM9SyFG3uS@lists.infradead.org
X-Gm-Message-State: AOJu0YxkQ+soJ2C7Cqb+A3VUSn50rQCeovn8N6V6F3msSg+tclbsUZj3
	fhkef0PKVkRp0hQzeCkT1lA7ptgfKqyo+OQieN6JAFkatvSwQKT8ce1v98/L+XiEITfSOt1dfon
	xrcc9XFhEbRGvhMAghHS+meexzF9amH9SptI6mvHgrA==
X-Gm-Gg: ASbGncvI/5MfaGz6ri0aEptn5A3ba1kjs0zuR8TEDgIRUA5MLGf9mrx6UfNtTHTYFxB
	RQ84FScEqAjnbJu4kTTSPpRP5AJpXRJ3tIhgqCEvI4jDiZQOf/LU5rihPq1NW2gHnpTpLsoevG7
	7xJqsDvEFECp+iwrc7LW6UCOnYQsLs24tWv5i7VYpH0CqpSMwjNFwKluQXsfphhZti7rJ6JCjki
	9q8
X-Google-Smtp-Source: AGHT+IEWmtpQKbGUq/1bFP8Lljg+twjtflzwS9IvD3UxctPY665t4Ffz1Dc9oQm0cJB3lp//A3+8o9nPMjYNlLQTx4A=
X-Received: by 2002:a05:6a20:6a0a:b0:240:198:77be with SMTP id
 adf61e73a8af0-24001987cadmr11786044637.42.1754380308033; Tue, 05 Aug 2025
 00:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com> <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 5 Aug 2025 10:53:50 +0300
X-Gm-Features: Ac12FXzs-8MGoSs0GqH7OpNp3C2Lxecj08a45oMAKLepSFZX4ZB558QC9xKWl9w
Message-ID: <CAEnQRZDxMc43_U1kwnFDLnQbYgpKDmPYkdqB6dd44K62Ka1GqQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_005148_935212_B3FC2A61 
X-CRM114-Status: UNSURE (   8.01  )
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

On Mon, Aug 4, 2025 at 6:59=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

