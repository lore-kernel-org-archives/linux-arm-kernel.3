Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C21C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=; b=ua28Ji++AP77UMkTUroNOZFRk1
	kysDx/3CsGSbz7iLgoJNdb9455u3CPZjNv/0MH+dIjiZdKZ+kucIdREbC3LXZq55HtkDAdZngI5lU
	FxwydplbwhWksZ4zre+L0//YjH7GgjJq83eRakT4IL0/A0D4SxgPPX9MxRONr+P8ZkYRAW1hRL0f3
	/vFDFTT8Bqov9rVbdDbNvUkqsbsYN75SJEyXjr7wc4V4ng9UxiIdFbszKHOXfneUryDNCbg/V3hve
	3o7tXuYCGJRbsvn3oF7jMs+vMGylCTe2B1RY2+btlXynRhpaCVJvQJziUVFOglb4RyJrUj2nicymk
	cQ/joUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oTt-00000007I2y-2ZiR;
	Tue, 15 Apr 2025 22:10:13 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oS3-00000007HeU-3NE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 22:08:21 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso60013841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744754898; x=1745359698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=;
        b=EwYozCDWAflAg2RnENCedTks9iOZuOoCXul4wuPgmj4QxybngPH227osEDEceK3h60
         G293kHTBqsW/gVRUeZhW6qh1tmoKjPclDTnb6XWiBCBtVBxABmdZNHuC16CSsZ1+M5f/
         WAZfPVFT1aiPxiMbzP/QonprLPK+7HW0PaPMenQZslhxEUy/h9QOXjnJS6xxLKN5y7k/
         SFf9E1FHZmRsgoHrOk5IY7oa6QEedDyKmFBWQCsxlLeDWxwhj74hELOik1SD11c2/t42
         8YfetEoawEb//CVfjzGa95VFygjfTJx9pjd0uUyCa9qEGzBIkDqQISBtj0SBIlThLu9Q
         wg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754898; x=1745359698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=;
        b=pi4v0ZEbv3GU2e3hMJeHm9GzHx04ldrJkll7Ojy8H6g1m1RBBKbYke5xG+PedxN1UW
         ux5js7TmCodt3EQyXfo/Un0L7dSrj1NpcZGKPc7HnoaGtBl7RVIij9sK99CrqFXXZpjo
         +3mTLwnlDVO7XjcUdKwtMesOVD+QuPOJytuFbZIIRe3E2I7ma2XlNYE5ZCC2k3Yw9Wre
         lDPFxfP5BM8F3vy/9ZQNS2wrzQfyf3v9uQmpiA+3UUhAvn6Fitqvw3IWQo/Yj6lO0AqF
         XbYDIhsMdRQ75Fe6eNUMlneWTGPEGN8H8rgNdcRi+Vu4nEQjz0z0Dyh0x2OcfpqjSLK+
         PIIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7gsLWIJnYbcZifABCWu3vdDGR4SdVWPre1CGJvVDuxzgVYcAXOIrJcg9FGy+F36/L/hZzhAJsAOrHEu/FzILo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8dpRatV8MdYIeftmau0Nb0kRVv6I/dvltTtb07sFZIfJY7LQS
	zphg2FRWEqLoYRFKq/aoTvR/uGK5WTeAOlHXIdhB97MWbEWj5uptvvL9JcP4/SO4ef3O84ohWiW
	DJb1c4AjK/KPN0/hBkr7LT+HamSKVZnnorXMddA==
X-Gm-Gg: ASbGncujvnSmPxaGnjn0vH+m5ohcDmC1MvIDXAUAPZJPmj7znSsmGJ4yCRZ9fYgij58
	YpyYSmL+kjd8Uvn0Z9XNZroqqr33ygpLzHnBZ81wcF5etE/97MxD7tVrBX+hBaAUGtLxixNvkr/
	FLnz2ARPvv3EGRxtBEiQ2JP7WhvwwFB1/A
X-Google-Smtp-Source: AGHT+IHME6WhXalxlSPMh3DrzpLBS3m4KTrSQRda1Fkzzwg9vWhHTJqmuOgiRLVa0dHhEZ5Zf/JplgqHpAebpbRY5D4=
X-Received: by 2002:a05:651c:1470:b0:30d:e104:b593 with SMTP id
 38308e7fff4ca-3107c36e105mr1677811fa.39.1744754897789; Tue, 15 Apr 2025
 15:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250410023652.8266-1-hanchunchao@inspur.com>
In-Reply-To: <20250410023652.8266-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:08:06 +0200
X-Gm-Features: ATxdqUFR6vsrzijVD_Qjdt1doHFGMo0fgRLa54xDdj1l3AD5b73FKPjghdKzqJ0
Message-ID: <CACRpkdYhsoermgqTiLqUZHUL8c06meg89F_gei1CatH6hJ_nkg@mail.gmail.com>
Subject: Re: [PATCH] ARM: Remove the repeated word "the" in Kconfig.
To: Charles Han <hanchunchao@inspur.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, ardb@kernel.org, 
	arnd@arndb.de, iuyuntao12@huawei.com, ruanjinjie@huawei.com, 
	ebiggers@google.com, david@redhat.com, masahiroy@kernel.org, 
	dave@vasilevsky.ca, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_150819_838460_363E5F80 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Charles,

On Thu, Apr 10, 2025 at 4:37=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:

> Fix "The the" typo in the description.
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Please put this patch into Russell's patch tracker so it's easy for
him to apply it.
https://www.armlinux.org.uk/developer/patches/

Yours,
Linus Walleij

