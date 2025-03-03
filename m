Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45072C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=; b=HmDhevk7bs4ZDUwvwxcQzxRAVd
	7wEKzR4Cq5Uzwv+IMGg49HPVFSbDLRZEpSXzOJvWUAAtePtGylEgafOyurzMrMiQ4Lc7xD1mreYre
	+0h2jJGJ1g4H3pD+Gz+pQGpl2OJZYgeBusVSO+vstuuTSrjAjrMs8PqAYstRAq3K7sRjK/OL6pLsJ
	A1+3VO3GgYUWEg70Y2FP9SEfimgOaTUN8QXGxLNPAcqLF4SYtUFf9Ub6boqlKMM65ZWbkyOgORgGH
	OxBaaGSpOxYuvaNsHptDiTXZtJJ2QA7zKsPfV+9EIS7h2F2vWbDBuboJEUznxPyjxgCvn+VGPJpBm
	LTXiGruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9ek-00000001lh0-2WVT;
	Mon, 03 Mar 2025 17:32:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9dA-00000001lLo-1dql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:31:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf3d64849dso385767066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023062; x=1741627862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=itbxmkifVw0lnUMG7foWS7xb/Qlv+vEfstDw5MWWzo1x5hWonbwQNft1o5NKyIrThH
         FDeS83c9VkFwBWfuDSpIMq7NVwmlEETp9Beny52d91bS3qExH9GEJsaWD9YdHCdJQ7+/
         I22g88NX37rkrKrE+dR7NkPEYh62u1AYNgSC5WceDbnyDCxaew4ihw+GXnXesHTKRoxi
         +b1FnTtLpBnXwRajAXB5ud+X980qEnVyrzTCD6e+m3b4HzgawNxFf88Rqo/1OKAuEUT+
         wI3CRRMw4WkvNW2WjPxZ7BZ5Bllbj3Io7Y2+H2SkzCSlb5bS4G0cjwLWIkRXvPOJKCxq
         tYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023062; x=1741627862;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=JTnNC/siM+MIMuvAsRUYYU71k3V4E4GCcaDbhCp6mqunXI+Q7Io3vBqTTbFc3OjvtN
         CR8cVOtakX5Kja1f91IcKLRH+6cm9/jf0aZRdIFN8FMB6Z4Hxfi77MRpfOB2j2fAv+Mb
         A2uofn/IBx3Bl++XKLBUxCS00ELNCHJuHCXq8jLShpxWFZdqsWN1S36DfaPfVv7T4PUu
         kIsvKVxbCqLS+36mBpXmLAQL0oYPtLHvH3BB4Rm9056h3b7eML8+YsBnX/4JESte0DZk
         C9mfG6dVl8SSAEy8Ynxvemi6kM7dgHmO+Ob1Y3YmuHB4o2K2Yvbn6FqYM/NbOJZO49FX
         bZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWf0MXvBdVFRF7WUlZB1ZkJsc61VfVhAufWfyLpNn2m1J9tkIRKYhrqu4QxbpQtJRo8WBkoV5gt0wNM/B9UBOA9@lists.infradead.org
X-Gm-Message-State: AOJu0YxVMuc9tQO7OtcCbafY0Deu9lOoqZ/K/VUIgRKy2OsYz9vGSctU
	GppI7oHE0dq5wytblFyfDsKpSPB5b3RkW8l5N+rMsAYNm578C63LUHOvtMy13V0=
X-Gm-Gg: ASbGncuXM7Whfk4b8VB9YA+Oak4X0ctKML2l+ASibkvRXbdkRT9xEMPBRSzcrhuiqRY
	t6w5eYpRaf0kNyWTXBeJY6xZx3oiBmDsS4IGhtB+ltLsmO1tt0Zf2KdIerMgYc5LfAf6ixKasKX
	aqO7SSfbrIGP+T/6/SFcH1k3D088+yyhRM87AgkPLoTK9a331GWKaGN5LCfn6EC9f4FPJFkucRC
	aRqabCzWTefxgRhz3O1hdVMYEtZoXBVmgnk8+sq6GCKoQd/ktSe7eCkp/mhh83yGuoABLQpy3Kr
	gVwuw3dXSo0KYwAHoRMLErrlEGtaI0BVLSs3cqkqjms=
X-Google-Smtp-Source: AGHT+IEDCHbXJFeVr35xZXSASXjjlWalAgEpW0iSBToGQqWlsuonpEUcEGYcVr4M4CEdy1EY0ZamnA==
X-Received: by 2002:a05:6402:42c8:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e4d6ac58fdmr34237245a12.5.1741023062067;
        Mon, 03 Mar 2025 09:31:02 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d26esm7085355a12.20.2025.03.03.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:31:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Adam Ford <aford173@gmail.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX
 DSP/OCRAM_A
Message-Id: <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
Date: Mon, 03 Mar 2025 19:30:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_093104_438764_57279B84 
X-CRM114-Status: UNSURE (   8.20  )
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


On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
> it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
> the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
> 400MHz.
> 

Applied, thanks!

[1/4] dt-bindings: clock: imx8mp: add axi clock
      commit: 2471a101938b0d1835b1983df08daeb98eef1205
[2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
      commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
[3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
      (no commit info)
[4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


