Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C93C71147
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=; b=vFNptoIBWpRakz5+N47Mz3NKZR
	RzHEtG4gi9QkO7E74WTU+uph6HMNuHcOPet9PpjhdYUfRi+P2V+T1Kp0KHqopM17M2kjuU+Cuemiz
	w0r+ELposfnUd/NqzTIqJgV86gX2xkzcZMcHi1470wTHctSVi1gOCt08MlHhdjMqEII7AK0U1A5OB
	6KNh9a+7Nvqt9wMdWf5AYOVRQD/wpUIfewNzdpKdWYz3/4Q2le6dlsEMm51wN0wEP2OyVR5WbzC3+
	7WzOwOayCWqCFoS33/gTPOX11dt9cGL81p/R4dLaLwae4/nZ1Iu2ox4SikF4XyxWUrKSG9+SwnaOx
	v0tSZ+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW3-0000000B0he-2YtJ;
	Wed, 11 Jun 2025 19:53:43 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPM8G-0000000A3Bh-1AOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:08:49 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d3939ecb7dso329649185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749650927; x=1750255727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=UmhXunif2JRuFNFP7b/bgryU9hQvSRmxXxrNMGkopvCXQEnTV7Rxvjt4qbVaWPxGqI
         Y/IKkn+suEOTmIyiQs1ur6OWUCENd/KgxkoByZd9A2ebQde4JM0IH8bowVYgPVmMnuRt
         3CzfHleXSE/UzWYYvOUfWHJgxUCTyDBLy5he/JxDlzTeoLJm94xmxBmLM5oVRvR2WLlx
         4HqH2BIdgHnq/mzOkmxbavYvGNHPWPVy+3CgxeiMZgM1LRUBM3B81IfN34H86I2oAONO
         X37+qa30q0QfVypr5oQdHYIq4We90s7yvxHb8n95JLHx5XJp/qwcbDgGihyji4pLOBY8
         CNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650927; x=1750255727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=HeR8rJ5VbHs0hH1aEKKVTAOZXn6BHgF3+k8JoDIGEP38/oGrmbp2HaOhpZcl9WYnO7
         AXW+psh60kesVptythq85914MP02XxPNHAGOCOnXkR02on/zmPKqNDB/E+W5k3cn7j4N
         BHVShvNN6joecGnw4jQVA8M4HDROcMe8x/jCrMdFRXGvDWeYoaK0TbT5ey1ThPqOUwVO
         ioAgXPNZmZxfos7UcZ3Lc++2emMFJmhRo/35Nkvr4B50d1ARkpBKB+vvnR1WPZbDo6dc
         x+4z4jdaA5OS/BLnqUYLIvfVUOrJra0N2LwlUBuSSoZ7zXHiuZgQWDBL4Vb9Y4iF1lgo
         HYng==
X-Forwarded-Encrypted: i=1; AJvYcCVWsoQxCNv9lSit1pppAQrxHMi6ufP3WvXxnYXUA2Ww+5v/jcvR26eVymNE/OKs8uX19q8D5wIbkVjnmVorusGi@lists.infradead.org
X-Gm-Message-State: AOJu0YzvypEB9p+fWLJI3kI51dSq7Suyw0PbfEAkJoEzzmM3vN/n1ZvB
	lfMYWNwuJouP0e87cuMmSiRZlqhyVslcQG2aUFgsKwKxw91QEePOvmCrcy7oRg7pPw==
X-Gm-Gg: ASbGncvU5qD8VpHmbjFAU1sSXXKIY5cyCblVzpZyG5ODRV5F/tcPB5Y4f3+5Y4Pre1K
	TgX2GIK14Au+lWn8n2a8f2hCQcLMDKmupkjn2zJuEabH/T6YMyAa9DY/Dd+p6Lfiywpzv9wGqfx
	O9bbael7oSLCvIEYw3rJhJ3YAdvKT6PlV9syo7oPQF4VbbK82mMVMHtFAn2z4MIbQVxWFhisKE8
	t9DFN+DuZf8NHgRHgw0N5LUkwbBFlBkZfwArK0jaTEOxyZE9XmJnpbjLFjHcEg/Zdrt+fTwG592
	wK3nd2KZn4lGU+Sf8u5OS73GWJlOr04jjTaxSSPGnaBoqrlS+9F3wHpsSq7YbG7A+0SF+OwkBEB
	d9J/m
X-Google-Smtp-Source: AGHT+IFSaTTLDfYx+UWWlDovaDt70hJSIR1Xh3wlmjJQPRnGgcY8c3QuDCpwsHT6wqBwpIU2/viMsA==
X-Received: by 2002:a05:620a:f05:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3a887d47cmr524768785a.43.1749650924532;
        Wed, 11 Jun 2025 07:08:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170613csm865441585a.6.2025.06.11.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:08:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:08:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611075414.4239-2-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_070848_484030_4C19BB3D 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> Use the dynamic device name instead of the hardcoded string "at91"
> when creating the OHCI host controller driver.
> This ensures that the device name is more flexible
> and correctly reflects the actual device in the system.
> This will be in sync with ehci at91 driver.
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> 
> [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> 00700000-007fffff : 700000.usb-ehci usb-ehci@700000

Are these two outputs supposed to make some sort of point?  It would be 
better to have a before-and-after comparison, so we can see what the 
effect of the patch is.

Alan Stern

