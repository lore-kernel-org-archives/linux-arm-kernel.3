Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4EEB26EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc+DVhVKXqCne8j9rprRBbjY7AfNTSR37pnlUL+Q12A=; b=f6N3bZZ5gqjNXUKBphN+EepDyD
	m329Bm4q6UXrB5k8wLRKwM2EAAiFLqGzZbsrNnhoq4wxMvHnIZA6Mhi94itqokThkrD11mktVvDPQ
	hv2uqR1NnnuAesUz81paQ1v6A1H2I9fJ+FIyakYLlYFlflWBXkTwfIgunJbJdoO1hpKlmQJ+Ards6
	os6pyK67OoAgpF42DpcUq7u9QEm6xh97YhojrXfa5oqvGQBWCbMF0dkwXZ3PSYenDmenoihTs2W2F
	ySrRxD9kVWhCIPq8RQ23M9CoV/p43IegHXwc0b9O+HR3edL7Bn34TuuIDHUJXsRbC1ZVeEm8eNT+i
	wvNH+A2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprFh-0000000HKEv-1ATq;
	Tue, 10 Feb 2026 17:10:19 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprFd-0000000HKDL-20uL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:10:15 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2b785801c93so10644686eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 09:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770743412; cv=none;
        d=google.com; s=arc-20240605;
        b=UovLmbWCFecGuMLVDMFzFUjZ8zWXn55Ec4lq/FpW+4vvGwpkeO92XxE6P36ZWPbZT1
         K3CLmLRIS+3O5dC8nBcQEiJ+9L//J1Rslc9KU7B53eQmF9oAaaKg9svAOB7YN9/dUpbi
         fT+h3VkGLo/Jnitq+MC1At8iBeO8ryyBbzhs+lvXWWHHItgd4PEBFF8cAo/GZ+AicSyO
         pKrkIMBNvW+P7nOBJKssjyxZILkcZg0mIcjRklldajCgkB5viU08WiMjjCShdcnXbYAn
         74pbSv542O2V4oMwWiA//ZiBxJMahz+ve6yALxINWZlBkuedoL2fai+KV20DgFqbHHC9
         9rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cc+DVhVKXqCne8j9rprRBbjY7AfNTSR37pnlUL+Q12A=;
        fh=w3pHl6ef/YfjCZ7GuLUABec91MN7r1vS0BIJMKlbxiM=;
        b=Ih2dxr3llY9aDQRN8nQJeAbcXjOYHDrK123LcZqfKvWL4vEy4hJ5GPXEaqysf8sy8L
         GrwIj0vJ7+2Cj87No1bONKCe5KYwv6kqDqzh+3r8iy1tRjB5zVDf07X329BdAFfxlNZv
         XwXB1k0qqrIo8yBkREwIVx+ywtLDC999Wm8CUnaXs1VTAkOVBxhbh8kSCBmdIIRgaYks
         UOGBVuswtoXSl99VOBWjOLM+QHrCpQCmX63yA8g1XP3xp4bwoFlJiT/YM/tbSaKZMfU6
         AjyopqPnaafv1YHVshKUpMrcoAbSv/ziNPqa/eltNQVaEu+JLSBwcm7id57Wjf3ZcRx/
         jdOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770743412; x=1771348212; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc+DVhVKXqCne8j9rprRBbjY7AfNTSR37pnlUL+Q12A=;
        b=jjgYPt9e7xtLEMP4mh/jRCKY1dbxjz6W3INrFV/dU4BqOQoPGuTpNF9O02By+2+0XP
         SrXcLpiH9vMDmawnUUj1KhxhtqV6gs7+nBBoDZLsceeZ/IcDLnCrTvdsIbDbCEGnAmdp
         D1snPF38TVmjNaa9LfYSGVFlLWC8G/Fs2uNzyHKwlsA9zt911csd9RX19IOh+XT5opMZ
         h6ZqqDO0rkZEHkkd945Fek4ChsM23Lbx6DXwDY5B5nInwwI9dqdWAHsBm7H8Db012+6e
         1MRVe2vmwEy3cIz/TTRIbzagA0EGAeEoinzoxMPSkjnNpcVEnUUDuReEzLZ575uvtWqz
         bmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743412; x=1771348212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc+DVhVKXqCne8j9rprRBbjY7AfNTSR37pnlUL+Q12A=;
        b=qXecUNFhsZ5SW7nST+qPCPRx0tjj2Kmapfh/WKoOEyAaKoCapsXLn7NoRArIAokxYn
         vloeVGUs46Yv33pv+8FiNLiNHCJSyySbQZFyJxb3yUSt77V1VBTwuZpo0lQKQiaNWACQ
         JlVQx6CjCr8KZMAS8fyNihch6eO6enfRIt9EKdg/nIvkqwKFIbtwZwsguvClJEP0I80O
         zSCwyW4VPgE3SN3ySvOk5ZelVv1fMwC9c09ATZ12qNxM7M9C/xLRiQJBsDiwMHH6XFkJ
         0WZ1oFiZAxZ6JCNmB3YY57UGQvuCp3qFoxGmmpnIiLDl5beJ25uQ6oSrFu3owOCM2cA2
         1ZDw==
X-Forwarded-Encrypted: i=1; AJvYcCUU60fYbIJWzSK9CymgtPzIR6XwlxOnihO5SDTQjvzLCqGc4TNaUhRSXX6WUtfHCcbhPRh7OhDOFlVIEuz/xc9b@lists.infradead.org
X-Gm-Message-State: AOJu0YxJXdvV44Tj86t7JB8bVMIl9P/3NrxDYj94aa8PgAGp2zgOaz7n
	9ojeoKxlSvq58ySAxW7jIK3le39o3VnnaD1yZK5jEmIC8alQWBGT+hYgvrMMIT6liJDUTzCCa3K
	fiIVo9qUZ2+aVaFpIAhFrbWpdfwAuIlg=
X-Gm-Gg: AZuq6aJ/y1UpRHEkYup7lgWyc0jJb02C4PdtC2wws+AGn6vxa1ycSTwCKjmQeKW4P8m
	ymCvOmebsLDgYQrT15OwrOWjkq56gbF7NE32PIKtgpf9KFZfvC5hUARmNzQWRSNUyiVVRh6TISv
	XWVDepL0pUouUn6Wqw3/6MFyYerQnz7z7XZMiRBNfhhrK89HpNaHwkaEYSsNM526Qa/Q26xS66H
	Etjhtwv3DJhQo3NoJNT1/AAEdTAobTMY1gZJoHzBF5tR51gG9bIo3LHdaum8sdmDeMt1z3qt+8k
	+05xgV5YKA==
X-Received: by 2002:a05:7301:614:b0:2ba:7aed:560d with SMTP id
 5a478bee46e88-2ba7aed60c3mr2133807eec.28.1770743412332; Tue, 10 Feb 2026
 09:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20260210-rearview-hungrily-536a95fc3385@thorsis.com> <aYtVNxZU4tqtj2fo@lizhi-Precision-Tower-5810>
In-Reply-To: <aYtVNxZU4tqtj2fo@lizhi-Precision-Tower-5810>
From: Manikanta guntupalli <manion05gk@gmail.com>
Date: Tue, 10 Feb 2026 22:40:00 +0530
X-Gm-Features: AZwV_QjbKvfyf70mWkfIgb_YjQsj3v2oytyNy4_JkLGqp5ONf6B-sb_fAn62SlE
Message-ID: <CAA0M9UZTVJCSFfB2TQR0Fw_6bgOgVGdDQgkYMnHoGVHHX9cN-w@mail.gmail.com>
Subject: Re: rts-gpios support in fsl_lpuart driver?
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Roelf-Erik Carsjens <rca@thorsis.com>, Josua Mayer <josua@solid-run.com>, sherry.sun@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_091013_519573_AB1839DA 
X-CRM114-Status: GOOD (  33.82  )
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

Hi Alex,

On Tue, 10 Feb 2026, 21:28 Frank Li, <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 10, 2026 at 12:48:05PM +0100, Alexander Dahl wrote:
> > Hello everyone,
>
> Add sherry. look like we have not implemented it at lpuart.
>
> Frank
> >
> > we are currently experimenting with the SolidRun 8XLite SoM featuring
> > an i.MX 8XLite SoC on a custom base board.  Due to how our peripheral
> > hardware is connected we need to use rs485 with uart3, which has no
> > native soc controlled rts line.  On different SoCs you just use
> > 'rts-gpios' in devicetree then, letting the kernel switch this line
> > through gpio.  Alas it does not work on this SoC, the RTS line is not
> > switched at all. :-/
> >
> > According to my analysis the i.MX8 family has different variants using
> > different uarts with different drivers.  For the variants using the
> > imx.c driver, you find dts files using rts-gpios, but for variants
> > using the fsl_lpuart.c driver you find none.
> >
> > The rts-gpios property is evaluated by the serial core in
> > `mctrl_gpio_init()` right?  And the actual switching is also done
> > through that mctrl_gpio interface, right?  As far as I understand the
> > source code, the serial core calls the .set_mctrl function pointer,
> > and then it is up to the driver what to do?  Some (like atmel_serial.c
> > and imx.c) call mctrl_gpio_set() in the function mapped to that
> > pointer, some (like fsl_lpuart.c) don't.  Correct so far?
> >
> > Up to this point I'm somewhat confused this is no generic feature in
> > the core which works for any uart, but there's probably a reason for
> > that?  Maybe interaction with the actual uart registers in some way?
> >
> > If it is like described, I'd say the fsl_lpuart driver currently just
> > does not support this usecase?  Is it possible to implement the
> > necessary things?  Is anybody already working on that?  I looked in my
> > mailing list archive and in the imx downstream kernel, but could not
> > find any hints.
> >
> > Any advice welcome. :-)
> >
> > Greets
> > Alex
> >
>
If we are using gpio as rts line, we need to handle it in the driver sequence.
Please refer to the patch below, that may be helpful.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.19&id=fccc9d9233f918ee50cf2955ae7134a7f3418351

Thanks,
Manikanta.

