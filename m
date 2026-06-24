Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D6CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEQluaUQHs9Pq0sF7uhlZdeGFpXYplo4f7PQqgQuW+0=; b=gEy3ImFW/GcZ+ofB0R1UO+LZ4L
	OXhpJcEa55QDUnGiFz2wfVsFfs16HiIgwAgjwBKmEP221cgGngYPXATrn9lSM4u2m0lhFeec5gJHG
	cqWXhlFTuXe1NdUl38ffAnxZo4J2odETMptKnbYNMJFkhvR/vSrxM2Se+fW8yPHGW866EAqgKSaCR
	RBWiXXzOm62pr/9td6Id3/lH71UerQgE4R3cenP8TUwtOxmzUbNzzU2IXo+t0VwDcpp+bUHOY4oz7
	TF/QrbBrNDv6YBCpLd8o3CiJuJNBxblKYVqD3ScG8gW1tXXuzYvlM4stmwyvwfAfm8f6t3YGdWEw7
	67R7dtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWTs-00000008Pp8-2JSL;
	Wed, 24 Jun 2026 22:54:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWTr-00000008Poz-0Frg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5100943974
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E411F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341642;
	bh=tEQluaUQHs9Pq0sF7uhlZdeGFpXYplo4f7PQqgQuW+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NrCTfmBmThM1e1ywz4Uc2cTJ5NMszbpwARgHQLTV5IT7dosoyM8EUug4ZdRHO5vBK
	 GxpbLJbPi0QS9POiBYLdSqQHSwagUc95L5+eHC9YaRepFTw4TqVg4NL5pqMrpN3M0u
	 vMMRf/yOye5AE75iet3ERfBLDcDJalgtwIJfgN4o8bk1oDn03I2rUgTbmUSKCHYK4p
	 rG9IfM+BtV7n1peDjDY8N7kqYHjYJ66BZWJ4/eLPSa6k5AkqjxWmQ6fyTP9rFuq07Q
	 hcS7eC4wLX+nvvotyiW0JjXfzm9BSj6Cn6TCV8QoQC5FEI8TS1yk1e0mOD2XxACIyo
	 Sq3/JtDJpwGbw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so1651339e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqIR+ltOOn9uIppi3ksgRM5GnO4rK5BvUcmKkdww6P3bZNXgX9zI+8FrCdKuuwENRg25tV04xSxOgSO0w1saqUr@lists.infradead.org
X-Gm-Message-State: AOJu0YyDc1WTp0Ph/M2Eozb2/ZaPFzW9JjRVFnv+ULAAAQGaiPs+xInV
	DCIbBAuLd+1xWdUv3FrXCVO9dZJbNgtqmZo6maXvu1kgJCQFUob/DNV1qM7qpEHV3XZDoNu2gQv
	fU/hNJzlA+uuey7RNMzBywjpJFNsfiV8=
X-Received: by 2002:a05:6512:8355:b0:5ad:58c5:5d49 with SMTP id
 2adb3069b0e04-5aea1f2939bmr10018e87.5.1782341640926; Wed, 24 Jun 2026
 15:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-4-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-4-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:53:48 +0200
X-Gmail-Original-Message-ID: <CAD++jL==oidAtZRLkp6GS8zDj_HzVYiKK4ySiXtLGBjevY=vkQ@mail.gmail.com>
X-Gm-Features: AVVi8CeRZhi16rK0R8T_l8f30fSkRD317i9RKDpTB3E_lRbKkea3D6tIJrIzIIU
Message-ID: <CAD++jL==oidAtZRLkp6GS8zDj_HzVYiKK4ySiXtLGBjevY=vkQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] i2c: nomadik: return proper fault codes
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> I2C documentation Documentation/i2c/fault-codes.rst defines fault codes
> for different negative results in I2C transmittion. Previously,
> i2c-nomadik driver didn't implement them properly - it returned
> ETIMEDOUT on most errors and EIO on master arbitration lost.
>
> To comply with the documentation, return the proper fault codes for
> different conditions, namely:
>
> - EAGAIN if arbitration lost
> - EOVERFLOW if message is too long (>2047 bytes)
> - ENXIO if target address is not acknowledged
> - EIO on other errors detected by controller (for example, NACK on data)
> - ETIMEDOUT if driver gets timeout waiting for message completion
>   without any fault condition detected by the controller (for example,
> too long message, or SDA/SCL line stuck on 0).
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

