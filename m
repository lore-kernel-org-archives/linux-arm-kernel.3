Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33998CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=; b=WZs8YCpYrK6aUx5E54HU84ZCdC
	ah59jhgltYOMEvymxahLOYSrVDxp1GZWpWBmBgfts6etoOzjzgTrVDa5dK9RMPcsxn7FyIxnPe5HT
	iSKRsU3x1RChD/3/dZIfcAVZnFXK1tx7BSonTSx2Z9P70OIZ65gQFxR5+TCiYNWZ+wWkYIOV9pIbS
	yD1PPN7SUQPCAWvLEG+NXSvBL8tALQSS/TPbEglTYJXd5Zu8CjDDE/K+yqdZHEHSuGTUSI2L5PrA7
	ja3O5L9EcBgr0FLLz3u+leqhXDfz8peH9sHGs84zngAK1fMZrH6XKQyR1RxKxo55JgEcwypb4z3u3
	t3H0SRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlt5-0000000GDiI-1OpK;
	Tue, 28 Oct 2025 15:45:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlt2-0000000GDgH-0TXD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:45:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso9132975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666326; x=1762271126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=MXC2XIe3mQmshp14iVRdYFSu5EUq3/q+8PEHL7CSzoHa5zP+6lHybkycD19jQsEK25
         fXbgCgTLRf1Lz13qZbvF70QwpPu3aY/Kn9GCc7vzuSRMVyCRmG3s/pL+iQ1ypFNzDlbt
         +A/I40ftd4Zbt1sLhFYonrk8VWM628tLLCh5NNnOj2trunDcIu78HMBv/aDLM0T6TJ4F
         636pxR8TVYBlDOX13RBSp0yU/dE4Ga/5S189A7g7FDNr90r7pjfxzm2dv6YZtpO9Fxpm
         Y+ugyxztQQA7OnZY6javzZEJ1PfjRA3JbQ0cekG+ybOxm1ceAnIQRQkene3uKFFRTiLf
         JX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666326; x=1762271126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=uPAW3VRbAMo9VeU1G3zBwFvZDMNAVncjtk2af0H7oauBN0PNGeMPtz90ESoyiL0Fzi
         AJSLnxUg5IuNZb3lyJXb2hKCgj8X6dUPAPIqljqo5mUGdPdlHxHMtVBpcaMJnd3kjmXs
         cBZQaHB4ykFrps4RRZQWzqgQ3P+4SHbMyTbQAtJwSlxfSDX/dzD1Nhp3Rs0tRK3Dy6mI
         LxfTyC5/fRxsL3m9B8GkwcSg0kAFGvSxXgp6VUj54YFr3TKhnCvwgQ8GzVWAQOl//foP
         vdTa7SqSSZXP9GzZtDT5bzozurvZXNYujJM/379W0NB8btIsORAtUVkfnsPVDDVRXk/a
         E69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNRFiV3oH+W0MwHiVIE0Cfk0fHOQCbGKYvH5JajVxio09oqXeLQE2bYx5ybXCBEwwzcB7YYipDM4LeGzfIcC/S@lists.infradead.org
X-Gm-Message-State: AOJu0YwXMO3YsAWiy7PZdegDu7fYLKSJiZTa8IjG3tVU66CuEmx0tyek
	qUFIUgZFkklgQtcRwGpdVsbPieUsFHOMXwCetEibFWI0SL1MrTadJEOQ
X-Gm-Gg: ASbGncsU5TFdZsJTm5HlY4HSNeidvheQPnx5b+Rl5pC/lVojYYY3rqmD0MfQLaxhGab
	DwhtbUHdlRySF8LZ3yypTvKKkF+7LEtpW4IYkFPgELEc7hk3ErKVix36nrdZCPYEZHFd6sPdgc8
	RK7TpRrnby1Xx2htkTdgd0srkXGASHnWHpaWYZiBVXSNC9zA4cPhlIkuyP89QmfLRLWnXP1sMgD
	sHOdkJqjzpF+FexlkcPGdj/nazneX/VA+KV+/IGdjp0kuNW9KyWCtGtZhhOOYTfNq766vrF4dW6
	9Oq/nyiLBy+aGfAE9hVTHGMC+so2isQ4Qk/L+1lrqyWZPOgBxyab0BzvIwbY/vm7iZ7yRnXBII8
	rXRnLYL9Yo6rhM7fOhKXv9aoC7YpiJM99OV9maiL2IVc4FL5sg4KaHlzBIgXnTVnwHUTUP4sVjN
	IGyAL7uoaDiL4FtGFYfk1H1YQAT+kwXM8FqzBIkRX60boO3o3XDM39elyGYg==
X-Google-Smtp-Source: AGHT+IET/efRhuIuFB2PFKn8DXpNlkISko3LPS6KKpyQ63Wdmub6V/UZ/rCEDYkQXXUtyr4tnbPxTA==
X-Received: by 2002:a05:600d:8386:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-477182e1357mr23793205e9.19.1761666326096;
        Tue, 28 Oct 2025 08:45:26 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm22927131f8f.45.2025.10.28.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:25 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v4 12/16] mtd: rawnand: sunxi: introduce reg_spare_area in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:24 +0100
Message-ID: <24133952.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20251028073534.526992-13-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-13-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084528_158257_C038E1F3 
X-CRM114-Status: UNSURE (   8.58  )
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

Dne torek, 28. oktober 2025 ob 08:35:05 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 spare area register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



