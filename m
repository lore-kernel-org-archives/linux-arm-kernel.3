Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFHh26tngjjOWxvj7gs0dFekGysBV5VC2fWJw/vtwp0=; b=oOEBbEBQV4j8QxwCPXOikLh7x3
	GmzvHh/gP1OfLxdweNWlIgq8jkQretrS9w8phDd4XxsJ5STj3+c+FAFZcKIusrJVhN25nnLCuGyTf
	8AZ/yxsVqOMU99B99MhTvzclQADtwUDqoDM2w7LIp7JMNj86rmM8f4DVk69jVAriH9GqqbUj0FdhR
	giS37OhIL1ItJMW2FXbz2ciTCfJjUf9TFlzYkLw0v9WVuu5X0iyqOq3tOiCODDbiVg0e0v029u7e2
	9VowcK7E8t22gfQOB2oyPf/SazAcJq0MRgv4Btv6g+wd6ViqzDsKvzEMFAukhcH6oiM7gB1mX1N3s
	L8e7tDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIwS-00000003N1z-19Tj;
	Tue, 22 Jul 2025 19:46:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIqK-00000003Mgq-0MsS;
	Tue, 22 Jul 2025 19:40:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23aeac7d77aso50029395ad.3;
        Tue, 22 Jul 2025 12:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753213203; x=1753818003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFHh26tngjjOWxvj7gs0dFekGysBV5VC2fWJw/vtwp0=;
        b=DkBEW+5QC9CZUUANIZ9kRHliSNnHlXjmteWauhouHws29A7vKmkuxO2cZK3Iee5+Yn
         vSFzdFiyHDDgjPB23Hl7pnS+DPeDpMO+ngLBmuElBco9aFE2JmrsExF/ocOIEtayZ4s0
         YzMcgumHsmSPMNwUz62SX+c5vLs+YEcnP0jOi473ZPLmSy7e4rKDJO6RfvyYk1yC8yJK
         KuSM7LQ99JJa99ceCJ29nVSftxuEw7t46nC+SO591ZkLqvakc5STbbw4o9UV685KxaKo
         wyJ44770lo/g6Ahz51s//e6l1NKLNnD7/2a0R5wG/prcOJ4zqXWrnTWBD3vhEQgyESP3
         zJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213203; x=1753818003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFHh26tngjjOWxvj7gs0dFekGysBV5VC2fWJw/vtwp0=;
        b=bPkckR6a3Wh0hg5XtWiszYrS7Jsiu+OQFP6mIrMM13bs1bupvoMBYexzq+fQeyTFwB
         EK7klj2xLfGv4mE6RpZuzM/cc2W7234dw6I+wYn98xicoUrtYaY5vODKSYLh1mQJZWMV
         XTr/StlsGgf9kV96i+T7jojsEr5/SI7DKU1qg7vHfzUR/g7qWfrwhTDv8mDy4eE6AOpj
         RUY9OJtn3PUNUzcKkNYmzgPhRgh2zMwFXrEKcmj6kp6I4XCmWTyyTksivoWSAXE8N8VY
         Xa42Z2tKuTDbvf6FfuK7lipzBH8h7b2mhnREuF6XJtYzUVx6U6CfCUqxmYNNLbQu8HBJ
         VROA==
X-Forwarded-Encrypted: i=1; AJvYcCUTxpgpb1fJQy9XdmpzUd41vPWfRH7fWNaJOOHmoKlKIyTWN2lVzUvRTyGTOq6G/s7hC6/fQcRTg65YHeeK@lists.infradead.org, AJvYcCVIBfACAnqA9GF0GgEiKaQNEt4cpkoD6WvAsDP5P5rNT2fOfHVrmKBRs0ltZIFObRzf2zVhCKwHeUNYh6j2Vpy/pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLbBkcPqMmpQzYqYE6FFte2he3CzLu1+jwn2MQPglbDgEFVRsb
	IbrmlnIYO54PeTHdLgdVeGtBLAsAcc94EGiqyPEujGPhzUt69ZAeMKdlmNIOQR3UIrhb12hB07j
	dIBV8lO3V+RgXZ6/znOV1qdOVnjsUI6A=
X-Gm-Gg: ASbGncsvNOWqn9UCA20+1pwJlowiQ5zDuLH//9yOUC4bsjn7GaCsoHXVwVpfuMvhM1Y
	M7zC+Vqmi7DxZz2TA/JKFZ6eSbhJJ1NP7NuxZiz+BbHU0myRrTmFs+swLD+n/H78pxxFBdnu8ib
	DUR2ISqWlRE7L/PVHjt+abfim28C148xW2Zn2UTtAF7iQvIpEuyVAiPN21Awjj1qDJJtp6tsE5P
	XqVMH9vD5Rwqa6OvbAdlw==
X-Google-Smtp-Source: AGHT+IFIqpmViQQPAMoz9A8CgWPtW74p4X/bJekUGHNRxdcVs5bjkGSvAitsvNLAJCN+CgYdarBLE7R9a1p3Lo1pKgI=
X-Received: by 2002:a17:902:c94c:b0:234:914b:3841 with SMTP id
 d9443c01a7336-23f9821d17dmr2411785ad.39.1753213203378; Tue, 22 Jul 2025
 12:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
In-Reply-To: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jul 2025 21:39:52 +0200
X-Gm-Features: Ac12FXzqGorcphSDKwJZcIy0MTfbMgQR4dWhRz0iZJDpFAl1w4AsnBzrEgOES8M
Message-ID: <CAFBinCAvLzDQCDh6z9soDiyq4sBXZ7XUQf3-Np4pFZTPmHN2AA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize measurement accuracy
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_124004_130059_269FDDE4 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, Jul 22, 2025 at 8:09=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The cycle count register has a 20-bit effective width, but the driver
> only utilizes 16 bits. This reduces the sampling window when measuring
> high-frequency clocks, resulting in (slightly) degraded measurement
> accuracy.
>
> The input clock signal path from gate (Controlled by MSR_RUN) to internal
> sampling circuit in clk-measure has a propagation delay requirement: 24
> clock cycles must elapse after mux selection before sampling.
>
> The measurement circuit employs single-edge sampling for clock frequency
> detection, resulting in a =C2=B11 cycle count error within the measuremen=
t window.
>
> +1 cycle: 3 rising edges captured in 2-cycle measurement window.
>     __    __    __
>  __=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__
>   ^             ^
>
> -1 cycle: 2 rising edges captured in 3-cycle measurement window.
>     __    __    __
>  __=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>     ^               ^
>
> Change-Id: If367c013fe2a8d0c8f5f06888bb8f30a1e46b927
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
and with the Change-Id (sorry, I missed that part) dropped as Neil
suggested also:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

