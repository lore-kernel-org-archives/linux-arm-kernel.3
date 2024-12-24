Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE45E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8k22NIhRUfREomzvEHYBMUyh3YhmCBtF7z7x287Diw=; b=gvIt99oxI6gXWJMMVohByrIGmK
	6wKOnDlilWcfc81UBg80eQFgVzd5x9fHL/YUTJ0MW2qysoIKOqsZBWRbJQwiKKOQsr3NPkm6IIYkf
	2xvMGRTjArGU15wiGx0ydcvzKdmyiRzT0yJ2dj577tMGcayY92By0TWAh62I/f8YqiO6N/wPbOVSD
	PEz05ZcWzrlMhJLMtcHwye8qsw7+jhL/7DoVDTnzj+kDBnMPPSw1ejjD/FfIueRT3WC8uKbNrh3aa
	AS1kY4RtJERrsAjolEwGaFwvarUedVYfkazqYvEpi3yf8vGJvOQO8q/keRK5W3e426MbBMtnwAbL6
	nVRqsEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxsl-0000000BKD8-3WJU;
	Tue, 24 Dec 2024 05:55:03 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxrW-0000000BK6K-3xs0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 05:53:49 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so3961509276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 21:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735019625; x=1735624425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8k22NIhRUfREomzvEHYBMUyh3YhmCBtF7z7x287Diw=;
        b=XhkYi6tGPERXQM/3J/K4nk0rIdcy+ZtKkF7ztTSQd1246WT2x79bzQod9aNqYPqJZM
         LGbIV+AJSd0ZLr7Jyox5GzGcngn8boxparSIRwqMNzxKcrh4FrYPwSm1KpKhZLXbvoOo
         LUAg2U1gPBe1rFe08bG37gQwtXZeiDxvOohBXST+S35U6zONQyJ0DbpEC4cGJ6jiD0Uv
         jZQ8gVGe53tEFyH490pDNQiHZu/khLwxg4l19kUkre09FnzaefxYnUC+90LVsr9vkHV3
         Ttvf3jN5YADaQdhzTtCcNsmNwV7FGcH7v78yCI1mI8TDljQxHH12hHqTdp5BBsFsFBnz
         BXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735019625; x=1735624425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8k22NIhRUfREomzvEHYBMUyh3YhmCBtF7z7x287Diw=;
        b=Z/v1er7YFpXr6AkG4gck1RLnOOzGvpUP/TG2vnsAIR6xFuwBVnwdrjbGbbyQsSsIPn
         hDC9LsrcCvquXjB0AnQLncnHkYsqO4Dp2GWowamYlRrMBRNEiw7MqXhnJhXVEItqFqsI
         rqTbUNYvKg3l8rW6U4pPfbP+NUrBItlGJ5Jg3TrQLWHQMrmCHB0v9R6qqx1iJX7cXPab
         nDI4F9ImV8a0ZGWKLSOhljqKEjMsIa18sfsnH+TtNomQDUrik8LENJUHNF0yjIP7JUO0
         OWs1LKlLfMFYNQSFVXDOgVa5m3HermVbK9HKx200m0Ob2agztbxuj795XOh1Kx2XbkkS
         KuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqLVPaZxDc5kebaQIWLQCTc3DIVSZ+OCULD6oW3aWwgEbtoIkZ89V8aICuSfQ1nKn2rA3gh5gKu8PxvPaGC3R1@lists.infradead.org
X-Gm-Message-State: AOJu0YzGexYzQtZzoXDOcWw2Q1tU1ZdWrm5rVGbIGnAFkv0XVkaADs0+
	1g4RA5ajG41mureAnMWCa1/lXnwbH2fiHP362eWWC9dWjM2ximL6ZFKq4tjWjDNTQQXeWdPR9B5
	ljkVPErGK7wdm/aF5ogaSUEho6WwNxS97DJj3fg==
X-Gm-Gg: ASbGncvSkGn7Xgy7TMhUW/dL8+Na1aa4UNp4joaA3k4I2PHcX3jECixqDBaF/RXkmyv
	n7Y58sE2HNm6MYyzlKZuuwfjd5UAYNk6DPzpT6VOZXiblsS8wAsYZ
X-Google-Smtp-Source: AGHT+IHZNTB32SM9lZHV7jMuubh0s3yOGJoM9z09zuPN2nLMSX1RRST3+VUlZjXDWOXCRHlJ3OmlP+RWk9nmIxIonSI=
X-Received: by 2002:a05:690c:680b:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f3f820bb3dmr106099737b3.33.1735019625469; Mon, 23 Dec 2024
 21:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg> <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
In-Reply-To: <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 07:53:34 +0200
Message-ID: <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_215347_986593_1A1E57B7 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, 24 Dec 2024 at 07:47, Yijie Yang <quic_yijiyang@quicinc.com> wrote:
>
>
>
> On 2024-12-24 12:16, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
> >> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> >> compared to sm8150's 2.1.2.
> >>
> >> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> >> ---
> >> Changes in v2:
> >> - Update the subject for the first patch.
> >> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
> >>
> >> ---
> >> Yijie Yang (3):
> >>        dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
> >>        dt-bindings: net: snps,dwmac: add description for qcs615
> >>        net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
> >>
> >>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
> >>   Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
> >>   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
> >>   3 files changed, 20 insertions(+), 4 deletions(-)
> >> ---
> >> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
> >
> > Which commit is it? I can't find it in linux-next
>
> It's a tag next-20241108, titled 'Add linux-next specific files for
> 20241108'.

Nearly two months old? okay...

-- 
With best wishes
Dmitry

