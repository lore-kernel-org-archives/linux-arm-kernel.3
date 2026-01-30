Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C08AD46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=; b=bQeMLTstBrd7Gwl57mIrEqvsDD
	LuTbAWcYWqVzeak7576TFw1rNuBTWUJqLuDAutyQNVxt51BtcCQcAJAtmcw9F2u2kHCN6Gdn4QS7C
	OihirtnWvTIThohkNtB7vrez5ugZ0Er+XXsbMrcYrn89h4mSbyu59HJnzE0nP2rbMjdjz5Jdq6n64
	Q08NptGuHpqWLd+6li1oqhuLu3JKG+Mx0951cZPPs76RFyDhhn+QYLvUecSn8kmfeC1wKfFkD5Rvl
	L7KGxLeyK90ed8Ui3x00zy4Vv16mgMB+qu3djw9Aiy46fmHdTYLBakP13519a7ye7n981gFNUHeba
	L+iB69Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxwi-000000026TZ-3R6F;
	Fri, 30 Jan 2026 23:30:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxwf-000000026TA-0YCO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 23:30:35 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-790992528f6so25791037b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 15:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769815830; cv=none;
        d=google.com; s=arc-20240605;
        b=RNYbQgZAnP7BjS+XqmtNvHxxsbXdlRvfKz7THFl1ipNejbIfbtnpVEgPVoDBaDTOHD
         25+ZsxmV/A55aLoyNwf2b3YAEveQ3Wm4oeFpBtYK6b4smXsuaZboAeYM2wd+mlMWpe46
         Xfrzh6f349AmrobDvJsiCZ0sRoTr/N+9aXJqzx8RpKYF1MAgh7ypc28hd9XIyQM/4oeW
         YTXUaBw0bSOfVVytWbHD5yHXMXakxTeRiSv0mtPmzL8cauC1X42EindHmKiY21jxHHVK
         J2GIKcNrYZY4L6o8RtCfJJhs5+YB/Cjat9muOt/gpTC9JDjP/6bpOSExSqJaGMFlplGc
         MxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        fh=5SttVnhG0yCeQVjooPUx0kB+SHia0iTspu8XVPRe89I=;
        b=AC6LdnGUxWe8IX7ELsNgJ5MkNpkSUKVikyWBRwS5Zl4i0iSGc3FSFhPMZy+rYfATik
         8jKS8iAoxcdAMFp6L50Erd/+A64eacJiTFiV3Xdi2BTOaa1uWO6iTuXKb+vYByoE00bM
         /KQBBjHfUZ2VhYLbOWzIjMF458yrlJBwqhQRxdxEtC7GFsWo4qPTEGr1ZEMrcITvhMTq
         mFqBxKT4qlgjUdwSwZ2iqWTMIHoNk2VEhtmRA/B2smWIUB8B4tCTDRMOGt7nKCZ5O6I/
         9YvNk2cs1ZcBf8G03qiOC2EKXT8yPfOjd1gP4bvthyt5PvHiqC9zhdk6iixZ+WX/RH/Y
         u2TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769815830; x=1770420630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        b=nVNjXd8g2Cxev4XQKxGNlF/UcVNmcyQkMRdsvrJBz/uQHq+GSHtF7954DM+kTeO/f+
         DQwavC0QSSqPzSduu96vwucPJE0Lq2iBZ3kBwsJncPNbQjJbmPOZX5E6QnyPmKzqkLms
         TkdOAU0NXKzILwfNojiei5XssQTw+/mQNgnA2KppiAjxP2HCx80OeBxkwJefH8AxC47z
         xCel9nfse5Z7EqD4i1geFYA4zI65AwD0nvj6G313CeUveDAUrCeOFmMhmp4zcR3dW0H7
         myNioj9HKd+6rPPoPd4eTye5AyIsNT6Hy0xKO0eEBt/CZsTYXWz3Tsed74PB2PkFQIwh
         26Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769815830; x=1770420630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        b=UHjsyvAlDL+hlT0DVEBamiwrijN4R6vN46YpFtIVR9ahu/uM77wbBQomFxkWSmh0x4
         4p9PIlZqHs+3WfCbU1rKABF4rwfNfIAnzlWTeSk5RmTte/9J4SChbvd0SofGTPAPhER9
         1zF9/A8xw+G4+pPcbJrbxkk9iTA4Zkke3DhL2tmZgL3cCEfUDbyFt9yofJcDVK+S7IMb
         eC9w4Ta4ZMT3a/yH7N5su8tUigAYFuQ4+2C85XN3Osj4ySmVHR8Mv/eXgI71FQTcwglL
         kNnjQ46PKm4HiDYrHxKh6uMmTzC/4z4EcvoM+8N/R1A4q86oDD+rFJ/Eg9UXJ09FfYHH
         tsmg==
X-Forwarded-Encrypted: i=1; AJvYcCW8WY3ekgX4vemiXigJn+RC8rmlxB4ABF+OzfADvcmxHnLlEd+PlLzbAVr2az4Witg0xUf0zm5qlwZfKhf3glZL@lists.infradead.org
X-Gm-Message-State: AOJu0YyyeXQS2dop0EOJuJOjCi1eIGWEcrU2x/3MXa9DYnvd+p7+U6Hf
	ad9cUA10dAjq5MsSZm22j1R9MtP3RnB7jy3myX8hTBDoO9Xibv6bgFJMfcULSrbJ2wxbYuwGOgy
	9CVqoHp21zCmW2makkHRHh9oblhBMLis=
X-Gm-Gg: AZuq6aIjmaoaCtXe1dA+16ixV2upVEZEkVose1Pug6IjKjyMaNsPdR3ZjLpYncZLnCw
	N0h4kaXLqdmQrFawQgs6nHMY2shwnydvj7baIqAHjE01XOcaJs4WpmsJWEXI5OYTEnFTqdsMYlM
	MC26hGg1w3MHCsDjiFYa2guxh4MRO1Ufs9/bC9OwFiug1b8W5b8vpfxbNBe5WFKc8oCqwroi04A
	xmz5tAEFBtmg2y8zyG6xyiQFQzcXlR8GM/RJtQt3MP6vS0zA4JdcTtob6jwUchY6/1hs5lKAUEp
	b+8YF1pKqVZmkmjqlpTE5Ktn4mtm
X-Received: by 2002:a05:690c:38b:b0:794:8cde:3ef0 with SMTP id
 00721157ae682-7949e025a14mr36842957b3.61.1769815830402; Fri, 30 Jan 2026
 15:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com> <aX0L6Kb63My-PsGd@venus>
In-Reply-To: <aX0L6Kb63My-PsGd@venus>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 31 Jan 2026 10:30:19 +1100
X-Gm-Features: AZwV_QgJvifP9ntug-W6Gb1lAE8Nl6_8Gyela5QkjsYmR3oHPckI82eNoFIRm5E
Message-ID: <CANpmGNsCC09A4Dgy0NMye83g1c22x1RbOG0KRpvDryPW7H1oNA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Apple Silicon SMC power driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_153033_209071_8AF169CD 
X-CRM114-Status: GOOD (  33.11  )
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

Hi,
On Sat, Jan 31, 2026 at 6:54=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Mon, Jan 26, 2026 at 10:16:55AM +1100, Michael Reeves via B4 Relay wro=
te:
> > This series adds a power supply driver for the Apple SMC found on
> > Apple Silicon devices. This allows the kernel to report AC status,
> > battery charging status, and power metrics, and modify the charging
> > behaviour.
> >
> > The first patch adds the driver itself, and the second patch wires it
> > up to the MFD core.
> >
> > The driver is based on an original out-of-tree implementation by
> > Hector Martin. It has been refactored by myself for upstream inclusion,
> > including support for newer SMC firmwares, devices without batteries,
> > dynamic property detection and improved state management, among other
> > things.
> >
> > This series is based ontop of the current linux-next at time of writing=
,
> > the exact commit hash is listed below.
> >
> > Tested on: Apple M3 (MacBook Air, J613)
> >
> > Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> > ---
> > Changes in v6:
> > - Add FS header include for emergency_sync()
> > - Link to v5: https://lore.kernel.org/r/20260126-b4-macsmc-power-v5-0-3=
02462673b18@gmail.com
>
> This fails to build as module, since emergency_sync() is not exported:
>
> ERROR: modpost: "emergency_sync" [drivers/power/supply/macsmc-power.ko] u=
ndefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
Thank you for finding this! Sorry, I didn't test building as a module,
only as built-in, I will do this
going forward in future. After some research I've found
hw_protection_trigger which is exported
and will emergency sync and power off (just like this) after a
customisable timeout, which
seems suitable for this usecase. I'll test it now and submit v7 shortly.
>
> Greetings,
>
> -- Sebastian
>
> > Changes in v5:
> > - Readd cover subject that mistakenly got dropped, apologies.
> > - Link to v4: https://lore.kernel.org/r/20260126-b4-macsmc-power-v4-0-a=
a2a682ca650@gmail.com
> >
> > Changes in v4:
> > - Restore Hector Martin as primary author for the series.
> > - Restore downstream Co-developed-by and Signed-off-by tags.
> > - Add Reviewed-by: Sven Peter <sven@kernel.org>.
> > - Simplify MFD patch authorship and remove redundant tags.
> > - Fix probe return value being overwritten by devm_work_autocancel.
> > - Return -ENODEV in probe if neither battery nor AC adapter are found.
> > - Add bounds check for nprops against MACSMC_MAX_BATT_PROPS.
> > - Refactor macsmc_battery_set_charge_behaviour to remove unnecessary re=
sets.
> > - Improve critical_work shutdown flags and remove return.
> > - Add comments explaining SMC key firmware history and flag meanings.
> > - Clarify event ID descriptions and restore BSFC flag comments.
> > - Remove redundant dev_dbg logs for missing battery or AC.
> > - Link to v3: https://lore.kernel.org/r/20260115-b4-macsmc-power-v3-0-c=
236e09874be@gmail.com
> >
> > Changes in v3:
> > - Rebase on top of latest linux-next
> > - Drop charge control threshold properties.
> > - Switch to devm_work_autocancel() for critical work.
> > - Add platform ID table and remove MODULE_ALIAS.
> > - Simplify property array management in struct macsmc_power.
> > - Improve probe error handling and device pointer usage.
> > - Minor style and indentation fixes.
> > - Link to v2: https://lore.kernel.org/r/20260109-b4-macsmc-power-v2-0-9=
3818f1e7d62@gmail.com
> >
> > Changes in v2:
> > - Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
> > - Fixed Makefile alignment by using tabs for the macsmc-power entry.
> > - Upgraded physical battery exhaustion log level to EMERG.
> > - Downgraded software-triggered orderly poweroff log level to CRIT.
> > - Added check for CHIS key to skip AC registration on desktop models.
> > - Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-6=
2954c42a555@gmail.com
> >
> > ---
> > Hector Martin (2):
> >       power: supply: Add macsmc-power driver for Apple Silicon
> >       mfd: macsmc: Wire up Apple SMC power driver
> >
> >  MAINTAINERS                         |   1 +
> >  drivers/mfd/macsmc.c                |   1 +
> >  drivers/power/supply/Kconfig        |  11 +
> >  drivers/power/supply/Makefile       |   1 +
> >  drivers/power/supply/macsmc-power.c | 852 ++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 866 insertions(+)
> > ---
> > base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> > change-id: 20260125-b4-macsmc-power-bb30389e05f1
> >
> > Best regards,
> > --
> > Michael Reeves <michael.reeves077@gmail.com>
> >
> >
Thanks again,
Michael

