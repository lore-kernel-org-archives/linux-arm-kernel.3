Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9203CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC+hJQkcVSXLbc1lxRNyfmEb4byMZ95qWgYNvEiyn2w=; b=48UIhKaMVVtqH+RTxCJcpK8A3G
	JzuFIKZlB1oBlaUhyFpTbv6Y5hXho4Pbut5gL5iTW5jDxOm3wbGwtAvJ8Hlxt4kn+MoliVEVCMXF+
	KtydcDDEqDvEHam518dGfBVpPHP438pB4ymXMYsVH+RTELaFI+asaKpV5jJw/RE6XSal8WKlUuddM
	g7i9AfVOBat2sWE64pCME98OlhYqvGVKAXj8F9Zeaj4wn6l3cF+u/WV0i/zi6Qly2cUaFWoacPLyN
	1TeVfSfNl8Hb5ZxdJXuowOkaOa9PV11FcugbGrWAjmuaqiq0dX1LKdwOz1BEmnRw73GVn4GS3QxSA
	C1a1vsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdcd-000000027tP-2ZkH;
	Thu, 11 Sep 2025 09:29:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdcb-000000027sp-1zRR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:29:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so390715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757582979; x=1758187779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC+hJQkcVSXLbc1lxRNyfmEb4byMZ95qWgYNvEiyn2w=;
        b=EywH72b/VulNRJyLeh/xu0/VPpCLXRPvOlXc/eW1qHqE3Uix8P2erbslfn8AVIW4R+
         K2NXPrdmWKnkrE9f8nZ2HA/znulS+xeTisjkXZqaAcdHgnCe7fJDoex/GzDdHikotySo
         lwCB4+48JawZONZv5Pmn7pMGqmXRe495Ui+kyvzib8k2ihLrxEaNC5nnOBffzeqiw+E6
         g6wZyQlvnqmGrV91b5PLgYjCdSD6ANUWfiJS6Dhx1FeKji2ZNSJJDMte0tNXVUozeuFm
         r8Uv4wYSQLRjy8bq1BShomJLJxgw5thG7bhHEnjMsFRTl/w1JMl7TvprGFb1xzGOJC8w
         aDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582979; x=1758187779;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC+hJQkcVSXLbc1lxRNyfmEb4byMZ95qWgYNvEiyn2w=;
        b=mKr+TVidGENiIzqTvJTaNs4/FwRhYiDK2oV5M31rfAjxgv0+4ctrdAGfJXNoDhPald
         UL7nJjfTHKVa6NAqa+KSRiXPpYYxb0V9YSJUEs9sbLYJW5roiuQdXD8JPTFDC8+qsQ7Y
         4kxrWrHWce3wTGcXIoNhn8K04rIPpsvpgCb/SWkykHLvRtUXjkhTj6OmKqhEcdshkfAR
         QkGfmWsZb6AetDQN2E9RVZEWx873pXlZi1A/ehi9TlXWXtOthHmAGDbx7G/tI3xNwAu1
         OrsqOXt/1rNepmenHNCk+qlvg25sUDkqmzYZnLhG8ebVF2OUl6VmOKFnzBTMmP6on0nt
         Z1bA==
X-Forwarded-Encrypted: i=1; AJvYcCW5t8hDqa5HqF9GI/gv96uld/BunCxJ3r+vQFnGFXIvQJEtcYLY+FFCbeolU7jIsZPvPCgJvCcLrVcpoN2Mcmf+@lists.infradead.org
X-Gm-Message-State: AOJu0YzN3Fl67KHyKE4G2sTNu6DlWobOEAipbitvyeBOWNRQ3FfYO/7D
	NrkFqAYc3FtS/g1gQpxZ4qAzPj4ks56xwYumJZT5a2Qp1SyHBu+WpBOfXFspMTekPbuN533XaGg
	7pxsh
X-Gm-Gg: ASbGncu+9San3RCOKFWIGAF7hIOCqbj1mp5njYQL0TqDOlZhLldFqrUQErv6DqusM8j
	cWJhYMeO6gGXqGyRfDCaNZTB6aVH3nsXeIj/ap9jGS6mttmBeYZtXcKob2ZmtBoSJenCXHJRRWU
	DGZnKTqotjoYQDDnNl1A7kf4NtiiquAD8rkQA/rp72lGP7UnjAOWxppguXhQeS+YTqBJJ7E8vXr
	hvhJcP9p7PU9US/vuhHxc0ni54R/PDkW6znynIVn1ruXOKETkGlm1mlLJqMi/sTKronAQ3+jrhb
	p5/Z0+J1SSVeMVZ2/zt7ULTbY6tgtK5SKdHlVXJvUN3+9ys1VgWxz2Ko9Evi+qRyjYYOQirEPSS
	B4XWBgoPQcu2p7NcJTQFTvQLqJTotS2vZmBB1IF47H+VEj10BsQ==
X-Google-Smtp-Source: AGHT+IHLpivrFJJuNi2aFsQowzY2Z21CVbIySOCBNLdn/DehLTyA9Hoq5rzO7sBA4BakWwnpnraSTw==
X-Received: by 2002:a05:600c:37c7:b0:45b:71fc:75cb with SMTP id 5b1f17b1804b1-45e02a94b69mr7953895e9.5.1757582979441;
        Thu, 11 Sep 2025 02:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d75a0sm1731484f8f.44.2025.09.11.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:29:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
In-Reply-To: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
References: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
Subject: Re: [PATCH v2] firmware: exynos-acpm: fix PMIC returned errno
Message-Id: <175758297808.29372.10913804909854615057.b4-ty@linaro.org>
Date: Thu, 11 Sep 2025 11:29:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_022941_536474_E23874D7 
X-CRM114-Status: UNSURE (   6.90  )
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


On Mon, 08 Sep 2025 14:02:00 +0000, Tudor Ambarus wrote:
> ACPM PMIC command handlers returned a u8 value when they should
> have returned either zero or negative error codes.
> Translate the APM PMIC errno to linux errno.
> 
> 

Applied, thanks!

[1/1] firmware: exynos-acpm: fix PMIC returned errno
      https://git.kernel.org/krzk/linux/c/1da4cbefed4a2e69ebad81fc9b356cd9b807f380

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


