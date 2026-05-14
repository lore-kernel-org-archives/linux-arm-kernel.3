Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97E2CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=; b=hD6dDkEnximl7pk5l+a1F4hhI5
	ozbNhJpqHQ3d2xfG+22ZOKPLjKd2GxxY1YVdOzliHKXwprEmxWhaBzgIjpAvwj3EYXaZep3qCYPZc
	to+0VEm78DxSk4Wa5tYpHkqSTN6jDcf04ZSVB1Hg60onbyF15EFsz7cDxN2zEeR5o8M+cWw6Bemjd
	JGb97BnGyWCo5b9VgIF2MXfJQnoJxFvKqMHEvejhF0tB7Kbha3PiKIk8Z9h6YcmoOJenBrZUbenfL
	dbupwA0eMxF1u6yZAfhy+FqKuvj/8iZGC24cOhWdx2lhqMYBwAPa8/K7E1NvwCvJ73Y0iXSkGqyiu
	lyTG2YBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTNk-00000005D0J-27ZT;
	Thu, 14 May 2026 10:33:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTNh-00000005Czm-3Dgo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:33:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so5456824b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778754809; cv=none;
        d=google.com; s=arc-20240605;
        b=bF6bMv2UItYHf7BAoWre27QzCTyGl/BK54o09sgSJWkEKn3bhUHtD6oPV/UkAf21o0
         m7mLnS8YrXdbHDevPRUFW0iwVt8I1VAg3mXcpURyMwgJRqNocq/yOtRCt3C8JltkWzCY
         aRBIIH37LxMZ4nZgPtwwTNmVNGmNSgGTyq8s0rGLTWXtsVCHx6sdWKe2gVr09ruoJKUn
         zVt9n+9hGOnkZeO2xIslsS6VtXDJLEd2XZWJloKyTivhAPxA8l8zU9m7P35EO6FRNN72
         XrL830qJzKwkdVHh8CYlw723Ah5jrQj9AXisex21t5hbCH5UIV/sh1T/smWGn4aKYRmb
         T43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        fh=4nI3CmTandQAPDKhKMot1cghneUHLT0v9YOie0emonE=;
        b=FN4CULXagXgXwTk6bdFuq/XTkrtyHulvzaS6KKl3aQ+3BUcc99miSjSmNqOOBqqtlw
         X0B8Y5ZqaL9d9ovvIdnUit/8Hl8vVPAJlD+0NHsdfBklclUeA1LGGyY3umU9nWpwrLds
         wu5gJAql0+8TEc9WTBeJLsnHVhieqwEMubbhX+joG1aiaGjI2gLzfwbFycqxmo6M7Rq5
         UpeGAu+6/atIGMzOlSTE124tssnMDphUbizr0CKCnVgXdovArUKvio8r2V4nR49yVYC6
         fffaMkRCdMb1dJj+GXMZqvCXvujXYG8y1nn1RfLqN+nFN0XbabLFVbCfsue8gCufbYnd
         5XEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778754809; x=1779359609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        b=DcpgiGn+r1p4K70TggycN+6vP/67+3DYaaG8NMY+LU0YaSjgX+jpas9txngsc6ulL9
         zUesywWaZIxS12m7aeorfrcpd1xp0XRhvgBVEp45y83qaA+JAXtExLYoQxkBIuVvNkj7
         Ry6rH7qeqxM/xbRq8u3iPtw5kA2lzvJck0TmCBjeVFyGM2tRKhQa+WQUC55waxRUDI4k
         jqa1c/ICvrPUjc+E3ymlqtj8IOzvuHq2U/A7JbtebSRF/4WaTspmgM0226Cz2wi0m7EO
         jyZo+BnhP9KbG7QXUBDyA2nCfNlw4wQFUORgBQAorpmc5AsHUQXxQu4xGtnY5NTfokHZ
         r0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754809; x=1779359609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
        b=CujN0RItmHNQH9SAXGZkjDkueu0/nvtVjCoOFn3gi2fnq7Xs4Y1cA+LjVsuqskgpjq
         F/BvaiqduJq2UMc7zczohL3QQufwUIVwOu716AekuD4B8TTVKKDWgmpzZ/Z309eaA2Sv
         Zd2Bjz43hN0JtfjbrAlOPvoDBTqhJ82f9m+jTGfvQo4egQX0f3UZ57hTJApFZxUVBu1T
         NWF0pDWqJ6n3BvrHt5hCw64WrUturubqbuA9cF7w3DQND69WmlUX7GkQE8uU6eBoNH61
         yqSCh8kJw9p9IoKGXQgeaUynxobSFxnC47s7BFAZE02Wm1mm82kQLmt+CSQl9HvoVvRM
         HMvA==
X-Forwarded-Encrypted: i=1; AFNElJ/GF9hQ9njaZk3UqbskhldeLzgp9uoV2PjYyAEtZEyhUFb3RPm116wE46qMx4C/wp3GLO5b22OhXZapz/RhtnOb@lists.infradead.org
X-Gm-Message-State: AOJu0YwT2S5PwI52vdYM2upfGIhQUtHRDMh+Sr7soUMIcDRO1JToTn09
	DVjhyz3UWMNbeIVqEjDDViafJhy/vYR1wfHyjM3aHOq4qtpXFVBwF6SAqMUUccSfblyYnX8ZMO0
	tlZtYsUa46nKabHuAWo5435yEIcVmPOg=
X-Gm-Gg: Acq92OETebI/IWt0G2LXcN+WwzdGByJNyd+SzYYQl44aqNeJjbetwrz9kPnCl8NVxHK
	UGgiIn6vdkaQgtKO/anlAre/+TXX44wRjLR/YhkYGnF2R0e4H0Ylta9UTWXrzhcmkrcBXoyND11
	DkbTDEvP0A570yQHirkmACpM0gIVadLnI5MFLIYL+Tfa6xBQLXwdtS+WtmJ8bC/Zy+n4ZkESiHd
	Iu+lUGRTCbJNe0o/j18vDWtvMSOGj5E11ulpridQES2n9qbxNl+5p6Xu8bdqAtzvJYjkt1bAuOm
	n7JGf0VPRmvnBEz6umdkCkXbAt1vtwbmEysCwQ==
X-Received: by 2002:a05:6a00:ad8e:b0:82d:603f:f3a with SMTP id
 d2e1a72fcca58-83f04277f6bmr8500889b3a.24.1778754808499; Thu, 14 May 2026
 03:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
In-Reply-To: <agUknFcDIfwrOCld@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 14 May 2026 17:33:17 +0700
X-Gm-Features: AVHnY4IDc6tthLgrHjXC6SYo89bL-eLMYrCt1lnu5Ycu8ceEQa82GPaz33HiBRo
Message-ID: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_033329_809326_A95233B2 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Mark,

On Thu, May 14, 2026 at 8:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> How does scoped_guard interact with break statements - does this still
> apply to the switch?  I've not looked at how they're implemented...


I checked the scoped_guard macro implementation...
and You're right the break statement inside scoped_guard only exits
the guard's implicit loop, which is not what I intended.

Since there are no further statements after the switch block in this
function, I will replace the break with return 0 to correctly exit
the function.

I'll send a v2 of the whole series with this fix.
Would that work for you?

Best regard,
Phuc

