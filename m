Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C645CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=; b=yo3wNbIaN93UoXGSkQEXTy+Hh8
	gbTMc4Lynz62JO7piGWBDoCbHrCOAUs/rFPw0EzQ9TnrsdNJ9i+tiEDmuo5HSAMDQvKYPpGqhT4s8
	s47JOoHCkcPpk+8RFvKSmSj+9OrCvAGcOSvTOUQLLrNCyKF71tcWgHMSf6a4CqVwVAVOzBNIFOxHg
	nroiTeMk55iHv0GL/5i4z1gIpjJI0wa+F+Q47ThLrGZfZVi8QtBMlNvkoe3fa38N92eq5X+Ir4CiG
	/7npzFO83IIoSalY67tgy9yLSuKDRSuXvbbMO8Ig9qavMgqnPaTk+jhzx2oufzi/xTqOdTuu8R3+o
	1jE1Lfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDllR-0000000GCEO-3WSK;
	Tue, 28 Oct 2025 15:37:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDllQ-0000000GCDN-0jID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:37:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso25981095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665854; x=1762270654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=jo3eCfHsnuSX1g2WbwMhzajTvUPlwqmpI8owm49XSUoprYGXOZAJo11sRf8pV0P0gx
         hbwBB1+J7z1LFbXZJq7enRdJwsl7Ad+lNhE67BHFminjhuBS2+RWeqNSWr4cMBea7XWY
         z3TBK3cgGcZF+0LxoI9kxeiKnjFoMLyDpNu2zr/NEJyNnD3Stx8aQ6bpRQGPK7yGM1tO
         vKgtZGgakSNBCWfspAi4SCQKTDH5wAWYr/IsficCF7f7g6KjKeXNtJjZMRpu4dCczG2C
         EZ/5pHC1pA22ZpkVLP2EoJo547eC0SOgnd95nmrLA7cVX5bamV418RUxEiyq9sI4AsD2
         egAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665854; x=1762270654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=odd2jVsuXKwF0DoztWTRwBGWdAeTblWgq530batvBhKJzwKiycT8kji9Xloi83LEaN
         4AK///P1hqhg9fBUfXH0+6frV0b6zyXTDD6ZIhKfcyXXraQEKczjg7N+8qiZOniwm1Vh
         CKBY2demk/4idoKxpoTcfuh61w0zK36r7V8KH7rVc20/SF9U0IamgSmp2gW0Wm9VVoq1
         LT+1eBIMeQPE+MT4MHgb53KQgWZ9BuAaZX+XhQ6WmeuCwZccPrk2zIXRqdj5AW/50JT7
         stZ+GcjwnZgdlOfqminfkvdc1gySkdZmG3wpavrN6AjxwcY1yBr/5/mC7U8vF0bqm8Tf
         8keQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWhfSUa8L/N2yOc0mBKX7CGDfN5V+RWLzrUjZ1k5e+liYOxIf00Oderx266VSBwBQQWjflgqWG13HB+fDqV3Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRmBdLvE/mYHTNs8D3CV+RbklxMp3EI+Zd6BR15BhV30S5aAl
	uW4NLf+3Xe5osXEPJBKoNvm6JcRkwmewPzxa8Ejfr+lBl4tEwsDAOhiL
X-Gm-Gg: ASbGnct5ytmiiyyvv44hsMJStF74ttU0PPm64WUAZfO0zTo6gAeQQ1n8PT90g51nnQg
	UszjQym9Ots4tmk/wbKnGRKGTzgLlgNYLNcSie4xdGwGxL4keKAUxIBqEaIBRcbU2ikYcK+Zm9J
	A+WZHhKLpynSVm1E0aoS+iM62tjpHzdl8W5kwL41dCYcmSC36dyA7MZtEUPHr5+LCf79UV1skOJ
	AtHFDrxiis5X/xh9URNdgVZyJi5VrdCZpaZ79yUJxu5nO+gp7rlVjEtaDRCQ1dYcZHAANBN3TU9
	aU2vtDQ08qzUuPMx5T/0bZ/IoI/lBDY1crlY3SRJhE6VXSC3I6C5QJJumQ+E6BwhuXJmzJuI3Od
	Ub2fFNWqbtPsdwi/u25pu9VTtBZpwHLFR8970/AhCf/7WgvFMcmdUK83Rwg44Fh5lhpJ3WvLXZB
	nrE3cWgzTFcsG+jWcfwGQ1WQJVw/i8nDaqXusnk0ra6NS6vQgHN6cqAm+lWQ==
X-Google-Smtp-Source: AGHT+IHXOTFO2WAIn1ZujBJa9U0PAXYA4glOCwdtcmQllsrumq7MYqoGH/iY7FhfpKKBj/R4vTdKSg==
X-Received: by 2002:a05:600c:848e:b0:476:84e9:b55d with SMTP id 5b1f17b1804b1-47717deef5dmr32584225e9.3.1761665853339;
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm20581519f8f.35.2025.10.28.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
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
Subject: Re: [PATCH v4 06/16] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:37:31 +0100
Message-ID: <3656445.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20251028073534.526992-7-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-7-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083736_220639_1CD443CA 
X-CRM114-Status: UNSURE (   8.70  )
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

Dne torek, 28. oktober 2025 ob 08:34:59 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 USER_DATA register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



