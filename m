Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2567ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=; b=dg1ik0fwcswDDMRuv3FAFbAzvu
	GJoSj0emFcQXrNuCKlZbR2mev7MRqjygYkSdFgeit4AYtJjSZ4dDieVBojpEnhhQDTb4UKDmk0ye/
	yLPHjD+YzKBU1G4SKznNPOqa6rHoyqH1zTsdVbmIGmCsjXUZ2ThAyws08XrTZYWJkIr1zQslP3+Ff
	Ll92BmdXF1rFhwBxPrvlRwdthw/vQ8XspEn79k30d9gWdY69uJXkNUma6I2dpu0Gel77Ax5y94s7J
	3reQYO9Ajq1RcPue+2R7P2WYnBn+Wg3rICXqR17/st/Z1q7s7qKDOQY4YjES2Vp0Mp1uJteAknYW3
	FCdFKOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Cd-00000008e3Z-3gP5;
	Fri, 12 Sep 2025 10:40:27 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Cb-00000008e2t-2Hep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:40:26 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-621b965a114so997107eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757673624; x=1758278424; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=;
        b=ohQiEGIkaVPgWPgMHKy2IulwKRrAYu4QvFzGqiaMzpaT9pkfPbJtwHQV3ezQJ9wiPc
         t7z3zQuQJ9gxFzABZhGTxWERKQZgCEmSc8pnlPtKqyPPHvx6PLfG8o/tgVeBzLMPUI+m
         joSrEKBEweJc8tLs3H6HrK1U9HR6G17gntg7a/jbfrGxfteGPFHO6lRVlj6a/sgZNbz7
         RkLF8u6bV8uAukk9afDYRruT1kZM7lV03eTiUos9oof2rUXNlCiWg0CndnnujslHqGbP
         g2A49fsPgcXz0BhmJlpVRC1rn362rD+4xQfzoCfn9ZgDX/Wd5gcqSnSXtwdTeuulxr7C
         UU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673624; x=1758278424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=;
        b=EMG4pAdVmmUC5qbvu2Z1qOVqZWgtTust9MBl7bEMtuZIM22uEj1m9A2TuaghlUla9e
         U2uVsPhp17BU739zNhB8+OcFQqZjhiQwoMAPUyCCjbCU04aPhgJTgP73WEHxqyw4qDC2
         ERdS/6DX3PtUQdCr04PNFuZGY8kckoCMEYxLiscmpNWql5CGr5e0nhGH/eGrFj18eBBA
         8zldXmR1zSpMpQs+KkcTnKl4Pf2KAQL4C73LMZLn41DFrhCC5y1r/XanY+hnZF7wzQr4
         0PVrsAVaEZNuaTGAku7asaLysKGij4Ng7RoHgeaGdfOsZ4OX4RqbZzwZhTEcK7Ws1FMP
         3dFg==
X-Forwarded-Encrypted: i=1; AJvYcCX1G0N5HCogzMRGWl1cb0UZQSKfIzevTIkQ5ZWBejMEcybQ8kPWd2LSb0BEpeseK3Dy6+r5bFbu9hWI53Kywf68@lists.infradead.org
X-Gm-Message-State: AOJu0YwpHvIcUBVxu6oAHNIrPVvv0p08WntJ/XzkHRtwDg5GEX1W7+Ax
	wz72mGSz0NmRUKeHAAliaDxWkFi0udFpFRZvamlhEfd3R9DWSH1S61/tD3nBP7mGrGoTqX1wU/C
	Y/UcJ1TqSquMS8cffHILVq3chwd8ZD1i0neB5OeAHgw==
X-Gm-Gg: ASbGncvZ/QgP2NpkZvsSVos0iFUAMAx9/WkCDDaqbgspC3i1PWsaGE5Is0QvBzfZsE4
	tT8oxHoEi20mvyLEcEPNqcklXkZ61gnxkBVHd7M3/Bl0ivT8FLBAXQuLU1auFsv8c2E5qFm2tTJ
	p6Kt1S2zYkR+rz03V3zMQSiNQkPhpAZMtI/DPzBpa72TCc6+eX/eJ99jDbxRiffXdXiVEGXXGFO
	Ugwx2uIlfhJEQcCcA==
X-Google-Smtp-Source: AGHT+IF6PYieNgXpIa6hYHoBPz39MBN51Z0tSk5VpF01b/bxMjrI+5a5IB+fKLhWJ9leyknO44l7JDgMdXYIXbH0W9U=
X-Received: by 2002:a05:6820:553:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-621bedb8f94mr1279631eaf.6.1757673624624; Fri, 12 Sep 2025
 03:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be> <20250804-b4-gs101_max77759_fg-v5-3-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-3-03a40e6c0e3d@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 11:40:13 +0100
X-Gm-Features: Ac12FXyvumHdbJffBuyBixni6c5DHFCVdSez0KdSftksCT_bGFTh8Q4itCgi8Pg
Message-ID: <CADrjBPoA939OwErqjV4OT04hgAfDNgmG2o582Q_P6CN6iWQgCw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] arm64: defconfig: enable Maxim MAX77759 fuel-gauge driver
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_034025_589901_31A66B0C 
X-CRM114-Status: UNSURE (   9.46  )
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

On Mon, 4 Aug 2025 at 15:25, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Enable the Maxim MAX77759 fuel gauge as it is used by the gs101-oriole
> (Google Pixel 6) and gs101-raven (Google Pixe 6 Pro) boards.
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

