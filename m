Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A636CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=; b=dodK9w1ngv6GuGcwU2l3MKUFUR
	AIeOzcm9svNobpUmO+udNfiBxtEzRJHv97MUEYIDlQMl2/sc966nDmE2LRcWb8vnzdLhaerZytJn/
	/EHvNJAAW9M51QeY3lqEuP4na4dlKFu+vHLleI/3O7SnzaE3Und31t08Q+kXsQ0MATQx3zGUttS3k
	vlqEDVJrLdbUS0jNYhiEnAdOgCFI8BrZRxLxA1VxjFpiywmRdQDpdv1ejo+HH+pYVHae5sa+NBSb0
	KsmDaqJODUQPPiYB8avSqhXQcz1NkNj6EDt1Oj5wfPwL+CyjRa+s2xnfSyqZZJfmtlnMq/Lf6lE1E
	x562HqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wX-0000000C0fJ-0qNU;
	Mon, 13 Oct 2025 01:01:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wU-0000000C0eB-2oYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:01:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781254d146eso236822b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317298; x=1760922098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=n1SnI4CaflbjeFmKqxL0WcteyDLtVZg0P5fFxYshSlHMfBxtAFW+bTcPjLgLIknXfJ
         hZfQm9QrNAvHDEW91Kkq5OeJaY5iKRQ4pAcxaIgPbpUmUEnaV8jDm89+iQH1GsQ8FhWr
         Yodpl3VptOICrwnbf6er1A3Gr4x4I8rLk3Qap72Q5aqLTHk4ib2R+UUBpjXQGLSPc9kf
         NBtyhW0amW2RKnNqsyxGAWi2o53g39kE+aVy/FwYvW0qcEZiA5UIjLJUfjGoaq+aq5yF
         zlMeis/yZn1SJL2j9xPM3HN6RvkO7sRH+pYYM68NOzRipeCyyuNCtsHUA6hGA+3xyzlQ
         P1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317298; x=1760922098;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=HdKd2rQPwc1Fh1DWsoPKmwLT3tVwnNykwL/KTIexYj4yYO60/d8Y8AuvJau3lwJhqm
         RcdrKnRyyed96w7oBx7nzYdA5zPE1A9k6pspnM0wNCA9WTWufCFuC6FkS4rK3ZSU/2qv
         VPI2wVIwXiyrIv1JiIFGwJOgu/yB3KJOexjel1aOADjl+KP7vBGwXISGPeHun6WtxKjE
         OYGbODh1Cq/dz9l/qFNTEJV7O2qam8Z2n11xmBNmshxlfEW76dInucTsFvLWRH9r4kab
         52/yBSeYC6ekkah08wy64YAZJgP+5OXp749BAdP16o9Y3c3oANINA/SEJHgiK5wLk9RK
         8N0A==
X-Forwarded-Encrypted: i=1; AJvYcCWhLyPZIOVNE8nngxs1IeINLSlZDnpHETCIOiwp0/wNmXuT+lGureHSqond+YYmVsbmnqjHocVqDJx8nTV0xLmG@lists.infradead.org
X-Gm-Message-State: AOJu0YykIowxpgpeIVAPa4e6e4kKDMoYzWLXbqSqecKt8lLOlqrZOfme
	clozY1Nz9PdKHROraWvcUtkjwIz9kfMAAHX16LcqHNRJKjo5a9HH2JKrzlPEW8qONLE=
X-Gm-Gg: ASbGncuXJMIP6Eg/RUiDLn+hjWvVLUUYohxNSdkQiSwexJvsZAiK/ltvly2lnWZK4mb
	iqBKGqM+h1uBtw10fNQzyX4ryuuF9Zll0UhYrHosO/Pni7pLDbrwTynKlAx8UnyW1f4O8qDfo/y
	U3jS7sk+/oDLfY5Bx/RZgZKKdu8qyXdfKomBdFq/qK9Mz2u0nUNZJIQbKJG3pOjJnnEaKpq+xc9
	UtbbrZiDFw7M+Spoj1WY2Jqidr2tSyiXgHsiS1IOIqRtoDPNzsz+EcsqwcopFbbj4yQ09ZcAiFG
	xXzsVdQ7HHFNl7/8raH4IqJtCJ1rASmT9/a1D46OQVGup2qmsHF2p1QMagl3+N1a+A6v+oGcdV4
	Qt1TqRG2lKtfYRUOI7T6D+Dtfqgv4rmaO7zY9fcdD5NeXhGF1/57oevGMHGrLlS6Tz1KgZVw=
X-Google-Smtp-Source: AGHT+IE1B9hR89kcu5D4i0PCjI7kQyz2poCnY9xOFDtLABQiwPAkgeCMqEBV5hkmUp72wJBiyTt0Ng==
X-Received: by 2002:a05:6a00:b50:b0:793:1b79:ee5c with SMTP id d2e1a72fcca58-79387c173d0mr11494869b3a.6.1760317297843;
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-2-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125616epcas5p37346312c6a788a5398212f671d8a369d@epcas5p3.samsung.com>
 <20250925130457.3476803-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: exynosautov920: add
 mfc clock definitions
Message-Id: <176031729214.32330.12498017940011083883.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180138_733430_AEC94358 
X-CRM114-Status: UNSURE (   5.63  )
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


On Thu, 25 Sep 2025 18:34:55 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_MFC
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add mfc clock definitions
      https://git.kernel.org/krzk/linux/c/0b94201e327471d034d81cf5fd2131a5529eea19

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


