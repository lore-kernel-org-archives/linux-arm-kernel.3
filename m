Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352CBFD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=; b=Oro4wiDatDiELETwlJGFi9BWhX
	jcq1b6N1+Gy3csCIK6aWQZewXkomlTM0o2IAO0OebfnSqqGZBYyiatuarpQ9rpGkrd73WVD05qcZb
	9O9rr7OVen7Sn18hZn/3RoFXEpjGOLiERkYbNMOBQ3mNWZHXJ850Q//rR2JuL2E02Z1gEDF++S/Gh
	Q18gs87qziGMXIvpUF29TWia0jh7lB1EifE3qslCdCUzONUUKtJNKFyK88PchiZ5QR+Nnwyo1DLzx
	yR+aIs9ql4hIaNSfmrSdgX/Ox3Y0RO29uFiB3cJ/3JJvOt2aE/3TIRsusfafnoDE5dIatXSnmm3JA
	4kjTQ7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviyu-00000007FsI-0YiG;
	Thu, 26 Feb 2026 21:33:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviyq-00000007Fqr-19C6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:33:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ad21f437eeso10025155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141587; cv=none;
        d=google.com; s=arc-20240605;
        b=DtJ4ijFclzOwKQi6mnRcF/+bNuOpxXSX2ln6qrNtGZy7cdUQ4C/k/3K1noVi+kWWde
         5s4w3mhFuVZZqFqQtg6hxYLQIwhWenwWM1gJrdtwN/xzHHuXmYt/0fGLijx2OUr2+rjp
         6CCfEx3ISxwxqaaSAP/4zv6y1WCglY1sTZNsOipBTb4K9suWfDGU3cBZ7phRCxN5RjJC
         rTAdQADBmBlemFHzTNE2Tr2HuXLL/kZscAvKzMY/uM+oO7BGC1rheAbZC09EdPRXik0y
         boNOb3v7PfRGjW/LMxUlHlR1aZFmHLm1O/cbSlJEoRnFIZl3kHQrhw8LAkxRPKVegTiz
         5h/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        fh=JAw59LfACxbDVqXoIXjlUPTibEAZ3Lgqo7hrtg4pSLU=;
        b=cV8xvmxyGT/K9W5o7oOIuwY9RV7y38XXmhBrcxUv+ZtktpJ/fGCkU0UTeqiUl/eVVq
         A8/afUky8JtOD2ulSHOd0FBxF0nudldRQNV8MOEg0FfcIBTW8Ir/FdAuxRvvSIgnQhfV
         QR8GtdE8pLASSJ6MHnhAX5M+ATuCYroRBeAF+KHnHRe3kpHfC8qjg+cM2Wh3SdIbk63X
         AYCW1csJwwUgH+HtPEOJmZRNwrRBDQD9uLCjYmunyyhDFbvzFbJyHMqQj67CdkAeXs2w
         td+xhVE4DGPIt0L/toY2s3IqGDgp6mMtAWA/Rad6cVW8Tg+KT75k2Dc9MxdK7hAoLwj+
         6TdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141587; x=1772746387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        b=BUF3X99tz3xdqULW+wjUxk6qxMh+UJay9x/emqizt+UnEf9tzHwCKfZhPMDez8cmDV
         42vdUL/bASiGM2R0boKoO3hWGEt3vYmoEdL59ecccNuBikoodtp8sYalIK1DZcnkAKP9
         kwT5h8gAEsHnxVhoB3TtzoP1HH8L8BUBavUYyjH5m5JNylgxC7E5ZFdeKf5VUMVI8xL1
         7ZY0mgxUdzi9xlY5uJCqLWZcmuGduDFoStNjtRVMBMxh5hXGa6yjNHzlIW3lyuik8L58
         qhcVVH12hVgTovrtBx4H9hs4KkDuZQhGELPaa3GitYn8pM3g31XbrD/w1G32boLiG0YZ
         PU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141587; x=1772746387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        b=mKkoiBIGur2fuLcKfRd++2DqhCdcK5WPhJUwdnGLOVbPiOc9Uo85zeYrS2kTuXy871
         9UMuzGy9mCIn9vJYopa6Q3+KNlgxh7EnCAYH/1/C9kMMteKD9BF6VSAIOkBG5/+cuSr2
         BQrkb53fklQj5GggFLXhsUkZqXqJ/kO/HX1Nvh40d7r5vLLRpBuQqPIL7U8KUNJsOQlG
         24Tdtzbdn0S5STizztTXjhxIf7H24IVheXJLYW13abQHQUlAJmyicGUmEfdcpYGOGZE4
         7iHhMghRrnTgmGC4ySIUBWwJrOmSe0ZJxEeEiPv7IDs/fLmb4phwYgNVJk7Qn3bTVflS
         GIpA==
X-Forwarded-Encrypted: i=1; AJvYcCVImHSDxBOPkTBjvgBvafTggisIYTtFxalDR5Mr9yU4S4JtzTF5URRawYrRg3aOHfONlYrgMFhWctonHuxrGk8S@lists.infradead.org
X-Gm-Message-State: AOJu0YzhuDhC0IyEBg2SNhJ1Jgl5qicifIv5qkDzhpxt0yWCUT0YqGW9
	19YBdsYXw2x6WWpG4nj9iR6DIjBFc1ljy+pcbleTt8igSRpH2AmgQfaoqoOSZW8a2cdURwpYQvx
	RNC0Mfa2S+uufQFrhMWW27YkbppP4qmQ=
X-Gm-Gg: ATEYQzwewvNHmNbQIZRWU9eEpBoTCtTwsDaPFrzgMATjTpBnh8dCHU6dcB0Cs7Wk03g
	vM623BZc+XR+TpexszFpQHrgbjh6zWqImQ8TgsmEXd2/LZtO/A4pgVUdVN3+i9SX3Q/jtAapE9k
	glEPTW2izf5/VL+KLcAnX7+fGiahFhUoISr/EK8vlsBOyELWA1p4RekRs/y8SC+ch8REaHV8Fdw
	N1KESko7vR0JMN4jL8p9F+xV+p1o+7U3agJbk6SmgnhyW1y7crC/ba6yyqtiM8i3Or/IrK6Nz++
	SXYRQlYQP4Yo8ybG+opsfhL86I5at2dwELm6OMdNiKAsbEk1ovk=
X-Received: by 2002:a17:903:4b07:b0:2a7:8c6f:939b with SMTP id
 d9443c01a7336-2ae2bce58eemr4336975ad.27.1772141587391; Thu, 26 Feb 2026
 13:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-5-nick@khadas.com>
In-Reply-To: <20260123022258.136448-5-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:32:56 +0100
X-Gm-Features: AaiRm51PyRfiLatDzwSiR5eluGOKGQK9uyO4t3-kfB8JjH98-aVUutjpr9phvHI
Message-ID: <CAFBinCABMXTGZ8A6LPN3N-4TcJH5DrxWcnVAoCzE954KgnEpeA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add POWER key support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_133308_312211_48432840 
X-CRM114-Status: GOOD (  10.97  )
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

On Fri, Jan 23, 2026 at 3:23=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Add the gpio-keys-polled node to support the Power button found on the
> Khadas VIM1S board. The button is connected to the GPIOD_8 pin.
>
> Use polled mode instead of gpio-keys because the GPIO interrupt
> controller support for Meson S4 SoC is not yet available upstream.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

