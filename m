Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=; b=QX5qsCMEHA5XpYsDelR8JPFFet
	JVwBNvl29+t0sd4KrUbLCfWvXMwwY8zQ/c78y/kJqkwHdZB2KJB9TPVdhHtGlaGS5PhODnooWQa7j
	QLlQcmXQ3Tpey0YY2cjHdkXoSQcitLDsX0Ft98ds9cEKUBV4/our9xMiLblVtrpve92wFq2GLgJMM
	xLE3cPbG6n+UN9NOz2LTdCLeWNN3cpYYhHfArbfS5a4v1Fp5ehV7rS6mnjlygTXVZIEsXOTR1kKV8
	tiZtAPG/JBV2kIOBQ2PlLd15pHFDYxtTFHZsPL3oWwUDTr8p9CyRnZ1iX534MjOyrMItkUQ81p50N
	RXazzI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZGc-00000004Pyy-0m4T;
	Fri, 20 Dec 2024 09:25:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZEf-00000004Pis-30w6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:23:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so913608f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686631; x=1735291431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=Fo6fDgAhvN2sN5SYV2TTftIhQ42ZDcRea5owKgx+ALz8BVPy0N/0jl32Tz4O9f7wfq
         iLqx/re2z61BTbMVze+fJ7gpRHzzpbiw8d//uYzXF4gMDzNSzIDltc5yPJ7B6F+aJrG1
         FXwAMm8qEIZKR4TUCZzfQt2bRyyvi6lcS9xeV3X1FERwpF33A5l57R5wzaKRj0/NB7Cb
         pJFa9RZl/WsYbEj9KuncsFHzvs1eeXddB+0cWaOGT1LUPEVWIzw/pLao94lvGloyj/Oa
         PZJA0V6eSbHjZEoEhZ7qtCYg5tXw1C+mYdZzISUZua9lBwE9Z7XqQzYcM5cy6ZwCAiCS
         zS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686631; x=1735291431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=axtGZp8uDYe6R8ulYQbx+BFds0cVBN96bdcpk4A7ClJ8KZ1eYTm53qcMnf0mtgVv06
         MjhmMWDUqy0UAGk7Lp1ILCwh9GZtlzTT4pBKAr77XDXhMUy4L00UjSd/9KgIFisMwqcR
         ym9FaxNtUaiX+cJCT3zVODDlyiaMySV1wHkrhrqjQdfZb1BX6OJ8JQld44BzqmSbHSxZ
         5UqZ6RcvnOl2pbDDj6oBY93pMTir05TIhhBKda9iUrNbz+5meedEQuEMx9ZQ0VEfvYRR
         9WNuPen/2/qorGiCB6b/b9IBBEoWbazf77oQavT/nCGLLCwOctKU3zRLTdvdzDy9z7eh
         wLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHkDLJZbiAM10yba8f1lVxn+Jis9hWGaOkVXG4bFkMvYzN4LT3bnb6F6WYuMRSNx/v7igFK9gqoxcLymNFYcYt@lists.infradead.org
X-Gm-Message-State: AOJu0YwNL6fUaj+vYr2CBZExvUG2b0isJc7t7UUaF55qD6h4P8xZoxb0
	wHI+kV4eqRcLU+1cIVgxUliZC6U9H2Vddf2niAx55pljvlBSzSPcS/0XVTXmPhA=
X-Gm-Gg: ASbGnctGnAJQVB48PUqhczY6EcTllW7g/FNCXFThLt+9nFha3FWIti8wauNNOe4KbC+
	7clo/JlvfBs/U3Eyj3VTbx9kC7RcpD1ARoh937prz2eB0SmiRIBXZ3aOSrbaKra/TjymYFVow1Z
	JpkoC2bO+xLuPX1j7g8bXZ7aDyGO/bjQgYarLiqzMkrX5zqWMt3aC7d4HjEbTd7zKtu1oC2GLkf
	xnpg+InHe3XvCpa54NYxsVmCc45/n4azZ4SVeonIhfcKl4OSr7uBD6sROc=
X-Google-Smtp-Source: AGHT+IHCGJuc0QPgWiSCcz1rPztAry1sR+Zkfuc/Y/QNK+fl9LlKGIVA6ytnJgB8Y5pGXPIW38hmKw==
X-Received: by 2002:a05:6000:1a8f:b0:386:4034:f9a8 with SMTP id ffacd0b85a97d-38a223f5c51mr1646408f8f.38.1734686628582;
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
Date: Fri, 20 Dec 2024 10:23:37 +0100
Message-ID: <173468657763.2759236.17472540885807657211.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
References: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_012354_020695_39EBC46A 
X-CRM114-Status: UNSURE (   5.73  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: g12a: fix mmc A peripheral clock
      https://github.com/BayLibre/clk-meson/commit/799ce46951dc

Best regards,
--
Jerome

