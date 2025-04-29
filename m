Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F265C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=; b=mX1Y/s+cnjxCIEzyiW7Pn2ufU7
	bJb8qLMyS1G8lYZWY2uha6D/5rnhkmNBfYhHVvClnX4H0v56iMir8d81lj+Hz8s/Ut7Re/0J5NMjt
	/tudYSVcHjruJK6SkauHI1uvk8nKtFLZkwXLMCFPnqjpmm4b0FDfl0t84dZjeWTqLznPtyKNYz7Go
	qKjJvtPNE/+MAasNwr1k1Fkf4R+0atT0yXQekr+wVqXVOpl9r3WFshHITQHGJXQBdxjPI7J8QVOSc
	2t/anEF//6KPo5X4UxwV64mkuDnk5dTEOqhmHwGvXjjfxKMgyd5HPNPXvHEk6yJ6UV73Qk1ALOYpp
	1qPHztzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oS5-0000000AMq0-41bm;
	Tue, 29 Apr 2025 17:09:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oMB-0000000ALzA-10xT;
	Tue, 29 Apr 2025 17:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=; b=dBpcjr176+iDZDlELcCJUCRnUx
	O9+zBOH0mEYdTtxHZ2o4A6u793qXlRjmx5FjoNdf5P6FH6lgratU7wOrqefA7vyXgvCrIuFolYpyX
	jXKR1wA42WEIdfFqyotn/2mn1QRW6H71hOB7UbEAWFeD1bSMU3HhkBEG9jQulcXYC3WpdNVqfZMXs
	e0iv+JOyXwdR1qQklkdDtCFvZVcEDVImLyJ9+jJQSNExxaI90LoeJWriSrUtiZOwwiJSLRum47ZJa
	4QglRbaM5Cvt5GtIeV2GobKGoKvkDtvNsk4RysB6JoiXWhsSqhxPV/HZKWlKehpx7GDxvJnuWboKu
	zx2fgFmQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9oM6-0000000DUST-24qC;
	Tue, 29 Apr 2025 17:02:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso6351738b3a.0;
        Tue, 29 Apr 2025 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745946167; x=1746550967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=;
        b=mUC78W2rrDs6aP+h98+GHSSzbXL1drjzUVAlZ5LVMZrOQbjIMv27POYXX3Er7Pz10j
         XLKi4go3rVhnXljg8QiKWZfeFVBXp9ldQHmkHssyXv4/W4wjo86FSrxypSBNYXuO+vzh
         /tG2H3OwlUXWMlt7LoZxqkDVaR7Z49DVdEEsHGU+UU+BOA/5tGVxrVZDInAf7ngtqcrl
         3azzHWgilZCTYFWXX0SnkfGp6sMkQKkbldzYdzUkus3LUcRiJa/HyoVoDZuO2oakcT9P
         zkHMl3ExNTI2HQq8RHj3s+0cUWzoB2raS+l9QPgLP/tiaon9wsYhdWTztL8p1LDLGkht
         +7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946167; x=1746550967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=;
        b=kJhOxgyndaXd6TfqpbKM78i3wP3slSAiOo5X98zGsfxi/wmVleSLa7RcGTIYe2Gbnl
         C3ed0PjqwJCfweEc/mYjXAE8+XnzVpvUM2TIVV3Z9TwtDZw1GTZz17urFZHqphlywO2e
         /U2MTz8BcoV3fCEhFLXGYqJnCMG7VBCQaFOIj/18qHDTFWEJMSJm3NCIFWPIWfFsqJqc
         Lnjmap01HDOOAZIa3o9wsm93Fp0sTbc0PzaZHZHe1sdwtfwWN+QFgcKhD/eVEp/hNAGF
         GqO9nOReIeaK4OYWzaoBnUHMDmF2eMOC6pJx22O9LXE601wcqBhOlUS9Y44AIXdg9trJ
         ztlA==
X-Forwarded-Encrypted: i=1; AJvYcCUl7S2Fa9AbEAHgUnyLPPN7+9BlBfsrEImcF/Iks42P7XwHD2pETRCo9BQ2jmhsSZydx1CrkyM6ZuX1SmJ8vQ/zkA==@lists.infradead.org, AJvYcCXTpy6W8mfaR+ZnLPIBuEg6+889k+m2ObS8bvZ6NpCw0tJgEQGEnzH5BhOFkblVoxkIZzRtGSk9MvxMwkOvoVO+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx33Ozy3I3JleqLAlvPPGGqvN1r2m2JLN2D2XbFoIa5D+kZ0sCv
	mGr9PZOqRnFTmYL1GfnsoLMw7GsifViAK0hBDSyiB6CimS3sLeXT
X-Gm-Gg: ASbGncuz7cxtGWuxLylkQyVWj0cTIks5V7VUg8qz5R6pK0ZbO2kD8JJgVyYHETaPmCN
	qVKzrPMcN+OKjktZZBMEqHFAckBFtICtmu7yn6FcUCdxQuZZcK4eCyms+vVoUH6zABbfVZDs1T3
	ccomVDhpJbRvu1H8oCEpXTg8HxEmfKtsr53KPR1r/KUd52RQ8VeTEGFvvywBCZxtTj6njVRkaPO
	U2IFBYdojyb8qqcB3pJOXNSl03wdgVyOmxzv0+syBt39wECo6Be9TOW2yakuOfTQwJatba3+tKw
	oXg0rlScREigufKGOIqH39klkraJ83icaoKYcF5icbvZIBXbDZlsKA==
X-Google-Smtp-Source: AGHT+IGkGtI96G7NWFN2E89NjJR+pbgDvKR6btVNRTveJJNzLLr8FiP3p5cA/1KhvFXQjNJDS77KfA==
X-Received: by 2002:a05:6a20:c91b:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-2046a6364f6mr21636131637.34.1745946166704;
        Tue, 29 Apr 2025 10:02:46 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912f97sm10216513b3a.36.2025.04.29.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:02:46 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@ucw.cz
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Wed, 30 Apr 2025 00:02:20 +0700
Message-Id: <20250429170220.8145-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aA/ineUBAM5IU79J@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_180250_803713_17E85D8A 
X-CRM114-Status: GOOD (  26.96  )
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

On Mon, 28 Apr 2025 Pavel Machek wrote:

> Hi!
> 
> > Thank you, Pavel, for the confirmation.
> > Thank you, Geert, for the review and the question.
> > 
> > I would like to make it clearer.
> > 
> > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > 
> 
> > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > >   and update the title and $id to match new path.
> > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > >
> > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > Thanks, no.
> > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > >
> > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > but...
> > > 
> > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > 
> > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > It is not just an internal wiring detail.
> > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > pins control 12 LED dots individually through scanning. Each pin includes
> > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > required for proper operation — it cannot be treated as 12 completely
> > independent LEDs.
> 
> Scanning is really a detail.
> 
> If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> 
> If this is used as a power LED, SD activity LED, capslock and numlock
> ... placed randomly all around the device, then it goes LED subsystem.

The LP5812 is used for LED status indication in devices like smart speakers,
wearables, and routers, not as a structured rectangular display.

Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?

Best regards,
Nam Tran

