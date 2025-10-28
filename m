Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A6CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=; b=pCcYBGVq9dBzbAfz7J30ldV0wZ
	X1NnFTAVYH6AVg/QZ1x8zdKqdbcpPnGPwxz2Quu9hdG1+unW671w6fiNF8LxhuvoAqzDXo9T323rt
	CTtymPvc99rjWoyuK5kd4j9GeQbCiTAz6P69cINgPg9gYwPUHprmqscUlirTYfRd2hPazmRZ0a1pB
	tfBflcZ2IwneosooB97f0cHD3z7o4YBx3DDekb5JoopZJMqJuHRqcEH8l+cJ9et5OCggSr89LVbC0
	6FVEemzpSTnb1+PHdVvyEZ8pKo/RHFGZ/SVV+YBo4VpQSULjijIQeoPBJrum5yEbovgTYQinstAUH
	X5vSPrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdnJ-0000000FNwj-0lNh;
	Tue, 28 Oct 2025 07:07:01 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdnH-0000000FNvh-0Mr0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 07:07:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63e0cec110eso9506433a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761635217; x=1762240017; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=;
        b=j8MfzlSbelECb7c5XSJ1+Wb1Fml3r1lihRaFKqfqQ13AdAKPSDPITjEfyIDOsnu72P
         vsP83IURBbkC/+iU9xX01AhoklHIsB/gLEDczzkLjxKWSRCfC1UaqaeFQ0SXc7yepX6j
         dEr/fsnCHnBQAO5npxlJIZUANFzsaYMlbYyoG1CSBhRm4Q+QmAz+JnMB8XmIXbBl/DuU
         i5DUwWkr8+aVp1p2biVGhCXyb9+dBAKiwrl49gx7xkblFPV3fpVFI57V43l9G5BY7Lh3
         NlnXbSBVjhJDsGuKnl8bFNe8NlgxXWTkvziC8q30sCpg1MEp95aKCbEK3Smr/2H8Xxn4
         zp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761635217; x=1762240017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=;
        b=p5N70bT/CrrPSEKA1Bqf9Zo4D03EIf8j1guX/8EZBFzScX+9JUB2MUaZ7KTMZhyXQS
         oI/K04gHmw3lT0eRO+6hVvn2qvR4RcnWvqxUpwof1Bh+JZBqEiXkkGUrhUSV0Y2o9YOj
         FO3NRr+uSMS3imsBXw9wfauxF7kEn3gwt7RQVMvJdy/gE1Y2i0cqlyBtZwQSwZemlJUp
         un2WqYVMTsF5t8WNuR343HBpLW5z5MccDD0n31FYOLBYuKDw0cu0OER77I+LBXxcClB7
         2CDjrEzdRd4FOShLcHkGJfwXF6d+mfOubcresS4O9OoM+lUXMXSUTLMydwQ1MOZ33DS2
         l9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXJrfPKf/LkZa4iKLtX6bayAAgcT12JqHnO8eO5aF4+WIAY/aEdJoUj4zTMwHfT/yVy3GvIJeSG4iMLagBfpawh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+s1thg8ajB1wk+5yL6afWIDl2SQShjwb6/A4W3ol96L3t7yu4
	lo0vqoKZtuxlQFLpitpN3FlSZ7t6aNnyvzlMBsaCU7nizgAiH0gVNmoBHOmjODDYYywYu4LU4yu
	Ip8tOwLSEKdUa60yjk6hjCO5N+TfbfJ4=
X-Gm-Gg: ASbGncuUeyRLAR0GvtXCMQcoSrWR8vy2ozBeLsSunJt0awv2JP8Oezx2D6XZsjiFb2G
	FbMoILgXyoP4Nvl+nI+uA6V4dJaYX536OJar0o3aAPFRfx6mwkdjBzdQMtTJD7gwiefwtWD1zDX
	TrTbAT1V9kSLoTWxeXWc8YwMLzE6yC5kqX4UXXJjX7cKgnfpAKH4XEaX7H7wdSDAoAE7TqW+fKD
	sH9+Y3mOR2byg9sGNksANjBjzDUgo5Ig7nU/ph0r9QXbT0/v0QSVrQIFFM=
X-Google-Smtp-Source: AGHT+IFqdZ7449/+gCSESKkn4OY2k6KiWRXks4E+V02E2uPaH6yPU4wF8iJFvFXAm8oiIsJdQKeuKoRJ7jR1cSg+eCI=
X-Received: by 2002:a05:6402:5208:b0:63c:45da:2878 with SMTP id
 4fb4d7f45d1cf-63ed8262ceemr2111325a12.25.1761635216475; Tue, 28 Oct 2025
 00:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251027090310.38999-1-linux.amoon@gmail.com> <20251027090310.38999-3-linux.amoon@gmail.com>
 <f36a77b1-79ce-4bd4-ba4a-b9260bae7f11@web.de>
In-Reply-To: <f36a77b1-79ce-4bd4-ba4a-b9260bae7f11@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 12:36:39 +0530
X-Gm-Features: AWmQ_bnM6F6BzTGQqX_h0Uqm5Thyd0JbiSKKhO1nlm1lVvxcnt-IMVp2PL8CDLw
Message-ID: <CANAwSgT43rsi+DxaMF3T-gsVoAAGSSDEL6s+TE2yZ+q+W3bRsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PCI: j721e: Use inline reset GPIO assignment and
 drop local variable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_000659_131196_C3DBABCF 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Markus,

Thanks for your review comments.

On Mon, 27 Oct 2025 at 19:13, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > The result of devm_gpiod_get_optional() is now assigned directly
> > assigned to pcie->reset_gpio. This removes a superfluous local gpiod
> > variable, improving code readability and compactness. The functionality
> > remains unchanged, but the code is now more streamlined
>
> Would a corresponding imperative wording become helpful for an improved change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc3#n94
>
Assign the result of devm_gpiod_get_optional() directly to pcie->reset_gpio.
This removes a superfluous local variable, improving code clarity without
altering the driver's behavior.

Is this ok with you?
> Regards,
> Markus
Thanks
-Anand

