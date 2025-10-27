Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D5BCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=; b=rhvqhz0MwDf/T4g3DCes6c+UCi
	VGcZww1t+tzxFm43Uv2D9U0D7EIuEDMCMgH2BCWpIPGswAxo8efVyHk5La0bDiTcuMbEXgvGbHXeJ
	pP8AJHj0HUilCSRLkZPdbKPZY44RLjK97/d5NsevNzOeN/eiuqg07u5gmGY9sFzwen81Y156WIxVG
	loV/xc+RszH5qqKoEpPM0+o5qwcxFOfa+uppjzm/lJkoVbCRibj2RUohE1BjWxsM8IBido46oYL7p
	kNI7frpRHi4am+YloX0v7Bo3bGqHZ63m0SjHANJTi5L80tA2LVAow9J+yllZxgu14FtWjjrMzG9tU
	/k9QIVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJux-0000000DaOq-2ALn;
	Mon, 27 Oct 2025 09:53:35 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJuv-0000000DaOU-47qL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:53:35 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2993935a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558813; x=1762163613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=hGB4n0sLbm1P4GPmwq1qZlDVEG1cxkBeMXT9/eFqFdz8jyqhQzriRKqaJKlG/BPOeA
         hVOtvfyPVz+oTWESHqujALeR0MzQIpQQr02W3ceBoaaXiZAT1ebhNAPGQU4zd+42X/Dl
         sTC3XUYBDtfw7FF8rGnrwUi0tUBUcsugvhG515GoeU77ojqaAq7/l97K7RNE6Pz4He1h
         XGpiXZTBondlEDFHmT+9r48H2IIuyfOFmrP/Q0N5HJ4DNCzs3o/MD0qaE6jnpwKj8Hg5
         52HiikgNsLe3KlW/zwZGgTKf1M2A64ZdZzVlHeaNAFSwutGSdkpFxDsf0jyi1VaPE6wB
         sS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558813; x=1762163613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=caoahprBNeLj1xEJQuvO1/YrQJj7N79ndxbW0z2VyA4uSlU5FBisMHGYqPIhKfMuwM
         To0JCdyOyWrLKZbEF/79f9a2OH1fCG/wYkjgV0PZL/rld76yv+WHJ58r3K+WVh9wYr6/
         TNHP3SbnuX0x05xlZr1rq6GW/wiv+8vjCrtEqFwHM2x4GVjk17rGQm1nARTdPZ5XO+U0
         KvzZsy/WC/2PhYbQNHL8+eDvTvob1kt5D8nxIAx6pPARInZAaVtd8jx8VhFmclSu4T4d
         8qkTxPP5cRGJ2IcYlYQW5PTK9ez6v40nGbtQFOPbubnzm+YZnUz3jQL49E/ThdlGvCnB
         Pgjg==
X-Forwarded-Encrypted: i=1; AJvYcCXo4yTphA4yhqKchu25TX6ppBwivKqoe6U/vnIGR9xAF5DfdGpjO50gP+dhh9umYXAEpE/sRXQKySfcO3ikL/Bh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcu0PTqiwg9kBVeEawnNVdKl/GWA2TGGfakKWkthkFSCZuC1tc
	TDl616yuN9s9IhmkvKKSZedz+bi138W1vH0g8NUaBRpeXQy3EwwJ3fG88cHMtwpoLRIx7BZYUJm
	6fMuvFVZBsS3KpnhifdOFpgWm9PMhHAA=
X-Gm-Gg: ASbGncsGQNDcIfDA78fJRXKTsi3ZrGSVBln9tYFVgQ7RlM1AZbjr42qDOwvGloWFsRY
	hgR3oGasxPErAgVrLLtdfEn82kYpa+xmUd4aAR+uVTPdpWJKQCnRhchaT1JdUm7PkFI4MVBEHya
	AdYHqnXAodmyWInysP2AlvLGA3pYHXadbrbnYW9a57oTEnQHVGrXD2XVkuJ6fn8moFm+0mEJ0O2
	K+65W+MQN3spu1VdJ7MuNdSyDMenrSc8XuXupjih4rFxKAFbdyfwJTHkSkZvjNkuzO/64tOg6Ud
	JgpqZLEU7846JYYMDB4B4sayrN49XOivBrs=
X-Google-Smtp-Source: AGHT+IHtoK9BtAWkuBlb8wHMY81e3C7F/tuuKHdZ9dReVXpNyDrBKViu/Dmg9ERnj0atAtepiwCmQJhoe6CLgiAV9x0=
X-Received: by 2002:a17:903:38c8:b0:26e:d0aa:7690 with SMTP id
 d9443c01a7336-2948ba3e147mr140058725ad.41.1761558813104; Mon, 27 Oct 2025
 02:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:55:58 +0200
X-Gm-Features: AWmQ_bn8djVWD9T3hbxz5BaFzJdgRNmgPK4MMnk5oMPTdlZh7IbRd6rHqy4Tk8c
Message-ID: <CAEnQRZDXhb=ssjbL-SOWXN74pjqzKgwXQ3SUUaQYMJapRPgKFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_025334_022267_88E15427 
X-CRM114-Status: UNSURE (   7.86  )
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

On Fri, Oct 17, 2025 at 2:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add documentation for i.MX8ULP's SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

