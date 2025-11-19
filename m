Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05DCF34AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=; b=B7UJMpIKAasGJZOTpmuvCSV9Bq
	DB3HxLnD4ArpiqdW8r8hBbWCwKJkjJbxiD8Iz6eu9SpoZLXM5O/OaZWTHY19Q1vSccGL8TOtLShuS
	IkXxVKMdVW+zjuXFh0v96NrI+AvcSFUPhKESWWIPHC4vcW56Z3VO93fVA1dm2PyvNGlr3a8ghs0eS
	+x+yLqmFeqlaEAd9H1Va12Yf3XcQNDYBCKhxxH51WGg5zqXF9c+VRp7K71C5nF+RBSdTPRhx3rz9t
	0F6/qaRwH+jpU1WK3yR2nDkUrPDhZIIdXN3cgU/TD7sS+LpsHhujVmiCT64qeE6xqzDaOjhhhEfcl
	d2Iu78qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiZS-00000003Jjg-1C2z;
	Wed, 19 Nov 2025 13:50:06 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiZP-00000003Jj5-2fFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:50:04 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7567352b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560202; x=1764165002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=eJwQIrcb+VrV8XNL3neW1SgzHgsQr/d8yattS9R4bRYM7a75yN6BkSG00oJjasObSs
         qoG6kFrFbLTv036jpjSZrNoB955WNo1bZ8tKXQPTOO5Ot3uqouo57q2RlwAbBHLr83ql
         mANqEcKDQtpL4LR4Hl38UjEzLZVraX7b4Dm/cEsz6Z6FDYwYhJXA66TKGThF9FZmWhMx
         aHAcE+/B+e1tRwytFfzg8PDihVbrxuKe50hxGeb43jmNDDqHnO/72yaUcfKAswUxQ2+o
         uIiZTK7J408UgQSihgThbL8WOXSD6paUYh6o4LfUiJ5p91LMWMH3TdX5LfXGuqIz7QiK
         OIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560202; x=1764165002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=lXO7ZlGKBq/Fus8I/K5PrBH3leLiperoIMuksj3FErBTLKf3nNTNERGTIs0RcENPkI
         qd1nU0EhnuucTAr1uxUH75VQwN2gLwxLR3bo58fvri/Zd8VFkrmzLCei+AdjgM9hXpRQ
         PYle/nRu8+DcciMBg+FCHwx3yBWwXXKkIcY3Z91DAUjwsA2MDnr2wCNC/sYBDcF4KfN6
         3lVqjeHFCMCkokWjlng7AgeBZFPVg/Sz5x1DZwFOnJ1pSqctwXmTRuLh+Ro11ngdMzZP
         DnKo18/ZFPcVY5Lwzcoq+Ynjp7WC8yX1fFJW/HlrkiHZVIumBYcxJqb/zuQI0ZQ77/VV
         fT9g==
X-Forwarded-Encrypted: i=1; AJvYcCWCLvCKlpFfxCGf4566NgYXxuTL7NApG2T4i0v0knWm4FD5Nn8A9EA7tERR9G4rlzXoZHGlZiiYYC/+5Qsnn8qC@lists.infradead.org
X-Gm-Message-State: AOJu0YzEKWIF5OJL0IHrl0Hxhcs9+NC4So0zPMg+UmEIGFW72O4ZKd3u
	U3iOyFroO6ZHDMFRhBfow9NLSeBfi4tPQ9RAp1ImdNA+AZSO3ndoTr9KnGXXRJsruU1EnZl3xdb
	w8nvd2q8EazHtfKCJO5YIIHDuc/Tj7e8=
X-Gm-Gg: ASbGncv123GZ3pVAKKANe1zFhuRdpGh9voy5SXsQ3Li2SQDOz07o9UNcSdR77noc/47
	FWdzd0SeP1bwnLfSU2CLEsaPHJNAsTBc7/kNiRDusPyYcGvfhNylY+VvA6YFvxdP3ml/sMcKDV3
	QacEiWoIXaBm/4XdlGBB8D4I+jlvKTgcwEpEfMFbw7tKNsmtE7Y2GlLjGPDt1TS5y8BbCUuYJuy
	BkuDZJpFi/88mkPIN9EZDXp7/4iEP9GHhodqEVT7WuZhfBOPfbp3kSQ1I8gF9RiFyOp+Jldc2Hg
	erFAc35HWCyOSPbVxwIdL9LDNIcpzM1cQhS6n96PqSe4TkIRcK8NEJLlCcEapXLyypLxGi6Mhtf
	SyJjPpoU6ShdPwcHH/uIx
X-Google-Smtp-Source: AGHT+IGGVmLiseawcnvZbvhRX7fOL6QAlnymjGCnNl5Y6MJZz/aS1YjF5zsYCLKnAh6kSr2Lo387+JLD61i9on7r+MI=
X-Received: by 2002:a05:7022:6091:b0:119:e569:f611 with SMTP id
 a92af1059eb24-11b40faf26emr9338366c88.10.1763560202365; Wed, 19 Nov 2025
 05:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com> <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Nov 2025 15:52:30 +0200
X-Gm-Features: AWmQ_bkuVDMyYfENLfIkZrmHLS5NB7j6e-0_rwXCFGVWssgFpyz5qyPLJLqiH7U
Message-ID: <CAEnQRZBMiZhEx0ziNbxpLLC1OK4CqNQQkYUncHcdGXe=mnJC0A@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] remoteproc: imx_dsp_rproc: simplify start/stop
 error handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055003_700025_ADD5DC42 
X-CRM114-Status: UNSURE (   8.39  )
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

On Wed, Nov 19, 2025 at 6:27=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace goto-based error handling with early return pattern in
> imx_dsp_rproc_{start,stop}() functions, and simplify if-else logic.
>
> No functional changes, only code structure improvements for better
> maintainability.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

