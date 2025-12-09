Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5C3D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=; b=kl0GBSHj1hcqe1Oo4hi4GgHE/t
	W4aOJvHyYrWaY3JRfP/UqgV6qxixf8lG/aFbL4TKt0vNJ8bT1/WnkBx0s3vb1MAYLeli0COKvx2iR
	a9o34pY5VHz5D8MwnftQ7tPksV3ozM4CxqvetM6W7Xk2WDfgfet3vKnHVTtO/K6px+qVKCMrh/MFh
	QHiun0MIjz4IOB58b2UlRpsORFqE4te2sP9LlTCrMifGUDvEcKEsegUXLscMgaI15t74gWj7CerXl
	KC4eVp8vPLiGKW4gxqWJmiYNtYXwPd+ULaG2P16IbDYBHV0OALQEoq1ThDxqHyuil6sqglqbn1cGb
	hpAZ6CFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyNa-0000000ENGF-1uEu;
	Tue, 09 Dec 2025 14:07:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyNY-0000000ENFX-13SF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:07:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so6234075b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289267; x=1765894067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=exESdVSE3xr30RmJoycOsyIpdqXd2iBiXcQCMOBHrVEL6xP6P02UexUn0aNDkrqOQY
         RSZ/gwzTxAKP89j1HG6C6CyiT57nLVwPdqAU0u+0+MAq4PM3lxFbC+Ktz9Chld+priRY
         ja78lEaSh+6cMj3AlvQRAGlbz9kI00SNTSFNVvwAf+aIbrprYUiQQYmhmKNm/3By223t
         vrgoTVFlOzfG5RkwavEbSJArCzb/wAFDpu0W0F5uU6/8gXyyX5p/CzXODmNjx6ffkg2Z
         kuY3yqp2zbff34H/hfvA4Hxqfi0c8yCVH8Ho9Osjr9j9LAF/8iwMu/Xo2aLdKjFNqg9B
         aGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289267; x=1765894067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=u47CKwGJT2EIH8+7L3AvAqKrf5YZJ8lea5A/zbo0V46pZwGzpfz11kSD535OAnISm1
         G52nt0IHdA5nJnHT8edsCXlroqxtV6sdZRTQA6mhvUcJ9NwGDzc9XqRqK34+AlNTwpCP
         Gn9nqexnh40lUbsxvcnq1oOVDcXjOmzFD/FSYQ8or142/uJcSC4nve3g8nqMPVTWudGX
         Y6ZiU0n+FOyvEBrT/7aby6e5/Zwb6HXxMpQIKnnaigK+pJQ4KW/JDxhNC949wFfC8+IW
         WI2nktH00G8Ekldb/AZrVlvM5CcyWJr9HOUmSfoxXYushAE+fnTY39U1+G2XhieEYkEv
         D2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgGhjX4iMduE4MFCOGgZUPb5RWfVGH7NU14fB0fIdk2D3qVEHBw+fARxN310Evvc1+ia7IdSO0bwSTzhvy8qmb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh7sEERECEtMlHgp9X71OtrWWrWVzfE4xcsEys3EDS/gFj7l47
	Hjl+70UDInBRNIHq1FB7B/gMazHpXIBLg/PCF00oSiQT6HXoMpJQjpg9+rasKxnRS9VqIrv50O3
	qz0GokEPV1QXPUjgIZvWOrS9tJisd5L0=
X-Gm-Gg: ASbGnctMWUIhHIXzK2K90GByc7ASUv3t0MWw87WRv9H5xE7UmNmD/2vqnRyRfbOgitA
	zMl0hG+PsSHhlZyAwtrCQ8KJ8K9JTblunR8hQc5HB9DV26ZQj63AKrSWDBKvQbN+bDX703tZDDa
	7wJ+IF2iQ4NIFI2Pdsjf6RbowdK416vZnhloyeC/srT2GAqMNKN6wEyTtO4fsgMcZgmsggstlbe
	sBQru/X/7ioWP6WPxDr/I/iPyUVHQxPKz1kX50zNqjFd8t4RR9BGL3eikARMXk0RrtF7zDjRRNL
	WJXt2IvXneCWHXeiA9vMFT02kOLNcAGEGVcVPo52ccIC2226Bo1zpf0/vL52iVDCBz18BAwEnAT
	XLXBjHxqSOg==
X-Google-Smtp-Source: AGHT+IE/MNNz7wtG6bh2UZGMnD/oVNJ1TejvyJsrOq0p5iLxtYXVZCkZRmEenluo/ZYsAAS0ErkexZjLZxTzyvUOaTk=
X-Received: by 2002:a05:7022:a92:b0:11b:9386:a3ca with SMTP id
 a92af1059eb24-11e032d8b05mr7860628c88.43.1765289267225; Tue, 09 Dec 2025
 06:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:10:13 +0200
X-Gm-Features: AQt7F2pD3HTByIx6cmrNP1lp33kbo_jsvfA1vDQn-Zm1XLkckJBpR0yk-Ns6YM0
Message-ID: <CAEnQRZAWAJ03u9LP33MXizJB6Rso+nL2FvRSKZE0Hx4o9ak+Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_dsp_rproc: Rename macro to reflect
 multiple contexts
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
X-CRM114-CacheID: sfid-20251209_060748_288442_493CFC13 
X-CRM114-Status: UNSURE (   8.02  )
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

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Rename WAIT_FW_READY to WAIT_FW_CONFIRMATION and FEATURE_DONT_WAIT_FW_REA=
DY
> to FEATURE_SKIP_FW_CONFIRMATION. This way, the term CONFIRMATION covers:
> - waiting for firmware to confirm it is ready to start;
> - waiting for any other confirmation from firmware.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

