Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0308CDC19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=; b=LcU3TVZFAURBcGrP4FZ1YHRLr8
	SUCXtkTTtYJwa+FQF8aI1HIYDmzjkrpqxV3C3qbAUpN2Ge36l666omHTGuPH6pBSo0daW/IpJrCZs
	8aNJBaKEtaxiKfM0bXllgbFxvz5dkMG8vt7fUgi0fVlfroEfu7beMTzlbK5xqzAs11v4N8GRA/kwN
	P+D+1W636qGBAt7aidYj1N/f1R1p/yA/pil+LLKTyKw2ZdluRY8EbW9wOp+GbhPpzW4OFIQx2FVCV
	kVdVItI0PmEmv21gy6qaaUGUcr0kyXcA40K9mSBq1wRN98PICUcRhyWtlofoC7kyOwtFz7gl1K/Gg
	8FLE7WMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd77O-0000000D6KR-0p8b;
	Tue, 06 Jan 2026 13:29:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd77L-0000000D6Jv-0Plk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:29:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b6a987346so327844e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767706136; x=1768310936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=krybiDHiP69b2OCEWXPZtXWMkfbPOBQ37cWYmHrhw957AiY3j77SOBMpbIubiekLEY
         +a8qHkld0SPdVnVORabi+pfXL+AF0jyeODv+CWvXoRft4xjxny2MfPbMyrkg0Twy8jKT
         ccIdk35I2oroFejjb3qLKmqrFu3h5poba6jT3e8uJYp3kC5xdp0T+U+Bg86cE0qNg3VL
         k0r5YTFmyzl2qdz/wbDBLBsn3sU+PpfzfDu3YagXSH+OLadDKN6nIQQSEYPSkWq6VTGj
         xsLJTtgXivSfHWDJ5UMSGFMUk27Ac5WGLvCr/0zV9jStbujYm9cLyEr5L/kR0So9Y/ih
         8FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706136; x=1768310936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=Uoi3l9eRc92fSfTdkeNpK45c2Ur5vlD0wN5BKLCseiYNdmkRGepaz2+gZCbEALUVaa
         KI7japDMG4OK7DsMA8EKVxBSpFuK/aTXbiejbUTB0cPjKKBLqD5T34wGBWGU8ZX33trp
         dlLvx0T7i0WWgSzjxkoNEIPbbgsypvX10AKgwlSHyJVXABfLL+YmZg8HkMEzo3HzefzJ
         sfGDmIIJ0AuGxSKKiQ5G2J34jN06O7DW39VDXyesXAvV1OPPM08I+Wibgw6CP/3RF3lA
         J/sgN8kmxCHQm1yPjqv6jgW6ywOoF4IpW2MoL37R1cJVZW1bejbJMjTMmi5ap1Vim8+2
         W1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHq1us9/l33jp7ZvvHXsV02ZxADrvuEj2RyI9he9P7ofrY5zxG3nPU0hxynG2tAKVGDyoNfWzmy1o1XgQ0kth@lists.infradead.org
X-Gm-Message-State: AOJu0YxuAZqGahbBYn4zz9BcyOQlvri2PK/W7gU52GV81Ab46tWlZKdf
	PJWxTi6zIfIgl4NH+TXdReasWLLUzMV5Uu5aEUm+1M5vEHM3QSzP+O196TAgPMuHJCm9JeBRUeb
	TrZjOyhVG5Vrm8yaJji3e+ae4/o6MtkOm6mDnopzpow==
X-Gm-Gg: AY/fxX6dXTOe0ggjQZBpwC0T1fhJ2KefE6ptQF7V9t0oiwRAjsHybwlAjPvl2+QPW/c
	ORg86i+8oMWK819u2Iral7nSImUquvlfBZuHDjRtKS5sD1vVbO64baibCCHbUDi28ZECYdOVo10
	8LFM3lLFKmirBUDtdpRQXcmDcPEQChD9r7jWwqekHPJ3mqnwN2hmITZK9GuZUrgoXMuEQiu97uQ
	bwFvLKNrW/LVMa4ePUXcZtjT+qj2y574OhtHoYtVGFhsWnkEs9AXce9wvtPwO8K9zRNQ7Q=
X-Google-Smtp-Source: AGHT+IHkKfseNVlbexy7OYWanrOUhCQ9xbT4x6amCXeiCeHgnckAsxqlsczo+X6SDJmlQDkKr5zQ1Uvoi6Pw/dvfyTY=
X-Received: by 2002:a05:6512:688:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-59b65225f3amr1166436e87.22.1767706136101; Tue, 06 Jan 2026
 05:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
 <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com> <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
In-Reply-To: <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Jan 2026 14:28:19 +0100
X-Gm-Features: AQt7F2rDAkeOIKvNG1n_1ix69cFZ19Y_sfdt-a0UsEok8udvX69D57IFSE6PaYY
Message-ID: <CAPDyKFrWx3FwNDAzYrsQTaoZtmaM+bnx=Q7c5vxjntv4L06BiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_052859_183794_764082BE 
X-CRM114-Status: GOOD (  21.99  )
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

On Mon, 5 Jan 2026 at 19:08, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:39 +0100, Ulf Hansson a =C3=A9cr=
it :
> > On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> > >
> > > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >
> > > Adding a reference count to the v4l2_m2m_dev structure allow safely
> > > sharing it across multiple hardware nodes. This can be used to preven=
t
> > > running jobs concurrently on m2m cores that have some internal resour=
ce
> > > sharing.
> > >
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >
> > I certainly don't have the complete picture for how this needs to work.
> >
> > However, I was thinking that rather than using a kref and having to
> > share two specific functions to update it (v4l2_m2m_get|put), couldn't
> > we just use a device-link instead?
>
> The device link seems to be intended for power management, I'm effectivel=
y not
> familiar with it, so thanks for the information. However, my impression i=
s that
> this is indented to describe power management dependencies on siblings, b=
ut this
> was done differently on this SoC (way before my time here), the DT seems =
to
> describe a block controller which is common to the two (defective) cores.=
 So
> power management wise, its already handled.
>
> Be aware that my intent is to rename v4l2_m2m_dev into v4l2_m2m_sched. It=
s not a
> dev wrapper, but a helper object that will schedule work coming from N
> v4l2_m2m_ctx (per open() calls). Making this helper object ref counted ma=
kes the
> live-time management a lot simpler, and since its not a dev wrapper, this=
 patch
> is not creating a second refcount for the same object.

Okay, fair enough. No objections from my side,

[...]

Kind regards
Uffe

