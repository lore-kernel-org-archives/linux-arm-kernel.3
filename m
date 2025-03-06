Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F660C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=; b=OopKBd9y7s9WgdRCR6mZuXnAZG
	5HVCv7GlGq/kDYNzCtN1w2VyLYH+iEQQBErxVPLJxUIylpKt64ZBODB94OhHcpmfaZcbZe6swPdvb
	vavR+OUFZM/MEQdEm6PGNNwD6yAbfyinYQcif2rnYe3xlsSMikox6sJFiUdM8mWq5nLfYQJSXGCdC
	Tdz/6C8pdD7gAa2eUK7jYgPdjBSmVm5xoyrsLqaRNaBQ1OifQLyJinjmVmRwpmmXjF/2CTvXSvUNy
	9tE+NUb9GfscL8s1zIH0W3PFWfjg9dVC8+vDE89asasj11V0Ms9QwI9O0rF1santcwjdbM/2ckl7U
	KDNnHqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Pz-0000000ATQ1-1C1m;
	Thu, 06 Mar 2025 09:21:27 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7HQ-0000000AS0X-09dI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:12:37 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30beef77634so663361fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741252354; x=1741857154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=;
        b=uTmyrNru78/575GGn+RipL0inGcZVudlMGMRZCMDpMMzSknUBBnch9u2YaCz/eQB8T
         9KLcWtNmd+mZoCmzISl6L4f58LoVxZArImIfYM/KYtZY3OtgjHw9TKIYnmB2PCKstJqk
         yB4Ee7brBfuBS2IsJrn3TfSExjHsjdgizuhiqX4p58BKEsuAnaCB+LKhehB2ykdOyClm
         cd7cazEhMmfP/9NhqhmHJ/PZvUub46ZIfK4zKYr/6arpDPo+Ydss/tVBHy+RX7E4qRX0
         DA2zOi21Q5NAQu3Bk6OoIwlsWgRtMpfdHrQVIj9EFRFaoz/No2WM0xYxUawKNnUsKMKT
         ly8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741252354; x=1741857154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=;
        b=czLFDLjp2c+Wo0xmSq5jfGl2C8GFGrnSUgszg5hk3lpF45+S708dmsK7RQ2IZmKPwn
         T9VasCkMm99mqqmbstObsR2nKOIM2hQrpQ6WwKtSzeDUxs+QFH1rlxyH8rqN2LKD3K9J
         7yIkhUsJHz4GRVFHQph5BjE8dJU+lyRAY+F15vvszwAFO20/IY97t1mQRRU6vBqJj/29
         yp/6d5qjVD2ucv+m+V6RUBuiNNKXjT9oa6dOgsJPcB80ojbvpovIOMcAGO6cb8nrUxNo
         a7u7eYPCp/YjtagmXtqQEpxDM4OdhW74LfkGu9C0QtHuaA7umKskREMCrPRrewirbIKQ
         zcRg==
X-Forwarded-Encrypted: i=1; AJvYcCUHzZ0Hhu8WHeJBpQwZaeigfuphNx95PFvxC/Iy+WqmTJimL5tR7QM1oalXoue17msAfqjFra8vMmKqVHR9Q/Bo@lists.infradead.org
X-Gm-Message-State: AOJu0YzcMSTB+kMcHu5ps4+GOTNP2kBFpzWDsCgbvVQtDW8/o5X7HMp3
	kKoPx/EG4aIFSTmftL1qlTCgD0HNPSD2Cb0q6yR6ArSIRUZ/V/Oor6R08DWwZXVP1bURP0c2kVd
	rdQXkpgBMnIoeVr5hYuuL6r6LOLDUcr4Sz7QuAA==
X-Gm-Gg: ASbGncszMwc6JaQV6zuLwSaAdc51TAR5vEYTBpBj0W7fAAWxsw3Pyk8UPwZztcExVQl
	l06mCN8oMg3CXtCIukch34nLorHIzN/eSEgY1mMNc0Hz9nxzZlhq1wgRpNbrEiv1TLJLIROZ0fi
	fLLc5O1jR02+7TQdd0OkFk8TOgRA==
X-Google-Smtp-Source: AGHT+IHJbjr7n6MNFdoyJ5OcRjeliVrB+L/QnglEfbXH7bLR2SWadB2qjeLyT4uRMCDJc2UAADFOOmMVPfRkheSpHCU=
X-Received: by 2002:a2e:b8c9:0:b0:308:efa4:d277 with SMTP id
 38308e7fff4ca-30bd7a507f6mr21783241fa.15.1741252353675; Thu, 06 Mar 2025
 01:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Mar 2025 10:12:22 +0100
X-Gm-Features: AQ5f1JqQwmuBLuVbVlZaXchGO6-cZ55N78DkfVd4KCTXsG2vg1w72ORT3ZwrFbs
Message-ID: <CACRpkdZKbEXEabB+4uYvbBRXfFR_Jk-hHVtrZYD+cpKXgcMsnA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pl031: document struct pl031_vendor_data members
To: alexandre.belloni@bootlin.com
Cc: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_011236_087202_806A43F8 
X-CRM114-Status: UNSURE (   7.48  )
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

On Wed, Mar 5, 2025 at 11:17=E2=80=AFPM <alexandre.belloni@bootlin.com> wro=
te:

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Document the range related members of struct pl031_vendor_data.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503011015.SYvdddTc-lkp@i=
ntel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

