Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C64CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=; b=h6ilXXxZshUqiekuHkMPAkAW+R
	jIoraAahit8fwbrOslB6c0VCa0T+/3JwzcJKokp5RcQlb6Vyr+tsg8haQXduD+buzfc019o0sMkWv
	s1WxWK/zyE4f9+WZ3HfTOl1Ur7zc4zZNoy2pzLXnlOSH5KOyGFOIbL5p3eHucsWOVjYftEPsibZQi
	5faHHB92JS22ty+OjMVNJnER6V3iC8Gi5AeYxypi1MUrsOCQ6pVHKRKl9k3/C046n7amI1xk6J3iy
	J9fAXF1ahXzqLB4QNc/19j04mS0wwuiX5MdZrbnwrHb64kbLjKuIUeK5x/bvkuiITYVQ4dCc77Il9
	B815ZBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0f7r-0000000AGEu-3XsA;
	Mon, 22 Sep 2025 11:54:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0f7p-0000000AGEM-331j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 11:54:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so3634311a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758542073; x=1759146873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=jykwaeItaVIzlYuhHvs+yP75XNPXUXOR/Eosj7wKKd+C6AT2ZXStATAhDff2sHDe3Z
         tYqyPl62tWCLkbtge5efIGWc+498K33HyWK6wMti5HDaRXJVUw5DUSMHgyArNKHj8yVo
         F1U2d/2jrEusQH5QjyaeoNlYMniAvWGgVRsWd2C6rM72P3tQrzCuDQA3nOfbaWIOOCK/
         S6vk5Y4gy+UXDxqh2tR2D6xcf0bvI/8nbhG29wFOoObUL6pWx+/C7NDZlzJDkfVoZlDB
         32GqYkfrxVhVTP8QtKhtg1PRxFgIBLUtF+kKrLYC21TfLCmVFSSy6Ocqzcde6NhHGKDy
         H2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542073; x=1759146873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=f3a4gsqpp6XAMYzNW2k6xqwQjuF1MHiq49YeIojSR2fQ2GoaBPhWPjcKkiXcPejsU4
         ECsjsmTAoci85SOlvnzwuqnbruvR59o5zu3TeSfFnloKTk33pgFPGjiVE2w2bx3hi971
         crX7h6UzRSyPl4o4iEitxojmOR9DMIvY8dk4fe1SjsgafYXZ/Z8lrc2OlnbVCEr5+xKj
         5T1OGDVou7g9DcxJ7jn05mCxRxVwtPeQbDQQdnsWgNuDtGu41j+K+2B/rX+jMxx+z0ae
         xaMb39fbUxAeF4kHeNhm2m+lR37fDPoK+drx3Uxe7VeFFYVdN7uc0SL7PaeMM5M/ASTm
         3n6g==
X-Forwarded-Encrypted: i=1; AJvYcCW34Gxt4BMltVvtkBnKRYHlvQigV/wI+xt34c9Qa+clJKT2PIyBmqYm/aLhJ8oc7FpYCP/xFjtF9yrOZkAC4/1R@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGzv0Q6feYldItbpZxE5S9FmPTRtxcbHQJ99H2A2olraSoYTZ
	Onj8lrUMpgi0LORucULSI8qQtXN3ng7DYcMXG4MaRF8bueS6pjgGkBVNal+IGhA3M4obclL2HgK
	EwLjtUdDhoPDVfvDJHur0i/XPw+Ypit0=
X-Gm-Gg: ASbGncvrIH0L3i/WNRqgXlYnByAfw5bTMsKvzBkR/EaF+wN6fikYm1ahY8mwlnjCSDW
	8dfECLUIKmkR41zQuRxnKlmgysk41O9jCuzpQkMEoJlD7Hs8MbH5JZ/+IGE1mly1EnaOcSkoZ7V
	xqR5In704GEgTOvZhDvNeh08fnKL7X1Bv7qSvW0HwbnqO83NsNMQDZ8eqrqjuE70qjvVIrlv53p
	RAvgRLS8jOwxCtKksQmO0QlP6qTBnqvRV6DuSZ19deIGD0=
X-Google-Smtp-Source: AGHT+IHzxM4yiWZAL6zxD7pQbX0TaeY/bJwW0LY0llQOlSdS3iORCuACnssvnMbvtQZrqfxj7+ITUfMjGupBB0hJduI=
X-Received: by 2002:a17:90b:3d44:b0:32e:a6b6:6d00 with SMTP id
 98e67ed59e1d1-3309836d4a0mr14833310a91.25.1758542072686; Mon, 22 Sep 2025
 04:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Sep 2025 14:56:48 +0300
X-Gm-Features: AS18NWCo7SM87IX5gqcum6VQNj3ji3-ObJeD7tPNQaPVNEbSqpL0MuoR10HuEnI
Message-ID: <CAEnQRZAtNCzoPdY0B=NXxKZte46XuVSNm-cSkEj9mUr7TF5BNw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_045433_764064_B1008A74 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sat, Sep 20, 2025 at 4:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

