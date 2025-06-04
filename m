Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBA0C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8v5xJFrwaVgiw+YxRPuN7JQSLgnhsE9pwmAc/C6xcjU=; b=NET/Oyinjx5zEG/bZXk+aaKh6K
	FT40SjAq5XrCM/nAmc3FEXK7GP5Oi2YIhZXmSTp2Wfgpm+hfIjhakxSRcmjC1XeN9oliIdQFZ5pz4
	XIqoeVoVRVtiDNMe7NL48yWtuGornnyc0O8HDS9Yh8joqTlLSMQwIWR4hIVIW8/FgTEYwzvQww0l5
	IgLDR4fOQnqO3SbFfpIcBSpFXqssOaI9VNfVuTWQI1WkoN2p14CvU7fwfNbtkM63b0OJUg4EVZPEW
	P5NRK6qQmRczMpl/x/F4MsFc6ULQWo2nj01Nw9F0jlGBZV/Yp7UUh0uKgLUoDizR1SOplU/UQY8gL
	QX2ln52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgEK-0000000Cau3-0W1j;
	Wed, 04 Jun 2025 05:00:00 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgC7-0000000CapF-15RX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 04:57:44 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32aa864e0e9so33371471fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 21:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749013061; x=1749617861; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8v5xJFrwaVgiw+YxRPuN7JQSLgnhsE9pwmAc/C6xcjU=;
        b=PVf7cbqeq1z1wiYos/ofOzOD17sESd6/TQ8ZnAvF2biO54eoC9D0xCEtjHnv1naOf6
         Y1GCRZgy87ukMr3Rrtcd2XpTKvvCJ69lcayywGBgW+pofBh79WR5UUHJYUtLOkj3l1ox
         V4jQjef4Bb8Jd/qFkWRIc0qyvbEUsi8pZSopxM4Igdz+woMIVG+YpPH3Nc2A2pyGU9eX
         4LH/lQ6wHLEFk8xdPdpcRODNjGS5w3Oj6+K4frsp1kK2JGqSVDs80OnT6Pd+yc3RHFyp
         Q0RyuzaUGywB6K9oF7yKary7Fv14WGnh3ZTVryCr+0CdrmRosW9PrnfpBANn30xbEdyW
         /jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013061; x=1749617861;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8v5xJFrwaVgiw+YxRPuN7JQSLgnhsE9pwmAc/C6xcjU=;
        b=bb/829j6UQlJG7imEmStsb6viFa1hLWdIvFE/hdo0KAp6/+Bvu+JMuZW+1L+tCIORq
         m7rbHuYsQJ/+GmY5Nok9kWC4XvIgItDGzAkzEOM98RzDfCscMRmPAttjdAXoAXJVlJWp
         bBlLEOtMjeh+yQQtPZS+o09WMAgSCE0GXYOmfNscd7N11UbAMT6tZGIcp9/NtgRXymCU
         HdNOeMXDJaRfQeAkgABwbacD9KUoP1LgFyjBQ1XOwndjItkq7iuNIBvL6UPSpNIBP+yz
         GO7lF3DFrzojpt7NxZXciNTYK1FiE+EzU9R6XW1aD6DHW/ovatgs3WXd+xGnsr/aiq87
         srdw==
X-Gm-Message-State: AOJu0YzTU3q9MmGB8yGBqWIEWViv+GoAKEbMgFFh6FHN+YNxPN8bwhKB
	WTKid0a9xtSAmftqHpL5dKJnMmpiKAtImFa4t1oqjxjlVcGyhTn9A71E1KswDpRmbsdGWPzPfA8
	J41dwJ075oqdu8B9ipifPHnnCEUlsmsI=
X-Gm-Gg: ASbGncsuZnjewsqS03YFgyJbG6TGSaVdPaWrqiw69YiRkn3fG5EcL4dj2B2uXC4Yn5J
	nGYB4nUv9PUqiY8r8evpIofLfNrWKb0ucmLwIZHAysyxcKXMTjVs36OfpEHx4mqSgeak98JeKQG
	JMnDc9p5u0DBOMeUqEf4lxV/gJKa3eHWePaHk=
X-Google-Smtp-Source: AGHT+IFCc6usfArAC56VsjkQpd20/+8UPY+2dsAxUSQR1IdmWnM/fac69vr4SmvVauiBXNtHXrVY1QMfPYslQyec1jI=
X-Received: by 2002:a2e:a547:0:b0:32a:79d4:c900 with SMTP id
 38308e7fff4ca-32ac72676b8mr4754761fa.33.1749013061112; Tue, 03 Jun 2025
 21:57:41 -0700 (PDT)
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:57:30 +0800
X-Gm-Features: AX0GCFuiuI26uYAWnjBt__6hOhO5j4NVk_k2g0fbnGosRIZ_ix3S49ouN7EvK8U
Message-ID: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>
Subject: [BUG] WARNING in do_sve_acc in Linux kernel v6.6
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_215743_303676_31C75C38 
X-CRM114-Status: GOOD (  10.86  )
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

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.6, corresponding to the following
commit in the mainline repository:

Git Commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa (tag: v6.6)

This issue was discovered during the testing of the Android 15 AOSP
kernel, which is based on Linux kernel version 6.6, specifically from
the AOSP kernel branch:

AOSP kernel branch: android15-6.6
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6

Although this kernel branch is used in Android 15 development, its
base is aligned with the upstream Linux v6.6 release. I observed this
issue while conducting stability and fuzzing tests on the Android 15
platform and identified that the root cause lies in the upstream
codebase.


Bug Location:  do_sve_acc+0x17c/0x3f4 arch/arm64/kernel/fpsimd.c:1479

Bug Report: https://hastebin.com/share/calarosado.css

Entire Log: https://hastebin.com/share/efepocaxoh.perl


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka

