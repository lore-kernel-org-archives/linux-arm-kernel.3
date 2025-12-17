Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68767D64086
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=; b=sHsZbdWKMHq71EM8BPu+K+MRQt
	20X1MEtR0n1yL9PstHb1YltlhY4mmOolcl3b3x2PlSl3Jc2U7F6nOczBto4V4JHdFshJuFNkxfTcr
	CBYUOEPUEmVbo2KlhvkSLuc7Du3x+JdTLKn5dAzeLlylB9P5afVYnXFhN3ONbS6Xc/SO32D6uPlux
	+EzR1QnExERZbnvwUJumLbugX0SoCU+ojY3kIJSn5iA5BKOKqu2wFe5pmykn9BX7cvjoHJUqZa+2k
	wYDxLaYBEQBPpxx8sV6vXw0RsnnZ2lPrL2zr9RnfRlkx7KUP/KcKrCzOTTxf0LaACfW+ifx6QwtkR
	+cbIlNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmWi-00000006Jip-17iw;
	Wed, 17 Dec 2025 08:04:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmWe-00000006Ji9-369T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:04:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso40990385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765958688; x=1766563488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=;
        b=akUUN+kUPcx/jzdI87DHDAdlwmNjliUU8YVFJBf95RrB16zTdWiZL4j7C+UzlMUdtT
         NYqDtID4/wwbRvCY8SBrbD4YnX3YaE1rFspyyyQA8beV3Ldictyuj/bNW8fFwhagwP5P
         oaAIajPFKMHD1s6E1QF6m1R3UEQqcW9Okwu6rTAgdNKG5BKTCsvRMAKAb7ixqObY99Pu
         JkPw+gkUJxlXzpPlmC49Nj1HDPO6yGiisRjtg5WmbEKTrEO2TBZy0kBB5LGIKtco6Ybj
         Gp+SvatsMG98eD29oxRWPJlRtAq3IbWeQ0tH6luZ8UhLchUwnHDQ9xDJsv/GRNnmI7JV
         ZNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958688; x=1766563488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=;
        b=lHU8RmVaLa144MoGTGLHLrxrcr+2nhvesylD+2Qwp4WEoCGYFHkg8s9qrFoBViW0eP
         sYpmnxm6FhN4UCAnoaP1LUZ+BRn1brj3M+EYCWevMsUUPwQAy2cym4l00A07LzwqGe2C
         vFMzMFOrDZlo8vRPESxg9WoKkzqR/hu4/+iuBbEb/XYz4xBhhDRTxDNz5gjeMUWCgDAu
         UYUpkOJGPNAzoIA9nKbACRR4yyNyXimEC25rRiDC2kCAIkrtZ25cL+9e01OmORK+PFYv
         QSInGKZSQUMF/YJXDaywzvn3SFIu23wzAFCixKFAdTqf8vPeoQrHGAeAsP/B/eBbYDYM
         Z0+A==
X-Forwarded-Encrypted: i=1; AJvYcCV/BbO19JNNuOdEcvuHjGTYbTeHmCtDKm+9CDdCP3KLcIfJgpE/I4OVEepGxpsJ/sr93oVEtJGfQflFPzokXBu0@lists.infradead.org
X-Gm-Message-State: AOJu0YyPo1o7bmJfRd6uFZA4MnuwlGgRBftYrAzVi+JngfzngWcqs6j1
	gRFhT430Qs8efGBp9bFD8E7to4pYL8kIYy+zby82UWZO+4c0eF0IAIx936vwfABS5m50l4aFcR+
	mhtE+4LAnDeclCXldfIbje5QEZDfQbeo=
X-Gm-Gg: AY/fxX4n4wkcoPDoGrTxp+mozGcGuXQ0H/dCo/E//QfqKxfRyxHN94YCe3IGUJKXVW5
	oF9gXjDfvmbaQ6ip6q6IYx6W0UzZMWn/Yo7ZyKHNskC102tYIQ3vBIK4TmoeQPictMrENw8dO3/
	tqZ+rN8C7teLwTBMXga+EKY9PfUxMHKpoK12etBn2hxLh1CAz8ZxqO2l6FSqdd06n4YfRnQSsDO
	X+7w2HNfWaRlZDdMlpjFhvaTVUkPfy+CmmjqTZXfP8KVgmECYjLz3UUXZtnx7McTbXK4wybGuUY
	rFAvpxMszTswbaX2/TUgO4FnH6Qfv8SI/TDL+aF09CUltK0+i5iWaAeizqZz2R+DwHuEUTAcGt/
	0/SzJFqMv7A==
X-Google-Smtp-Source: AGHT+IF/Rafya4P9pHjYpat/hvN9Upnikj/jYp5kVk5B+2ai+h8M3blhTlGwS1i4Zy/ud6gAgGTmWeFmpcYsbAk3k5M=
X-Received: by 2002:a05:7022:a86:b0:11b:9386:8273 with SMTP id
 a92af1059eb24-11f34c3056fmr13561896c88.48.1765958687598; Wed, 17 Dec 2025
 00:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
In-Reply-To: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Dec 2025 10:07:17 +0200
X-Gm-Features: AQt7F2o4eVZ3neNtlty04YadxDzQxMvRIIi3ajaFZXWNtpnoUCJ29nVTAzoi3nE
Message-ID: <CAEnQRZBTkXtiT1attxPpjXUwLz9bMVXP8_-ChBFDY=V9p3NR8A@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: Initial support for i.MX952
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_000448_808495_063D4D90 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, Dec 17, 2025 at 3:59=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Initial device tree for i.MX952 and i.MX952-EVK.
> i.MX952 is designed for AI-powered sensor fusion and vision sensing
> applications, it features 4 Corte-A55, 1 Cortex-M33, 1 Cortex-M7 and
> NXP eIQ NPU and advanced graphics, video and advanced security with
> edgelock.
>
> Product info could be found at[1].
>
> Note:
> There is checkpatch error for the pin headers:
> ERROR: Macros with complex values should be enclosed in parentheses
> checkpatch.pl maintainer said "Just ignore the message instead", see[2]
>
> [1]https://www.nxp.com/products/i.MX-952
> [2]https://lore.kernel.org/all/fce65a7761fb0e880beb469e2521598f@perches.c=
om/

I think this information ^ should also be placed in the commit message
of one of the
patches that gets merged in the tree. E.g patch 2/3 or 3/3.

