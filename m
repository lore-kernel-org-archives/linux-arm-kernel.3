Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463C8C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=; b=P/R8SfgOMiveceoZ7gJ41Tp2zQ
	EP6h6iUX+jPRUNRJdVAEK0TEvSUXv+Cv2/r0BKXq6D/Xhn3dYD0UcodLWZWs44gkczhnzX4FRVjYH
	Aun0dQis3nW/fbaq+J0+iB+8SJUSNADGav6nQ60qrDfV+N8KIWDGBHPf/5PNTTHjffNP/euSyF89n
	P7qCvEqBIOeH5Vtzor2Ujy8nX1GEKuvfHpfwi4Xf31i7xQyqlfHRDug1Xtv2XJJDfCC6wVp/2AhJ6
	LhdxhrCgKrmXnLLPIbmFI08jbJ3B3H080ccNiEzj7i5+nN5zLcsRz9E5o4rt5cBw75e+bp4EBIwpg
	g9wQ6F4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bCY-00000004u9r-2AwS;
	Tue, 15 Apr 2025 07:59:26 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4azW-00000004r5N-0H5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:46:00 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3105ef2a071so25202631fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703156; x=1745307956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=lTAjF7yg/yuIao2MwZe8EUkydVFFiV9U8wv5lzhmGYbN9t8csfiV2TYkUv8rYhQUdP
         2djXdLhAok+TThvRy4BCURPnyoeTXaInyx//O/JTqADEuS/Tn6YTfLhu1WJvMxFx/+Nz
         2GstnejW9ZujAGKe3JKeHTfb6Uj1t+/SE6SI3/aIX+haYbIKGDlMCo0Bh9zIx8fpMc63
         BlCbXOFWuwg5vwhTMMDxlKXwnzw5GhRfe3tF7Z/GlciQOkb7YIjqfBvdS1qSbaGBZ8/l
         MkWaItvwuAca4yC7POB+4JNvSWwuUFDslhVddsxW/Pc3fZGP+SNmYJPoDVVFCOHCJPgu
         EkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703156; x=1745307956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=uU5nc9JCgN21zXvPzC8SojbsvuYdFkwMXBL/O19ZbTkTy06oDR6TD/x/GXKQq9YraK
         KS9jAGru2U03E3muSFjamgO++3ZzDLN3aluwYnnT/dGIJv11K8pY1sEmjPD7qrj6Sz2r
         ICEhoO0scLGOzuxv8FPKz5f/NjwezZPl6wDhqK9lCIsBj5ROiPPCXVuuqJffwKyY4E7t
         O8z+e9uPtxJUDsIdTqRo7INeoWYXXcEKYe8KI2iuigAdK+4J0xId/JLTzBe+W3JBSk1R
         j04KPWeTnU+8dGQ4okGm2uEGig/DQF2zC4GRvx+Nb3wO9D4Hp1wlFB4LrV+3P8zVKuep
         z2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXDhojtHEqPFHE81Y4oOkFPijRGHhC1SIq1hiJQVwOiv0rYJ+tMeOYsmXeTXJFeArP57o7QvMdtDvxgOBKDisd/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ULAj4v6APXS3B6VBiSLSu9ZSvxxu1+eBcsPVzJchv/Z8xw1U
	MfFYBLtGuXeV2PxApR6NQqhEi84Cw7PEz6l13jtMfFMlZL+IGAxX9Gyz4YZsolHWs45+HgMNdmu
	HcJW8Y8L8yqxjGxI7prpj9Yi7PoOrgjmk6UqMVw==
X-Gm-Gg: ASbGncvSSAUZ0KnmCiHQ0/859neh4jKVKq+R7dW6TEf2PYGAU5xjLDPMNM+dkX7MYJe
	qzu2MNqqsGH7EWuxwZeH+iMym9oTipwdzus20sfS5rTLFsHl97mCD0XHsgEKgKEOWLJl4qlLsQx
	fba1rZ9XUc5cVXK/1cqOQRlA==
X-Google-Smtp-Source: AGHT+IFwAAfaAAzhBH2j7GeY25vZiQ/zwPAChqOV+UPITlwOewIZwKKaiN+msHLAb3VJXQqUL+3/Bv4el3h6PxyLHRE=
X-Received: by 2002:a2e:ab0c:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-31049509fd6mr47883131fa.0.1744703156150; Tue, 15 Apr 2025
 00:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:45:45 +0200
X-Gm-Features: ATxdqUH5lAyNEtt8NGqYFFPuzudR5N372Pir1OcHVfPuTb8kB94RThH28hJgscw
Message-ID: <CACRpkdajcn9XCy1L=EKEodTQRnaWqe3zdD4+dmt7rBoKS_n=Bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the invalid conditions
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004558_094867_47F1DCD6 
X-CRM114-Status: UNSURE (   8.76  )
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

On Sat, Mar 29, 2025 at 3:45=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> The variable count_reg_names is defined as an int type and cannot be
> directly compared to an unsigned int. To resolve this issue,
> first verify the correctness of count_reg_names.
>
> https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.came=
l@mediatek.com/T/
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

