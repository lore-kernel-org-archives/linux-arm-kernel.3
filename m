Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=; b=A3OoLVYuyzKQJhF1jX/YPf0v73
	l6Und3d3DlOpRjkvdkkEY2dG8imSAO0hLdSyIpf4v3pcemUJ8tJqPRzSMV+zZeACRSzAXNlqX8F5X
	oHMAdNFmm7SfdunnwSKLpRne3XezMe3UzusBkTSJGfvJuK1n3n7i+kpkSGms3ly+uxRcqz4B61HDc
	c22wLbL3f6YWEzaCOO2vfQmoD2TOCSzVSXske2WKfI2VrJe1X23nFKvYoeOsU+k6HH0ziPVvNNgq9
	4drrDD4w75WK/UP4lSJ/yZLiR6h5AfJ2CX2OdrvaS59MDVL/RN6p9AprfBp8pvF5D9wsxDuaUGMzd
	ZVp5/oRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlsm-0000000GDb9-1489;
	Tue, 28 Oct 2025 15:45:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlsi-0000000GDa5-2Ea6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:45:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47112a73785so39426625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666307; x=1762271107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=g8anmHndyjs8TMmNijCJ32627T/kZbyHPm/eopB+gt5C58mwyf+wqSWKBbcKiHvtJe
         9GageQaiTgavdtCVasiXVKdp0HCQpkUYxrKEDE+zRjqSelekjXxT67RcPLJMJ3e6VBMr
         5SoeuRHKOwtHq1Wxw8mo8fnbgNKXCAwNLd1RzlDWk87qUsejGFHARWeSNABY42eu2k3b
         EgjcdzmLKGo8Sxof7IswxhFrUkqxrplByrRt4fl0qlA3B9sDvddnE1j7cOt5EybrnYMi
         tZNuSWfu4tF3qZXE3VcokIYLhm4IwSR2bF/cGvvh6eN8CLFhsnJ42JW6r2GE0SVOmDzq
         rEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666307; x=1762271107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=MzN+kE3uVI+T/fpYz5oyBt6BvJKWdisMGyZWmLnfI/ugBDTKFsqeGLh/55NWk2iDjF
         wat0Txb+YOJ+qAnRZIIoVWek9Ioc0hO9RTfZuQQYmHoGiaVYpWFb1+lLwlUQM70VMId6
         2mpXIFa5XERDMyX9v/tJg+Bg6j6ull874+rEmV7YhLOf81enWF7vCnAIq4FZiakTtMnD
         Q0ZXq26JiiqKcLiBjfG1bf7p2XfXxKYwoE1RUlWnLugSJSXTsh5AUfCaDmYR7VXKp6jo
         B1LndBuatdICHDnWwfGg3+5eu3rGFnKe64OiVbj0xng1XKpCjdvDsdujranc+QH8lNQx
         sjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2wyIQ3/L/22rFUTRRKFgLyVdxAqKKfcoAPujHnzCQPbNGHx75MCw10ep0bcatyeZcRXZdOs3Piik3UlG2j/+B@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Iq+zsYXzpqjFYk6Ts4KGlz2f9Dt+e6pG2grry5pvR/0wtWYr
	KSEGgamB8EBNKjXOe66jxmFACM3lZDzd4SjjOQ2NvfazMgvYGmDuMWig
X-Gm-Gg: ASbGnct9SWwx3nAKo7HWOw/vwy4wljmlvMV1e40/aUnU2R7QgORuiR/BdJzTo3O8tEG
	rN/1O7Mh1ng/D7cM4uLi2poZdY8IkrxKRXq4PG0LtB9lY57e0JQjrNZlnYFaOZdaYm8w/8Wsnnq
	kq4flJOW+NJ0xamYm/0x9fb9P8mmmt9y+M29Cg/WJ//rqfO6VB29JaqzLD9N474rQ6xxpKCMOGx
	Rqxl3Qz4eHYHNe6S/IBpe0a7SlpY87Ay0YPWmAbbi/4zVfGTIAqaAhxcfpQAZtJvbaUSZw9AH0l
	iLAuieL8IxEQZXiBqKKJex/GQX56k1PNy/c5dPmSNgBr1dtk/ypkcYAoAPFMSVbFJhvUH6Mh+hZ
	Cpz6hH/hV552OqR/+2SeubXhJcQ+y0Mjw5QHvJhCDpyvOgWGlBGZZlWTN/DvCBeOV7Sve/mnAuu
	pQd3DmyoWTAqQkLIBTGAZjnsFl3gRg5AJRKMB1qzXXc9JK35jxun2aLk9B+w==
X-Google-Smtp-Source: AGHT+IHar4ykqVMzVnQnpMNRdCULBt0TW79PeUZzYouW3L2ifb97HosTgMs4SMM16AylRCMZ0rMIQA==
X-Received: by 2002:a05:6000:1862:b0:428:3ef4:9a10 with SMTP id ffacd0b85a97d-429a7e8500cmr3696482f8f.54.1761666306579;
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm20562147f8f.12.2025.10.28.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
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
Subject: Re: [PATCH v4 11/16] mtd: rawnand: sunxi: introduce reg_pat_id in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:04 +0100
Message-ID: <3574896.QJadu78ljV@jernej-laptop>
In-Reply-To: <20251028073534.526992-12-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-12-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084508_579151_7294F3A1 
X-CRM114-Status: UNSURE (   8.66  )
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

Dne torek, 28. oktober 2025 ob 08:35:04 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 pattern ID register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



