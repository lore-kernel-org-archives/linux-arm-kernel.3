Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A68DC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 03:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaSfFPZdEGUZY6hrb44h13Q/oeNF7xyFzDFwnZ79Vrs=; b=TEbGVg3+IxUMksslt8eKr1C5bv
	WUolnP5H4e+QdsBn47bJq5qED3OAO+KADqOoDNbHlI9XQWJneWI4qPLylxk+LZ60gEEooWc7h0ni/
	1sJReauI19RoD+zn/ZdNjyJARgp3F68qavpPvq0Y+ExpuWyfJO1+npN8MLSPeGVMf768qGg5oQKj7
	NglAVnZkqdw4fz7GOXZ9zKx49TkfimpshR93I+IIphs2gDCf2z/QhqkuqlEsgH3yzbu2s06ZPMPW2
	UhfaUn0hSoJKk3WcbP8njK3P4aVPJGx3j5QLja/MjacUfwRR9PN3s0hPmY48+jvibY0BJdcCM3GiU
	7ITPXV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzREa-00000003NEs-0Cv2;
	Thu, 27 Aug 2026 03:57:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzREW-00000003NEM-31fv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 03:56:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47de0093c42so1242897f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803014; x=1788407814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaSfFPZdEGUZY6hrb44h13Q/oeNF7xyFzDFwnZ79Vrs=;
        b=hUFnIVLYWl9LSHgzEUn7x7DVREkE3Po3gDO8p9qsFE5jmtk0/26JvLcPEpCVdoBDmh
         I0FFdU20zQxJZ4ZeyIY4uFONcd0XTyXGghLoXhlFIboMMKW/sbPRIW09f98Rlxti9cG7
         vSh5jUiaAmjl0Nu8aTUqflaCrpsA6ZGq27lAwXQ4SBmyF4xB4PQ0ekHEI03L89QLuso9
         j0ZhjWw/Hz2XMNZGZWBUgVGDVAnbQw0J/vQQkcULLxBX1WpmH7cqGJNUlGlsPN/2LZWN
         5yWAaVnixlXVEGbREq5lKIie/NwG8fg5L1CofZjjC8nsjbs7yHdvRuH7uKbU8JP9OaSw
         BIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803014; x=1788407814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaSfFPZdEGUZY6hrb44h13Q/oeNF7xyFzDFwnZ79Vrs=;
        b=PzUUjQBmgoWpsMQa/p4OpC/9YvZZrBYT8GhZcIVQmHy+LzqHnWlFUxqSi8C5EUI9wu
         8ZbhfC7+1MxRTTXHnPvoP1Bl8G8HyVpp7FgiQ4g8E+aVRha/JaU78wJNORWkJfPZxwnp
         dP0j2hjKu/9gHgrPUZHrsZcEGFSgx1N5FUfGgYaTU+a63OYOkGofllROIxftd35vbSP6
         Ta6972G+ZjR789UCCgszRBwlxtTQ88Jko58xAnBQFfpF+Jk0RG6pAxZsXqDHcCKa5jLT
         /EmaljWKQ5gxlY4xWGMDz+ypfboL1Z+otBP3Nle8JoQdYDImvX1EXSTno53ahJ7R3Ypt
         Rbfw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzb3jM9Ca8O8gPu/Itku8PbgYRyGi+7z31SMSTXYCjyb+S3Gh1Ez9m0cseDu0O7ByaRflmzuMsxDLSQ4KsfoVg@lists.infradead.org
X-Gm-Message-State: AFuF++n680ePr0I7VKZZlu3PGtIme8LqawYrZtMJIF3lwpjMwejlJhD6
	njGDlGvaJUiNYs2qINRWCpL+FgEAUXIBHHeLmGRoJbIZe06EjLgHWdfl0eGC4Q==
X-Gm-Gg: AR+sD104zQvxUztzXp56mBNIo8f83lApZoGhH+Dy6jqbNhJ8P96kEusJbgqXT+i5Nue
	K5XjJf4rpP01BvEj6PyGhWI9P1PSeCOHK5dxnuyeAoz/EHP1BYXGeEmnzCE4zK1hqInafDBU3fu
	p6nBnu3vUhQw3Lm/WggrtMlnw1spMRjFITbV3b/4ViM2MbGpLqZC0pjLaQ6LO2eV56wSaFnpXCt
	drgo7dPdX9VVgGvX2F5+CQz0Z8FdIaZ0yW6XmYs52c80/81aMvPc09XQ5hzCrAvPzJ5aVvjNLj+
	cqrURPPiCHvLGRoXsDBbuetKyRYJGvvDZkE1dYoEve8fdLV5hyoaNcqrX9dGBFSVcU6r4ocpcmk
	OC7vBei5i3CCiWvVdX75jf48AL/DtZeEOX24bbrJfAOo6zoEX/P9HTFRKSiGBqU34aSXOdJ3whe
	JOREEHlJy0A9oLaz4OOENSqqb3PC4VeDxbr7WKn94/1b1FIpqKH1gQrpwW7V+fAS0vVxutK2Odv
	vd9vuZbAhiq2uh2JhjePtZtu/c9L5ZHilFTvQ6KG0vXruMB3bLzpaY21G2QSmIdOGjVbptMw97K
	551Fnrfxj8uaqQH+9aIPDrU=
X-Received: by 2002:a05:6000:4384:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-482e2696b9dmr9922200f8f.3.1787803013701;
        Wed, 26 Aug 2026 20:56:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8fb5sm5723467f8f.29.2026.08.26.20.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:56:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 05:56:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <ao-1AUkmBM0lVT97@gmail.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809180600.6049-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_205656_770891_9236A76F 
X-CRM114-Status: GOOD (  16.33  )
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

On Sun, Aug 09, 2026 at 08:06:00PM +0100, Karl Mehltretter wrote:
> This patch changes the xchg to cmpxchg so that the active_asids is only
> updated if non-zero to avoid a race with an ASID roll-over on a
> different CPU.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> This is similar to the arm64 patch [1], with the difference that
> non-relaxed (cmp)xchg is used as in the existing ARM code.
> 
> This is a resubmission of Catalin Marinas' original 2018 patch. The
> original submission was not merged, and the ARM32 equivalent of the arm64
> ASID rollover fix remains missing.
> 

Just a friendly ping in case this got missed.

Thanks,
Karl

