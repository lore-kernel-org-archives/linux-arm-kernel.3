Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06692EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXGKdezBnhqWJT3z28AVcODOOBkRsqGWkgI6uf542F4=; b=pGHf9mH1t+8TPMh/ZDsXEWBh5p
	XttVlpvkn4LVrQhl16GZjBi+Ow+Hdd2F9iptvca0NYla6ba/b5OsAW7Suq2hn1nr9e5aTUOe6slmA
	Ra86GCkbjf/fZc+lbB08AeGJ5D5BIRIQHLYn9P2YOGknAsR0T+T05ROhDED/OzjUms2AYTowdwuBa
	n84xylR2EWlAWpZiiqXnc9IGtNJ7yfl11etBPH98vQMNtW7D/vpFAxQUcGO2aFQLRdrkcRAPZmjPt
	ePRBoGQY8FhOf+FYBwg5swA44bm5zua2APccdeQWzlMld1hFcQ0uRQBGQ9VN8JnxzxzR0qMyb+CFd
	Hddx3Y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbREj-00000007bHI-0a7x;
	Thu, 01 Jan 2026 22:33:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbREg-00000007bGv-2dk3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C020360097
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9E3C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306817;
	bh=UXGKdezBnhqWJT3z28AVcODOOBkRsqGWkgI6uf542F4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K8BtYGxL5UrgFaeruJ2bYpsWno6NCzwubi/XDjFvI+iHYbQvO3xnO0Y7wyhj2cCLP
	 VaKgc3w0IX4QpiURYPgms9c4pkzF8tbO1vcMDyjBiUnBRL8v90Jjd/by7AwRJFPhNC
	 YjgEEgIlWtpX14PD2WYaQmPm6VsfJDvCvmPi/pFWu5LWuaBGcjnvxbyDCSguflNbtq
	 VNEjL1IEIzAE2Wf4+e33ukYHmF/6wWLuvhZScRrjR43mYuQq2dp3Nxhbo/NKUeE0NA
	 MG2XkD6FMCKMY5fQWnAdIQG4AnKuPbokMsi6dCmbx6jOG1HNMPe7ucmUeCczCATjh3
	 4INYWRS+JrrrA==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6468f0d5b1cso6904310d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkk/zghBE7Z5dRPLuTiIl+GHLSc7VexyNVYroE8oA2kFhhUHiAddy96BuRcDd7V6XuOfs05xJHeJF62sAMMB3v@lists.infradead.org
X-Gm-Message-State: AOJu0YwW7fYZrirU6XycZwCklJv7tIrw0y1zcbNmGWsEgmVhuBTe1Jt7
	i5J5ScT7LhJwvjT2fAKBQErP8zzN/9zCD1kReHEqA00McOytmsLBDjA2g2WiArNVQhzptAay09o
	yiX+Png1zxbziQqft8kfewA2H323ZiGY=
X-Google-Smtp-Source: AGHT+IEBLNKuoraxNZDnarHv/8QNfjLvaAF0ad1d03H/wN5pMxpPWQbhNg4O3Lwnms+Q6/yKd55/WFSt9fl6Hz8W+0k=
X-Received: by 2002:a53:bacd:0:b0:63f:b0a3:7400 with SMTP id
 956f58d0204a3-6466a9133c5mr22966072d50.66.1767306816672; Thu, 01 Jan 2026
 14:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:33:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVaeq39ZcNRjjqaXJ-BNGiR8nO3OzG+Fb-Zz7Db_Lfjg@mail.gmail.com>
X-Gm-Features: AQt7F2pNYT3pv7P7qW-qHrpoGWDYRLqHE5UdSIokYzrI55tQFL698Vhw1A_9duc
Message-ID: <CAD++jLnVaeq39ZcNRjjqaXJ-BNGiR8nO3OzG+Fb-Zz7Db_Lfjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Tue, Dec 23, 2025 at 3:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
>
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Despite the complaints that the patch does not fix the problem
there is nothing wrong with the patch.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

