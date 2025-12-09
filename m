Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0052DD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=; b=nvbWJPzJy0UQsfbBzqFr0RvICK
	N1M6AQwL3LBqcIrnQjiAbBsL3rz5RVCPagUff8EnRpZvl991cMPWTFWwOnC2V8BTCxvUc0XpDMU3+
	wC0t4EpKyY3PrnSkbpVZwDHGQ1p1CWFyggI1X/DpcdSFXP3Lcmfxhl14SLQUCwkVX20crOwEYPmE4
	MdQ36Pua9srm+NStj99GJHJD+xrQZljjsf6P3wSkaAzbSkvX4U35ahHwELYYmoTXXRcpOYvxfupFn
	ZeqMQIUp+MCVfIw2SJE3a/G97zaXo9FtSjeJroGoKu9cGCJhDM+svxZWe5Pj25fiLVkS7zKSFPqr/
	FPg5vHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyOc-0000000ENVX-1dFd;
	Tue, 09 Dec 2025 14:08:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyOZ-0000000ENUc-3jqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:08:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2953ad5517dso54247675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289331; x=1765894131; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=RDgthuy+/CVRxWTOYzlDH4XWdOnjtkFsbcIXfXDy43vS1H4iDNedWZNHVvlN1YMOzK
         qSAP0+k/AfKfOyTIQwMCEwH+EyH+aa+ojBD8/2DdJ/KLPAyVVs2G1WzwsHsQlQDY4ZWh
         hCGH1wOhut8e06lljMuIbr5ImZOniKFjrTF4I5zyLxOjxZaBksmrXwFltK7EGUS1sxGt
         g3rXPaG+y4GlUIF0iPtaX+Vcs2oyU1O6s/MGogiKs92W7poMB76AYShNKDuav1mgDLyJ
         OHr14QC60jWTnTdVYWIDEDsW+OkVIkKaHB1AooW6fWsDNTEK1OPvPcVE8sE3Xhh4jf/V
         cA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289331; x=1765894131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=HaBgGtGzdesLpgLaD8BeCBSejs4i9K2/W/QT0jLmkPL8ZhWW7J+XN51EQPwSfyJlTc
         wgqaqWwfoSYky8a4BUzkAVFxX2dbZRPnBfR3wn0Hr2W5EF2MiokQq7NbXpxAbuI3JRkJ
         QWkOQrxFZqejdjxYoW1ErxpDtmzMzKw5HXABeyCUO2XDMmAFKWPqsoKq+WD6IPJG36fg
         HFadeTPCVe/q/s5aSp3Irwy53io9I7Y373AH1viLzwKd8urM0YlMfebu8VuPbRnXDKIr
         jfNot80qP5ZDBsWBOMwtZYUUw/++FHGx9uf944wFeFEgXXV09/YMnPjCuBRBl2nHiwut
         kHrw==
X-Forwarded-Encrypted: i=1; AJvYcCX5UkeBv5JqshzZNKXZZ72QM5NTSS4mYK6SdvTAMRPDdif+1t+fJ4k9NOSKaubhaeYDYI7gUkovGrllwL1+MUjo@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+WT0DfT0ke4Dih+z8JFiNLE4L60wHgWGLVX80uMO7ChmYO+b
	WJz1KIrN0Z6uKUsLT6Xb1D3pod3V2MjrF45P4Q2fvBllkKb9gi9NPkLeI38Ern8L0C+k0B4iEQ1
	yppe1CGy2CGnVEtHrOtNrgjk8JuG0hg0=
X-Gm-Gg: ASbGncveFqpc0B7PogEiJeAnerPiNElex1YZPyz1SoRIRQA4DW3txjqWTiZHAfaxHZx
	sg6E6ua23zSJgQOAS/G/m33evdKA59R2FWcoqF5MPL7nfu5fEcKnEqDQYRnRqrkgtlNMt8Q5sok
	UNQbwS0xEsh7TKxmoYpaYhu1O+LSU626cDNWPAozC/jRdBhn4K1CqoxLxr2z6PSoZUEe0420wRY
	y2glPZ0tJ8GfcLJX5PARTjeM7ex7SJPTt4ri+uSm9KyHYe5d20FxQoDdWjxz0MiSRYoTH5Pu2/0
	PYIu562Wp8drMqieTn/uND6LIM90tom5Z7sT7cMW2FzfHlYb0/GlKX02QH00D1Tm5KNGe0Z8u8+
	a/eqF9nrOKw==
X-Google-Smtp-Source: AGHT+IGlAhSuqCl2kRyMGsShmSil97vNdY0PHNYfllyi4vyK36zscoZ6DMWDYGU3rPKH1rKNgSPRieolC8FcfVHxjzk=
X-Received: by 2002:a05:7022:423:b0:11b:8b4b:bff7 with SMTP id
 a92af1059eb24-11e032ac942mr8661512c88.39.1765289330793; Tue, 09 Dec 2025
 06:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:11:19 +0200
X-Gm-Features: AQt7F2rz9EfsJBbiHeX3xN1JnTkS5oOdOlbJa4JQf39jSVqAGLuMb5NMx16wl5A
Message-ID: <CAEnQRZDw-jwpXdb3oi+-DZ+YD4aQfyON0gPNrGpox1v7m4Voig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_dsp_rproc: Wait for suspend ACK
 only if WAIT_FW_CONFIRMATION is set
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_060851_930895_AFA67BB7 
X-CRM114-Status: GOOD (  12.10  )
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

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> The DSP suspend path currently waits unconditionally for a suspend ack
> from the firmware. This breaks firmwares that do not implement the
> mailbox-based CONFIRMATION handshake, as the DSP never responds and
> system suspend fails with -EBUSY.
>
> The driver already uses the WAIT_FW_CONFIRMATION flag to indicate that
> the firmware supports the CONFIRMATION handshake at boot. Apply the same
> logic during suspend: only send the suspend message and wait for the
> suspend ack when the firmware is expected to support it.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

