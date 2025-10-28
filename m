Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E8CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=; b=sEaaEKCj7fyP2vNg7Iv/f+mlji
	J0e9SkX0J5kMK7SZ4HLq6tnlmPdetzyBfFL5UPVnAqSFgxjBMxSKpjTX0NX7S1CRkjLX7FNpBktne
	zj6U8bjHn7QhVu1tttaPBkc2IghtdlSkeRd7A1gbLJLgNzZauMwdU0ic+XEJdgvI4LR3EUIz+F+Ui
	x/hGZ4A8ZwynB5Cn+R60eIXZCDLVt5jNjrzWN3qL49KhjHNs0kA+vGAHE/2q5hNdCTgKSVxHdRVMH
	lleXZhxrJBtTg1gcFnnA6eSn9S+FIfAJOSG7pMfHreKY6ZVUpZ70ch4fm9z9R2gDT4S8NAHBpgk2O
	MEgze7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlix-0000000GBiD-25Mb;
	Tue, 28 Oct 2025 15:35:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDliv-0000000GBgi-0N2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:35:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4270a0127e1so4871932f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665699; x=1762270499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=IMgjqZ1NN1cqRTyMVWBquQdHxAgtRx26M9cbkYySpPX/B1cYhtT6nblxzBxM8YjCR0
         rSO05ePP2UZVrGm5c0x0i2p+76W/If9WcRNF56fAl8K+3ksiFgjH5goeACKPVoXStiyt
         vQIfc0/PShUNnBIeN6/SldLJsNlATguWQTrwgm+LiS24xfL8JZNnQ6+vXwWfBmyjjxTV
         SMV5nKiT4AG40yjH/ytBuP8J6sjA4hjbsKzONDHBpGV1JgApkbhdKWaU7yMPyS5X8FCY
         67L5nke16LMZFCi67rmffhBfQwMUcXuhB2oj1c/gXi/ghb3yz6xjcKUORNBOFD11Emqm
         Z8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665699; x=1762270499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=m67cXEtcp2m80Or3kGHLIocLSPdK9OLuTiRQzPr5NFyJ/BIoEogrGmCIehCRG99ssm
         oAMyFQZt5ULpKER5dDjfICE/pZzOsO7hyHzRrk9+BHwx1o39NM/ey3M1pXNcfq5sKl8R
         jkZDl8R+vGsOQtPPbTGKyikhUsuqp8dAFpoR+e+EnY2vDOeXJbYVG68NzklGMwlJp6on
         gssW4ul4cuuow7gJUSj2dry62htNAsgaX+Mwlr2wtHQWn+4jYdUqkypUjG9mw07pBUls
         +4Cei0PgpuO29fIO37NPPSBbqZSw83JtD6hsZXQLshhKFS6EHRWm9SdvTRJFG8vwk4+9
         G71w==
X-Forwarded-Encrypted: i=1; AJvYcCW/8Ry1xTm302dYXy7vFau/f+AAJFA8Ce8MjDsrYK00CicWHL5gakM2l6d3TKrln26lvzf7QOYywNUzsNFoWMAg@lists.infradead.org
X-Gm-Message-State: AOJu0YyGU1s6TB4LXsywzXjrFBboB5MAdVecq0zul7GVv1SvOBnAQgF1
	E1+zzjKJtUF5Y67jvFJPt5LaDxDJP+O4iYxLlvzvcoEdO+TxfJd5rP51Y6GJcXlv
X-Gm-Gg: ASbGncuhqPktfxyyp1zIGYhjJKukiVl3+ieCZpL1sewI0TUyYPvMN80QjbfX8Xyxte9
	/w5SK4A+Z0AfK80Rg1Jsc0ulxlUyfap65WXBP5FhEt+tlbICpz7lIdCR8/5GmwxbUxoNrRLO1Wo
	BCRN0gQYGuwaW9U5N8WtZXn9g3s7JPl+L2khxON2g2Nkpi9KakOQV7OeMAA1lhX5iC8aMhBu58T
	dKC5Fxy2gZckn/WKVlvVpsq8CdbNrjaYfyoFPcd9u3RgvC9YQkkueKe0pdfrKPQW0v4i0La9Uhy
	Z+hKIMvm6bwTlUAJ+9/1Iib1S6FLMZhr22FdzOoRN+Irp3XuFbnummif0WzeFcj69prz3aV9OWh
	PUa/Pww8ZDebsDefuI7md6pNdCuRgaESzNpygcbDegPShUAB7Syhqr3DweVdZMs9095roYh5WRG
	KJDxQ+yHs1gjxSv1+0Vuv0jBsvHFyIAfS0VH/Je1bUivZ/ZRHPdN8xnkM62A==
X-Google-Smtp-Source: AGHT+IHQaqAyFKg0dIVlFNzHvuX0zpZSii67laWQ5yWofyqAlv0IPJ4MzzJSDYza6+cEoyhxJ1y+9w==
X-Received: by 2002:a5d:5c89:0:b0:428:3f7c:bcf3 with SMTP id ffacd0b85a97d-429a7e86b07mr3600391f8f.49.1761665698923;
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm21334532f8f.6.2025.10.28.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
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
Subject: Re: [PATCH v4 03/16] mtd: rawnand: sunxi: Replace hard coded value by a
 define
Date: Tue, 28 Oct 2025 16:34:57 +0100
Message-ID: <2017172.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20251028073534.526992-4-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083501_146336_64F3AA5F 
X-CRM114-Status: GOOD (  11.10  )
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

Dne torek, 28. oktober 2025 ob 08:34:56 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The user data length (4) used all over the code hard coded.
> And sometimes, it's not that trivial to know that it's the user data
> length and not something else.
> Moreover, for the H6/H616 this value is no more fixed by hardware, but
> could be modified.
>=20
> Using a define here makes the code more readable.
>=20
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



