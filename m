Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D35DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=; b=G/+0ChEIXxdujLmkIN6YEiF+rv
	L3Z4N/LJXlgJbJVKwRT0FGgAsUGzMH/cJmbZxsuaHuxj3o3hYmswrMV37atNKafJ4oIMAMUmHWcAj
	DlSnmIMRr4SXGIT3/FEkL0b7FQT7KjbrNss6gOPriEkvD/mXx8FvCD+9qYFay3Ej5W9ShiJ7JclLH
	Dw44SgKvwSv0jttmeiUtFWYnxeyU+r1YajNGY/etUJwQFExf2zvMs+O+DLFE2mYmRk1bcGlwliMlO
	MFxSTpdVQWgfm0FL1rT/uHY1lpS6YVU7XmylPVNX/e/oftYSDb84qNQHBKP5GjbHCg4sICKpSSvAC
	Zf8M3rrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SUZ-000000077l1-18gs;
	Mon, 28 Apr 2025 17:42:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SIg-0000000760b-1qT1;
	Mon, 28 Apr 2025 17:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=; b=Qs5jQ8JaT0rzcnpJUJE5nXAQoj
	qNwtc0ZkFg65mWTHNgVjwghQxn4QL1PEDZRN3FvnTrEwpNEc8G55btwirJ61b3Ftd4xk5muYQxLyA
	bG4bBuTPeBArulexdWCBTSExo5cQDIrqQvntYt2vdZhop1Yw8mKzsN33HTwx4ixvvoh4X/f7WUQyB
	12ylAyt40PV1/X3lTgeCbjvNPpZlfLxp/zmUW3O8I6YrqcCbWkAE8SuhCwsha7jzwcXSxMyYXuhFw
	PzHiPG6FXuL3DAWqnP6nX6f7YAecd4mK2csOyVwQO7zknhnFQ6qMfktjPUJwBjCevyWNFASXYyygG
	/UTkwEWA==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9SId-0000000CvJR-0I7I;
	Mon, 28 Apr 2025 17:29:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c33ac23edso47105095ad.0;
        Mon, 28 Apr 2025 10:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861384; x=1746466184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=;
        b=fQc0OTHHf4GHdfvPv7G8O9ScRNbuR8exObJmKdVCGlLRsKwTdl4VVr41gKH+kAy1e6
         hSdUiLl7m3AUn6AVdYKEA5cEEsFNtbTnBC/C0CkdW6FgNYJXlt4uwe6WhKiOfqYl9wga
         lSZZJO6LyIxW/vpp8YKoZauUM2SMsRaJFx/OXxelwMsxlNMsJKVXeFOH0X4zt3mrBd1x
         1XHuxNP3SQ63QW2MwAou9rKfdJtGZACbSM1BU26LLzBHBgvoMmdgOJoUuX1eDM7Zwjdy
         09cMrMwU+UK0TReHiMVb5/J6It0l8YZpSZtgu7wBCxAiunXUC7G0Mm139R4K/l4j/zuM
         ON7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861384; x=1746466184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=;
        b=u3vDPvkXZbeIxr6aqjcIz4f+X0/J2m5Kp9Z0GElqpeV/Zqmni5FRwaXPPcnkPmMLVZ
         t1+M05QyQ0XYPjsdeT8IqGut6SeINx+Wiixa+LG3Qv2uAe+1AzKrbWORAOMw/AsHFkmb
         fRP5biXqmjdtgzCYKc0Y1gfhz03KhuChKbKRKgx6hnfnAMfFo9CJ4wIZdk/eUG5fjiHO
         FDLIdyEF2uSbhz9UF2alB0tn41or6uBBmdtH0zj9Mrl5rhrc7baRyaCwDT1uQlZDp8TH
         Kg1Ka7z5q7t4vcLegOCF6jYPMJnL2COzEfAzyWA8BLe2UyisNeqkfXnSEa94xd0MT1a2
         ElKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Yax3AS89ubkdaxkPaZKyiiFDbYMJXR0aK8Sblk9VcNU9SuTAqsPN5T/hLZIsk13Gz04eEmbK+ayiq2Zzb9Fo/Q==@lists.infradead.org, AJvYcCXttoNhZxlz3/tkXWOSLuM1GYkBFjNB38B7RT0p+O70u6FfWlP1iifmZhPhrVrGQjVlz1MajHgrBArTnc6pXG5M@lists.infradead.org
X-Gm-Message-State: AOJu0YzOsqLkLCNRTzEqCGCf5o8WhaVR+f9F6Sii9g5XRHYbwEhkXOtV
	1Nla+z5/py3KOO7G6qGa+6oNie7fAnPViSwp6reLXwpBrDoVwbTT
X-Gm-Gg: ASbGnctXVviSOge4N8wdl+85sHdQZKFHe6tATC9krJaLfWhScx7KE2U8t1RHKlWcgA8
	c07jN7B4AzZdyjds2UyXHYX45412AGidvwUh2hKMGgYry6JsLWkEvAmf4479RfbwyMlccXdrcWm
	JQX/2Oul2uLee/7vouaAU6UXNqNBr6KdGdCkY34PNl80a+U9DBVJbf/QCsvhAuKlb/m0comtwKB
	40NO3bb+sJ2x61TIakrFm2K8gIrACZXqWS4wqiROqVTijY4qF10+lqWwQ7Y0Yo6aVLbbsTwK7S/
	EwtsXhanVkf3yPWEtPFXFVyVauofXGAP2N1vris4ButqPi4sfXenSw==
X-Google-Smtp-Source: AGHT+IFIeV3LreDmlj9YDmjvqpTCXGoAp/5oVXl6et0gDWWLPyCJ4uu6m+P13yW+BLwBFtXy/ZO9bg==
X-Received: by 2002:a17:902:fc50:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22de5fd0c7dmr7901825ad.12.1745861383836;
        Mon, 28 Apr 2025 10:29:43 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76bc3sm85850065ad.28.2025.04.28.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:29:43 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: geert@linux-m68k.org,
	pavel@ucw.cz
Cc: andy@kernel.org,
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
Date: Tue, 29 Apr 2025 00:29:17 +0700
Message-Id: <20250428172917.25405-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
References: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_182947_296990_40421237 
X-CRM114-Status: GOOD (  24.89  )
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

Hi Geert, Pavel,

Thank you, Pavel, for the confirmation.
Thank you, Geert, for the review and the question.

I would like to make it clearer.

On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:

> Hi Pavel,
> 
> On Mon, 28 Apr 2025 at 12:37, Pavel Machek <pavel@ucw.cz> wrote:
> > > > This patch series adds support for the TI/National Semiconductor LP5812
> > > > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > > > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > > >
> > > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > > ---
> > > > Changes in v8:
> > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > >   and update the title and $id to match new path.
> > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > - Update commit messages and patch titles to reflect the move.
> > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > >
> > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > Thanks, no.
> > > Please, put into the cover letter the meaningful summary of what's
> > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > bindings sounds more likely like LEDS or PWM subsystems.
> >
> > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > but...
> 
> Is it intended to be used as a 4x3 matrix, or is this just an internal
> wiring detail, and should it be exposed as 12 individual LEDs instead?

The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
It is not just an internal wiring detail.
The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
pins control 12 LED dots individually through scanning. Each pin includes
both high-side and low-side drive circuits, meaning matrix multiplexing is
required for proper operation — it cannot be treated as 12 completely
independent LEDs.

Best regards,
Nam Tran

