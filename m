Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCFCD6B6CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3le7Y0Gii5QDreHgxxhBrDb8aLPtkqMWBJFzizIbbqs=; b=Y6c0oC2YdQY2h3L3JoR/U9f64h
	q+JIbIqgOHJwxZdUza7yT8kz2tv9XmoTEFs1PZNu3P3Zl2xsMqT+HV/ghDo9c3OUQLJ6MFYij3arD
	CL2U5j8qp6HVxeFQI2W1nBavgKBrBFHEqZe1Q7zkjOkUROVrlkkBnyvTDXaD3d9fc9/hiHzUpW7Vy
	YoUGt+KXIKye4tMIwJgnBIYwjNj582GkKfCB/f0GwY238UW84UpytXptIPHww3KRxbieIdhdq+bmJ
	vOFfozRexdUBGS2wejr6jpMKb0RgaHK/smd0QcrE7vzaub+qyZTmR4nvlJq+LsltJ+4z0qXF87ky2
	QYciMLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Eca-00000001ZLT-2j4A;
	Wed, 30 Oct 2024 19:44:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Eau-00000001Z8V-3dt1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 19:43:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-207115e3056so2453045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730317383; x=1730922183; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3le7Y0Gii5QDreHgxxhBrDb8aLPtkqMWBJFzizIbbqs=;
        b=ivdmMoyyKK7PrHwMxq9izlRo13owIyI9dXAuwpiGw9StUnp3igw1lyNz1J5Db5z3kp
         597kq9/M2fPHsCegGYhYNyeqpEvzSdgBvRK0p7skB/j1urifhGNl69N2kETemGG9NCeS
         x5hTxpreXXnH7nx6HA1WZKDZMQImGy+jeFE/gVzRNybzkVHRIonvfZXrMnAGzbiJ8LzN
         mtlYoFwH0d6Om2SKxrmhlYzin9IzVRa4yNFCp1i/2xYdiYvP8ThgD00AM2vxA/fHiKKf
         /oq5gjAWlcKdG9dMz92YKHcG1IdcXXZ6J96o74BHfGW7ewXs6lEwmzO97srdhrG9xQk8
         BOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317383; x=1730922183;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3le7Y0Gii5QDreHgxxhBrDb8aLPtkqMWBJFzizIbbqs=;
        b=qfrcNlh1IvWIXG9y007/cfPrHmSQuQAao3Ogl+2h10mAByE3s2XVXbdfyS9/zgHQNY
         NB2FpQF5vIsTLOSz839iLGdjvQv3eDhRBwB6x8AEon6WW5UwSZ6mlwJy9A1I4tk2pmSh
         ngNTy7nTpVsCVDToWKcm0Wuusz2dieTmS//23eGtP2FohwA61vYKDq+hHixXINxNEYa6
         MOEq9yqj2KOWJKLyWFCOJnNATtJgqSVavPk9zccIFbx2KPyeEjTAVgsIbSMIYPzjVnOx
         RSgKBhHp9dACaSG+bA3L1z6JXQrvNEs4xnxw7tIo8cXcK3oYXz3e7qp4Ke6xj9qeoV6z
         1jMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTxc8AL0J24gV8BIBUCa3BwYmKPBKUzA0B3X/Rk+2OfB4RodRl5boV9p6zo0/TY0PwmUujdn0Lj8QPRqe0bPAV@lists.infradead.org
X-Gm-Message-State: AOJu0YwBctGh7MfAL+abLOLpYaSwZBEmSJl2p6AGBXXTvt8q57FysROI
	Zs9RddibDgZTd5ND0lJWVn3er6b89FsQ2/d6lvk4VcsRpfugOFFnNUwhmVpdE9E=
X-Google-Smtp-Source: AGHT+IHk8AZ9wf3uzoDfMby1k5RqREUDlcflFSi9zNXpPdV/uu6krYbXl92mEIypZxjKId/zeo/NXw==
X-Received: by 2002:a17:902:d4ca:b0:20c:a387:7dc9 with SMTP id d9443c01a7336-210c69e32dfmr232900685ad.29.1730317383199;
        Wed, 30 Oct 2024 12:43:03 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4332fsm85099085ad.16.2024.10.30.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:43:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>
Cc: linux-pm@vger.kernel.org, Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole
 <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis
 <sebin.francis@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power
 mode constraints
In-Reply-To: <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
Date: Wed, 30 Oct 2024 12:43:02 -0700
Message-ID: <7hv7x9qsvt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_124305_196571_02144098 
X-CRM114-Status: GOOD (  25.88  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
>>
>> Hi Kevin Hilman,
>>
>> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
>> > The latest (10.x) version of the firmware for the PM co-processor (aka
>> > device manager, or DM) adds support for a "managed" mode, where the DM
>> > firmware will select the specific low power state which is entered
>> > when Linux requests a system-wide suspend.
>> >
>> > In this mode, the DM will always attempt the deepest low-power state
>> > available for the SoC.
>> >
>> > [...]
>>
>> I have applied the following to branch ti-drivers-soc-next on [1].
>> Thank you!
>>
>> Ulf, based on your ack[2], I have assumed that you want me to pick
>> this series up. Let me know if that is not the case and I can drop the
>> series.
>
> Well, that was a while ago. The reason was because there was a
> dependency to another series [2], when this was posted.
>
> If that's not the case anymore, I think it's better to funnel this via
> my pmdomain tree. Please let me know how to proceed.

The build-time dependency on [2] still exists, and since that was just
queued up by Nishanth, I think this series should (still) go along with
it to keep things simple.

Kevin

> Kind regards
> Uffe
>
>>
>> [1/3] pmdomain: ti_sci: add per-device latency constraint management
>>       commit: 7c2c8d2651b5ffaffb2d5f723bd5b0493bd66f36
>> [2/3] pmdomain: ti_sci: add wakeup constraint management
>>       commit: 5a2d997b1bf8b05379309270063d7b9bd3767dd2
>> [3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups
>>       commit: e8f35dc8de8c3216d28dab51b962bb31f20934c8
>>
>> All being well this means that it will be integrated into the linux-next
>> tree (usually sometime in the next 24 hours) and sent up the chain during
>> the next merge window (or sooner if it is a relevant bug fix), however if
>> problems are discovered then the patch may be dropped or reverted.
>>
>> You may get further e-mails resulting from automated or manual testing
>> and review of the tree, please engage with people reporting problems and
>> send followup patches addressing any issues that are reported if needed.
>>
>> If any updates are required or you are submitting further changes they
>> should be sent as incremental updates against current git, existing
>> patches will not be replaced.
>>
>> Please add any relevant lists and maintainers to the CCs when replying
>> to this mail.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
>> [2] https://lore.kernel.org/all/CAPDyKFr9isnz66B+n5y3=QO-ndB05JKZN3kgXO+kXBn7ofcwMw@mail.gmail.com/
>> --
>> Regards,
>> Nishanth Menon
>> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
>>

