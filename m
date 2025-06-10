Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9m4OUSXgJ1j1ai/CSmPLyPDP6fV179jfH+S2E7Ly5A=; b=gdmhzff9llMJ32b43hL7E1HUTO
	cpLGiK2h3dlH5/bwl8XhsRW7qJ2d87mr0wu/Mf9z1dmkPrnKGRlggvjnrzmWja5hKiqoMftfnqeih
	wYwupDzw1XmK/kWo+4ZPuHy2z6gLxdOPSN9ELJ3pBqrIlVuWG4Y7eswZl5zHNGvpzKr3IVOtGlLp2
	Sf4PRRkAOOPuW+Wai8oKvA2vWVZunM6pvdsE/whvdEwk5L6bPsQOMTqDnRRk1PqSU1ra0gYHlqMML
	ulRfBkK1Z65ssvYvgzgxwb1T+jHpMmo/tq+tOOqBOqOguCVbWKcbOBctHYoijr6XZexqGqq/cxX4E
	2iBQyw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubM-00000006DKD-3Yh7;
	Tue, 10 Jun 2025 08:45:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGv-00000006A1y-37Gu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso455457f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543832; x=1750148632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9m4OUSXgJ1j1ai/CSmPLyPDP6fV179jfH+S2E7Ly5A=;
        b=HWNljbh7rA+m/YqE5zQ7zXiwPb83LK+1aDmiJSbr52Aq4xOFYup3RJTcSmZLeOLa1q
         NLbCQvRQ553BHOBqSbrK/xOXGtKMbnbYHDHDtXfemgYmgUTQhYLjZgYrgAimvSyDnXtU
         XEDEvU7ASKyylgqGTi9c/p7jWG93Q5MRfk5vwVaEINHRjt4yjqGTBlisCO8amTePvuGl
         0VHwqzi/3gE30kJ4tn1dsqeDaUZ7TWdurjInA444kZlAP0VyPSDROm0D5dtz01TJ8CBs
         4Ji7jvDofjT8Xrt2slgU4awnJqbK9nJTERYzUfRZhL+9F+JLNRsX71fM7gwEO4tS6xDx
         hzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543832; x=1750148632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9m4OUSXgJ1j1ai/CSmPLyPDP6fV179jfH+S2E7Ly5A=;
        b=o59goZBqpjEuCQUJESoIcT4uPteNmnqwto95Cri9FYnXCO5bjUedlHug+nMof06LgS
         +JHn0rK/tu0RuWPwtRQb6wqFlKftFRTQhY8y0xS9urgq5NIeak5NuJHtBOtiHzLJNz9I
         RynRQz6HIhJzSQi70kChUx2SG6txN+sojF3HVtOS8SbE6OoTwiGz4DpV6BpQjxqd/VVT
         wILQcpMdRDFj29hGLjPLwqUxD6HM+zFhwV1y58pg50adMdWSglVSODDEdV9vWXcQPS8w
         0zaqT0STFX+KjZkJWCTxxIl3z29vSv5LP8BARKoE0KuxNPZlTW1EJqzb76Pp/fa9CVwU
         OqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXek4SfBkFU9ovXReXxOR6XfaZ0TESfCWMyNFg24fca6WKLjxFHylSYhL0feRgZtrgioUiT66rszbbplwl4fvjY@lists.infradead.org
X-Gm-Message-State: AOJu0YwxD8i6iaVXyni1DmThB1Xl8N78LXvNhhddw7s9zdGeIRSjPqyq
	vpTTftRgXGJZKO0x3np0wJSIGs6kUW+JtVnxewAHHgurFyylC9GDlNlMIiV7dyDwsxs=
X-Gm-Gg: ASbGncvxmyB+rqr3n7FGnJAiC2iNka1pfXP0/XzsX4V5hNoPV+k0pca5C6kL93xfn+5
	ki0qjvEGG+0uH39CxActfr+UwzN3ufzaDTwyx1HLXH9dla+Xb1DVaEh+FkWQdPRGg9vDnnt4XLJ
	Rh6DboM+yp8afLQgFxPQNVwlmV2IXhf7D5bBg62ZZzq1TUucA1O/LAfv3WnuLZhG702CtDIde7F
	xW99PICQsDiCNsuAoCTcvMjJdgiYN5pAGAK+FHqnOTNmBSflpyCK2WjFa9S47W9KiGoJwuJMb7N
	rU+cESgow+XKoujrfotB5gzma5mVadAom36w3D36zm8PKIka12wJ3ZUCMIoQoVUfhihZmI2TH3c
	Whot8IA==
X-Google-Smtp-Source: AGHT+IGpZK0XvUNv9m1dJ73uM2GMwmUIp1i5vaUr5TtZWfaeMyf9vb9r9+HjN1GptA0mzLdkOh2ECg==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137359f8f.2.1749543832232;
        Tue, 10 Jun 2025 01:23:52 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Eric Biggers <ebiggers@google.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Will Deacon <will@kernel.org>, Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250523115630.459249-3-casey.connolly@linaro.org>
References: <20250523115630.459249-3-casey.connolly@linaro.org>
Subject: Re: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Message-Id: <174954383078.117835.876974227207154784.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012353_782568_A899CED0 
X-CRM114-Status: UNSURE (   7.27  )
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


On Fri, 23 May 2025 13:55:34 +0200, Casey Connolly wrote:
> This config option was renamed, update the defconfig to match.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: update renamed PHY_SNPS_EUSB2
      https://git.kernel.org/krzk/linux/c/f17d5b90947a7b89a27913abf47cb0c7063b3430

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


