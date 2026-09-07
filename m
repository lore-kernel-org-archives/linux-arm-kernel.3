Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0990AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=; b=Ix5DFQR72Tk2ZOavvZfwg+Vt14
	R5qOAS7SW0kOLDKBdHOmXkhPVJjjacwH0xtSl50vFPjYjgRLpqfUCObrBkuwVtaEnLQ8cf7iFOfvY
	xyLMAffcvgsRho9E2G1VcG+gEy3LtO2ik2KH2BLbDs8Q7dNaCRt3GVrmvr2RMgwAcMOxowD2/zA4Z
	qIwPmEWrg3Kgb6zvFkKpvgkN6bN4WTUaMNP5x/AZLZPySOR0YS5H++3cmuB9wj080D3onAWsB8pYq
	seg+LLh0HzGvDnHRIRNtZTYhpW5xyA8OLMgK7nz557DFdEturmm1rt1+gX//xluTG2sqN+wASFQOz
	GYQycz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZIG-00000006v7t-3r9z;
	Mon, 07 Sep 2026 13:21:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZIF-00000006v7M-2PRg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=; b=IWtrfx5nkRUw9KaG8PiuHjdyQ2
	ehZpUadYxTsUN3yst5VRvpG397hA9a8BLDm5uwEWN3c1QWdRQnB/bTKioxi+lOqMJ+8WexHXGYwfb
	IbQ5lFddYI/k4PzUPJbqEyC0XZzvB1PxdSNbMxOujGzPLbEd7eI/138FTryBthYy4NiIG1R76rDC7
	uJ4pkR7Kb1ZZQA7ZQMQW+M3WBW/ONE/GDc4QopsxNB1o+00ub562LraoibOsSpEsOWMd+XOpeSsKK
	q9OzRScTxvZKhP1B2ytUdkQ5l4BR4JPSG+7qSlVexaWLMit1gT32qwSgpnxoXbEPf3vclz0cQCjIK
	MltVEz6g==;
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ZIC-0000000GGks-0IHD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:21:50 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-46f53c8a5fbso1033282fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787305; cv=none;
        d=google.com; s=arc-20260327;
        b=crnMSS4Sk6Ca+3+3UgeWCrJUH0rJpMbd3msrUzEeOMCeOxp0OZJO4HeJytU5/e1pm7
         zAhHSjhiv2lYYoylPWT4UX9WgyAmlEoqL7IoGLNXz4SvghYSPHbhE6I/EkbqjD5bj01O
         cMdF2tQ2Z21x5sbvXBKMzkNJwHMstJ1WJTXpMf1SXv8EBCjEgEHRLX8wBfrzfoDC351h
         HHQnSlxq8x48AH6KcAMx0HL3nY/RtXuS0BIpfFvJHj0EgSqwhSYjvCmHWrcJyFCQ2bM+
         Mt8rGuMoxTABfpf1gKMMVQa2xAegtqAe59HEzi/ld2PY70sEM7fQOBJX22KTtjWXrHpr
         FM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        fh=8sYN2aGzjB7feMYWbZmO0w24wUlKXIJVvH9npsBMc8M=;
        b=gby0zOjxoxPlZK/FYDffZK/2PYNyhcS9C4XBZlJbEN86HbTSWeaMlE1dpcQlEKgtFt
         MU4p6sDpNYYv3LBpyGeAFlxOOLR4yE+8tB2t/a+q/IaiORWbLb7+Bb+wSYhTQBTjhJal
         A132FPGTP5PBAcA5Ni/kPUaCf9lwQfnLoYcDdj2Egu/8ruSAv3K0CwSGrl5sK1VvamcD
         xD3x4vtaDLLzwoo68/V91i/+1gALSSDYuRbLK28JMoEqgCTY0c4TH0xy3ZhyXWE84kuM
         MtNPb7wJAGJWfmga/2bDqqAYY9t+i5NuRgklGoYngjQ1RnYqhfj2w2IfkfpcixImiMO7
         6tzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787305; x=1789392105; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=AeUtLa8qSlUtkKaT6zh8Gi7eTZ92AY2NpDoMrR2Eynm7t4hDhp6iBArs4dxpmptGrX
         i2lQADZaktrU+va6I2STcD0N2bxwXtq+xSzyB8zECAD2MnWqy6UJwKawO4ShbRK/Yk9f
         MTiBII2GpR+fBY+FrNeSBBSSWVICJv9J8KgKmAXwsPq49vNkZPwzwToZ6I4UGZWG+loA
         xoYQzwxJOiLr/J+psBAXELYfRhJ0fBkiipNiB9Yeyra66hrWvUU/hN18fKBCsXllgDoT
         X6zMPh9I07/ajU9XxaLxfIwiTjlsmd196LRFTYMvdQwQvG2JSi+pwqcwXHQx3oKYwCiw
         h5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787305; x=1789392105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=cbzbTkzNMGOWIqwaicOBBvFKOkGgb3keVqyfGnHUcam+iqFznLO/qhXfVT43LXXGP3
         AtNgB/xZDjmNy5kjvk/t8GQCj4P2wyscihBJs38mFWtjPRe6062xWtj9oHeTPL/TPXwv
         RkxoI4O2NYkSw9k0DSW8oOWInV/M7NhzuN38HuzWKBTNu6eqZlVVruGG0F3vNb5FWXV1
         I3S9aoklbYtW/P4Q7M91zyT6wyWtSqSQ+SK3PSGCSYaCoBQFYu2XUQw8Iq2bHm1bShM+
         fxhEtaJmXR0Ogg2KVWFZJcQf4cDl+7rG2X68i0AW+wITCxIwSuaM8XoB90Xhv2ot4AI2
         /bpg==
X-Forwarded-Encrypted: i=1; AKwUvBy45IWOIBzyKVKUg+NZeb+vUlRKRejQXf/Ky14IQ6COigEPhyAXhgmt/lfAR1TjBtbDelnIA8nWm/Pjn+8EnAxC@lists.infradead.org
X-Gm-Message-State: AFuF++mQwEK9telj7cutCUfQ95l281OOcd7L6MBW27C1SbXr07VG/HKi
	VJc3aliUoJ07/W0+sb9SlOpz4kRfCZbTWtkjW6oCd6bdrr/v4ysYX1vj/pRcFXw1Sy0Y45N+/GI
	0uWsTSIsiOCYi+w/KHZ4frJayOc/WMr7YyxqAFOXsqQ==
X-Gm-Gg: AYBFou0JFKwyDlVjCn/Ld5bbXSv2p5KyNJomjRrlyCcHigT3rdq7Omg203yRKn4uNvV
	YnOe/9h0NCVM7wLtjNqVNyrumo5b7V+t9r8BwtbwBLCvHqiFITAXN1yZX02cfmnkR2evwOxskYj
	tTE7ecxKWqqp18+8NcXI/eAxMZWbBBr3XcNGaPHivULjlD/b1RVQYPhKUiVNNrWi9pcISkxiY45
	kugOXjQiDk2iyuVBckY+v4VZLaoRNKWm2jgseUeeqWPpka/0lKkh8heuFrcRhf9J7aYuZZr2wDv
	ui1b31DlC5tyc6COFkcGEHhPUrl+cgv0TxzJvCPoGJvVmA3ekHp/EeB0lSv38Pul+nl1T5JFyAR
	/SlXNlzacnDRy9osD8elUQAYfPL01s9+6rgazd/CL2YbGAv+1+kkf+BH1ATOy
X-Received: by 2002:a05:687c:408e:b0:475:a112:1272 with SMTP id
 586e51a60fabf-475a1124b00mr10850018fac.31.1788787305186; Mon, 07 Sep 2026
 06:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com> <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
In-Reply-To: <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:21:29 +0100
X-Gm-Features: AcwNN1Vp8fXipQwCEjEj0y3FUJRvMgZ_G3DM3P8aQK-4PYEHw2tOLnsqDspjVww
Message-ID: <CAPY8ntCwUjFQcobRYbgo1G-nuO1Sug3i8Krjau1AnD4Nszvc+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142148_486920_EBBAF65E 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Shashank and Marek

On Mon, 7 Sept 2026 at 07:12, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/7/26 7:46 AM, Shashank Maurya wrote:
> > The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> > rail to be enabled before any I2C register access is attempted. Use
> > devm_regulator_get() to obtain the vcc supply and enable it at the
> > start of probe.
> Which power rail is this ?

It'll be the 3.3V rail on the FFC which is used for the MCU, touch
controller, and LCD controller.
The separate 5V supply on the V2 panels is only used for the backlight.

  Dave

