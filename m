Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909D5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=; b=x1Hvg7HWXBFQZF7u7LQnmETBwr
	Vp38ftlQv+AVkqij4bgTdhWvqD/ZVu5gXpVjAKrOiUWfonNFb/aWOxzRGDVYlV51L+pLnYoUeiX/U
	mf2mGEA24TWRGhUsnOgkPPHlL6f8mOaffVw7tAyhWKIcUOb32f/9vRZiEw7itJeXIcK0qv7TutE8k
	/8kmGzstafL0DTba1nqWJowCeO0UfheMuHqix9t53A5tKfk/76KdEwBiYuE+N+82r1agfTH6P2lUy
	7vOTr+/HNEWmZss3LIy4skHHR5dmZD0cwWQrKLla+iGn/cDoUXnUalSwrz8aa2WCY6PHLHA6vSPq+
	2EnbL+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlkl-0000000GC64-1zB1;
	Tue, 28 Oct 2025 15:36:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlki-0000000GC5A-2S3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:36:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47118259fd8so47654095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665810; x=1762270610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=hFAcJWesmMj5GjntKz/vFXqRM6WMldh92hFEMU8VB+wLUEARxU8He31HekOXw2bzGn
         WTr7qytIkXjXGFf/Pt2Y75q0csHL33qTc8jQnbcUMExoGQtUWStyA/jA0FbUOFwoUv5E
         CeXCcDg6Lu1j9ZGccCjvbvrPPp6/z3UVxrQqhd+eaxfAi8X7zqPvqfT2Ng8wVqjPjg9u
         f3B9qiFIiVtQwZL8wy6/PExUkWs1ytgKaWrRSZxMCBShQum+QhyBdlkRQy3mZ9OE6JhO
         MRU47J+RbCkyxTXyOFlM8vdahHovKgDJW1mSCZuJgb4S/S/KazJkfmxIYHlzEDDW8vaw
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665810; x=1762270610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=gw0PC7WzTc2exOJXFb+PRL2voL9KKX5OnES6sUaPcP5E+T2PhalpIfdKTchajfmFRs
         n5+Wj5eLGGs0OoSn9S5HBB/zSum3P9E3BKKeQiPKrYVofmB8oDt2qK5cQXZWAxT5BBrN
         nS8aF1d2HSMVl4xDxN+jrKsVqpTM6nOZwZFFWUlfAuNJ1sQ1y3rPRuSFquwgTCnIj87i
         cWz290D8eqnIQEgMDOZeS9ttOUwhmsCKiIKvxNt6STkswW0UJZAm0suguq7xV4LhmNUm
         rh9omoj95yluLlbM5V3+SGQC4Wp4zw6ofsghQk0qi7Kf6JGNFPaybw+CIoW+fe3XLNhE
         Cbsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPZNsAjb16Ck7nplZEF12hLVCG0OurevyTNPRJmKwrltu8I8oSvEZaV8z2GcKmUmczzm9SXpJ9WvWyTOBaEE2s@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDOEGnTvQkhCdl+yQOCmtfiEhaGQv7oIMpwhHuKm8T8T2J+Z2
	JABZWWECMFtyzZjTALls3re2HTnpUZWsz+2PiUrJnaG7gyg2MsYNWRp6
X-Gm-Gg: ASbGnctmhYuZ4ssnBBZ+DPt/3X/zeDkfF1MlwluCfpDjqWK6Ou6QA6f19+9S2lRgRuR
	684jIZflxCBtPcGrYNxtx6rLJKYUYO6TMhmaerhqOHdAovMxgdsuBwbQb7R9Uc7/TYXHeB1p6yk
	FVU0Bbioc/yCRB31pMT9wYs9UvZ3StYO3wvPgww2hN9LlqIGk0RsURmxhstzyVXFr+AqXEdr6ai
	CwlJmDwuXXQUUQT5zIusXfBV1oULITEyG6u+vLxiuQPyV8tepzrs/Bg4TwVerXaRGq4pUQh44Tw
	wQvMR19cGEkHh0VeyKvUGU1j0HRvnCvR4O6yKhNYabXv3wRB5emYqxGzOGNXwUXvDJ88dWQvoqn
	UWBQMDodQfWhqb/CSuzt3nCwR91Xc3cogv2d56PJ+GMIfYnMX+WdF1fJwDPkVSF7EN6SVl7Dof+
	en1EtWfh3rJUwdL9aoEujsIIczERlsyTuzKrGz1p/v7SvcaE1aWO1OBJpXyA==
X-Google-Smtp-Source: AGHT+IHcEqxrDGNbCr9Qf3fhYUvlJSJPyM3H2iUm9WQHT2tvvW1arfoNj1Bg06ZOGX1vRi4tbPm82Q==
X-Received: by 2002:a05:600c:8216:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47717e30970mr33449425e9.26.1761665810438;
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e41sm202105775e9.12.2025.10.28.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
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
Subject: Re: [PATCH v4 05/16] mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:36:48 +0100
Message-ID: <7866116.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20251028073534.526992-6-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-6-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083652_647094_5D69C6C4 
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

Dne torek, 28. oktober 2025 ob 08:34:58 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 ECC_ERR_CNT register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



