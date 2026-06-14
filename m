Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7DECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5fQgJl/JNDh0rlg6/DBaSueHDvPwrSzOEw4D/yzM6I=; b=zRFi1iorJrV+i/yuzzi260ZIV0
	XaTWZxft03pILlr6LNpH3BzFyS+LAUUXvdOPyR/gM46VzyapAb7BMd7wT3wJXNKIeMaX36J1TZ+rL
	AR1TvDP7IygTiXo40aWEeJuTRr/SwSLCUE3tLHuP0n/+378UQ3Qxm1M64UbuO7LimRqgiN/mcna7H
	E1ORPXboHaGTCA0ZbsbuZ5ddA3l3oRljmDxjz37Q2B6uEVfOtmSr3lFHANXi5fwoHTuA1/fDSvPZv
	H2tpXweSdwp4d/IhRYFEnOh5PBT5p4zS75Qizqnyud0kUnLaAjK/H1znQH93MYY32fHN1GI/EVcfw
	+WVu0hTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrtD-0000000DIAE-0ajj;
	Sun, 14 Jun 2026 20:57:07 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrtA-0000000DI9t-459d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 20:57:06 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso6138649eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781470623; x=1782075423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5fQgJl/JNDh0rlg6/DBaSueHDvPwrSzOEw4D/yzM6I=;
        b=j2QqIRaSPh+xYKB0ngq4rmqc5a2glQKoaIq7M0WDBz4fbE/hIke7UV1ebtAUAvzVGh
         p5COyraOoE//qjhUoSPKEn2SiOYNDbein2tUB1qABlDeh+D9x+vY0/YswUCZoqK8M8Vh
         abtJ8V9vCIBQjifaayx5PAW0V50rMFLp8neudqDLjYMj0pZmua/OnJ2RL0tXiRmWVQ9m
         /JRDcMsQUE7ooUQQ8aCbJ7Q7PCOxiE2p7urkopcGofNacfegXxgQ1sAjazxYSvQWbJ8B
         UGNmfpumcMrVhI586lTy9ibFc2Rc/bOAtoki2qawEypm0P7ESNjwGY15zW26exTUS3zd
         t10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470623; x=1782075423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5fQgJl/JNDh0rlg6/DBaSueHDvPwrSzOEw4D/yzM6I=;
        b=SgmV7/n9V+db3/G2dAN2xg/iHNYli8L9ThSxQY3xgbu1l+2HyuPEAqoeRspHGXPqJ7
         u9uwFXnWeAYdyxGWS6aPJ4ZZZJIlwC/uFVWY/M+smKYnlZGhzg9BZmsk1dlLghC/7eom
         qWJo36Ny7DSfjj5kbuatYFvRmsgl1cFVrP3FE2KQFR5oIVz9lInCwPZ7J+yFkyYKHKmQ
         EBjaPSua5aml+iCzwlN4jqMnVRHqag57DdV52JoQLPsDSs7iYuzBzJ+D1uZadJncdg9C
         X5R95ZXWIhJhJHYVwTlcmCWxkfUPRA43POmHZouFGOqTZQ4Fs4q0X/lZteYebBwbt4F3
         g++A==
X-Forwarded-Encrypted: i=1; AFNElJ9RNTDWsxA0o/helImwAyLTOk8Bl4Op2ktjuLm9aubG4nPRrAK6lw1p2E3Ooq+k241S+Hqf0cdNi2QcPsFQkUds@lists.infradead.org
X-Gm-Message-State: AOJu0YyrFtGrLXD52XSF65wkcrQSHXkj6PkZaAENUkg6XbJCRXpv0Ntp
	9e828QHsueWHS4vHXvBC5j9FqHaK708fnBxVumfA8LXaOCrkeKuS6PeYdNMZpA==
X-Gm-Gg: Acq92OH7RBZ1vtfrw4NqyYVvt0wYhYEfMArFK51T1Qi0kKzTucVQf1h8W1/JsJAbyKW
	MCM5psoD/eZYaOef7+rKuItRTXR8TJaqpgmiTHwISGcVSFUEbQ0DUNLGVdvyexWT3fArs7N99dN
	WK9owgMf/WggQ1LOXU9xxa/RGfUmmBHXyE5X9eOP9YuemraUrGascPE/Y8TmV9Jco1IF9owAV+9
	kFCL0TkWi1YHzAJzIWWr2D0JzN8HaK4BcJnKswXeMWpIkj8xOD7PMTO+xJiU0HNb27qNM1i1Ujk
	IaYz92VpLxxNWgr99IFjWST0d4jNCL8qG3gThZy0vuluo9J3rAuna0CmIAalZBGTUr0YTPENc4e
	h2/lSgC9KzOilVs5ZaQ4I5yQaJWZzKriSgiQ6xibAjLwYpj/iVB1aGo+pRuF5FcfYHbcqqfbK0D
	8MuOKG83JVCznpl7TFQhkEjEU1tTUrviIFdHUbsKEbrZpoi8l7Km5Wcaj7ImnOdra3
X-Received: by 2002:a05:7300:7fa2:b0:304:6448:dfea with SMTP id 5a478bee46e88-308200de778mr7033067eec.33.1781470622807;
        Sun, 14 Jun 2026 13:57:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5d91:5c26:602d:6a99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489536sm12233295eec.2.2026.06.14.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 13:57:02 -0700 (PDT)
Date: Sun, 14 Jun 2026 13:56:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: hexlabsecurity@proton.me
Cc: Sasha Finkelstein <k@chaosmail.tech>, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, Sven Peter <sven@kernel.org>, asahi@lists.linux.dev, 
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2] Input: apple_z2 - bound the device-reported finger
 count
Message-ID: <ai8U0QiwpBH8qNS3@google.com>
References: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_135705_010107_AF3BC0A0 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Bryam,

On Sat, Jun 13, 2026 at 08:22:51PM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> apple_z2_parse_touches() takes the finger count from the touch
> controller's report and loops over that many fixed-size finger records
> without ever checking the count against the length of the report:
> 
> 	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> 	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> 	for (i = 0; i < nfingers; i++)
> 		/* read fingers[i] ... */
> 
> msg points into the fixed 4000-byte z2->rx_buf and nfingers is a single
> device-supplied byte, so it can be as large as 255.  A malicious,
> malfunctioning or counterfeit controller (or an interposer on the SPI
> bus) can report a large finger count in a short packet, making the loop
> read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
> into msg -- far past the 4000-byte buffer.  This is a controller-driven
> heap out-of-bounds read, and the finger fields that are read (position,
> pressure, touch and tool dimensions) are forwarded to userspace as input
> events, leaking adjacent kernel memory.
> 
> Bound the device-reported count to the number of finger records the
> report actually carries.

As Sashiko mentioned, if we do not trust hardware to send valid data we
should also validate that packet size supplied by the device is
reasonable.

Also I wonder why would we want to report some of fingers in case when
device sends bogus number of contacts? I'd drop such packet (maybe
logging ratelimited or "once" message).

You can ignore Sahiko's comment about __free(kfree) not handling error
pointers.

Thanks.

-- 
Dmitry

